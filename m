Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC257139C66
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 23:26:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 789326E181;
	Mon, 13 Jan 2020 22:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 363436E181
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 22:26:22 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00DM0VWX053559;
 Mon, 13 Jan 2020 16:00:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1578952831;
 bh=h30FkLQxpT0s2f9FS/yiLRSqFGFXrqsriFcLOq47z28=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=CO36YNzavPNrUWISmqiu3nSpHhO0jzgPdudzYgEYdyQptk92DZK79W5UNIrozc02H
 z+NKerOCIMPNQu5inkgH2ibXQ1vO721vydKPVGtrsXwSI7lGPgKhYVdin5qwMw+GFr
 KwBozDBFvi0kkF+91WJ6R7+KVq7cDmd6cxQCeUeI=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00DM0VKZ054106
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 13 Jan 2020 16:00:31 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 13
 Jan 2020 16:00:30 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 13 Jan 2020 16:00:30 -0600
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with SMTP id 00DM0U0v010298;
 Mon, 13 Jan 2020 16:00:30 -0600
Date: Mon, 13 Jan 2020 16:04:16 -0600
From: Benoit Parrot <bparrot@ti.com>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH v5 1/5] dt-bindings: display: ti,k2g-dss: Add dt-schema
 yaml binding
Message-ID: <20200113220416.geymiqy4iueypf7n@ti.com>
References: <cover.1576857145.git.jsarha@ti.com>
 <a89be75beefdc4e9ab5f194495b49f3538c9fc5e.1576857145.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a89be75beefdc4e9ab5f194495b49f3538c9fc5e.1576857145.git.jsarha@ti.com>
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
Cc: devicetree@vger.kernel.org, yamonkar@cadence.com, praneeth@ti.com,
 dri-devel@lists.freedesktop.org, peter.ujfalusi@ti.com, robh+dt@kernel.org,
 tomi.valkeinen@ti.com, laurent.pinchart@ideasonboard.com, sjakhade@cadence.com,
 sam@ravnborg.org, maxime@cerno.tech
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jyri Sarha <jsarha@ti.com> wrote on Fri [2019-Dec-20 17:55:09 +0200]:
> Add dt-schema yaml bindig for K2G DSS, an ultra-light version of TI
> Keystone Display SubSystem.
> 
> Version history:
> 
> v2: no change
> 
> v3: - Add ports node
>     - Add includes to dts example
>     - reindent dts example
> 
> v4: - Add descriptions to reg and clocks properties
>     - Remove minItems when its value is the same as maxItems value
>     - Remove ports node
> 
> v5: - itemize reg and clocks properties' descriptions
> 
> Signed-off-by: Jyri Sarha <jsarha@ti.com>

Reviewed-by: Benoit Parrot <bparrot@ti.com>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
