Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D3545F285
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 17:55:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B33C6FA98;
	Fri, 26 Nov 2021 16:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2049.outbound.protection.outlook.com [40.107.101.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D37D6FA97
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 16:55:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nk0NBjYXJe7o7wgI4cL0c0J9mhb+nkODgZ7uSxAZuE5n8a5PjAN0qlVNQSmMQSgYVU2Ws3dAGIWPtFz/xgrO5MSxlKSsWSRBtz5dzrUlveqwht/xsv6jaVBWJPSq8b2vTbqk7tmFbw7fchJIhhjRy0f8r9t6T49Esqd0r7AEcDL0gabjtnY3B5y/RmiF8KR5xs8JNb+whjaT+sfg3uUw0Jq217C3fYdVtMDBKFB3joHbzElcQiS1Brtfbv3G0vCnY/QjbWo3EyXQsvy5zNpIxOVhZ23kwLcs30N7dd2VQ++/wp8gISqZ+aGbDJoBeWbTB9aOMmTS0hCGj4p4O5n+og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LuSpiFTxGZe9Pm9Fnaxwd5mKa0DaIysH3pCWS/i7nwY=;
 b=bJHJg4VnAe82tsHKxH1YpXFBhw4OmH0d2n0GJytGS2mOjkMSIenDLkyZyh34fhzdomxJRjQ2iAd9Tm4D3CluVC1Bx9GrHZdEdyOfECwc2BFSJx37REtDKBry4tILT3USv/sbXnr1vOaxRL5XUxfdR01fVaZwS5SYbI1gvGA89pgVqAtqFGeW8pR3bHOb8KY2s24gNzWPJ35UQqiS/ZhQtA6v9cuQFZ0W6ZHdaeB9ALbeQvYWucUKmfm/Dp58duc27gQNdh5A5a3ckkFW6JtynvM9Kh1YJ7f37VeLMp5jwinJ88p/EFWybtIGhvfmB8JEncVVYEKNuiwNtx5NhATVmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LuSpiFTxGZe9Pm9Fnaxwd5mKa0DaIysH3pCWS/i7nwY=;
 b=ECTN3f0cAlhbKnJRKFtx39HkczJJRZYSKGCsrBxsmJUaS9rkjrg0EwPRUxw8TfRqJMciw++UzVmxZ/37u6wqFu1ccz7S5xJD8gZOFo28h5wW3ryY6OG7HGmAPGVfiOiiSNgxP3XXCZQQ56EU3YtGqrYSpvM14mvFJwvxVyJ33O8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by MW5PR12MB5569.namprd12.prod.outlook.com (2603:10b6:303:196::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 26 Nov
 2021 16:54:58 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::e492:c86b:9906:1b46]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::e492:c86b:9906:1b46%7]) with mapi id 15.20.4734.023; Fri, 26 Nov 2021
 16:54:58 +0000
Message-ID: <26abc3eb-c50e-8f89-ccc9-ad96f1177987@amd.com>
Date: Fri, 26 Nov 2021 11:54:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [i-g-t 00/14] Add IGT support for plane color management
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
References: <20211115094759.520955-1-bhanuprakash.modem@intel.com>
 <20211118115002.14003184@eldfell>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20211118115002.14003184@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0133.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::6) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
Received: from [192.168.50.4] (198.200.67.104) by
 YQBPR0101CA0133.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.23 via Frontend Transport; Fri, 26 Nov 2021 16:54:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5aef68cc-a497-408c-55b0-08d9b0fd7a86
X-MS-TrafficTypeDiagnostic: MW5PR12MB5569:
X-Microsoft-Antispam-PRVS: <MW5PR12MB5569FD8A694CE6619E4F8FD38C639@MW5PR12MB5569.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ExYh0IkQMjhEV4nm25OVyzDSsDmp1UBTcN67Sjcl3WDUIvjXbR9k6JUnFAwX0eYn597/3YFm3L1Cq++YcP8HPk8or02q6db91h4jpRYGzsLqrFZkUNaEh3p5w4oDw7DpoCmWUHRud3vKzpK0eo6DBPXxPQjguxj2An5KDV1/BwXkXBT2s72PmgXTIYTBF2WYMx0Ymt/LX43ZSWyCP9I6EGFg7jM5d1cg1mmdnPwHOFZiFfX2KUIGQ1H8J3+XdILjUU3FLSDw+JxSu7jGHE7Btz+3q7nZ1KCpbEbUxtllpKzoUKS7b0GxpIf0XJTosz1qHJKuaRMRETSltd+YTuS8IsMfkGsKXTethcCfeJU23mnebrFjXMaFAgiGqr3KMW7nuWvISq0wSUlmcAvbD6mn4kPFN3ztFo8TDoOprp4h/7mNLTltQAgsHFaBl6hf7/wjm7JjgWLp/Oo8Hex4ioP3WDY0Gt3T32t9fyYdRjncbYPUFs0KiBqJ0euNEUfyUer9memoyqlZeByif8AXwL9Z6GI95j2+WttO8kA0yivN3bySYTX7+G78V6R9Mn9TYnlflp9r5xCoNCsQTLJlrj6bqUP+ze71sfPzXFzRNZQZAwaJJ457g6MYpswETR3icgMm/Y9LSaav7YOhGQPopPSGuhhYogF1wO7/5c01B8EkqR0oz5ILE7nvfaRGsqYStbJprD74xqkn+/YazPd4mZg89MEmuV1EGGrIB5glGn0zn5jGhckW2rWKYfKLlrWBYu1r
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(53546011)(26005)(31696002)(186003)(31686004)(38100700002)(66946007)(66476007)(66556008)(16576012)(966005)(508600001)(2906002)(36756003)(316002)(44832011)(8676002)(956004)(8936002)(6916009)(6486002)(4001150100001)(2616005)(83380400001)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0p1NDVVYmwxT243WTRHL04yaDdxTWZuQ0N5ZnpidXJRYm9Ec1g1ZUdqc25X?=
 =?utf-8?B?WFZJR2JaUWV6cElGTytHazdsVnlvL3RkUVdaeGhUSFVDNHFoRXh1OUpLZXkz?=
 =?utf-8?B?Z2haMUVYVU5TSHBtby95a1dSbDFKUzd0QXBjaFVwcTVFTHEwVUlFL3BKamtu?=
 =?utf-8?B?bWszcHdqOTZsM3hRZFQ1a0dLV3hqb0lVUzdUblYraU1EYUJ0UHZma3NuYXZ5?=
 =?utf-8?B?Q1VKK3UrYldIMHdQcm1YemtNcmJoOHlwME9IN3FhMzRsZUJ3OXloSURER1BL?=
 =?utf-8?B?YnBNZys5dDZPbXY5TEs1V0J4dDcxc1pGTXJOa0RabVRxQjZBSWkyS3BwRGVo?=
 =?utf-8?B?eWhIMVZ4UjVEN0tQaFlhUmluN1gxb3BPV20wdHBCUTB5aHlwVHN5Q1h0b2px?=
 =?utf-8?B?SmR4L1BNYk9LVzcvamlGNVJRd2VaYkZSYUFwbVVlMDdMVk5iV2pySVcxR3BC?=
 =?utf-8?B?SkhwWTNnQnRLd1pNNDlDVjBpRFZ4bXpLbmx0RHFJY0k1R0lrdWcybnJoTE5r?=
 =?utf-8?B?bFovRnUzbDdjTlBNUDgvUmJDRHhwNlBoMWpwSTR1WDd5UVNmak1SV05EYlhE?=
 =?utf-8?B?aGp3OFlYR0l0MzZkZFF2TmdBeTNmcmVFblJvVEhjbitqMzhtMU1PUnpBOSta?=
 =?utf-8?B?VmY4RUtENmdYS2NGYWptRmJQSnlHRUY3YkFKdHZnTTVhdlVFUmdNNGZzQUs1?=
 =?utf-8?B?Y1hWbkZmYm9iQkp2cWEyeGdCeXNFRjYrU2k3UEtsZGlhNHJHVy9YT1Z3U3d1?=
 =?utf-8?B?RXF3bzJNLzN0UStxZDlFaFVILzNrVHp3QUd3T21rQzh4UzdyTm1GTHF3VHNZ?=
 =?utf-8?B?a3ByNC9DellZeWNJdmswRjRrODNTS09NeGtpT1JzY1lKRTU2UGRPVmpGWk9y?=
 =?utf-8?B?RUhSUEI1U1hHSFR2R3ZRenNyWGR6Tkd5d25UUXJSeE9yOGdEN2ZteU1aOWpU?=
 =?utf-8?B?V014TmM5cjZvd2l1YzhvTUowQ1RDRHB2SWJvbWZ4NWU1bHMrZ2tNVitKYktu?=
 =?utf-8?B?QjFoTkxhaVBCL29WRXpVaFBhN3hFTFBFaVRrTEU5V1RGVzlaU0VoR0VuUlcv?=
 =?utf-8?B?dGZNd3VDdGRzeEJBcnkyUzMvWHAwYTY1anlTVHlHM2pxc2pRRG1hbTg2L3Z4?=
 =?utf-8?B?WE50bFRBM3dqSkNIYmpjV2tQUFhLaUZuWFErc09XdVpFWnk2L0FGOVJnbmZI?=
 =?utf-8?B?T0hsTnphWSs4TUg3L3dlSW51KzVRUm9KdllNN2Q2WkJZS0JyK0VpamJuZ3lW?=
 =?utf-8?B?NWUxNmFVOWsvdThNTnh5YU1UdjdhNWIwV2FhRURUNVlJUWYzSzYvd0E0b2o2?=
 =?utf-8?B?dnZpTDM2cnV6aWowczR4Sm1tdmxiMmE5RDV1TFUrQy9xWHNvQjVzT1NhUmll?=
 =?utf-8?B?OWx4Y1JFcXdZMnEydTVvYlFNREdFdHEzVkg0K2c2VGNQOVdOYlNiS3lwd0xs?=
 =?utf-8?B?bWhQT2dEM2dnTW5oOGFXbThVOUFpcFhKa3BBcHN4WDdGSmpoWjVjemt2VUwy?=
 =?utf-8?B?ZG1IZ1dQTmdnUmJENERQUWZocXlhWVpoTHp3LzE5VUZBWWpPYnZPNndDaUN6?=
 =?utf-8?B?QXF4SndmSWU3T3Fpd2xuK01QV2tSRjlXOXg5d3RJZkVkT1hPUXdxQkxVdnZS?=
 =?utf-8?B?UUhucC9BYzJEdnY3UFhiNXQ5VjNpN2c5WlNhTkpQcTd0QnhXR2IwZ0loNEF1?=
 =?utf-8?B?MDU4eHBHak84WDJjdjA5dlU4RVBuSElpNzJMWForS09Zdm13UHdJeHZWcTJk?=
 =?utf-8?Q?k40EVaNZCncgFU9K9VdZL61ekTxMcWcJfK1Qdiw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aef68cc-a497-408c-55b0-08d9b0fd7a86
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 16:54:58.1013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AVBfeekD/ElQ/8GHGTrpy6rEuoEojQE9awIsyKtxEwowP7L7KMQbk+GKML12b9YWO38CRGAZVv2QqXrrRMDoVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5569
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-11-18 04:50, Pekka Paalanen wrote:
> On Mon, 15 Nov 2021 15:17:45 +0530
> Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:
> 
>> From the Plane Color Management feature design, userspace can
>> take the smart blending decisions based on hardware supported
>> plane color features to obtain an accurate color profile.
>>
>> These IGT patches extend the existing pipe color management
>> tests to the plane level.
>>
>> Kernel implementation:
>> https://patchwork.freedesktop.org/series/90825/
> 

Are these tested and passing on any current or future Intel HW?

> Hi,
> 
> it's really good to get these, but I am worried that the tests here may
> be too easy to pass when trying to ensure the KMS features work
> correctly and in the way real userspace is going to be using them.
> 

In particular per-plane color management is mainly beneficial when
using HW composition, i.e. plane blending. I don't see tests for
plane blending.

Another thing that would be good to test is to make sure the order of
operations is as documented in the KMS API, i.e. degamma -> CTM -> gamma.
In order to test this it might be good to create a test case that sets
these operations up in a way that only yields the expected outcome
if they are implemented in this order.

Last, and likely not easy to test, is the precision or accuracy of the
PWL though I am unsure whether we can even test this at all with CRC.
It looks like we might be able to test this with the Chamelium to some
degree.

> I also found some things that looked hardware-specific in this code
> that to my understanding is supposed to be generic, and some concerns
> about UAPI as well.
> 

I left some comments on intellisms in these patches.

Do you have any specifics about your concerns about UAPI?

Harry

> 
> Thanks,
> pq
> 
>> Bhanuprakash Modem (11):
>>   HAX: Get uapi headers to compile the IGT
>>   lib/igt_kms: Add plane color mgmt properties
>>   kms_color_helper: Add helper functions for plane color mgmt
>>   tests/kms_color: New subtests for Plane gamma
>>   tests/kms_color: New subtests for Plane degamma
>>   tests/kms_color: New subtests for Plane CTM
>>   tests/kms_color: New negative tests for plane level color mgmt
>>   tests/kms_color_chamelium: New subtests for Plane gamma
>>   tests/kms_color_chamelium: New subtests for Plane degamma
>>   tests/kms_color_chamelium: New subtests for Plane CTM
>>   tests/kms_color_chamelium: Extended IGT tests to support logarithmic
>>     gamma mode
>>
>> Mukunda Pramodh Kumar (3):
>>   lib/igt_kms: Add pipe color mgmt properties
>>   kms_color_helper: Add helper functions to support logarithmic gamma
>>     mode
>>   tests/kms_color: Extended IGT tests to support logarithmic gamma mode
>>
>>  include/drm-uapi/drm.h      |  10 +
>>  include/drm-uapi/drm_mode.h |  28 ++
>>  lib/igt_kms.c               |   6 +
>>  lib/igt_kms.h               |   6 +
>>  tests/kms_color.c           | 674 +++++++++++++++++++++++++++++++++++-
>>  tests/kms_color_chamelium.c | 588 ++++++++++++++++++++++++++++++-
>>  tests/kms_color_helper.c    | 300 ++++++++++++++++
>>  tests/kms_color_helper.h    |  45 +++
>>  8 files changed, 1648 insertions(+), 9 deletions(-)
>>
>> --
>> 2.32.0
>>
> 

