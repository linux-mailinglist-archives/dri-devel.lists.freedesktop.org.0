Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBE1C3D071
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 19:11:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B0E910E99E;
	Thu,  6 Nov 2025 18:11:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZTEfUQF7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEBC710E99E
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 18:11:38 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-3e297b0452aso704741fac.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 10:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762452698; x=1763057498; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cpT0TLdGzfQfSoii4/bs36ZSx7naUbNo4dP7DJ25fa0=;
 b=ZTEfUQF71hGoCSpgYO7//pzIMKFi50nYGEVpgHfFjPmd2kLbIawPPkIHeU97szG5CM
 c0n5kWJ0fvg8epoaWGusLR58wJS6Itm4lTxLxqeLzURCU+MgUIk8QDm+e6hLXeyWeN6r
 8HlX7Bt1ohP/pHOU6hAnNZzhFrZJhbWhoJ0W2kf3k9qGfL2WQsGaT5cV5SZnCkV1RKHN
 ThwN5I3GA1pYLeoTO9eVuIOIsM/MXoggjdhK35I/+PS7Ql2meC/3zHXlZdSHkX5fE9zZ
 KLjaOegYtQNqp5gn+YS/ABlgBMUzPxfWsyLKSZi1Q1eSqy3HQnCOEK5iMj/rfMIOz3ds
 mpcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762452698; x=1763057498;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cpT0TLdGzfQfSoii4/bs36ZSx7naUbNo4dP7DJ25fa0=;
 b=s/LLGLS1T/JppEAfDDVM5IM6/ZwTrI5hKJRfsRIkEhKqxTwQwQ0qf55edKBqmhHg09
 SkPUxtEx74b5E+myWYHlPsdw+6ZHmHoovNV+W1PuuQslKsc/qBGdokZVBmdNlbcRqG3+
 zKI2luH+T/lx1eFzCxYvZ3q8pt3TjRVmQWqNFhBu5tBABm7fiTMKD+vXUZZFf48efnm3
 0tYWUeJUqZ46UON2uJKigtRM63l+/+aOoLiIM1BocIZPR31oEuPvd6WGVl2aeC2pVSot
 5kZyjQM5XFmBWch+Xv5ox/uFSMLH1YE8L3DyTP9vePmctnY5qafhOmDY8D2mOeqnOlSl
 0qwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUe0+/79hfCSDhc5nq5+nyg/SPad2HZjjInk32Mc5L+Uww7DlOXtcFzkX4YnrJvVW/5GqUbFiGd/qM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGVtvIUcuY9hsG0gLn3EQI5KwBrwcGI/niABN3wMmm/rJjMHZM
 LMjEYD3+mUWmDOpr4opHLjVvz7rd3RX6wwpracDEXkDpXobt8Du3qcUH
X-Gm-Gg: ASbGnctDOh6Dw5Up8N3VCQIyeSWvgbfRluTPLuTSjPKX31ivZnFEasu2ie6XrGjjiXY
 /Faw+E6+zhgCkkom1umHzarNwaS5pV+PpCOUvQhwDlFsYbjmnTWsVkwEssCTjLuyQZFcQVpPyNP
 ERXDLp2DH4zpkc3Wqu02D08GE9EfJ1KdNm7dxmr4HJu0i2DayY5RnX8/W0wf1cDErEPJrrAasGW
 AV/8w3QGNSu0weoPs+DnhNMygDozUZZukVTu1+yMloVNfGZAeVLNPRpub+AalhWh7J05mQY2Tt+
 pb946ko5zmf5qn/rGHueOL51XqK0Uh/g5YWcrRtPNFHfPhxwKmT8gZuQ6iadJA1SzjVhkBLDp7k
 WmmDfJbf10bmb0MpKv2/mqYsI9otXIZZvHWSAS76y3hDBbe+qFEe/shuPgo1zAkFwsx9LwCVyfy
 tXatdEkQBrWt65HISQhm0=
X-Google-Smtp-Source: AGHT+IGAvjoXA76/UDaqXpOU4Fcz8E3D7Krbf8yR4RW+nCN1vEdGUmxv0HqWHlh+xaipNHgHQc4imw==
X-Received: by 2002:a05:6871:5b1b:b0:3d2:5ad4:4e7 with SMTP id
 586e51a60fabf-3e41e6afbb2mr348131fac.47.1762452697786; 
 Thu, 06 Nov 2025 10:11:37 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0:41f9:c9d3:db30:c36a])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3e41ed0aa06sm137739fac.8.2025.11.06.10.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 10:11:37 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cristian.ciocaltea@collabora.com, sebastian.reichel@collabora.com,
 jernej.skrabec@gmail.com, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com, rfoss@kernel.org,
 neil.armstrong@linaro.org, andrzej.hajda@intel.com, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, tzimmermann@suse.de,
 mripard@kernel.org, andy.yan@rock-chips.com, heiko@sntech.de,
 Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 0/3] Add HDMI for Gameforce Ace
Date: Thu,  6 Nov 2025 12:09:11 -0600
Message-ID: <20251106180914.768502-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the micro HDMI port for the Gameforce Ace. This port does
not have a HPD pin so it requires making changes to the HDMI controller
to support this configuration.

Chris Morgan (3):
  dt-bindings: display: rockchip: Add no-hpd for dw-hdmi-qp controller
  drm/bridge: dw-hdmi-qp: Add support for missing HPD
  arm64: dts: rockchip: Add HDMI to Gameforce Ace

 .../rockchip/rockchip,rk3588-dw-hdmi-qp.yaml  |  6 ++
 .../dts/rockchip/rk3588s-gameforce-ace.dts    | 63 +++++++++++++++++++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c  | 35 +++++++++--
 3 files changed, 100 insertions(+), 4 deletions(-)

-- 
2.43.0

