Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B58AD76D5
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 17:48:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F340010E3E6;
	Thu, 12 Jun 2025 15:48:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="EhaVwYzy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13FDB10E3FD
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 15:48:01 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 0A7E020E0F;
 Thu, 12 Jun 2025 17:47:57 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4mesmEwELGLl; Thu, 12 Jun 2025 17:47:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1749743276; bh=4iM7zmuPUf9/Qs9KMOpsA1dmBtwaQ4menK+lVoGxf18=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=EhaVwYzyKgp3gkwAQfsv5Av+wTExf9CyxeL8j5A7GT+E/MIcE6ptznsyRdBNbu+66
 Y4GbQ/Jj6lLwIJPcO8c0LyxPe113Vmt3xStr12FIqhW6y3tJTBPE0ye+f0OvnUTcCy
 cQC5pw1wqUNF9UzRh5a2Z+B4S/hu0BU9/TEejAYj7VhpVvoZdr2D90ViXKLPXfLIO3
 n/s9w8Y32x8wxrXZVzG7tx2eMoz4x54I7wNLH9iSfuKc7jsQ4VmUbKi2XgDLIE+lE9
 +JlKtFipe8c3DKMQbfrG0aypgU2KIzU8ncz8rryJLc4BRMQcgkLLvkJlnOtWxKtlpn
 gpbYLW5acYeQA==
MIME-Version: 1.0
Date: Thu, 12 Jun 2025 15:47:55 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Conor Dooley <conor@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: document Synaptics TDDI
 panel driver
In-Reply-To: <20250612-agency-mothball-3830177fd43b@spud>
References: <20250612-panel-synaptics-tddi-v1-0-dfb8a425f76c@disroot.org>
 <20250612-panel-synaptics-tddi-v1-1-dfb8a425f76c@disroot.org>
 <20250612-agency-mothball-3830177fd43b@spud>
Message-ID: <2d8714983c484fe34313efe1dbabf2bd@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
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

On 2025-06-12 15:32, Conor Dooley wrote:
> On Thu, Jun 12, 2025 at 08:09:40PM +0530, Kaustabh Chakraborty wrote:
>> Document the driver for Synaptics TDDI (Touch/Display Integration) panels.
>> Along with the MIPI-DSI panel, these devices also have an in-built LED
>> backlight device and a touchscreen, all packed together in a single chip.
>> Also, add compatibles for supported panels - TD4101 and TD4300.
>> 
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>>  .../bindings/display/panel/synaptics,tddi.yaml     | 92 ++++++++++++++++++++++
>>  1 file changed, 92 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/display/panel/synaptics,tddi.yaml b/Documentation/devicetree/bindings/display/panel/synaptics,tddi.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..3aae1358a1d764361c072d3b54f74cdf634f7fa8
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/synaptics,tddi.yaml
> 
> File called synaptics,tddi
> 
>> @@ -0,0 +1,92 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/panel/samsung,tddi.yaml#
> 
> id of samsung,tddi
> 
> [...]
>
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - syna,td4101-panel
>> +      - syna,td4300-panel
> 
> compatibles are syna,td####-panel
> 
> These should be consistent and tooling should have complained about the
> mismatch between id and filename at the least.

Hmm, I don't recall seeing any errors. Do I pick any one then? Or is there
any other generic way?
