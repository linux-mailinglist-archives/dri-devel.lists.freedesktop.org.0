Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A84F9A5E316
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 18:48:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1673D10E079;
	Wed, 12 Mar 2025 17:48:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="GizcMUGG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4324310E079
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 17:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xp3gLFgNbMZ/DreQvGm1DbEMJH62eUysT4tsMiWqaik=; b=GizcMUGGEbFfEyiCsnNUwGGL/7
 EZoK23Zfk4OThPq4DsPD3IAkcouBIdJ8XnSeC9DqBjs/CME7VBgQJZ+Ui4jXnNDaF67OGcglnTaP2
 UgplFcVsMb/AbehtSts0QwXFpuwA7x5xfjHy7H6guweefqL9QwielWT9SHWbGaEOUYdp+F7QoTEL/
 7zTwwbfVJsxiZCCBKuf+RgDWIZB5qR9Zbqv/yoA9dJpiWnVfJZjrQpqH2OTM2BW+qdM0mYktMc6ic
 iuO0AeyExlpUnNEza3s6FPjhA8Erw1CNAWjt3fnCkyxfh6asUVNsGcbgprk1dnhib83iutmuaysT2
 dzTCqxQg==;
Received: from [189.7.87.170] (helo=[192.168.0.224])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tsQBT-007iUn-Uf; Wed, 12 Mar 2025 18:48:06 +0100
Message-ID: <9ce9cfb0-d1cc-4178-b7c6-468240014540@igalia.com>
Date: Wed, 12 Mar 2025 14:47:56 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] dt-bindings: gpu: v3d: Add SMS register to BCM2712
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Melissa Wen <mwen@igalia.com>,
 Iago Toral <itoral@igalia.com>,
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, kernel-dev@igalia.com
References: <20250311-v3d-gpu-reset-fixes-v3-0-64f7a4247ec0@igalia.com>
 <20250311-v3d-gpu-reset-fixes-v3-5-64f7a4247ec0@igalia.com>
 <20250311202359.GA54828-robh@kernel.org>
 <7324785d-8af9-48b4-b9c6-55ac22c82426@igalia.com>
 <20250312-independent-beaver-of-swiftness-1851c5@krzk-bin>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250312-independent-beaver-of-swiftness-1851c5@krzk-bin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Krzysztof,

On 12/03/25 06:06, Krzysztof Kozlowski wrote:
> On Tue, Mar 11, 2025 at 07:05:31PM -0300, Maíra Canal wrote:
>>>> +        reg-names:
>>>> +          items:
>>>> +            - const: hub
>>>> +            - const: core0
>>>> +            - const: sms
>>>> +            - const: bridge
>>>
>>> This is an ABI change because previously the 3rd entry was bridge and
>>> you moved it. Put new entries on the end to keep compatibility. If
>>> there's no users yet, then that's fine, but the commit message needs to
>>> say that.
>>>
>>
>> Again, I'm sorry about the naive question, but "bridge" is an optional
>> register. AFAIU if I add "sms" in the end, I won't be able to make
>> "bridge" optional. Am I missing something?
> 
> What do you mean by "optional"? You claim the same SoC has this
> registers on some boards and also does not have it on others, so is
> firmware locking the region? How does this register disappear on some
> boards?

I believe I was confusing SoCs with the V3D GPU generations. I'm sorry
about that and I'll address this issue.

Thanks for your patience through this reviewing process!

Best Regards,
- Maíra

> 
>>
>> Initially, I thought about using "enum: [ bridge, sms ]", but from
>> Krzysztof’s feedback on v2, I'm not sure if it is the correct approach.
> 
> Best regards,
> Krzysztof
> 

