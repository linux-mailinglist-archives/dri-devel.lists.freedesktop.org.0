Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8CEBCF3E7
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 12:53:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2980410E274;
	Sat, 11 Oct 2025 10:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="fve4MErz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10DD710E274
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 10:53:40 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ckL7h05P2z9tCk;
 Sat, 11 Oct 2025 12:53:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760180016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cET2HC+7vrNrLy9D4JAd65Kczd4lwCNYCnv06jKL71s=;
 b=fve4MErzyatUtq4fK/pZqeWJ0IROlfMPj0YUTLVH196Q2qB2w7aQS+J10BzZkfO23zwPsS
 WgXM+f7G7O4P6JLDn8yqeJciIKYYrSTqM4nsTwSgd4EWDoT53twVL/eO8yDHR3m8fPOs6a
 /iGLCp2/5y6MeJdtreqJGlzb+1BRw0e9KY9ak50T0heKE+vvMYz7YzP2TfgcSOMSeSA6Fu
 2+GAZFBUaxfiPrOUcVT+rc2zsJu/DC3pnxAJ2ippOLF6Voz7bl+54irST5A3YSaWBxKmLM
 qVljdkOdy8HrdAaS8bqSTm2JFsTBjnXiu6JLV8qyyO5ligdSjOkwIp5fbojbYA==
Message-ID: <ba95487c-ada7-48a4-90b7-fd99a0278f51@mailbox.org>
Date: Sat, 11 Oct 2025 12:53:29 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/2] arm64: dts: imx95: Describe Mali G310 GPU
To: linux-arm-kernel@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
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
References: <20250925203938.169880-1-marek.vasut@mailbox.org>
 <20250925203938.169880-2-marek.vasut@mailbox.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250925203938.169880-2-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 308735b9ca49f66d617
X-MBO-RS-META: 7yn9f7gznupwzzxdktpfnnjhbjkkresu
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

On 9/25/25 10:38 PM, Marek Vasut wrote:
> The instance of the GPU populated in i.MX95 is the G310, describe this
> GPU in the DT. Include dummy GPU voltage regulator and OPP tables.
Is there still anything that should be changed with this patchset, or 
can it be applied ?
