Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A3A57E494
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 18:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2577B112EB8;
	Fri, 22 Jul 2022 16:41:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1478 seconds by postgrey-1.36 at gabe;
 Fri, 22 Jul 2022 16:41:23 UTC
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DCBB1122EE
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 16:41:23 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26MGGL52061918;
 Fri, 22 Jul 2022 11:16:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1658506582;
 bh=08PwfHBp1fRyc02qP294VlTMgUbHFS8jzINDzdDZnxc=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=DyD146mnXS6SnL91b4jDyoEvMxap92DghfdyWRa6UQTDYylbwrmLImf1YJomfvkAn
 DDWy1vsLJy0v4AlFCzxd8lglpHv9ZQ2Rg/MENCCKDbGnlrPEaKTHBbtp3W5YOlcf3l
 IzwGK/3a90lphq6ZflVziQzQhEhTgJz1A92HuKLc=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26MGGL7N018124
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 22 Jul 2022 11:16:21 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 22
 Jul 2022 11:16:21 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 22 Jul 2022 11:16:21 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26MGGLwu121736;
 Fri, 22 Jul 2022 11:16:21 -0500
Date: Fri, 22 Jul 2022 11:16:21 -0500
From: Nishanth Menon <nm@ti.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/8] dt-bindings: display: ti,am65x-dss: Add port
 properties for DSS
Message-ID: <20220722161621.p35apy5mstpgqhef@reverence>
References: <20220719080845.22122-1-a-bhatia1@ti.com>
 <20220719080845.22122-2-a-bhatia1@ti.com>
 <20220720232845.GA4164694-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220720232845.GA4164694-robh@kernel.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Krunal Bhargav <k-bhargav@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Tomi Valkeinen <tomba@kernel.org>,
 Devicetree List <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Darren Etheridge <detheridge@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Rahul T R <r-ravikumar@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17:28-20220720, Rob Herring wrote:
> > On the bridge side R0->R2, G0->G1, B0->B2 would be tied to ground.
> > The bridge sees 24bits of data,  but the lsb's are always zero.
> 
> Unless the bridge ignores the LSBs, that's not the right way to do 16 to 
> 24 bit. The LSBs should be connected to the MSB of the color component 
> to get full color range.

I unfortunately cannot point specifics without violating NDAs, so
will just give a broad perspective.

Correct, this is not ideal, but in certain scenarios with limited
pins (due to iovoltage groups), we are indeed starting to see this
kind of usage model starting to pop up. Tradeoff is in a limit on
image quality, but that tends to be acceptable in certain lower cost
solutions.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
