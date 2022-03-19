Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBDD4DEA59
	for <lists+dri-devel@lfdr.de>; Sat, 19 Mar 2022 20:15:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4090610EAF0;
	Sat, 19 Mar 2022 19:15:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4607610F05C
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Mar 2022 15:10:45 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id dr20so21768938ejc.6
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Mar 2022 08:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pqrs.dk; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EKe0U/RwVI8iJXkVv2dwHxyKD0fd8KiFXYVJtE85vQA=;
 b=fk8ezcY5X3ICrRjDohBHJmYk8HCMAYB11MRxx6SNlb2bb1ZgqEWkTHekiUY1V7QFj0
 v2BG+FDPa1x+0d1Sca6C8DupmYY2+Cv1WxLfkPmlc6S9IeRER+OJdKMdrpHObCrCnziE
 haoHTeR3/wICmRyD9YB4JFX7XbHq8dyXCPeUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EKe0U/RwVI8iJXkVv2dwHxyKD0fd8KiFXYVJtE85vQA=;
 b=H0EZSCF9iXQUDjN49lR5tjN6lLkN8F3pJKiufxJ9VN4FJ5KVQRFgtQ5DPGGhfd/XJn
 aTzbR7xEv/PTu/wjYnlGMgXqQXknr9IIfJIt8lRZ2iihChMZ19k6lLniJOLJipkNipUW
 4+BUwjL5mACUTG2mB6ZoReYoMuy9y/SxHDQ+MUM47rnkvI/Fb82xKD+L7cimeYvxXtbj
 hVQ6p8uI5ycVbLxp33AGtjUHL839GvmmA4bZ8USmGp8cm0uwBK113Y0/7uoNGLBzK7Py
 +QR9OxWpftFC68BaISX8d76IBUQPs7vRJlTSJwMhCf6wxpvkXBEoYKUmRuVEM5cIAgBC
 upqw==
X-Gm-Message-State: AOAM531t3vj0XURN/qGf68u4XsoOcbAASWGdJ8Q6Yq1Yf1wkx3QBlh1U
 Fc2Hm6wt5tEfasZd3Pxhp0mCSA==
X-Google-Smtp-Source: ABdhPJyozYKuNYImBQmoKqThMDKDwjsuoBHrBNf58UKZmcvHVn3ID+/mVwxEYE96rWtbTts0ZMu9cw==
X-Received: by 2002:a17:907:3da6:b0:6db:aebf:5fd5 with SMTP id
 he38-20020a1709073da600b006dbaebf5fd5mr13430316ejc.503.1647702643755; 
 Sat, 19 Mar 2022 08:10:43 -0700 (PDT)
Received: from capella.. (80.71.142.18.ipv4.parknet.dk. [80.71.142.18])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a170906728b00b006df8494d384sm4573778ejl.122.2022.03.19.08.10.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Mar 2022 08:10:43 -0700 (PDT)
From: =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin@pqrs.dk>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/2] drm: bridge: adv7511: CEC support for ADV7535
Date: Sat, 19 Mar 2022 16:10:13 +0100
Message-Id: <20220319151016.983348-1-alvin@pqrs.dk>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 19 Mar 2022 19:14:45 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alvin Šipraga <alsi@bang-olufsen.dk>

We have an ADV7535 which is nominally supported by this driver. These
two patches fix up the driver to get CEC working too.

The first adds the basic support by correcting some register offsets.

The second addresses an issue we saw with CEC RX on the ADV7535. It
hasn't been tested with the other chips (e.g. ADV7533), although it
should be compatible. I'm sending it against drm-misc-next because the
issue wasn't reported for other chips, and ADV7535 didn't have CEC
support before. But feel free to take it into -fixes instead.

Alvin Šipraga (2):
  drm: bridge: adv7511: enable CEC support for ADV7535
  drm: bridge: adv7511: use non-legacy mode for CEC RX

 drivers/gpu/drm/bridge/adv7511/adv7511.h     |  27 ++++-
 drivers/gpu/drm/bridge/adv7511/adv7511_cec.c | 116 +++++++++++++------
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c |  22 +++-
 3 files changed, 119 insertions(+), 46 deletions(-)

-- 
2.35.1

