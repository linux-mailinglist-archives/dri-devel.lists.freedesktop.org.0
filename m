Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 281EB36EE18
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 18:27:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB516F3B5;
	Thu, 29 Apr 2021 16:27:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50092.outbound.protection.outlook.com [40.107.5.92])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D030A6F3B5
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 16:27:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aOXB99lOGohtnpbACbeqpsHod3QzFgGeTPzsnqdWlbljOK8L1ala4Lo6XKNRBbfMTtN2ewFk/f69cxD9d54Xd0PMxZ5t6GUmchaD4I/5Cye2h3FM/i9q0P76JBmkHJxOXNFzxC1Dy1geWH9Cl9acNOl2NZaUc9H7Ky3Gi9U7vhWzMDH43W9ntLc0JyI98nFPSgz17C+z07UEs7h73F3Yg4rvxXdLxV2KBIVgPCRHuGeebw3wd3h7gHkKBAsYnq7nXP8p1jrfF5gI1qfbsHahNFc2Tghk/+SptaBvZSco9s/b5ISpL7uxWCrUhopF45CM6cNgVPc6uXdsS7e+k8+RIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bWVmQvxeq/5crB3lNDcz7dI+dGpizJ81/RVHrl1BwT4=;
 b=Tm0CapuiFkB8Ni2MaxszLYKh1PQj8b0JeF5qrQyK+C18pFp67h0hZgxPO+zdNqq1JLb7P8V9av1JSg02j0qlImxCUY9YZw5WTfQAQiZ7s+3112rGYNRJ6/0qwp/FuGkNw2FxoYas686uca2zU92PCTxU12B6HeLydcYDiZEov8hfD9KV+9Hz86sn7x8OSTd95RMs+ystxaL3UPCOGk3PZ1G//UCrm8oTtJSupL7Hmx7TAP9InD06MwRLljMoCA1XWudL/XHqgOrvA8+JgSUq/9mHecc5N8ylcxelLPkY8gPi0EZMhCeRoE+JrbpaBUDJe0eOlsnLlHvYWIoB3sko/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bWVmQvxeq/5crB3lNDcz7dI+dGpizJ81/RVHrl1BwT4=;
 b=PHoGFXGqRM5pzyiYxCihuMkfG+Lryh+A7iGhh4tIesqUdke61vW0bZRtkr8eqOKxIc6dETl0lG5koz4KXkBPfAJmJL+Wl57Vx2X1zpY8KTIuXLyudnspUQG6F/OKc1my0OSdW/XHsrwb8OSfX4LHdYE46wO9HZV0RjIj1h98PaY=
Authentication-Results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none
 header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM0PR10MB1873.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:48::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Thu, 29 Apr
 2021 16:27:16 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87%7]) with mapi id 15.20.4065.027; Thu, 29 Apr 2021
 16:27:16 +0000
Subject: Re: [PATCH V2 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and
 SN65DSI84 driver
To: Marek Vasut <marex@denx.de>, Neil Armstrong <narmstrong@baylibre.com>,
 Loic Poulain <loic.poulain@linaro.org>
References: <20210421223122.112736-1-marex@denx.de>
 <20210421223122.112736-2-marex@denx.de>
 <f3b55e0b-20d2-0add-e097-e03a675a1169@kontron.de>
 <66386909-5b89-78ab-6fcc-5bef95a66035@kontron.de>
 <CAMZdPi8kuru4+tQ3Oz-rv+D5F--8LHWa+ppJ_ywH7MWz+auKYA@mail.gmail.com>
 <f4ad222e-3468-3bfd-8a37-45cef5ee5b47@baylibre.com>
 <a91a379a-2d3a-fe31-98b5-194bf648bc44@denx.de>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
Message-ID: <b1a58421-5032-09d2-c95d-5ac6fd38c118@kontron.de>
Date: Thu, 29 Apr 2021 18:27:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <a91a379a-2d3a-fe31-98b5-194bf648bc44@denx.de>
Content-Language: en-US
X-Originating-IP: [109.250.137.217]
X-ClientProxiedBy: AM3PR07CA0091.eurprd07.prod.outlook.com
 (2603:10a6:207:6::25) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.10.27] (109.250.137.217) by
 AM3PR07CA0091.eurprd07.prod.outlook.com (2603:10a6:207:6::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.8 via Frontend Transport; Thu, 29 Apr 2021 16:27:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfefb8ca-2d76-436e-6bfa-08d90b2ba6d7
X-MS-TrafficTypeDiagnostic: AM0PR10MB1873:
X-Microsoft-Antispam-PRVS: <AM0PR10MB1873A6C3837432A86EADFB0BE95F9@AM0PR10MB1873.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FCPMNSltEyvEPGwgBan3gzAA2f7JpQT5ywq0XoR/m1hoarkU92rCuQtbSYBqKPQ0/I8ysNEjicFNqDfR/Q3qMac3S5nGqExRZbuFiDseYyznxLF6fr81p93fYx8PQhzyNupgL0wf4ORsKccoqAA0lpOuFk0HhhiJBbV3kUoEpzzISE7c8EGXJQ+zFqJCyHl3JS6VhT+SHMto58+DGoqfsoozQvGez+jBCNI0GNPCvA0sAhENQwcTJHEcHAptN20XIqefPlF8XD9O52vkI6DJjZuQVbwthSTvdwWr/MotG8kG573Bx/T/lbRIFZL8bAjp6jbp9bRbizmeKwBxBSKOQ2P8HTia0K09mJ8ohDHNkZWk/mXGbJzFNgMp83UK4UAZ7UrpobOmZM4mbGwYhhdSguqtHIYEqwmogFIcFLdp4vPEByUgAhgGzDVA++ZazPgJWkUblsgt2yCb2P+0hFY6NDK7fxJgkPbsvgBCOI+RcPdZtwost0VdxXRpxCiG6WcMCFpuSArIVumuyg7nYuAdVIxLeOJkKB4iMPR4rtCgfFa5x0+w9KXnvqE3yzIDT0iQLCeKY4gAm8Xu/66OGTifQ2lyUlEek9BDayvUKqCW/SQnEzVCwQk69Z6HhiQSZp6HGML7oiKmNsO85r6isz6Kq28SLzMR/dsnWOF9QZCwGRn0T5109EW2EUNFHWNStFe5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(376002)(346002)(39860400002)(66476007)(66556008)(2906002)(8936002)(6486002)(83380400001)(4326008)(44832011)(31686004)(86362001)(16576012)(16526019)(66946007)(186003)(478600001)(5660300002)(31696002)(956004)(316002)(2616005)(36756003)(7416002)(26005)(54906003)(110136005)(38100700002)(8676002)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TDRXOUJXd0g5c0lwTGFVRjN4K2NjcFZxVGxMemZTWVdhWnZld2N4SzFSVFlW?=
 =?utf-8?B?QkpaSnMxN1lXKzBXTTRwKy91R3dDSDMwWFk4eEFDMC9mbDQwMWNCRHVBTFd6?=
 =?utf-8?B?SnNZdkYxbEJENlE0VUg4SzdtWWtZbGd4eVNIWE5Fa0ttNklIcFZsZ25LTElF?=
 =?utf-8?B?NmQ5OEJMK2I0SHROWGlqVndQWEJEaHJMMnozRzk5bWpJL3orZWk3U0RET242?=
 =?utf-8?B?SXpSc1Fla1pKMGpnc041MWdIWjF6T1NVL3JiVnpwdk5vNDRQM3c4ekZsZVdn?=
 =?utf-8?B?bkt1WFFTeW8vbENWS1pFbjNWVno0WkwrL044dDgrZ1pxdmhhY3BEQnNNZDEv?=
 =?utf-8?B?SUpuK1NmbWhWU1J5Si8wdUdEb2NPODJFSnZXSndmcEJkVDJNV1huVFJCOE9n?=
 =?utf-8?B?T3hMU1R2YWFUdmN0OS8wOUROK3Z5MVgzUDBuZnZheGs0SWVDRXY4dzdCck8y?=
 =?utf-8?B?dElwVUpmQmRVaUVHaEtEYVVvaFR3TWlVOUpQMFVCT0xBTXQ0bml2YkVOdGZp?=
 =?utf-8?B?WDh0cEtYQWRpWjJHYU1BRmhESndyQkVCUzJlNTByMjFmU3Y2Szg1bUhpbTho?=
 =?utf-8?B?cmx0R1pxVGF5STdYdUE3N0RDM1k0b1BxRStCTlRNaDRJaUdoMmM0b210TUdS?=
 =?utf-8?B?ZFI4bmdnd2hQSkdESjNQbTNvb2kwNzVpZzgya2c1aFh5WUZUT1lxZlZLZG5I?=
 =?utf-8?B?a2tqVjVPQVJGQ1FpRlFvWnU5NnFrc1FZWVJ4UEFpMm1YVFZTTGcyNHpkTXdU?=
 =?utf-8?B?czNuVTZVTktheGlxdlNSeGNsS1lYR2lTTVMvdk1wZEhiV1h5cW4rd3pSeFdq?=
 =?utf-8?B?THAzd0lFY1YyanNhaDU2TnlXdHlsOUltTm9XMXpQNW1hUUlXK1J5ZTRENElF?=
 =?utf-8?B?RjFQc1FjT3pSWFNaWVc2MXg2K0tsdVJoOU9FQlZ3ZHpHK2cwdEttM3daWngw?=
 =?utf-8?B?OWI3T2VsWWZWKzJ5N3poZzd0SjZjQXk0UnJoMjMrU2I1MGZlazh3amRYL0RU?=
 =?utf-8?B?MnE0U3JQWnFrZ0VrRnpONmpQdzgwdFBKeTJ2cTVZWEFFTlhNeFo5dVdQRmVV?=
 =?utf-8?B?cndhWURhdjA5QUNJRDJMckRKUFEwdVJDM1k0eElJRUtsbVlTdWRQM2lSczFF?=
 =?utf-8?B?NFhpL0ptUDU0blJQb2VzWlo3ZE5KYzZSS0tnT0QzcCtuRHozY3Ztem9KR2NR?=
 =?utf-8?B?QkRtdDh5cE1KM2h5V3p1OGEzKzJ4VEJkRStRaWpHWVhNU2l3TG9PQW0vRFkx?=
 =?utf-8?B?YWNuYldxcXF5QWxXdURWSXI5V1hiVWpjTUd6QjJoWXBpYW9hSTR2cklKZ3Jw?=
 =?utf-8?B?dEZRelFVdGNWWmtqWFVvVzc1ZllRY3VSaHJMeEgxNkVxdGl0RVg3K0trY083?=
 =?utf-8?B?cUlwNG9pQWZkM2FEVUh6bXJReVNTbVZ4U0xBNUM3cDZzL1U3WC9QYWxnU3NZ?=
 =?utf-8?B?RXRhY1ZkOTRheVFnbDVnVHI5ci9qclVwYXBVb1JoOHdCUlJQcjYwaEJzTDBp?=
 =?utf-8?B?SUZ6b1E1NmVvSXY5ejlRanQ4MHdRdzBZMTNQblNXeGo5TmJjTmJGRFI5OHJ6?=
 =?utf-8?B?SzRweDJuOERQdFFlc3ZjTmFDRGpwR0Z2Smc1TVE3TlRGcDFyM1ZkK1hRTFFG?=
 =?utf-8?B?a0p3R2NyTTV3Rm55TENLdGVhUjJVVktZbGpSd1I1bEpveHcxZkNSVkFRZTBw?=
 =?utf-8?B?V1I0S2w3WTRZcTAwYWgwTWZMRHlWQ1B2b1lJTzNDZXVZazJoUjZDV3ZaVjhJ?=
 =?utf-8?Q?0AsqAL/p4SSbQ5uzq1oco0+s6Qk2IFiA6mtgOn/?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: cfefb8ca-2d76-436e-6bfa-08d90b2ba6d7
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 16:27:16.1090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W71d3rBoPFP1ANkNgd3oX8H8OnMNzFNQOYpYARtIoIRokiR6ReG0ntkWZlFvxk6isiJOwpk5c0JZBOMQ49glo7nX8KPHguX5jJFaq+Fn5Lw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB1873
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Valentin Raevsky <valentin@compulab.co.il>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjguMDQuMjEgMTY6MTYsIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDQvMjgvMjEgMTE6MjQg
QU0sIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+IFsuLi5dCj4gCj4+Pj4+PiArc3RhdGljIGludCBz
bjY1ZHNpODNfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwKPj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0IHN0cnVjdCBpMmNfZGV2aWNlX2lkICppZCkKPj4+
Pj4+ICt7Cj4+Pj4+PiArwqDCoMKgIHN0cnVjdCBkZXZpY2UgKmRldiA9ICZjbGllbnQtPmRldjsK
Pj4+Pj4+ICvCoMKgwqAgZW51bSBzbjY1ZHNpODNfbW9kZWwgbW9kZWw7Cj4+Pj4+PiArwqDCoMKg
IHN0cnVjdCBzbjY1ZHNpODMgKmN0eDsKPj4+Pj4+ICvCoMKgwqAgaW50IHJldDsKPj4+Pj4+ICsK
Pj4+Pj4+ICvCoMKgwqAgY3R4ID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCpjdHgpLCBHRlBf
S0VSTkVMKTsKPj4+Pj4+ICvCoMKgwqAgaWYgKCFjdHgpCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIC1FTk9NRU07Cj4+Pj4+PiArCj4+Pj4+PiArwqDCoMKgIGN0eC0+ZGV2ID0gZGV2Owo+
Pj4+Pj4gKwo+Pj4+Pj4gK8KgwqDCoCBpZiAoZGV2LT5vZl9ub2RlKQo+Pj4+Pj4gK8KgwqDCoMKg
wqDCoMKgIG1vZGVsID0gKGVudW0gc242NWRzaTgzX21vZGVsKW9mX2RldmljZV9nZXRfbWF0Y2hf
ZGF0YShkZXYpOwo+Pj4+Pj4gK8KgwqDCoCBlbHNlCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgbW9k
ZWwgPSBpZC0+ZHJpdmVyX2RhdGE7Cj4+Pj4+PiArCj4+Pj4+PiArwqDCoMKgIC8qIERlZmF1bHQg
dG8gZHVhbC1saW5rIExWRFMgb24gYWxsIGJ1dCBEU0k4My4gKi8KPj4+Pj4+ICvCoMKgwqAgaWYg
KG1vZGVsICE9IE1PREVMX1NONjVEU0k4MykKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBjdHgtPmx2
ZHNfZHVhbF9saW5rID0gdHJ1ZTsKPj4+Pj4KPj4+Pj4gV2hhdCBpZiBJIHVzZSB0aGUgRFNJODQg
d2l0aCBhIHNpbmdsZSBsaW5rIExWRFM/IEkgY2FuJ3Qgc2VlIGFueSAKPj4+Pj4gd2F5IHRvCj4+
Pj4+IGNvbmZpZ3VyZSB0aGF0IHJpZ2h0IG5vdy4KPj4+Cj4+PiBJIGFzc3VtZSB0aGUgc2ltcGxl
c3Qgd2F5IHdvdWxkIGJlIHRvIHVzZSB0aGUgInRpLHNuNjVkc2k4MyIKPj4+IGNvbXBhdGlibGUg
c3RyaW5nIGluIHlvdXIgZHRzLCBzaW5jZSB0aGUgd2F5IHlvdSB3aXJlZCBpdCBpcwo+Pj4gJ2Nv
bXBhdGlibGUnIHdpdGggc242NWRzaTgzLCByaWdodD8KPj4KPj4gTm8gdGhpcyBpc24ndCB0aGUg
cmlnaHQgd2F5IHRvIHRvLCBpZiBzbjY1ZHNpODQgaXMgc3VwcG9ydGVkIGFuZCB0aGUgCj4+IGJp
bmRpbmdzIG9ubHkgc3VwcG9ydCBzaW5nbGUgbHZkcyBsaW5rLAo+PiB0aGUgZHJpdmVyIG11c3Qg
b25seSBzdXBwb3J0IHNpbmdsZSBsaW5rIG9uIHNuNjVkc2k4NCwgb3IgYWRkIHRoZSBkdWFsIAo+
PiBsaW5rIGx2ZHMgaW4gdGhlIGJpbmRpbmdzIG9ubHkgZm9yIHNuNjVkc2k4NC4KPiAKPiBUaGUg
ZHJpdmVyIGhhcyBhIGNvbW1lbnQgYWJvdXQgd2hhdCBpcyBzdXBwb3J0ZWQgYW5kIHRlc3RlZCwg
YXMgRnJpZWRlciAKPiBhbHJlYWR5IHBvaW50ZWQgb3V0Ogo+IAo+IEN1cnJlbnRseSBzdXBwb3J0
ZWQ6Cj4gLSBTTjY1RFNJODMKPiAgwqAgPSAxeCBTaW5nbGUtbGluayBEU0kgfiAxeCBTaW5nbGUt
bGluayBMVkRTCj4gIMKgIC0gU3VwcG9ydGVkCj4gIMKgIC0gU2luZ2xlLWxpbmsgTFZEUyBtb2Rl
IHRlc3RlZAo+IC0gU042NURTSTg0Cj4gIMKgID0gMXggU2luZ2xlLWxpbmsgRFNJIH4gMnggU2lu
Z2xlLWxpbmsgb3IgMXggRHVhbC1saW5rIExWRFMKPiAgwqAgLSBTdXBwb3J0ZWQKPiAgwqAgLSBE
dWFsLWxpbmsgTFZEUyBtb2RlIHRlc3RlZAo+ICDCoCAtIDJ4IFNpbmdsZS1saW5rIExWRFMgbW9k
ZSB1bnN1cHBvcnRlZAo+ICDCoMKgwqAgKHNob3VsZCBiZSBlYXN5IHRvIGFkZCBieSBzb21lb25l
IHdobyBoYXMgdGhlIEhXKQo+IC0gU042NURTSTg1Cj4gIMKgID0gMnggU2luZ2xlLWxpbmsgb3Ig
MXggRHVhbC1saW5rIERTSSB+IDJ4IFNpbmdsZS1saW5rIG9yIDF4IER1YWwtbGluayAKPiBMVkRT
Cj4gIMKgIC0gVW5zdXBwb3J0ZWQKPiAgwqDCoMKgIChzaG91bGQgYmUgZWFzeSB0byBhZGQgYnkg
c29tZW9uZSB3aG8gaGFzIHRoZSBIVykKPiAKPiBTbywKPiBEU0k4MyBpcyBhbHdheXMgc2luZ2xl
LWxpbmsgRFNJLCBzaW5nbGUtbGluayBMVkRTLgo+IERTSTg0IGlzIGFsd2F5cyBzaW5nbGUtbGlu
ayBEU0ksIGFuZCBjdXJyZW50bHkgYWx3YXlzIGR1YWwtbGluayBMVkRTLgo+IAo+IFRoZSBEU0k4
MyBjYW4gZG8gb25lIHRoaW5nIG9uIHRoZSBMVkRTIGVuZDoKPiAtIDF4IHNpbmdsZSBsaW5rIGxW
RFMKPiAKPiBUaGUgRFNJODQgY2FuIGRvIHR3byB0aGluZ3Mgb24gdGhlIExWRFMgZW5kOgo+IC0g
MXggc2luZ2xlIGxpbmsgbFZEUwo+IC0gMXggZHVhbCBsaW5rIExWRFMKPiAKPiBUaGVyZSBpcyBh
bHNvIHNvbWUgc29ydCBvZiBtZW50aW9uIGluIHRoZSBEU0k4NCBkYXRhc2hlZXQgYWJvdXQgMngg
Cj4gc2luZ2xlIGxpbmsgTFZEUywgYnV0IEkgc3VzcGVjdCB0aGF0IG1pZ2h0IGJlIGNvcGllZCBm
cm9tIERTSTg1IAo+IGRhdGFzaGVldCBpbnN0ZWFkLCB3aGljaCB3b3VsZCBtYWtlIHNlbnNlLiBU
aGUgb3RoZXIgb3B0aW9uIGlzIHRoYXQgaXQgCj4gYmVoYXZlcyBhcyBhIG1pcnJvciAoaS5lLiBz
YW1lIHBpeGVscyBhcmUgc2Nhbm5lZCBvdXQgb2YgTFZEUyBjaGFubmVsIEEgCj4gYW5kIEIpLiBF
aXRoZXIgb3B0aW9uIGNhbiBiZSBhZGRlZCBieSBlaXRoZXIgYWRkaW5nIGEgRFQgcHJvcGVydHkg
d2hpY2ggCj4gd291bGQgZW5hYmxlIHRoZSBtaXJyb3IgbW9kZSwgb3IgbmV3IHBvcnQgbGlua2lu
ZyB0aGUgTFZEUyBlbmRwb2ludCB0byAKPiB0aGUgc2FtZSBwYW5lbCB0d2ljZSwgYW5kL29yIHR3
byBuZXcgcG9ydHMgZm9yIERTSTg1LCBzbyB0aGVyZSBpcyBubyAKPiBwcm9ibGVtIHRvIGV4dGVu
ZCB0aGUgYmluZGluZ3Mgd2l0aG91dCBicmVha2luZyB0aGVtLiBTbyBmb3Igbm93IEkgd291bGQg
Cj4gaWdub3JlIHRoaXMgbW9kZS4KCkFncmVlZC4KCj4gCj4gU28gdWx0aW1hdGVseSwgd2hhdCB3
ZSBoYXZlIHRvIHNvcnQgb3V0IGlzIHRoZSAxeCBzaW5nbGUgLyAxeCBkdWFsIGxpbmsgCj4gTFZE
UyBtb2RlIHNldHRpbmcgb24gRFNJODQuIEZyaWVkZXIgYWxyZWFkeSBwb2ludGVkIG91dCBob3cg
dGhlIGRyaXZlciAKPiBjYW4gYmUgdHdlYWtlZCB0byBzdXBwb3J0IHRoZSBzaW5nbGUtbGluayBt
b2RlIG9uIERTSTg0LCBzbyBub3cgd2UgbmVlZCAKPiB0byB0aWUgaXQgaW50byBEVCBiaW5kaW5n
cy4KPiAKPiBDdXJyZW50bHksIG5laXRoZXIgdGhlIExWRFMgcGFuZWxzIGluIHVwc3RyZWFtIGlu
IHBhbmVsLXNpbXBsZSBub3IgCj4gbHZkcy55YW1sIHByb3ZpZGUgYW55IGluZGljYXRpb24gdGhh
dCB0aGUgcGFuZWwgaXMgc2luZ2xlLWxpbmsgb3IgCj4gZHVhbC1saW5rLiBUaG9zZSBkdWFsLWxp
bmsgTFZEUyBwYW5lbHMgc2VlbSB0byBhbHdheXMgc2V0IDJ4IHBpeGVsIGNsb2NrIAo+IGFuZCBs
ZXQgdGhlIGJyaWRnZSBzb21laG93IHNvcnQgaXQgb3V0Lgo+IAo+IE1heWJlIHRoYXQgaXNuJ3Qg
YWx3YXlzIHRoZSBiZXN0IGFwcHJvYWNoLCBtYXliZSB3ZSBzaG91bGQgYWRkIGEgbmV3IAo+IERS
TV9CVVNfRkxBRyBmb3IgdGhvc2UgcGFuZWxzIGFuZCBoYW5kbGUgdGhlIGZsYWcgaW4gdGhlIGJy
aWRnZSBkcml2ZXIgPyAKPiBTdWNoIGEgbmV3IGZsYWcgY291bGQgYmUgYWRkZWQgb3ZlciB0aW1l
IHRvIHBhbmVscyB3aGVyZSBhcHBsaWNhYmxlLCBzbyAKPiBvbGQgc2V0dXBzIHdvbid0IGJlIGJy
b2tlbiBieSB0aGF0IGVpdGhlciwgdGhleSB3aWxsIGp1c3QgaWdub3JlIHRoZSBuZXcgCj4gZmxh
ZyBhbmQgd29yayBhcyBiZWZvcmUuCgpJIGFncmVlIHRoYXQgdGhlIHBhbmVsIGRyaXZlciBzaG91
bGQgcmVwb3J0IHdoZXRoZXIgdGhlIExWRFMgaW5wdXQgaXMgCmV4cGVjdGVkIHRvIGJlIHNpbmds
ZSBvciBkdWFsIGxpbmsuIFNvIGludHJvZHVjaW5nIGEgRFJNX0JVU19GTEFHIGZvciAKdGhpcyBz
ZWVtcyBsaWtlIGEgZ29vZCBzb2x1dGlvbi4KClRoaXMgd291bGRuJ3QgcmVmbGVjdCB0aGUgcGh5
c2ljYWwgcG9ydHMsIGJ1dCBJIGRvbid0IHJlYWxseSBrbm93IGhvdyB3ZSAKY291bGQgdXNlIHR3
byBwb3J0cyBjb25uZWN0ZWQgdG8gdGhlIHNhbWUgcGFuZWwgZm9yIHRoaXMgY2FzZSwgYXMgYWxs
IAp0aGUgZXhpc3RpbmcgZHVhbCBsaW5rIHBhbmVscyBkb24ndCBmb2xsb3cgdGhpcyBzY2hlbWUu
CgpJIHdvdWxkIHN1Z2dlc3QsIHRoYXQgdGhlIGRyaXZlciBkZWZhdWx0cyB0byBzaW5nbGUgbGlu
ayBmb3IgdGhlIERTSTg0IAphbmQgdGhlbiBzd2l0Y2hlcyB0byBkdWFsIGxpbmsgaWYgdGhlIHBh
bmVsIHJlcXVlc3RzIGl0IHVzaW5nIHRoZSBmbGFnLgoKPiAKPj4+PiBJIGp1c3Qgc2F3IHRoZSBu
b3RlIGluIHRoZSBoZWFkZXIgb2YgdGhlIGRyaXZlciB0aGF0IHNheXMgdGhhdCBzaW5nbGUKPj4+
PiBsaW5rIG1vZGUgaXMgdW5zdXBwb3J0ZWQgZm9yIHRoZSBEU0k4NC4KPj4+Pgo+Pj4+IEkgaGF2
ZSBoYXJkd2FyZSB3aXRoIGEgc2luZ2xlIGxpbmsgZGlzcGxheSBhbmQgaWYgSSBzZXQKPj4+PiBj
dHgtPmx2ZHNfZHVhbF9saW5rID0gZmFsc2UgaXQgd29ya3MganVzdCBmaW5lLgo+Pj4+Cj4+Pj4g
SG93IGlzIHRoaXMgc3VwcG9zZWQgdG8gYmUgc2VsZWN0ZWQ/IERvZXMgaXQgbmVlZCBhbiBleHRy
YSBkZXZpY2V0cmVlCj4+Pj4gcHJvcGVydHk/IEFuZCB3b3VsZCB5b3UgbWluZCBhZGRpbmcgc2lu
Z2xlLWxpbmsgc3VwcG9ydCBpbiB0aGUgbmV4dAo+Pj4+IHZlcnNpb24gb3IgZG8geW91IHByZWZl
ciBhZGRpbmcgaXQgaW4gYSBmb2xsb3ctdXAgcGF0Y2g/Cj4+Pgo+Pj4gSWYgdGhpcyBoYXMgdG8g
YmUgc3VwcG9ydGVkIEkgdGhpbmsgdGhlIHByb3BlciB3YXkgd291bGQgYmUgdG8gc3VwcG9ydAo+
Pj4gdHdvIG91dHB1dCBwb3J0cyBpbiB0aGUgZHRzIChlLmcuIGx2ZHMwX291dCwgbHZkczFfb3V0
KSwgaW4gdGhlIHNhbWUKPj4+IHdheSBhcyBzdXBwb3J0ZWQgYnkgdGhlICdhZHZhbnRlY2gsaWRr
LTIxMjF3cicgcGFuZWwuCj4+Cj4+IFllcywgdGhpcyBpcyB3aHkgSSBhc2tlZCB0byBoYXZlIHRo
ZSBkdWFsLWxpbmsgbHZkcyBpbiB0aGUgYmluZGluZ3MuCj4gCj4gTWF5YmUgaXQgc2hvdWxkbid0
IHJlYWxseSBiZSBpbiB0aGUgYmluZGluZ3MsIHNlZSBhYm92ZS4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
