Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C578131B7B
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 23:30:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370CE6E573;
	Mon,  6 Jan 2020 22:30:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-oln040092069108.outbound.protection.outlook.com [40.92.69.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B013B6E560
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 22:30:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LWbWkvP1kxmYbCfU2UMeb91u3Q5HxDNPhlKHYZG36YzsWio+oWe4wz0tcGegpBzhC+knbpUcutomibzTI6QCzBVGUSTD1cSwDq2TLUMzny6LFEKlcLtNvmpWYXqAtTgTelatdGglPMav0qPUM10rw+tGE+IVaDqqswnVXNK0bpSen02UtNHOCNckLSrcKsfMsNi1MsSBfftZw+Ab+Sk1Rzx2hvLFfPQNbxYpUosso0dUrW7d9NmTXivxpL/D8by+4Ki15pe58lxZ2pGX1YmRnR4l+ejWwveOd1OsodW5xYCBY7m7/zAqzVGhu5+/sWgKW9dvWO1FYgveIIMtt0qF0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lpZyFJhgV62Xk2/ve2t+2Zk3hy8H1vUs/nVV4KEnhfg=;
 b=mexjhlx0B856Z3p4FZcdAILM83k3Nk5mtfBjm/1FNTexcHO+AB2jGL2tNZt83UGRSvTdjlsf+ygxU5fiXPOVRUrbyvVuRlxjGW6AKS1QUZW25zJNRIAO/uDjv0XdYPssF+tQFk2vgVBfUJaJ40dar1VqlBnjQkTjv371p5HhQGahhMdiyxNZnk3jSKTEOMxP1g0K7Gi+wkhQthfynggQwmmG7h6kKg923n7GmfQgpDjw7ImKC8PkIOGF3J0pGbI+kzxeRJag05wQcggBBoqTkHpB1T1sNEYJ/7whtgetvCQL6M/Fu58l3P+wrbF36eajn5aAi/6ceh32VntU1cLERg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from HE1EUR02FT041.eop-EUR02.prod.protection.outlook.com
 (10.152.10.52) by HE1EUR02HT111.eop-EUR02.prod.protection.outlook.com
 (10.152.11.233) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.11; Mon, 6 Jan
 2020 22:30:29 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.10.56) by
 HE1EUR02FT041.mail.protection.outlook.com (10.152.11.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.11 via Frontend Transport; Mon, 6 Jan 2020 22:30:29 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b957:6908:9f62:c28b]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b957:6908:9f62:c28b%5]) with mapi id 15.20.2602.015; Mon, 6 Jan 2020
 22:30:29 +0000
Received: from [192.168.1.14] (98.128.173.80) by
 AM6P191CA0106.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.12 via Frontend Transport; Mon, 6 Jan 2020 22:30:27 +0000
From: Jonas Karlman <jonas@kwiboo.se>
To: Neil Armstrong <narmstrong@baylibre.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v6 4/4] drm/bridge: Add the necessary bits to support bus
 format negotiation
Thread-Topic: [PATCH v6 4/4] drm/bridge: Add the necessary bits to support bus
 format negotiation
Thread-Index: AQHVxJ5j13LfmBIDwkGafZKCBTQoDqfeOIsA
Date: Mon, 6 Jan 2020 22:30:28 +0000
Message-ID: <HE1PR06MB4011D7CD4ED18736D13DC4F8AC3C0@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <20200106143409.32321-1-narmstrong@baylibre.com>
 <20200106143409.32321-5-narmstrong@baylibre.com>
In-Reply-To: <20200106143409.32321-5-narmstrong@baylibre.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM6P191CA0106.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::47) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:D51D14AD1319CED2FBE130328696DEFA487386AD16E76B5572D085CB7BEAE549;
 UpperCasedChecksum:4D8B474B5010730D885D88746D80C8BB65A01459828794C0C756F64A8F7CDF46;
 SizeAsReceived:8310; Count:50
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [qWh/6eVp3RulqeQ/5+M1D58D3/XUdJgE]
x-microsoft-original-message-id: <9cfa94ba-6499-f7a2-b844-5cb911ae1e87@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 50
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 94cec5de-d33b-42f4-cc86-08d792f807fc
x-ms-traffictypediagnostic: HE1EUR02HT111:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: agoDMgLa6BfJ0b5DdKnVssHRVPicYqTJ31s6kEuvNihaUCfSzrmKLb6CidKzsa6rugHEeYJ0daTgMk34WZ8AK1xydPT120MpOtLR9g6LwbUifHpT2VCxj4nB3W8Hbq82dNkdyYI12GC4q1kY/vtyWI3MCenztgr6OaDsdw3nCOvvB766jzGyybDsupJEh9d5pCIM0gcSgqyG+C3YOOFaF6rHFsTD8hLHBr+ZG3lyHQY=
x-ms-exchange-transport-forked: True
Content-ID: <0D074D8D10EBD74283577682AFAECC7B@eurprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 94cec5de-d33b-42f4-cc86-08d792f807fc
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2020 22:30:29.0531 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR02HT111
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "kernel@collabora.com" <kernel@collabora.com>, Sam Ravnborg <sam@ravnborg.org>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-01-06 15:34, Neil Armstrong wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
>
> drm_bridge_state is extended to describe the input and output bus
> configurations. These bus configurations are exposed through the
> drm_bus_cfg struct which encodes the configuration of a physical
> bus between two components in an output pipeline, usually between
> two bridges, an encoder and a bridge, or a bridge and a connector.
>
> The bus configuration is stored in drm_bridge_state separately for
> the input and output buses, as seen from the point of view of each
> bridge. The bus configuration of a bridge output is usually identical
> to the configuration of the next bridge's input, but may differ if
> the signals are modified between the two bridges, for instance by an
> inverter on the board. The input and output configurations of a
> bridge may differ if the bridge modifies the signals internally,
> for instance by performing format conversion, or*modifying signals
> polarities.
>
> Bus format negotiation is automated by the core, drivers just have
> to implement the ->atomic_get_{output,input}_bus_fmts() hooks if they
> want to take part to this negotiation. Negotiation happens in reverse
> order, starting from the last element of the chain (the one directly
> connected to the display) up to the first element of the chain (the one
> connected to the encoder).
> During this negotiation all supported formats are tested until we find
> one that works, meaning that the formats array should be in decreasing
> preference order (assuming the driver has a preference order).
>
> Note that the bus format negotiation works even if some elements in the
> chain don't implement the ->atomic_get_{output,input}_bus_fmts() hooks.
> In that case, the core advertises only MEDIA_BUS_FMT_FIXED and lets
> the previous bridge element decide what to do (most of the time, bridge
> drivers will pick a default bus format or extract this piece of
> information from somewhere else, like a FW property).

I have tested this series on a Rockchip RK3328 Rock64 device along with early work
on rockchip dw-hdmi bus format negotiation at [1]. All output modes supported
on RK3328 works (RGB444, YUV420/444, 8/10-bit).

So for this entire series:

Tested-by: Jonas Karlman <jonas@kwiboo.se>

[1] https://github.com/Kwiboo/linux-rockchip/commits/next-20200106-bus-format

Regards,
Jonas

>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
> Changes in v6:
> * None
>
> Changes in v5:
> * None
>
> Changes in v4:
> * Enhance the doc
> * Fix typos
> * Rename some parameters/fields
> * Reword the commit message
>
> Changes in v3:
> * Fix the commit message (Reported by Laurent)
> * Document the fact that bus formats should not be directly modified by
>   drivers (Suggested by Laurent)
> * Document the fact that format order matters (Suggested by Laurent)
> * Propagate bus flags by default
> * Document the fact that drivers can tweak bus flags if needed
> * Let ->atomic_get_{output,input}_bus_fmts() allocate the bus format
>   array (Suggested by Laurent)
> * Add a drm_atomic_helper_bridge_propagate_bus_fmt()
> * Mandate that bridge drivers return accurate input_fmts even if they
>   are known to be the first element in the bridge chain
>
> Changes in v2:
> * Rework things to support more complex use cases
> ---
>  drivers/gpu/drm/drm_bridge.c | 267 ++++++++++++++++++++++++++++++++++-
>  include/drm/drm_bridge.h     | 124 ++++++++++++++++
>  2 files changed, 390 insertions(+), 1 deletion(-)
>
> (...)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
