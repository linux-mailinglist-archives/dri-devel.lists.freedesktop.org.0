Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CED2342757
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 22:03:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F4A89B78;
	Fri, 19 Mar 2021 21:03:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF3889B78;
 Fri, 19 Mar 2021 21:03:35 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id l4so11823707ejc.10;
 Fri, 19 Mar 2021 14:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zlZF2a+fSW0KxWl4QOMMY/0R4B6yXz0wvGh3Vy6UHSQ=;
 b=sSLmKYfeQSxkwBhq+YSWorc7aDTJrRJ9m/XxPKLHQArAwfiLEZS7beColtXV6V/i62
 XDMYVRIGiPFJ2HD1Qi3duFIVmt99xhcq1Lh2Q3XfjNxpF1u4l0YTdlEmbmZljn1KgjsT
 cb8++61ripEQUZT5Zeg+gqupaw85Gkyu/jhDF7JnjL/Q0qGvL9QqJo+XyF8mOJkCcVbA
 Fgz8jILNT+7tcS3uqAidGJJ+xGa2gSVteaGF7eyZsEo9SPmwvwUAmznoE2ZOlsqrIrFG
 k4EeTLnukHnOcOFmoogtwUf/75YipUqvNJqD/qlcKoCYmCEtKyjRK00RSBkPXZ2R2vxV
 zdbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zlZF2a+fSW0KxWl4QOMMY/0R4B6yXz0wvGh3Vy6UHSQ=;
 b=Ey2fI4kV3/HL4j1cAXj3VhDel1+vIF432NXLucGziweLUW7ip7YS+flfWlpMsHSi7z
 whJf4ivRQ7xhP7eVZlQEvAf7Yps8yXXzpnQPXrvY7yb0upLqMwHaOoozc3dyAuPpKmWA
 52Xf4cPhcO7PsWUtTFpDIqhilInjLQrMXpnLCeOXDy+aeZRJC2CLvdQGa9x8zqhy24NV
 KfnsjM+N6nB/R+4T/QRSBo9aE9EvLuCC8wrepRvlI/SAX6PUU9dgwfyElNRUQYZuy7Rx
 ulU/2i55JnTI6dT7uD0uUkXVgHLPpCWN/azRu/XO3LWPIZZadRRHyNl6n9lOSIgvw3uH
 oDRg==
X-Gm-Message-State: AOAM532g8+/XPeq+5827CyWObpu6C4IQvCcihgdgcmk4hKyqlmrqz+cs
 Ez1ndLjLGGfP4ydim+14mc8USycGjoo=
X-Google-Smtp-Source: ABdhPJwgFhvFHZIzGFwjRQOQWAzzdVYby3izFwHFF1KcHrri5xrjIWOBJw97UDte59dCP204FiXaYg==
X-Received: by 2002:a17:906:801:: with SMTP id
 e1mr6379070ejd.465.1616187814004; 
 Fri, 19 Mar 2021 14:03:34 -0700 (PDT)
Received: from twisty.localdomain
 (dynamic-2a01-0c23-7833-6000-6cbb-50d4-b91e-5b37.c23.pool.telefonica.de.
 [2a01:c23:7833:6000:6cbb:50d4:b91e:5b37])
 by smtp.gmail.com with ESMTPSA id jj15sm4353122ejc.99.2021.03.19.14.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 14:03:33 -0700 (PDT)
From: Mario Kleiner <mario.kleiner.de@gmail.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: 16 bpc fixed point (RGBA16) framebuffer support for core and AMD.
Date: Fri, 19 Mar 2021 22:03:12 +0100
Message-Id: <20210319210317.32369-1-mario.kleiner.de@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
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
Cc: alexander.deucher@amd.com, nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

this patch series adds the fourcc's for 16 bit fixed point unorm
framebuffers to the core, and then an implementation for AMD gpu's
with DisplayCore.

This is intended to allow for pageflipping to, and direct scanout of,
Vulkan swapchain images in the format VK_FORMAT_R16G16B16A16_UNORM.
I have patched AMD's GPUOpen amdvlk OSS driver to enable this format
for swapchains, mapping to DRM_FORMAT_XBGR16161616:
Link: https://github.com/kleinerm/pal/commit/a25d4802074b13a8d5f7edc96ae45469ecbac3c4

My main motivation for this is squeezing every bit of precision
out of the hardware for scientific and medical research applications,
where fp16 in the unorm range is limited to ~11 bpc effective linear
precision in the upper half [0.5;1.0] of the unorm range, although
the hardware could do at least 12 bpc.

It has been successfully tested on AMD RavenRidge (DCN-1), and with
Polaris11 (DCE-11.2). Up to two displays were active on RavenRidge
(DP 2560x1440@144Hz + HDMI 2560x1440@120Hz), the maximum supported
on my hw, both running at 10 bpc DP output depth.

Up to three displays were active on the Polaris (DP 2560x1440@144Hz +
2560x1440@100Hz USB-C DP-altMode-to-HDMI converter + eDP 2880x1800@60Hz
Apple Retina panel), all running at 10 bpc output depth.

No malfunctions, visual artifacts or other oddities were observed
(apart from an adventureous mess of cables and adapters on my desk),
suggesting it works.

I used my automatic photometer measurement procedure to verify the
effective output precision of 10 bpc DP native signal + spatial
dithering in the gpu as enabled by the amdgpu driver. Results show
the expected 12 bpc precision i hoped for -- the current upper limit
for AMD display hw afaik.

So it seems to work in the way i hoped :).

Some open questions wrt. AMD DC, to be addressed in this patch series, or follow up
patches if neccessary:

- For the atomic check for plane scaling, the current patch will
apply the same hw limits as for other rgb fixed point fb's, e.g.,
for 8 bpc rgb8. Is this correct? Or would we need to use the fp16
limits, because this is also a 64 bpp format? Or something new
entirely?

- I haven't added the new fourcc to the DCC tables yet. Should i?

- I had to change an assert for DCE to allow 36bpp linebuffers (patch 4/5).
It looks to me as if that assert was inconsistent with other places
in the driver where COLOR_DEPTH121212 is supported, and looking at
the code, the change seems harmless. At least on DCE-11.2 the change
didn't cause any noticeable (by myself) or measurable (by my equipment)
problems on any of the 3 connected displays.

- Related to that change, while i needed to increase lb pixelsize to 36bpp
to get > 10 bpc effective precision on DCN, i didn't need to do that
on DCE. Also no change of lb pixelsize was needed on either DCN or DCe
to get > 10 bpc precision for fp16 framebuffers, so something seems to
behave differently for floating point 16 vs. fixed point 16. This all
seems to suggest one could leave lb pixelsize at the old 30 bpp value
on at least DCE-11.2 and still get the > 10 bpc precision if one wanted
to avoid the changes of patch 4/5.

Thanks,
-mario


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
