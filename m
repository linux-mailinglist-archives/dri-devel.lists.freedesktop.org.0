Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4919AFA649
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jul 2025 18:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24EB910E0A1;
	Sun,  6 Jul 2025 16:01:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="OwY2RPG9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC3D10E0A1
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Jul 2025 16:01:00 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 4490925D87;
 Sun,  6 Jul 2025 18:00:58 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UfGpzETI8X29; Sun,  6 Jul 2025 18:00:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1751817655; bh=QqDi1RStgwI7SrzAhimWgxfHUwpuVvnky+gt8gc+YsE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=OwY2RPG9td5uiPFxBjZ4I7dlIVsvfT4FKxJEKKMLY9Z+m/dF55l9G1/ltHlJIv7Vx
 c6g+UOgwLX2x/REBm/MFuXNRzyWTEF6oZ8tmMO9QbkoXNMsgDQSRgQHnacHqUOtj0n
 l4lu9kEgQ9qE0fS4WieBLDKfXayTvuZPDLWRP03G8udZ4B7qa2bgh++A7aOenCOGqf
 BuaGy4MMTKgQlPgyyM83CR6d6mWOzW3RQfKy3hn8zFUfGJlCrMRHmNFIxY/HivfRCC
 QPzDRGnRVvlu1buMJ4atFs5K9mBjp1Or8wxfBYQ7bN8Z3TsEKQOztQr8xT5BcX2f9L
 gEUk6WXymRf+A==
MIME-Version: 1.0
Date: Sun, 06 Jul 2025 16:00:55 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alim Akhtar <alim.akhtar@samsung.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Conor Dooley <conor@kernel.org>, Ajay Kumar
 <ajaykumar.rs@samsung.com>, Akshu Agrawal <akshua@gmail.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: display: samsung,exynos7-decon: add
 properties for iommus and ports
In-Reply-To: <32924ee3-2dcd-43bf-8dec-51f85675bee0@kernel.org>
References: <20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org>
 <20250627-exynosdrm-decon-v3-1-5b456f88cfea@disroot.org>
 <32924ee3-2dcd-43bf-8dec-51f85675bee0@kernel.org>
Message-ID: <4e5d50807f1ae86aaf0e3c351b230b1b@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
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

On 2025-07-06 07:33, Krzysztof Kozlowski wrote:
> On 26/06/2025 21:20, Kaustabh Chakraborty wrote:
>> @@ -80,6 +80,14 @@ properties:
>>        - const: vsync
>>        - const: lcd_sys
>> 
>> +  iommus:
>> +    maxItems: 1
>> +
>> +  ports:
> 
> This was supposed to be port, no?

Yes. You have reviewed this patch though, I didn't send a new rev
yet.

Either way, yes this should be port (since it has a single output
port).

> 
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +    description:
>> +      Contains a port which is connected to mic or dsim node.
> If you are using ports, then you need to list the ports.
> 
> Best regards,
> Krzysztof
