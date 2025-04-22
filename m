Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC45A95F7A
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 09:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 175D710E00C;
	Tue, 22 Apr 2025 07:32:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nHpod3zp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2CFA10E00C
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 07:32:33 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-39c1efbefc6so2826422f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 00:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745307152; x=1745911952; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1gFPbHcslBrShPBfeniLTCdmwDJynv5JMNyf9loIAkY=;
 b=nHpod3zpZYLwjx2QtqomaldXpandBXETmBf0s1BLtiKx2YBRMJrXILcEQdfbHRqqoT
 0wovGUmchmkEy1ylF5FSIZbG+Wkfw4SPgDSw7IEtK+DNIhQVQbH1am9vVtaFdXY65A0+
 H50VkyaO7pR3gPrHgiGHFuiGmCBNpHRTAoib+4W96P3epArUCbjmQa4TLuis0iQqjt2j
 jSK9yL68AWIBlhBfdBWFv2gMnBV3ZTgg6V5DePaNnZ+AY6NWFZfnNfwxbJurHv6jSdly
 YmiuZUYcwObAVfa6kwd9CEcJvb9x62+WVEewPes/OcN37p0jktvWBr7IHCyKg1dT4X70
 btKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745307152; x=1745911952;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1gFPbHcslBrShPBfeniLTCdmwDJynv5JMNyf9loIAkY=;
 b=deit31vhGmTmJ6YDlaqJ3Rq8pvOOJssibPEWeeUkkW41Xym3Mq3OBZR6j9OIpNlp3a
 bdSsFY6w0Tyz3L/khHTEB2QeorQxlMce+ZX2nRv8nJDLo1WYkSQNOoQC6Dlxs8/CgLMq
 DMERS2n4GHbXjob74fQLJrbNtBMC+i3jjqQDtZ0L1W89AQ3gOHBREu6doYk2jfdAnpJo
 8vxPuyJ/GpWZv7/XWJrZHGTx6Gt8IGxr0L0Y7kf/YqDBwsMGl1MtVyG+Tjm+t+YAxMbE
 MxWWrJ2iUKy04a4MRme9pJJ1IGWX7kAxxoD9PibV9muhwtEmeZxlFM7dVqU0m/tvS7XE
 4EuQ==
X-Gm-Message-State: AOJu0Yzc4K3/OazwD273tck9WgGq0iAZBDSMmY1qFDMXQoCLH68pirz0
 LCpfc01Jmw8i+f7Pjq72xMzQyNQPQA3G5yW7QWMLLDvV2QETq2IpPOpWyWB3pj0=
X-Gm-Gg: ASbGncs/RuPaoN5MaFKRp3sf3fnWd2KeygHpOsAejW9FVIZftiEhcUtgM/VpXxE7eqw
 Cbu17uVDBiougiKJri1GUhtPSclSVnz4gVxNuImeuacdMNLYtpp0kBOK7fPm7OY/UJxMzy9o3+r
 7UyXc7rLrGTVr1wk2DdkpIrhmvTv12GPqrq/RBq+iL7JtWXY9Mus8Hedoc3lavvA5N3oKkoGy5B
 iifSC6Z4SL/GcIls3ffAZpjx8uk1Lj37PX3/hNED9H7P/tC8LcDiY28FICjonvqzpxQdkesfM01
 n/TOU19Xzazb9eLv/VbCpw70vTF4CLmIOKgdod1H1q+xo3rI9zvfLnDmg9TfIQ==
X-Google-Smtp-Source: AGHT+IFclT1+OQXEDIxxx/AMqrjY/N1Yvy1xLXDrMHQkl58h0kU69MTBU2hwvhAytgvH99PcAzfK0g==
X-Received: by 2002:a5d:648c:0:b0:39c:1f02:449f with SMTP id
 ffacd0b85a97d-39efba26220mr11676730f8f.2.1745307152441; 
 Tue, 22 Apr 2025 00:32:32 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa43c079sm14450855f8f.50.2025.04.22.00.32.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 00:32:32 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: christianshewitt@gmail.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250421201300.778955-1-martin.blumenstingl@googlemail.com>
References: <20250421201300.778955-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH RFC v2 0/2] drm/meson: vclk: revert and re-fix vclk
 calculations
Message-Id: <174530715197.2805907.16376775353354108716.b4-ty@linaro.org>
Date: Tue, 22 Apr 2025 09:32:31 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

Hi,

On Mon, 21 Apr 2025 22:12:58 +0200, Martin Blumenstingl wrote:
> This is a successor of a previous patchset by Christian [0]
> 
> Patch 1 reverts a previous fix for loss of HDMI sync when playing YUV420
> @ 59.94 media. The patch does resolve a calculation issue. It also makes
> all fractional rates invalid which is a bigger problem.
> 
> Patch 2 changes the whole drm/meson driver to use Hz as unit for clocks/
> frequencies. And importantly it uses the relevant 64-bit maths helpers so
> the code can still be compiled using for 32-bit ARM.
> Maxime previously suggested using drm_hdmi_compute_mode_clock(). That's
> still something to implement with future patches.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/2] Revert "drm/meson: vclk: fix calculation of 59.94 fractional rates"
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/f37bb5486ea536c1d61df89feeaeff3f84f0b560
[2/2] drm/meson: use unsigned long long / Hz for frequency types
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1017560164b6bbcbc93579266926e6e96675262a

-- 
Neil

