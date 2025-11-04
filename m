Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 503DBC30F93
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 13:25:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B81410E25F;
	Tue,  4 Nov 2025 12:25:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="g+G8rnjd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="BqWrGpiH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCBB910E25F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 12:25:32 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4d172g3pLNz9tR4;
 Tue,  4 Nov 2025 13:25:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1762259131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OQNURhsm7+otyKWxbaJyu299VPuCIPdmcaTYfoL8RWc=;
 b=g+G8rnjd9PTtirRXTlc2fbxyKmgglE9u3/DSyal2w6a915fKI1Yhgq3iB5Uq40EToF951K
 8Oo8QVLegZc+0xUuVzu+DHmly43QVnQr5j8JkEWamhr9X3x+sCdRnsw3BEieThBGlXU2Sy
 ogVSMdhwBTR2cZLPbvPAK4KNIW5aeeVg4JefTsTSGomCChG+sUp5fPWvvCMrgBwxQAfD2R
 gfW8PdB5aJ1mPoon96BFTdSSp5FQHOIQex6igesKl+jg7XR1EsZBTfe16Tt6vsTJakV7g7
 +OdCagH67R7XDuzP6VakeWB8jGjoT+gjFcrvYEJayM/WVvvnMvJjsFMixxEPVQ==
Message-ID: <1353f904-aa15-4e24-9e43-7b91185bba17@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1762259129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OQNURhsm7+otyKWxbaJyu299VPuCIPdmcaTYfoL8RWc=;
 b=BqWrGpiHMXDX7WMtb2foX5OjYRO809BJEiC8EP+awuR7sKqdSZsZAGTm2UIFe4+AXYWsiP
 vSvyaTtaOZIoQ+tazkYd2bUdzlEG5hGJV4thzV8MxAR9UutQObInfREd6VLd2F1f5OLkEO
 Sg51sFLu+PFp5PalM8i9OxzdIFqTXFyREnVfvo4BX489TWhA78q2ASHWYu7bosAMw7pCeX
 cOxX5mWIQYkfVyC7lqAYnLmPdb6RjalZc3w7wqRtORFo7+IZwRX9ZgJDybLjBDIseeoLZ/
 dAYiAAWDuHSRz5ojQSg9y1YJZ9sy7oMxQgUqkQmfXg71Mj9T93bpiGtC1VnVRw==
Date: Tue, 4 Nov 2025 13:00:38 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: gpu: img, powervr-rogue: Document GE7800
 GPU in Renesas R-Car M3-N
To: Matt Coster <Matt.Coster@imgtec.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20251103200800.173440-1-marek.vasut+renesas@mailbox.org>
 <10e39887-02b2-41bd-9ed1-f54481a3578c@imgtec.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <10e39887-02b2-41bd-9ed1-f54481a3578c@imgtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: fi8weceksjtk1u8hozc8d9rra6f6bbax
X-MBO-RS-ID: bcb4be923019a510140
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

On 11/4/25 12:52 PM, Matt Coster wrote:

Hello Matt,

>> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>> @@ -19,6 +19,10 @@ properties:
>>                 - renesas,r8a77961-gpu
>>             - const: img,img-gx6250
>>             - const: img,img-rogue
>> +      - items:
>> +          - const: renesas,r8a77965-gpu
>> +          - const: img,img-ge7800
>> +          - const: img,img-rogue
>>         - items:
>>             - enum:
>>                 - ti,am62-gpu
>> @@ -105,6 +109,7 @@ allOf:
>>           compatible:
>>             contains:
>>               enum:
>> +              - img,img-ge7800
>>                 - img,img-gx6250
> 
> Can you put these in the same order they're declared above? The way I
> read it, the order is img,xxx in generational order followed by
> soc-specific entries in alphabetical order (which is why we have
> img,img-gx6250 before img,img-bxs-4-64 below).

In this enum, the entries are (should be) sorted alphabetically .

Do you want to sort them generationally instead ?

>>                 - thead,th1520-gpu
>>       then:
>> @@ -134,6 +139,7 @@ allOf:
>>           compatible:
>>             contains:
>>               enum:
>> +              - img,img-ge7800
>>                 - img,img-gx6250
> 
> Same again, otherwise lgtm.
Please see above.
