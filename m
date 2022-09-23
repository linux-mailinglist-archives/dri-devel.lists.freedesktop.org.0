Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0CC5E76CB
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 11:23:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651B610E7D9;
	Fri, 23 Sep 2022 09:23:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C20710E7D9
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 09:22:56 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id n15so12555601wrq.5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 02:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=+FMrWVPMEdwOx/W55baV9JxuYDjrfIXtXPnEvm7boTY=;
 b=gYCUK6As6KB+HLSu3BT7UX66xB7PkHmzNVE6h8asKIIKTx98ShJWCMzL9c1NK5Cq+B
 0QsPRzfnsMZjiK20X+6OV8Fe4ohhva8mccwVObMeNcDXzJnacfPKeCaMolvwM6bDWt63
 ckFeKgs+Mgk6A3ES7vSqAn3tp6b5HF+LXAZA1iQe/yBXmVNTfXZo2Lc3Ocdld1JSPhom
 tbdibbmROVsjhbsxBll1pNjRoZZsrAXfiIaMT/xtPbIDgaOswJkNb4Cw7jy2y4nE/JtK
 tKEPVV6prpcb17g+e8AsyIQyNFTgqZYp6B+vgy9+m7YJ41kPOX53yGVAame/QAT5grdA
 amDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=+FMrWVPMEdwOx/W55baV9JxuYDjrfIXtXPnEvm7boTY=;
 b=y/QwK2BKKcqRZQhhE393W9F72h55kOYOsYX57TzDlY6E5gBbQm5DDrQTiovjJqrlER
 crOo19r9mti47t3Y3092rdPoQkpXHgJqMPWuSjlQnjiOu4OlvqzGxaCzHcw+3WufLsCN
 l5V37/KkvcucoDuefwRN6EMn9+/0RT5iytXJsH227H48LIu5fNHQ1k8jlhOVCHGE8ux6
 IhafeZmfWPDrUQdl/OVfGrmL98oD+H6yr5M+lnc1gMBnTzgIU4RTqO6bpPTlVfBt8x81
 wxDvmQ+2AoH7z5tI3rb/oSXSC/7NrCQbxohtXXcqK32ZHf4bqN1Coz5WH9g/NRcXMU3C
 jy+Q==
X-Gm-Message-State: ACrzQf1LIRaIV+G1YC434SPLQr/8M4glpm+CNzjkYCoa3Vpcjuou2J1G
 RG4dW3J9Msu0qmlMM9DhZY8zFp/4IFzdb9yk
X-Google-Smtp-Source: AMsMyM4QFxOpC09rxWp8RxoPj+GvwVFgv0PH2mQHmJD/3gtMAWmmXhkNvMwxQLHUsYAgkKJ/Z9g8ug==
X-Received: by 2002:a5d:66cb:0:b0:228:63bd:dfd6 with SMTP id
 k11-20020a5d66cb000000b0022863bddfd6mr4604502wrw.86.1663924974899; 
 Fri, 23 Sep 2022 02:22:54 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 p19-20020a05600c05d300b003b3365b38f9sm1921256wmd.10.2022.09.23.02.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 02:22:54 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, Philippe Schenker <dev@pschenker.ch>,
 Adrien Grassein <adrien.grassein@gmail.com>
Subject: Re: (subset) [PATCH 0/4] drm/bridge: lt8912b: Fix corrupt display
 output due to wrong bridge config
Date: Fri, 23 Sep 2022 09:22:52 +0000
Message-Id: <166392495428.2592704.16276233833718753255.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220922124306.34729-1-dev@pschenker.ch>
References: <20220922124306.34729-1-dev@pschenker.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 22 Sep 2022 14:43:02 +0200, Philippe Schenker wrote:
> From: Philippe Schenker <philippe.schenker@toradex.com>
> 
> This patch-set fixes the lt8912b driver that currently does not take
> care whether or not the attached display has postiive or negative syncs
> and or reports on EDID if it needs HDMI mode or DVI.
> 
> This series addresses also an issue where the LVDS startup sequence was
> written to the wrong I2C address (the lt8912 has three). This caused
> writing into reserved registers and causing an unstable HDMI picture
> that manifests itself only sometimes and depending on the monitor with a
> flickering and a repeating of going black and coming up again. While at
> it move also some sensible comments to the sequence.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/4] drm/bridge: lt8912b: add vsync hsync
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=da73a94fa282f78d485bd0aab36c8ac15b6f792c
[2/4] drm/bridge: lt8912b: set hdmi or dvi mode
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=6dd1de12e1243f2013e4fabf31e99e63b1a860d0
[3/4] drm/bridge: lt8912b: fix corrupted image output
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=051ad2788d35ca07aec8402542e5d38429f2426a

-- 
Neil
