Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9FB362479
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 17:53:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C636EC57;
	Fri, 16 Apr 2021 15:53:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2083.outbound.protection.outlook.com [40.107.243.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6C526EC2F;
 Fri, 16 Apr 2021 15:53:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U42kKySyiisNdejP7+EvreAxpfs0acBqIZ2Uk78AJZlpLmpovwziy93WXk6kh/nBZgsMhRb3wY8gPkkLatrhcLBTLK1S64MqEr4Ym/jaMuAIMsE16zQwiq3XHjnrO0vsCiTuWxs3AQC9jooWUL9vy56LEspsAcNTDdLNz/pkDLddaqp/6r4IAJiG9yrGAj6h+jj3VlJ/ryYfzebwglDzmDLyMNKTGL7ecZ+NVYnhvhQ9zQsLX3aw3xJS+l7aHJp++FKdLhfmJm1RPAioszd2o6haQcCib050cdtn4BmIkwDFSXIxtCwcKLXYTwO4eyfNSSU2/y43K4XEvs1M4+0knA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SlHd9raxwo/N6LadsqUpkt62XgZJh/NcxbsRnlhMB3s=;
 b=ofceTwclSpFL2fOrbk+lli9GMizmfqSQnQLnC30NHmB+SyrudzGd8hVy0+AXGdZ24I2p2MJKIk+XBmlIyWvMRAZK5t4pehZy0ay7hfB8Z6tDoN7HJj7mxhb1sIAix4hZzf+kwNXlxfUIf7gMaYIKee4K6wpQw5hcg0Hh/aOc9eAA7ws3niPuqll7PyZpGlNjQdrbbKrtINMdCA7KUrCul7US9wRiPVuUMVBxP0bOmM/gWuti2Fr6R3M6n+jSeQy7guJfNOrg3Yxa3iPrkKoVXYCfL6sjAUR5QfG/lYBCl8+k7VNu4mVIj8SQTCbv1toI0MS6HjGbBzc1WK49256OoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SlHd9raxwo/N6LadsqUpkt62XgZJh/NcxbsRnlhMB3s=;
 b=lfV40uFDsAEMdNPxe9hNUEVs526YE5G1qRkeywfRmwDRvt7PWkg7mz70HMgC/2StDLg1VvQOWLhRKdm5rRIgHhgh02eAvFVR2JuGsqoroWhdeP2Vmt6XstGxwbwysyHJ+nBitiAGzpMEgrzyvjQ5wQ4unSTqJRlkAUJ4v6XnXvU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2484.namprd12.prod.outlook.com (2603:10b6:207:4e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Fri, 16 Apr
 2021 15:53:06 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4020.025; Fri, 16 Apr 2021
 15:53:06 +0000
Subject: Re: [PATCH 31/40] drm/amd/amdgpu/amdgpu_gart: Correct a couple of
 function names in the docs
To: Lee Jones <lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-32-lee.jones@linaro.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <2029fbcf-8d2b-7a85-edd2-481a571ae43d@amd.com>
Date: Fri, 16 Apr 2021 17:53:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210416143725.2769053-32-lee.jones@linaro.org>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:5d8d:1198:63ca:8fe4]
X-ClientProxiedBy: AM0PR01CA0179.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::48) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:5d8d:1198:63ca:8fe4]
 (2a02:908:1252:fb60:5d8d:1198:63ca:8fe4) by
 AM0PR01CA0179.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Fri, 16 Apr 2021 15:53:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9881a26-a447-453c-568d-08d900efb9e8
X-MS-TrafficTypeDiagnostic: BL0PR12MB2484:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2484FA0AFB0052A442756447834C9@BL0PR12MB2484.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:114;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R8wb3uN5XjqTvW7hjTl9KWV04Z1BKa8kQKOFrS1YDHUUt6F8X/wX5Bgv6aKVqib9gbK0mITFup6/+mjLDSWYL8XaIrKP4r92DT5gHbQZ9x+F9WEoHGHHeZYWNp2DBn3o2UEBb7jj/71vfdhIlkNhOn6R42NjUV+Arke/pcnEauzfHeA3dCixsdCPwm/2HsWaqcUKQ63zz+aHaSo/rN6n94g0wjEhkOa09OEIZq20Y7t3jW1g7uxmB015S8h4kx7NMWSz0yzkBJBaaWzLzu7s+jTeP9+YNNDlZBobZyAFr8DXlGz3CKBwxa2p8wXHAWcTupqMjWBp8hK+YU0h/avBDxnIHhBYztgLb66tFJnXufdtdaUXoS2cabPxX+hry1kTHTg6RrxxgZP8EN+QsErOHtgvBDsAKz7ULMHWvg45ZzVYOkZX7zK2Pg0UvIwNH+CE3teHKmBo4SWFZKm/xU2R4Y89pXqF9X1Lb6bmZTk5smRTSSFIRPEAGfFVw+mtFMHuxWbRPhmOPh+cu3vjQueZRM+2MQonqDKM+hQtiSi1uyHz82JPwY/mXXt3F6H1QGOpdDW8w8FEp9CXb8yS8XQcTN7ZDQ5M64EFHAzWN1gnI8sTJqLr1V7AkMFikAHSBCf1pHySyG3wDc7ErUMEkUY8Ak3rxMH1dl0zPyndX1ADz9c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(39860400002)(346002)(136003)(6486002)(6666004)(66556008)(31696002)(54906003)(2906002)(52116002)(66476007)(2616005)(38100700002)(66946007)(8676002)(316002)(186003)(86362001)(31686004)(36756003)(83380400001)(6916009)(66574015)(16526019)(5660300002)(8936002)(478600001)(4326008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cXZQZHp2Y0FhdFdmdTlqMU9TK3pkb1FaYy9Nd3NVcnhkcjlzSG5pRktTdWIy?=
 =?utf-8?B?SEZyaExieXRkWHp3cnc0YVRMM2ZaM2pKZjYyc0dqc3BwMXdTVlJxMHNtcU5q?=
 =?utf-8?B?eElPZnlVZVozU092R0pIbFg2a0hYQm96WnkzTnVhalA1WXhpQmZrVThpbWdT?=
 =?utf-8?B?WU1ndXNsUklGQnNaUHpMdy9tVWVGRDFmZHFEVkdpMWJzVmp6eWNENWpJYWtu?=
 =?utf-8?B?NElmK1ZmVUFqWGt1ZXRxMkJIOTVOZXhzaERKeElDbEZEeUJyRnhuc3NsTy9o?=
 =?utf-8?B?anJvVko4R1BHS3piV2ZZMU5jWXlCRTRhMFRGS2RYYzFPY3RpWFpJalEwQWIy?=
 =?utf-8?B?dFJYTG55M3pXaE5yUEpDMnF5Tkp1V3NmNzhPS2NwdzdYU1VpWENzNnRZUU1B?=
 =?utf-8?B?eXV2SFRlQXhtV2hGVzh5bVlldWxpa3RzMWdlUjZGNTNjdndrODBKNVkwbGdV?=
 =?utf-8?B?MWthL3VRb29FVmpnSkVndzZ2WmZLMzFyV2pEMlJIRmNSRXVReUhqd2lDTmJI?=
 =?utf-8?B?MkNDNDhzaEJldS9RamF3cWtmR0szcnRFbCtzZnFjK0hjS3ZtWHZLTzF2T0FS?=
 =?utf-8?B?M0hkYzZBYjFsZnNtdGhQOE10SExuRUIyc3pSd3ZKWTBiempaL3k0d1VYa1Zi?=
 =?utf-8?B?eDZEcjNNK1BzdTBHMlVhSjVDbEU5VHVudnlOT3pxbG5GU3NRS2dvUXdOamxH?=
 =?utf-8?B?cGRtY2c1eEorL1IycnFYSVg2Nk1uRk9lSklzaUhnNTk0aHl0NDRJS2xZSGlH?=
 =?utf-8?B?WG9mekltRmtkanlZVElHK3FGL2dKY2Z0aXV0R1E4bUJUWlhEKy83ZkxvNmhy?=
 =?utf-8?B?bmUyNWlKbjNjRE9iTmFISHg4dTlQZU5mejAyNDVqeGVldHZGUXZVdWlSWmoz?=
 =?utf-8?B?bkp3YXBCSzBtd3hnQnViZnF4bVg1c3ZVbENjTGJJT1BWcThrRlgzVGo3Nmkr?=
 =?utf-8?B?RUh5VUhUbllzVFRhVVB3aC94UVVlQ0xsWXk3L3ZPaTBGb1NxT1oyVnE4TlJM?=
 =?utf-8?B?ZXo1Vmp3QzNxeXBrbDZtWThvQkVnZURRL2tPNFJqNm1WL3hFWUFUTTYrQTZ2?=
 =?utf-8?B?b01xVVFlTzQvaGtQc3BHMGlFSzVlaStnci96eml1NTZ4VWhWVGZIa1dLcXBn?=
 =?utf-8?B?YWt1MGYwMFdteEVwdENXY3VxWTVzZlNKTmhhcUF1ZkpwQTRuZExtbnFZWGti?=
 =?utf-8?B?S2xGRWZJVURMTG10NUt2WnE1dXFHYjA4c1NpeTNzNXprSlIwdlZTR1JTbm9S?=
 =?utf-8?B?ck00UkFOL1FTeGhPeWVXbTNpNC9hK00wZE9vWnMrY3RCZUpZVk5GVStVRTlm?=
 =?utf-8?B?OWJSOEZvZ0svYUtLcjFsTmppVE4ySFRrazdpK21YYlhOWFphQlZoSG1sY0dE?=
 =?utf-8?B?TThlSm9taDhCOFROUkFvM2dQR1pLdmtlalpJbzNZaTJpNmVlRkhFbGR5RzJ3?=
 =?utf-8?B?eGkwTG5yZWkrTGZ4Z0VGZDVoYWF0dVZEMTJTbm4zRUJRcE01ZzZMTUt2NWJw?=
 =?utf-8?B?SmN0a2tGWElJSm1ybEZiRDF5SjRxazVkTDVLUWNBVDdDYjhLL2ExQTJlVHZS?=
 =?utf-8?B?UndaUEZnOHhrb2dtUU5qbVo1cWFNeEVoWG03MXhQRlZNSUR6UVhrZG9JdzVu?=
 =?utf-8?B?RnBmOStNZjEwVnR3OEU2VG5jY3RGWUFxL21LMVhPaGNXekxFLzRhdk5QUWk4?=
 =?utf-8?B?dUd4QTNjSzhWSFF2NGlid3pZaDVBRWRjMis1U1Y3enkyQXJ1WEl6VWh0RThH?=
 =?utf-8?B?NFdkOFZBUE9rbGdWZlQrU3Q1aWRzQ3ZhRHpYS3U4c2ZSMjVQcno5WWxqWXhX?=
 =?utf-8?B?Z1dUNXNGY3BBcG9YYkc2b2N1VXZhRkkzZ3Y4RVRhRHdqM1l3cG1LM0p0U0V0?=
 =?utf-8?Q?WhRC5d+q6BLUL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9881a26-a447-453c-568d-08d900efb9e8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 15:53:06.6970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fo72w3tBzo/f5dq0oM293dT/Ugy3H2XiA8L0k/bGp/0C82QsCHEv4xj9f/pvhc2p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2484
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
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTYuMDQuMjEgdW0gMTY6Mzcgc2NocmllYiBMZWUgSm9uZXM6Cj4gRml4ZXMgdGhlIGZvbGxv
d2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4KPiAgIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9nYXJ0LmM6NzM6IHdhcm5pbmc6IGV4cGVjdGluZyBwcm90b3R5cGUg
Zm9yIGFtZGdwdV9kdW1teV9wYWdlX2luaXQoKS4gUHJvdG90eXBlIHdhcyBmb3IgYW1kZ3B1X2dh
cnRfZHVtbXlfcGFnZV9pbml0KCkgaW5zdGVhZAo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2dhcnQuYzo5Njogd2FybmluZzogZXhwZWN0aW5nIHByb3RvdHlwZSBmb3IgYW1k
Z3B1X2R1bW15X3BhZ2VfZmluaSgpLiBQcm90b3R5cGUgd2FzIGZvciBhbWRncHVfZ2FydF9kdW1t
eV9wYWdlX2ZpbmkoKSBpbnN0ZWFkCj4KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1
Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IE5pcm1veSBEYXMgPG5pcm1veS5kYXNA
YW1kLmNvbT4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVl
LmpvbmVzQGxpbmFyby5vcmc+CgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9nYXJ0LmMgfCA0ICsrLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2dhcnQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9n
YXJ0LmMKPiBpbmRleCBjNWE5YTRmYjEwZDJiLi41NTYyYjVjOTBjMDMyIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nYXJ0LmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2FydC5jCj4gQEAgLTYwLDcgKzYwLDcgQEAKPiAg
ICAqLwo+ICAgCj4gICAvKioKPiAtICogYW1kZ3B1X2R1bW15X3BhZ2VfaW5pdCAtIGluaXQgZHVt
bXkgcGFnZSB1c2VkIGJ5IHRoZSBkcml2ZXIKPiArICogYW1kZ3B1X2dhcnRfZHVtbXlfcGFnZV9p
bml0IC0gaW5pdCBkdW1teSBwYWdlIHVzZWQgYnkgdGhlIGRyaXZlcgo+ICAgICoKPiAgICAqIEBh
ZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50ZXIKPiAgICAqCj4gQEAgLTg2LDcgKzg2LDcgQEAgc3Rh
dGljIGludCBhbWRncHVfZ2FydF9kdW1teV9wYWdlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYpCj4gICB9Cj4gICAKPiAgIC8qKgo+IC0gKiBhbWRncHVfZHVtbXlfcGFnZV9maW5pIC0g
ZnJlZSBkdW1teSBwYWdlIHVzZWQgYnkgdGhlIGRyaXZlcgo+ICsgKiBhbWRncHVfZ2FydF9kdW1t
eV9wYWdlX2ZpbmkgLSBmcmVlIGR1bW15IHBhZ2UgdXNlZCBieSB0aGUgZHJpdmVyCj4gICAgKgo+
ICAgICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgo+ICAgICoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
