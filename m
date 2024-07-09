Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D99D492BCA5
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 16:16:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C120B10E055;
	Tue,  9 Jul 2024 14:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="h5sBXcK+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0010110E055
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 14:16:19 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id CFBC3885CF;
 Tue,  9 Jul 2024 16:16:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1720534578;
 bh=j8uH5LAqoGEHnE0i2h70/qLLtUa4idrvgO0Or56fKwE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=h5sBXcK+Co55wCMMwagBGX7JKSszZM7MNPT8jFFyRWLz9842GsMso0IRTgUX+kwIw
 2Kq/McQRYspT+6Z6QDz4qETUSI3W21jaPNmzSPcIkUTNcOL5Gd2996hid5tpgAsWbE
 cXjiAmSR0dQqY1oyQgAUCGSR3Vwt6gvk1NUhZqUqWkUELk/C029+lzRf7siOVwIdey
 QobNnpiRHgQEvwl9D9tUpYm7qcyKNCNlOpOP3LMEc19hcQht1Mq3jOYRjVFJtu1NvU
 T32nfkhREUUScQepqN6eEgiQ+R6sLcrQaQ65sA72+O2wY8T4+MqrbcliFAkHRQUNDx
 brugWrEj1LQVA==
Message-ID: <944ecc41-9ef7-4d9e-9d96-3c5c0cdb71b5@denx.de>
Date: Tue, 9 Jul 2024 15:24:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: display: bridge: ti,sn65dsi83: add
 burst-mode-disabled
To: Stefano Radaelli <stefano.radaelli21@gmail.com>,
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 "Noah J . Rosa" <noahj.rosa@gmail.com>, linux-kernel@vger.kernel.org
References: <20240708151857.40538-1-stefano.radaelli21@gmail.com>
 <172045725750.3389992.15451403448241421795.robh@kernel.org>
 <CAK+owohBrewYFpDKjsE5iWC5OQ3p6S_9fwj7DWa1Ux2h8CXcAw@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAK+owohBrewYFpDKjsE5iWC5OQ3p6S_9fwj7DWa1Ux2h8CXcAw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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

On 7/9/24 2:45 PM, Stefano Radaelli wrote:
> Hello everyone,

Hi,

> Thank you a lot for your prompt feedbacks.
> I'm really sorry for all the mistakes, it is the first time that I try to
> submit a patch and i thought I followed the guideline but clearly that was
> not the case.
> 
>   @Marek Vasut <marex@denx.de> About your question to why disabling
> burst-mode:
> - I agree with you that Burst Mode is the preferred way to send data. For
> that reason I created the new flag in a way that, if not used in dts, burst
> mode remains active by default.
>    However, I decide to introduced this property because I have noticed that
> some dual-channel panels work better in non-burst mode (even if less
> efficient), and since the sn65dsi84 datasheet allows this setting, I
> thought to give this opportunity to users.
>    What do you think about it?

Are there any further details, which panels behave this way ? Does your 
DSI host generate correct HS clock, ones which the DSI84 expects to 
receive on the DSI side ?

Such link mode properties would have to be generic properties placed in 
some dsi-client.yaml file in any case, such properties are not specific 
to this DSI8x bridge.
