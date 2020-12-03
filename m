Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BCF2CDA99
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 17:04:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A736EB7A;
	Thu,  3 Dec 2020 16:04:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2046.outbound.protection.outlook.com [40.107.244.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236C16EB7A
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 16:04:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bt58p0rBdHKpoFXB43nx4z2sFvhND/JQTFFT5WdtblsLrcfBokb47V5N7+8QxhyYcnJtszFlQVphPCsNNgYWMcr0uQ3UwCjv7bfh2w6wIo1BafDOAbzrA7ImtMUfCL15lJuPOmQ6DFmMW2sCfeifpS5d2E/1tZOT7l3CpC3iR8/OgQQTATN7VUAtl/kldgMTZCfv38mOF00dWaOLuaZdZEfQSIGwV4/Nt8CxG5agPZ+PZwI5DCRCej48enShUW2ylFAOV4LTMRnud3DE9LaAKCqyhXSsbh2oyjE8Gr5FAZlpDzqbHH7+K07F91gkBu7+ZPqCDDQIfMygVKPhXVbOBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQqkfi5vCGf7fZXe94Goguxcj1h9RLuLfSeCr+/1hN4=;
 b=gX1TQ4AFXK9OMwFLeHA0mG4PEqyV9bmoOJqYJOjBGnmJJPtwmecMDqIx9WXYhvzY4bnYiOJsm2jkD+gpxCax8smEnYKI8lsjK9D0kEP27B+nOC3J9ASSH6tZl0BbjF5P991q1HJd1uES/L9k0r3oE+LIMVt74O7pXR74zFMt9XeIGO0Nud2aFJTWGB++7CAMCmyXiPClHGO1Wp8AimDFfIupTk+9Egp/jtsYW1/UHks+vKZHQZD5acpO6KFG1f7igTDujV6GJsFbdKXEacUqSxOxtCnE8nnmVmYFf1V1GTKNi4MCLOyDzs2KUs2RSiFo60sR83uBP9cQZJYkHBLlCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQqkfi5vCGf7fZXe94Goguxcj1h9RLuLfSeCr+/1hN4=;
 b=C7ur7DRbkjvE2NuSHq0hXWjspt5p8Mowkni2rdyu63k4YaTgHPUFPJmKPDahT3sskSIkvGmBl6hSVTWoAbmnZJhUiL0ZHPDbp9AbUdrTxinAlE+U51op3mKXiUR4zcyJUysPvwkmeTt9wYbFFtje+OZ0g5rK1RomYh+PXnaZgmk=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2547.namprd12.prod.outlook.com (2603:10b6:207:3e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Thu, 3 Dec
 2020 16:04:00 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3611.025; Thu, 3 Dec 2020
 16:04:00 +0000
Subject: Re: [PATCH] drm/sched: remove superfluous whitespace in
 drm_sched_resubmit_jobs
To: Lucas Stach <l.stach@pengutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20201203160217.3479319-1-l.stach@pengutronix.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5c1b5443-29c8-8392-e9f5-4fe50f22781e@amd.com>
Date: Thu, 3 Dec 2020 17:03:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201203160217.3479319-1-l.stach@pengutronix.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM3PR05CA0150.eurprd05.prod.outlook.com
 (2603:10a6:207:3::28) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR05CA0150.eurprd05.prod.outlook.com (2603:10a6:207:3::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Thu, 3 Dec 2020 16:03:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 01afe49b-1fe9-44d0-e256-08d897a50bef
X-MS-TrafficTypeDiagnostic: BL0PR12MB2547:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2547C2EF359F67E98EC0AED583F20@BL0PR12MB2547.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:16;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F8BdcsaN5WkP9hGjhtwRYXDtnkEcHORBrguILQ+UcTcgw9IkqfClVhqLf4KoQn7TjJT5LSD4tVXIrtPtTttdrJZnORqVaxFQEak0FpraNT+4wv50AP4zjIuomS+8IaE3ycEexzReoXXpjuqcvuNmQ4RCO4bSzoLJjZzv+Bj4LtLFPi4jvCCo3qWflKsA7Y1Gii0O7Em9yN9W1+u3Az6OCYbmyJEYLb3J+Q4ORVqcbs89+g6/IRIUqG5id/bqnSSzFlTB0MEnPA8zwegRxEvqnCaYAfcwYN2IGs9ufyYA+xgsfBQu+iRmER89XNGYWTu/NdfkfoZ1nEz3LbI+XqNDiwbiCJ9YAa7bmqL1PTtEX9R++Zp7ZcA1/T3OXPd2y2w40MEywLsVQQrcghZARkdW56Fsg61DYiFUgHSgg6DGgso=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(136003)(396003)(346002)(376002)(110136005)(186003)(31696002)(86362001)(66476007)(66556008)(83380400001)(66946007)(8676002)(36756003)(8936002)(6636002)(4326008)(4744005)(52116002)(2906002)(16526019)(31686004)(316002)(478600001)(2616005)(6666004)(5660300002)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T3h0T20vOVRmRzJYblZxYllaTTVvem9uZCt6YVBpeHBJTkxnWVhJSUxQY1Nn?=
 =?utf-8?B?ekxXTk1PeHlVUS9IQjVEdG1tSWcvT1RuVndwcmY3SEZwdHdMNk9LdnJGYkgw?=
 =?utf-8?B?bFJteWorSTdFRThtWDJIVFBCVXRpRWJUS2dtS1c5OUw4bUxLTjFJVHpOWnRq?=
 =?utf-8?B?ZlAwTktTSmIzWWxzTm94czRTV2p0QnhuY09Ld0ZXYXBWTEI3cGh2bTV3cDdl?=
 =?utf-8?B?TXNHa3Vwa0VoMi9wek5wMDdqbUtRd2sxK0FiRm5MeTg3VUJMdzJHZ2ppZHVo?=
 =?utf-8?B?WjA5L2tlL2svWC9JTHQ2NkV2UWgwVlhrem9sTjdTdWRWRi90U1B6ejN2UlJX?=
 =?utf-8?B?NWZlTnpaRytjY0V4elcrei80WUovUWJwVUVvbzFPQ3RjK3prMzh6VFpWdDBk?=
 =?utf-8?B?MHRtVmYrWlhCKzZIZHlUZ0FVTXR3WDcrRnF4OWtnNVMyQWJpM2ZTTlFxejJo?=
 =?utf-8?B?NXM0QmwrUFhUcmJJeGNYVU9xT3J4bnk4OU9rNXgvbUFkQmp3SVVQWVBCS1ZY?=
 =?utf-8?B?YnpGcjBIK1MrMnN6ZWY1Nkl1NEtuS2ZYUGxocmE0VDBnUm5sMkZiSS9IOGJ4?=
 =?utf-8?B?bmUwZ3VUZmFLdFgyK2JHZ0lzVTJUWU9mTEQycHFFK20rQzZKZ01sQ1JteVJG?=
 =?utf-8?B?TnBhMVIxWGlpbVhqV1lBK0FRSml2RVlkMUhXcnJ6cXQvSW8wL2pqUW82YzVn?=
 =?utf-8?B?a1RpL3dxWlVBTGoxNXB0cWo5elowNzFXZFE0YktheGFzR3FnYTdoMEt1WEVw?=
 =?utf-8?B?bm5qYThyd1J4ZC81SkE0UnJBOWNLNWVmMVZlS0pQdjBQOHRza3hETkxBTkJH?=
 =?utf-8?B?aHZ0M3I4akpkaXFBeFB2TjZDYUx3OS81bXZtSlEwbWpzVGV6NXJXYjlrWW52?=
 =?utf-8?B?RGxOanBERHNRd0JqK0FrNDNYOHJNQ1VNcGRGb2ZNSm1CL0hLZkxmbTBOQmh5?=
 =?utf-8?B?M3ByN20vNjBYaStiV3k2dUVMVHlRTzlQcFVLL1B2MDhBdmprbDRycWZtbEZM?=
 =?utf-8?B?Tzlud3c3ZHZTcHVjUXZyNm0vR1NwandVbUpqVGNuc2RtZi9ZNEFHc2d1eWxl?=
 =?utf-8?B?SzlXT0lZZ1lIVlNXbG9LQVZ2aGhBTGRGSzFmMFNCYUdWNFZWanhJaUZzNHhp?=
 =?utf-8?B?Q3o3T1NZcEhmMURNeEV4Z2VKK2RYU2MyUEtnRFo2NXVNWW5vT3Baa0x0SUdQ?=
 =?utf-8?B?WHdUWnp5MVAwN3cvLzhIZXZJNVNnTVNEOGN1ek9TY3FMenRZUkszdnFuQlYy?=
 =?utf-8?B?M204NkxMNkhad0RjOTZORWQ0cStGaE1mNktZREtzanVBZ1dOVVZDc1l2NHZ0?=
 =?utf-8?B?R1RzUHFoRG1kL3g5ZWs3Q093YXBXR3ZLdXZwckt2Y0dPWEtkRE8wcUh6VGFZ?=
 =?utf-8?B?c2E4UFhIQUxFVWt4QUE0c0J4eENxQTdpLzN3YmVZMk16ZGplYk1ZNEdzVTVQ?=
 =?utf-8?Q?th7psro0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01afe49b-1fe9-44d0-e256-08d897a50bef
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 16:04:00.0922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VWIrp9qdpX66YG2dWpAE4Cvek8HaibMQT3OkHG4nfy7gCD9Qv+04c5wZit1lIMxT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2547
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGltIHdpbGwgcHJvYmFibHkgcmVqZWN0IHRoYXQgd2l0aG91dCBhIG9uZSBsaW5lIGFzIGNvbW1p
dCBtZXNzYWdlLgoKQW0gMDMuMTIuMjAgdW0gMTc6MDIgc2NocmllYiBMdWNhcyBTdGFjaDoKPiBT
aWduZWQtb2ZmLWJ5OiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KCkFwYXJ0
IGZyb20gdGhhdCBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFp
bi5jIHwgMiAtLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgYi9kcml2ZXJzL2dw
dS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwo+IGluZGV4IDlhMGQ3N2E2ODAxOC4uZjUxN2Zm
ZDUzODQ3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFp
bi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKPiBAQCAt
NTI3LDggKzUyNyw2IEBAIHZvaWQgZHJtX3NjaGVkX3Jlc3VibWl0X2pvYnMoc3RydWN0IGRybV9n
cHVfc2NoZWR1bGVyICpzY2hlZCkKPiAgIAkJfSBlbHNlIHsKPiAgIAkJCXNfam9iLT5zX2ZlbmNl
LT5wYXJlbnQgPSBmZW5jZTsKPiAgIAkJfQo+IC0KPiAtCj4gICAJfQo+ICAgfQo+ICAgRVhQT1JU
X1NZTUJPTChkcm1fc2NoZWRfcmVzdWJtaXRfam9icyk7CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
