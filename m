Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2008BA7EC
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 09:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F12A110FDF0;
	Fri,  3 May 2024 07:39:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bVIX9ILp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B14112874
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 07:39:07 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-61b2218ab6fso70570957b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 00:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714721947; x=1715326747; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EPEvS0qK5UcK4PLaAgghQY6fqmdqWcs7u1b/vENJXdw=;
 b=bVIX9ILpkN+edtBFhqPX7tKOOVR711XnBmUf9WFg0ZQDH9jhU/0W65tNSCp0VIGP2w
 ekaVuTxGuYENW8hq553cEYGBMKU/BAxxGfW18/uGkRw+T+oSwC8DNAfyfBZgtDWX2tLd
 CqgPXIxInC9NgGw3YnxtFI36+okcVe+Ebp2V1UAgBfbAX/jkVrYTgzwxKMHcEynXKFT8
 6MzEe3EXEXfQOINiAo55e90SLhh+0GZSdvUNQq4zbVPw9Ct37HEjnEZRM4j/aL56LJcf
 dWJtjfZHSJpFkd5tc5Otcq78VjH57NzpzjPiZr69zuz/hdOHMzpeqT+tjx6rMS0vKZgW
 FKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714721947; x=1715326747;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EPEvS0qK5UcK4PLaAgghQY6fqmdqWcs7u1b/vENJXdw=;
 b=MeAEugbAM7zg9nVaDgibBtf6SFUtjH4lDQ70Sqm4RkxI1IANritC3FzwTaDEU/LIg7
 +eieIWUNQCm8YBidx52ueEsmUC+qs5wi6Unhr4Gs9eOFNZpg3501hmKXJI2AGzG6kMMO
 jEFka1PvBp07zD7MIewk1Lam4YETajvCp2yarIgzW/ucL3Y4n9iO0gu5MB1RHKxGZmJ+
 Gazlze2uoF+jezi1ZvcYtexOetJ9qyWUNl3YNl49+vbfHBLqW0pZeP4f+bnRX5oHQiFF
 Mi+rIC+LAhSrBTUXQfj4+PrOA5kH/ciw6R18EzM3XGE/zTmem2DOZCFlErSprrhnYaj+
 wLJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/y1N7pF+dnBcbNakWPkWjokuvURt8vSgQMqoq5AvQ5menJphazvVE55WWRjkD6Z/sVbnEPxDUiZl5ZqTRuB7RYhLpzYaDJZSIGdGAN9w4
X-Gm-Message-State: AOJu0YzWgtiFe51+wNhvRzyh9wwq/TnC3sdq3aaHiI7Gyr8G7FJb5f9p
 8riEsTsgoWliuFIbLfaxcmluNwa1jxthBQAOP6/DgRipnoxHi8hgwNPZMv+tQGvaCV3dJVgy/YI
 6fyyGkIHb5p2c/0R+MD6Ao7sd5/g=
X-Google-Smtp-Source: AGHT+IGliypnZWfDbUdqOvUUIpgR2+a0zXwhwmSmDCfGwN97GTEOSPRd0xLYH1khdRiq550wJGDKrBovrHPT2uWWIAY=
X-Received: by 2002:a0d:dd88:0:b0:61b:33b6:41dd with SMTP id
 g130-20020a0ddd88000000b0061b33b641ddmr1739009ywe.37.1714721946830; Fri, 03
 May 2024 00:39:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240314163511.2372458-1-colin.i.king@gmail.com>
In-Reply-To: <20240314163511.2372458-1-colin.i.king@gmail.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Fri, 3 May 2024 09:38:55 +0200
Message-ID: <CAMeQTsZKk-af5xhnnb=PfHiCNWzBK7VnEc1iBevfYdnyxrXDfA@mail.gmail.com>
Subject: Re: [PATCH][next] drm/gma500: Fix spelling mistake "patter" ->
 "pattern"
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

On Thu, Mar 14, 2024 at 5:35=E2=80=AFPM Colin Ian King <colin.i.king@gmail.=
com> wrote:
>
> There is a spelling mistake in a DRM_DEBUG_KMS message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Applied to drm-misc-next

Thanks
Patrik

> ---
>  drivers/gpu/drm/gma500/cdv_intel_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma5=
00/cdv_intel_dp.c
> index dd1eb7e9877d..cc2ed9b3fd2d 100644
> --- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
> +++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
> @@ -1547,7 +1547,7 @@ cdv_intel_dp_start_link_train(struct gma_encoder *e=
ncoder)
>         }
>
>         if (!clock_recovery) {
> -               DRM_DEBUG_KMS("failure in DP patter 1 training, train set=
 %x\n", intel_dp->train_set[0]);
> +               DRM_DEBUG_KMS("failure in DP pattern 1 training, train se=
t %x\n", intel_dp->train_set[0]);
>         }
>
>         intel_dp->DP =3D DP;
> --
> 2.39.2
>
