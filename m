Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F672D3D6A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 09:32:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED1C6E2EF;
	Wed,  9 Dec 2020 08:32:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60053.outbound.protection.outlook.com [40.107.6.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE476E94D
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 09:48:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dol0rZVGZ6HxlqmMt5N+YWBdYgRK03gkESIMvwRLKpOEN85E4v1LdqM9kTQcI4bEregCmbjiKnTKrZFJogA4opemMjFzKlog7hyu5Gq/0hIfpF/7u22O3f+tT46atA1fHdk2UlilseFLRxrrh5YTsxr/ejctlz+395TtzMvS4K6zFh+8uZCde2/JawZpqfNRDfNzuRZ+PDq2+A11dNjfX5jLgvyPbbOuzpzbHZi9/ykGnk8iJcIzAOPH7XOUUP/O+dhZ1huJ4lD3NMZDczwgYtOMdaa1TSJkwMfq1izmOxJR3jJZ6tnNhld0BHfdbfIP3pRxl8xx3XszxC1zE45Bdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJQ7QSY2WbDbsFizjNznAmZeC/dYm+l99COAsoZtzGQ=;
 b=ZVIQzg6kiT9553L0s4I0fWvVfCgnmEJa08woDWbUnNp8fgwurvW5VUP2RZ6hJjhJxJxUMIylYzqELIdbO+Zf9h89KSnqm51eqw3ypcVKWqQUNqGUj4qYVnapjWl+yAJnbgFcPViZlZ5fVGWLXJ+9NrLxVdwbSaiJrnGJ0kz10ak4mRVID999qI6KDJhhbEbOJN+DlC+1a73ynM1Cf24NNrWQTG4esRgR+G1h8Xqs+pC9lxGF8hYGs9wQH+RGgMkhfOrpx4erdJ+gz3vBEHKJXawG6m2PSxdDkHgw1u2gFjJMjBbPL0G1wN3f2sO0Yc1+Kt6ro7iVhjZRrmAf2G7fuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJQ7QSY2WbDbsFizjNznAmZeC/dYm+l99COAsoZtzGQ=;
 b=qWGwfeDyZtNsMj7+eIllhViFizSKfCxgdsLlJFM6XDn4s3ZV3/CjcsIw2KRlkHhuIRYAhxxAU7Mns6tFelax/haSq7NE1WzJiMjyqJPeSq9Lm2MEmhINknMPora05+/uYQrMmJ7hBKlgJmzZvWx/iE/tKMEilhMXLKDdcbdmNv4=
Authentication-Results: puri.sm; dkim=none (message not signed)
 header.d=none;puri.sm; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB7184.eurprd04.prod.outlook.com (2603:10a6:800:125::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Tue, 8 Dec
 2020 09:48:06 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3632.023; Tue, 8 Dec 2020
 09:48:06 +0000
Message-ID: <24222c64cbc9ceb1d3a48a8ed5fa74a32d9e5eee.camel@nxp.com>
Subject: Re: [PATCH 3/4] dt-bindings: phy: mixel: mipi-dsi-phy: Add Mixel
 combo PHY support for i.MX8qxp
From: Liu Ying <victor.liu@nxp.com>
To: Guido =?ISO-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>
Date: Tue, 08 Dec 2020 17:46:16 +0800
In-Reply-To: <20201208090710.GC20575@bogon.m.sigxcpu.org>
References: <1607067224-15616-1-git-send-email-victor.liu@nxp.com>
 <1607067224-15616-4-git-send-email-victor.liu@nxp.com>
 <20201208090710.GC20575@bogon.m.sigxcpu.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR03CA0097.apcprd03.prod.outlook.com
 (2603:1096:4:7c::25) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry.ap.freescale.net (119.31.174.66) by
 SG2PR03CA0097.apcprd03.prod.outlook.com (2603:1096:4:7c::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.5 via Frontend Transport; Tue, 8 Dec 2020 09:48:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 33037201-41fd-46c0-254c-08d89b5e5ca3
X-MS-TrafficTypeDiagnostic: VI1PR04MB7184:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB71847AAA617479F349AB9AC798CD0@VI1PR04MB7184.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1I03N8kcPG5UQVgof76yNBIrWrFYE2jUbsNV49GjqlXOBcvyZpPLLsphLQKSvt45J8XFahHFC1+g9I0jx7F3g9OEHJTNvg9E1k4Gr/2LLPm5mUAT6X2t/QbzycRLP2ScALlKQ4GhwIFE48qggFrR80Omk2arRObbjIfvLtVUhPYrnh3tyqnC5TY556Cn01AhS3nI9JSfoblT4V78OBKtpaMM0/TEXfYRW1weh/iQ9KcqPNf8S1Lp9Wfc5IgMHRzA/7AEifV42w4oeKqe2/3ZvmZJsMy6gQ2i/7zupjQfhHKHR7c+jeLFiadCjsgQ+7n+fpr5vFOOLQglhcDUuL9+Uik7i90nAJramWnk67iATAAUdeln17XwMG5flovbpoxi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(376002)(36756003)(6512007)(66574015)(83380400001)(52116002)(34490700003)(508600001)(2616005)(66946007)(186003)(956004)(7416002)(6486002)(26005)(6916009)(16526019)(5660300002)(4326008)(8936002)(86362001)(8676002)(6506007)(66556008)(2906002)(66476007)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eUtjYmVLdzdLZ3JzY00vYlJpQi9qbzZxSDA5bkw0a0dNbHVVazUzU1Z4Z0V5?=
 =?utf-8?B?WTdpMFlrWlMxck02eGVjMFMxV2k0ZW5HcEY1WFJZWlY5a3FYUGpROGpxUXZq?=
 =?utf-8?B?ZmNiUDIwak93ODI4azJSWVdIZC84Mnl6S0F1ditrQzl5WmpqZXQvK2lJY3pT?=
 =?utf-8?B?TW1qVTBsUWJzdysycW55aWIzcHE4NFZ1UzNEcE9ZR1lkbW55QnNuWDRBWGU2?=
 =?utf-8?B?Q3d6R2puRDg0bXR3VHJQdGtSdU45MWFnQ0pleU5CSC93Z2hFOE12TUFJbDR1?=
 =?utf-8?B?WEVIQUdQNHNiTnNkY3F2M21BemlMQUxwZm0reHNwZlYxdUFoTE5JV0JRK2sw?=
 =?utf-8?B?VFErdkVRM29BbWVkQ21VNXBMZHVLZ3JyTGFKM0xXZFJMWU9mRnRLNjJJcENE?=
 =?utf-8?B?VFRUd3VuaWcveDZ5a2gzSjF4WThENnN0cWRHa2xRdDNlQTk5ZnNCYkRSQjJ6?=
 =?utf-8?B?ZWluZW5ZbDVPUjNDQTRlSWRwMlY3UUhnSllpL0lNZnF4VmdTdE5aTUROUFNX?=
 =?utf-8?B?RDlmaTlIRTRscm91VU1uQngrVTE1aG5HSVhNejFTOU9zcFpyOTlKTFZidEt0?=
 =?utf-8?B?VFB5TmJNQnN4dnhabGdXQnpWalA5dEkwS1RSQi95a2ZtRGd6L0x1SFVOWkRG?=
 =?utf-8?B?cHlhR0hOSExCUnZMcHkyNjZjQ3RsVkRZRnB6Mm9qQ2gydHRkV0Y0T3JOYU10?=
 =?utf-8?B?V013QXQrVlphaVRhVkphdnpHbFZQTDRVajJtSHlxVW9ockMvTkIydmtubzJo?=
 =?utf-8?B?STJzZlNrRFc3QVNDb1RlTFR1RFplaXNQc3ZxQ3d1WWlDa2lrL2hMNHZJU3Jk?=
 =?utf-8?B?YjVmaVFjZXl2ME52TXA3ci9OUVVVWkVablZmOTdkTFBOcmphS2RpZVk3TzZT?=
 =?utf-8?B?TmNuMFZVdmNpcVVEV3U4QUxkK05Jck1MRFdBTk92REZCWnBZaGNxVWY3R0FU?=
 =?utf-8?B?elMrMDYwc3UvM204V3lKelcxYjNTUHFPaVEvS1VFY3hmNU5OM2F0VmV5enJY?=
 =?utf-8?B?NXRQTGo4YXRFUThhendhWThWcm1Pais4VGhQMG53bFV6Mkl6VmhGenc3bWtn?=
 =?utf-8?B?UWFBdDRRVTQ4QWxoVTNaRzNzeHhLRHBMbXhFOFprS0k2d3RSWmdpYldHNHgy?=
 =?utf-8?B?YjJxQTFPRStiSjFzaWdzSlkzS1orNk1saHRZRTZXUXNzYU9HZDdyd2lrT1BE?=
 =?utf-8?B?ZmhPTlZ3aGV2d0FVdGEwaExYM0p2YVFmQWRxQTZnbzNlbE5jYXZ0VDhwN3lY?=
 =?utf-8?B?R1h4T3BMRWZOMU9qY1l5Q2pxeTN1Ulg2MmEyNWlLYjZkb0w4Wk04eXI5NUVl?=
 =?utf-8?Q?GXzbOxWrm73K6NlEvLf9EU5NuDqgKNUQLX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33037201-41fd-46c0-254c-08d89b5e5ca3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 09:48:05.9030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BgUDaYu/cYEwYr2Is8rXyjX2HGepV6poEuz/9EyQOxXs3eEQV6y7TVagvLpqyQy/7Fz5dWY3XZORzTY2mcJ9IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7184
X-Mailman-Approved-At: Wed, 09 Dec 2020 08:32:01 +0000
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net, kernel@pengutronix.de,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kishon@ti.com, a.hajda@samsung.com, vkoul@kernel.org, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, robert.chiras@nxp.com,
 martin.kepplinger@puri.sm, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIwLTEyLTA4IGF0IDEwOjA3ICswMTAwLCBHdWlkbyBHw7xudGhlciB3cm90ZToK
PiBIaSBMaXUsCj4gU2luY2Ugd2Ugbm93IGdhaW4gb3B0aW9uYWwgcHJvcGVydGllcyB2YWxpZGF0
aW9uIHdvdWxkIGJlY29tZSBldmVuIG1vcmUKPiB1c2VmdWwuIENvdWxkIHlvdSBsb29rIGludG8g
Y29udmVydGluZyB0byBZQU1MIGJlZm9yZSBhZGRpbmcgbW9yZQo+IHZhbHVlcz8KClllcywgYSBZ
QU1MIG9uZSB3b3VsZCBiZSBnb29kLgpJJ2xsIHRyeSB0byBkbyB0aGUgY29udmVyc2lvbiBhbmQg
dGhlbiBhZGQgdGhlIGJpbmRpbmcgc3VwcG9ydCBmb3IgdGhlCmkuTVg4cXhwIE1peGVsIGNvbWJv
IFBIWSBpbiBpdC4KCkxpdSBZaW5nCgo+IENoZWVycywKPiAgLS0gR3VpZG8KPiAKPiBPbiBGcmks
IERlYyAwNCwgMjAyMCBhdCAwMzozMzo0M1BNICswODAwLCBMaXUgWWluZyB3cm90ZToKPiA+IEFk
ZCBzdXBwb3J0IGZvciBNaXhlbCBNSVBJIERQSFkgKyBMVkRTIFBIWSBjb21ibyBJUAo+ID4gYXMg
Zm91bmQgb24gRnJlZXNjYWxlIGkuTVg4cXhwIFNvQy4KPiA+IAo+ID4gQ2M6IEd1aWRvIEfDvG50
aGVyIDxhZ3hAc2lneGNwdS5vcmc+Cj4gPiBDYzogS2lzaG9uIFZpamF5IEFicmFoYW0gSSA8a2lz
aG9uQHRpLmNvbT4KPiA+IENjOiBWaW5vZCBLb3VsIDx2a291bEBrZXJuZWwub3JnPgo+ID4gQ2M6
IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+Cj4gPiBDYzogTlhQIExpbnV4IFRlYW0g
PGxpbnV4LWlteEBueHAuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogTGl1IFlpbmcgPHZpY3Rvci5s
aXVAbnhwLmNvbT4KPiA+IC0tLQo+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9waHkvbWl4ZWwsbWlwaS1kc2ktcGh5LnR4dCB8IDggKysrKysrKy0KPiA+ICAxIGZpbGUgY2hh
bmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21peGVsLG1pcGktZHNpLXBo
eS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21peGVsLG1pcGkt
ZHNpLXBoeS50eHQKPiA+IGluZGV4IDliMjM0MDcuLjBhZmNlOTkgMTAwNjQ0Cj4gPiAtLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21peGVsLG1pcGktZHNpLXBoeS50
eHQKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvbWl4ZWws
bWlwaS1kc2ktcGh5LnR4dAo+ID4gQEAgLTQsOSArNCwxMyBAQCBUaGUgTWl4ZWwgTUlQSS1EU0kg
UEhZIElQIGJsb2NrIGlzIGUuZy4gZm91bmQgb24gaS5NWDggcGxhdGZvcm1zIChhbG9uZyB0aGUK
PiA+ICBNSVBJLURTSSBJUCBmcm9tIE5vcnRod2VzdCBMb2dpYykuIEl0IHJlcHJlc2VudHMgdGhl
IHBoeXNpY2FsIGxheWVyIGZvciB0aGUKPiA+ICBlbGVjdHJpY2FsIHNpZ25hbHMgZm9yIERTSS4K
PiA+ICAKPiA+ICtUaGUgTWl4ZWwgUEhZIElQIGJsb2NrIGZvdW5kIG9uIGkuTVg4cXhwIGlzIGEg
Y29tYm8gUEhZIHRoYXQgY2FuIHdvcmsKPiA+ICtpbiBlaXRoZXIgTUlQSS1EU0kgUEhZIG1vZGUg
b3IgTFZEUyBQSFkgbW9kZS4KPiA+ICsKPiA+ICBSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ID4gLS0g
Y29tcGF0aWJsZTogTXVzdCBiZToKPiA+ICstIGNvbXBhdGlibGU6IFNob3VsZCBiZSBvbmUgb2Y6
Cj4gPiAgICAtICJmc2wsaW14OG1xLW1pcGktZHBoeSIKPiA+ICsgIC0gImZzbCxpbXg4cXhwLW1p
cGktZHBoeSIKPiA+ICAtIGNsb2NrczogTXVzdCBjb250YWluIGFuIGVudHJ5IGZvciBlYWNoIGVu
dHJ5IGluIGNsb2NrLW5hbWVzLgo+ID4gIC0gY2xvY2stbmFtZXM6IE11c3QgY29udGFpbiB0aGUg
Zm9sbG93aW5nIGVudHJpZXM6Cj4gPiAgICAtICJwaHlfcmVmIjogcGhhbmRsZSBhbmQgc3BlY2lm
aWVyIHJlZmVycmluZyB0byB0aGUgRFBIWSByZWYgY2xvY2sKPiA+IEBAIC0xNCw2ICsxOCw4IEBA
IFJlcXVpcmVkIHByb3BlcnRpZXM6Cj4gPiAgLSAjcGh5LWNlbGxzOiBudW1iZXIgb2YgY2VsbHMg
aW4gUEhZLCBhcyBkZWZpbmVkIGluCj4gPiAgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcGh5L3BoeS1iaW5kaW5ncy50eHQKPiA+ICAgIHRoaXMgbXVzdCBiZSA8MD4KPiA+ICst
IGZzbCxzeXNjb246IFBoYW5kbGUgdG8gYSBzeXN0ZW0gY29udHJvbGxlciwgYXMgcmVxdWlyZWQg
YnkgdGhlIFBIWQo+ID4gKyAgaW4gaS5NWDhxeHAgU29DLgo+ID4gIAo+ID4gIE9wdGlvbmFsIHBy
b3BlcnRpZXM6Cj4gPiAgLSBwb3dlci1kb21haW5zOiBwaGFuZGxlIHRvIHBvd2VyIGRvbWFpbgo+
ID4gLS0gCj4gPiAyLjcuNAo+ID4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
