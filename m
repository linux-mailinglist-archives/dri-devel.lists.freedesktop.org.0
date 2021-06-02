Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3221139842B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 10:32:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2893C6EB80;
	Wed,  2 Jun 2021 08:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A283B6EB86;
 Wed,  2 Jun 2021 08:32:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zi1XASfX06VCecjUN91XjVHwYQ8xRJpqmn3r5Q1n/gG0seJ1hG1Zss3+M/1eWPfc5LwAwHPj1ByIeTyWtai8yY5e8Sh+HBNdKcjjVi2HBSdomHWl3rqW4flOaWWOE9gB3Lb3/cTnYUYkofXlhaBsyrIgKowbnKk+z1wuFhTaD0MxMPT5+y/YvDIAoI2vuTDOp/JlNY5uO8NASxT8tBqFo482Tp+/QtUOc12ftC9f0Imjd5slGoCANAAwQhQzyOvmQ13lAmnNqKCgA9+jI5cckcQzn4h0Xs5qaL6ECSwARRDxPfDt6jyV2FqGdv4PEwVn3YrVsDc0gtVkXlNCpTGbYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vB5B5+/yqOLYB02HK2C54wmZgImJKSbJ3OZNZTurjuA=;
 b=TCVDOkqQC1Sf/jerR8kljHt/96DhudL5W1CXq+WvIdc5AAg5kIRrvR7b+qbC0y9Z1d2vLTjbw6Ovjcu89f4a2gIRiXa9p+pM2KmV5wNyGPR2wc8QqQjg+iq8Sx/abbxpfDCJbs2ortbuIsGCGyJVxpdJsDWAS+jedfBxEJRfhchOoj0UxT4Q/plszLfeg/NrIkXqfE4xw5qNhE0jS1w4s3hma1AdIEafwehA+izTQ4up4bz0NdTUIC1NIbhU4uScFIb80Nzct/i1f1u7fUdTZbtQUxwxW8oTPIH1g5TZ70iuxtdEMgwPzsw4WmDP/FIX0voitOfCOxqn4pm1pxJVnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vB5B5+/yqOLYB02HK2C54wmZgImJKSbJ3OZNZTurjuA=;
 b=GMfg7hvFiphxGvdDRY7YDdpNjeWWxbKCDm3FkkjhbXZqoyV1dZLK3TwYqDLCR3AGI6CtyW3JEUqd8Z3LV+ACdkRFp8bjECvb10YzQPyqLkOTpAe3WocYg/RLsa5qcglE9kFpf5e/8Z2q+4O9hyTXeIJXWwEJPr6gu5IwexiMHSk=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4094.namprd12.prod.outlook.com (2603:10b6:208:15f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Wed, 2 Jun
 2021 08:32:13 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4173.033; Wed, 2 Jun 2021
 08:32:13 +0000
Subject: Re: Merging TTM branches through the Intel tree?
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
References: <a29eaef9-2457-1393-6757-40956811daf8@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a6965639-acf6-b5f5-482c-2715e7fa69d4@amd.com>
Date: Wed, 2 Jun 2021 10:32:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <a29eaef9-2457-1393-6757-40956811daf8@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:cd07:2759:3eec:1d00]
X-ClientProxiedBy: PR3P189CA0089.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::34) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:cd07:2759:3eec:1d00]
 (2a02:908:1252:fb60:cd07:2759:3eec:1d00) by
 PR3P189CA0089.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.15 via Frontend Transport; Wed, 2 Jun 2021 08:32:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1159efb-3b8c-4d75-ef13-08d925a0eb85
X-MS-TrafficTypeDiagnostic: MN2PR12MB4094:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4094A1D08BB0FDB78501A11A833D9@MN2PR12MB4094.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8dha7mBNW4hSybw7nGC4lSnm87hcWWVRQgQChou50Zu4jYliDeJ+f+NEW/iuuyLSrsrW8HioK1bLI6s3CkCYcxh6LD3BwTeWVexC99VyPzweoXErJ0jBvgPp2qssC+Dfwo4qO/lefJvfiAGUq2CBAmhwaiLyX/SV+qyWTULiJo0iTP15o70i8Q8j/KjOB2O+ZLSqB0/zuHjgaOfOvN7xiAbJQ5L9vyIW8IEMECf7deME5FYpYDpnCdpx3ZAZKRHNzN9d2SNpEUPoQu5EQjIOu8SQEubpO4Rcub9sW84TnO9BSbXToXOeBkOUukd9q7dEcROVlqbhoKciZFkCwKKsPLGgE87AI7xZlbEjtZBcKm4wu4Jkn3F1SZnmQthYwhFcfUGuWDdPyR9iOxPx+qzpNuc12CRvtNMFgW5oS6EiOzGdtcCAkCJS+guHRYLolQf3Z1REVNOjy2FT09hVyj/YvLO2WaPY0xDaTfD3KoWG8JQTomTQFwerR5pihCGQt94A7Nq3t2YqHI9jhbCKnmr0K0nWDJXCl7ipmL9v2hdDA/GZmddeJbNwGl1OUKN26efJZNXhWZE03CTZImD58eojXn7clKJsNiTX3eOWTghekhrYGTR1uFDHT1TfkJoH5n//1PHLdn2BX2RKuTA6ihcntMNFgQ3JC9j/bri7M/aI0n7h3BqpYFHGzbJqTXwo3svA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(39860400002)(396003)(376002)(36756003)(6486002)(66946007)(110136005)(478600001)(316002)(16526019)(6666004)(31696002)(31686004)(2906002)(86362001)(66556008)(66476007)(4744005)(5660300002)(8936002)(2616005)(38100700002)(8676002)(186003)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MWlPZU54cWYyTTBKTElPS3l2REQ5L2JxaEdUalVnMTlZOXc0eVFKbTVCMGtp?=
 =?utf-8?B?cGI0SDVabmFyK0pLRnFyblJaL0RaMjdYeEtiWDhDcjlMTmgvZXdRTU1yQVJ1?=
 =?utf-8?B?Z1FIR1BWYThaZWMvZERCVHJxN3IxMTI4a3dNMU4zMEFZR1AxT3pQRlFxM2VQ?=
 =?utf-8?B?NThCNWFZbGhpYS9rcm1GZkFtVEVSUkdsZktJK2p6RENPbUdtZjhFRC96S3hM?=
 =?utf-8?B?UU1nY1JXU2ZURkVsczlyWGhmMU9HUWc4bytqWThPdzZBRGFobCt5RDFtaU1K?=
 =?utf-8?B?cDNKcUZUR1N4c2hlWGFzT2xCYkZ5QnN4QmhCMXZpY21NR1N1bkxXaWZhYzM1?=
 =?utf-8?B?N0UxMld3TU1YQUw1Sm5kUTBRNnFJSG0wUzMra2k4cHF2OG91QTlGOUw2aThm?=
 =?utf-8?B?RENDZjE1em1PNDU4UzV2aUJHL3QzbDBTWHpoejBuVjg5b0lnbjJxVUFmKzIy?=
 =?utf-8?B?M3lrcXVudERhRXRndTZIMXFNK2c4aVV1TFY3YnU0SW5lLzMvb2cyZXAyc3ZK?=
 =?utf-8?B?SjhKRjBpbUFDTzAxTjAwNGZBWnQyZEFGYjhaZnJqTk5FaHVWcGdEdU8rSzhh?=
 =?utf-8?B?QnhrWnZaVzNsS1d5dCs0ZHFNT0k0Y0JkcHpFOVFpRndQU1poYkdTMTlTUzQ2?=
 =?utf-8?B?bThRMkVjcUJVT3dhSkFGZS9lczI5WTk4eGRvc21BZzVqWVNrbEwrMndybC8y?=
 =?utf-8?B?ZndSR3ZZdVhBeEo0RXl1cG1VQUJGMUtNN1RCSm81b1FPSVVPWkhydWZGVXVE?=
 =?utf-8?B?VnRkVEQ0MzBVVUNPRDZlZ3JzbldSQ01rZFpORVllWGFiYVk5ZzBjekNUbUdO?=
 =?utf-8?B?MmdudllPS01wR2E5QUpMbmlDSnRtNVBjSnB3VmxBejlBVkNIVEt0a0RJMXZV?=
 =?utf-8?B?bWhzcnFmN3lSc1ZNbEJJR0xxTnFPeXV1WTc1V0U4ZGt5SlYzQUV6R05FNW5K?=
 =?utf-8?B?VElFYnFOSDNtWTl2Qlhlb1ZmanNaMFZQSmZ0Zjc5NWU0dVdJT1BzWkRNcVNC?=
 =?utf-8?B?RmlRSzhnc3VIVE5PMURibWpvNWxlSGZWSEsydFhpNExGZENzMklQT0R5ckVW?=
 =?utf-8?B?aGtWc2hXN3FIK3NZeG01NGFtUDNiLy9xU0drOTNHb1VTeDJvN3FoNm5aRzAy?=
 =?utf-8?B?NUNvdlBDTlZVZEh5NzFzV1FYcnVzb2xKRkt2V01EejlIcVRyTlBtWEdGY1Nm?=
 =?utf-8?B?aG5pc3pDMC9kc2NHMlFMU0FoaDA2WS9zLzVYM09UamxKMDNCbVZ1bnVYK3Z2?=
 =?utf-8?B?YTU5RzUwVzN6R2tnOE1OTUR5allDei9iTmptVVFTaWZQc1pZaGttY1l0dUZ3?=
 =?utf-8?B?Mjh4emMwMTdBZFRyZnZId3lyWUtmOVZtRGM3T294N0ozZG5tL1FDZUh6VjFj?=
 =?utf-8?B?ak1DYlBZZlZycjVheFI0VW9JK3ZUcWpjR25zMkVKTCtOcmIwZkVleWEwM0pB?=
 =?utf-8?B?ZjM1anl0YnRJTUlCdG1QeVVQcFFpMGlreUdta05HVWRiVVF1VzNJWEtOK1pB?=
 =?utf-8?B?SFZVckdBMEthYnlpdGFlV1VxbHJVRk5oMlp5dmMzdjJYc3R6aWtac1pjWS9p?=
 =?utf-8?B?cGgxNUoyb1RJQkQ1ZlNUY1VyUmpYVDBubDY0endaU1BQNUttU0llS0xEZGFx?=
 =?utf-8?B?VS9WN284dmxmY2hya0c0UnRPcG12d2YyRVFtUVFOa2UzRnNQZFFmS29FaTlG?=
 =?utf-8?B?MVUrUzVLaXdNTzkxNmh6SkdDemdRemU4Z2l5V1dMNDRDWmZwYkphV0lyNVFR?=
 =?utf-8?B?VytSMmkvUTFVdy8xRHpncFRieVJaWkh6K0IvYmtQTzMxVGlJUmhRNDdDV1FX?=
 =?utf-8?B?QkJWNDUzUmcrbWJ6NkJTaHFLditaS1Q0ZllreTYxQ1Bnd0xKQ3hXMUI2ejB4?=
 =?utf-8?Q?W52Oy7iSVga/j?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1159efb-3b8c-4d75-ef13-08d925a0eb85
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 08:32:13.0461 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JWWPORBjETLb8Ve6UhfkmmvWezGZzlKdbNKvNZ31Y7bUibugoGxiOxjv8Tda0py0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4094
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
Cc: Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Uff I'm just waiting for feedback from Philip to merge a large patch set 
for TTM through drm-misc-next.

I'm pretty sure we will run into merge conflicts if you try to push your 
changes through the Intel tree.

Christian.

Am 02.06.21 um 10:26 schrieb Thomas Hellström:
> Christian, Are you OK with merging the TTM brances from the i915 TTM 
> enablement series through the intel tree?
>
> Thanks,
> Thomas
>
>

