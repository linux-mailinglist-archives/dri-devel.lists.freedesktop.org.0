Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C56BB772BDB
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:58:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF1110E302;
	Mon,  7 Aug 2023 16:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C7FA10E302;
 Mon,  7 Aug 2023 16:58:55 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1bfc2b68090so1686442fac.3; 
 Mon, 07 Aug 2023 09:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691427534; x=1692032334;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ht9CVkEuLvEDlECGaNyh72t0oWLZ5rOzw2cYOTaZ4Nw=;
 b=o78vcJW1v6fC2ogvCSQihkzCi0gWyJfKNFNbhNKUdJcCxnEx4t4zoOgv0RwDJ4yrz4
 eRMWq/223OgNAF9hRo947ctUpX/jicwQZG+S2q7Hf41lHwAW097PPUghT8ifN1b+xv54
 89mR3hzVQudK3PR8WOwL5yhuXTjWWqNGtd50EcdwFHcCK//no9RlrCI1LA5CNiPQUxxH
 Usa/JjyYQMmnh2cSR1HPlDXwAKHMwMLiMDKQFA8r5QzBOlt5JjhRUiQCd5RUK8rBud5e
 9QPXy+X9ZnZ1NyC7/K6fMJukcdXsg15Jr+lwA1/CJQW4piayEjaXT15FZinkk+k72dB1
 g3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691427534; x=1692032334;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ht9CVkEuLvEDlECGaNyh72t0oWLZ5rOzw2cYOTaZ4Nw=;
 b=aowYV6vIPlSAl0pvlCa9eayOl/YDZRzfdhzkQyLkxwgWw5FBKBNwNnLsousjMlnORa
 +bqm6t7nTCKaskbCaWRBwL9NI/dlXb/TNpTKcQd+laZNfZNs+3AO5mHMTkCXnuqO9PbK
 lelhkzNeqBNSpnENUaJE4APneLfgYIk1s2MwidDFSaxOcRoblGJBBoqb07Jntd7g3Gxt
 L3gCtFL7BV1Og1ptZB/kd1Ayo+nSdrzBhbIfsqKC7JG2fY6XmCWkY2wB7GSUcQBnFfQY
 B2sKCA7QHDs23O8c0spV2JxmYfrHnHTTl+l6CLozYukgQNpspz9d1mFQB5TfFEDsmqp8
 Of/A==
X-Gm-Message-State: AOJu0YwS21ayaQg87gMwvigcq6Zd1LSyGoHzyomEkyHCt/uUi+YMxjtQ
 q3Ok5fbuFtfLw9J2JSIIW3S8A3rHJb7sWnr3lzs=
X-Google-Smtp-Source: AGHT+IFBxw8o1+DrrO0YSUvC4JPhgxI+w79qoyh04gIbMIj+7djS9xkWma7q9uw8FF93wgoOKVe3Bz/6LapXjbw1pb8=
X-Received: by 2002:a05:6870:911e:b0:1bb:91fa:7a7b with SMTP id
 o30-20020a056870911e00b001bb91fa7a7bmr11987865oae.58.1691427534680; Mon, 07
 Aug 2023 09:58:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230802013939.8855-1-sunran001@208suo.com>
In-Reply-To: <20230802013939.8855-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 12:58:43 -0400
Message-ID: <CADnq5_PovdNJb8cefvyAwZtcS=vXZq=K9V42fzJh-eR_39MAHw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in hardwaremanager.h
To: Ran Sun <sunran001@208suo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Aug 1, 2023 at 9:39=E2=80=AFPM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: open brace '{' following struct go on the same line
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/inc/hardwaremanager.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/inc/hardwaremanager.h b/dri=
vers/gpu/drm/amd/pm/powerplay/inc/hardwaremanager.h
> index 01a7d66864f2..f4f9a104d170 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/inc/hardwaremanager.h
> +++ b/drivers/gpu/drm/amd/pm/powerplay/inc/hardwaremanager.h
> @@ -44,8 +44,7 @@ struct phm_fan_speed_info {
>  };
>
>  /* Automatic Power State Throttling */
> -enum PHM_AutoThrottleSource
> -{
> +enum PHM_AutoThrottleSource {
>      PHM_AutoThrottleSource_Thermal,
>      PHM_AutoThrottleSource_External
>  };
> --
> 2.17.1
>
