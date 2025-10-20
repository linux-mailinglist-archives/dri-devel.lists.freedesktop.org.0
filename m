Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBFABF2153
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 17:25:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE6A10E46A;
	Mon, 20 Oct 2025 15:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="DgsHzTC8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D2910E46A
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 15:25:29 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cqzlB5141z9spn;
 Mon, 20 Oct 2025 17:25:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760973926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PC4va8ieZUTwiJKFjsYUc7GcnfemHB6ncy9oeGC6/CI=;
 b=DgsHzTC8vUoQttocqBG7Rb3P6fORbPUaL1HS+TClgbD4WCuDuScV1SUv6EeodBiOHdzCov
 ABI9ec3z2KkzHVIUpO29I9NVD+HkLoeyLwfqGKDQErvlvrl35szgbbUWn92JT1LyFblCHI
 +Aiy1I4AGs0lO4CeUsjyFynwV30IsExl7xh6cx0JImy36XG8fsJ94iCUz8URzMc1nu9y2m
 rxD/2CHMHBvgbE6xkw5774ibSJtGA3a37+NiHPYM8iOZxRehpKq8GugWVERhRUR4/ZxrGm
 xmJ30rAd3gNpTz1OoZcy9MzuiS1EtXJk0lwui5e0L5rGl38CqU2zGxwHTBA4uQ==
Message-ID: <2e12fed7-21c0-48bf-94c4-a3d2850a3f0c@mailbox.org>
Date: Mon, 20 Oct 2025 17:25:22 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] dt-bindings: gpu: img, powervr-rogue: Rework the allOf
 section
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20251018130147.12831-1-marek.vasut+renesas@mailbox.org>
 <20251018130147.12831-2-marek.vasut+renesas@mailbox.org>
 <a6d42c7e-1146-4bda-baf6-be04f3185c5a@imgtec.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <a6d42c7e-1146-4bda-baf6-be04f3185c5a@imgtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: a475670c6e47efa9a9d
X-MBO-RS-META: 36hnykyaspk5t54jm87kde8k79k5kbzw
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

On 10/20/25 5:12 PM, Matt Coster wrote:

Hello Matt,

> On 18/10/2025 14:00, Marek Vasut wrote:
>> Rework the current allOf: section such that all handling of
>> clocks/clock-names properties happens first, and all handling
>> of power-domains/power-domain-names happens second.
> 
> The original layout of the allOf: section was power-domains first, then
> clock-domains. The actual ordering really doesn't matter, but I wonder
> if it would make for a slightly cleaner patch to do it that way round?

It would, but I also wanted to sort this DT part alphabetically.

If you want, I can split this patch in two, one which does this 
splitting, and one which does alphabetical sorting.

[...]
