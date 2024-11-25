Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F639D895A
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 16:29:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4225610E2D0;
	Mon, 25 Nov 2024 15:29:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=marcan.st header.i=@marcan.st header.b="dJ+nWxZG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4602A10E2D0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 15:29:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 498E641A48;
 Mon, 25 Nov 2024 15:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
 t=1732548567; bh=mvds+Ny0lTliJWUMz64CS0VuR5pei/dhaTjax1anOBc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=dJ+nWxZGjxwcoLlWhkuPEQg/dDouRwFC78lnhdBZQnWhTG0+DEb29pZuEkPVatXAO
 B17tvlgEtOkPmf7FMEDBpGaDTCmu8s8Jba3RhjHX8UpaJint1QbDKH8Oj02dGK4Ke/
 7FsioU8y5MGI/h7P5eYFGL8GHYy+n1vQq42CEKb0GClQBN1i8EzbDlqOQO6Hw4A9qr
 cDKGp00yGAhdHLJtpZ9cRs8o1xIAJsmqxSxzHdluE2hLonH7xksXilHLQwK6u//oqV
 86s9/TdAUe09WziXe9mmDqPLYZ49vffCGw8Leo9QCCcgAlaBDLc6n/ct1MdXJ1uLyo
 DwYijr47s0TAQ==
Message-ID: <7fee8838-a365-4f33-a40f-26abab17d605@marcan.st>
Date: Tue, 26 Nov 2024 00:29:25 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindgins: display: Add Apple pre-DCP display
 controller bindings
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
 <20241124-adpdrm-v1-1-3191d8e6e49a@gmail.com>
 <ksdp54qj55v7igvvcshl6y2cxpmqy7rlsh4xsixpptjn7s7wlu@76ejtq6ytvbp>
 <a9d1568e-6240-49a4-b6a0-dcc0d9229eb1@marcan.st>
 <0dc16c95-6849-41c8-86da-d1c0c74cb3e4@kernel.org>
From: Hector Martin <marcan@marcan.st>
Content-Language: en-US
In-Reply-To: <0dc16c95-6849-41c8-86da-d1c0c74cb3e4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 2024/11/25 23:53, Krzysztof Kozlowski wrote:
> On 25/11/2024 15:14, Hector Martin wrote:
>>>> +
>>>> +  "#address-cells":
>>>> +    const: 1
>>>> +
>>>> +  "#size-cells":
>>>> +    const: 0
>>>> +
>>>> +additionalProperties: true
>>>
>>> This cannot be true. Must be false.
>>>
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - interrupts
>>>
>>> This goes before additionalProperties.
>>>
>>> Missing example: that's a strong NAK and prove that this could not be
>>> even tested.
>>>
>>> Do you see any device schema without example? No. Do not develop things
>>> differently, Apple is not unique, special or exceptional.
>>
>> Krzysztof, it is entirely possible to express this same feedback without
>> being condescending and rude. I'm pretty sure you can do better than this.
> 
> Please kindly trim the replies from unnecessary context. It makes it
> much easier to find new content.

Noted.
 > Instead of patronizing, note that this was just pure observation - this
> was done entirely than other bindings, which should be taken as an
> example. Or example-schema should be taken as example... Pointing out
> issues and inconsistencies is not rude or condescending. Basically now
> you are condescending people's feedback which further restricts review
> process allowing comments which you approve.
> 

No, that was certainly not pure observation. The observation is that the
schema was inconsistent with other schemas, and was missing an example.
The way you *expressed* that observation was unnecessarily rude and
condescending, both in tone and message. Usage of "NAK" is strongly
confrontational and discouraging to newcomers, and completely
inappropriate here because the intent of the patch is clearly fine and
it just needs some style and procedural issues fixed. "Do you ...? No."
wording is condescending, like you're talking down to a child. The
gratuitous Apple reference is completely unnecessary, implying we're
attempting to be a special snowflake in any (non-technically-justified)
way, never mind that none of us works nor has any professional
relationship with Apple.

Your observation and feedback could have been conveyed much more
appropriately, kindly, and effectively, such as:

==
The schema is missing an example. Examples are required for schemas, as
they are part of how the schema is tested by the automated tooling.
Please see other schemas and `example-schema.yaml` for examples on how
to do this, and `writing-schema.rst` for more information and how to run
the checks.
==

- Hector

