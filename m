Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A1EA6281D
	for <lists+dri-devel@lfdr.de>; Sat, 15 Mar 2025 08:32:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57C4D10E179;
	Sat, 15 Mar 2025 07:32:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="h0VbC4zw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2124.outbound.protection.outlook.com [40.107.22.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD8510E128
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Mar 2025 07:32:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IIJy9r2CcXbzfAXaDdYED5GgpVPrngcwPRI9XXqsOvMu4LKxH0fJhwJpp60eBSk6IZ20NkZ4W2ktvhTTl3dFxEN2RF5HEfDzTUnnVeW36HCGSefudLFnzcoJp1bQit55CELoKLfN6XMj7LdVwpOVJD5vbC/6/O6bsWpeUnsvFyobvTRRlj6yj0wzDUkIXIY67XFrGFimttPPAcKuZ0Eze8feDS3Zy4IvJKmPhAN0uGXdh4KK99Bu2X2awxGs3NTXBn4sA3/m3z3C3pvzMi/9lPyQWOV48+t59yT3goRlzzwxsYOTXhyv7TR/dWkWEpJm2+wZnu+c3/heLvkJpPe7kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNbi1M5uamU3EKCkSZtA8vb/h6qmLi5FCR+4wklJYBM=;
 b=v9ACr7BhBCAdJmQZ550UfsTUDZRfD6vG0Au9E1sl1ZEJUyefUzCuok2DmhvO2uoX3AIz9qz7HTYLTP4VDDGJ2SmLbbk9liP98StEmpJNHVPa6WrGPj+ku1ZKd+t7pDQ/0oip9ZLu5pKk43YfrtmIxBscSriPCHEe9SbNNo6Xg55Lf+WUZ9ctkpQP5RyT4c5Sfc5FlZtJVQrIowCUprWkevRdVZp1h2xD8EmKxrnjpCObpOUTH2XuGyCxQzCqP1KwLKbO/WuPgVGIpmuufgSAR9vaP+NqiJGvhNCR+WxMg2L7Grakw9B2saR3ksTJW3mv0VPjOY3zq7Ci6RpkAR4gug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNbi1M5uamU3EKCkSZtA8vb/h6qmLi5FCR+4wklJYBM=;
 b=h0VbC4zwuujYNE09Xz3q75RtVhVqSj3z3KxQFDUd+5HFh7dgYJg1tkymNBNK6QV/xGCa6H0FiGY1khOzmAGC5fw2gxnFvCRzkgQi3uLCjGrrMf0rGL5llbpfGk2uEXcsHLsAwnOMRC+dTP5zC/O9c8M1OxzNIEekM3a7Q+8drOiG4HNWToMVGwU9o0zDUwps1/XF1MfjKEYOq8bFN6A8kUqKyr2P6PdhswzyiPJvLX6uZspUdPg2KOBlfNVr6Ox0koptuB2oB0YqOhvJ2JgrVXvpjbtNFjFL3tKi2E1HVimZ3cuiOaGYXaxI1r14NfLV1Mc0+qCjz7T0AAacQI2VLQ==
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com (2603:10a6:102:ec::16)
 by AM0PR04MB6801.eurprd04.prod.outlook.com (2603:10a6:208:18d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.27; Sat, 15 Mar
 2025 07:32:30 +0000
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f]) by PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f%4]) with mapi id 15.20.8511.025; Sat, 15 Mar 2025
 07:32:28 +0000
From: Maud Spierings | GOcontroll <maudspierings@gocontroll.com>
To: Rob Herring <robh@kernel.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Liu Ying
 <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Mark Brown <broonie@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-spi@vger.kernel.org"
 <linux-spi@vger.kernel.org>
Subject: Re: [PATCH v2 03/12] dt-bindings: connector: Add the GOcontroll
 Moduline module slot bindings
Thread-Topic: [PATCH v2 03/12] dt-bindings: connector: Add the GOcontroll
 Moduline module slot bindings
Thread-Index: AQHbiFlwk9848Rc4C0Wk0mPqKw6MoLNzOVEAgACo0sQ=
Date: Sat, 15 Mar 2025 07:32:28 +0000
Message-ID: <PA4PR04MB7630094413C8E1F3D715EE23C5DD2@PA4PR04MB7630.eurprd04.prod.outlook.com>
References: <20250226-initial_display-v2-0-23fafa130817@gocontroll.com>
 <20250226-initial_display-v2-3-23fafa130817@gocontroll.com>
 <20250314210652.GA2300828-robh@kernel.org>
In-Reply-To: <20250314210652.GA2300828-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB7630:EE_|AM0PR04MB6801:EE_
x-ms-office365-filtering-correlation-id: 91fd9647-a3e8-4bf0-2e28-08dd63938a41
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|8096899003|7053199007|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?kk4CukTOyMGYcyjJlVU7qruju+ijjr3oG5I5U+vwm6FqPKV0O4t67z+0gW?=
 =?iso-8859-1?Q?Ij2sIHhjfskpDBzDvj5RSqsmO7wxUa7vp+LFUhF3z0QzPrXLW5ByhcjyRy?=
 =?iso-8859-1?Q?KpxKjmdZYiY0q5nvYTvEXgXr2KYfD1nPgBswyk0HNFhOAVlZ+fgAC19Jpy?=
 =?iso-8859-1?Q?3U0GC4fv0OITZT9W5a+x2g40bKkkMsMcHMN6s/2gOsg1b9AXJQ8JBiQT7H?=
 =?iso-8859-1?Q?lj8vlQSnHMcHFKeRSGJMOpLmYLIEFz+eQrHEmlFZCpVEdN17DJCaWEuQaw?=
 =?iso-8859-1?Q?5tuqBzaxPjEp6M87yZEI0U5ESO0515ILEzD4FM/9ilTVi8x8cwWQi0SBC4?=
 =?iso-8859-1?Q?8JESdvC7Ec3PTNPdx9FDYhyyjzNLs/Now/aLp5ztws12XsNqc2bnggPnMA?=
 =?iso-8859-1?Q?HF8Ei6FNq2L/Hb1e3Ou2rUiPmS/pLZqD3ctyLeMyM+5f0tYKdsLX247GBU?=
 =?iso-8859-1?Q?FqhCddseW53Jik+Ciphnm69ZpWcOCtgOvwzp9xPS/9CjmNjEOimJ3n8xxJ?=
 =?iso-8859-1?Q?XgTLEQT9KGmM+2fizDjriLAaZosj/RjOtWd7ipV8FJFzbpkaLCtjB/L3i1?=
 =?iso-8859-1?Q?d9CLLNREbWXK9s8BU1RYBbjv+dTNG8Z+11PED8XeKTssysA+JlB00dKiGZ?=
 =?iso-8859-1?Q?Y7wQtbw51eO1vYeqpMGAjlxTDWkf7AEz5iWkSY1maUnHquuzvVeAqXAKB6?=
 =?iso-8859-1?Q?U2/ig21WHFnHaZUCqlQ53+00VPtE5Ao/gDgCH8G1+9BuCFXphhJ0B+Pi09?=
 =?iso-8859-1?Q?tOpt4PVhDDyMCnQ9PJXUPu4gTI0vTbSJgXGRkSmorrE9er4ri4pqTqVJre?=
 =?iso-8859-1?Q?LFeG7SFpXshGNBfptSm2w2kyt9a/OrB+9Y60cGi7GAAfEBFzdpYJPmYckj?=
 =?iso-8859-1?Q?tskf4R7kZpiCWxcG40/XtI1OQHqPMk4B7F19vMTGl3nBIjSyGcmyBBEgPP?=
 =?iso-8859-1?Q?LkbJ6VXebA2kmlMhWA7T4uMLl7bA3YK8PFRkiD7TjV7h2rY4q5Pc9uY/FC?=
 =?iso-8859-1?Q?EYyi4IkcTQCNDFS3WxYU2kcHAyVMfeRm2i1zc794x+EmFgKc316tnLLJ31?=
 =?iso-8859-1?Q?cPcvY0UjC/tOKGzLOxSQ6bq44YHWWN8vJO+KNVNeTENFUHqZqzWSZ85lkz?=
 =?iso-8859-1?Q?zeR6BRDik1CkXwOdoA8GfZ1jURTzmqa6ne6FN8zojTI/XbHqUvD4vi/KIv?=
 =?iso-8859-1?Q?/J2lJ/juCnCSvLUFG1Z3TLteNb39plthV7OwoqpK86M7l6mRMdBoBCOPRI?=
 =?iso-8859-1?Q?BPLW6iEv+t+WA0TWS3PpAo77gDe/ixDjDDGtRCJMXFxNqJ8BmfZdoFqJxN?=
 =?iso-8859-1?Q?wh5VmnfWjIk0w/4+t2ZUw0366Tst4uxBQsPlA6Ra/pFyOdf2sueTgJL7/8?=
 =?iso-8859-1?Q?zD43wK8Hplyymj9GBd8tz+exnREWlhlf/7U32CdG0pkxowLKHsAceADBLM?=
 =?iso-8859-1?Q?whR6p8I/cBtfjSCa?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB7630.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(8096899003)(7053199007)(38070700018);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?EaAFUmBDlaMi23AVV/bx4r5PCFpuFrQzuY7Sz5/I3YpUcytO4EsAOQNxrJ?=
 =?iso-8859-1?Q?EjVm0+ofAUwNPUre9mzcJE03edySvBDsqm10KAuVq88TgGTdRNEAKZT+O4?=
 =?iso-8859-1?Q?FobXd0GbjWkUy7NEeRsGLxBDtQ5C+a55EWqkh6oH0B1TotNZC8uetwMf1r?=
 =?iso-8859-1?Q?tVcgEJERSdHSCxmwNYQyP+cehE6D9huK/Y9/L5TN0ckT4uVdSHfNitmidb?=
 =?iso-8859-1?Q?Cbc8alRPL6b+IXZkZJ4xh3HEYb1CxVxaieQL0umWXgaII/yHALpw+DMkmQ?=
 =?iso-8859-1?Q?JCYYXtvONBjs2KF5lT6uR0N9Ne368mn4XZPmQm6OLOA7lGYxxJKc/0QMW/?=
 =?iso-8859-1?Q?XFz8s5D28cHdAdsujmh8D58lAuHt22hzZA3AsoYQsrqOutKdNL6VyiRnhf?=
 =?iso-8859-1?Q?mKvRzgucJB9zhPEHpSQTDNkq5n910GQJvy+GSpm/2vajn+PnBdGqUHf62p?=
 =?iso-8859-1?Q?AIQVaDJXRkg8wGkI6KUG7q32uA+Vngs+cIKCEREju0VUfnLrAwFRTouxQq?=
 =?iso-8859-1?Q?QapSVC6GQ/5PX+j7l5oPwVowokDq1FLfw74mp4daGfJp/wpyJVp/zC3UNh?=
 =?iso-8859-1?Q?0c2brYvw7XY7JubUbdb+v5BhvKNrCqJH/v+nB34s1Yq0g01G5g70Fs6kiC?=
 =?iso-8859-1?Q?K3BlWmf931E3n+QsiVl/aIa0aAn6VH51aMUWOdg83W9bEtB/89NXjAeQ6m?=
 =?iso-8859-1?Q?izQ0VVGs1Pc8RsGymS4/dzvajbACOnUBfGpNEXysHW8tISjE49FDw/jE22?=
 =?iso-8859-1?Q?VEVHHJ5qcGlRdiF/kILPQF0fL+f/AdphiV0cM05BE3fb5gPUDkBbgVKghw?=
 =?iso-8859-1?Q?Qo67xfXhRc/ykUrVoNkn9PI1iUNeTchVjTvKy/hBesWpj7GN2nHJdTc2Yh?=
 =?iso-8859-1?Q?jcJ5+nAwqHoMGg/y2EsWdiBWeaw+DRdg6Jba1V+c/N6pwE4mmhIE1OTDiZ?=
 =?iso-8859-1?Q?kCMefeGx3YcRgP51v/tJTkIz5SNrWMoyV0CW/HVM0VW2qMuBTmjVa2sWe/?=
 =?iso-8859-1?Q?zXpO6xpa15XnoZIyION5LdWxXi+3ZcdA0CF8KoYizfmQKYkXXCw6K443Tt?=
 =?iso-8859-1?Q?EsT+z8TmVYQHyjFpmcep39TpnpP7v7xoEAGbadiBqeAbNA0V7kcRh3y2u1?=
 =?iso-8859-1?Q?2VFeEG10kDNnvQ/CV492aJXP8v90b5kE0Pz8cnUjyTrNd9Lvysdq2sQRL/?=
 =?iso-8859-1?Q?z2smUVnCffMOoomgjVsQhTb1UVmBjleEnVJ/U4gkrGH55D5izWARCzLFFE?=
 =?iso-8859-1?Q?PVRD7WSRhTscEoHl6JAfoq8GsBxcD4yVkYyllmj4gp1scCWwTbYoMwzZRQ?=
 =?iso-8859-1?Q?jqAW8nbFQkn/h5Rz0/xqs56gtNApxHjy6DPqiQvYf7uJOCFD4OqdFp2dO4?=
 =?iso-8859-1?Q?uIGmJDbK1CccBYLs/bXCj/dp5tMejumVMGNrTv7yaXe+A42fiaA5WSE2VN?=
 =?iso-8859-1?Q?CnlpaLjJOSCbNU5yMVSYWmV4sAz/IGacEvf/BE5gnav+eXWr3sDnUPQ9EU?=
 =?iso-8859-1?Q?UaJOuT9ofguezImkvwoVFB5V/DV9VkENK7L8g5Gbe14Ja1zIo2J7/Q53lQ?=
 =?iso-8859-1?Q?TBwPqwEvoxsFV8sSoTsaYdq7jG6lP2rR7+MqY1FFWa5TTJQxLTzjDewoH/?=
 =?iso-8859-1?Q?ZCUb2qXKfxktR9bzG4c/MMZNibg+nIv0rZ?=
Content-Type: multipart/alternative;
 boundary="_000_PA4PR04MB7630094413C8E1F3D715EE23C5DD2PA4PR04MB7630eurp_"
MIME-Version: 1.0
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7630.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91fd9647-a3e8-4bf0-2e28-08dd63938a41
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2025 07:32:28.6978 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rPZ/Ax5hN/WiMiIoSf3f5h/J7OdgE+VbXM3F9QKtbsIE84G/6OTaTKwMrw2+ZeTcmEI1rdUjTJNEVB0guUd2zw5zgtwTdA6DOBHNjUtV1F8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6801
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

--_000_PA4PR04MB7630094413C8E1F3D715EE23C5DD2PA4PR04MB7630eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From: Rob Herring <robh@kernel.org>
Sent: Friday, March 14, 2025 10:06 PM

>On Wed, Feb 26, 2025 at 03:19:14PM +0100, Maud Spierings wrote:
>> Add the bindings that describe a GOcontroll Moduline module slot. This
>> slot provides all the interfaces to interface with a Moduline compatible
>> IO module. The actual module is not reasonable to describe as it can be
>> swapped at will, with this connector the driver will be able to probe
>> for a module on boot.
>>
>> The connector consists of 2 parts, one part for interfacing with the SoC
>> and main board, the other part has 13 IO channels for the module to
>> interact with the outside world. The functions of these IO channels are
>> determined by the type of module in the slot. The IO on the SoC side is
>> as follows:
>>
>>  - a 3v3 supply, this tends to be the logic level of the module and its
>>    microcontroller
>>  - a 5v0 supply, this can be used to power low power peripherals on the
>>    module
>>  - a 6v-8v supply, this can be used for high power peripherals on the
>>    module
>>  - a 6v-30v supply, this tends to be a dirty supply that comes from the
>>    controller supply after some circuit protection, or is the same as
>>    the 6v-8v supply.
>>  - an SPI bus which carries the communication between the SoC and the
>>    microcontroller on the module.
>>  - an I2C bus shared between the SoC and all module slots which can
>>    carry direct module-to-module communication.
>>  - a reset line
>>  - an interrupt line that indicates a clear to transmit signal
>>  - a sync line shared between the SoC and all module slots which could
>>    be used to synchronize modules for time sensitive IO spread across
>>    modules.
>>  - a SMBus alert line that is shared between the modules but is not
>>    connected to the SoC so that is ignored.
>>
>> A slot-number property is used to identify the physical location of a
>> module slot. Without it, it would be impossible to identify which module
>> to control if there are multiple of one type, to address the desired IO.
>
>Is that for a person to identify slots or s/w? If just a person, we
>generally use 'label' as in a sticker on the connector. If s/w, we
>generally try to avoid made up indexing in DT though there are some
>exceptions.

I guess both, I am not quite sure how the uapi will look like eventually.
Right now we just kind of know that spidev1.0 is slot 1 etc.

Maybe label: true could be enough but that seems to generic, it allows too
much wiggle room, if there is an eventual library that uses the kernel
uapi instead of the spidev interface it must be consistent. Or can the
label be restricted to being "moduleslot#"? I feel that numbers best
represent the way we lay out these module slots, and will provide the best
interface.

>> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
>> ---
>>  .../connector/gocontroll,moduline-module-slot.yaml | 88 +++++++++++++++=
+++++++
>>  1 file changed, 88 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/connector/gocontroll,modu=
line-module-slot.yaml b/Documentation/devicetree/bindings/connector/gocontr=
oll,moduline-module-slot.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..a16ae2762d160180d5b163e2=
0f5294235e65053b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/connector/gocontroll,moduline-mo=
dule-slot.yaml
>> @@ -0,0 +1,88 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/connector/gocontroll,moduline-module=
-slot.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: GOcontroll Moduline Module slot
>> +
>> +maintainers:
>> +  - Maud Spierings <maudspierings@gocontroll.com>
>> +
>> +description:
>> +  The GOcontroll Moduline module slot represents a connector that fullf=
ills the
>> +  Moduline slot specification, and can thus house any IO module that is=
 also
>> +  built to this spec.
>> +
>> +properties:
>> +  compatible:
>> +    const: gocontroll,moduline-module-slot
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    description: indicates readiness, high means busy.
>> +    maxItems: 1
>> +  reset-gpios:
>> +    description: resets the module, active low.
>> +    maxItems: 1
>> +  sync-gpios:
>> +    description: sync line between all module slots.
>> +    maxItems: 1
>> +
>> +  vdd-supply:
>> +    description: low power 3v3 supply generally for the microcontroller=
.
>> +  vddp-supply:
>> +    description: medium power 5v0 supply for on module low power periph=
erals.
>> +  vddhpp-supply:
>> +    description: high power 6v-8v supply for on module high power perip=
herals.
>> +  power-supply:
>> +    description: high power 6v-30v supply for high power module circuit=
s.
>> +
>> +  i2c-bus:
>> +    description: i2c bus shared between module slots and the SoC
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +
>> +  slot-number:
>> +    description:
>> +      The number of the module slot representing the location of on the=
 pcb.
>> +      This enables access to the modules based on slot location.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +
>> +  spi-max-frequency: true
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reset-gpios
>> +  - interrupts
>> +  - sync-gpios
>> +  - i2c-bus
>> +  - slot-number
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    spi {
>> +        #address-cells =3D <1>;
>> +        #size-cells =3D <0>;
>> +
>> +        connector@0 {
>
>I find this being a SPI device a bit strange. Is there a defined SPI
>device that every slot is going to have? Or the connector has SPI
>interface and *anything* could be attached on it?

So a module slot is like a pcie slot, it can be occupied or not, and when
it is occupied it can be any kind of module, but it can at least only be
one module, there is no hub like functionality.

On this module is a microcontroller or perhaps even an FPGA in the future
which is the spi-device, it has the miso, mosi, sclk and cs hooked up to
it.

For now this tends to be some kind of stm32f4xx, but it is very much not
set in stone. The only thing sure is there is some kind of module
controller that is hooked up to the spi device when a module is present.

So I would say it is option 2 of what you ask. But the 'anything' is
restricted to module compatible with the standard, its not just going to
be some IC like an ADC chip like the mcp3004 that we use on the mainboard.

>> +            reg =3D <0>;
>> +            compatible =3D "gocontroll,moduline-module-slot";
>> +            reset-gpios =3D <&gpio5 10 GPIO_ACTIVE_LOW>;
>> +            sync-gpios =3D <&gpio4 16 GPIO_ACTIVE_HIGH>;
>> +            interrupt-parent =3D <&gpio4>;
>> +            interrupts =3D <5 IRQ_TYPE_EDGE_FALLING>;
>> +            vdd-supply =3D <&reg_3v3_per>;
>> +            vddp-supply =3D <&reg_5v0>;
>> +            vddhpp-supply =3D <&reg_6v4>;
>> +            i2c-bus =3D <&i2c2>;
>> +            slot-number =3D <1>;
>> +        };
>> +    };
>>
>> --
>> 2.48.1
>>

I hope this cleared everything up and the bindings are still okay

Kind Regards,
Maud

--_000_PA4PR04MB7630094413C8E1F3D715EE23C5DD2PA4PR04MB7630eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof">From:&nbsp;Rob Herring &lt;robh@kernel.org&gt=
;</div>
<div class=3D"elementToProof">Sent:&nbsp;Friday, March 14, 2025 10:06 PM</d=
iv>
<div>&nbsp;</div>
<div class=3D"elementToProof">&gt;On Wed, Feb 26, 2025 at 03:19:14PM +0100,=
 Maud Spierings wrote:</div>
<div class=3D"elementToProof">&gt;&gt; Add the bindings that describe a GOc=
ontroll Moduline module slot. This</div>
<div class=3D"elementToProof">&gt;&gt; slot provides all the interfaces to =
interface with a Moduline compatible</div>
<div>&gt;&gt; IO module. The actual module is not reasonable to describe as=
 it can be</div>
<div class=3D"elementToProof">&gt;&gt; swapped at will, with this connector=
 the driver will be able to probe</div>
<div class=3D"elementToProof">&gt;&gt; for a module on boot.</div>
<div>&gt;&gt;</div>
<div class=3D"elementToProof">&gt;&gt; The connector consists of 2 parts, o=
ne part for interfacing with the SoC</div>
<div class=3D"elementToProof">&gt;&gt; and main board, the other part has 1=
3 IO channels for the module to</div>
<div>&gt;&gt; interact with the outside world. The functions of these IO ch=
annels are</div>
<div class=3D"elementToProof">&gt;&gt; determined by the type of module in =
the slot. The IO on the SoC side is</div>
<div class=3D"elementToProof">&gt;&gt; as follows:</div>
<div>&gt;&gt;</div>
<div class=3D"elementToProof">&gt;&gt; &nbsp;- a 3v3 supply, this tends to =
be the logic level of the module and its</div>
<div>&gt;&gt; &nbsp; &nbsp;microcontroller</div>
<div class=3D"elementToProof">&gt;&gt; &nbsp;- a 5v0 supply, this can be us=
ed to power low power peripherals on the</div>
<div class=3D"elementToProof">&gt;&gt; &nbsp; &nbsp;module</div>
<div class=3D"elementToProof">&gt;&gt; &nbsp;- a 6v-8v supply, this can be =
used for high power peripherals on the</div>
<div>&gt;&gt; &nbsp; &nbsp;module</div>
<div class=3D"elementToProof">&gt;&gt; &nbsp;- a 6v-30v supply, this tends =
to be a dirty supply that comes from the</div>
<div class=3D"elementToProof">&gt;&gt; &nbsp; &nbsp;controller supply after=
 some circuit protection, or is the same as</div>
<div class=3D"elementToProof">&gt;&gt; &nbsp; &nbsp;the 6v-8v supply.</div>
<div class=3D"elementToProof">&gt;&gt; &nbsp;- an SPI bus which carries the=
 communication between the SoC and the</div>
<div>&gt;&gt; &nbsp; &nbsp;microcontroller on the module.</div>
<div class=3D"elementToProof">&gt;&gt; &nbsp;- an I2C bus shared between th=
e SoC and all module slots which can</div>
<div class=3D"elementToProof">&gt;&gt; &nbsp; &nbsp;carry direct module-to-=
module communication.</div>
<div class=3D"elementToProof">&gt;&gt; &nbsp;- a reset line</div>
<div class=3D"elementToProof">&gt;&gt; &nbsp;- an interrupt line that indic=
ates a clear to transmit signal</div>
<div class=3D"elementToProof">&gt;&gt; &nbsp;- a sync line shared between t=
he SoC and all module slots which could</div>
<div>&gt;&gt; &nbsp; &nbsp;be used to synchronize modules for time sensitiv=
e IO spread across</div>
<div class=3D"elementToProof">&gt;&gt; &nbsp; &nbsp;modules.</div>
<div class=3D"elementToProof">&gt;&gt; &nbsp;- a SMBus alert line that is s=
hared between the modules but is not</div>
<div class=3D"elementToProof">&gt;&gt; &nbsp; &nbsp;connected to the SoC so=
 that is ignored.</div>
<div class=3D"elementToProof">&gt;&gt;</div>
<div class=3D"elementToProof">&gt;&gt; A slot-number property is used to id=
entify the physical location of a</div>
<div class=3D"elementToProof">&gt;&gt; module slot. Without it, it would be=
 impossible to identify which module</div>
<div class=3D"elementToProof">&gt;&gt; to control if there are multiple of =
one type, to address the desired IO.</div>
<div class=3D"elementToProof">&gt;</div>
<div class=3D"elementToProof">&gt;Is that for a person to identify slots or=
 s/w? If just a person, we</div>
<div>&gt;generally use 'label' as in a sticker on the connector. If s/w, we=
</div>
<div class=3D"elementToProof">&gt;generally try to avoid made up indexing i=
n DT though there are some</div>
<div class=3D"elementToProof">&gt;exceptions.</div>
<div class=3D"elementToProof"><br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I guess both, I am not quite sure how the uapi will look like eventually.</=
div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Right now we just kind of know that spidev1.0 is slot 1 etc.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Maybe label: true could be enough but that seems to generic, it allows too<=
/div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
much wiggle room, if there is an eventual library that uses the kernel</div=
>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
uapi instead of the spidev interface it must be consistent. Or can the</div=
>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
label be restricted to being &quot;moduleslot#&quot;? I feel that numbers b=
est</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
represent the way we lay out these module slots, and will provide the best<=
/div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
interface.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof">&gt;&gt; Signed-off-by: Maud Spierings &lt;ma=
udspierings@gocontroll.com&gt;</div>
<div class=3D"elementToProof">&gt;&gt; ---</div>
<div>&gt;&gt; &nbsp;.../connector/gocontroll,moduline-module-slot.yaml | 88=
 ++++++++++++++++++++++</div>
<div class=3D"elementToProof">&gt;&gt; &nbsp;1 file changed, 88 insertions(=
+)</div>
<div class=3D"elementToProof">&gt;&gt;</div>
<div>&gt;&gt; diff --git a/Documentation/devicetree/bindings/connector/goco=
ntroll,moduline-module-slot.yaml b/Documentation/devicetree/bindings/connec=
tor/gocontroll,moduline-module-slot.yaml</div>
<div class=3D"elementToProof">&gt;&gt; new file mode 100644</div>
<div class=3D"elementToProof">&gt;&gt; index 000000000000000000000000000000=
0000000000..a16ae2762d160180d5b163e20f5294235e65053b</div>
<div>&gt;&gt; --- /dev/null</div>
<div class=3D"elementToProof">&gt;&gt; +++ b/Documentation/devicetree/bindi=
ngs/connector/gocontroll,moduline-module-slot.yaml</div>
<div class=3D"elementToProof">&gt;&gt; @@ -0,0 +1,88 @@</div>
<div>&gt;&gt; +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)</d=
iv>
<div class=3D"elementToProof">&gt;&gt; +%YAML 1.2</div>
<div class=3D"elementToProof">&gt;&gt; +---</div>
<div class=3D"elementToProof">&gt;&gt; +$id: http://devicetree.org/schemas/=
connector/gocontroll,moduline-module-slot.yaml#</div>
<div class=3D"elementToProof">&gt;&gt; +$schema: http://devicetree.org/meta=
-schemas/core.yaml#</div>
<div>&gt;&gt; +</div>
<div class=3D"elementToProof">&gt;&gt; +title: GOcontroll Moduline Module s=
lot</div>
<div class=3D"elementToProof">&gt;&gt; +</div>
<div class=3D"elementToProof">&gt;&gt; +maintainers:</div>
<div>&gt;&gt; + &nbsp;- Maud Spierings &lt;maudspierings@gocontroll.com&gt;=
</div>
<div class=3D"elementToProof">&gt;&gt; +</div>
<div class=3D"elementToProof">&gt;&gt; +description:</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp;The GOcontroll Moduline modu=
le slot represents a connector that fullfills the</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp;Moduline slot specification,=
 and can thus house any IO module that is also</div>
<div>&gt;&gt; + &nbsp;built to this spec.</div>
<div class=3D"elementToProof">&gt;&gt; +</div>
<div class=3D"elementToProof">&gt;&gt; +properties:</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp;compatible:</div>
<div>&gt;&gt; + &nbsp; &nbsp;const: gocontroll,moduline-module-slot</div>
<div class=3D"elementToProof">&gt;&gt; +</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp;reg:</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp; &nbsp;maxItems: 1</div>
<div class=3D"elementToProof">&gt;&gt; +</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp;interrupts:</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp; &nbsp;description: indicate=
s readiness, high means busy.</div>
<div>&gt;&gt; + &nbsp; &nbsp;maxItems: 1</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp;reset-gpios:</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp; &nbsp;description: resets t=
he module, active low.</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp; &nbsp;maxItems: 1</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp;sync-gpios:</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp; &nbsp;description: sync lin=
e between all module slots.</div>
<div>&gt;&gt; + &nbsp; &nbsp;maxItems: 1</div>
<div class=3D"elementToProof">&gt;&gt; +</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp;vdd-supply:</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp; &nbsp;description: low powe=
r 3v3 supply generally for the microcontroller.</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp;vddp-supply:</div>
<div>&gt;&gt; + &nbsp; &nbsp;description: medium power 5v0 supply for on mo=
dule low power peripherals.</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp;vddhpp-supply:</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp; &nbsp;description: high pow=
er 6v-8v supply for on module high power peripherals.</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp;power-supply:</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp; &nbsp;description: high pow=
er 6v-30v supply for high power module circuits.</div>
<div>&gt;&gt; +</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp;i2c-bus:</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp; &nbsp;description: i2c bus =
shared between module slots and the SoC</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp; &nbsp;$ref: /schemas/types.=
yaml#/definitions/phandle</div>
<div class=3D"elementToProof">&gt;&gt; +</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp;slot-number:</div>
<div>&gt;&gt; + &nbsp; &nbsp;description:</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp; &nbsp; &nbsp;The number of =
the module slot representing the location of on the pcb.</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp; &nbsp; &nbsp;This enables a=
ccess to the modules based on slot location.</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp; &nbsp;$ref: /schemas/types.=
yaml#/definitions/uint32</div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);">&gt;</span>&gt; +</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp;spi-max-frequency: true</div=
>
<div class=3D"elementToProof">&gt;&gt; +</div>
<div class=3D"elementToProof">&gt;&gt; +required:</div>
<div>&gt;&gt; + &nbsp;- compatible</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp;- reg</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp;- reset-gpios</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp;- interrupts</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp;- sync-gpios</div>
<div>&gt;&gt; + &nbsp;- i2c-bus</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp;- slot-number</div>
<div class=3D"elementToProof">&gt;&gt; +</div>
<div class=3D"elementToProof">&gt;&gt; +additionalProperties: false</div>
<div class=3D"elementToProof">&gt;&gt; +</div>
<div class=3D"elementToProof">&gt;&gt; +examples:</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp;- |</div>
<div>&gt;&gt; + &nbsp; &nbsp;#include &lt;dt-bindings/gpio/gpio.h&gt;</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp; &nbsp;#include &lt;dt-bindi=
ngs/interrupt-controller/irq.h&gt;</div>
<div class=3D"elementToProof">&gt;&gt; +</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp; &nbsp;spi {</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp;#addres=
s-cells =3D &lt;1&gt;;</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp;#size-c=
ells =3D &lt;0&gt;;</div>
<div>&gt;&gt; +</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp;connect=
or@0 {</div>
<div class=3D"elementToProof">&gt;</div>
<div class=3D"elementToProof">&gt;I find this being a SPI device a bit stra=
nge. Is there a defined SPI</div>
<div>&gt;device that every slot is going to have? Or the connector has SPI<=
/div>
<div class=3D"elementToProof">&gt;interface and *anything* could be attache=
d on it?</div>
<div class=3D"elementToProof"><br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
So a module slot is like a pcie slot, it can be occupied or not, and when</=
div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
it is occupied it can be any kind of module, but it can at least only be</d=
iv>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
one module, there is no hub like functionality.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
On this module is a microcontroller or perhaps even an FPGA in the future</=
div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
which is the spi-device, it has the miso, mosi, sclk and cs hooked up to</d=
iv>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
it.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
For now this tends to be some kind of stm32f4xx, but it is very much not</d=
iv>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
set in stone. The only thing sure is there is some kind of module</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
controller that is hooked up to the spi device when a module is present.</d=
iv>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
So I would say it is option 2 of what you ask. But the 'anything' is</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
restricted to module compatible with the standard, its not just going to&nb=
sp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
be some IC like an ADC chip like the mcp3004 that we use on the mainboard.<=
/div>
<div class=3D"elementToProof"><br>
</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;reg =3D &lt;0&gt;;</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;compatible =3D &quot;gocontroll,moduline-module-slot&quot;;</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;reset-gpios =3D &lt;&amp;gpio5 10 GPIO_ACTIVE_LOW&gt;;</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;sync-gpios =3D &lt;&amp;gpio4 16 GPIO_ACTIVE_HIGH&gt;;</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;interrupt-parent =3D &lt;&amp;gpio4&gt;;</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;interrupts =3D &lt;5 IRQ_TYPE_EDGE_FALLING&gt;;</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;vdd-supply =3D &lt;&amp;reg_3v3_per&gt;;</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;vddp-supply =3D &lt;&amp;reg_5v0&gt;;</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;vddhpp-supply =3D &lt;&amp;reg_6v4&gt;;</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;i2c-bus =3D &lt;&amp;i2c2&gt;;</div>
<div>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;slot-number =3D &l=
t;1&gt;;</div>
<div class=3D"elementToProof">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp;};</div=
>
<div class=3D"elementToProof">&gt;&gt; + &nbsp; &nbsp;};</div>
<div class=3D"elementToProof">&gt;&gt;</div>
<div>&gt;&gt; --</div>
<div class=3D"elementToProof">&gt;&gt; 2.48.1</div>
<div class=3D"elementToProof">&gt;&gt;</div>
<div class=3D"elementToProof"><br>
</div>
<div class=3D"elementToProof">I hope this cleared everything up and the bin=
dings are still okay<br>
<br>
Kind Regards,<br>
Maud</div>
</body>
</html>

--_000_PA4PR04MB7630094413C8E1F3D715EE23C5DD2PA4PR04MB7630eurp_--
