Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE84334B37
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 23:13:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C586D6EA73;
	Wed, 10 Mar 2021 22:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2041.outbound.protection.outlook.com [40.107.92.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE1D66EA71;
 Wed, 10 Mar 2021 22:13:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mg0z0+KwQW0tRZOdOPFJ4fzfyVLxyaHX0meH3DJ6DKirpqHA3Td3yKljwiI51HerZwn56fQ28ub/0zXPnLtVnqjCi/4LAAeQ3//Ptl2F8oNNSJBCk+1kNGs69UBcaxNRYJNIQNAeXBrSkkHx/teO76wv+6600qAbF5MTHTIIE8uTgXNZ9MLZlbCAqotdcoZE6xKHB6Sw5FV/yi1IJ1N3+avWc3u8aEnz47nLi5uo54nRM/dR54ibAOByzedJnNYonwlF4oJBUIhKNIcg5UGce2JqxQGz5v+Y38lA1y3ByZBh7xp92QjZfdvO7VPTswyXL4p2jPWm2QIFM8J2U9/Btg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GwicNcXD2jg9hvu88GTUQA4CdZmdYWgyd7Jc6RuucMo=;
 b=BIq0RyqskJIX2xaBFbhpmiG8zvRl7u1QacyMpkHRjjJy9JKQ9yZniDjK4wTyHCrNDBssIEbrkTQ60W/iEyMnl+OVbWHdOHXAvhO+jkm8nOo8vPj+VbgBlTPzSd9HykNBM/FbFb18h/WL5aI9VPZXmASpOaKBNi0hSMDi2YUFH2q9GOafr/cs4omqUjkNAWFBzooGrQRILHvoBk0V8M1SSnhr+O0HS9Ik/z9WF7PE9FIDeIpGSPPCERJLosRULDwTUAQQMevWRMwXHHalPILl2hRrGQKhdds0ltDSK84TB+PxalR8iDmz2oyPB3X5svjuTsR8Ivyiv3IX6dRL/f/FWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GwicNcXD2jg9hvu88GTUQA4CdZmdYWgyd7Jc6RuucMo=;
 b=kjeo5hQLtigBBvJuJEAFd/eE4OFNEydrXuhxx4M6HDBNNf44muulcnWM+XTKdW1rc6YEF2wQW6XHd78K8knrrKWFZ/p9uYM6/TTXVN7JpCd+u3QZhJ9wes5sVHt28A16rWMqNQIE97nLwAjywPwpEFWIq7d5gDpXQgNQkp05jUU=
Authentication-Results: arndb.de; dkim=none (message not signed)
 header.d=none;arndb.de; dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4898.namprd12.prod.outlook.com (2603:10b6:208:1c7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26; Wed, 10 Mar
 2021 22:13:03 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab%9]) with mapi id 15.20.3784.031; Wed, 10 Mar 2021
 22:13:03 +0000
Subject: Re: [PATCH v2 1/1] drm/amdkfd: fix build error with AMD_IOMMU_V2=m
To: arnd@kernel.org, alexander.deucher@amd.com, christian.koenig@amd.com
References: <4c692eff-9d57-278e-8da4-36bc2c293506@amd.com>
 <20210309165018.26213-1-Felix.Kuehling@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
Message-ID: <67f7c50a-cc5d-073c-b91b-8c9641e2aa8f@amd.com>
Date: Wed, 10 Mar 2021 17:13:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210309165018.26213-1-Felix.Kuehling@amd.com>
Content-Language: en-US
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0017.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::30) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.226.80] (165.204.55.251) by
 YTOPR0101CA0017.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26 via Frontend
 Transport; Wed, 10 Mar 2021 22:13:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5dec9903-fada-4d73-f057-08d8e411ac2d
X-MS-TrafficTypeDiagnostic: BL0PR12MB4898:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4898E097A00964E02D54F24992919@BL0PR12MB4898.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0PAM/7SSIpcbBLlcAA46ba4UGN4EOFjoECCnEPZGgw5zna09OXv2GlbGlmp510a77vMqtNPpnRm9SDO1hibDktKus0gavWyuUfsS+nP9rSqiUcet3es9katy3uSVA3LpO/7EaALxJ8HVFvVolWeVJZ/tERkrMxyM80M0N5YVPB0n7P8NnLcya7V/zzkw3TUNOUMlXsp4+cHeGt9Z4/x9qkCcXZL8KjF4iLQ3jMhn6jaiMbFf8zPVa6bJVLrNx2E1xOASHoKqXUamaT4dFomwtHzlnaCbV1f8uXIKkiKjLw0A5rYWSBuuz3WBZtR4sd9ansEKtbXsGQDIbII8Zt5HPcPyq/BfoRKQtTpTiZVr5H7w7RRbfZypn2wtnQWxc72qJJKqDU5JPQ1x1a/YR9di+9xsVghG7f4f0YTGnSwR/Q0uWueLZzZ3XABTKFcUJNeS0h8HphAnBAWCfA1GyNgWsl2WnKzONj59OVygRbLUM9ERAg5RqnCAtOPvvqmHFuCE0vKkhOEIT0vASGIXpdE6HdWUnzW3cUiT+ZUhCROkGhwmKMj3laVDAAqll7wP+ZOnqRRlRc5V/P5tJFoG4hcqK1D3ITFT1qdchguIAm79kfg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(136003)(346002)(396003)(376002)(26005)(186003)(16526019)(956004)(86362001)(6486002)(44832011)(83380400001)(2906002)(66556008)(6636002)(66476007)(31696002)(31686004)(53546011)(36756003)(66946007)(5660300002)(36916002)(2616005)(4326008)(8936002)(478600001)(8676002)(316002)(52116002)(16576012)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MkVzUGVmZ3dubm1NYS9mY0pBVHczYXhTV0tBSjVVa2RrM1pCelFjMWFwQUxt?=
 =?utf-8?B?aytqbzJETHNuUE5ITlhyZ2tmdjhOR2RPTG4zUXpGcFBnbG9OSWJEcHhSeWpk?=
 =?utf-8?B?SmZoWFNaLzVsWjk1SkpDSWtlQmZDc2I4ZWVNWklsWDBxdjdsMEVjd0puelNE?=
 =?utf-8?B?Zkw5MVd3ZEllbW5TclYrYW5OVzJpZSs0WUpFU091S3lHVEU3WjU4QmNpR1dS?=
 =?utf-8?B?Wll5aWZrL0xIQmlOQlh6cVFQOHIyb041OE5PR0FJQ2NzWDBKVnA0eEViWjBD?=
 =?utf-8?B?MDlob2tOeDlsTktxZzBUV3RwbjFxTVAzZ3hid0dHNWlXZFFJMU5QdGp2cnFK?=
 =?utf-8?B?WVc1RUJqVXN5V1BWeE5raHB1NWVWdkdPM0h2OG5UZm5zczFYYnIyZkx5UXFU?=
 =?utf-8?B?Q3FhSGc3QXR5dVRnYnBHanVuSi94eDFOZ2pGRWZTK0FWMFhCaE82QUI0MXVm?=
 =?utf-8?B?S1poenJDY3doQnlsZTQwZit5bGZTcmtmbE4wUU93ZzJHakFKNmpmMW9tMkpi?=
 =?utf-8?B?Zm9sWFB4RHFuL0RvVTZ1NXZOVGVlcnZxbXhHemwvMkFIblRhR1kxM1pCd09H?=
 =?utf-8?B?aVJiNFM4a3I3S1lFRE1aQ2VjeWVaQWxtSzBIRWRES1dpNE1PMzFyL0tzUEVL?=
 =?utf-8?B?RWlWTnN1N0dhK3J0NTdzUnNMSExqc0o2eXBvNXUrZlhmT21FL0M3NkU1ems4?=
 =?utf-8?B?NTZlNVh3bE1SZW0yaDZXTGNqZlQvRldEek1LR2h1YXZmald0bW9xZmU3MTVv?=
 =?utf-8?B?enBGODdHVTNYMTdES1k5TW5HZ2xwNmM4NkRDQUIwS3Nid2Z4LzB1OXJUZnJV?=
 =?utf-8?B?M2V4MklLZUF5eUJlb1d2RDI0cjVua2JlOGFyUlIrWUYxWVRBRWdESzJLbHdE?=
 =?utf-8?B?ZmxETkd5cXI2ZHJ5ZS92aXpSaU9CUXB0bDJWSzZvWlNpbjNMbHZ6SHJYTVpV?=
 =?utf-8?B?T3JPdDVwY1dKdCthQVdSNHNEckYzVldnbmoxOHB5UzNpbVVQTU4vTzlqUGJx?=
 =?utf-8?B?eEM2VnJtUmx0Z1I2TW1BemZXS2FKNW9jaEtLcDhUcktPMlpLN1BoMlFVaFJR?=
 =?utf-8?B?SGZEWng2cWtMeXFnZzZPNFdUOUpQOVlWYklpR2d3aklZYTMraE1NSDk5MmFE?=
 =?utf-8?B?c0NxQ1B0K3Jkb2dWZWFuMXBEcmZtOW9McmdyOEk2UzFkTjZ4bVBpU290UzdD?=
 =?utf-8?B?OE43ekZCamQ3eHVIdS94eTVuVnJFOXBzZmhtMDBHemNvVzBCejZnVWhTQ0Ix?=
 =?utf-8?B?V28zOExBYjVVemcvUzhPUGtlclgwL2dSL0RCMU5FcTBFK3dTT0VvWlB4TFBv?=
 =?utf-8?B?anFETGJJYkJjbUwwUWFPaFNEMko3RWx4R0RmdkZFZ1BvTjQrcTFLVjJnL0pV?=
 =?utf-8?B?SGhHL2NuV3o5cmFCK2FFVmY3S3pSR3Nnbzc2RngyaWljVUV4QTBHNmV6Z3Z6?=
 =?utf-8?B?dHJoSFhnNEFzOG9OMVArb2xlMXMzbXlEaVpGMnVHanNWcHpRcEpsQjA0ZlNv?=
 =?utf-8?B?YmMzSEkweGZIYUNLWHRKVEVnODRFOS85eElGZEhncnUrbFVWdHdTU2F3VU9E?=
 =?utf-8?B?Q2I2SmZJaEVJdUlnYk4vL1NkdmlQWUtGTjdxV1Z2VXpSR2RlMEIxL2RBbWl4?=
 =?utf-8?B?MXFJZW10cG5EV1Aralo1MWpyckhvZE1lU0h3TXlKSkFLbVUydnBwNnR3VFJu?=
 =?utf-8?B?MWZZRE9KMjJFRmc2eXVybUlZMW52RUwvajN0UlRsUUlTY3g1NStZN1JidVIy?=
 =?utf-8?Q?G/YPP3Zsv3pFoLxpy4/YCl5B9ZK3bHy2a7p79Ut?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dec9903-fada-4d73-f057-08d8e411ac2d
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 22:13:02.9523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OwKm36tU1Y6/B+9//dVUFTpFK0wtp5nIb0coORX1p+W8s2olfVwgKrChZLTnIBU2JtIM/NqtCAbnBB7nLZkg/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4898
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
Cc: airlied@linux.ie, arnd@arndb.de, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMS0wMy0wOSAxMTo1MCBhLm0uLCBGZWxpeCBLdWVobGluZyB3cm90ZToKPiBVc2luZyAn
aW1wbHkgQU1EX0lPTU1VX1YyJyBkb2VzIG5vdCBndWFyYW50ZWUgdGhhdCB0aGUgZHJpdmVyIGNh
biBsaW5rCj4gYWdhaW5zdCB0aGUgZXhwb3J0ZWQgZnVuY3Rpb25zLiBJZiB0aGUgR1BVIGRyaXZl
ciBpcyBidWlsdC1pbiBidXQgdGhlCj4gSU9NTVUgZHJpdmVyIGlzIGEgbG9hZGFibGUgbW9kdWxl
LCB0aGUga2ZkX2lvbW11LmMgZmlsZSBpcyBpbmRlZWQKPiBidWlsdCBidXQgZG9lcyBub3Qgd29y
azoKPgo+IHg4Nl82NC1saW51eC1sZDogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2lv
bW11Lm86IGluIGZ1bmN0aW9uIGBrZmRfaW9tbXVfYmluZF9wcm9jZXNzX3RvX2RldmljZSc6Cj4g
a2ZkX2lvbW11LmM6KC50ZXh0KzB4NTE2KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgYW1kX2lv
bW11X2JpbmRfcGFzaWQnCj4geDg2XzY0LWxpbnV4LWxkOiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9rZmRfaW9tbXUubzogaW4gZnVuY3Rpb24gYGtmZF9pb21tdV91bmJpbmRfcHJvY2Vzcyc6
Cj4ga2ZkX2lvbW11LmM6KC50ZXh0KzB4NjkxKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgYW1k
X2lvbW11X3VuYmluZF9wYXNpZCcKPiB4ODZfNjQtbGludXgtbGQ6IGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1ka2ZkL2tmZF9pb21tdS5vOiBpbiBmdW5jdGlvbiBga2ZkX2lvbW11X3N1c3BlbmQnOgo+
IGtmZF9pb21tdS5jOigudGV4dCsweDk2Nik6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGFtZF9p
b21tdV9zZXRfaW52YWxpZGF0ZV9jdHhfY2InCj4geDg2XzY0LWxpbnV4LWxkOiBrZmRfaW9tbXUu
YzooLnRleHQrMHg5N2YpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBhbWRfaW9tbXVfc2V0X2lu
dmFsaWRfcHByX2NiJwo+IHg4Nl82NC1saW51eC1sZDoga2ZkX2lvbW11LmM6KC50ZXh0KzB4OWE0
KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgYW1kX2lvbW11X2ZyZWVfZGV2aWNlJwo+IHg4Nl82
NC1saW51eC1sZDogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2lvbW11Lm86IGluIGZ1
bmN0aW9uIGBrZmRfaW9tbXVfcmVzdW1lJzoKPiBrZmRfaW9tbXUuYzooLnRleHQrMHhhOWEpOiB1
bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBhbWRfaW9tbXVfaW5pdF9kZXZpY2UnCj4geDg2XzY0LWxp
bnV4LWxkOiBrZmRfaW9tbXUuYzooLnRleHQrMHhhZGMpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRv
IGBhbWRfaW9tbXVfc2V0X2ludmFsaWRhdGVfY3R4X2NiJwo+IHg4Nl82NC1saW51eC1sZDoga2Zk
X2lvbW11LmM6KC50ZXh0KzB4YWZmKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgYW1kX2lvbW11
X3NldF9pbnZhbGlkX3Bwcl9jYicKPiB4ODZfNjQtbGludXgtbGQ6IGtmZF9pb21tdS5jOigudGV4
dCsweGM3Mik6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGFtZF9pb21tdV9iaW5kX3Bhc2lkJwo+
IHg4Nl82NC1saW51eC1sZDoga2ZkX2lvbW11LmM6KC50ZXh0KzB4ZTA4KTogdW5kZWZpbmVkIHJl
ZmVyZW5jZSB0byBgYW1kX2lvbW11X3NldF9pbnZhbGlkYXRlX2N0eF9jYicKPiB4ODZfNjQtbGlu
dXgtbGQ6IGtmZF9pb21tdS5jOigudGV4dCsweGUyNik6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8g
YGFtZF9pb21tdV9zZXRfaW52YWxpZF9wcHJfY2InCj4geDg2XzY0LWxpbnV4LWxkOiBrZmRfaW9t
bXUuYzooLnRleHQrMHhlNDIpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBhbWRfaW9tbXVfZnJl
ZV9kZXZpY2UnCj4KPiBVc2UgSVNfUkVBQ0hBQkxFIHRvIG9ubHkgYnVpbGQgSU9NTVUtVjIgc3Vw
cG9ydCBpZiB0aGUgYW1kX2lvbW11IHN5bWJvbHMKPiBhcmUgcmVhY2hhYmxlIGJ5IHRoZSBhbWRr
ZmQgZHJpdmVyLiBPdXRwdXQgYSB3YXJuaW5nIGlmIHRoZXkgYXJlIG5vdCwKPiBiZWNhdXNlIHRo
YXQgbWF5IG5vdCBiZSB3aGF0IHRoZSB1c2VyIHdhcyBleHBlY3RpbmcuCj4KPiBGaXhlczogNjRk
MWMzYTQzYTZmICgiZHJtL2FtZGtmZDogQ2VudHJhbGl6ZSBJT01NVXYyIGNvZGUgYW5kIG1ha2Ug
aXQgY29uZGl0aW9uYWwiKQo+IFJlcG9ydGVkLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRi
LmRlPgo+IFNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQu
Y29tPgpQaW5nLiBDYW4gSSBnZXQgYW4gUi1iIGZvciB0aGlzIHBhdGNoLgoKVGhhbmtzLAogwqAg
RmVsaXgKCgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2lvbW11LmMg
fCA2ICsrKysrKwo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2lvbW11LmggfCA5
ICsrKysrKystLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9p
b21tdS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2lvbW11LmMKPiBpbmRleCA2
NmJiY2E2MWUzZWYuLjkzMTg5MzZhYTgwNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGtmZC9rZmRfaW9tbXUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2Zk
L2tmZF9pb21tdS5jCj4gQEAgLTIwLDYgKzIwLDEwIEBACj4gICAgKiBPVEhFUiBERUFMSU5HUyBJ
TiBUSEUgU09GVFdBUkUuCj4gICAgKi8KPiAgIAo+ICsjaW5jbHVkZSA8bGludXgva2NvbmZpZy5o
Pgo+ICsKPiArI2lmIElTX1JFQUNIQUJMRShDT05GSUdfQU1EX0lPTU1VX1YyKQo+ICsKPiAgICNp
bmNsdWRlIDxsaW51eC9wcmludGsuaD4KPiAgICNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4KPiAg
ICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4gQEAgLTM1NSwzICszNTksNSBAQCBpbnQga2ZkX2lv
bW11X2FkZF9wZXJmX2NvdW50ZXJzKHN0cnVjdCBrZmRfdG9wb2xvZ3lfZGV2aWNlICprZGV2KQo+
ICAgCj4gICAJcmV0dXJuIDA7Cj4gICB9Cj4gKwo+ICsjZW5kaWYKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2lvbW11LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGtmZC9rZmRfaW9tbXUuaAo+IGluZGV4IGRkMjNkOWZkZjZhOC4uYWZkNDIwYjAxYTBjIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9pb21tdS5oCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2lvbW11LmgKPiBAQCAtMjMsNyArMjMs
OSBAQAo+ICAgI2lmbmRlZiBfX0tGRF9JT01NVV9IX18KPiAgICNkZWZpbmUgX19LRkRfSU9NTVVf
SF9fCj4gICAKPiAtI2lmIGRlZmluZWQoQ09ORklHX0FNRF9JT01NVV9WMl9NT0RVTEUpIHx8IGRl
ZmluZWQoQ09ORklHX0FNRF9JT01NVV9WMikKPiArI2luY2x1ZGUgPGxpbnV4L2tjb25maWcuaD4K
PiArCj4gKyNpZiBJU19SRUFDSEFCTEUoQ09ORklHX0FNRF9JT01NVV9WMikKPiAgIAo+ICAgI2Rl
ZmluZSBLRkRfU1VQUE9SVF9JT01NVV9WMgo+ICAgCj4gQEAgLTQ2LDYgKzQ4LDkgQEAgc3RhdGlj
IGlubGluZSBpbnQga2ZkX2lvbW11X2NoZWNrX2RldmljZShzdHJ1Y3Qga2ZkX2RldiAqa2ZkKQo+
ICAgfQo+ICAgc3RhdGljIGlubGluZSBpbnQga2ZkX2lvbW11X2RldmljZV9pbml0KHN0cnVjdCBr
ZmRfZGV2ICprZmQpCj4gICB7Cj4gKyNpZiBJU19NT0RVTEUoQ09ORklHX0FNRF9JT01NVV9WMikK
PiArCVdBUk5fT05DRSgxLCAiaW9tbXVfdjIgbW9kdWxlIGlzIG5vdCB1c2FibGUgYnkgYnVpbHQt
aW4gS0ZEIik7Cj4gKyNlbmRpZgo+ICAgCXJldHVybiAwOwo+ICAgfQo+ICAgCj4gQEAgLTczLDYg
Kzc4LDYgQEAgc3RhdGljIGlubGluZSBpbnQga2ZkX2lvbW11X2FkZF9wZXJmX2NvdW50ZXJzKHN0
cnVjdCBrZmRfdG9wb2xvZ3lfZGV2aWNlICprZGV2KQo+ICAgCXJldHVybiAwOwo+ICAgfQo+ICAg
Cj4gLSNlbmRpZiAvKiBkZWZpbmVkKENPTkZJR19BTURfSU9NTVVfVjIpICovCj4gKyNlbmRpZiAv
KiBJU19SRUFDSEFCTEUoQ09ORklHX0FNRF9JT01NVV9WMikgKi8KPiAgIAo+ICAgI2VuZGlmIC8q
IF9fS0ZEX0lPTU1VX0hfXyAqLwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
