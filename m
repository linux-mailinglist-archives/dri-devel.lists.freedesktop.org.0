Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C30BD0676
	for <lists+dri-devel@lfdr.de>; Sun, 12 Oct 2025 17:52:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1350210E170;
	Sun, 12 Oct 2025 15:52:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="uNz2uPcJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1063010E170
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 15:52:24 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cl4jw3qzSz9tTK;
 Sun, 12 Oct 2025 17:52:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760284340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=neqAsnNDMRMx/Htt8KicS7vRg22+z4O6QaJ/GuwKbVA=;
 b=uNz2uPcJLJj6s7WPnyG5MmAhgwf6gm4X6hmhd7pVscNphAAKTMjYodc5Lcz/UeY6MhlI2K
 +bSsD01hmma5iMH2Qr3O0MNrbIWrvzYpeuR0F+xbXnV7W+wUfy7T1OskTWn288aUDLsmEW
 kP5BSbYXsTr0u4GPQAA9iwnRdUAXdSAp8Klmtplp/mjrbJKOZ2w97JVO/yJgaXUlEpQGeD
 30pOc22qfNM38LanlVuHU8ptm4E9IP3ra3PxaTkBXXcw7HC5N6XZu5O1BRymWP6Hi4wwph
 uQ9qc2/Iy/73mBWQb2/Xt3T3gOR83D/7DrYe98Z1zoJjfn9QbofaGPRUwUA/Qw==
Message-ID: <c0e6abf1-9800-451d-bbc4-a070253a3d66@mailbox.org>
Date: Sun, 12 Oct 2025 17:52:16 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] drm/panel: ilitek-ili9881c: Turn ILI9881C_COMMAND_INSTR()
 parameters lowercase
To: Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org
Cc: Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250904205541.186001-1-marek.vasut+renesas@mailbox.org>
 <175930287176.425863.10274979935592534719.b4-ty@linaro.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <175930287176.425863.10274979935592534719.b4-ty@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: etqeq58q81jsjnxamdrsrxwm46zuer8c
X-MBO-RS-ID: c5f8110e907efe1075d
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

On 10/1/25 9:14 AM, Neil Armstrong wrote:

Hello Neil,

> On Thu, 04 Sep 2025 22:55:15 +0200, Marek Vasut wrote:
>> Make all ILI9881C_COMMAND_INSTR() parameters consistently lowercase.
>> No functional change.
>>
>>
> 
> Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)
> 
> [1/1] drm/panel: ilitek-ili9881c: Turn ILI9881C_COMMAND_INSTR() parameters lowercase
>        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/02b6babf22eb60d86b4030f08204f6e7853da4e0
Please pardon my ignorance. Is this supposed to be in linux-next by now, 
or will this show up after rc1 is out ?

Thank you
