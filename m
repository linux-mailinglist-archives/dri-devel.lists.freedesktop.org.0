Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15117802EA4
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 10:33:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610EA89906;
	Mon,  4 Dec 2023 09:33:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91ACB10E327
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 09:33:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 32E4F60F9D;
 Mon,  4 Dec 2023 09:33:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C961DC433C8;
 Mon,  4 Dec 2023 09:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701682396;
 bh=OLgKUOugKFgYFsPGut4AFROJGSLz7qzRFgod5ywQIyk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IZLG7yVJvvNMyUOnjwpQdyXaRfaWRcPNXdBNXzHvnK5t8bWnWmm3r1KsxLOlvdauG
 uv1QJVjJ8jhYKS4jHPR0OzSMOYLwtb+6ZBVIVDhgPRhZXngLXTcY9IdTS8OYMeFl9Q
 pchG5LokbvHlbIxWiAmGPKn3X6b+nybVfodB5uXVnGDlndZkHGo+xGgqfUBlMlBJM/
 b4lVFfyh16qvzRIo8a4v3sRi1PCl7u6JDw8EP8cjwBuyULxvrT9NXpVEiTBAIRf6C7
 OMvlwSNkKl9hcNVA5avQ0WUXI50gikwZNCRi9BMy0KQ2AmiPoJQho+46GY8vGRgtNS
 uq/6h2eCHqd/g==
MIME-Version: 1.0
Date: Mon, 04 Dec 2023 10:33:08 +0100
From: Michael Walle <mwalle@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 01/10] dt-bindings: display: bridge: tc358775: make
 stby gpio and vdd supplies optional
In-Reply-To: <a7fa155c-39d3-4678-bd38-ea08d5f48adc@linaro.org>
References: <20231202075514.44474-1-tony@atomide.com>
 <20231202075514.44474-2-tony@atomide.com>
 <a7fa155c-39d3-4678-bd38-ea08d5f48adc@linaro.org>
Message-ID: <686bfc416ff8adb5ee73064386a42f11@kernel.org>
X-Sender: mwalle@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Tony Lindgren <tony@atomide.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Simha BN <simhavcs@gmail.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Merlijn Wajer <merlijn@wizzup.org>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Carl Philipp Klemm <philipp@uvos.xyz>,
 Neil Armstrong <neil.armstrong@linaro.org>, Pavel Machek <pavel@ucw.cz>,
 Sebastian Reichel <sre@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>> For a normal operation, the vdd supplies nor the stby GPIO is needed.
>> There are boards, where these voltages are statically enabled during
>> board power-up.
> 
> This means supply is still required.

You mean using fixed-regulator? I didn't consider that. But yes, you're
right.

-michael
