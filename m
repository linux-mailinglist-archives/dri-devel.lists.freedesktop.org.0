Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4CA99EFCC
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 16:40:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC47C10E06C;
	Tue, 15 Oct 2024 14:40:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bmvoxCXy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91EFC10E06C
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 14:40:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9626A5C118F;
 Tue, 15 Oct 2024 14:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C0CC4CEC6;
 Tue, 15 Oct 2024 14:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729003229;
 bh=k9GQx+65Wq20zwo6mDcDTXDu7hgnpwGe16oAYfUcGic=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=bmvoxCXyzcuHs8IaLgwXNaQEAqgjuR/4aetJoBgdpYzKbLTzcUPgGVYOrsRPXrBKr
 pxcF7tQMT47Cb4gixPqGeGYtnRn8aYBQy4Q1eaB8g3diTGYLGK1C6XLmMBKjzOJEN3
 nKndgNEAjLPO8Hkl4oMGKW9pjBzNNqL7wsuq5ziwCJD8FP75q73oySRmkjk2s59D/P
 HwCVsA56BjDlG9g+LgrpgR9FS+lZ0G0K93Y6MpA8eM5qVKu6P9dov0QUQz6a1Cfqvb
 puc2AirCy8snCK4bExieqHJBO6O+6aUANCrSktdpKhLlHWMH30yD4dwfwsTUSozHpX
 vC2csQrdiQ7aA==
From: Lee Jones <lee@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Frank Li <Frank.Li@nxp.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-leds@vger.kernel.org, linux-watchdog@vger.kernel.org
In-Reply-To: <20241010-zii_yaml-v2-5-0ab730607422@nxp.com>
References: <20241010-zii_yaml-v2-0-0ab730607422@nxp.com>
 <20241010-zii_yaml-v2-5-0ab730607422@nxp.com>
Subject: Re: (subset) [PATCH v2 5/5] dt-bindings: mfd: convert
 zii,rave-sp.txt to yaml format
Message-Id: <172900322623.629898.5064045014135877171.b4-ty@kernel.org>
Date: Tue, 15 Oct 2024 15:40:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
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

On Thu, 10 Oct 2024 11:42:42 -0400, Frank Li wrote:
> Convert device binding doc zii,rave-sp.txt to yaml format.
> Additional change:
> - ref to other zii yaml files.
> - remove rave-sp-hwmon and rave-sp-leds.
> 
> 

Applied, thanks!

[5/5] dt-bindings: mfd: convert zii,rave-sp.txt to yaml format
      commit: f4b00ab2c29960961f9641be8f3e8ba4960fd849

--
Lee Jones [李琼斯]

