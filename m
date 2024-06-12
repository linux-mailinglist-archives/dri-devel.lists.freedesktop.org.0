Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D486905504
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 16:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C143C10E866;
	Wed, 12 Jun 2024 14:22:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Uc7BHtJ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9551210E86E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 14:21:59 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-4405cf0cb1eso12279571cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 07:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718202117; x=1718806917;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h7Z/F2lTFqxBQr8f3YutkrSgp/gPqby12XW1md45flk=;
 b=Uc7BHtJ5RmLGzlEYQ6xcRN/YDhI1+LRbXYd5VYFR5F2c3IQYcCGfDXXnAv23S0wAZh
 6BjinkJJyFxi37MPbzCyMlc4pAX6Vw4XmkpylR9riir2rAYHH4wzY/DHMdl3xnTvtaLQ
 GrgwBYm6xjC4tDSVE6VeWyNdqwH5GcFxNa4ag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718202117; x=1718806917;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h7Z/F2lTFqxBQr8f3YutkrSgp/gPqby12XW1md45flk=;
 b=CYDO6E8zk744gvK3gyAF42kLi1OHd5nnDsRg443E3oQgoagiI0nyMoDpyQXZSBF6Qx
 iALW2oAYv0yLN783rkpvntQUIbryNBwQBCbCbi3vgZkLccgWKzuMVlnOIrve5MBRde5x
 uRTAvufAlAtGbtvwWT7NcPQ0lJcNgwKwVDRakpgd1OKOFhcfxM7Ya4pgb/ELhjQCtQNt
 lXgXjElAAXo4cCKfUSpdwhWYROS/hYYw7UUsED09X0vL4CCJ6hKkSBdL9t53skSySmJ/
 bTKX9uuVbLy3PrSVNcz5otn3osHrGnJZu9XG/cMHAmrQy+Dl7h7X2dNzJwl0i8o4bjCe
 dtiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjgBLuGUnO352wz0mWtBX6IqIiUhnTpa5EWOrfV1L420oZ+vyPlDEVO9OOnjdqZfgQjPEyAjlll7M9ZQTMuCdRKTa77IFTphpkmF32ZiL/
X-Gm-Message-State: AOJu0YxxwwwNUAXtBHmcKIF/lc3od+hklrOrJeAqpJ3GFYqrj5qBi94p
 c4W0t8Ad2CK19An+b4QMdnkaXJJ67G9iUEN/eednA5pey1mzKOBoPL9wOC7nYz1fsBQwvUKxmto
 =
X-Google-Smtp-Source: AGHT+IH2bzu655p9ymC7nVC0DFyCsZISBgGETbw3Lo3OkoZ8x+0zlyMPeLLd5aotubbMf60RZxBCXg==
X-Received: by 2002:ac8:5a8a:0:b0:441:c86:459c with SMTP id
 d75a77b69052e-4415abd855fmr23882671cf.16.1718202117476; 
 Wed, 12 Jun 2024 07:21:57 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com.
 [209.85.160.169]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4405cfb81fcsm37767481cf.69.2024.06.12.07.21.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 07:21:56 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-4400cc0dad1so461361cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 07:21:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWSfiwaofjIXpYVs94x6LbZur4GPYIPKCr2ihdFQ4F25K8aLjmfd03CcQhshBuNHQBfW2pjiO9YZ89aVdSNn+skjgSizmykWaOQJgeEBXOK
X-Received: by 2002:a05:622a:5a9a:b0:43e:295:f160 with SMTP id
 d75a77b69052e-4415a39f97bmr3125261cf.24.1718202116182; Wed, 12 Jun 2024
 07:21:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240612133550.473279-1-tejasvipin76@gmail.com>
 <20240612133550.473279-3-tejasvipin76@gmail.com>
In-Reply-To: <20240612133550.473279-3-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 12 Jun 2024 07:21:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VTEzSyTHm-YBwneBgpohK8uu460DER-GcsQWu-z9hJsg@mail.gmail.com>
Message-ID: <CAD=FV=VTEzSyTHm-YBwneBgpohK8uu460DER-GcsQWu-z9hJsg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/mipi-dsi: fix handling of ctx in mipi_dsi_msleep
To: Tejas Vipin <tejasvipin76@gmail.com>, neil.armstrong@linaro.org
Cc: quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 linus.walleij@linaro.org, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Jun 12, 2024 at 6:37=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.com=
> wrote:
>
> ctx would be better off treated as a pointer to account for most of its
> usage so far, and brackets should be added to account for operator
> precedence for correct evaluation.
>
> Fixes: f79d6d28d8fe7 ("drm/mipi-dsi: wrap more functions for streamline h=
andling")
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>  include/drm/drm_mipi_dsi.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Yeah. Looking closer at the history, it looks like it was always
intended to be a pointer since the first users all used it as a
pointer.

Suggested-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>

I've also compile-tested all the panels currently using mipi_dsi_msleep().

Neil: Given that this is a correctness thing, I'd rather see this land
sooner rather than later. If you agree, maybe you can land these two
patches whenever you're comfortable with them?


-Doug
