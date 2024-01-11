Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA48B82A996
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:51:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7188110E853;
	Thu, 11 Jan 2024 08:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B5310E7F3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 07:49:07 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3373a30af67so4508396f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 23:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704959345; x=1705564145; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qk9dZVvi6gHkjFeJ5PX82VCiMGv5t62l2L7jmHeGkeA=;
 b=NntEexGdPEG7B/YtQP6ZpiwYE/rseXJHW2ufAtTlvWe3cymZLF9n2mDaqIzvie+J/r
 3LjJYTkPKPD3eGeEFcyMfVkmFcBSRnrVBLwam+pMjJ4ZkxHJzzM2Bbs6Ms3mFTpYg3fl
 zvvU8koBKTyxeaQWlj241KWgtk4lqjv7CfPzuiLq04pB2dVTk9v8TZguJdTVnmbmtpnG
 uqwPactD0NcjziWDcuSRfnoEfG7n7shcXDCqA300CLqR3RuVwB9o9g3BwHwJ0/772QvI
 J7Q9LijCJGir5k4Vd5Td7oOAiutzpKbxCsgg1hVH04jX9UcSVE7qV2xgj/7mRnlBbdYE
 ChGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704959345; x=1705564145;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qk9dZVvi6gHkjFeJ5PX82VCiMGv5t62l2L7jmHeGkeA=;
 b=kBaBWTqGYTNGYJhK7XyLMYZv0MjRfjLZ4KMxu5cLeKi5CISaDXJobnBTB+CFFAawUJ
 S2CnSwOBcX/BAooEUAxCmjvpMuudm4FwS97v6752RODvMaDyBWoWIeHU2n86l0Je4IGL
 WgYH4kX0itbaWpaRV9SdJl6NaHav237a+F+iwEHS5KCYpVfTJi54kJ2PEXUZxPP8YjEn
 Z3i1PKZ2IUoD28AEOjgmDM0ykO2kfC4tZgCSpDInpgvQeycE6bfLVM/9nsDdJp6nYXkH
 TlQzq4XUy3za3B7yDZ/yI1HFHDGY0TRYBXfOmt67GzJPB4rsXxk8RDgAXLjcXAyBHMAY
 rM4w==
X-Gm-Message-State: AOJu0Yz27YyIE+nQf/CPnACYASTFmF0jXxAHS9hiTlIanDx9YPswMOah
 GqRUdkATqeX+Ga3zDPY8Y0Y=
X-Google-Smtp-Source: AGHT+IEmMY747/wijgSOZkIcHgbbGJbAg6gFpoMer7lIwceByScxrgsHHuGDCvigc8RSL8hweM2J1Q==
X-Received: by 2002:a5d:43c5:0:b0:336:841c:c358 with SMTP id
 v5-20020a5d43c5000000b00336841cc358mr201118wrr.155.1704959345254; 
 Wed, 10 Jan 2024 23:49:05 -0800 (PST)
Received: from PCBABN.skidata.net ([91.230.2.244])
 by smtp.gmail.com with ESMTPSA id
 o12-20020a5d474c000000b00336aac53e75sm474657wrs.97.2024.01.10.23.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 23:49:05 -0800 (PST)
From: Benjamin Bara <bbara93@gmail.com>
To: aford173@gmail.com
Subject: Re: [PATCH V2 1/2] dt-bindings: phy: add binding for the i.MX8MP HDMI
 PHY
Date: Thu, 11 Jan 2024 08:48:59 +0100
Message-Id: <20240111074859.907558-1-bbara93@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240106221907.325127-2-aford173@gmail.com>
References: <20240106221907.325127-2-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 11 Jan 2024 08:50:44 +0000
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
Cc: kishon@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 vkoul@kernel.org, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 linux-phy@lists.infradead.org, festevam@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Adam,

there is already a V3 by Lucas available here[1].

I just noticed that the new PLL config has some common registers and is
therefore smaller, most likely there are other changes too.

Thanks for picking this up again,
regards
Benjamin

[1] https://lore.kernel.org/linux-arm-kernel/20230906184211.1857585-2-l.stach@pengutronix.de/
