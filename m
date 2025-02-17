Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0987A37BD2
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 08:06:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE8010E389;
	Mon, 17 Feb 2025 07:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OKXwTcL4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B03DC10E081
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 02:44:46 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2166db59927so8212975ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2025 18:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739760286; x=1740365086; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AER0Zup4p13T8PV8KU9Nywbmtgf/uR0O/WZpg95sLMw=;
 b=OKXwTcL4GCBitY4jm3nV7g5DGqO+B48Qc0ng4c0prZRxjk1iou4ax8w3UNSf5h09X8
 OEeJBT9TRBbf4P2AB/gw6j1l3cLh5swNr6Qpyhvi25ZkjhXvgwq37PAunhlRuWs5dJIN
 0Wjk0XYxOAyBozPzqPIT6BBJ9D8AiscZFvoC1UqW5lWw0ja2FvpJmy0jbQyXZrsMdKFO
 uHerNYHbRYKnXYZuhHDUkpfxzty8eKEYtOVSUzrkqSHs26/Ci85yGS1eIrOcfKvzNwkp
 ntZH/9NUEOSex6g1GgQOGY2twDfMAMHt8WrtizqlddK2kq03KK0/tPSpSJhqx/MBUxsk
 8krw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739760286; x=1740365086;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AER0Zup4p13T8PV8KU9Nywbmtgf/uR0O/WZpg95sLMw=;
 b=nabo3QJ78kZ5SdSjCbDRZE+SFGbGQSS2HISK8boEe3YmIliigH3MgO1sPEMyo8Ys2R
 yMW73sjV7ceKMMbaEmo/pcWOvKuwOH6a9Me8I4QMOjvd8LFdKwJUHMs5B+vXBlKh5bmb
 GpftmqAb+jt8O7mL9nd/XNvFnZ9/7krQtxgAiznlM63mQfwsF4pDg6vyX3Ri+MoSv/zh
 afRkkYCaBFascKKpeMxlfQA3kAZk3vwhWRUI9NGxvDHwXILMvszslVRrfJgibQvQ4hSF
 lPDdLHqz161ojIzrjVTCqtISCVLiZ31Pniczz28DZw6xS7NjZlk2uBuqcCRl6bd7OSgk
 Ko3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVMYBX9rmSQfcxzdtPCuHPdtzRz6JyOYx7MvfOZpQFQv9GvI8Hb2k0Gd+6cV2iszTca2GBwkXVbzQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzh6rBObm6MKYUKica+eh4gT0h0hCM1ntbUbDExEM353/3+ANxq
 AFgBpwPMALCnzndFcixigUTwqlva9oc8WTxnlQntQOt+DcwFvLUs
X-Gm-Gg: ASbGncv6jYbwtUjTXU6RhXA9zeWE9Hv4xd3LG85Nhc+MN0YGFXDuge6sc3wUnOXgFiq
 HMOMELbTGV9q5XjuDdzmmjYRlIBvoXvwD40E20aHzkwtrELChpPyAlR0Ua63YV7kkBZRFovn/Qr
 s4+s9VncV+J1K81SNNc3zQvhhffS+1J3gYHYUcZAhGY+uEpWyvdwz5ymbc4nrTbIvA71yOd/kSn
 8QjHpZftd3pphiZ2gnWjRfvzLJ33Gl9MqG8wwIM/XKV6gGIC1aPry4v2jRHzm6TyXKuUaEcbOZ0
 ZFHmHytTSHSlVBio/uP4
X-Google-Smtp-Source: AGHT+IFFkuRjjsUfRuK1JlJi9Y9I+z5IPJ8tmFVOzZ4eyJmlUKG0o/RiAA34cdX7ng6bdHkr98gAvw==
X-Received: by 2002:a05:6a00:2d8f:b0:730:9467:b4b8 with SMTP id
 d2e1a72fcca58-732618d705dmr4381994b3a.4.1739760286043; 
 Sun, 16 Feb 2025 18:44:46 -0800 (PST)
Received: from rock-5b.. ([221.220.131.19]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7324278011dsm7014915b3a.180.2025.02.16.18.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2025 18:44:45 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: cristian.ciocaltea@collabora.com
Cc: airlied@gmail.com, andy.yan@rock-chips.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 heiko@sntech.de, hjc@rock-chips.com, kernel@collabora.com,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, robh@kernel.org,
 simona@ffwll.ch, tzimmermann@suse.de
Subject: Re:[PATCH 3/4] arm64: dts: rockchip: Add HDMI1 PHY PLL clock source
 to VOP2 on RK3588
Date: Mon, 17 Feb 2025 10:44:37 +0800
Message-ID: <20250217024437.35155-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250215-vop2-hdmi1-disp-modes-v1-3-81962a7151d6@collabora.com>
References: <20250215-vop2-hdmi1-disp-modes-v1-3-81962a7151d6@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 17 Feb 2025 07:06:12 +0000
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

Hi Cristian,

On Sat, 15 Feb 2025 02:55:39 +0200, Cristian Ciocaltea wrote:
>The HDMI1 PHY PLL clock source cannot be added directly to vop node in
>rk3588-base.dtsi, along with the HDMI0 related one, because HDMI1 is an
>optional feature and its PHY node belongs to a separate (extra) DT file.
>
>Therefore, add the HDMI1 PHY PLL clock source to VOP2 by overwriting its
>clocks & clock-names properties in the extra DT file.

There are boards that only use hdmi1 such as ROCK 5 ITX. So there are two
choices for this board:

1, Enable hdptxphy0 as dependency of vop although it is not really used.

2, Overwrite vop node at board dts to make it only use hdptxphy1 like:

&vop {
	clocks = <&cru ACLK_VOP>,
		 <&cru HCLK_VOP>,
		 <&cru DCLK_VOP0>,
		 <&cru DCLK_VOP1>,
		 <&cru DCLK_VOP2>,
		 <&cru DCLK_VOP3>,
		 <&cru PCLK_VOP_ROOT>,
		 <&hdptxphy1>;
	clock-names = "aclk",
		      "hclk",
		      "dclk_vp0",
		      "dclk_vp1",
		      "dclk_vp2",
		      "dclk_vp3",
		      "pclk_vop",
		      "pll_hdmiphy1";
};

What do you think of these two method?

Best regards,
Jianfeng
