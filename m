Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2FEABA5FC
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 00:39:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E812910E083;
	Fri, 16 May 2025 22:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="gkwgkjXl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49229.qiye.163.com (mail-m49229.qiye.163.com
 [45.254.49.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D41210E9CF
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 07:44:48 +0000 (UTC)
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-1-entmail-virt204.gy.ntes
 [58.22.7.114]) by smtp.qiye.163.com (Hmail) with ESMTP id 15447ed97;
 Fri, 16 May 2025 15:44:39 +0800 (GMT+08:00)
Message-ID: <e86fec57-de90-4663-9a32-7c50a97cde67@rock-chips.com>
Date: Fri, 16 May 2025 15:44:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] dt-bindings: display: rockchip: Convert
 cdn-dp-rockchip.txt to yaml
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chaoyi Chen <kernel@airkyi.com>
Cc: Dragan Simic <dsimic@manjaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250513011904.102-1-kernel@airkyi.com>
 <20250513011904.102-3-kernel@airkyi.com> <2745929.KRxA6XjA2N@diego>
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <2745929.KRxA6XjA2N@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGk1CSVYfSkIdGBlLTh1JTx5WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
X-HM-Tid: 0a96d80d673803abkunm2d3213c01ca95b
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nz46DAw6PzExCDYqMTgUPBhC
 ExAKFDJVSlVKTE9MSENKT0NNSExLVTMWGhIXVRgTGhQCElUYEx4VOwkUGBBWGBMSCwhVGBQWRVlX
 WRILWUFZTkNVSUlVTFVKSk9ZV1kIAVlBSU9CTzcG
DKIM-Signature: a=rsa-sha256;
 b=gkwgkjXlmwVOg3emov54bWNmQ1ubniLLIoSOjKfg5mEc2hU3kFdn4I0DELqTTHGZzUfzNtVeSguuROWSIs1v6ZOmVpJ6jgtcIbG7x7OJVOObwxO0Tig8aeQYt4seLgQYX2Mqt0TfWExTJl7lmSJgHfz6iavTQYvq2y6wMuO+jiU=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=FmRZQYKpsA98XcslpEE/kRwKmHDbWxw0f+hVuWfJG/g=;
 h=date:mime-version:subject:message-id:from;
X-Mailman-Approved-At: Fri, 16 May 2025 22:39:47 +0000
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

Hi Heiko,

On 2025/5/15 21:00, Heiko Stübner wrote:
> Hi,
>
> Am Dienstag, 13. Mai 2025, 03:19:04 Mitteleuropäische Sommerzeit schrieb Chaoyi Chen:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Input of the CDN DP
>> +        properties:
>> +          endpoint@0:
>> +            description: Connection to the VOPB
>> +          endpoint@1:
>> +            description: Connection to the VOPL
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Output of the CDN DP
>> +
>> +    required:
>> +      - port@0
>> +      - port@1
> you're adding the 2nd port (port@1) as output port, which has not been
> part of the old binding. I think this warrants an explanation in the
> commit message on what it is meant to contain.

This is mainly to keep consistent with the binding style of other 
display interfaces, which all have an Input (port@0) and Output (port@1).

This change has no effect on the driver.  I will explain this in v4.


