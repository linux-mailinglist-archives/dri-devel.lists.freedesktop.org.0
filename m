Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FDE13866E
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2020 13:37:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023A26E50B;
	Sun, 12 Jan 2020 12:36:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 975BA6E4AB
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2020 00:16:45 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id d16so5173094wre.10
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jan 2020 16:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AjUv0l8hskCQu/sfhTW+zT+JFalMEnxaLpHc5wjsSrk=;
 b=uZapQ+by1rty3HyhlkQGQkL4kSQRFma4TxmcNEsHnvBp7pkpTBMBX3vgVUMG3/IClu
 IdHTMtYLKZeVzzvg+Qfdyi/l7s5XskJDnMxZRuZsGRBMoTHlDD+YnLEQHQ5eS3CFXphI
 HIDuL1wMXLwd/+ib2+jlhodUqkboDBpYVhCZ5GkTDadamEcaOfwQJfCx6JGEM9subtBS
 xfJqEWOS4NkPl+/XTRZ0RgtsvZMJu96IjLswacwCUb09BNsTfFjIpPpEW6Fjh+gXEaQ5
 2Sm1qgWUR++mXkO7AZvhOE5GSRKeOomTQo9+/4P8ZcgDTlCPaCdNAgc4uKiDO5BU5VQB
 r3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AjUv0l8hskCQu/sfhTW+zT+JFalMEnxaLpHc5wjsSrk=;
 b=CEny4OoSeIo+unw5fH33FPmyvFp3H51ez/pt7H0AVRB2U414QBIJkIfzZIiQYT7cSe
 YpopNPAZuswpiFnRGeoqygd3YUxduZ2quCflSj6M+ftxe4aX8+8W4+WbCfP8bK1qvzx6
 pb7VNph7KaAVtKZxX1VN+gGz67pzzufM0qFkqsuzqYoNbLySRcANvhKvjNnjQwxNxojq
 Y1I2eI2hDxQthdrcgqXZwfv5pGiNKnF0fHKjqs9DzmTs4i7I+lCvUBRLEPigzDyWGmIo
 K1JebmpOBgEHB5VLjm4tzmACAsz/gpG2W32/+UnTK0IIgMkYa3uIVqx4MxeQBzvN7SDF
 vRaw==
X-Gm-Message-State: APjAAAWesl2SfzllCCMAWYygfYQscxhIjj7Q2+yqQ3trSK4OYPU/7RLn
 50DqTVrq+2RrTXQAK2fXQZxsVGO/
X-Google-Smtp-Source: APXvYqwxgbwC6cX6oTmsyFU5iWJhMbjSDPZ+lTlZ+fPIHUdsXfTc9BQoIDqOEKQOSfKrzV9ga6hutw==
X-Received: by 2002:a5d:44cd:: with SMTP id z13mr10795278wrr.104.1578788203919; 
 Sat, 11 Jan 2020 16:16:43 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1373A1900428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:373a:1900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id h66sm8575535wme.41.2020.01.11.16.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2020 16:16:43 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: dri-devel@lists.freedesktop.org, alyssa@rosenzweig.io,
 steven.price@arm.com, tomeu.vizoso@collabora.com, robh@kernel.org
Subject: [PATCH RFT v2 0/3] devfreq fixes for panfrost
Date: Sun, 12 Jan 2020 01:16:20 +0100
Message-Id: <20200112001623.2121227-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 12 Jan 2020 12:36:09 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-rockchip@lists.infradead.org, sudeep.holla@arm.com,
 linux-amlogic@lists.infradead.org, robin.murphy@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These are a bunch of devfreq fixes for panfrost that came up in a
discussion with Robin Murphy during the code-review of the lima
devfreq patches: [0]

I am only able to test patch #1 properly because the only boards with
panfrost GPU that I have are using an Amlogic SoC. We don't have
support for the OPP tables or dynamic clock changes there yet.
So patches #2 and #3 are compile-tested only.


Changes since v1 at [1]
- added Steven's Reviewed-by to patch #2 (thank you!)
- only use dev_pm_opp_put_regulators() to clean up in
  panfrost_devfreq_init() if regulators_opp_table is not NULL to fix
  a potential crash inside dev_pm_opp_put_regulators() as spotted by
  Steven Price (thank you!). While here, I also switched to "goto err"
  pattern to avoid lines with more than 80 characters.

Known discussion topics (I have no way to test either of these, so I am
looking for help here):
- Steven Price reported the following message on his firefly (RK3288)
  board:
  "debugfs: Directory 'ffa30000.gpu-mali' with parent 'vdd_gpu' already
  present!"
- Robin Murphy suggested that patch #1 may not work once the OPP table
  for the GPU comes from SCMI


[0] https://patchwork.freedesktop.org/patch/346898/
[1] https://patchwork.freedesktop.org/series/71744/


Martin Blumenstingl (3):
  drm/panfrost: enable devfreq based the "operating-points-v2" property
  drm/panfrost: call dev_pm_opp_of_remove_table() in all error-paths
  drm/panfrost: Use the mali-supply regulator for control again

 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 44 +++++++++++++++++----
 drivers/gpu/drm/panfrost/panfrost_device.h  |  1 +
 2 files changed, 37 insertions(+), 8 deletions(-)

-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
