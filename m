Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F572D5A6C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 13:24:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B9FC89F45;
	Thu, 10 Dec 2020 12:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4512289F45;
 Thu, 10 Dec 2020 12:24:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ghlvbhGqQ3/W9aVMg/5aE+f7VhlzyrXo1jtoYul/33jDPx5fc6mTCqm5BXoYe640ohNRKIG7Il97OLJ7Zt++jGa2S8OnKJVcNBQm7cGXXQ7HuJc6yT8FOnzHwp7UBzf2JAtxlKFMKdInjUYgixLX/NZCzoOkXEcCTOViwEY2P8OCSt0n3kCtHq6j5qshM+LlShhyGtqAqUygfhlJL+hnvwY2VzzfI9RSh5ZnOVuViVAT9FZCBPFqrOGipTFyNAFl309Mgjp4JyAsMJVx2U/DWH52avNYwrbZUrcwMwh7fBnlb+BuFEhFDYnVcU3jeK/X+gSPhVZdGlVXX+j289OHLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VR3ZLzjD8cIfGTzri+RkE4t1eaT/0eOvEYa+pd6AllQ=;
 b=Xs2crY+TI6q7hyNi0hFQC/hlarh8aqWdOvCEVE+v2av9whpIFp6PUMNH72FkYiJqGNQ+Dhawzhx3PfvwrlOsGRK6gpakJaVKQeZWJPZUmrhkok7qVZD67e8wHE6MiBoJ4ytZ/D2g8mYTZAqEyYv893Sc7x7JbRA4Bm32r5gDqJp0oh30Zbhd/pwA7O3nGyhO2hyN+tahlEyPRstDfxKEM2QfDbXVbQPyZdLck3dUTotCek0xURl/WjL9g3lRUEIsh5DuAA3Fgj86jVfqDj2LUuLJjF4+dNppQCXr0RmAn0NMKsCIjQcEwvVLDtPw06yEbfl5B26R4Y7l/eTV6fyCdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VR3ZLzjD8cIfGTzri+RkE4t1eaT/0eOvEYa+pd6AllQ=;
 b=AQ2a4YNaQV1kevptUdrZHGWc002XBsEzwyjcpgGhwcH5LePTsr5RUE9m+95RqUleKBcKsgM9MqU5PxOh8xCkvSZPbkgXAZ2s1psNQ1P6juYkHYBIx4S7SCDI3YHFGknatr22UzjUTM3kUKXIvIVRiq8BgVIZtqlJJPLp1DKi1OY=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4784.namprd12.prod.outlook.com (2603:10b6:208:39::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Thu, 10 Dec
 2020 12:24:50 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3654.016; Thu, 10 Dec 2020
 12:24:49 +0000
Subject: Re: [PATCH] drm/sched: Add missing structure comment
To: Luben Tuikov <luben.tuikov@amd.com>, dri-devel@lists.freedesktop.org,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20201210092435.253b12aa@canb.auug.org.au>
 <20201209223142.78296-1-luben.tuikov@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <6f7c8af3-83e8-548c-3ab2-099501c41f10@amd.com>
Date: Thu, 10 Dec 2020 13:24:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201209223142.78296-1-luben.tuikov@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR06CA0094.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::35) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR06CA0094.eurprd06.prod.outlook.com (2603:10a6:208:fa::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Thu, 10 Dec 2020 12:24:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1c7ee694-561b-40f0-8d4f-08d89d0696c4
X-MS-TrafficTypeDiagnostic: MN2PR12MB4784:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB47840990E8D0544EFAD5AD1183CB0@MN2PR12MB4784.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EbnA+sI2RS+OWhLzC2DUOIAup6p2It8sxO2Ip92+b+69fJqU2Qz5kB+Ev+3I3Sv47myAqLQIMiGbYWc/X4BmhUOXDmEAt6KaRXPsNgNUWqyvuiRHFQxdOLNNJNVHI4hiudk78g8Ljd9hdRoTrs5iUJouWsqiW3MDeqsNllBbYJ9IpfipEWO3DGtJxsJFNAs1/u5um6RBqE3pEBIwK8mtnE0t+n6Ccxolkas5qihHoihSN58f5im9XPAoZdG3QBhwRY9zQVDcJ7EKtF+qGk/R8r75eUtZLJpXJ2Q7BGI/8dwcyBE8UhkkdUZRlyWGm9Txzfp8AipCQMWeLNURTCTsYwoFTWFDhM+HoYFzw75VWAQ/wqTdsRuzo5XN8Kr9oe2cSrPcYqMRs2SUOLVpQ5jgvYhpvCR9s+P8lt2Zc4SRslPmfreF2ih+Xf0GX7ptrKX9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(83380400001)(66574015)(34490700003)(36756003)(6486002)(6666004)(2906002)(4326008)(508600001)(186003)(2616005)(31686004)(16526019)(86362001)(31696002)(8676002)(8936002)(54906003)(66946007)(66476007)(5660300002)(66556008)(52116002)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UElsWUFSNTEvZFlZWEk0MTZPb3REUzBDRjBwTXg1ZXFTc2xvMkhxM1cyRnZQ?=
 =?utf-8?B?eHNoVmN6WDJkOXFFOWc2ZkZEeVE1ZE84RVFjVEJhaU9HTFV1UDJxSHdZMGZ0?=
 =?utf-8?B?MjVjcWNMQzFzcHc3NGF2cDd4U2hrbDMxQnJPQjZjSHo3T1V0ZzVQMWhOS04x?=
 =?utf-8?B?RUVxZGtobGcyTU1TenN1UUxyMzlkVUx1MHVxZW8rMnk3c0xKSVphVS8xVzRM?=
 =?utf-8?B?RkVYa3BBWGsrSEp0RzhoZFlVaTdDZjVBM05WNUNrRWZzKzZyWWhlMThhWkhV?=
 =?utf-8?B?aHB6VHFvYzNrc2lWc2RQQ1ViTCtGWmxBdWw1dEpVaFk1T29nWUVYdlJ4Q2NH?=
 =?utf-8?B?N3plQ1ppSFUxS0RJeS9XZGViRmJwQ2s4bGJEdC91c2hLZzJIemlQYjN4b1NQ?=
 =?utf-8?B?bExoQnBGU1ZUS1ZGZEN4dkwzNjdJVDNhWVZES2c0VUpMcU1ScGtzWlRSa1hr?=
 =?utf-8?B?VXpZQ0pBbmdOMVBrYjhKbDB6UFVZN3djd2ZBWWVvby82Tm1RKzBDZmdtQTZh?=
 =?utf-8?B?TlZ1R2c0RnVRdDZOVisxRmt3c1hHLzZVdnNTTUxHMWlsQ0t3ekNlYmI5NmpV?=
 =?utf-8?B?OUpLY2JKVXJ5YWZ6QStzdUZUelJ1MjJ0d1cxUk1lYy96bytxcDRYSkduZHFK?=
 =?utf-8?B?Z052cm5udFV6cTkzcHV0VlRXODIvaGl3ay9YM2lINGJkMlBMSUFrVitvMzdl?=
 =?utf-8?B?ZmV2WmpZTHQrV21SR2VmUmRzYWRnbVRSeC9LbTVkbld6MDd5eklhTDZ5a0xl?=
 =?utf-8?B?dW84MjRacnNPUENxRHVFSTY5cmhvMHVpR0M1d2hSWGRxbU9naERZejl3eDVn?=
 =?utf-8?B?NHhZZGZ6UEZNejVXakwyTysrK25CdWZsbzR3b241Z2gwbjVoZTU1MmUwY2lo?=
 =?utf-8?B?UVkzdzZ2cmsyYm50ek9NSkdrOEVSd296d0F2elFMOTZSSlN2OE9zWkhtRFF5?=
 =?utf-8?B?WjhhNy9DR21MS1VtTVR6d1Z0Ynlzay9rTW9zOTNUaTJTUThPMWZITkx0L3Nq?=
 =?utf-8?B?Zk96akFhclRFUC9ua3g3QW95V2tQV0hUL3l0UGdESGJCczZPbGR6TzlRWVlm?=
 =?utf-8?B?WGd0d0pFMkJIZ0JTd3ZiaWpQWlVoY05ZcjQvVUxaZjVDbCt6ZVBmaWxJVkov?=
 =?utf-8?B?b0kzOElhbC9Jc3FNcmRJYkZ3V0tVb3o1dk1CaWhKYnBqcTFwaU5UU0dDVGx2?=
 =?utf-8?B?TFVlT3lmUDFTRjRpR3RQSDl5YWhiaWNTNElESFJTQ3VLQzJCelltdGNhUVhD?=
 =?utf-8?B?YXRKa2ZZdXNwRXBncHcrajhpOWlTMnZ3OS9Lc29ac3M1VkI4MmU4QXlucnc1?=
 =?utf-8?B?ZWtzOVZUVVVscFJBVWJkbmFINlVpVmtaTXU4UmRHTFBublFnNW1lVFc0Q3Zk?=
 =?utf-8?B?T0xNbndEN2FlTmRUcGEvaXlTbFd5UG1PWm1NNzhqWHF1NVU5YmxmOXY3RkQv?=
 =?utf-8?Q?+G3ikpSH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 12:24:49.6873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c7ee694-561b-40f0-8d4f-08d89d0696c4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ZWECbuvOqy3VCtLJLAJt6hQes/qFN48BtMevHWDopmZL2A45ZGD+zlbuGezU3zV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4784
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDkuMTIuMjAgdW0gMjM6MzEgc2NocmllYiBMdWJlbiBUdWlrb3Y6Cj4gQWRkIGEgbWlzc2lu
ZyBzdHJ1Y3R1cmUgY29tbWVudCBmb3IgdGhlIHJlY2VudGx5Cj4gYWRkZWQgQGxpc3QgbWVtYmVy
Lgo+Cj4gQ2M6IFN0ZXBoZW4gUm90aHdlbGwgPHNmckBjYW5iLmF1dWcub3JnLmF1Pgo+IENjOiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+IENjOiBDaHJpc3RpYW4gS8O2
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gRml4ZXM6ICA4OTM1ZmYwMGUzYjEgKCJk
cm0vc2NoZWR1bGVyOiAibm9kZSIgLS0+ICJsaXN0IiIpCj4gUmVwb3J0ZWQtYnk6IFN0ZXBoZW4g
Um90aHdlbGwgPHNmckBjYW5iLmF1dWcub3JnLmF1Pgo+IFNpZ25lZC1vZmYtYnk6IEx1YmVuIFR1
aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+CgpSZXZpZXdlZCBhbmQgcHVzaGVkIHRvIGRybS1t
aXNjLW5leHQuCgpUaGFua3MsCkNocmlzdGlhbi4KCj4gLS0tCj4gICBpbmNsdWRlL2RybS9ncHVf
c2NoZWR1bGVyLmggfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9ncHVfc2NoZWR1bGVyLmgg
Yi9pbmNsdWRlL2RybS9ncHVfc2NoZWR1bGVyLmgKPiBpbmRleCAyZTBjMzY4ZTE5ZjYuLjk3NWU4
YTY3OTQ3ZiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS9ncHVfc2NoZWR1bGVyLmgKPiArKysg
Yi9pbmNsdWRlL2RybS9ncHVfc2NoZWR1bGVyLmgKPiBAQCAtMTcxLDEwICsxNzEsMTAgQEAgc3Ry
dWN0IGRybV9zY2hlZF9mZW5jZSAqdG9fZHJtX3NjaGVkX2ZlbmNlKHN0cnVjdCBkbWFfZmVuY2Ug
KmYpOwo+ICAgICogc3RydWN0IGRybV9zY2hlZF9qb2IgLSBBIGpvYiB0byBiZSBydW4gYnkgYW4g
ZW50aXR5Lgo+ICAgICoKPiAgICAqIEBxdWV1ZV9ub2RlOiB1c2VkIHRvIGFwcGVuZCB0aGlzIHN0
cnVjdCB0byB0aGUgcXVldWUgb2Ygam9icyBpbiBhbiBlbnRpdHkuCj4gKyAqIEBsaXN0OiBhIGpv
YiBwYXJ0aWNpcGF0ZXMgaW4gYSAicGVuZGluZyIgYW5kICJkb25lIiBsaXN0cy4KPiAgICAqIEBz
Y2hlZDogdGhlIHNjaGVkdWxlciBpbnN0YW5jZSBvbiB3aGljaCB0aGlzIGpvYiBpcyBzY2hlZHVs
ZWQuCj4gICAgKiBAc19mZW5jZTogY29udGFpbnMgdGhlIGZlbmNlcyBmb3IgdGhlIHNjaGVkdWxp
bmcgb2Ygam9iLgo+ICAgICogQGZpbmlzaF9jYjogdGhlIGNhbGxiYWNrIGZvciB0aGUgZmluaXNo
ZWQgZmVuY2UuCj4gLSAqIEBub2RlOiB1c2VkIHRvIGFwcGVuZCB0aGlzIHN0cnVjdCB0byB0aGUg
QGRybV9ncHVfc2NoZWR1bGVyLnBlbmRpbmdfbGlzdC4KPiAgICAqIEBpZDogYSB1bmlxdWUgaWQg
YXNzaWduZWQgdG8gZWFjaCBqb2Igc2NoZWR1bGVkIG9uIHRoZSBzY2hlZHVsZXIuCj4gICAgKiBA
a2FybWE6IGluY3JlbWVudCBvbiBldmVyeSBoYW5nIGNhdXNlZCBieSB0aGlzIGpvYi4gSWYgdGhp
cyBleGNlZWRzIHRoZSBoYW5nCj4gICAgKiAgICAgICAgIGxpbWl0IG9mIHRoZSBzY2hlZHVsZXIg
dGhlbiB0aGUgam9iIGlzIG1hcmtlZCBndWlsdHkgYW5kIHdpbGwgbm90CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
