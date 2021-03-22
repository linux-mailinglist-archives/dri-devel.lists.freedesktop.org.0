Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8536434407E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 13:10:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F9296E456;
	Mon, 22 Mar 2021 12:10:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D64C89BFB;
 Mon, 22 Mar 2021 12:10:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aO2HlJf6CswHrYmUqApypDdhzQm+UoORzl1uQcfUeEgU1sszp/sxBKrYK/UzRTGW+kY2p6paletljGeAsz+lwC+KEsKmOGzW23lMcuFVXI7SCinaTls6Y2iTS9UeZmD3swDQq24th0MNAIJNr/5GdWwQBgX+USsrBaKpxo8QF7TjOnMIbb5yFGD8GcZ8+4D+lz0a2PWhb8v9QmICTa+6mDw5QrT/k1713ZmtWURSpXNSTptXxC52Q2uljkJwhHjPpAKxiE6EBkfOUXt8wgrwx8Q6nLy3tNK337wCDkoNR6P1aR+01uCEEraE1VeGvXkuxPVE93HHSHCgI4rsHJ38pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6nm/p5xvXGjzKL2mUIwyLINlYKVwzGXwhWzn5rcknOA=;
 b=ZenD+sJALvlkOz6GAsWRGCnvl6Ts+YNkk1x23ZZbp67WmXc+Q5J+EmbUTsIv+Z8C1IBEPFmZkj+RrUuqjB3adsF3csGQ6v3kvMFo2PHHhk7TLYDv+qf6/z6fKiGGY1k851t3QFIIfkTO223PGDg7Tg7XTH2MqklqsF9pxsmmUmepQZTuynhrzafi1Ncs4Uosy/s5GuIEkqYUrF/iPh0+XnV6kfTSKP4e9CG54ZCxR28OejUYxhhNtpxJGefi4wHmV39Iiq4rj1FEonRSf/OcjnMpEHIH+FlXxBIJql4IPDx9OhFT5CNc2IcsE7BZRcm89OghwKOhlM0iBsjopsQL/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6nm/p5xvXGjzKL2mUIwyLINlYKVwzGXwhWzn5rcknOA=;
 b=KmGs74kHsxFrkzslDIkaDnRhbMK7UoHkFpRdn4W+RjovjrEk5qEe/up06dU9e50BvxGIQ4Gm6KyFlEjwPap3j+YK5v5yIJbc8IFJMMnh6Nez7gFxaZ4ZO0nRAbjdDH8NA7iCVSJk7deXGd4lIqFkY3m46FyPuiB3Q2HbT3Z/2uY=
Authentication-Results: yeah.net; dkim=none (message not signed)
 header.d=none;yeah.net; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4408.namprd12.prod.outlook.com (2603:10b6:208:26c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 12:10:00 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3955.027; Mon, 22 Mar 2021
 12:10:00 +0000
Subject: Re: [PATCH] drivers: gpu: Remove duplicate include of amdgpu_hdp.h
To: Wan Jiabing <wanjiabing@vivo.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Evan Quan <evan.quan@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Dennis Li <Dennis.Li@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210322120227.60953-1-wanjiabing@vivo.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <de34c5b1-1827-cc91-f719-a36a33717cb9@amd.com>
Date: Mon, 22 Mar 2021 13:09:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210322120227.60953-1-wanjiabing@vivo.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:e345:6f8e:fa4b:2c52]
X-ClientProxiedBy: AM0PR10CA0023.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::33) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:e345:6f8e:fa4b:2c52]
 (2a02:908:1252:fb60:e345:6f8e:fa4b:2c52) by
 AM0PR10CA0023.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Mon, 22 Mar 2021 12:09:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 71821be1-7f2a-4abb-989d-08d8ed2b6a7a
X-MS-TrafficTypeDiagnostic: MN2PR12MB4408:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4408DECD0650C3C5924C678783659@MN2PR12MB4408.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mlHluiudD9HW3/pU/Z2H/U/SZsJxRO5TnVSGPzMlrvZSY7Q+EkQU5RAskZtAmFGeIuUkIlZ5rmT85JfWuI+wiJH06Q/jMEBoOB9c6lPzYWZeX96baQXvYmB/fA4QEkCumpM0vGqoswemWfkMLM81+h/pG8zuS5x/6X0KOdavnbsBoNg4Y3RcxOnsMDvoWpqYXN/y4lvoq58lJhhUMLbzXIc/2085Xr7Bs0nDSGuHIDOiUyxjqTHUdAxryloyePFemuOb+Bopmg7yDtO64xspYJ8Jq/EK1YhptlplDrFojvDEirQa/X6qJHlax8SZxH5zE/0PtDOvUn54QKrnvk0W/izAnqJFsyFbwPr8pYKFhpKsz0RXWZqj200Zqskyosfy9U/09bTCRugY4gZgKmwP6458lbiNVBxJaFmRUAufKYCq3sjvMH3S6K2+LPoXxjOEsRdbKYisU0M6/AJmjNHFPKdIRA5CJbRCc5iFCz4o5zdrI+w1RHhSBfRZ+c2beDayjojNZQR5HZ9Q0G9OZAVAsnHPBaTzegmnujO5VXNHRddqajEpsGH39t8htcrnk3vdb0o+D0UGJ8mSMfVeBrnugkjevGydna+n1DvXpxHZ3lfeE3i3tCtgiHhze7mPWSBwoML4roZapYgyQMTqyPc1kPbWv+hkcB5DJqlplufkQhAdpKVPyig87luURCG5jhqCtLob2UvDSYk0tDam7kC6GLSQY8F4zWoNJOuwjqwUX2UKxx/4XV6oll4xVdVKSpG4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(86362001)(186003)(5660300002)(2616005)(4744005)(2906002)(8676002)(31696002)(8936002)(16526019)(31686004)(921005)(110136005)(38100700001)(66574015)(66476007)(4326008)(36756003)(66946007)(66556008)(316002)(52116002)(83380400001)(478600001)(6666004)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bnhkckluQ0JjV0RNbWxHN1lyN2dQM0VaUHNmZnVvaGo3anM0WlgrWkxtYndG?=
 =?utf-8?B?NDd4aU9hdGU5SStXbnZsWkRzYjlkUnZSVk5tVUV1UXlETzVVWGp4c2NkVWVX?=
 =?utf-8?B?THJOSHJmSDRPRUdPTzZ4blRORUkzaHZ0OUIwdmxmZFFBZmpQWkJFcFl0aGpP?=
 =?utf-8?B?NVN1aEMyS2E4TzZIUmo2WlZyNGtKQzd3R2dMWVdCZDkyOVZsWUJvaWt4WUJk?=
 =?utf-8?B?dnlVTWdnN0NON3dDRFUxazZVaWxUN0pya1l5UzQvSWFTVmJtbW9lWk85VnJl?=
 =?utf-8?B?Zi9xamFXcWJ3MHJ3Mzl3Q0VXSFhOVXpyVExsTlhSdDAwWlhCMlhIM204N2VS?=
 =?utf-8?B?U2JBTUQ4NHZHNEwvN2VLcE52d05NaVhJUVhlQU5VUmhpck1uNzVxaTBkVW1v?=
 =?utf-8?B?L2FTYnQ2U2Y2eUJyUS9RZ2tYNEVxTHhxNTg1Y1BWOWJ4dHh0SHRYR2EzYkZq?=
 =?utf-8?B?Mm43TUZaVG5LTXhGTHIvQlIrbFJKUUdUNzhYM1hZL2ZKN2xNRHAwYTF1Zkxj?=
 =?utf-8?B?RjVueHkyNDNrQUlManl3elBPSVg1YWw3S1lneFUvNzAxSm9QdENCK28zcXVL?=
 =?utf-8?B?N21UZFh6UWdiN0hSc1RTSlBJTHRndFQxK05Va0ZFdDVDOEVEdWFQV1l3a1RX?=
 =?utf-8?B?eWc5MjlXSU5mQWRjZElKNmsyakdtajlpMTZUZDBVVk5heSsrazZaQmhCdHNV?=
 =?utf-8?B?bWZXWnNpV01YZlVHN0NROHFBd0F1SEFjUHNMMlZlbHRCM2hCSWZUZ3dHRDlk?=
 =?utf-8?B?cUU2K29uQitCSnd6YXlZcVpPVUlIdnQ3MENGYUFxaHd5UDBHQURxYlZiZXRk?=
 =?utf-8?B?eFZ2NTZBZVVKM3Q5KzJlemlsUndQT2xwS0I5OGZxeTNKRXZWS3JUMXdUbGVL?=
 =?utf-8?B?bHZlRzQxWWJLNkVFTDJ4Ly96TzQ0bngyRStsdmNTajlXbUwwT211MG9hWDM1?=
 =?utf-8?B?UWFMWXZCcGQxZmJRZXRqWWM2L3oxeWxzc2VsMlBmOUVLZ3Y3V3dBaEsyMUZj?=
 =?utf-8?B?R25kQWtMYkZ2OE9PNUJlOVVsYTdIaXB4TnI0SHFxaFdpci9VLzVoRnhrTmRO?=
 =?utf-8?B?ZGFkNVNEdXR6RDZhYmU2N2FyL3oxLzVjY2U3TTZSSThCWlJPc3pSeGlycVdP?=
 =?utf-8?B?cldTRURqZFJDYkFkNlRZNE5jQzhBQWRvTEFROERQc3dXRVhaaVlLa0Y0cUNs?=
 =?utf-8?B?RVAzNkxGLzBia3haQk5xcUMxdlp2RlMybDNoT0U3VVhxR3pScGZBTGlUZDh6?=
 =?utf-8?B?QjhVcmNuK1gzTm11NjFiaWJpNmVXMTA2QTlWeHpUenhqNiszOUpML01wY3V1?=
 =?utf-8?B?bGlJQ2xGUFB2OVBrQmhqTys0bURHM3NMUUhpQU9CRmQ4Y2hGckFCTmVBdFZY?=
 =?utf-8?B?TUZ2YjI3RTN5S3hFV1hXdXlmZldhNFhJZXhxYUhEbHBXNzNHZkNLNmNpZkVQ?=
 =?utf-8?B?alJiSFR0QmlxUGY0OUl3SDhNdTZzcDUzTy9CbDZ4UndQa2dFcnlVM2hMekps?=
 =?utf-8?B?WDIrZUFVR0ppZXZHdndmWnRQVDRPcWtNY1NxY0w5bVpnV2FGaUJYZzBnTGNj?=
 =?utf-8?B?MHBIYUJQWVFKRittSE53dVIzUDZFSGFUMTUycTBTMzMzcG1vaUxwK3VpK1lt?=
 =?utf-8?B?MVl5RGdQRjYxMTJ1OWNwQ2hJNVpTMmkxTWZMUTdaMG55dkU3NEJoalV3VUNu?=
 =?utf-8?B?aExqWUlvSjVJMnZtZ3JMMDRtQkVtUzVwdWtTVm1vK1hCTk43cHdVZldVR3lG?=
 =?utf-8?B?YlJhRG13NGk5WTFTUis2V1Q3RGdHR09qZ1dSSUw1SDlRSHhlZHZYc2FqdDNL?=
 =?utf-8?B?YXJHcDZaUlZMbjZoRnR5SmUzdEJEMER6R25wVmtncHB5SzJFQityZnVpK0M3?=
 =?utf-8?Q?xKU2P4cdNaJrt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71821be1-7f2a-4abb-989d-08d8ed2b6a7a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 12:10:00.2559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PxFl/rEfF+ZOGIbqp5F8+86XLbSVYzdua/DIZey9yOQRPpf6Yw6UjYxEA0ZOFAGm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4408
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
Cc: kael_w@yeah.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpBbSAyMi4wMy4yMSB1bSAxMzowMiBzY2hyaWViIFdhbiBKaWFiaW5nOgo+IGFtZGdwdV9oZHAu
aCBoYXMgYmVlbiBpbmNsdWRlZCBhdCBsaW5lIDkxLCBzbyByZW1vdmUKPiB0aGUgZHVwbGljYXRl
IGluY2x1ZGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBXYW4gSmlhYmluZyA8d2FuamlhYmluZ0B2aXZv
LmNvbT4KCkFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+Cgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmggfCAxIC0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHUuaAo+IGluZGV4IDQ5MjY3ZWI2NDMwMi4uNjg4MzZjMjJlZjI1IDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKPiBAQCAtMTA3LDcgKzEwNyw2IEBACj4gICAjaW5j
bHVkZSAiYW1kZ3B1X2dmeGh1Yi5oIgo+ICAgI2luY2x1ZGUgImFtZGdwdV9kZi5oIgo+ICAgI2lu
Y2x1ZGUgImFtZGdwdV9zbXVpby5oIgo+IC0jaW5jbHVkZSAiYW1kZ3B1X2hkcC5oIgo+ICAgCj4g
ICAjZGVmaW5lIE1BWF9HUFVfSU5TVEFOQ0UJCTE2Cj4gICAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
