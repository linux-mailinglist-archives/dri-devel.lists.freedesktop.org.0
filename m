Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A22633623FD
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 17:33:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A97E86EC4F;
	Fri, 16 Apr 2021 15:33:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750042.outbound.protection.outlook.com [40.107.75.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B58E6EC4F
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 15:33:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T/BjQ0JWEw9aUvAf2iN16R2l4ra/s/YANghlLU9v93M5ZoreojI+vBwZpxaxlyCGkZO+Ham4Lv8pVmp8sKnmPAKbi6A73JNQ2Ftnw4aRtYl/1CA41eUBj5JiT6v7wueDfiI2eb2bG3ZlLyDN5qqYQ5BvZhOGR3McSoAUIhE7hQzBqGASmQU/erS2lBMePbZSqFxM9OYWkGw1KFxcBFY4sOx9nvO83HNhPO6Z5HjxyiER2902F2e/D1nby1u1nGztVIxtlaK52gkm4dUb+/XjGOm7+07poOXPsLx9wCvz2NEGzYXAnpERvvy2Ansu8121+JFnmebdlgbQxxxKMxi/8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mCOjr6LTjaXslOxvQqwfEcAnHGmC/nrROa/oE564FfY=;
 b=Gewh55GnMkjOzyWmqAP+1ZLpCEa5KvzcqLS4M7DQWqK7FqxjctKPpq0ICdDtrw3pBYc+vFkYFdATbJ0MsoOTX+1qU1ve6oVtUxFN3ZasXUCqxKDIYyiaHUTxsDkPR3FJoloyt9xy9ZInWv9ZgELuqtRRzHk6xsL0ril/BFbQUKvCfmEKAYqPYmTVFivlct6WWxqwK8bJZw4i/eOrBxckAHvqay9mb2Z1EcyXTb8Z7Hscd2QI34SqEh1JVttlmuWZFEUBtD4t5Hn8xuG4PMgH9o+vKDEm7Clajd1DV8EaG7QbNzbjRPgYSdCuY9/5bTpFyOcLsTgmvbL2zOw1pnBNjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mCOjr6LTjaXslOxvQqwfEcAnHGmC/nrROa/oE564FfY=;
 b=weSYTlTYxsDPlzgZAbLpLkeYQCYa2gBbRIynP2WER0cb1Bm5NnzVc3LV6ViLw9voMy5jjupNeA3oKqx/p1rZzZ7oexR4l8XoU0rik2/CrJ03l9VYWiovBbfaGe+rDZ9hce+9IIQn1tVXa6ClO7IADoGBH1zoIV+kUj8gP+QUfiE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4783.namprd12.prod.outlook.com (2603:10b6:208:3e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Fri, 16 Apr
 2021 15:32:59 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4020.025; Fri, 16 Apr 2021
 15:32:59 +0000
Subject: Re: [PATCH 27/40] drm/ttm/ttm_device: Demote kernel-doc abuses
To: Lee Jones <lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-28-lee.jones@linaro.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e5d30ac1-3037-0101-0e1a-9df6a8580c70@amd.com>
Date: Fri, 16 Apr 2021 17:32:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210416143725.2769053-28-lee.jones@linaro.org>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:5d8d:1198:63ca:8fe4]
X-ClientProxiedBy: FR3P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::17) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:5d8d:1198:63ca:8fe4]
 (2a02:908:1252:fb60:5d8d:1198:63ca:8fe4) by
 FR3P281CA0066.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.6 via Frontend Transport; Fri, 16 Apr 2021 15:32:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b942ab02-1131-4f6e-2b15-08d900ecea33
X-MS-TrafficTypeDiagnostic: MN2PR12MB4783:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4783DC04709DCF9A0B3443AE834C9@MN2PR12MB4783.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TFgaPaSaH1J2G21lYQGIzFtzN1oHdLGx+joK7hTTZ/zlMZzQMNcA3DospUhsSpDGZAuklcr9UXd8nk5gzQMh9Iy0Wm14la/3hxfiuH6VxEOvbeLbry9HISI+i/tLv8Es/d8ch33Alp4a8U0l6yft4Gfw3FCtqQww9i8NCkDvDMtGIr/Qhn6vkr1yPGM4cnxigH2K94eFurEffrBjt9jVcqukUUFzIB8/SigQZjwYh7YACP8/QgeD7VgGCKXNsXnXXbDQe2PsKUbBc+luVnwT/w7HUJE2IOiqQpdbZbBgMMHHRO/k0dA1+AYUjmqjBs0mjQVrJSODgrdUYC4+vvgyInLinIuCTkAayoE+pD1U3FxKJ6GcJxx+S0pS874mDZt1MCj666MusMwpGIEST8hr6N/gNkL3i2fdUOmPq7/q7RvOHVRNlHpizPHsUnKVymWMB3UsozhA65wiBkh9gkyZY/xvHm8KW6ppdK/4z9aeN3+JMOZP7G/8UZ70/JMJd9KX4qPb2bvAKidxSzmYb9UO2mXTqTMAK2PaP4A0lTVwDUWuEi8Y+V7wfUaplbDuvLlAf8b4Wtei9uVn7Wu6ayaT35KtaRA56BI/2AS21MdWIMHEWF0bf+YvXPXLAK75TZRgLU+qUDTBvjwmJEXOAmk9TvQ8aqWxfphDM/wXEUmn2oqVHB1BmHvhj9sHmrS2DiHv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(396003)(39860400002)(376002)(346002)(38100700002)(52116002)(66476007)(186003)(66556008)(83380400001)(6916009)(54906003)(8676002)(316002)(5660300002)(66946007)(66574015)(16526019)(4326008)(36756003)(2906002)(31696002)(6666004)(478600001)(31686004)(86362001)(2616005)(6486002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dXE5VkJlY2N2c1FSdTE1a0lyMFNCcTFhKy9NTmR3dEhMWkc4enpWdE5YTnVU?=
 =?utf-8?B?dlVRakFnTm5hZmNKZ21iRng3WFM2cXZ6MkJXdHZiRlZRdmtpWE8xNGdHOU1t?=
 =?utf-8?B?SmZROW9ldlJKUmFZUjF4L2svNndtUytKRzhZbXBKSS80ckdhTVhBeWVtZWl4?=
 =?utf-8?B?VitJTWp6R0MzYUcvb2lucVdMNUY0c3dFazhtcmpDNWw0UXhlUEhSajQyS3Fs?=
 =?utf-8?B?dDBoTldWbHhFQ2t1SWorMGw5YzBWaUYzT0hpcDJlWnZNYnIvU0FIZHNTYVZL?=
 =?utf-8?B?WWdPanFkRzdUWWFoWjNWdUlqRnhMV3lFaTVmN2VJZEZqM1ZtUUUxOTJjL2xP?=
 =?utf-8?B?c093Yi8weWU1NmFNai9uRHFLRzVyVnBMZDBMRndqQ2JvZTBUYjg3cFBqclMw?=
 =?utf-8?B?Y21zNHlEWjByK29kSHNjUGJBaldCY0pYenFEN0VFcml3VERhdEJjYjhwaEVD?=
 =?utf-8?B?cTNEdUxWaGU4NWYzZEZ6cGpoeUFtbFFvQmJrZGthK0diT3NzQlZUVzJGbUxa?=
 =?utf-8?B?RWhLaVZlNFJObmFjcjM2V3pXNElNSGRjSUVlR2VXaVFOM3pITkgvMGp5Tm9m?=
 =?utf-8?B?dFowaVpqVnZoT2tOQnNaaTc1SHFjTHpoSDFUcXllMUFXWHdhOUUzaWRXbTR6?=
 =?utf-8?B?Sy8wa3hUOUtsQ1JUT1dBQi9ycUdNUGVXVnVpaU1SeGNwMjV2ckJQenFva2Nq?=
 =?utf-8?B?YWNLYy9IUEsrc2hkaDlqcVFrS1JzamVyYThOcjU1dlhpVzd6dUdxQjQ1dnUx?=
 =?utf-8?B?YXg2QnJTcUZ3SUNjMzRpUFFhWCtBYjI1d2JVQjY4aXJDdjl0WHREZU5LaTZR?=
 =?utf-8?B?dURIaW14ZzhyY1lEUUxCSlFtS1oxMThqejF3NG05M3FLZE5LS1lEU0lHcDlh?=
 =?utf-8?B?am5LVkJ2aFkwUEFmVFFVblZ5YVJPNE1vV1lhSlRZaUc4bzE2RURlb3lYNnVJ?=
 =?utf-8?B?YVB0VEhiOVRGOHQrUVZmOEVXSlpMUUZpakFuSWwxVUZoM1pOMWlQUnY4Q2RS?=
 =?utf-8?B?aGh2NjZZV1doZTR5R2FCYno3VC9ESjFQRm1jbXJCbWJOb3ZZeWFiZEt3TDhy?=
 =?utf-8?B?bEh0Nlh5Mkc1QWp0Y0RFYWFUaHlOazFmNFZmVEk1UXQxOTI0aXhIeWRPQnNo?=
 =?utf-8?B?OUdtdWN1ZTFLT0FnckV6M1dpNXFIVEw3Q3B1QVNKSE9FdjBnOWpra054QXlm?=
 =?utf-8?B?QS9QNkRDclFmajZSdDV2aVVhc0pWTnhRZkFsZGt0N3lVQVJPSUJCNStldmFz?=
 =?utf-8?B?bXhjR0pSUlVjdWFuNkpndytpT2dTcG9nMTNsSzBsVERVaUhqZkpsYjhJQkJN?=
 =?utf-8?B?QW5WM0l3cmM4QnJLWkc5b3IwbHM2aGVFbDVpaFZEbFl3VVkyRVJJWlpmSXVM?=
 =?utf-8?B?aFdJeUxBbldFdU03UmdSdzROTUdsbElBMjNXRXptK212SnVIRmpNUWNPcWJh?=
 =?utf-8?B?Ry94Mlh5NDU0dWR0TEpiV0p5RnZrQmxrUGFSRHBURzdoRzgrZHFwMGRIbHA2?=
 =?utf-8?B?WGhWNVFUNXlFeFBUd0k0cCtIZzNWNGc1RVVRVnZUYjV6bFRpU1BNbHhtWmJm?=
 =?utf-8?B?bDI3bVBqcWNzcDcyTmRxUHdYOElITTJwMUh5NnZJRFdMSm9UN01zai8wRGJN?=
 =?utf-8?B?UHkzSTdsY3RYMERFTnFFTkx2RnlwaTRhNmxScTlCaURtYkZ2dWxUdE9SWlB6?=
 =?utf-8?B?TkZLU2lqNVFqUEplZDFrUmorWjhEM054NDRlYWxhOExoRkIwOGpYd1BKZWEx?=
 =?utf-8?B?MzhYYlhYOCtoRlFpNVluMXhxWTgydTBwcmFmSjZLeG1IUWVxSk1SUTR0VW5i?=
 =?utf-8?B?cTZFVFJyb21BUDd0d3U2R3Iwc1NTRFIzNllOQ1RKOWV5MXM1OWF5eHBJMm5I?=
 =?utf-8?Q?FA7cHJBwri/kP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b942ab02-1131-4f6e-2b15-08d900ecea33
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 15:32:59.3548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FhkCUOrG3bGoo+M1P8CQYhyAP3oG15qXc+zVU1u8Gj6ExsR7jO/YEb7kGY1SeNoZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4783
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTYuMDQuMjEgdW0gMTY6Mzcgc2NocmllYiBMZWUgSm9uZXM6Cj4gRml4ZXMgdGhlIGZvbGxv
d2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4KPiAgIGRyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX2RldmljZS5jOjQyOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVy
ICd0dG1fZ2xvYmFsX211dGV4JyBub3QgZGVzY3JpYmVkIGluICdERUZJTkVfTVVURVgnCj4gICBk
cml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9kZXZpY2UuYzo0Mjogd2FybmluZzogZXhwZWN0aW5nIHBy
b3RvdHlwZSBmb3IgdHRtX2dsb2JhbF9tdXRleCgpLiBQcm90b3R5cGUgd2FzIGZvciBERUZJTkVf
TVVURVgoKSBpbnN0ZWFkCj4gICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9kZXZpY2UuYzoxMTI6
IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2N0eCcgbm90IGRlc2NyaWJl
ZCBpbiAndHRtX2dsb2JhbF9zd2Fwb3V0Jwo+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fZGV2
aWNlLmM6MTEyOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdnZnBfZmxh
Z3MnIG5vdCBkZXNjcmliZWQgaW4gJ3R0bV9nbG9iYWxfc3dhcG91dCcKPiAgIGRyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX2RldmljZS5jOjExMjogd2FybmluZzogZXhwZWN0aW5nIHByb3RvdHlwZSBm
b3IgQSBidWZmZXIgb2JqZWN0IHNocmluayBtZXRob2QgdGhhdCB0cmllcyB0byBzd2FwIG91dCB0
aGUgZmlyc3QoKS4gUHJvdG90eXBlIHdhcyBmb3IgdHRtX2dsb2JhbF9zd2Fwb3V0KCkgaW5zdGVh
ZAo+Cj4gQ2M6IENocmlzdGlhbiBLb2VuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBD
YzogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJs
aWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9u
ZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vdHRt
L3R0bV9kZXZpY2UuYyB8IDQgKystLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2RldmljZS5jCj4gaW5kZXggOWI3
ODdiM2NhZWI1MC4uYThiZWM4MzU4MzUwZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9kZXZpY2UuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2RldmljZS5j
Cj4gQEAgLTM2LDcgKzM2LDcgQEAKPiAgIAo+ICAgI2luY2x1ZGUgInR0bV9tb2R1bGUuaCIKPiAg
IAo+IC0vKioKPiArLyoKPiAgICAqIHR0bV9nbG9iYWxfbXV0ZXggLSBwcm90ZWN0aW5nIHRoZSBn
bG9iYWwgc3RhdGUKPiAgICAqLwo+ICAgREVGSU5FX01VVEVYKHR0bV9nbG9iYWxfbXV0ZXgpOwo+
IEBAIC0xMDQsNyArMTA0LDcgQEAgc3RhdGljIGludCB0dG1fZ2xvYmFsX2luaXQodm9pZCkKPiAg
IAlyZXR1cm4gcmV0Owo+ICAgfQo+ICAgCj4gLS8qKgo+ICsvKgo+ICAgICogQSBidWZmZXIgb2Jq
ZWN0IHNocmluayBtZXRob2QgdGhhdCB0cmllcyB0byBzd2FwIG91dCB0aGUgZmlyc3QKPiAgICAq
IGJ1ZmZlciBvYmplY3Qgb24gdGhlIGdsb2JhbDo6c3dhcF9scnUgbGlzdC4KPiAgICAqLwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
