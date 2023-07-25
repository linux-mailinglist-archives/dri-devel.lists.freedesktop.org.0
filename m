Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EF5761D38
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 17:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEE3F10E140;
	Tue, 25 Jul 2023 15:22:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8356910E140;
 Tue, 25 Jul 2023 15:22:32 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-3a5ac84718dso2223432b6e.0; 
 Tue, 25 Jul 2023 08:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690298551; x=1690903351;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jBTTS5RF7AIv64GVj2b4Qc7prXLaZW3IGjOwlTzQwuo=;
 b=lC8/Fq/kL5m6P1170AK5xtk0Zo8tWN7L+16SdgkjbX0m1p1bFbPzSfDQ85nvq4uhow
 bmVViJgCbKdtExT7yseMBW5Dgkk95aSwnm+v2p0z68A6adWIBwMIDRsV9k1hZ/dh59qT
 BF0ghVJj4PZvV7khI+sdW0LuDoXyU4wk1BiVMCuXHVgKil0C1UT/DgkM0xfscM8tTeDG
 80FxLV7yGk2PEZb14frViyEbbRlulFObqFm58sHDOU0q2PD9nB6fUMSVGXUhzQtywVTL
 0xmYZEwS/yVFNlB6tK0+h/hsOBWO8msdpDrRTVeAf/dnWPHREivrqCvqAsSqYpmyma+f
 geOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690298551; x=1690903351;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jBTTS5RF7AIv64GVj2b4Qc7prXLaZW3IGjOwlTzQwuo=;
 b=hvqVBd/r5xkHZsJIqfQ9iBAgfGSb6DAGsJCNgSP7Rzh+oHzV0JO6xj2A7mw8IjIGbY
 khaoAw5Fu43hWq3s/Jav82pQaRvp0ciQcD5LtAK+bkwGsENDFhqpOZ6jCxUtLiD6zq7X
 Trjr/jxoyh+BKy3NBvcJ+sOo0MFhioFaoVkzU/WGMA0gfdDYqYQtgagRt6ynuVNwMxJL
 JiybNAXXNRYBBsdONsxhdxzTGjmJOM1XPlTEg2iXY6dDnaYJGzFTWdw0GqH2fDd5n8Ca
 86iE+1cJrz0zRiMLOqzrTHW8ejCZfjTZIBsCwEUgz13IC4OjG7kqSQpT7IN6/YnViXXt
 kSug==
X-Gm-Message-State: ABy/qLaK8sw+HjAGZZbhvDGP2VbOQfYNNU+N0Vi+4u7FwxFUTqHdqfhu
 7p72yoAKakwsqSVFU4HRHvdE+vS36NG7BhpIpvs=
X-Google-Smtp-Source: APBJJlFcdxcbcpR8u6vg6ikZOSDY7y4ippoWDRSFzG6NIvfv+Vvez0j9T9fTaD+gzpr4jjBxct3l5nG4o9AQ9xFFzp0=
X-Received: by 2002:a05:6808:182a:b0:3a5:a78b:f773 with SMTP id
 bh42-20020a056808182a00b003a5a78bf773mr12122118oib.6.1690298551704; Tue, 25
 Jul 2023 08:22:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230725080906.2028-1-zhanglibing@cdjrlc.com>
 <b5933d7391b8e526894316b7e17b9637@208suo.com>
In-Reply-To: <b5933d7391b8e526894316b7e17b9637@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 25 Jul 2023 11:22:20 -0400
Message-ID: <CADnq5_NtPtoGDhdx8CwwPUdqrk-goJU4V-FOTPn5_pNv-hbjDg@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: ERROR: "foo * bar" should be "foo *bar"
To: wuyonggang001@208suo.com
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

I applied the same patch from Ran yesterday.

Thanks!

Alex

On Tue, Jul 25, 2023 at 9:23=E2=80=AFAM <wuyonggang001@208suo.com> wrote:
>
> Fix the error(s):
> ERROR: "foo * bar" should be "foo *bar"
>
> Signed-off-by: Yonggang Wu <wuyonggang001@208suo.com>
> ---
>   drivers/gpu/drm/radeon/atom.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/atom.c
> b/drivers/gpu/drm/radeon/atom.c
> index 11a1940bb26d..93acb0e42bd6 100644
> --- a/drivers/gpu/drm/radeon/atom.c
> +++ b/drivers/gpu/drm/radeon/atom.c
> @@ -68,8 +68,8 @@ typedef struct {
>   } atom_exec_context;
>
>   int atom_debug =3D 0;
> -static int atom_execute_table_locked(struct atom_context *ctx, int
> index, uint32_t * params);
> -int atom_execute_table(struct atom_context *ctx, int index, uint32_t *
> params);
> +static int atom_execute_table_locked(struct atom_context *ctx, int
> index, uint32_t *params);
> +int atom_execute_table(struct atom_context *ctx, int index, uint32_t
> *params);
>
>   static uint32_t atom_arg_mask[8] =3D {
>         0xFFFFFFFF, 0x0000FFFF, 0x00FFFF00, 0xFFFF0000,
