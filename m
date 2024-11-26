Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 961159D950A
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 11:02:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E59A10E03B;
	Tue, 26 Nov 2024 10:02:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linumiz.com header.i=@linumiz.com header.b="f4g0+9GD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from omta038.useast.a.cloudfilter.net
 (omta038.useast.a.cloudfilter.net [44.202.169.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 963AC10E808
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 09:42:27 +0000 (UTC)
Received: from eig-obgw-5005a.ext.cloudfilter.net ([10.0.29.234])
 by cmsmtp with ESMTPS
 id FhwptPcSeg2lzFs5Stomwv; Tue, 26 Nov 2024 09:42:26 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182]) by cmsmtp with ESMTPS
 id Fs5QtSIcNjcdmFs5Rtnt4z; Tue, 26 Nov 2024 09:42:25 +0000
X-Authority-Analysis: v=2.4 cv=DrWd+3/+ c=1 sm=1 tr=0 ts=67459801
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=-pn6D5nKLtMA:10
 a=f_B5aOHfkBoSN7RXA7sA:9 a=QEXdDO2ut3YA:10 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
 ; s=default;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yZTKBGpgZf4XrglD2qS6e5aAZ3GC73kLE5Jc5m/+dAo=; b=f4g0+9GDPOzz75ZfRU1iGvo9Da
 Kd3j9Kp8gp9z2h+xkawGHunTbemVrWVs1y3BuhTJBH22jkZkQdgk7ih6zbaZemLd+6BTB9cili7+9
 dX6mf8b1mPr3+ubA/7Js6NT01UIGsRh4SKmMXDuRly4UNUMOBDMk7TF/khDM1yXWIojaRgd5B/Kc7
 14dWo43PqSCvvBFDsRWwZeNulxnBk08XylH/+f4b1JBnsxGr5omZkJL4yXTX42gZNfzvRc8maoXqs
 AzaHjW95uuCygwuAkftjrxOF7kxeRmj+Q2zX1X0qpfepyN9abHp/HYm9znxkf9l19xl8UQci45sHB
 zKD9lOkw==;
Received: from [122.165.245.213] (port=37436 helo=[192.168.1.5])
 by md-in-79.webhostbox.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <parthiban@linumiz.com>) id 1tFs5H-0042ui-2L;
 Tue, 26 Nov 2024 15:12:15 +0530
Message-ID: <34590e17-92be-405e-a072-e86d0dcb7234@linumiz.com>
Date: Tue, 26 Nov 2024 15:12:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: parthiban@linumiz.com, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: gpu: add reset control property
To: Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor@kernel.org>
References: <20241125-pvr-reset-v1-0-b437b8052948@linumiz.com>
 <20241125-pvr-reset-v1-1-b437b8052948@linumiz.com>
 <20241125-dress-disliking-2bf22dd4450e@spud>
 <ec0c0a4f-9555-42bb-adac-3ba574fe82cc@linumiz.com>
 <42a9cd04-135b-40e9-ab42-a4a4a4f3ae27@kernel.org>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <42a9cd04-135b-40e9-ab42-a4a4a4f3ae27@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1tFs5H-0042ui-2L
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.5]) [122.165.245.213]:37436
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 4
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfFBpyj/FDJz1FKfM3r5PbHTc8g9aY5RCTQDGilrojybn2aTD4b3tjDAaif1sZelDsLIBeY+/Ciw9NXJYS+eb/ExcmglORYHt3dqyO+Md5AWb1cJSfiPT
 GHZO5R9RnYkKoEe7B3wvsEGleO3PNrbxuawnVAGz1A5DmxnqNKPx1je84HXOtiKW7bsYD42b6K8QONd7aDBzI9xkVJU09p4jVCKogLHspJbpppav7h0KOG+X
X-Mailman-Approved-At: Tue, 26 Nov 2024 10:02:25 +0000
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

On 11/26/24 3:02 PM, Krzysztof Kozlowski wrote:
> On 26/11/2024 04:46, Parthiban wrote:
>> On 11/25/24 11:37 PM, Conor Dooley wrote:
>>> On Mon, Nov 25, 2024 at 10:07:03PM +0530, Parthiban Nallathambi wrote:
>>>> GE8300 in Allwinner A133 have reset control from the ccu.
>>>> Add the resets property as optional one to control it.
>>>
>>> There's no specific compatible here for an a133, but the binding
>>> requires one. Where is your dts patch?
>> A133 GPU is still work in progress in both Kernel and Mesa3D. Also power
>> domain support needs an additional driver.
>>
>> But reset control is independent of those changes. Should reset control
>> needs to be clubbed GPU dts changes?
> How is it independent? Are you adding it for the new platforms? If yes,
> then it is part of new platforms. Don't add properties which are not used.
Thanks for the review. Will address the points together when adding support
for GE8300 GPU.

Thanks,
Parthiban

> 
> Best regards,
> Krzysztof

