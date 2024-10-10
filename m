Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 733BE998FFA
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 20:26:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4CFA10E9B3;
	Thu, 10 Oct 2024 18:26:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cb3mnInv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D42310E9B3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 18:26:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 916945C5C5F;
 Thu, 10 Oct 2024 18:26:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71710C4CEC6;
 Thu, 10 Oct 2024 18:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728584793;
 bh=SLgQP4nHhIwWIByEbqhg5Xa/zjdOSYXWAONY+e2Leu4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cb3mnInvNxBWfb/GZNLMHTYIvTgm9DPUAvr/TkCs81u7z1g8hLi28Gy65d960EGw7
 AvbZ2YneI79Fobjv/NOKqkOI0LW+ftrNR8tY7Zeeqj8HKu9mCd1cFcAgMz9rVDSefg
 k25qGPIy3nvatlBnuSWGpkxIAKxxBbDWMHfg5MamBlTgBhfNfZNwFws7TrQ9O6xv5W
 tgEugf35Fif/Lc1muyihsEraMRkG0hSgj3bnOWdT+imsSTCbgGC5rsqIJlQevesj6B
 dEpD+D+irHjDI6JjflyS8Q56O6pDNLVnyNai9jq3xFCus+sJiGNFzG8tHm0g8sow8A
 qpgDOSkO+CDhA==
Date: Thu, 10 Oct 2024 13:26:32 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, devicetree@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 dri-devel@lists.freedesktop.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-watchdog@vger.kernel.org, linux-input@vger.kernel.org,
 linux-leds@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 4/5] dt-bindings: watchdog: convert
 zii,rave-sp-wdt.txt to yaml format
Message-ID: <172858479156.2210042.3356891364653702885.robh@kernel.org>
References: <20241010-zii_yaml-v2-0-0ab730607422@nxp.com>
 <20241010-zii_yaml-v2-4-0ab730607422@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-zii_yaml-v2-4-0ab730607422@nxp.com>
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


On Thu, 10 Oct 2024 11:42:41 -0400, Frank Li wrote:
> Convert device binding doc zii,rave-sp-wdt.txt to yaml format.
> Additional changes:
> - Ref to watchdog.yaml.
> - Remove mfd node in example.
> - Remove eeprom part in example.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/watchdog/zii,rave-sp-wdt.txt          | 39 ------------------
>  .../bindings/watchdog/zii,rave-sp-wdt.yaml         | 47 ++++++++++++++++++++++
>  2 files changed, 47 insertions(+), 39 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

