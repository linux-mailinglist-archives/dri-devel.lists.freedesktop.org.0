Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1A925D93F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 15:06:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 417816EA28;
	Fri,  4 Sep 2020 13:06:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 933B26E151
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 13:06:13 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id t10so6731611wrv.1
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 06:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=E9G/uEXRmNdCZf+xjqHOCF0OHoHgJrExnYXekXh18dQ=;
 b=DG8ozdPssbxATQ9WJd35Z9K3V8uEpQMDgQuro20wVwXg8IdJ2bfSseQ5Cn+/hqgsMU
 TEI6MIPtxAWk344mWNkvg0lRjxOZ7t278YfZ9VKTElYBgR6kckoL8B/RS8PBSiKsgZ4w
 CrwYhVW4Zy/gpm8odZHtkf2EpGMzednQnohupkqw+a5xLNFjnBMyLxcF0IC+0wWRrnhs
 6wS5PZe5UG4i7+B3foyVPfMOOaQZ5WOwkmE7dT7kA5eLmQEIcefge7MwM8P3pLO3601j
 iWwv2VnDXawOFx4+tcAhhmgL/RsXmY3fJ7gYV0DpvyeeYAuclIKb8KqAyinlIOiswMSc
 yjUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=E9G/uEXRmNdCZf+xjqHOCF0OHoHgJrExnYXekXh18dQ=;
 b=RKdgIHIvexi2r5wFwVhPuzuGU3eSstu+vtCXVr7Qz9DLOZJaI2AOMlGJghAYs6ln+b
 lBvZh/a+tOO0zkfm4z2ieU5iNSRq/c5OyMd85Q2t5zJjS3Mh3vwYi20aBz0/5IpaCQPk
 h7t/Id34uHzNKpJzo+SKaSOcdoQWsBlLH461NVW9cSNCPoIElPJnyU2zviiJ/3t451Bq
 PU3jahTNyoAK3XHN5asZq/xQBp9n8C76h0UkQRX0B1FHB8MLLFun/PJ32okROatVO/2p
 i7SEd8cFnX2Avl4bzjJ7vZASkOLidGHuziAcE40pzl/RKrs1m0UaGH2eRU9Ucd4mWgLH
 XofQ==
X-Gm-Message-State: AOAM531JVNSghNCbcMKwJz5k34g70TayUMUDop2BCwUE3YGPN6/StJU9
 4qf68YThfTsU6bmTyQ7MMI8x79E/4rdhkg==
X-Google-Smtp-Source: ABdhPJxBo2YRoEMAGlF/dNKtG7Kr6QHVTHVLDM5g9dnKAeh1mu2DJSneo7DAt5CcOF3Nyna8A87yTg==
X-Received: by 2002:adf:cc8c:: with SMTP id p12mr7890912wrj.92.1599224772308; 
 Fri, 04 Sep 2020 06:06:12 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id e18sm13176384wra.36.2020.09.04.06.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 06:06:11 -0700 (PDT)
Date: Fri, 4 Sep 2020 10:06:05 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: [PATCH] MAINTAINERS: add entry for VKMS
Message-ID: <20200904130605.vs5tnfhgnemnz6pt@smtp.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add myself as maintainer of VKMS driver

Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 01fb9ee6b951..d4277824a01c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5640,6 +5640,7 @@ F:	drivers/gpu/drm/udl/
 
 DRM DRIVER FOR VIRTUAL KERNEL MODESETTING (VKMS)
 M:	Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
+M:	Melissa Wen <melissa.srw@gmail.com>
 R:	Haneen Mohammed <hamohammed.sa@gmail.com>
 R:	Daniel Vetter <daniel@ffwll.ch>
 L:	dri-devel@lists.freedesktop.org
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
