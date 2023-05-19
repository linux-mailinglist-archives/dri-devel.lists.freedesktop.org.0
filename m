Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F8D70912D
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 10:02:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F0B10E5D9;
	Fri, 19 May 2023 08:02:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E2F10E5D9
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 08:02:05 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6434e65d808so2974680b3a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 01:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20221208.gappssmtp.com; s=20221208;
 t=1684483324; x=1687075324; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HlEmFTNP9PUL84u+Ib0II+xLrPS1EiFnsGFID7L9rdo=;
 b=Ttjov7FxrgoKOfg1g2SAICXOklfg6xj4N73Vw5FKWFJUkkJIlDwu/VJggLjpvX4lyt
 PEr/NmLmak5S+RBzpclSuu2NZZ+R7Ms8UAm6yJIQgNkkRG7y6FjzmnemZ4bXMdIWRiqf
 LFQ0HnRfu8OVSppLjcXxfkptl1UAts2Z03noutdfB+GrE5eKnhPSUEXDs0iXB+PFTqS0
 r8juNWCbePncLltibJxUwRDHCpRHvcMAMcqXZ5bQc9Q6t3o6nLlz42gXthA6YupF89Oy
 kvynOciRFnSz4stSUj1JxkG8KlQQNkRx3VPm81ivRp4CJMmkj1I+/E1Onlo8mZXlty/e
 6psw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684483324; x=1687075324;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HlEmFTNP9PUL84u+Ib0II+xLrPS1EiFnsGFID7L9rdo=;
 b=LNMsAmwOGcN3PpBmSfRKd4Psdc/CyD0SaFI/YWDr9n4bvA7fbrNRhWf7PbmLhSGWND
 MNR7d1zFPKZUEyl6IUqUM/a+WUoXwURPOfJ2ObEEttU+olvMWYGgovRtlbxp7vs2ZnUO
 qqPPL0swU060+xVO7it0lE3SO1fW9nfZ4C27IcU6W2+FKmvF938Q+OYnN7ak91lwKcsq
 j2U7hbXc2r19BXoqofDGzle6+ZfyWhh5BitzpnJ2WoAgfC44VkzzBhuGBCW13uFeKcLr
 AOWFJ0xtyYt9gN8kqEQf+/Wb5amB5KmFPUcDPbpVtROn5o8iGXmE/m7wrDYcJ50ilZOk
 EdXQ==
X-Gm-Message-State: AC+VfDy1E72Q0vNoYvnVSVeZRZGW0Urt+5ePwC8dbJCdG1ZkOfzYl57D
 /AmJz1OKtSCoN7kBg/EYoah6Yg==
X-Google-Smtp-Source: ACHHUZ4fKTzh2fL7MosNybhfq9X+LbsyMmWzTTd0uVDUCGM8pD/IEEkJL2XH2SGMyiJQmZgEcN2peg==
X-Received: by 2002:a05:6a20:12c1:b0:105:f8e4:7214 with SMTP id
 v1-20020a056a2012c100b00105f8e47214mr1444727pzg.42.1684483324581; 
 Fri, 19 May 2023 01:02:04 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.214])
 by smtp.gmail.com with ESMTPSA id
 e2-20020aa78242000000b0063b86aff031sm2441174pfn.108.2023.05.19.01.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 01:02:04 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@google.com, hsinyi@google.com
Subject: [v1 0/2] *** Support Starry-himax83102-j02 and Starry-ili9882t TDDI
 MIPI-DSI panel ***
Date: Fri, 19 May 2023 16:01:34 +0800
Message-Id: <20230519080136.4058243-1-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230519032316.3464732-1-yangcong5@huaqin.corp-partner.google.com>
References: <20230519032316.3464732-1-yangcong5@huaqin.corp-partner.google.com>
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
Cc: devicetree@vger.kernel.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The previous patch is not based on drm-misc-next, resend this series.
Support Starry-himax83102-j02 and Starry-ili9882t TDDI MIPI-DSI panel,
set the default high for RST at boe_panel_add and add lp11_before_reset flag.

Cong Yang (2):
  drm/panel: Support for Starry-himax83102-j02 TDDI MIPI-DSI panel
  drm/panel: Support for Starry-ili9882t TDDI MIPI-DSI panel

 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 474 +++++++++++++++++-
 1 file changed, 473 insertions(+), 1 deletion(-)

-- 
2.25.1

