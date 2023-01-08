Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 162906613E4
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 08:26:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C604010E1E4;
	Sun,  8 Jan 2023 07:25:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C59410E1E4
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 07:25:58 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id f34so8286765lfv.10
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jan 2023 23:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EAAwwDMIubbBE3gJZq8/7iTQMQU12UzH3ERnpRTlNIA=;
 b=Bg5O3r+rUSHFezSrSozin/g+crW+X/TQyfCS8A40HjPt7lpnrxoX27edLpOF93lGNY
 fzmkTeGYcGYG3LGUERYvsHaUhNUY9LmxvgF6fjH3nnT7cs49ckY9Y90BlO8gcjxs3FUg
 pso9ebNbyTNkxbY6gXhKTS+W4/DpOHHw3O6aZFDaqhQ7Zth4sR9YFkiZ4NDJpc9A6tWU
 7pWCVOl82ICIqEb4giqCuBCWutbirn5/y284x3EQDdYv85TkTopv52gexDzn3Av4kAXE
 Te4TNB6BblpL7cf2/2Qzw775R12UfcR5ygX92BFajXlmAiM5PJUnmz7EJx2BrKaxSYGG
 mRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EAAwwDMIubbBE3gJZq8/7iTQMQU12UzH3ERnpRTlNIA=;
 b=Zw5+Y2oJhIqyURk2wXBhgLzqfeYp3/Nh7CI8uqhGKjtHEoIvodwgxNZo9PiaBI9i5L
 wmKpzZYH5CRAD+1uuo3/GLVK10GZuIMFV9JBg3t10BCsmE2n+eTBxxUgAgJ8E/yAj6hF
 gkY79yeXNbx/O773YvKM2EsnMlYCLeAAb40a2/Uf89GmwxxTm+eq+0b5EPoXkq8UI0CI
 HkudkghzcZ6IkAYnCHfuJSiy/WbVSoVbXmlYuDWPYXc0FfD+/rw3ZXGtcVdX4Ps4rAQC
 DQ4LfNqMSNwXCps6jtqJ4T/34oSNxl2TlbxFtLz2YfK8dFmIL5z9+i16uP4MFR/SjKJk
 AJ0Q==
X-Gm-Message-State: AFqh2krp0pjkn5CsmBhDpdjcM7Wb0IaId7QCXOgnvm6H8Yk0gy+i2MMi
 ZiT0svUI9ftK+mI4s3YD8SxnLA==
X-Google-Smtp-Source: AMrXdXt1Eb0YDFNARb8Zg47TqsSCW9kfUXxzW6leI3UHZZ6Yx+SeFA+BkOCdFlLT/df186wTov8HtA==
X-Received: by 2002:a05:6512:74:b0:4ca:fe23:7677 with SMTP id
 i20-20020a056512007400b004cafe237677mr13119631lfo.43.1673162756615; 
 Sat, 07 Jan 2023 23:25:56 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 x2-20020a056512130200b004a8f824466bsm927414lfu.188.2023.01.07.23.25.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 23:25:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 00/12] drm/bridge: lt9611: several fixes and improvements
Date: Sun,  8 Jan 2023 09:25:43 +0200
Message-Id: <20230108072555.2905260-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A series of patches to fix mode programming for the Lontium lt9611
DSI-to-HDMI bridge (found e.g. on the Thundercomm RB3/Dragonboard845c
platform).

Dmitry Baryshkov (12):
  drm/bridge: lt9611: fix sleep mode setup
  drm/bridge: lt9611: fix HPD reenablement
  drm/bridge: lt9611: fix polarity programming
  drm/bridge: lt9611: fix programming of video modes
  drm/bridge: lt9611: fix clock calculation
  drm/bridge: lt9611: pass a pointer to the of node
  drm/bridge: lt9611: rework the mode_set function
  drm/bridge: lt9611: attach to the next bridge
  drm/bridge: lt9611: fix sync polarity for DVI output
  drm/bridge: lt9611: simplify video timings programming
  drm/bridge: lt9611: rework infoframes handling
  drm/bridge: lt9611: stop filtering modes via the table

 drivers/gpu/drm/bridge/lontium-lt9611.c | 312 ++++++++++--------------
 1 file changed, 124 insertions(+), 188 deletions(-)

-- 
2.39.0

