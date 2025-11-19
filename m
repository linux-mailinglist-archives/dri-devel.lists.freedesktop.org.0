Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B346C707B3
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 18:35:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 121CA10E24D;
	Wed, 19 Nov 2025 17:34:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="WHjH6S8E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF8710E24D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 17:34:56 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dBTBj0Z4wz9tH7;
 Wed, 19 Nov 2025 18:34:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1763573693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d7DjuaJPWcETZ1BexKkq1MHxDnEIhEMitdG38RRXcQI=;
 b=WHjH6S8ESGByKl/O/KwaDe6G2Tvvl5q3caVr6qlZuksDsp/DwOKBHTrxofXW2BEDn/tnwl
 L+9eYypQu3P4YLegrs9sdKNx280lnZ8shAJkggHxUcvPhDwsHtJKf0iqMmIxMmFHSUxwWA
 b0+ezok5Ow07/nDu3a3hMvc+1vrldol3f5pX4HWZYS86M8qSl7vHkNEgdFmwHzvwplBY0+
 HPSCvTWPfh+i05qlKHtVhzBxETEFe8datCe4BNgejZMUNWVQncD4qxBsQEp9NRSb/ydzkd
 5MThOY6Eu8CwAIVIH7DzxJbEoqPrsToqIlMKElDewFvMshUZnHTmXbEz7Keobg==
Message-ID: <c85e39b6-4e5b-4bbc-b1b6-7f910c8f06d8@mailbox.org>
Date: Wed, 19 Nov 2025 18:00:55 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v4 2/2] arm64: dts: imx95: Describe Mali G310 GPU
To: Shawn Guo <shawnguo2@yeah.net>
Cc: linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, "Jiyu Yang (OSS)"
 <jiyu.yang@oss.nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Xianzhong Li <xianzhong.li@nxp.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev
References: <20251102160927.45157-1-marek.vasut@mailbox.org>
 <20251102160927.45157-2-marek.vasut@mailbox.org> <aRnBqgzeotfrdNmy@dragon>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aRnBqgzeotfrdNmy@dragon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: xfg6n8nhyrnhx6yqpdx41yjpkht33zzw
X-MBO-RS-ID: c077a67f0eb4f199681
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

On 11/16/25 1:20 PM, Shawn Guo wrote:
> On Sun, Nov 02, 2025 at 05:09:07PM +0100, Marek Vasut wrote:
>> The instance of the GPU populated in i.MX95 is the G310, describe this
>> GPU in the DT. Include dummy GPU voltage regulator and OPP tables.
> 
> The commit log seems need an update for the regulator part?
The patch seems to be already in next, but if it can be somehow respun, 
I can do that ?
