Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D697FB6A6
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 11:04:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D72D10E476;
	Tue, 28 Nov 2023 10:04:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B4310E476;
 Tue, 28 Nov 2023 10:04:43 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-5cc66213a34so53236567b3.1; 
 Tue, 28 Nov 2023 02:04:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701165882; x=1701770682;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sVYbGk8nOx+pxSV84i/1qbnW/GNJF1Gu7ctCWCcQoto=;
 b=pXkmJQ2l75C2mk5IlU3UzqAtbq+tO/LjY1yPkKE5OLuBkk7N0QUHibbigU9p12A8Yp
 e31D7UfBilS/GAud1jbnqdRS2NN9QELB+IlQnjoVBb2OLjlBvkugqOfqqcjYQ83/snSb
 8066+gMwJN49Y/Vlb1J63JlPkMhLlyDTNR5P4nKvGx6fv0kHY0SE8A/RwWqASoawyCtn
 UDswf7jp1T0KnSVdJuW5/qqJgIELlt9o2YJfoU78FwERbibGoIq5fuMS/1N99Rvh0ma5
 2WJOiyPQbd+YrHY1AgG3KWE7x0Y0+kJRdemy8uurklpHrO12GvXibe/JUpcy8aKLfDmS
 xL1A==
X-Gm-Message-State: AOJu0YyXK2alkdz3Pr0J4yCIUagt54jdTPrq60XXkcg/pppP2InEwpVO
 S25GBDFzBUOsPoDX26lLQMi8wPZyrzqc7A==
X-Google-Smtp-Source: AGHT+IGJJPYQjZoJsbrUif/mHqN0ICLSyAPZX/tlMDhLOPa/luG1ulkjHEPMe/sWXVewMmKLKALFPw==
X-Received: by 2002:a81:8686:0:b0:5ce:f683:cd3 with SMTP id
 w128-20020a818686000000b005cef6830cd3mr10244183ywf.13.1701165882246; 
 Tue, 28 Nov 2023 02:04:42 -0800 (PST)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com.
 [209.85.128.177]) by smtp.gmail.com with ESMTPSA id
 x126-20020a814a84000000b005ca7a00a9b0sm3797009ywa.64.2023.11.28.02.04.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 02:04:41 -0800 (PST)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-5cece20f006so31746427b3.3; 
 Tue, 28 Nov 2023 02:04:41 -0800 (PST)
X-Received: by 2002:a81:9282:0:b0:5a7:afcc:80fe with SMTP id
 j124-20020a819282000000b005a7afcc80femr9012513ywg.3.1701165881168; Tue, 28
 Nov 2023 02:04:41 -0800 (PST)
MIME-Version: 1.0
References: <20231122112930.5e7c7bcd@canb.auug.org.au>
In-Reply-To: <20231122112930.5e7c7bcd@canb.auug.org.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Nov 2023 11:04:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW_6rU3uVuBBKh2nMWPC0tPOpxhf9xhD2L6T5frsF=q3w@mail.gmail.com>
Message-ID: <CAMuHMdW_6rU3uVuBBKh2nMWPC0tPOpxhf9xhD2L6T5frsF=q3w@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drm tree with the drm-misc-fixes
 tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen,

On Wed, Nov 22, 2023 at 1:29=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
> Today's linux-next merge of the drm tree got a conflict in:
>
>   drivers/accel/ivpu/ivpu_hw_37xx.c
>
> between commit:
>
>   3f7c0634926d ("accel/ivpu/37xx: Fix hangs related to MMIO reset")
>
> from the drm-misc-fixes tree and commits:
>
>   3de6d9597892 ("accel/ivpu: Pass D0i3 residency time to the VPU firmware=
")
>   cc19fedab8bd ("accel/ivpu/37xx: Print warning when VPUIP is not idle du=
ring power down")
>
> from the drm tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks for your resolution!

> --- a/drivers/accel/ivpu/ivpu_hw_37xx.c
> +++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
> @@@ -720,14 -731,19 +733,14 @@@ static int ivpu_hw_37xx_power_down(stru
>   {
>         int ret =3D 0;
>
> -       if (!ivpu_hw_37xx_is_idle(vdev))
> -               ivpu_warn(vdev, "VPU not idle during power down\n");
> +       ivpu_hw_37xx_save_d0i3_entry_timestamp(vdev);
>
> -       if (ivpu_hw_37xx_reset(vdev)) {
> -               ivpu_err(vdev, "Failed to reset VPU\n");
> -               ret =3D -EIO;
> +       if (!ivpu_hw_37xx_is_idle(vdev)) {
> +               ivpu_warn(vdev, "VPU not idle during power down\n");
> +               if (ivpu_hw_37xx_reset(vdev))
> +                       ivpu_warn(vdev, "Failed to reset the VPU\n");
>         }
>
>  -      if (ivpu_pll_disable(vdev)) {
>  -              ivpu_err(vdev, "Failed to disable PLL\n");
>  -              ret =3D -EIO;
>  -      }
>  -
>         if (ivpu_hw_37xx_d0i3_enable(vdev)) {
>                 ivpu_err(vdev, "Failed to enter D0I3\n");
>                 ret =3D -EIO;

I've just run into the same conflict, and I think you lost the split
into two if-statements in the last hunk of commit 3f7c0634926d
("accel/ivpu/37xx: Fix hangs related to MMIO reset")?

My resolution is:

--- a/drivers/accel/ivpu/ivpu_hw_37xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
@@@ -720,11 -731,16 +733,13 @@@ static int ivpu_hw_37xx_power_down(stru
  {
        int ret =3D 0;

+       ivpu_hw_37xx_save_d0i3_entry_timestamp(vdev);
+
 -      if (!ivpu_hw_37xx_is_idle(vdev)) {
 +      if (!ivpu_hw_37xx_is_idle(vdev))
                ivpu_warn(vdev, "VPU not idle during power down\n");
 -              if (ivpu_hw_37xx_reset(vdev))
 -                      ivpu_warn(vdev, "Failed to reset the VPU\n");
 -      }

 -      if (ivpu_pll_disable(vdev)) {
 -              ivpu_err(vdev, "Failed to disable PLL\n");
 +      if (ivpu_hw_37xx_reset(vdev)) {
 +              ivpu_err(vdev, "Failed to reset VPU\n");
                ret =3D -EIO;
        }

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
