Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C973BD91D4
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 13:52:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED3510E5BB;
	Tue, 14 Oct 2025 11:52:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="cNL5UimL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E63510E5B2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 11:52:09 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cmCHp4c8bz9twV;
 Tue, 14 Oct 2025 13:52:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760442726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w3BLcmVUVGLpFJRX39w4eFwRPegwyahQOD0DU9dd3LU=;
 b=cNL5UimLZlsis2oIWIfiLbCo2w/5oP6hHGeuaEqAclU0/h0l571JrergmmbeF2eFDQpHgr
 gLQuhoqvqoea62NmAq0ufs4m7LgjpT6VshSnuGJdP8PAp8WoT9zb23olnX9EkfRNGINmRP
 BAom4KpXpWXaQhdfUmDsKgFT7px+ZRxyTssg9inIZ9xNz9WWllunwlB+f6hlHxKuXkvdBr
 +PREv7fSxh3Kw3YF711QVvObkRiWqzQJrXurwdJkaPpjrhJShQV5OmAfrABL8jFtYCppzi
 GH/0XrK0MDheq+MoZFw0ouWTy4DAMz2xGwAVMgdc+P04oTP5V2lOExkjap0IWg==
Message-ID: <260b4db1-c02a-48a0-baf8-5e217c729824@mailbox.org>
Date: Tue, 14 Oct 2025 13:52:02 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 03/39] dt-bindings: display: imx: Document i.MX95 Display
 Controller processing units
To: Frank Li <Frank.li@nxp.com>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-4-marek.vasut@mailbox.org>
 <aO0tmUWA5H0J80Ov@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aO0tmUWA5H0J80Ov@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 582067c29d1c33a4667
X-MBO-RS-META: cmy55i75tfkwaedpgnmschc4jpxirtkc
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

On 10/13/25 6:49 PM, Frank Li wrote:

Hello Frank,

>> @@ -90,13 +102,15 @@ patternProperties:
>>         compatible:
>>           const: fsl,imx8qxp-dc-signature
>>
>> -  "^tcon@[0-9a-f]+$":
>> +  "^tcon(@[0-9a-f]+)?$":
> 
> why here allow no address unit tcon?
This might be something Liu can clarify too.

TCON on iMX95 DPU does not seem to exist at all, or at least has no 
control registers. Hence no address.
