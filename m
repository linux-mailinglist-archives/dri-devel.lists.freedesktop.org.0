Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEAD9D9343
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 09:27:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E73F10E7DF;
	Tue, 26 Nov 2024 08:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linumiz.com header.i=@linumiz.com header.b="oUmp80/1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from omta40.uswest2.a.cloudfilter.net
 (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F70E10E786
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 03:46:17 +0000 (UTC)
Received: from eig-obgw-6005a.ext.cloudfilter.net ([10.0.30.201])
 by cmsmtp with ESMTPS
 id FfoFtQZkVvH7lFmWntqOz7; Tue, 26 Nov 2024 03:46:17 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182]) by cmsmtp with ESMTPS
 id FmWktf3XpxK8vFmWltR2z3; Tue, 26 Nov 2024 03:46:16 +0000
X-Authority-Analysis: v=2.4 cv=T/9HTOKQ c=1 sm=1 tr=0 ts=67454488
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8
 a=Uhfq17CCtucz6BUgXkYA:9 a=QEXdDO2ut3YA:10 a=rsP06fVo5MYu2ilr0aT5:22
 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
 ; s=default;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EpVOpGc4bJDTukR4641wyoZUQ4tkmW15trkijARXKjE=; b=oUmp80/1hLyTPIV/hVQpxZ79Y/
 gJSI0jk/GnzimzQi+FvvxMT8ObK3qQFjXdUblR6oWeKbqu0LRORQceJJ6atxp9+WaIqHs/Ivw/LRV
 9H9teytC78wPq2Y8+YE6PEjUPRYq0kPl6/BxIU3z46s51nBUXZ8MDBSVuYg/sc5BbG+qj5zpKDHR8
 28DgJW4lWsTjsqvefcup0KcP4lTx8J07KKB3OXrFFjC+KPQRjEE0a5hqtrKQ241TO9FgtX7ZrzM14
 phf7hHHDnHpgynzGbGChboT/YjRTjzBqAv9ysTY3lxB0pPfH9/VZoiyB6fNWDO81leXjCgnf101fi
 bHblG8sA==;
Received: from [122.165.245.213] (port=40090 helo=[192.168.1.5])
 by md-in-79.webhostbox.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <parthiban@linumiz.com>) id 1tFmWe-003Oct-33;
 Tue, 26 Nov 2024 09:16:08 +0530
Message-ID: <ec0c0a4f-9555-42bb-adac-3ba574fe82cc@linumiz.com>
Date: Tue, 26 Nov 2024 09:16:05 +0530
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
To: Conor Dooley <conor@kernel.org>
References: <20241125-pvr-reset-v1-0-b437b8052948@linumiz.com>
 <20241125-pvr-reset-v1-1-b437b8052948@linumiz.com>
 <20241125-dress-disliking-2bf22dd4450e@spud>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <20241125-dress-disliking-2bf22dd4450e@spud>
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
X-Exim-ID: 1tFmWe-003Oct-33
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.5]) [122.165.245.213]:40090
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 3
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfI7X99zQNxGkTA/w5HhOMSfUAMbp3zNn98KowvXN7R2oKKSM+kB2NrFhUDxExbBlV4ElL402VsP5mkDQxMqzgMHFwam38R2J2pq+bbIbirGm57SGI/VN
 rhpr+0hHuCnylWkOaIn4Ahq2OT0fUrqVmndWZaYPRQGAjsupXPOeHnTWGTIe5leSfwc7pONGc1Pt42oOoMJcmJURySYDmrhKr/4aYiZ27wjvTIrTo3mBMOi7
X-Mailman-Approved-At: Tue, 26 Nov 2024 08:26:46 +0000
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

On 11/25/24 11:37 PM, Conor Dooley wrote:
> On Mon, Nov 25, 2024 at 10:07:03PM +0530, Parthiban Nallathambi wrote:
>> GE8300 in Allwinner A133 have reset control from the ccu.
>> Add the resets property as optional one to control it.
> 
> There's no specific compatible here for an a133, but the binding
> requires one. Where is your dts patch?
A133 GPU is still work in progress in both Kernel and Mesa3D. Also power
domain support needs an additional driver.

But reset control is independent of those changes. Should reset control
needs to be clubbed GPU dts changes?

Thanks,
Parthiban
> 
>>
>> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
>> ---
>>  Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>> index 256e252f8087..bb607d4b1e07 100644
>> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>> @@ -37,6 +37,9 @@ properties:
>>    power-domains:
>>      maxItems: 1
>>  
>> +  resets:
>> +    maxItems: 1
>> +
>>  required:
>>    - compatible
>>    - reg
>>
>> -- 
>> 2.39.2
>>

