Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C833D7E4022
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 14:38:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A3510E04C;
	Tue,  7 Nov 2023 13:38:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 683AB10E04C;
 Tue,  7 Nov 2023 13:38:16 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-586beb5e6a7so3180618eaf.1; 
 Tue, 07 Nov 2023 05:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699364295; x=1699969095; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u/JzXXKi9EWZmEKt0kuoOZHJPpAwEzdC1EaLt8yqMl0=;
 b=ASqNRG66OEXUyFRSUA6Qn4rrzbkjk1Duqc7Je6Sx78IJxWkXxsrj6grtwgDR99coR+
 TpuxlkRNZD3/RcBdtBs2BLzVP7sh1+7EfXItFWWmuRcmeAknVOlXuT6RW3Vkjsx49dCY
 rn6rTHv2Q8HQ7cbePDLH6HJA1C/APn55d+RYul0cxyAbmrP+xoKqXU0r7BrU/6KVqfgE
 OiH50H6XrA60PeaZ1yozaIzBnvlMVIiN9mNZdjXyxLebXZs5aiQewTuGWPikgaPjgcTD
 R4PLkck7y9nscgKxx0lWCZp9enPVHfwShAVFvBqICe6l8Mm0dGairfudyaUudlRcujNB
 o4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699364295; x=1699969095;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u/JzXXKi9EWZmEKt0kuoOZHJPpAwEzdC1EaLt8yqMl0=;
 b=leZLqJkYQndFSMK7ZELMsv4hJ6lq9ZdjX7YRr5U/+IJkQ3hJksxdGI16es7W1qPZ/6
 RLF37DZv1syZ7p2qYsSS74dJfkMJYLsn/p7bOP2gacKroKsZL9/KXAPzq0wcBZbWzJJp
 QZvsxbjVUQcMFJOuHLeEH1xDmREpP03yG6UDLP6TpF74qqMDc0HX9uQjEyqLhOyvuL31
 iXXKEC1Kc/0uP6dlt8Zc4LRbAe9RkKWT2IdNMw2MrIoA6GlgVfRRR/Xl+vBatzaD9Keu
 uOTWR/QDuNWAxWAdkFUQR13ZRZi6zwRZ3P1bVsYxFy7QrKcQYUMVoToaed45aE+DHgyA
 U23A==
X-Gm-Message-State: AOJu0YwLgR43/9F/jEY3ox4pdZQ5dECmbL8Ar7QN5YEQ2D3P7VO+5svL
 xicvtp4RqDDdqGnj7yhuN56FAWPkq/Y7gV2wt9q6gXk1
X-Google-Smtp-Source: AGHT+IHNBTVDKA0fR0kDClpaT8pql9m1AEsUIvWGKaOkV7HGpxLEMW93vsgGqKhwvt+ff8/n4Uq7GyTt1WdlZHsmbo0=
X-Received: by 2002:a05:6871:af8c:b0:1e9:b9e6:98e1 with SMTP id
 zx12-20020a056871af8c00b001e9b9e698e1mr2251960oab.1.1699364295339; Tue, 07
 Nov 2023 05:38:15 -0800 (PST)
MIME-Version: 1.0
References: <20231107121837.3759358-1-sashal@kernel.org>
 <20231107121837.3759358-21-sashal@kernel.org>
In-Reply-To: <20231107121837.3759358-21-sashal@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 7 Nov 2023 08:38:03 -0500
Message-ID: <CADnq5_PzxAMvY7FKDuBT-7RwGhXusoKioF8zXwKR9oWvdp9foQ@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.6 21/40] drm/radeon: Fix UBSAN
 array-index-out-of-bounds for Radeon HD 5430
To: Sasha Levin <sashal@kernel.org>
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
Cc: Felix Held <felix.held@amd.com>, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 stable@vger.kernel.org, christian.koenig@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 7, 2023 at 7:20=E2=80=AFAM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> From: Mario Limonciello <mario.limonciello@amd.com>
>
> [ Upstream commit c63079c61177ba1b17fa05c6875699a36924fe39 ]
>
> For pptable structs that use flexible array sizes, use flexible arrays.
>
> Suggested-by: Felix Held <felix.held@amd.com>
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2894
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

FWIW, I don't think any of these UBSAN variable sized array changes
are really stable material.  They are not really fixing an actual
issue just making UBSAN happy.

Alex


> ---
>  drivers/gpu/drm/radeon/pptable.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/pptable.h b/drivers/gpu/drm/radeon/pp=
table.h
> index 4c2eec49dadc9..94947229888ba 100644
> --- a/drivers/gpu/drm/radeon/pptable.h
> +++ b/drivers/gpu/drm/radeon/pptable.h
> @@ -74,7 +74,7 @@ typedef struct _ATOM_PPLIB_THERMALCONTROLLER
>  typedef struct _ATOM_PPLIB_STATE
>  {
>      UCHAR ucNonClockStateIndex;
> -    UCHAR ucClockStateIndices[1]; // variable-sized
> +    UCHAR ucClockStateIndices[]; // variable-sized
>  } ATOM_PPLIB_STATE;
>
>
> --
> 2.42.0
>
