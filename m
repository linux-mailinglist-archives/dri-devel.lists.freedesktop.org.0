Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4967E36D3BE
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 10:13:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF526E075;
	Wed, 28 Apr 2021 08:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10115.outbound.protection.outlook.com [40.107.1.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE506E075
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 08:13:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cuwgSU/CrWZ2WD3yRad+7N5bJg7R7vf1G/cpOaX7ULv2r24HB/HjLzUCMWdfBNwxEF7bY2cqqDfTa3TNDpVRNFi5M3gbISmu3xLOyV6c4ZMzCvE5ueBB1B2UvT3KAL6rGmjVzb5buZFo3+6ClPtbLdgHkQlHadr+7Md1Sqvmu1Si7rUt0q/v1PP8OgIt89CfhIJEAPYzhFCWQl5OugfiE8XLs9axm6rXCHfPd6Mn+Y1UIxZ95eDvpskLbll/n2PEWnMk1JejVApkw2k1xrH02yoQCFfqdnvFOZsm1eQAVAankf37vmKNIQpSEgsOjUVO0EGuBB6Bd1U8bnSRICyOEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Esem6T9/pjcCNmEg5vpResF9elIMXzKMq6sXvRlOTh8=;
 b=Gygkt5mWARfrPv9HLpKiBPnVjXk/p87QNaCSDSr9uLt9QC6LsF37DhzU1NWWCIryvvrjMuF99vxYR3GzfURthaSn7lXOCJP8jtS7Rf6kr8AQ1bEn0HT8iBXOXUf4MWju5xf54vKEfvcx2VLqgQFQ+PqgJi/QPZzQyIBTc/nq15k+qU2x34Y2ib5WdN4hQLbu1hWaLgSoIPhilW3Ry4c0yYzBVd9oX+q2PKEq3s6fN2zRDm0V42pxj3RYbwpJiW6f3vCugx651PU3Mg6x5kK4PPRgfxuUoz5U+z8LVZsA+WJ4CgyToBOi/4808ouXesXXmxCCC/Ti7CruYtMzc2++yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Esem6T9/pjcCNmEg5vpResF9elIMXzKMq6sXvRlOTh8=;
 b=cvbq+P1CGRs+GUX5oTESyWYuyyiOVkqzOKjUs0j/eO0cswONl3yVZd+aKUt4Xjf3xRoIyOY9K1AlK9VMwsAjAS0At1iitemBnCkIynvlMWyt6WKe7tnOqBJpYFBJtrKaib8gufBafk9MaipRSIDOf+UuVPJnSaE8gPNu7D/9+g4=
Authentication-Results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none
 header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM8PR10MB4242.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1ed::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 08:13:07 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 08:13:07 +0000
Subject: Re: [PATCH V2 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and
 SN65DSI84 driver
From: Frieder Schrempf <frieder.schrempf@kontron.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
References: <20210421223122.112736-1-marex@denx.de>
 <20210421223122.112736-2-marex@denx.de>
 <f3b55e0b-20d2-0add-e097-e03a675a1169@kontron.de>
Message-ID: <66386909-5b89-78ab-6fcc-5bef95a66035@kontron.de>
Date: Wed, 28 Apr 2021 10:13:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <f3b55e0b-20d2-0add-e097-e03a675a1169@kontron.de>
Content-Language: en-US
X-Originating-IP: [89.244.188.238]
X-ClientProxiedBy: AM0P190CA0012.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::22) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.10.27] (89.244.188.238) by
 AM0P190CA0012.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.22 via Frontend Transport; Wed, 28 Apr 2021 08:13:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ce669d7-04be-4e0d-a624-08d90a1d7430
X-MS-TrafficTypeDiagnostic: AM8PR10MB4242:
X-Microsoft-Antispam-PRVS: <AM8PR10MB424283E55133152ABC068A7DE9409@AM8PR10MB4242.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 06TjWjAqFv9RKEtRQ57U0vCcuwETyWumnzhidQ26fdtPdtrbCsJlDBSGXih1IB+vZBjrWQQtLdXA7ZiTjhqpcBLhTD1+7vaEzZh8Y+GU1LxV4Q9ZVfYpgfoRirePKEU0GyvXzn/u7bhxgORZm8p8PLhK4Cy+BueW0jCl10DAF1tg+Gi9yjVF7/YvkyRiQT6ZC9h/OVqXCCyN8SwPUCUfPaIEYd+JC3Fde/h6RjFuXCctppwyapbeUfYAqpyMSDdc0OTSOsios4xPd1IkldDWqwqgB+K+XKWwCMqndZ4E8hY+1kJEF0Vk7VGPYfmdTDfx+GTunmIBLgvCYeSBH6R4sqXE5G1+cX+vHcpLGgjAUy3DANi+r6kv3qjiaRtbu+xxzO3GSPRG4qtwCm+Fle8aLcr06s6TOBFkTyGlGy2YhuP1AM1jslzKgttfYqKjAl2k29Tb8PIyRLscIsE2iNC6w251NfQvH9P55dRLdUWgdvfzEMy9fEd7h0I036LwjjgQ4MWAAUn1CFw6p+CvcKCk2QIdiT7Ur/1xLugdJU8gXZUm0JcIr6BD0jef7VPFegeBVyYsZdhVy0EMf7MThmtEO0UGnOaX8dU+7ayB5ws4Wxx4f7SdDanzSoI3u/LnTAR2GjR8+fzjZQ86wA43cOwyJOg26EM5EihE5bRrIcxEgspdtoTPgn6aYCOlnKPohi1l
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(136003)(366004)(396003)(44832011)(478600001)(31686004)(53546011)(16576012)(36756003)(66556008)(5660300002)(38100700002)(186003)(316002)(26005)(86362001)(54906003)(2616005)(2906002)(31696002)(956004)(16526019)(83380400001)(8936002)(6486002)(4326008)(7416002)(66946007)(8676002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aThXVVBtczlYT1I4STYxUGZ5cURIQTg1WVVCNnpoYlNhZGVWM3dTdGlMc1lp?=
 =?utf-8?B?VlBFYk00NmhrRGVITko4WE9BL1RVekNXdjdtYXJwNjdROFQ1dGM2SHlqVVdr?=
 =?utf-8?B?RmtHWVRyeFpLQks4emZKVng0R3BaRzdyR2xKcEU2ZG1Qa2VBTkE5R0xVWWRV?=
 =?utf-8?B?ZllJNlpsWHJXTzJEV2tGNUY4WWc3dkxtYkpBZVk0Zk9BeStYcDRlZUhVYmU3?=
 =?utf-8?B?ZGEwVS9iUHR3WW1lVEJLM1I0ME1oRVJaeXJURzQ1WE9iQ2pHSFlxemdreWN3?=
 =?utf-8?B?L09xL3hLR1FCUVlVbzBKVjRjRHN0eEhYZzBIK1lCcVh4bXVqeitVdzducDZE?=
 =?utf-8?B?TXgyL0lRMHZ5YVFaN3BjNlhpejJIY0w5ZnNVd1drUXAzMTFNa21QclNLN0VS?=
 =?utf-8?B?OFhXU0wycWQyYmhZaFduMTdQdXNRcTQ1RnFPbmRldEtBQ01GSnVQbnordGpP?=
 =?utf-8?B?M1dNY09OdUdZVksrYngzTUJReVJKUzFNR2NuSjgyNkUzdDNJOGF2QUdZOFlO?=
 =?utf-8?B?QXR4bnJGdjBLUkpkdTFUQ2p6YlNlRGNxTmlUQnhXWjN3aUVtRXA5UHVpS0dh?=
 =?utf-8?B?c1cxNFRITFhGbFMxOFBMWkUrRHBDNDVtOSs3TXRKdmlzZmFteHdCaWpmZzVz?=
 =?utf-8?B?Y2hKc1kzN05BY0prdXhRNlNvSGdLOEJLYkVwNGdVUjJCZHdQWkEzOVE1U1JO?=
 =?utf-8?B?a250OVFVOWQ5dDI3Z3dVK3dWdjN1NU5XdVl2dTR0Mm94SHZsUFgxZjhWM3pP?=
 =?utf-8?B?eTlCTHBpVGdZb3E1SUhmZkVWRFhYZ2ZqM0kwdnBaSTNld3l5NlAyTGZoVHFn?=
 =?utf-8?B?a0tFOWpDb29WMzA5OWlQOXBCZ2dERW9ONmxNdVdDdjh6aUx1SzJLTU1xcU1y?=
 =?utf-8?B?N1dnblBiYWNZQytFdUw1L0RjTEFTNUZOcmFGeklCTTlUekw5RnlCV01qcGIr?=
 =?utf-8?B?MUI2QXNMRUovemVvektISDg5OWJ5aHNqL2ZrbVVKcWpnNGdtYlQ3RDQ1TFM2?=
 =?utf-8?B?RGkzMnlRVWdaY1U4V2gvOEdhYWM5OW5rdEJrMkR3TGtNbnhRWjFEdk9Oa3JP?=
 =?utf-8?B?SmxkV0dGT3M4anNqUlRTOFlhZnlXVzFyNFBpMW9qYzZjaFl5V2l2a1lGMmtK?=
 =?utf-8?B?dTd3NFBmRUlQTXVoRzdLZUVtd0hEQ0VSYmZBMGhwNXlNdlFnOHh1bHdKYmxC?=
 =?utf-8?B?VnloYTJ4VXEzRzVvK1hlSCtvVkVncktVWFJPM05ObUpJY1ZZUEt2ODg2WE5w?=
 =?utf-8?B?d1JTZ1hZei83YVhWbS9yWHBjdUM1UnIwaEgxTnY0MkYvOTlwQ3Vlam05bVdw?=
 =?utf-8?B?TWdGNytFTmkyV05FK2MwVnRRNDc0RnJMVnVIOHlNVWh5UmJXSUs5enY5QlBT?=
 =?utf-8?B?dy9kWDJBS1F6Z0R1VzFhNHhiQjJxbXFaRE41L0pPSFRPMnBQaXFsQ1VMY2FO?=
 =?utf-8?B?a1Q1SFlRbTVPNHdJVlBnTzhQM3dQSklDcmNLMDBqSnZxNjM0aFBLVkJtMjBz?=
 =?utf-8?B?NjNhb1FoWnl0cUZYYWJnRlh1VTV5MXI0OU9NQXdEMENQK1dTNHo4cUZvTCtW?=
 =?utf-8?B?S1FtM3pqZDZJbzlqVVlyMmRiSUFqbk9waFRFbXdVbzFISWdMalhSWEMrbnZI?=
 =?utf-8?B?UHIwU1kvWVE0NHMwNnZwRHp6OXNyOE1qekRWRXN4enlZcGFaNzVRMkgxUFVi?=
 =?utf-8?B?TnZBVzMzS0FaZ08yKytKQnQ4UHZDSCtod0VXbnBtQjVGREtWYVozdzNBek1p?=
 =?utf-8?Q?WQ3krO5tf1556IEkQXf8asR2ggEh1J7FM2ieEe6?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ce669d7-04be-4e0d-a624-08d90a1d7430
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 08:13:07.0799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PbQbepkNeChi1ryjnsnWYCRhDcYOCUxjBiDmrzens35fGLo61amIA+SPgR24LUvAlTJ6KsUoV+wZQCOmXdBpkaEuiyqiBE0hKm0IUfY+LjI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4242
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
Cc: ch@denx.de, Douglas Anderson <dianders@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Valentin Raevsky <valentin@compulab.co.il>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjguMDQuMjEgMDk6NTEsIEZyaWVkZXIgU2NocmVtcGYgd3JvdGU6Cj4gT24gMjIuMDQuMjEg
MDA6MzEsIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiBBZGQgZHJpdmVyIGZvciBUSSBTTjY1RFNJODMg
U2luZ2xlLWxpbmsgRFNJIHRvIFNpbmdsZS1saW5rIExWRFMgYnJpZGdlCj4+IGFuZCBUSSBTTjY1
RFNJODQgU2luZ2xlLWxpbmsgRFNJIHRvIER1YWwtbGluayBvciAyeCBTaW5nbGUtbGluayBMVkRT
Cj4+IGJyaWRnZS4gVEkgU042NURTSTg1IGlzIHVuc3VwcG9ydGVkIGR1ZSB0byBsYWNrIG9mIGhh
cmR3YXJlIHRvIHRlc3Qgb24sCj4+IGJ1dCBlYXN5IHRvIGFkZC4KPj4KPj4gVGhlIGRyaXZlciBv
cGVyYXRlcyB0aGUgY2hpcCB2aWEgSTJDIGJ1cy4gQ3VycmVudGx5IHRoZSBMVkRTIGNsb2NrIGFy
ZQo+PiBhbHdheXMgZGVyaXZlZCBmcm9tIERTSSBjbG9jayBsYW5lLCB3aGljaCBpcyB0aGUgdXN1
YWwgbW9kZSBvZiBvcGVyYXRpb24uCj4+IFN1cHBvcnQgZm9yIGNsb2NrIGZyb20gZXh0ZXJuYWwg
b3NjaWxsYXRvciBpcyBub3QgaW1wbGVtZW50ZWQsIGJ1dCBpdCBpcwo+PiBlYXN5IHRvIGFkZCBp
ZiBldmVyIG5lZWRlZC4gT25seSBSR0I4ODggcGl4ZWwgZm9ybWF0IGlzIGltcGxlbWVudGVkLCB0
aGUKPj4gTFZEUzY2NiBpcyBub3Qgc3VwcG9ydGVkLCBidXQgY291bGQgYmUgYWRkZWQgaWYgbmVl
ZGVkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KPj4g
Q2M6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4KPj4gQ2M6IEphZ2Fu
IFRla2kgPGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+PiBDYzogTGF1cmVudCBQaW5jaGFy
dCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+PiBDYzogTGludXMgV2FsbGVp
aiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgo+PiBDYzogUGhpbGlwcGUgU2NoZW5rZXIgPHBo
aWxpcHBlLnNjaGVua2VyQHRvcmFkZXguY29tPgo+PiBDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2
bmJvcmcub3JnPgo+PiBDYzogU3RlcGhlbiBCb3lkIDxzd2JveWRAY2hyb21pdW0ub3JnPgo+PiBD
YzogVmFsZW50aW4gUmFldnNreSA8dmFsZW50aW5AY29tcHVsYWIuY28uaWw+Cj4+IFRvOiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+IFRlc3RlZC1ieTogTG9pYyBQb3VsYWluIDxs
b2ljLnBvdWxhaW5AbGluYXJvLm9yZz4KPj4gLS0tCj4+IFYyOiAtIFVzZSBkZXZfZXJyX3Byb2Jl
KCkKPj4gwqDCoMKgwqAgLSBTZXQgUkVHX1JDX1JFU0VUIGFzIHZvbGF0aWxlCj4+IMKgwqDCoMKg
IC0gV2FpdCBmb3IgUExMIHN0YWJpbGl6YXRpb24gYnkgcG9sbGluZyBSRUdfUkNfTFZEU19QTEwK
Pj4gwqDCoMKgwqAgLSBVc2UgY3R4LT5tb2RlID0gKmFkaiBpbnN0ZWFkIG9mICptb2RlIGluIHNu
NjVkc2k4M19tb2RlX3NldAo+PiDCoMKgwqDCoCAtIEFkZCB0ZXN0ZWQgRFNJODQgc3VwcG9ydCBp
biBkdWFsLWxpbmsgbW9kZQo+PiDCoMKgwqDCoCAtIENvcnJlY3RseSBzZXQgVkNPTQo+PiDCoMKg
wqDCoCAtIEZpbGwgaW4gbWlzc2luZyBEU0kgQ0hCIGFuZCBMVkRTIENIQiBiaXRzIGZyb20gRFNJ
ODQgYW5kIERTSTg1Cj4+IMKgwqDCoMKgwqDCoCBkYXRhc2hlZXRzLCB3aXRoIHRoYXQgYWxsIHRo
ZSByZXNlcnZlZCBiaXRzIG1ha2UgZmFyIG1vcmUgc2Vuc2UKPj4gwqDCoMKgwqDCoMKgIGFzIHRo
ZSBEU0k4MyBhbmQgRFNJODQgc2VlbXMgdG8gYmUgcmVkdWNlZCB2ZXJzaW9uIG9mIERTSTg1Cj4+
IC0tLQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWfCoMKgwqDCoMKgwqDCoCB8
wqAgMTAgKwo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL01ha2VmaWxlwqDCoMKgwqDCoMKg
IHzCoMKgIDEgKwo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4My5jIHwg
NjE3ICsrKysrKysrKysrKysrKysrKysrKysrKysrCj4+IMKgIDMgZmlsZXMgY2hhbmdlZCwgNjI4
IGluc2VydGlvbnMoKykKPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvdGktc242NWRzaTgzLmMKPj4KPiBbLi4uXQo+PiArc3RhdGljIGludCBzbjY1ZHNpODNf
cHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgY29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgKmlkKQo+PiArewo+PiArwqDCoMKg
IHN0cnVjdCBkZXZpY2UgKmRldiA9ICZjbGllbnQtPmRldjsKPj4gK8KgwqDCoCBlbnVtIHNuNjVk
c2k4M19tb2RlbCBtb2RlbDsKPj4gK8KgwqDCoCBzdHJ1Y3Qgc242NWRzaTgzICpjdHg7Cj4+ICvC
oMKgwqAgaW50IHJldDsKPj4gKwo+PiArwqDCoMKgIGN0eCA9IGRldm1fa3phbGxvYyhkZXYsIHNp
emVvZigqY3R4KSwgR0ZQX0tFUk5FTCk7Cj4+ICvCoMKgwqAgaWYgKCFjdHgpCj4+ICvCoMKgwqDC
oMKgwqDCoCByZXR1cm4gLUVOT01FTTsKPj4gKwo+PiArwqDCoMKgIGN0eC0+ZGV2ID0gZGV2Owo+
PiArCj4+ICvCoMKgwqAgaWYgKGRldi0+b2Zfbm9kZSkKPj4gK8KgwqDCoMKgwqDCoMKgIG1vZGVs
ID0gKGVudW0gc242NWRzaTgzX21vZGVsKW9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YShkZXYpOwo+
PiArwqDCoMKgIGVsc2UKPj4gK8KgwqDCoMKgwqDCoMKgIG1vZGVsID0gaWQtPmRyaXZlcl9kYXRh
Owo+PiArCj4+ICvCoMKgwqAgLyogRGVmYXVsdCB0byBkdWFsLWxpbmsgTFZEUyBvbiBhbGwgYnV0
IERTSTgzLiAqLwo+PiArwqDCoMKgIGlmIChtb2RlbCAhPSBNT0RFTF9TTjY1RFNJODMpCj4+ICvC
oMKgwqDCoMKgwqDCoCBjdHgtPmx2ZHNfZHVhbF9saW5rID0gdHJ1ZTsKPiAKPiBXaGF0IGlmIEkg
dXNlIHRoZSBEU0k4NCB3aXRoIGEgc2luZ2xlIGxpbmsgTFZEUz8gSSBjYW4ndCBzZWUgYW55IHdh
eSB0byAKPiBjb25maWd1cmUgdGhhdCByaWdodCBub3cuCgpJIGp1c3Qgc2F3IHRoZSBub3RlIGlu
IHRoZSBoZWFkZXIgb2YgdGhlIGRyaXZlciB0aGF0IHNheXMgdGhhdCBzaW5nbGUgCmxpbmsgbW9k
ZSBpcyB1bnN1cHBvcnRlZCBmb3IgdGhlIERTSTg0LgoKSSBoYXZlIGhhcmR3YXJlIHdpdGggYSBz
aW5nbGUgbGluayBkaXNwbGF5IGFuZCBpZiBJIHNldCAKY3R4LT5sdmRzX2R1YWxfbGluayA9IGZh
bHNlIGl0IHdvcmtzIGp1c3QgZmluZS4KCkhvdyBpcyB0aGlzIHN1cHBvc2VkIHRvIGJlIHNlbGVj
dGVkPyBEb2VzIGl0IG5lZWQgYW4gZXh0cmEgZGV2aWNldHJlZSAKcHJvcGVydHk/IEFuZCB3b3Vs
ZCB5b3UgbWluZCBhZGRpbmcgc2luZ2xlLWxpbmsgc3VwcG9ydCBpbiB0aGUgbmV4dCAKdmVyc2lv
biBvciBkbyB5b3UgcHJlZmVyIGFkZGluZyBpdCBpbiBhIGZvbGxvdy11cCBwYXRjaD8KCj4gCj4+
ICsKPj4gK8KgwqDCoCBjdHgtPmVuYWJsZV9ncGlvID0gZGV2bV9ncGlvZF9nZXQoY3R4LT5kZXYs
ICJlbmFibGUiLCAKPj4gR1BJT0RfT1VUX0xPVyk7Cj4+ICvCoMKgwqAgaWYgKElTX0VSUihjdHgt
PmVuYWJsZV9ncGlvKSkKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBQVFJfRVJSKGN0eC0+ZW5h
YmxlX2dwaW8pOwo+PiArCj4+ICvCoMKgwqAgcmV0ID0gc242NWRzaTgzX3BhcnNlX2R0KGN0eCk7
Cj4+ICvCoMKgwqAgaWYgKHJldCkKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+ICsK
Pj4gK8KgwqDCoCBjdHgtPnJlZ21hcCA9IGRldm1fcmVnbWFwX2luaXRfaTJjKGNsaWVudCwgCj4+
ICZzbjY1ZHNpODNfcmVnbWFwX2NvbmZpZyk7Cj4+ICvCoMKgwqAgaWYgKElTX0VSUihjdHgtPnJl
Z21hcCkpCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gUFRSX0VSUihjdHgtPnJlZ21hcCk7Cj4+
ICsKPj4gK8KgwqDCoCBkZXZfc2V0X2RydmRhdGEoZGV2LCBjdHgpOwo+PiArwqDCoMKgIGkyY19z
ZXRfY2xpZW50ZGF0YShjbGllbnQsIGN0eCk7Cj4+ICsKPj4gK8KgwqDCoCBjdHgtPmJyaWRnZS5m
dW5jcyA9ICZzbjY1ZHNpODNfZnVuY3M7Cj4+ICvCoMKgwqAgY3R4LT5icmlkZ2Uub2Zfbm9kZSA9
IGRldi0+b2Zfbm9kZTsKPj4gK8KgwqDCoCBkcm1fYnJpZGdlX2FkZCgmY3R4LT5icmlkZ2UpOwo+
PiArCj4+ICvCoMKgwqAgcmV0dXJuIDA7Cj4+ICt9Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
