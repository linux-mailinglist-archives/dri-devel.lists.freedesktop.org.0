Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 442A83F5589
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 03:41:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36928894D7;
	Tue, 24 Aug 2021 01:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 310BF894D7
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 01:41:29 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id x16so16947329pfh.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 18:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r45wkiYyF8/1VbTkxokZIQKR4JTP9pwQ0FkD+cQcN5Y=;
 b=VlMloLwXKazHvYh00p8ygCg4WckEC7kxtg4QGGQNK6Lb9YQiAI4VrFVeyfhXlIaMiX
 w5j9cl3IpA6D5lJLvJ7SdpCESpAnEPelAjfqfxKNRoo6gM877OPhGj1oITP7ESQ14MH2
 +bx7FH81EgKqLR1SQeQupAW8mKX7nrtP5QDtwPAJgsHCMi+dnaagM6v7mKrir8DRDxWw
 i9/N/ggMMbmS1mEBTXXS0wdy3VqkOA7YIDPGDQM4H2/NVcdxNjdx/As6z2njwKyQShOH
 aYjbeBOuAaXqCWsZy/CqHG3vVtD1ye1YlqVove76ZGQOELm4r+NEAfhiUX1vr4yL4/G3
 G/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r45wkiYyF8/1VbTkxokZIQKR4JTP9pwQ0FkD+cQcN5Y=;
 b=iBhimP9owKQRsfyIuNHUVhdJOmCYEu1eP6IZ0O9Hc6uFWlZGzaZkF+AvrLbFhg7sZ2
 2uEdSgKyPONNYiUDP88sfKwbY1vIsbQPjMnk2pACOfUa877oGHep6vYvpVZc1G7YM2nO
 gqTGSkuV7SpCfrtirtRp9iw7BnfIDLhmms4dCuJ7R6jq4kGBsPTWAmeeaPsJJAddTpPU
 HKbLaZDrIyJayNxx0Yx/RP9NgrheHIA31hZLZYZQ34QjGP6YyfOlDp2WjXaVFvlGYtV3
 2kTpHG0Be4fBunMSTeQ5CSPVgT6izv1d4M5XH8HOM2vP5n2bYAj9hgJ0mLtZfFW7KNeL
 J6pw==
X-Gm-Message-State: AOAM53306wWXE51ZJPs5iSdgAqytA/ZALZtLcH8XczT2rrqxSvfqPC8g
 7AwyqKieF2Ql2PNsL3moh30zaA==
X-Google-Smtp-Source: ABdhPJyrSRULA0ot4zGJ13mvsrw2Rp1qlYatCGISkmx89QcR50tlecrk0ZIOj4XzlSHRrf5ipnzU/A==
X-Received: by 2002:a05:6a00:24ca:b0:3e1:14fc:e34c with SMTP id
 d10-20020a056a0024ca00b003e114fce34cmr35700393pfv.76.1629769288759; 
 Mon, 23 Aug 2021 18:41:28 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.214])
 by smtp.gmail.com with ESMTPSA id p3sm457377pjt.0.2021.08.23.18.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 18:41:28 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org
Cc: airlied@linux.ie, daniel@ffwll.ch, devicetree@vger.kernel.org,
 dianders@google.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 yangcong5@huaqin.corp-partner.google.com
Subject: Re: [v2 0/2] Add driver for BOE tv110c9m-ll3 panel
Date: Tue, 24 Aug 2021 09:41:24 +0800
Message-Id: <20210824014124.1080798-1-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <YSPAseE6WD8dDRuz@ravnborg.org>
References: <YSPAseE6WD8dDRuz@ravnborg.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,
  This driver support boe tv1110c9m-ll3 and inx hj110iz-01a panel.The IC chip is used NT36523, which is a new IC.
 
1: panel-boe-tv101wum-nl6.c driver cannot meet the timing requirements of the current two panel.

2: The screen cannot be work in HS mode, panel-boe-tv101wum-nl6.c will switch to HS mode when boe_panel_enter_sleep_mode.

static int boe_panel_enter_sleep_mode(struct boe_panel *boe)
{
	struct mipi_dsi_device *dsi = boe->dsi;
	int ret;

	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
	...
	...
}

thanks.
