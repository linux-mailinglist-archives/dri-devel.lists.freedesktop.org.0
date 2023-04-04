Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 711286D5616
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 03:29:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EFF910E2A3;
	Tue,  4 Apr 2023 01:29:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C46F10E2A3
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 01:29:47 +0000 (UTC)
Received: from [127.0.0.1] (unknown [62.91.23.180])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C8D8C85845;
 Tue,  4 Apr 2023 03:29:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1680571786;
 bh=gbq6LxJ70yRlWoo78r5KhyXKlWtf2AH4nfGXqfQ8mis=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QGMmZbtaS2vA6EsyDym/lkxVot4TIYwdANm1yDBK3bEuhSlj0Wsp3stFtuU0aJ4EK
 OdfMJ+9tf9pZoL0xzzb4TMCPw3mnfa9El3WDRdEEid85Co6IcRxo+dcRmfDCpYbt3H
 4cjukaejL6ZK4i/1HyQH5IpgkLOImw6sG9jJUgUssI3YGvsv9ieobNlGEEjGHvYig1
 DOjqyrxhNVF4zdUh25jQ7eJs7EVRuqRAzF8yaoYKCggUhuJV/45E1Zgx53eZYhp18Z
 jRdRpX8fFF5mkKRrh0RMGEVJJ5urXaltK0zkUfXyrhGAo0bUlcwG5rLRbO+9tUwrEe
 JV775G/l6X6ag==
Message-ID: <ca11e032-841e-c892-9ce9-0074b17ff88e@denx.de>
Date: Tue, 4 Apr 2023 03:29:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: ldb: Add i.MX6SX
 support
Content-Language: en-US
To: Fabio Estevam <festevam@gmail.com>, neil.armstrong@linaro.org
References: <20230330104233.785097-1-festevam@gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230330104233.785097-1-festevam@gmail.com>
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
Cc: Fabio Estevam <festevam@denx.de>, devicetree@vger.kernel.org,
 robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/30/23 12:42, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> i.MX6SX has a single LVDS port and share a similar LDB_CTRL register
> layout with i.MX8MP and i.MX93.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Nit: you are not adding 'support' for the IP here, you are documenting 
bindings in this patch. The support is added in 2/2 .

Reviewed-by: Marek Vasut <marex@denx.de>
