Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A4636240E
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 17:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 783FE6EC54;
	Fri, 16 Apr 2021 15:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC6D6EC51;
 Fri, 16 Apr 2021 15:36:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GJd9uO5FbzshGw4PBIiDFAe7kcXo1Z5PdyOa5AnmzZ88sXE51dao2x/MvWyjjoTGpX3fMxw/HuB7wXzZT9gH1j6rfd2J/ANwN1xJuTVZXQsfz3dNe5HkIT1txNUf69ySzAovq1iVbGMbm/YFw3rDpCnn/+E/cPDNFB+Tc+PsRGX1hYfA8VMiCnGqHAwooWcmIRVRLeD139Xf9OSYXy0yTES1ME1RLugI40Avf4ggzDX2MnxUfMzAQXmX2YePWd9s4ADAdTT70g/0wJFGWIYSSQcGTsS4djUaHJ/Wu789KbKQ2mP7fGdQPc2p8HiBjqTRTi5FZQrXKkRLrot8lVWf0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qE0IppFtLOvsZDHaSdx08OBv/yfH5beTvGciLWc+Xqc=;
 b=MB/Y2tyK91yCw+tJLeoimZNPVXk1yY33vJBftUKTwooBCcMNAPOAG8qzujsOlVztYmBbqaAAMOPpBIpUUg3w3NSwnizgeTkdo3Pd5b5jpWtRAJyj3dG0NVKioUhZSCbcT6BohPgUWMKClezY5vpsOt5wFDMIc/Lfj5aplA/ROvyBpHjTN4W/vyPWFhy3bYyzyQUsk7vh44neiRRAUJNvi4NRaKmclyKX9V4j3/6APm0qW7DoD9umMfp3YbmZPVeJZB9lv32VBLBS9Ptqsft7sT2fbADogiDbhT0RDNUkPLNV8wCdyXiARaeeoYETgHj2KC9gxq7doFxJXbmk18Fy7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qE0IppFtLOvsZDHaSdx08OBv/yfH5beTvGciLWc+Xqc=;
 b=1g55HoAOq8t80YqPZzN9qFdOSGd2InnHFhiHcazLEe/8JIcRETnlevwsKFEexe06XyTVtvoXGp8sxoWtjiCQ3GT5GVJI8fdYswbEtOSMIbOoQR4puYjuwKs0HT8Ht/5p3wAzuQlsz0w/Y6DDdUwJzB5fKaXNPQpiZy36Ge0TsQw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from CY4PR12MB1463.namprd12.prod.outlook.com (2603:10b6:910:e::19)
 by CY4PR1201MB2468.namprd12.prod.outlook.com (2603:10b6:903:d7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Fri, 16 Apr
 2021 15:35:57 +0000
Received: from CY4PR12MB1463.namprd12.prod.outlook.com
 ([fe80::a457:1047:3886:4630]) by CY4PR12MB1463.namprd12.prod.outlook.com
 ([fe80::a457:1047:3886:4630%9]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 15:35:57 +0000
Subject: Re: [PATCH 31/40] drm/amd/amdgpu/amdgpu_gart: Correct a couple of
 function names in the docs
To: Lee Jones <lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-32-lee.jones@linaro.org>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <eeb39756-40de-bc34-f814-0eb2b0ee0c1f@amd.com>
Date: Fri, 16 Apr 2021 17:35:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210416143725.2769053-32-lee.jones@linaro.org>
Content-Language: en-US
X-Originating-IP: [217.86.110.98]
X-ClientProxiedBy: AM9P195CA0023.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::28) To CY4PR12MB1463.namprd12.prod.outlook.com
 (2603:10b6:910:e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.178.87] (217.86.110.98) by
 AM9P195CA0023.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 15:35:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 427011fa-87be-4322-e04d-08d900ed543c
X-MS-TrafficTypeDiagnostic: CY4PR1201MB2468:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB2468255E6C585CD91671333B8B4C9@CY4PR1201MB2468.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:114;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RNiZra1bwU/TYneK8jOSu5WgJspeOmJXoxaWJZgC0HgxlP+a1oMxlSIKXqpAe40/uJ4qeo8n0x5FjPGXlPXNRessHMvWkZMHvtqURVBSHM4xD7wxxXxoqQN95NRxa0Y4NwSz03nxofuIjDTeSfq7gXIlgY60kErLfb5qYllLaNhUTufP9etjaUV7fsLum6Q+9UhvHpnAL5WrAdzYiVVb5/2euWzBIsk3qsBZA49hvHPpQLzzU0SJRRpnJ1WS185Y9KAbljVRxyOoH4rBIJCnZya7KekBTP827tvhc2HYPXKeTYT2ihPpLWsXPZkS5FIhCA5JErlxKjj1Kz9liD6uWUJQXEut6epFoNaqV5zZqDPEb6fZ+pRWk4w2dIgVWKc+rAoeXlD6kox+Sx99BO+hm59Snill5G6h6oyn9yyqep7RLTRQG5YUmlaoK5gSuj1aPyb9m+r/g/Ip3xyuB+7+qHK8AyJRQUBt+nBrs7keyQIQeKGS8hQEgJ+I7oFdgEkO+tIeVk1Zfjs8CukerlpUhwKSayq+Z5klw6dB6Iu2xPv/O9EgW9xfpA1pS/GtiS1VLNkk++sfdWIPKUPBK2Yl5wRAIBOWPSrrIe6vignduBPqUmUw6fQkiuUhFCNtmb6MaXxPmLteGvf2wx1Sq3ROyefoQe92/ruzK0UCGzKerF8zOJ6fe3ctUB1rrb6extg/EkQ68c7rJf51qzJvIp+lBJNjKuN2QznPWMYmp7ZTvSQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1463.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(54906003)(31696002)(83380400001)(52116002)(956004)(16576012)(6666004)(66946007)(316002)(66476007)(2616005)(66574015)(5660300002)(2906002)(186003)(6916009)(26005)(16526019)(31686004)(478600001)(66556008)(38100700002)(36756003)(8676002)(8936002)(4326008)(53546011)(6486002)(38350700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MjdDVkIxRk5LWXVnRkcydUtzVXYyeE9aRUlQRXlOM2dTMEtFWW9HakZDcUlv?=
 =?utf-8?B?QzRRMEhKZStIaG56anB5bmM3a2tXRk9oc2hhc1ZONVJTc0tPNG9ma0YzZURm?=
 =?utf-8?B?bVgydnBEcHo5dzZzV0VPV1ZNWDI1KzBwb05IREp6cWo1ejhydWZlTnJKc2JI?=
 =?utf-8?B?QjF0NTd1eDBTUERpY0VkSmVrSVowNEpmd2xKQWZJUzBwQ3JscHVqL2VRcWxp?=
 =?utf-8?B?a2tlU2NIeUIwMmw4ZDlGek51bG5SMGI2clpHc1VROWYvc2RoNUlKZm4wRStj?=
 =?utf-8?B?WURiQ2lGSlZJTldQUnd3QitpbmNmVzZCczdjbWVRRXVPaVp4VEx0UGhWRlBH?=
 =?utf-8?B?aUdmaHp2NHVrU3lkSmJMZGFrVitUQnVVMVhuM1JQR0VlVThWRGJhaTY3Z1Ja?=
 =?utf-8?B?K0g3ZEtIa1NNRlFLNWJCeWhWRUsrUkZ0eFZReWdiOTlGODhhaysrUWozSFVM?=
 =?utf-8?B?MGxXb1dxU1ZNYU56SXh6T1U1cWlGNzVSTS9mZm9na1Vpem9YNUUyUHNLaHhX?=
 =?utf-8?B?Ti9naG4yRTdEb3IrYVVnNk54TTk1QzV0SGJUMzVoQ3R3Nmsxc0x6ODJYb201?=
 =?utf-8?B?VytIZmFCQWJIbUsvYndzaHh6Yi9YSVhiRzFVRlE1dllRTVp1WkIrZ2RjRVFB?=
 =?utf-8?B?ZEp0ODFnZnZqSzJIb3pneGRoWE5qTll5akNvaUVvdWs3aDk3bnRjajFraFU5?=
 =?utf-8?B?bXBwSFhxaWVxR1l6V2p4ZlR6VGFjaXJHQ3ZRRWVhQUp3TzRpOFpJdDVqTzhw?=
 =?utf-8?B?VTJqVWR3U1ZPYjc3OUVhWE9ROE5MaWNNNXNHekhxc29oR29maWdYcDhJVmZR?=
 =?utf-8?B?VklyU05tWEhqcHo2c0gzZDBRcTNQeWE0Rk1YaUh3dnJSR2tzV0ExZy96bVZ6?=
 =?utf-8?B?eWZYaVkweWFoUzE5WHdXOHg2bzhWVHVjRTcyWERQV0FKRDdvUk5XSmFjOE41?=
 =?utf-8?B?Y2xlbVBjUmZ6N3JFNDF2WXE4SjlCdmo2UDUxQlBYYy9YUlNXTXFQbERxZGNC?=
 =?utf-8?B?L2xqTGs2RlpkRlU3NjI5SkJONU9WV2oxQkppOG9KcU1iZDA0VTF5eHlBRE14?=
 =?utf-8?B?MFRZNi8yZGdpMHo4VEV0YTAzRjhFUVV1RXVIYm5RY2JvdjFQb2VoU1pWcU0y?=
 =?utf-8?B?bFdKOFM3THRibFhqRWdFa3l5Q1lmMjFWVyt4MTBEVU9kMU1rdnVacnd6NTFR?=
 =?utf-8?B?Qll6b1I5UGdHUEhjai9XaXJDQ0J4R0RIRVZCUGN6Tmh2RHIzRVdRWVJqTGxW?=
 =?utf-8?B?NE5LSFZ4QWVaWnJXRGphZFdja1YvaXZEUWk4SVdSSEFEWHBON0VjcjJDR29O?=
 =?utf-8?B?ZWFrZGlvR1BHVnkrTDFwcy9BZi9xL1ZqVVVzNlpYVkRPbkRpSFV4bkJkeGxD?=
 =?utf-8?B?c3JncHBiK1dSUmZ0N1RqU1UzMkxlUEowcnVoZDI5Z3NNaWhmd1BxRHJNUEs1?=
 =?utf-8?B?V1gxYVhVWVovckxlUStpcTMwTVZGZXlMaE9VVUdvaCtCV3grTGhXZkQvSEZm?=
 =?utf-8?B?VU4zNVdQeEZSTWJZeTVBTStqOVNNMlI0SkZQTnplM0ZQUS9JQjQ3SlNtcFBN?=
 =?utf-8?B?WVYxaDJJb1pmNTZFeDc2ODBHeTZRRmdIL3o3WnpjTjg0cllZV05IZzkxQzNG?=
 =?utf-8?B?MEU0ZUxJakF0ZnQ1RUxWckZNTmdpU1ROblVvcHl1dTAzR2dZUVNoSXZkRHV3?=
 =?utf-8?B?SC9Sd25JRTlIUWRLYTM0bjZVdDdSeDFJQXlXcmYyT1pTcjJoQThKU0dxamhl?=
 =?utf-8?Q?VdwYFiagm4+j/+R6UCc71kkiJYpDNAHPJC75qtr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 427011fa-87be-4322-e04d-08d900ed543c
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1463.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 15:35:57.4698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cPJctv23M69RNSGwtp+BjTkr0DKrzAW5kR3nfcsEhQ1nGnlHp2wikTIX02bpLc1xoUV7LEf9RgRJMzJBsgZa1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2468
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Nirmoy Das <nirmoy.das@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IE5pcm1veSBEYXMgPG5pcm1veS5kYXNAYW1kLmNvbT4KCk9uIDQvMTYvMjEg
NDozNyBQTSwgTGVlIEpvbmVzIHdyb3RlOgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5l
bCBidWlsZCB3YXJuaW5nKHMpOgo+Cj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZ2FydC5jOjczOiB3YXJuaW5nOiBleHBlY3RpbmcgcHJvdG90eXBlIGZvciBhbWRncHVfZHVt
bXlfcGFnZV9pbml0KCkuIFByb3RvdHlwZSB3YXMgZm9yIGFtZGdwdV9nYXJ0X2R1bW15X3BhZ2Vf
aW5pdCgpIGluc3RlYWQKPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nYXJ0
LmM6OTY6IHdhcm5pbmc6IGV4cGVjdGluZyBwcm90b3R5cGUgZm9yIGFtZGdwdV9kdW1teV9wYWdl
X2ZpbmkoKS4gUHJvdG90eXBlIHdhcyBmb3IgYW1kZ3B1X2dhcnRfZHVtbXlfcGFnZV9maW5pKCkg
aW5zdGVhZAo+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
PiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6
IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsQGZmd2xsLmNoPgo+IENjOiBOaXJtb3kgRGFzIDxuaXJtb3kuZGFzQGFtZC5jb20+Cj4gQ2M6
IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8u
b3JnPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dhcnQuYyB8
IDQgKystLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Fy
dC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dhcnQuYwo+IGluZGV4IGM1
YTlhNGZiMTBkMmIuLjU1NjJiNWM5MGMwMzIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2dhcnQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9nYXJ0LmMKPiBAQCAtNjAsNyArNjAsNyBAQAo+ICAgICovCj4gICAKPiAgIC8q
Kgo+IC0gKiBhbWRncHVfZHVtbXlfcGFnZV9pbml0IC0gaW5pdCBkdW1teSBwYWdlIHVzZWQgYnkg
dGhlIGRyaXZlcgo+ICsgKiBhbWRncHVfZ2FydF9kdW1teV9wYWdlX2luaXQgLSBpbml0IGR1bW15
IHBhZ2UgdXNlZCBieSB0aGUgZHJpdmVyCj4gICAgKgo+ICAgICogQGFkZXY6IGFtZGdwdV9kZXZp
Y2UgcG9pbnRlcgo+ICAgICoKPiBAQCAtODYsNyArODYsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV9n
YXJ0X2R1bW15X3BhZ2VfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiAgIH0KPiAg
IAo+ICAgLyoqCj4gLSAqIGFtZGdwdV9kdW1teV9wYWdlX2ZpbmkgLSBmcmVlIGR1bW15IHBhZ2Ug
dXNlZCBieSB0aGUgZHJpdmVyCj4gKyAqIGFtZGdwdV9nYXJ0X2R1bW15X3BhZ2VfZmluaSAtIGZy
ZWUgZHVtbXkgcGFnZSB1c2VkIGJ5IHRoZSBkcml2ZXIKPiAgICAqCj4gICAgKiBAYWRldjogYW1k
Z3B1X2RldmljZSBwb2ludGVyCj4gICAgKgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
