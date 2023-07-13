Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FDB751DB0
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 11:50:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC5310E151;
	Thu, 13 Jul 2023 09:50:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 590B010E151
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 09:50:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nMCGzlsfwE//aTwj4XpWBemlNF+RFQVBPxTx9QpRFnhoFLShVqAo0quRRslLczVFqcVKpyFxC+q5z7VtH+BQ1bUpVOac2D/O+wQb26WGWusfDg7t6pfBjpQh44qcPZPG39Fyd5k4xnKNEMvQEMd48KLNjmsvmWb0p+zT9DvC/ZzoBWmoydtCzwDxn/m9MgHgR/kw749MYsRMY9rqnzJ9EJAeeaQrHm/rHw+O7H8hWvhMnWXaCiGz0Ng8b5bzLgRVrnIH/nxbR6KVvGznqmCotD7U1x51PSmKWJ2S8rqI/h5BB5ugJSfuMHe61FH/SNBdu1I69YNsFm/RMOQPFmSGdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fo9rED5taE2FeyLsvSrtBQ2+YY5AK9NoJkbgiowi4zk=;
 b=Aby5pnW7OVJ+qZqnh40m05Txs61GzmLaSNln12FtYu2VHiLpk4gbawh+QmY9NiVVVECb7rD2j07q3e5MteGX/hDyMMxsbeHTFum9ipSrpipXfvlqW9w0oI9EBxQmkOtZUOcxFyDDnbU9mABldiWav0+nmAdEjVo4UKdFefBJ5cB4nGdfmaRTUUIHn6oQ3f43ncJBBVrHTRzvy+eeQzYlJsgQEPVjRJw8HPihQOrmrdML6eae9r3+k7I0K3vHC7mv2flfdmezxDeylwm5kM72OmWp+q4myV21wfcllZTNz8IZWi7nhAynRXrenKk5Q5viW4BBHXkllr1Euk6wEMzHPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fo9rED5taE2FeyLsvSrtBQ2+YY5AK9NoJkbgiowi4zk=;
 b=dzSQTbd1AkIjbnu6r0Q51L8JNgG2pqSbjfDKgtnjek9w8zruMBYwomnsKOBtRm7YTEzJiQAWAx16O38zAoYYg5OF4Q74Jp5hHBIpqVWrjapm8DLGzwEHRYSBWiSatKafoQVigKjMo1Az4qxpqDoCBemI72OhXvhEgO2+rPh2000=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by SA1PR12MB8599.namprd12.prod.outlook.com (2603:10b6:806:254::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.22; Thu, 13 Jul
 2023 09:50:14 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c1c5:7e77:e413:e488]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c1c5:7e77:e413:e488%4]) with mapi id 15.20.6588.024; Thu, 13 Jul 2023
 09:50:13 +0000
Content-Type: multipart/alternative;
 boundary="------------OsD588Ke6IsP7VNd5QRIt2Vn"
Message-ID: <5f9e75bb-95ae-7f7d-24ce-8c69acf7b94e@amd.com>
Date: Thu, 13 Jul 2023 15:19:58 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFC 2/2] drm: add documentation for drm_buddy_test kUnit
 test
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <cover.1689171160.git.mchehab@kernel.org>
 <0e5f68ab045965292fee1748254bf9b91db9039a.1689171160.git.mchehab@kernel.org>
 <c1d632a3-4e5b-6ab9-3ac1-cb4d696becf9@amd.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <c1d632a3-4e5b-6ab9-3ac1-cb4d696becf9@amd.com>
X-ClientProxiedBy: PN2PR01CA0145.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::30) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|SA1PR12MB8599:EE_
X-MS-Office365-Filtering-Correlation-Id: 49a62a71-827b-46c7-b3de-08db83868dfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i55Y4zQxCPP6re+WMA8MzeyTMibtoc1KSAOAmIdfZoXqEb0QXx7mRMD97DarJbOHiwZq05JXOmpNRkLtRiQ4dPAISs1xf5w+eolWhjDgyYppXDKmImQOaab4hApaF0fGBGtHmirumbfLq8C6L1VHfP2GmzfBlbPB/nIkRulwpAXTQnMTa0f457uQLG0XzNz83cSaiW8fvaat3+Ilr6oz5NWtGywodj7THwC09VWCoO2n3LdfdAvvfAHMTM/ATf2f5cDmIEXJlIx6vOZh5t03C24zXXzVitOlsUcX89Ma7y+L1DoaibbVDPfiW+awmAIeSOYqyLidfUS0H5n/j7mT0fjb3Nuy07Pn100+v9wC7NeWFaukQMYhSsJO9DhIQpw0yIhkqXRZQavmP9PVoZkPpSOIaQQIFeArcw7c4Nb8B9oYXjzmWo3D2R6PJY3nj4AU30ybmmBFVy5ujBDB1d16OGqkE6Arvv/MxJ7vpPKWCs6Bg3sIMdRzYHzmgJClUx/80Zn6gZM25jW8e6VCqVMBfjyGvnyUwz8cFRRSBBtD/CBYVwycsug1jfhPb8vN8Gw8JKPQPYXqWzQgAh9t6iXeCrWmRGwFBi0x53OvicT3xDR09v1C5XJnC3y6nyPof8SrX8Fehm/2VFe4r1G1X72UMA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(451199021)(478600001)(6666004)(54906003)(110136005)(33964004)(6486002)(66946007)(66556008)(66476007)(4326008)(166002)(31686004)(316002)(966005)(41300700001)(2616005)(186003)(2906002)(7416002)(53546011)(8936002)(8676002)(38100700002)(6506007)(36756003)(26005)(5660300002)(6512007)(86362001)(66574015)(31696002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TS9mUXVyZGt2clVxa2N1VkpoTHFaU0lkZjJrVkIyemREU2RXQldQVE9QbFpm?=
 =?utf-8?B?dFU4R1Z0YXVweE8yMEZ6Wk45VFNLNlMxbVl4ejI0Qzc2amhlRHF6Rk4zTnRS?=
 =?utf-8?B?eVZ5NWhvcWY4TStnYXY1cjZyQ3lHK0JjWE9qUkxRK2o3UHlvSmtod1AyZDY5?=
 =?utf-8?B?UnFVQUVQUEk0dHpXTGJyaWlUWitMcGY1TS9oNGNYc0dJN2YvSHE3WWJ5bklz?=
 =?utf-8?B?b0ZGOUlnTWNkVDQvbzNkcGhwT2N4ZFF5bUxkdlEycmlsWWNoVi9QQ1N2SjFF?=
 =?utf-8?B?RlRXYU4wSjhreVc2azIzMVRJekVBWmVSRHcyWGxLcVdoMW5GNjYyS0dNK2pv?=
 =?utf-8?B?SmZvYmxjLzh0dU52NThiS0xmMEpKOEpHdkhZY0hlRzB3dHoxZzRLK0wwYUdN?=
 =?utf-8?B?L0licmlWMWl5SHBmY0F2NDEvaXJQbjNNUlJyV3Rmcjh6T21LVzY1U09FNllM?=
 =?utf-8?B?TkFxZ1dKdk9kM2dBNWhnL3N6SllGdGNid09wVXI2QWw3N3UreSsrUUxtY0dh?=
 =?utf-8?B?cXlqQi83clJ2dmtYOGNCa1NuSGVuN05GbG5peXBnZ2Q3dUxMTHVoZWxRcHpC?=
 =?utf-8?B?UENtUzNLb05oMldXRmNabU1MeFA4UkxLcEp0cHc5WGYrYStkTUVNR0h3dUlF?=
 =?utf-8?B?TkNUaUkzQ3BTZFhBNlFBajllZ1h2cEl5Z0tkQWU1VEEwTmVENnhvRXZxT1B5?=
 =?utf-8?B?bVNLYzdPOTMzNU5QMFB0UUJLakIxVUxXaFZLOFA5OE4rSzNJbGJqZk5HMllW?=
 =?utf-8?B?WWNGRkJLNlFLWlgyZG1xSGNSMjVTZGdXWWNrUGRTRmFZcWQwSzgzZmRMSXBq?=
 =?utf-8?B?MU5pUnhQV25wTDZKQ0c1dXh2OGd3L1JCc3FIR3o0emg0UVR1TkpnemdNdzNt?=
 =?utf-8?B?eDJYY1VwWU5IVXkzNERyS0huZVIzUFhEMWY0TnFNdUlYS0hvcjNNNzJXb0tw?=
 =?utf-8?B?RGhQV0tFNEV0Q3J6a3BsaDkxREh3TnlHQ0dINDZLVWZyZFpRSmtDVVcvVlhB?=
 =?utf-8?B?Z0VzSTBPeTZkNkRwbENhZ2Y3RVFkRWh5V2twN2RqV092STdMVjBKSjVtdnY0?=
 =?utf-8?B?Sm1ubFVVMFBXTmpybkQybERldFRLWUF0Szlucmw2N2dJSnRMWTVWQ21aT3l1?=
 =?utf-8?B?Z0tCQnVkcXFUdml1NVJWU0dpZlZrVWNyWUtESUdDVlN6TExzRlkxZFlRY1R1?=
 =?utf-8?B?VjJQMFp3ZkhHZzgzZW5KZSt4eEh6U0pYYVB6cWZQMmxhL0lkS0N1d05EZWY1?=
 =?utf-8?B?anJRUHRnS1kxb2ZQLzZ6VHRGNFBjc0ZvTkx6Z0MyNXNsTzRMRGhTcVduUTFr?=
 =?utf-8?B?cDdESE1VbVFhaDJoeVg4Ukx5bnlQcDc3N085VDJJd1lxenRQWW5iWVFlZW1G?=
 =?utf-8?B?K2RnU0tVcXcxOVR6cHF6ZzErdkUrZkV6czlDLy9HZWRuN1pyU3RBWnpWWTY4?=
 =?utf-8?B?WUhvdnJuNDhXVFc4U3JEWlJScHdJYUc2NVhFT3VjT2MvTGNFbU9wQ0c2RE9p?=
 =?utf-8?B?ektSaitnU09FaWl0RXBlRGtnS3hZZVNNL2d5MHBTT0ZjTTlmZXZmVVloREMv?=
 =?utf-8?B?dmliVjEvajJ6OXUyZDZaeTlLcHZ3czUrN3l5b2E2VUxhTEFMZ3NyK0M4RGpF?=
 =?utf-8?B?a0hGYWJhdkdDWHBoK1l3RXROcDJVcm9aaVV4cWZWekxsRjRWWmwyZ29UenBJ?=
 =?utf-8?B?OUhUNGkzSkw0T1h6U1FvVC95L281cDdZNFZXR2wvZ0J6Q1VyLy82UXdJRGM5?=
 =?utf-8?B?dDJuTitvZHVjSU41SGRFNFZKNmUzQzhLLzAvZURMVzNOMXJZa3cvcVZzOHRm?=
 =?utf-8?B?bEgyd3ZUYXBvZmx6WHJnaXcrY0NaVHNyZTNEd3o5Z0t2Y3owSVM1UTVWMmZa?=
 =?utf-8?B?Znp4aUlnM21Yam5sR2UrZjRmbDVYU04xVi9yTGhHbUZ2WHUxeHV6RVN2NFVU?=
 =?utf-8?B?QW1SYWZQaXUvSVArMXM0T1puNXRsTGdpRjFOM1dKRDB3cndxKy91M1dPRFVi?=
 =?utf-8?B?YUNKN2ZsM2VTWWQ2d0Z5bkF5UkJGTTBRNWhWNXFqYjN6NnMrTjhlYWgrT25U?=
 =?utf-8?B?dE5XR3RnSkhqdmpTUzZlbWJiSFZLOFhDVTJxZ05neVF6MjlsVFgyRWRza0pJ?=
 =?utf-8?Q?DxJWUIPSrsrjV7lVu1hD+6FHW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a62a71-827b-46c7-b3de-08db83868dfa
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 09:50:13.7497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zBvLHnq2ZfXfCf8xHoNe4nLwHsRU/iMvMkRFOTHCY7uxT3I22mHJ76zCjC3jxu6vO5wLM5jxyPk9QkMh29Z0xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8599
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
Cc: linux-kselftest@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Kees Cook <keescook@chromium.org>, Nikolai Kondrashov <spbnick@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-doc@vger.kernel.org, Brendan Higgins <brendanhiggins@google.com>,
 Rae Moar <rmoar@google.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>, mauro.chehab@intel.com,
 David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>,
 Arthur Grillo <arthurgrillo@riseup.net>, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------OsD588Ke6IsP7VNd5QRIt2Vn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Looks good, Feel free to add Reviewed-by: Arunpravin Paneer Selvam 
<Arunpravin.PaneerSelvam@amd.com>

Regards,
Arun.

On 7/13/2023 12:09 PM, Christian König wrote:
> [Adding Arun]
>
> Am 12.07.23 um 16:28 schrieb Mauro Carvalho Chehab:
>> As an example for the new documentation tool, add a documentation
>> for drm_buddy_test.
>>
>> I opted to place this on a completely different directory, in order
>> to make easier to test the feature with:
>>
>>     $ make SPHINXDIRS="tests" htmldocs
>>
>> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
>
> Acked-by: Christian König <christian.koenig@amd.com>
>
> Arun please take a look as well.
>
> Thanks,
> Christian.
>
>> ---
>>
>> To avoid mailbombing on a large number of people, only mailing lists 
>> were C/C on the cover.
>> See [PATCH RFC 0/2] at: 
>> https://lore.kernel.org/all/cover.1689171160.git.mchehab@kernel.org/
>>
>>   Documentation/index.rst                |  2 +-
>>   Documentation/tests/index.rst          |  6 ++++++
>>   Documentation/tests/kunit.rst          |  5 +++++
>>   drivers/gpu/drm/tests/drm_buddy_test.c | 12 ++++++++++++
>>   4 files changed, 24 insertions(+), 1 deletion(-)
>>   create mode 100644 Documentation/tests/index.rst
>>   create mode 100644 Documentation/tests/kunit.rst
>>
>> diff --git a/Documentation/index.rst b/Documentation/index.rst
>> index 9dfdc826618c..80a6ce14a61a 100644
>> --- a/Documentation/index.rst
>> +++ b/Documentation/index.rst
>> @@ -60,7 +60,7 @@ Various other manuals with useful information for 
>> all kernel developers.
>>      fault-injection/index
>>      livepatch/index
>>      rust/index
>> -
>> +   test/index
>>     User-oriented documentation
>>   ===========================
>> diff --git a/Documentation/tests/index.rst 
>> b/Documentation/tests/index.rst
>> new file mode 100644
>> index 000000000000..bfc39eb5c0aa
>> --- /dev/null
>> +++ b/Documentation/tests/index.rst
>> @@ -0,0 +1,6 @@
>> +========================
>> +Kunit documentation test
>> +========================
>> +
>> +.. toctree::
>> +   kunit
>> diff --git a/Documentation/tests/kunit.rst 
>> b/Documentation/tests/kunit.rst
>> new file mode 100644
>> index 000000000000..6ffc151988a0
>> --- /dev/null
>> +++ b/Documentation/tests/kunit.rst
>> @@ -0,0 +1,5 @@
>> +Kunit tests
>> +-----------
>> +
>> +.. include-test:: drivers/gpu/drm/tests/drm_buddy_test.c
>> +
>> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c 
>> b/drivers/gpu/drm/tests/drm_buddy_test.c
>> index 09ee6f6af896..dd6c5afd6cd6 100644
>> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
>> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
>> @@ -737,6 +737,18 @@ static int drm_buddy_suite_init(struct 
>> kunit_suite *suite)
>>       return 0;
>>   }
>>   +/**
>> + * KTEST_SUITE: set of tests for drm buddy alloc
>> + * Scope: drm subsystem
>> + * Mega feature: drm
>> + * Feature: buddy_alloc
>> + *
>> + * KTEST_TEST: drm_test_buddy_alloc_%s
>> + * Description: Run DRM buddy allocation %arg[1] test
>> + *
>> + * arg[1].values: limit, range, optimistic, smoke, pathological
>> + */
>> +
>>   static struct kunit_case drm_buddy_tests[] = {
>>       KUNIT_CASE(drm_test_buddy_alloc_limit),
>>       KUNIT_CASE(drm_test_buddy_alloc_range),
>

--------------OsD588Ke6IsP7VNd5QRIt2Vn
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Looks good, Feel free to add Reviewed-by:
    Arunpravin Paneer Selvam &lt;<a href="mailto:Arunpravin.PaneerSelvam@amd.com" class="moz-txt-link-freetext">Arunpravin.PaneerSelvam@amd.com</a>&gt;<br>
    <br>
    Regards,<br>
    Arun.<br>
    <br>
    <div class="moz-cite-prefix">On 7/13/2023 12:09 PM, Christian König
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:c1d632a3-4e5b-6ab9-3ac1-cb4d696becf9@amd.com">[Adding
      Arun]
      <br>
      <br>
      Am 12.07.23 um 16:28 schrieb Mauro Carvalho Chehab:
      <br>
      <blockquote type="cite">As an example for the new documentation
        tool, add a documentation
        <br>
        for drm_buddy_test.
        <br>
        <br>
        I opted to place this on a completely different directory, in
        order
        <br>
        to make easier to test the feature with:
        <br>
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;$ make SPHINXDIRS=&quot;tests&quot; htmldocs
        <br>
        <br>
        Signed-off-by: Mauro Carvalho Chehab <a class="moz-txt-link-rfc2396E" href="mailto:mchehab@kernel.org">&lt;mchehab@kernel.org&gt;</a>
        <br>
      </blockquote>
      <br>
      Acked-by: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
      <br>
      <br>
      Arun please take a look as well.
      <br>
      <br>
      Thanks,
      <br>
      Christian.
      <br>
      <br>
      <blockquote type="cite">---
        <br>
        <br>
        To avoid mailbombing on a large number of people, only mailing
        lists were C/C on the cover.
        <br>
        See [PATCH RFC 0/2] at:
        <a class="moz-txt-link-freetext" href="https://lore.kernel.org/all/cover.1689171160.git.mchehab@kernel.org/">https://lore.kernel.org/all/cover.1689171160.git.mchehab@kernel.org/</a>
        <br>
        <br>
        &nbsp; Documentation/index.rst&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 +-
        <br>
        &nbsp; Documentation/tests/index.rst&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 6 ++++++
        <br>
        &nbsp; Documentation/tests/kunit.rst&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 5 +++++
        <br>
        &nbsp; drivers/gpu/drm/tests/drm_buddy_test.c | 12 ++++++++++++
        <br>
        &nbsp; 4 files changed, 24 insertions(+), 1 deletion(-)
        <br>
        &nbsp; create mode 100644 Documentation/tests/index.rst
        <br>
        &nbsp; create mode 100644 Documentation/tests/kunit.rst
        <br>
        <br>
        diff --git a/Documentation/index.rst b/Documentation/index.rst
        <br>
        index 9dfdc826618c..80a6ce14a61a 100644
        <br>
        --- a/Documentation/index.rst
        <br>
        +++ b/Documentation/index.rst
        <br>
        @@ -60,7 +60,7 @@ Various other manuals with useful information
        for all kernel developers.
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; fault-injection/index
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; livepatch/index
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; rust/index
        <br>
        -
        <br>
        +&nbsp;&nbsp; test/index
        <br>
        &nbsp; &nbsp; User-oriented documentation
        <br>
        &nbsp; ===========================
        <br>
        diff --git a/Documentation/tests/index.rst
        b/Documentation/tests/index.rst
        <br>
        new file mode 100644
        <br>
        index 000000000000..bfc39eb5c0aa
        <br>
        --- /dev/null
        <br>
        +++ b/Documentation/tests/index.rst
        <br>
        @@ -0,0 +1,6 @@
        <br>
        +========================
        <br>
        +Kunit documentation test
        <br>
        +========================
        <br>
        +
        <br>
        +.. toctree::
        <br>
        +&nbsp;&nbsp; kunit
        <br>
        diff --git a/Documentation/tests/kunit.rst
        b/Documentation/tests/kunit.rst
        <br>
        new file mode 100644
        <br>
        index 000000000000..6ffc151988a0
        <br>
        --- /dev/null
        <br>
        +++ b/Documentation/tests/kunit.rst
        <br>
        @@ -0,0 +1,5 @@
        <br>
        +Kunit tests
        <br>
        +-----------
        <br>
        +
        <br>
        +.. include-test:: drivers/gpu/drm/tests/drm_buddy_test.c
        <br>
        +
        <br>
        diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c
        b/drivers/gpu/drm/tests/drm_buddy_test.c
        <br>
        index 09ee6f6af896..dd6c5afd6cd6 100644
        <br>
        --- a/drivers/gpu/drm/tests/drm_buddy_test.c
        <br>
        +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
        <br>
        @@ -737,6 +737,18 @@ static int drm_buddy_suite_init(struct
        kunit_suite *suite)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;
        <br>
        &nbsp; }
        <br>
        &nbsp; +/**
        <br>
        + * KTEST_SUITE: set of tests for drm buddy alloc
        <br>
        + * Scope: drm subsystem
        <br>
        + * Mega feature: drm
        <br>
        + * Feature: buddy_alloc
        <br>
        + *
        <br>
        + * KTEST_TEST: drm_test_buddy_alloc_%s
        <br>
        + * Description: Run DRM buddy allocation %arg[1] test
        <br>
        + *
        <br>
        + * arg[1].values: limit, range, optimistic, smoke, pathological
        <br>
        + */
        <br>
        +
        <br>
        &nbsp; static struct kunit_case drm_buddy_tests[] = {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; KUNIT_CASE(drm_test_buddy_alloc_limit),
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; KUNIT_CASE(drm_test_buddy_alloc_range),
        <br>
      </blockquote>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------OsD588Ke6IsP7VNd5QRIt2Vn--
