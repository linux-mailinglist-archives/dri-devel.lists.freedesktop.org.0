Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3689C7982D8
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 08:56:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E4F10E0DD;
	Fri,  8 Sep 2023 06:56:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1483 seconds by postgrey-1.36 at gabe;
 Wed, 06 Sep 2023 23:54:45 UTC
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 524F410E202
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 23:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TjTUB0cvCFiEoE/LE/coauJxSKtR6oNTse5HzAq7szs=; b=Us66Fsg9c0WQtH2J+hJRt4tqje
 +zH2lcwAQpZykucVF1FC582LKw8GrBIVCVteuQlyijoovucl/PJJNKt4nSWWshMQVOHFyQ7KhPQDa
 frrvzGI2GstQ0Jrut+A/5c06Wg5PmZyd/tMD07mD9mvo58TCPfY85dG6hn5+lG3Aa5Kgc7kyDHLfG
 8cRopYhWxHErY2lCuL6L1LsUgslWpkHLDvsS146at0zqjMPQ/mgdAY5Itab9DLBdGf4BSr6cArR53
 J/7hPVEgqIGaWX9PVD//7STqNE3yVYQnuXhkuSw2FjcQVvHrRXMYZVf7SvaA3MhXsFKQ+Of+9atJU
 6BL0jjaQ==;
Received: from ip98-183-112-25.ok.ok.cox.net ([98.183.112.25]:39068
 helo=[192.168.0.142]) by vern.gendns.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <david@lechnology.com>) id 1qe1y2-0005rT-0q;
 Wed, 06 Sep 2023 19:29:59 -0400
Message-ID: <bf1b80c1-0499-ebf8-969c-7d9c40538c65@lechnology.com>
Date: Wed, 6 Sep 2023 18:29:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/2] Add st7735s drm driver and Winstar panel
Content-Language: en-US
To: Stefan x Nilsson <stefan.x.nilsson@axis.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20230906-st7735s-v1-0-add92677c190@axis.com>
From: David Lechner <david@lechnology.com>
In-Reply-To: <20230906-st7735s-v1-0-add92677c190@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id:
 davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Mailman-Approved-At: Fri, 08 Sep 2023 06:56:24 +0000
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
Cc: devicetree@vger.kernel.org, kernel@axis.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/6/23 11:22 AM, Stefan x Nilsson wrote:
> Add a new driver for the Sitronix st7735s display controller
> together with a 0.96" 80x160 color TFT display by Winstar.
> 
> The driver is very similar to the st7735r driver, but uses a
> different pipe_enable sequence and also allows for an
> optional regulator to be specified using devicetree.
> 

Can this panel be used with the generic "panel-mipi-dbi-spi" driver?

more info: https://github.com/notro/panel-mipi-dbi/wiki

