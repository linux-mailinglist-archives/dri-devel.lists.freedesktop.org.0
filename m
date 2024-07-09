Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E26492C52D
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 23:13:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE8DF10E00F;
	Tue,  9 Jul 2024 21:12:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="E6m/rBvf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B7210E00F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 21:12:57 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A81EA87919;
 Tue,  9 Jul 2024 23:12:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1720559575;
 bh=1noTMqY/rG3qSD8Wta99giMVhqcbXHJ0pLLor4uc6z0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=E6m/rBvfqIXAVMElepNFtOiMpn9+X3EsvyHC6aK3G5jL0yMQGgoCrxXl8fDkbc4mX
 aHf54Bv/xpF/b3/ak6COaOHwf6kNOfnVXcuvLMhp9vg+F2722O0bzc2wqAjejP9luw
 39ssu2GPwh5aHTbCoozbXGFSsE9CIMnW8QsUWsRy0pKc9xNkD2tdMmB/KYwnpJSgB8
 CnePzCGe2P7VL58OK0BLIgn6zAUVdKsirgJ9KxwrE4W5MHmnuzLxx/a13R4ICOF0Oi
 pPZQByDve4Hv9DGImZwx0OK1HmcmvbAe15hkjk0ygJkB43p3OgrGuYn7sGoWzxzyUa
 brXcXUkcESYSA==
Message-ID: <8ae33208-3273-4bca-8371-6fc1ef50061f@denx.de>
Date: Tue, 9 Jul 2024 22:25:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: display: bridge: ti,sn65dsi83: add
 burst-mode-disabled
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
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
 <944ecc41-9ef7-4d9e-9d96-3c5c0cdb71b5@denx.de>
 <CAK+owoiQY8OYiZofyq4jj2S3Mg6ub88DF5V52JcppxhWbUsWgg@mail.gmail.com>
 <223b287f-4da6-4ec1-be7c-6135215c5551@denx.de>
 <CAK+owogLctqu17cFEQH+258wrpfMJ4iE6iJABRu5dwxDtR21EA@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAK+owogLctqu17cFEQH+258wrpfMJ4iE6iJABRu5dwxDtR21EA@mail.gmail.com>
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

On 7/9/24 7:30 PM, Stefano Radaelli wrote:
> Okay, I get it.
> 
> So if you think this mode shouldn't be implemented within this driver, we
> can close the thread.
> Just for information, this driver has been implemented from the work done
> by Compulab (as it says in the driver's initial comments), and they do not
> put the burst mode by default, not even giving the possibility to activate
> it by dts:
> https://github.com/compulab-yokneam/imx8-android/blob/master/o8/vendor/nxp-opensource/kernel_imx/0055-sn65dsi83-Add-ti-sn65dsi83-dsi-to-lvds-bridge-driver.patch

This is not the mainline Linux driver.

> The panels that I've had these problems with are some of JuTouch's
> 1920x1200, for example JT101TM015 , and I solved it by giving the option to
> remove this mode.
> I have also heard from other colleagues who have had the same problem on
> some dual-channel displays.

Does that problem happen with the aforementioned driver or the mainline 
Linux driver ?
