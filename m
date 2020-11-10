Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AA32AD5B3
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 12:56:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 349498986D;
	Tue, 10 Nov 2020 11:56:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700085.outbound.protection.outlook.com [40.107.70.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9618926B;
 Tue, 10 Nov 2020 11:56:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TXTlYNWUL7wcF+B0dmcamCkqgfkip88C5VbaaBVfwi2yZX/aH3S6Z3dvFviB2SMs360w91y2Ncb2jHvhY6qX2jfbbBzKXPp7HqOjmit67IjkCjBKGQie6BPQTlMJI0rQRRBUgFOrUEUVBzZHTb7XbBBuwUAQiIjSKdQowojTjus0Y502HkdivSToQ7TK85coomk6lVkSZzPDR6sPmJtRtk6rPEI8eHResOirZ+ZYIVt15EVurDgw451ULJuwrvZAsUpsEMrADVwXqZQn+GX51I8eTchzcJXydHq7HBvTroJ3LXlf6o1a80R42bDz4iDDF11o9bcBc7nE2ga6kZDVIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hxska5mNtmwvkNrg75TU+hyS0XheFHfrUsEt1y71Zr8=;
 b=InXQSYaKUPP/zdiD4QcLz3XRZlpYmNFhenpBkB+33VEYFYqUFs0ny9na5Ujqq8qlmYtuZUnYv9u2oOUwMw0XcYRrpbSajYPxDrwnaXE6/yJX2RZuRDmi5BRYogHzInInrUk/RmeTFJ74n89+xCc6wV+h9lRiAi8qbBjbTEem5wC+8DZ4IWw6aTT65oSRZhW2saMRPcQtP3wEUmbGWx2GGFAwaeDDxOtrasENojS5qGbLRdGbZKKlLO1yJGdV1eMI5TPu3moNy2xu0UJ8jqZtaTvmrSf29McAPjI719Tl6lLPqc2iKQraH/UHcNaoSXilh5UYPvlqSRKLHhae5FWTHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hxska5mNtmwvkNrg75TU+hyS0XheFHfrUsEt1y71Zr8=;
 b=JbXabuditEPg/+g93FwdQPTIRmcaosfPboeCaaeipNlRrfm85xaoUiZ1Pg23VNNEIHsaPiMlZ/+Z/DNS6hrYYJGCYfdH4ANcp039ewiFpE6tQ92G8Ndh8zdjDIdZ4vlcqkAdVDH5i8G+yPCK9x7P1E4wXpFZsqLXAurTUdnpHcI=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4047.namprd12.prod.outlook.com (2603:10b6:208:1de::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Tue, 10 Nov
 2020 11:56:16 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3541.025; Tue, 10 Nov 2020
 11:56:15 +0000
Subject: Re: [PATCH] drivers: amdgpu: amdgpu_display: Fixed the spelling of
 falg to flag
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, alexander.deucher@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, jdelvare@suse.de,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20201109210725.24668-1-unixbhaskar@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <6eaddf7a-7fc8-ea2a-41f8-d5e66b9ea28a@amd.com>
Date: Tue, 10 Nov 2020 12:56:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201109210725.24668-1-unixbhaskar@gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR08CA0023.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::36) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR08CA0023.eurprd08.prod.outlook.com (2603:10a6:208:d2::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21 via Frontend Transport; Tue, 10 Nov 2020 11:56:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 970da3aa-0586-4cf1-427c-08d8856fa063
X-MS-TrafficTypeDiagnostic: MN2PR12MB4047:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB40471C6AB89470CEB52E9FAA83E90@MN2PR12MB4047.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5lYBUZaldqb6g18ccRqXdPI/HDOf4Tg8XKtoW/JZgIMIvRl46P1mQyuELuN6S16gOxOSMY1l8GYTSDmE315hnzwAJYZiqvSr5WbC9CVqMPU6FYz7FZdOrqtHp22SuLVYFduHIef+VkJz+MGo4JAVSjfGNKDKVGhLRkpD8SIsKQUi386XPa5H2JuST9BfVtuUK0Rd9J8ksJKXn9eeHm0XaafmQ266ESEsADc6QjHDwgQutP0tNXCVC7ivNJ474OLR6lZNCedZyiJCHvHmouDX7z7zZhmz9PYTth4jwZSX7Q5WG3U5oic2CauUm3fd0/MDbNnqfDy3mdnZkgdlaYrE+2+RJhetHm6j/j+8C/wVGw8fKgbSxJIuR5ITrWNwGRcFU+OeSNU3A/EQ2av4B/hVlQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(136003)(366004)(39860400002)(316002)(66476007)(5660300002)(16526019)(31686004)(66946007)(8936002)(52116002)(66574015)(478600001)(31696002)(2906002)(86362001)(66556008)(36756003)(6486002)(83380400001)(8676002)(2616005)(186003)(6666004)(921003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cU1rdmRiODZtYlNtcjJhbUp2ck9pWG1jVXZ5R1FENmw2L093Sk1sM2czUTgz?=
 =?utf-8?B?bGc2bWRvelNhNHNWV1ZSL3o3RzBPalFjcEhBQndLbGVZc1pqTXVnU3g5WmZD?=
 =?utf-8?B?VUlKb1NOSEU4RDRQa3F1blRmNE02dmxrNDk0RHBBZ0UzWDhBSnVHcXJRSCs2?=
 =?utf-8?B?NDlYU0RieGh1WHF2eEl5aXdIK3dXM3lmMC9kWU9VMnNjamxRMStnYUUzUkg1?=
 =?utf-8?B?YXl1dGsyc2M3QkJwOWJjeWZ4YzdSMzd2WVdhQzkxUWlhd2JYM3ErL0d3TW9a?=
 =?utf-8?B?OFNDd3NHbi9Ic1dWeGNldGFKaWs4K1VHei9lK1Zod1htczhLbmoyZG4vMGdq?=
 =?utf-8?B?d28xanVGMitPTVNzemdXWGovekk4dG00WElzcmp3dERmUjkvemxSQXhIV2l4?=
 =?utf-8?B?YUtNd25KbDFPaFlhMHkwMndoNHliWmxkKzNwYXlURTJnckc1dHhlMENZNnEx?=
 =?utf-8?B?ZlpkUnhqNzZ4SkRMY1V4SHY2eGNib1F3MUN3SkVWY0Uxa3JMUEN0Z2g4WUh4?=
 =?utf-8?B?MDFTb3Y1anRod29rV1dZVmtPbzVYZ0puUFp5V21BcGdndGIwNG9EMUFsM1dH?=
 =?utf-8?B?SURBaTQ2VWhkSGo2eU8yb2llT3pKVXhUM0VUVWhCcExCN2x6V1VIU1B3ZEQ4?=
 =?utf-8?B?MGZrTkVUS0tpalV5SFJETEZOc282cDB4Mmw1WlRjNGtDZXAxSVZwRFRkL1dl?=
 =?utf-8?B?dVJ5TERoYmFFZ0FORjJnOHhiYzdXNWdJL2NMWmtpMkFTbHZxNVhGaHpidlc0?=
 =?utf-8?B?OXgvRXFUWVBzR0lsUlFCRDUzamlKUGcvR0FYOE9Jb3k1RmZZamRsS1ZUQW9P?=
 =?utf-8?B?eTVpNEZaS2pzdkl3ZkppeHNsUG5wYTRBVHpaUVo5eFB0d1o2YU41Uko4OGFH?=
 =?utf-8?B?eXlKcHpqOTlaRjd2OXU2bUE3Zko4NHNJRFdoNWxVRDhhR1dKcTMrRE40QU0v?=
 =?utf-8?B?TjRSTk1tcXJoY2hpc3RrT0tQdFFyYmpVTFpZcFlMQWh3OWdRQ0pWd3BTYlRK?=
 =?utf-8?B?MUpkSVBJc09vNzRZbWVySmFZZkpkRDNOL0lLbHVCL1hnUVJXdFRYSHZLelNo?=
 =?utf-8?B?bFYrK2tEamx4djByS2wwT2JCS1RueDdvb0E5akw3cjhJMDZZL2hBMVBQa0t6?=
 =?utf-8?B?eGs4bVBCUXFNWXdIZ0R0RjhCWDM2RVVUOFpTMG5jSHZVZ0ptMXpaTFV3L3Qw?=
 =?utf-8?B?dDhCL3RWbmZORWQzT29iNkZzdmliWTNOMXNScE5rRkxvNmZRb1pVRXJMV3Mw?=
 =?utf-8?B?dWRCSXZ2TVEreGNzQzlCMlg4eGNWMlN4TGV1RlhESWZYQi9tQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 970da3aa-0586-4cf1-427c-08d8856fa063
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 11:56:15.4857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sX4sOU7CSNkGwjy4cyO/K0nqsZEJD99d6u5MLeR86pTrZ63nRJw6e3E6DPdYhqd3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4047
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDkuMTEuMjAgdW0gMjI6MDcgc2NocmllYiBCaGFza2FyIENob3dkaHVyeToKPiBzL2ZhbGcv
ZmxhZy9wCj4KPiBTaWduZWQtb2ZmLWJ5OiBCaGFza2FyIENob3dkaHVyeSA8dW5peGJoYXNrYXJA
Z21haWwuY29tPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZGlzcGxheS5jIHwgMiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2Rpc3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNwbGF5
LmMKPiBpbmRleCAyZThhOGI1NzYzOWYuLjkyMjM1MDJjMWU1YiAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzcGxheS5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc3BsYXkuYwo+IEBAIC01MDksNyArNTA5LDcgQEAg
dWludDMyX3QgYW1kZ3B1X2Rpc3BsYXlfc3VwcG9ydGVkX2RvbWFpbnMoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsCj4gICAJICogdG8gYXZvaWQgaGFuZyBjYXVzZWQgYnkgcGxhY2VtZW50IG9m
IHNjYW5vdXQgQk8gaW4gR1RUIG9uIGNlcnRhaW4KPiAgIAkgKiBBUFVzLiBTbyBmb3JjZSB0aGUg
Qk8gcGxhY2VtZW50IHRvIFZSQU0gaW4gY2FzZSB0aGlzIGFyY2hpdGVjdHVyZQo+ICAgCSAqIHdp
bGwgbm90IGFsbG93IFVTV0MgbWFwcGluZ3MuCj4gLQkgKiBBbHNvLCBkb24ndCBhbGxvdyBHVFQg
ZG9tYWluIGlmIHRoZSBCTyBkb2Vucyd0IGhhdmUgVVNXQyBmYWxnIHNldC4KPiArCSAqIEFsc28s
IGRvbid0IGFsbG93IEdUVCBkb21haW4gaWYgdGhlIEJPIGRvZW5zJ3QgaGF2ZSBVU1dDIGZsYWcg
c2V0Lgo+ICAgCSAqLwo+ICAgCWlmICgoYm9fZmxhZ3MgJiBBTURHUFVfR0VNX0NSRUFURV9DUFVf
R1RUX1VTV0MpICYmCj4gICAJICAgIGFtZGdwdV9ib19zdXBwb3J0X3Vzd2MoYm9fZmxhZ3MpICYm
Cj4gLS0KPiAyLjI2LjIKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
