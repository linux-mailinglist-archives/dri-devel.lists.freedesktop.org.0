Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 901A12D3D66
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 09:32:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 350866E303;
	Wed,  9 Dec 2020 08:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2079.outbound.protection.outlook.com [40.107.22.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 729B16E957
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 09:42:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FibKigI+sWRX4miD59JPq7T0avuwf9jyZfLwk2SwGTW3OC1ZzIfcmcMzdkIZpDNkEf8Ng37x+uScMV7tNCOUAnSWoEdyy2gKNFUHrQufO7HFqQGrepKCJ3BTHzaiPDUXHpxsZv4gjAHFGau18hNuGLB1zp9KkLBDTN/EO64pQVW88jc8Sk8SoLNW5VxsGvpsrqQ7RI0WdiWtv1n/JGme3ZbvgQ1BNkmDQr1Sogu9Ijs6X/ljtNIk7fSqiX8tFT0XvFHzBc+jnnD47EEvMLa7KG9ws4c2wEpdnkjUuishdG/HPGLywdyyPZGsfUlB5JXaeHA/I9zVgSnlULeY5+K7jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/3ueHpTTM+++UnnmPCAo4hCE7YGyirjYjgIBawjVl/Q=;
 b=Q3tB6pr8+m887sCg/GN37TY6N9VhLsljwr5Y5EXAJhqDHNwX77BC0ubwgLoSHkvh3AO+PKe84fNSPlK+LaKvGclgDUVMUGZB2iQjtOlwXzVZ/GvLUypSVsD+yEMuh4M+EAbBIZJRdR5wii7aPoxJQnCCh4K2qXRQoevXHrMdL6jKrQONB1EWMvVeGZmWZvPVbQOk/YOy/ReRSr5GTVz1zCoSgJB5p0QPY3Ysi9SA/Wzy4RO/KeFAc7yR8Sk1jgVkyJW/U/Hd6HsqWWglUrAtjMsPglde7sv6B4FZk58IHSw9YT/Q9hNjWkMR9RIqO0bOLTJaX9HJOqvJyernrlx/lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/3ueHpTTM+++UnnmPCAo4hCE7YGyirjYjgIBawjVl/Q=;
 b=mHjpAq0YZNCzUDsCiyrQzaLQ9KQgrVhZJ89k2+reHUDuLfIeFhnwD6xCBy1BX9PffDROeN1T5Eh3WeVCNWFeNalMqRB7SO92OFoiqtFNv9yOl1raTzhVuadYVYUaJZQkC9U/QslFqfzMD/O/5IYVGcS4ZpiQ0HNCuLO7sNqyWqo=
Authentication-Results: puri.sm; dkim=none (message not signed)
 header.d=none;puri.sm; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB7184.eurprd04.prod.outlook.com (2603:10a6:800:125::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Tue, 8 Dec
 2020 09:42:35 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3632.023; Tue, 8 Dec 2020
 09:42:35 +0000
Message-ID: <bda6bff4a5740a352832a1d1b8cf7608b02ccd00.camel@nxp.com>
Subject: Re: [PATCH 0/4] phy: phy-fsl-imx8-mipi-dphy: Add i.MX8qxp LVDS PHY
 mode support
From: Liu Ying <victor.liu@nxp.com>
To: Guido =?ISO-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>
Date: Tue, 08 Dec 2020 17:40:43 +0800
In-Reply-To: <20201208090244.GA20575@bogon.m.sigxcpu.org>
References: <1607067224-15616-1-git-send-email-victor.liu@nxp.com>
 <20201208090244.GA20575@bogon.m.sigxcpu.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0247.apcprd06.prod.outlook.com
 (2603:1096:4:ac::31) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry.ap.freescale.net (119.31.174.66) by
 SG2PR06CA0247.apcprd06.prod.outlook.com (2603:1096:4:ac::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Tue, 8 Dec 2020 09:42:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7123f8c7-ab07-4dcd-a92a-08d89b5d97a8
X-MS-TrafficTypeDiagnostic: VI1PR04MB7184:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB71841212D06F1F64A5E747D798CD0@VI1PR04MB7184.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LF8BEuH9NKBcgBT3r4SUIPo/MzEASevjk0TPRI0eeiiECMica5oJJLnw7rXfb8E4bZcCvNGj3JUCu9w6BoPmj4hpahPE8NDkfbMaSLzDPGQNJup6tEiiHheNM7+Bu7TNlPzWom5syp0MDjupI79bXmzbLDOYWCYgEV4MdpO3mWWdDZgXOkmQDiJJCPSIfDuq1lkzbXzu/mlSLC0VgU34HHqRGdHCVGXoBX9grcxlHahNXI6Jbq+8PvX+rKjQphI/ijXNi67Nbuvl8D3y83Ahj5OKtW4fDLvY/V3OO0UnhF3HCulY9B0Lm6+RzUBPLcCdLILoT4YDBOggespD42OD7xzKf9prFL4uDCAK+siXMVT3IFksFnzZ2DryPmbKMUxva035+5HfKIG2tjWAcKnan9+BDCY7hRfdhLoZVXnjkSlCezJG6brKSDPH7jPTl59je2ADTY28OIyn5AGub0lqsg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(376002)(36756003)(6512007)(83380400001)(52116002)(34490700003)(508600001)(966005)(2616005)(66946007)(186003)(956004)(7416002)(6486002)(26005)(6916009)(16526019)(5660300002)(4326008)(8936002)(86362001)(8676002)(6506007)(66556008)(2906002)(66476007)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?V2JuTktBNnJuQllUdlVHSnlHdFNJUFB6cGhyaGh3NVYrS3l2cE1nZXdzdnJ2?=
 =?utf-8?B?Y2h5Uks5OEFkV0dFOGtnTVd1M3hic2ZtTDZqYUYwcTVJSkc4VHA0bEFXbW5n?=
 =?utf-8?B?cUF6Z3JFb2RGTWNhVXR0Y0JiaFk2RXZKbDI0ZnNrMTdpL0RDOFFFTnhscTZp?=
 =?utf-8?B?aHUzaU5QaEtqVHRuWGV3VkUwZlpFb2lzdDFKTUpoOGpxNCtuTWVORzNaWGNO?=
 =?utf-8?B?aVMwNlI0Q2N6TmdSVHNIajlMQ0tNampoYzdDdXdMSU83QXRDZ3gzdklESTNN?=
 =?utf-8?B?aFRoQW0rcTNudGdhV2YvNW1UVlJPaEFVL0tzSG9IM0E4ZG1MY0gwKzY1TnVY?=
 =?utf-8?B?NktZM1VLcXRMNjVMaHFPL0JXV2NjTy9KMVpzUXd0czdIMUdkemFQNEQzTGQx?=
 =?utf-8?B?VEs3RmtLbnRDSkx0bWprMmpoeTlIQU92TE1TMmw2MnRWVTd1YXFLdVpiM2Vo?=
 =?utf-8?B?MWJBcVN5aUNWdXpuSkZyVXFLWFp1WUYrT0d5d3V3a2xOV1UzditNandLTnF2?=
 =?utf-8?B?RVhDZUNFTWFzZ2d1SXNmMjdrTWN4amRQMmtIaEloTDJNdUhHQmd1emYxKzZG?=
 =?utf-8?B?ZWEwbUlMRDkweDhqK21OMy9WaG1seHd3SkZOaTlXNXVGSkpZSXV1azhmUmpa?=
 =?utf-8?B?Y3hSVGFjOWpSS2gwdGpTbXZWblJjdEYvUmF4T3NNTThYZE9MQU9henRKaXZO?=
 =?utf-8?B?TVErRTNiazE3ZTVTdzN4cHVia0hZZURVbSt4cFpQTTRReFhyWjBNeEhmMDV3?=
 =?utf-8?B?NEt4VGFVVU1nTnhISExKRFZWSnRWeVRVeGk4VjBpOUZKUmR3UTF3cnR5ZFJN?=
 =?utf-8?B?UXJOUUEvTko0Rld5RUU0SFlHSWNPbjRybGwzdGVaZWRCRDRLZFFNN2xhTXNN?=
 =?utf-8?B?ZVlvV3hYbTc1emRhc2IzazU1MTUrQjEvRXNBVDNUTjdqVmY3QkRTSTMzYWhX?=
 =?utf-8?B?a1N6YU9IRFJDODF5SGNhbjBEMVR4SHRHTnY5VFFRYlZ1dit5YmErUzNHclZ5?=
 =?utf-8?B?NDY4S05GaWZ0Z0FFaGZyQmJHVFkwREwwdXdIZDFUb2R4SC9UOERtcVJMZWlt?=
 =?utf-8?B?QnNpUGhLeDR1VzlnUFd4dmdNcnhldkVneVdSYTlTNktjMElidDJlajl4QWpL?=
 =?utf-8?B?cDU5MEl1eFF0bFpvYjM4MTFETFFFaHpZMEdmRjRWdTNnMlphSVZMR2t2aTJH?=
 =?utf-8?B?eTlienRCbDdCV1JUQ0VXYjFKY2E1eTJqeDUycXVLSFlUZUpKYmhqTmxKazJr?=
 =?utf-8?B?dFBUb2xvcHlVMWU1b0theHJ1R3puRUNITUhuT1JkMVJLZ3FBNmpRTk4wQXJy?=
 =?utf-8?Q?oLfoLhHGgNIgRFuHPokqJ7cfwAZRr0e0g1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7123f8c7-ab07-4dcd-a92a-08d89b5d97a8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 09:42:35.6788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hqAXLuuLnFS8rJ9/OHHLwCMxkCb4I2YYcWUcJhcTtWD0V25k9hqxq23eCjJi0cmL/Ifp1zR3EWmK7LNU2y5zHw==
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

SGkgR3VpZG8sCgpPbiBUdWUsIDIwMjAtMTItMDggYXQgMTA6MDIgKzAxMDAsIEd1aWRvIEfDvG50
aGVyIHdyb3RlOgo+IEhpIExpdSwKPiBPbiBGcmksIERlYyAwNCwgMjAyMCBhdCAwMzozMzo0MFBN
ICswODAwLCBMaXUgWWluZyB3cm90ZToKPiA+IEhpLAo+ID4gCj4gPiBUaGlzIHNlcmllcyBhZGRz
IGkuTVg4cXhwIExWRFMgUEhZIG1vZGUgc3VwcG9ydCBmb3IgdGhlIE1peGVsIFBIWSBpbiB0aGUK
PiA+IEZyZWVzY2FsZSBpLk1YOHF4cCBTb0MuCj4gCj4gVGhpcyBsb29rcyBnb29kIHRvIG1lIGZy
b20gdGhlIE5XTCBhbmQgYWN0dWFsIHBoeSBkcml2ZXIgcGFydC4gSSdsbAo+IGNvbW1lbnQgaW4g
dGhlIGluZGl2aWR1YWwgcGF0Y2hlcyBidXQgbGVhdmUgY29tbWVudHMgb24gdGhlIGV4dGVuc2lv
bgo+IG9mIHRoZSBnZW5lcmljIHBoeSBzdHJ1Y3QgdG8gc29tZW9uZSBrbm93bGVkZ2VhYmxlIHdp
dGggdGhhdCBwYXJ0LgoKVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3LgoKPiAKPiBXaGF0IGRpc3Bs
YXkgY29udHJvbGxlcnMgZG8geW91IGludGVuZCB0byBkcml2ZSB0aGF0IHdpdGg/CgpUaGUgZGlz
cGxheSBjb250cm9sbGVyIERQVSBlbWJlZGRlZCBpbiBpLk1YOHF4cCBTb0Mgd291bGQgZHJpdmUg
dGhlCk1JUEkgRFNJIGRpc3BsYXkgb3IgdGhlIExWRFMgZGlzcGxheSB0aHJvdWdoIHRoZSBNaXhl
bCBjb21ibyBQSFkuCgpJJ3ZlIHNlbnQgb3V0IGEgc2VyaWVzIHRvIGFkZCBEUFUgRFJNIGRyaXZl
ciBzdXBwb3J0KEtNUyBwYXJ0IG9ubHkgc28KZmFyKSBmb3IgcmV2aWV3OgpodHRwczovL3d3dy5z
cGluaWNzLm5ldC9saXN0cy9rZXJuZWwvbXNnMzc2MjQ2Mi5odG1sCgpJIGNhbiBDYyB5b3Ugd2hl
biBJIHNlbmQgdGhlIG5leHQgdmVyc2lvbiBmb3IgaXQuCgpSZWdhcmRzLApMaXUgWWluZwoKPiBD
aGVlcnMsCj4gIC0tIEd1aWRvCj4gCj4gPiBUaGUgTWl4ZWwgUEhZIGlzIE1JUEkgRFBIWSArIExW
RFMgUEhZIGNvbWJvLCB3aGljaCBjYW4gd29ya3MgaW4gZWl0aGVyCj4gPiBNSVBJIERQSFkgbW9k
ZSBvciBMVkRTIFBIWSBtb2RlLiAgVGhlIFBIWSBtb2RlIGlzIGNvbnRyb2xsZWQgYnkgaS5NWDhx
eHAKPiA+IFNDVSBmaXJtd2FyZS4gIFRoZSBQSFkgZHJpdmVyIHdvdWxkIGNhbGwgYSBTQ1UgZnVu
Y3Rpb24gdG8gY29uZmlndXJlIHRoZQo+ID4gbW9kZS4KPiA+IAo+ID4gVGhlIFBIWSBkcml2ZXIg
aXMgYWxyZWFkeSBzdXBwb3J0aW5nIHRoZSBNaXhlbCBNSVBJIERQSFkgaW4gaS5NWDhtcSBTb0Ms
Cj4gPiB3aGVyZSBpdCBhcHBlYXJzIHRvIGJlIGEgc2luZ2xlIE1JUEkgRFBIWS4KPiA+IAo+ID4g
Cj4gPiBQYXRjaCAxLzQgc2V0cyBQSFkgbW9kZSBpbiB0aGUgTm9ydGh3ZXN0IExvZ2ljIE1JUEkg
RFNJIGhvc3QgY29udHJvbGxlcgo+ID4gYnJpZGdlIGRyaXZlciwgc2luY2UgaS5NWDhxeHAgU29D
IGVtYmVkcyB0aGlzIGNvbnRyb2xsZXIgSVAgdG8gc3VwcG9ydAo+ID4gTUlQSSBEU0kgZGlzcGxh
eXMgdG9nZXRoZXIgd2l0aCB0aGUgTWl4ZWwgUEhZLgo+ID4gCj4gPiBQYXRjaCAyLzQgYWxsb3dz
IExWRFMgUEhZcyB0byBiZSBjb25maWd1cmVkIHRocm91Z2ggdGhlIGdlbmVyaWMgUEhZIGZ1bmN0
aW9ucwo+ID4gYW5kIHRocm91Z2ggYSBjdXN0b20gc3RydWN0dXJlIGFkZGVkIHRvIHRoZSBnZW5l
cmljIFBIWSBjb25maWd1cmF0aW9uIHVuaW9uLgo+ID4gCj4gPiBQYXRjaCAzLzQgYWRkcyBkdCBi
aW5kaW5nIHN1cHBvcnQgZm9yIHRoZSBNaXhlbCBjb21ibyBQSFkgaW4gaS5NWDhxeHAgU29DLgo+
ID4gCj4gPiBQYXRjaCA0LzQgYWRkcyB0aGUgaS5NWDhxeHAgTFZEUyBQSFkgbW9kZSBzdXBwb3J0
IGluIHRoZSBNaXhlbCBQSFkgZHJpdmVyLgo+ID4gCj4gPiAKPiA+IFdlbGNvbWUgY29tbWVudHMs
IHRoYW5rcy4KPiA+IAo+ID4gCj4gPiBMaXUgWWluZyAoNCk6Cj4gPiAgIGRybS9icmlkZ2U6IG53
bC1kc2k6IFNldCBQSFkgbW9kZSBpbiBud2xfZHNpX2VuYWJsZSgpCj4gPiAgIHBoeTogQWRkIExW
RFMgY29uZmlndXJhdGlvbiBvcHRpb25zCj4gPiAgIGR0LWJpbmRpbmdzOiBwaHk6IG1peGVsOiBt
aXBpLWRzaS1waHk6IEFkZCBNaXhlbCBjb21ibyBQSFkgc3VwcG9ydCBmb3IKPiA+ICAgICBpLk1Y
OHF4cAo+ID4gICBwaHk6IGZyZWVzY2FsZTogcGh5LWZzbC1pbXg4LW1pcGktZHBoeTogQWRkIGku
TVg4cXhwIExWRFMgUEhZIG1vZGUKPiA+ICAgICBzdXBwb3J0Cj4gPiAKPiA+ICAuLi4vZGV2aWNl
dHJlZS9iaW5kaW5ncy9waHkvbWl4ZWwsbWlwaS1kc2ktcGh5LnR4dCB8ICAgOCArLQo+ID4gIGRy
aXZlcnMvZ3B1L2RybS9icmlkZ2UvbndsLWRzaS5jICAgICAgICAgICAgICAgICAgIHwgICA2ICsK
PiA+ICBkcml2ZXJzL3BoeS9mcmVlc2NhbGUvcGh5LWZzbC1pbXg4LW1pcGktZHBoeS5jICAgICB8
IDI2NiArKysrKysrKysrKysrKysrKysrKy0KPiA+ICBpbmNsdWRlL2xpbnV4L3BoeS9waHktbHZk
cy5oICAgICAgICAgICAgICAgICAgICAgICB8ICA0OCArKysrCj4gPiAgaW5jbHVkZS9saW51eC9w
aHkvcGh5LmggICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDQgKwo+ID4gIDUgZmlsZXMg
Y2hhbmdlZCwgMzIwIGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQo+ID4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L3BoeS9waHktbHZkcy5oCj4gPiAKPiA+IC0tIAo+ID4g
Mi43LjQKPiA+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
