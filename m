Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8672F0BE4
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 05:46:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ADF889B0B;
	Mon, 11 Jan 2021 04:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5247B89B0B
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 04:46:52 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id y12so2800398pji.1
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jan 2021 20:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mUoSPZN1/QIMi5tiVO7PYLTfc37ZK0uVVtbwZ2aLaVQ=;
 b=MNcSUiuTdAKuqQCNMXZU2cHeIADQViSawHzTZyOWFdBpWf93r9rQ1Hxy4S5vpqPey9
 FoHlb2ZlWScDP58TFRYyvRI05Rc4QNZ4XhO4HtOPWKPjrTYyEwcKltMPFxgBdas0fpk+
 gKcIGEo+mM3cEbE7ulHDKBKiTwRmWz2s5tkCSPzQG8lHfFGMRIjbcsRXIKmTOeldqP4z
 Hh0uAqA0MJobvH7il94xeTOssyccVbT6Mpb6eV8MOmrEF3T/FQ3wUoRcmm5Z8U57nOKx
 rAs+wIOgH6sz2C69t4S7Oh9yQBJa1OewNpe/RuYdLxa41hz2mMgDKlk13PPiCkYY1fPT
 zP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=mUoSPZN1/QIMi5tiVO7PYLTfc37ZK0uVVtbwZ2aLaVQ=;
 b=VgCv+2i/aX3aVlqPbw2Cljwt4XQfyiCQttPYmJv8WJwEZtJXfUJXLVtmN6xLy3h/qm
 f7Zt5N/uGdmPDVGQJmSn2e25n/ILmVnwjDSG/FtKaa7s5PBPfGBYE71QDlcFXUg89zS9
 oyc8+Ep0vg2Rh+8Uxx7uBFzapTyk+MKrM7Sn00u9JWp1V96LBnsXHKOXU/3MJVbSyERj
 6iexq769sgbol9+zwcPSgfiy/oEc65XFK9Zy8FUYo/2nsKFQzw9U//45iOzhvemNyheF
 X7Nr3xsTfViRv/zfhPO2IYQE9q+SI1zhntTapWpLKRWEaRwExGtC/V48wD3C3E7U9Fxe
 Cs+g==
X-Gm-Message-State: AOAM531CuRKeaEXhF8LvT6FQv19HPNAqcJLT4ifZauHhHp+CGWvK0ldr
 1toLp+rVklnsuazFgBh8CPa+Uv9Yy+BRpA==
X-Google-Smtp-Source: ABdhPJw+1ZpsVyrUoxzePMeRys2ujlOYloRq31qrKelOXHZxh8OolJTM3Yyo/vvBZiri2qgkGvk9fA==
X-Received: by 2002:a17:90b:fd5:: with SMTP id
 gd21mr16623056pjb.139.1610340411950; 
 Sun, 10 Jan 2021 20:46:51 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id z6sm17442303pfj.22.2021.01.10.20.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 20:46:50 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 0/2] drm: aspeed: Support more chip families
Date: Mon, 11 Jan 2021 15:16:36 +1030
Message-Id: <20210111044638.290909-1-joel@jms.id.au>
X-Mailer: git-send-email 2.29.2
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-aspeed@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The out of tree vendor driver was recently updated to support the
ast2400 and ast2600. These patches begin to add that support to the
mainline driver.

With these two cleanups it should be easier to support different
families of BMC system on chip with this driver.

I will merge them through drm-misc once they have been reviewed.

Joel Stanley (2):
  drm/aspeed: Look up syscon by phandle
  drm/aspeed: Use dt matching for default register values

 drivers/gpu/drm/aspeed/aspeed_gfx.h      |  7 +--
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c | 10 ++--
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  | 58 +++++++++++++++++++-----
 3 files changed, 56 insertions(+), 19 deletions(-)

-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
