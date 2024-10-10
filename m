Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FF8998FDD
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 20:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2704C10E9AC;
	Thu, 10 Oct 2024 18:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Io5whw3+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70DF710E9AC
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 18:25:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 814BF5C5C98;
 Thu, 10 Oct 2024 18:24:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B32EC4CED1;
 Thu, 10 Oct 2024 18:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728584702;
 bh=yau4Zwwh28Xwhwp4/VRnZ6ioQPsselwwE4jb2ccYMUY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Io5whw3+2L2z8Atkhis7ywyJv283No3ZgR9QQJEjvkESrjz8kydFTGOPrm13QFj28
 F0dGD519bVrJ/oltrO37x0UdbWwbyPpstVxh5cZnQ8h8pLgMXydPA9kG8QVr8wDZsr
 83qs4gPGifnYf9nYVRF36IlzPVTf58fS0u/Pp2YxTytpjEuUhYb5SMDlLAz89EYPV0
 NZdzV9W2N8pDDVZgZ/z7h8bCj+qETyv6PQMbgA/vbcp+g+cnGo+hc0h70c7hXqXYnT
 hCGPSdTI1FEDE3bq4fqOsUmcD/w6wsxe4LfwGPmiPWxRTiVkFIjiU4/piG3oWOSFLn
 wQrMHfcKOlYzg==
Date: Thu, 10 Oct 2024 13:25:01 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jingoo Han <jingoohan1@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-watchdog@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v2 3/5] dt-bindings: nvmem: convert
 zii,rave-sp-eeprom.txt to yaml format
Message-ID: <172858469861.2207905.4713553771222478929.robh@kernel.org>
References: <20241010-zii_yaml-v2-0-0ab730607422@nxp.com>
 <20241010-zii_yaml-v2-3-0ab730607422@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-zii_yaml-v2-3-0ab730607422@nxp.com>
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


On Thu, 10 Oct 2024 11:42:40 -0400, Frank Li wrote:
> Convert device tree binding doc zii,rave-sp-eeprom.txt to yaml format.
> Additional changes:
> - Add ref to nvme.yaml.
> - Add reg property.
> - Remove mfd at example.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/nvmem/zii,rave-sp-eeprom.txt          | 40 ----------------
>  .../bindings/nvmem/zii,rave-sp-eeprom.yaml         | 54 ++++++++++++++++++++++
>  2 files changed, 54 insertions(+), 40 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

