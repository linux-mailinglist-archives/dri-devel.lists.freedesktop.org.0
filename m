Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C12900530
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 15:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B8410EC4A;
	Fri,  7 Jun 2024 13:39:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kmnzl1l2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0577310EC4A;
 Fri,  7 Jun 2024 13:39:47 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-1f6c7cded01so11168985ad.0; 
 Fri, 07 Jun 2024 06:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717767587; x=1718372387; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lGjvaDk+KW6xnTzTcwYndsM82Fj+VUn371ofht0gpOk=;
 b=kmnzl1l2TsoADLDKGsS58AuUIwO+rgrkarCgsiyK8rLAmvBIsNGZVGq7+jtRqd1KPm
 +WlpvZccZ+iuX1OTNn8Zb4CSwhyX/yzA8tRL4VGOb6OV95K2ZsOgXdv1IJsrx0K0r7HJ
 lL2PNyEO79PNHm+IBSXtWb8JMGBrr0FHLErgCwLpYIdeYXj6B1b6Lp5jWixRIIn0TZ/1
 KlkMWqI+z+waSx28CeQtG85nPmsr4pjoq+0zvqrZUKIt+ZejSXscIL5D/XOcai3L/VEX
 zDnHTgY2uz+DCzygsMyIlEV0sORtoLyhjvp3eK4wXI84aKWLJ4vEyerHNldbLzl5mSqQ
 q3wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717767587; x=1718372387;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lGjvaDk+KW6xnTzTcwYndsM82Fj+VUn371ofht0gpOk=;
 b=WEJallcdGiB+eSVYbQwz+4JAGW0sYsPtfx43eNDPH1mkfIrna82q+/l3oAyXrqCs6C
 +d7ZIYzBkpCKOkJ9r/XO42Lwu9MXk1RCFKd6Qyta6V0xUJ51GMHH3J813JVUjvYl2GBp
 2A4K6kqCL+/DWpRY7nYSi9hO3Q8rBOQOWQ5VkYBFps/cdy5gn/UNWWFTJQ9AbAVI+Jjk
 XSe/ZpHCDkuzbMVSUQEsmPTMydhb8FKS9hF49MmjsNs6m7803r1g1Btjn3LRHsgA0bwJ
 mrLwWlY+mrp5lUF90TIfWMjWIC9QULTyEeeq09r+IdcHzsNyMqT36RSM5linEFzcqZsV
 1TeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKBIIt8lCxmurvgNfRzUZsmqzUjTii8+hey/LFUejm3ej6EQr4De0JDjrlvw+e3NVGG6N1hHFjQxSFZoiH8mvsY9rDrv0lRGkw+T+SRnBU3wfcrKH9q/84kEKAwU9adCcjLiQ2bk2VUDfuIEyySg==
X-Gm-Message-State: AOJu0YxrRBSjH8T1SgIigVq2FCESTrNdrDKe3nezfExDN6YAuUucWSQ0
 xE+4/vVJO5um4KM6fZ4n1/whsVuAWze+FcMbsXFDLhCwo+8v+gC1k2f8rtI+7JZUTW/fKH+Q6AM
 kIOqVOV+zEZxrcNi4qP/5qrOdYAc=
X-Google-Smtp-Source: AGHT+IHFeYv7N9rqcrTihxXkCB6iPbA0K4xnxCMnAQk6mBUZGTI1GpzTXBWWItwFP1ZhHdtfaoxyrtoLT7oPMuSTUgc=
X-Received: by 2002:a17:902:d4c1:b0:1f6:7212:760a with SMTP id
 d9443c01a7336-1f6d021805amr29662965ad.0.1717767587019; Fri, 07 Jun 2024
 06:39:47 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsNptxsQO=5=qi-JYiFX=rX8Ok5inK80Gn0qrUFWbtBGng@mail.gmail.com>
In-Reply-To: <CABXGCsNptxsQO=5=qi-JYiFX=rX8Ok5inK80Gn0qrUFWbtBGng@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 7 Jun 2024 09:39:35 -0400
Message-ID: <CADnq5_PDxJ8O1JUQ9RBYRFB9G1WZJos05ZAM4jUKuPBwPxjNkA@mail.gmail.com>
Subject: Re: 6.10/bisected/regression - commits bc87d666c05 and 6d4279cb99ac
 cause appearing green flashing bar on top of screen on Radeon 6900XT and 120Hz
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>, Rodrigo.Siqueira@amd.com, 
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
 Linux regressions mailing list <regressions@lists.linux.dev>
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

On Sun, May 26, 2024 at 10:12=E2=80=AFAM Mikhail Gavrilov
<mikhail.v.gavrilov@gmail.com> wrote:
>
> Hi,
> Day before yesterday I replaced 7900XTX to 6900XT for got clear in
> which kernel first time appeared warning message "DMA-API: amdgpu
> 0000:0f:00.0: cacheline tracking EEXIST, overlapping mappings aren't
> supported".
> The kernel 6.3 and older won't boot on a computer with Radeon 7900XTX.
> When I booted the system with 6900XT I saw a green flashing bar on top
> of the screen when I typed commands in the gnome terminal which was
> maximized on full screen.
> Demonstration: https://youtu.be/tTvwQ_5pRkk
> For reproduction you need Radeon 6900XT GPU connected to 120Hz OLED TV by=
 HDMI.
>
> I bisected the issue and the first commit which I found was 6d4279cb99ac.
> commit 6d4279cb99ac4f51d10409501d29969f687ac8dc (HEAD)
> Author: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Date:   Tue Mar 26 10:42:05 2024 -0600
>
>     drm/amd/display: Drop legacy code
>
>     This commit removes code that are not used by display anymore.
>
>     Acked-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>     Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>
>  drivers/gpu/drm/amd/display/dc/inc/hw/stream_encoder.h         |  4 ----
>  drivers/gpu/drm/amd/display/dc/inc/resource.h                  |  7 ----=
---
>  drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c         | 10 ----=
------
>  drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.c | 33
> +--------------------------------
>  4 files changed, 1 insertion(+), 53 deletions(-)
>
> Every time after bisecting I usually make sure that I found the right
> commit and build the kernel with revert of the bad commit.
> But this time I again observed an issue after running a kernel builded
> without commit 6d4279cb99ac.
> And I decided to find a second bad commit.
> The second bad commit has been bc87d666c05.
> commit bc87d666c05a13e6d4ae1ddce41fc43d2567b9a2 (HEAD)
> Author: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Date:   Tue Mar 26 11:55:19 2024 -0600
>
>     drm/amd/display: Add fallback configuration for set DRR in DCN10
>
>     Set OTG/OPTC parameters to 0 if something goes wrong on DCN10.
>
>     Acked-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>     Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>
>  drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c | 15 ++++++++++++=
---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> After reverting both these commits on top of 54f71b0369c9 the issue is go=
ne.
>
> I also attach the build config.
>
> My hardware specs: https://linux-hardware.org/?probe=3Df25a873c5e
>
> Rodrigo or anyone else from the AMD team can you look please.

@Siqueira, Rodrigo can you take a look?  The two patches change the
programming of OTG_V_TOTAL_CONTROL.  The first patch removes this
code:

diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c
b/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c
index 58bdbd859bf9..d6f095b4555d 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c
@@ -462,16 +462,6 @@ void optc2_setup_manual_trigger(struct
timing_generator *optc)
 {
        struct optc *optc1 =3D DCN10TG_FROM_TG(optc);

-       /* Set the min/max selectors unconditionally so that
-        * DMCUB fw may change OTG timings when necessary
-        * TODO: Remove the w/a after fixing the issue in DMCUB firmware
-        */
-       REG_UPDATE_4(OTG_V_TOTAL_CONTROL,
-                                OTG_V_TOTAL_MIN_SEL, 1,
-                                OTG_V_TOTAL_MAX_SEL, 1,
-                                OTG_FORCE_LOCK_ON_EVENT, 0,
-                                OTG_SET_V_TOTAL_MIN_MASK, (1 << 1));
/* TRIGA */
-
        REG_SET_8(OTG_TRIGA_CNTL, 0,
                        OTG_TRIGA_SOURCE_SELECT, 21,
                        OTG_TRIGA_SOURCE_PIPE_SELECT, optc->inst,

and the second patch adds this hunk:

diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c
b/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c
index f109a101d84f..5574bc628053 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c
@@ -945,10 +945,19 @@ void optc1_set_drr(
                                OTG_FORCE_LOCK_ON_EVENT, 0,
                                OTG_SET_V_TOTAL_MIN_MASK_EN, 0,
                                OTG_SET_V_TOTAL_MIN_MASK, 0);
-       }

-       // Setup manual flow control for EOF via TRIG_A
-       optc->funcs->setup_manual_trigger(optc);
+               // Setup manual flow control for EOF via TRIG_A
+               optc->funcs->setup_manual_trigger(optc);
+
+       } else {
+               REG_UPDATE_4(OTG_V_TOTAL_CONTROL,
+                               OTG_SET_V_TOTAL_MIN_MASK, 0,
+                               OTG_V_TOTAL_MIN_SEL, 0,
+                               OTG_V_TOTAL_MAX_SEL, 0,
+                               OTG_FORCE_LOCK_ON_EVENT, 0);
+
+               optc->funcs->set_vtotal_min_max(optc, 0, 0);
+       }
 }


Looks like both the if and the else side paths end up programming
OTG_V_TOTAL_CONTROL differently after the change.  Perhaps
OTG_SET_V_TOTAL_MIN_MASK needs to be set differently depending on the
DMCUB firmware version? @Mikhail Gavrilov does this patch fix it?

diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c
b/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c
index 336488c0574e..933c7a342936 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c
@@ -944,7 +944,7 @@ void optc1_set_drr(
                                OTG_V_TOTAL_MAX_SEL, 1,
                                OTG_FORCE_LOCK_ON_EVENT, 0,
                                OTG_SET_V_TOTAL_MIN_MASK_EN, 0,
-                               OTG_SET_V_TOTAL_MIN_MASK, 0);
+                               OTG_SET_V_TOTAL_MIN_MASK, (1 << 1)); /* TRI=
GA */

                // Setup manual flow control for EOF via TRIG_A
                optc->funcs->setup_manual_trigger(optc);


Thanks,

Alex

>
> --
> Best Regards,
> Mike Gavrilov.
