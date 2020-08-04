Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A5923B91F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 12:53:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 116576E15A;
	Tue,  4 Aug 2020 10:53:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F236E15A
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 10:53:04 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 074AqhDO042528;
 Tue, 4 Aug 2020 05:52:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1596538363;
 bh=uQ6uxpNiZLjJQRFzCMp3WoZnRXMhwKvSfyOXHQtKZdM=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=SqQd/ZVzprUjNAWwBMTgs61R8Zl7ON7vns2piEKwU5vctP/m1qVN1D+OR5m3H0+hU
 P1jZ6qRJQceBYnoVri49CeRarEqEJnpVYdrwhJsomE/brzXvdEb/DOGtFDxGvHw6FV
 9Iys7+6Dqb0SPrZmPsJjbQd5r9tSDUeF6imm5M5U=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 074AqhKH047438
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 4 Aug 2020 05:52:43 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 4 Aug
 2020 05:52:43 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 4 Aug 2020 05:52:43 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 074Aqe1e080855;
 Tue, 4 Aug 2020 05:52:40 -0500
Subject: Re: [PATCHv2 0/4] Subject: panel-dsi-cm: update bindings
To: Sebastian Reichel <sebastian.reichel@collabora.com>, Sebastian Reichel
 <sre@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Tony Lindgren
 <tony@atomide.com>
References: <20200716125733.83654-1-sebastian.reichel@collabora.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <7f414246-3a7b-a6f6-fff3-7ca883d52103@ti.com>
Date: Tue, 4 Aug 2020 13:52:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200716125733.83654-1-sebastian.reichel@collabora.com>
Content-Language: en-US
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
Cc: devicetree@vger.kernel.org, kernel@collabora.com,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sebastian,

On 16/07/2020 15:57, Sebastian Reichel wrote:
> The cleanup series for omapdrm's DSI code got too big. Reviewing
> this is not fun and the same goes for keeping track of the change
> requests. Let's do the cleanup in smaller steps instead. This is
> the first batch, which updates the binding (txt -> yaml) and
> modifies the DT slightly.
> 
> Changes since PATCHv1 [0]:
> 
> PATCHv1..PATCHv2:
>  * Update binding as suggested by Sam
>   * Remove 'port' from required list
>   * Drop 'lanes' and 'port' from example ('lanes' is a port property
>     used by OMAP's DSI controller)
>   * Drop the label from example
>   * Add '...' at end of file
>  * Fix , in patch description from patch 2
>  * Apply Reviewed-by tags
> 
> [0] https://lore.kernel.org/dri-devel/20200629223315.118256-1-sebastian.reichel@collabora.com/
> 
> -- Sebastian
> 
> Sebastian Reichel (4):
>   dt-bindings: display: panel-dsi-cm: convert to YAML
>   ARM: dts: omap: add channel to DSI panels
>   ARM: dts: omap4-droid4: add panel compatible
>   ARM: dts: omap4-droid4: add panel orientation

For the series:

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
