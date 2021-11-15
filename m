Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A2D4508D5
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 16:44:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E226E107;
	Mon, 15 Nov 2021 15:43:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E05B66E107;
 Mon, 15 Nov 2021 15:43:56 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id q25so30075953oiw.0;
 Mon, 15 Nov 2021 07:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CF0FJoDWOcoxyaIsOvJ8EB0JBh4HH+xggneHi65Nur8=;
 b=jgm2lSQvJGUhoiTZeMOcb0CVBcH9fDAcd3uLgIT3uxYhEdsUTrGs04sFn9a/PNQdiz
 1920PeXPR/7kBwDJRSbCQDEVwTx/MAB7IfH2/csYcNw48ATtLjVgpuU8lElBXOUFLUVS
 gDlRJi1a0YJS4XfJRNhsHKpnGwTUi/AaGxm7T3tJfJvSVG72/0Z1r16HEKY05gnEhUP+
 gyfPq1vm+R6qDV2iDopSP5Pqup9mqNOfrUXyeYYeX6TSukS443ZC4NhMaZXJ0AplepXK
 1tze14FWiemrJA2Nj6JiDX/E7qQaqI11oxirb6YiF5DeNTxap8C0D1RXjDGPMS1t/IE6
 njww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CF0FJoDWOcoxyaIsOvJ8EB0JBh4HH+xggneHi65Nur8=;
 b=OGTJEOXKS3nE8K2mJJaClyWrrimu8nlBEFJ+bSwEWYBRGHvqnevZtDcOr0f4FS5wqs
 sQR+j4lI4zOsWvO3PrNy2N0w1aaQG92JWx6vHfd6qSTuX/L76u8IrXZ8BeufICR1bsOo
 +J/8MSWx2KNJGzgp5YHe9uCYEB7VRRNseOmvhzRO3TEQHzS4Kz+vUGWHYa7Bqo++y2SQ
 CFRmmlSnwXMYq1+dYK7TXyr7mY73Q36qAtHnZQnBTM+HTwWNvzKVivEBFMDD1BX7PfcE
 yzzt2heIkPR7FduBYHLmpHVzSZ8t42wuFrJJ8pcN1ABOoDy3KVi7+jz0eQi5im3AJnhT
 x8LA==
X-Gm-Message-State: AOAM532o4a0Z+yc+ahasOFWnEJJKQ6YqQlTQRzx75CFIKalZ3s9ybuDd
 TNeIRCTCnz75ENzfTAhI3FdgJquO76Bc2bFT/GI=
X-Google-Smtp-Source: ABdhPJy/qNFNuE1tDibvbioZ0nHH4qB6k0p2uckGZU36eqzCLSt7XAhj4qUFfTUi+4VTuYREyd1ff1/AEzs98s3hWB4=
X-Received: by 2002:aca:3f87:: with SMTP id m129mr45850737oia.5.1636991036198; 
 Mon, 15 Nov 2021 07:43:56 -0800 (PST)
MIME-Version: 1.0
References: <20211114105657.b57pjojiv72iopg5@fastboi.localdomain>
In-Reply-To: <20211114105657.b57pjojiv72iopg5@fastboi.localdomain>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 15 Nov 2021 10:43:44 -0500
Message-ID: <CADnq5_NF++xE6Jj32Wy2ZGALo4pOGt3yTCoj5HU37tKO3Ce=Fg@mail.gmail.com>
Subject: Re: Backlight control broken on UM325 (OLED) on 5.15 (bisected)
To: =?UTF-8?Q?Samuel_=C4=8Cavoj?= <samuel@cavoj.net>
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
Cc: Leo Li <sunpeng.li@amd.com>, Roman Li <Roman.Li@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 15, 2021 at 2:35 AM Samuel =C4=8Cavoj <samuel@cavoj.net> wrote:
>
> Hello,
>
> the backlight control no longer works on my ASUS UM325 (Ryzen 5700U)
> OLED laptop. I have bisected the breakage to commit 7fd13baeb7a3a48.
>
>     commit 7fd13baeb7a3a48cae12c36c52f06bf4e9e7d728 (HEAD, refs/bisect/ba=
d)
>     Author: Alex Deucher <alexander.deucher@amd.com>
>     Date:   Thu Jul 8 16:31:10 2021 -0400
>
>         drm/amdgpu/display: add support for multiple backlights
>
>         On platforms that support multiple backlights, register
>         each one separately.  This lets us manage them independently
>         rather than registering a single backlight and applying the
>         same settings to both.
>
>         v2: fix typo:
>         Reported-by: kernel test robot <lkp@intel.com>
>
>         Reviewed-by: Roman Li <Roman.Li@amd.com>
>         Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>
> I have encountered another user with the same issue on reddit[0].
>
> The node in /sys/class/backlight exists, writing to it just does
> nothing. I would be glad to help debugging the issue. Thank you very
> much.

That patch adds support for systems with multiple backlights.  Do you
have multiple backlight devices now?  If so, does the other one work?

Can you also try this patch?

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index 4811b0faafd9..67163c9d49e6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -854,8 +854,8 @@ int amdgpu_acpi_init(struct amdgpu_device *adev)
                if (amdgpu_device_has_dc_support(adev)) {
 #if defined(CONFIG_DRM_AMD_DC)
                        struct amdgpu_display_manager *dm =3D &adev->dm;
-                       if (dm->backlight_dev[0])
-                               atif->bd =3D dm->backlight_dev[0];
+                       if (dm->backlight_dev[1])
+                               atif->bd =3D dm->backlight_dev[1];
 #endif
                } else {
                        struct drm_encoder *tmp;


Alex

>
> Regards,
> Samuel =C4=8Cavoj
>
> [0]: https://www.reddit.com/r/AMDLaptops/comments/qst0fm/after_updating_t=
o_linux_515_my_brightness/
