Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D38552E6A15
	for <lists+dri-devel@lfdr.de>; Mon, 28 Dec 2020 19:51:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3705C894B7;
	Mon, 28 Dec 2020 18:51:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2647689483;
 Mon, 28 Dec 2020 18:51:15 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id q22so15390175eja.2;
 Mon, 28 Dec 2020 10:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jd8vqXpCBL/M4gmvTK6glw8478aCcTulXi8fiCOfiQg=;
 b=Hlqde97BCGGKd14DbTckrg6e7Kt7v03bX6UVCIE82wSPIRF9hys5OJJ6kf12tRsXxQ
 sw7PaBoLjYwg/ag8dRTr6afKGv8gzP7KY/wXrXFkOlPkOe0483CRqKO4M1Qm+V+PQzuX
 Dzj6TsARMX00l10j8YowBKJYh3H2lBtv13WG52ukIdwBHxSvw/PMApYGGaHbYfouIWWi
 hc+wz+Ij1W1a65FFt9ouG/u7M9E5U2clmiF9t3bb0RiFBizkP7fICGCoud//6uUyThGb
 0Nyis+0N+iPm+ILZn+bLiNnElGBh2oScdMr9ZyXI3455tYqOiw37tjX9dPEbLS7CyqQJ
 IbhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jd8vqXpCBL/M4gmvTK6glw8478aCcTulXi8fiCOfiQg=;
 b=l6FgzE6ySXmxO7CWsdZ3Su1QZX+OtA6OJo5d9sr4MST6IBAl9ePqEJkQm6/Kv6Wy7F
 l+K5kA8kBwnL6bdjSdd0Z8OZRPpJg9JvbYCiPRMIXt2PJCYhxXRwmInaH+GdlnyazuTx
 2nmrvxzBGXJaRv+OlLtKWHHAKNaKSpgGrDXOVYpBzh1XME8zS+PYtCikpxwyl8fCHB6y
 uClNgJ18cb5zzSm/RJUSanhQEfLX4UFghwPbGzjpuK7F7XF57thjTLIqopeugBeg/q0f
 fVPIjz3TR0n3gInrf2+ntQ437e7SvOZ1notfwfE8t2mQTtI9vYQt4/pNP+c27BXQW3fG
 vzdQ==
X-Gm-Message-State: AOAM530px34+Y/i16VZilD0sFbB+msST0b7SqGBzFzS1UuW4RISS0t9C
 1qSyAtN2nvGd/iXhMe3gjvf41UZ+G+E=
X-Google-Smtp-Source: ABdhPJyV/N54JOfZl6W+vhAHccnmW4AHaogoj6fcpti8K+2QNnpiL0aUpCyCQYoxDixreIkR1fafdg==
X-Received: by 2002:a17:906:b2da:: with SMTP id
 cf26mr43608532ejb.176.1609181474479; 
 Mon, 28 Dec 2020 10:51:14 -0800 (PST)
Received: from twisty.localdomain
 (dynamic-2a01-0c23-8030-6e00-6cbb-50d4-b91e-5b37.c23.pool.telefonica.de.
 [2a01:c23:8030:6e00:6cbb:50d4:b91e:5b37])
 by smtp.gmail.com with ESMTPSA id x4sm37031432edr.40.2020.12.28.10.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Dec 2020 10:51:13 -0800 (PST)
From: Mario Kleiner <mario.kleiner.de@gmail.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: Enable fp16 display support for DCE8+, next try.
Date: Mon, 28 Dec 2020 19:50:57 +0100
Message-Id: <20201228185059.3949-1-mario.kleiner.de@gmail.com>
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

Hi and happy post-christmas!

I wrote a patch 1/1 that now checks plane scaling factors against
the pixel-format specific limits in the asic specific dc_plane_cap
structures during atomic check and other appropriate places.

This should prevent things like asking for scaling on fp16 framebuffers
if the hw can't do that. Hopefully this will now allow to safely enable
fp16 scanout also on older asic's like DCE-11.0, DCE-10 and DCE-8.
Patch 2/2 enables those DCE's now for fp16.

I used some quickly hacked up of IGT test kms_plane_scaling, manually
hacking the src fb size to make sure the patch correctly accepts or
rejects atomic commits based on allowable scaling factors for rgbx/a
8 bit, 10, and fp16.

This fp16 support has been successfully tested with a Sea Islands /
DCE-8 laptop. I also confirmed that at least basic HDR signalling
over HDMI works for that DCE-8 machine with a HDR monitor. For this
i used the amdvlk driver which exposes fp16 since a while on supported
hw.

There are other bugs in DC wrt. DCE-8 though, which didn't prevent
my testing, but may be worth looking into. My DCE-8 machine scrambles
the video output picture somewhat under Vulkan (radv and admvlk) if the
output signal precision isn't 8 bpc, ie. on 6 bpc (eDP laptop panel)
and 10 bpc, 12 bpc (HDMI deep color on external HDR monitor).

Another fun thing is getting a black screen if DC is enabled on at least
Linux 5.10+ (but not if i use the classic kms code in amdgpu-kms). If
i recompile the driver with a Ubuntu kconfig for Linux 5.9, the 5.10
kernel works, and the only obvious DC related difference is that DC's
new SI / DCE-6 asic support is disabled at compile time.

Thanks,
-mario


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
