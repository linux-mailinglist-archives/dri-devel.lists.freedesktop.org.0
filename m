Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B72B53899
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 18:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B57310E101;
	Thu, 11 Sep 2025 16:03:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CtPosWMR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F4F610E101
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 16:03:40 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-45de287cc11so11704305e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 09:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757606619; x=1758211419; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kV+vM5AtMDqiziiosp5lKYMmFySjFk/a9glOkvxYm9c=;
 b=CtPosWMRtK4RorIAAVuYACfxK22p4SbI0BX442SKpO9Rlcy24SYcN4FbTbfVNdQf5C
 khF+Yu7GJhiEJtliYtQEvM+ZOW5M5UsGFs66h++eqFIihkd8kt6zwaZdpUZwNZB2bO3N
 NZzC8Jq0uus3UuYZIIZW3y6XEtEVj5PDZ9ITPNp0zCOFMm71DCTH77uPGuCF4PCAGDOS
 2+17AIeuFWwr7w1fBujQCijqyuPl9F+5M4ucZ788kg34WdONvzD6yilZsIrtsYsXZhuF
 u95/O4+NjIM/S3ptOGL7epSn4b+6eRXFExf5/zd3/DU5a2WQgO4+CCYI3f77l6ODt0sW
 E4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757606619; x=1758211419;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kV+vM5AtMDqiziiosp5lKYMmFySjFk/a9glOkvxYm9c=;
 b=PlqbG/fRXJ/0q8LmHq8J1xJXVQI5/v/1CoqAIvLU39iMr+V9TopQeT0zRPyiFjkN53
 OUsDf8V87J+KJwDEPboPtzi6/kQ+7lXRIDlaosJKTbSDJ/O7G3wj4LVj59lAtS7tD5D9
 u3fVjL0CdgYIxw05Tq2R8sY4fyLESsQz6O8KskF0NT8Efon3U1ZJoy+4NA3tCSsSBir2
 wfYRjJFCT7r+g9oeYwrllRLIoG03aaCDc9+/9IPBvPxUad7IBRFUIhLGvgQj91oi2DH/
 4mcayEZB7lBkkwkuDchiptEzN48rZ2K5cMg6BJ6RbWFmvd/135yZ2jzZiV4ruai33IvG
 hz0A==
X-Gm-Message-State: AOJu0YzuQHq0sKoQq4rjASGHC13LSrBSNW4NCb2Ao4fYKUeqWNbw9+Ir
 HlKTU4W29/FLTddFd2K7WJnoKq2oGZN7SUmzJojAqMb4+OjWJcwbmLj7
X-Gm-Gg: ASbGncvMEnuL6RWdfWsAfmcUeOCxZlFM+Lh4D7d4Qz5/spzG47h9CJfmiRey+MtWRGd
 oJ6mCf+G5u6lndNyomodEzq50rmZniVvJnRUunvj/7oBLSQppBR2s2byuxyS75JBcQHOvgzqpU/
 QVzaLl+TBmJbxIGcoJFblXP+i1ElWs1+ORB5iLKATKM6ZZ9pHTQDf0uYa0zqJf3AIkGKIGaUIlT
 DKWlAHoyDbHcHrriWUvC1uDfzzfcE8QvAuTh3pBdLJ76uCkOAgehp8FKpoCGnVfeBO/1dT7bkMB
 FJOisucrdeD4nxpwJxboeqhAlk8WllGSarJwFtK3GON+TIxshoiFe/PP/AYjBo5Vt7hvE+orVPp
 bdD2KISYD9j09S8MG9GtwdqbtrtOXAEElSUuXJah/9RUAXBL+ZQdPrlv7eifjAdZZsKn4yALVWf
 iDNRMNwtj5U1dKLQ==
X-Google-Smtp-Source: AGHT+IFkmvpn+ZMkR/ME/h210TOWfj/zRgJxKTOHh3DWlG10Yj3oOfPv3c1/HhofEdM287nETYtnIw==
X-Received: by 2002:a05:600c:5d1:b0:45d:d86b:b386 with SMTP id
 5b1f17b1804b1-45dfd5eec3bmr25128185e9.14.1757606618353; 
 Thu, 11 Sep 2025 09:03:38 -0700 (PDT)
Received: from localhost
 (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45e017c0643sm30454515e9.23.2025.09.11.09.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 09:03:37 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>,
 =?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: (subset) [PATCH v2 00/23] tegra-video: add CSI support for
 Tegra20 and Tegra30
Date: Thu, 11 Sep 2025 18:03:30 +0200
Message-ID: <175760648464.2794963.6510932759569440897.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250906135345.241229-1-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>


On Sat, 06 Sep 2025 16:53:21 +0300, Svyatoslav Ryhel wrote:
> Add support for MIPI CSI device found in Tegra20 and Tegra30 SoC along
> with a set of changes required for that.
> 

Applied, thanks!

[12/23] dt-bindings: display: tegra: move avdd-dsi-csi-supply from VI to CSI
        (no commit info)

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
