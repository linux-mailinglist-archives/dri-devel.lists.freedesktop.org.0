Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04488A3978F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 10:52:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DEE310E3A5;
	Tue, 18 Feb 2025 09:52:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WtF3/Fo9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7292A10E3A5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 09:52:24 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-218c8ac69faso10699105ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 01:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739872344; x=1740477144; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kXE7lzO8tAK+W+95G0EGctHj7HaDXe4ZOUjtDp40SHU=;
 b=WtF3/Fo9eDyRzxM8OfF1v4szAjp9kj01hcMByMFRcTg7mUhdRRIAi2d1YDlTbw8Pfd
 WiOofvlps6c1Qiv23aEGU6rkuEMhUVV4zk3tkIdUiYR0zVpKqOggRn99zJquLzRu3bVF
 0ccf0cg+1HFTxi+lvxxaZaEU9+Ev3zgmy7WX0FvCJ65bFbCIXRLSMRjHHoU9dkvOBxq0
 YrZYazMHNSCsyYjHPG55u8/xllAm7HJEFcfgaVx+3geI/vJoSOO1LNOPnInOGsPAc863
 LheE9jCGI77uVR4784Nhhc8YEdv0EhxsCDqrJm80ak6/FKY4yz5grxP0Rby5UcYghqX7
 hzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739872344; x=1740477144;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kXE7lzO8tAK+W+95G0EGctHj7HaDXe4ZOUjtDp40SHU=;
 b=bS/8YdbGeQVFhZxrymIC6H2LsoGjlAq3veKuoZ+4KPEaFdBija8qlP52ZNpNLHktlZ
 oQqFB1S+ko6CzzAy5iSEgzGJnOpa5IoiUcwwL9jigkBTNcgK39WTAMlYbOg/tVJfMGWs
 69MrQIipsvr/Htu5lzfvOa+T2CyOiqFuVvI5taOoSEB0iIwB06sRRagS31Aq1XEIDJ8F
 Z0hOhi+PH+N7aE8N7luCm4nQk1v9TWoBIzG3ueUKO/291Qqso4lddhNwc+JP+m51JINT
 L3uZOBkASNssgJnGGd3byCQ+DlioD4tPO1AbNUtBm5k4BVawoZm/nyvo6hQM/TcY8DMI
 eN9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6UeiCkru5LsY/LWSrB/EJOCYteXf46ZXtGOR2vFwhnQWRY2EpimUksUj/vvs5JygspznCkrnu09o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwawzIt8c4P3AMjjeFoPErTV9H/IE2eS+TiKj0XPk6FVSco/2m
 wWPBym00pvpSCjZxKmqzlrtjbnjsraF42Q6V8RYdCK57vrdkh27V
X-Gm-Gg: ASbGnctJuxgxGqKf+40b8zRdQdRGu090nZnKQrZNzQ6mQjjb+tmTfVtORaWMGRrUZqg
 RtZW5pX82NOcgSJbtIMdBLRgrdGVlVtKfSusoUp//Ktmc69WrhpHbAbZC7jgK8hFs+t7x1jU8UL
 4zOjNNhsT0GFd9uvXxnj5ac5cvIisfs6IcYqpK0hrp/Vep7s1BMw8LNShQ0sAn3wpVpMEc/2uMu
 XJPoqdlECBLpqDrYG3mHO1PnsXJDSMDHemrCiLSJdORyoIxk1sNNvi74tsAn+AueguwqlxEdoWe
 YGDjiRamMLz1rM0++5ki
X-Google-Smtp-Source: AGHT+IHMok0RZ+xEpPKwmA/x6p5MJpbMNsZxQZEpx8+bc1wEOXS9InOWhw+MuPI9x2Y6TY782k+mrw==
X-Received: by 2002:a05:6a21:998d:b0:1ed:ac86:8f94 with SMTP id
 adf61e73a8af0-1ee8caac786mr8600343637.1.1739872343886; 
 Tue, 18 Feb 2025 01:52:23 -0800 (PST)
Received: from rock-5b.. ([221.220.131.19]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7324276171fsm10031640b3a.144.2025.02.18.01.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 01:52:23 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: cristian.ciocaltea@collabora.com
Cc: airlied@gmail.com, andy.yan@rock-chips.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 heiko@sntech.de, hjc@rock-chips.com, kernel@collabora.com,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 liujianfeng1994@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, robh@kernel.org, simona@ffwll.ch, tzimmermann@suse.de
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: Add HDMI1 PHY PLL clock source
 to VOP2 on RK3588
Date: Tue, 18 Feb 2025 17:52:16 +0800
Message-ID: <20250218095216.1253498-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <1b3234ce-4526-4735-b9c0-c242e6cc3cf0@collabora.com>
References: <1b3234ce-4526-4735-b9c0-c242e6cc3cf0@collabora.com>
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

Hi Cristian,

No matter one or two hdmi ports the rk3588 boards have, most of
devicetrees in mainline kernel only have hdmi0 supported. After applying
this patch their hdmi0 support is broken.

So I recommend moving the vop clk part to board level devicetree.
Then support of hdmi0 won't be broken, and board maintainers can add
HDMI1 PHY PLL clk when they are adding hdmi1 support. I can add support
for orangepi 5 max and armsom w3 for reference by other developers.

Best regards,
Jianfeng
