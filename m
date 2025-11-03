Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6384C2E5B2
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 00:02:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0922B10E4D4;
	Mon,  3 Nov 2025 23:02:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="qvHnG+0W";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="LG78fYJr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C44A010E4D4
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 23:02:04 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4d0nCb37bGz9t7g;
 Tue,  4 Nov 2025 00:02:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1762210923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UGOoQVbgieRnz1Zi5mOVVFrbv65LoxKpvQB6dD1eaXY=;
 b=qvHnG+0WoaKQXtbJL5klMm80HXdEMR/yCPMt4cDpFjncDrFomRHYZgqTOWtdD7HHpCPG/A
 roSpkjXwDoikrh/cB549dRiyhdsuYBL0EvA6eiRDcxAw0/t/2LuuNFHVgwxmwOCZ6zdb2f
 c/Alsbxs8Sp3gmkGjbKv/s5b2LqhtRVnRf/+QIZP8SPqg+IaSSWIRh5wMTXrv2eFx64o9S
 de/cea7BYkx4eMELzz2g3aZbOHG1Z+OUS3ZRPJ13GLRaeHbmXrrty7aqQb/nSsx3XSc45b
 /PyTYk+niHl4yCs1eAhhJ4LvJk1p+OUgwx1mtyL+gR4lmEwP7sUDysBZ83XAnA==
Message-ID: <e1496b5f-2908-4398-8051-a136115c4a36@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1762210921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UGOoQVbgieRnz1Zi5mOVVFrbv65LoxKpvQB6dD1eaXY=;
 b=LG78fYJr85oLkt9Fyat0uzYqmNEbJtj/hmm8V3dsMQcplkLqfaHWqTvxtaoyAnvOvvRSfB
 ylc34n9DwlnwxKaJzfcG0be92Xyg1f9h5uB1GzQulEl4pjrE+7XVLv46sGexgMz6js5X9m
 vZbqjRxRb/1tbzvnZ+RC8dvObJELXhGwdwz4BiObU7ZyAdRGCjA5jrYHCayw9dkXI2KQdM
 D+W/Lzn2PiX1a/yQLIVaWgwhrLkCmY7BTCRqjwAyyUGqYKdgRaWGQU7aqehaJ/LEqNqBoQ
 SyesOL4YL15jJqT5UK0oJDStiGqaF3b5rgtvoaPfG7k+o0z0/w+5u7npNp0/fg==
Date: Tue, 4 Nov 2025 00:01:54 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: gpu: img, powervr-rogue: Document GE7800
 GPU in Renesas R-Car M3-N
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Frank Binns <frank.binns@imgtec.com>, David Airlie <airlied@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Conor Dooley <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Matt Coster <matt.coster@imgtec.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20251103200800.173440-1-marek.vasut+renesas@mailbox.org>
 <176220510312.151857.16110569802113794225.robh@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <176220510312.151857.16110569802113794225.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 67fa1408053679d5025
X-MBO-RS-META: 1p8m3picy9e98qxgrpbre48hu7k1nnmb
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

On 11/3/25 10:25 PM, Rob Herring (Arm) wrote:
> 
> On Mon, 03 Nov 2025 21:07:35 +0100, Marek Vasut wrote:
>> Document Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
>> present in Renesas R-Car R8A77965 M3-N SoC.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>> ---
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Frank Binns <frank.binns@imgtec.com>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Magnus Damm <magnus.damm@gmail.com>
>> Cc: Matt Coster <matt.coster@imgtec.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: "Niklas Söderlund" <niklas.soderlund@ragnatech.se>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: devicetree@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: linux-renesas-soc@vger.kernel.org
>> ---
>>   .../devicetree/bindings/gpu/img,powervr-rogue.yaml          | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml:107:1: [warning] too many blank lines (2 > 1) (empty-lines)
I suspect this is already fixed in a separate patch:

[PATCH] dt-bindings: gpu: img,powervr-rogue: Drop duplicate newline
