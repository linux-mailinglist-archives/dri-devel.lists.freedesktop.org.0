Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EADA7C848B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 13:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E69EF10E073;
	Fri, 13 Oct 2023 11:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060.outbound.protection.outlook.com [40.107.93.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3C810E067;
 Fri, 13 Oct 2023 11:37:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KlcKPQeuXJlZu/MjZvzKH7cNWUoJsdqDBmj+pY+E3/6M2eLFnC86vwqfJhBGp0O4pChrdKRXdsLWDWnfdUqZVaKLtEY8wDUtwcrjkFSBdGDydHJNz5Zdgucu23XoWxYskZ2d+IVxg/zVatnqtNR8IKFvnK+CkTRsW9Sb0Y91Y8XcfyJk1Tx15rbFORWqDnhzo3RORfjBoYVe5SqnneeNNtUA6MMW1YTX8ChOrpriyr5paFgI81MNd8S5Z9lCRvQV3JMtzunw4wnCSd3BAzRDDjmbHIE0rJiS2BqEwwl4pH11v0zvFFeR8vGN3mYfGu2TMOz9rURT8nWTvk6aISvvZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ZYM5GY2zTSu6VwKLieOUUPjaU67nd29Z4DDwhv0LCA=;
 b=GK++yO+JYwKUu/s8RFSMjzTWlok+jabyviVklIFQaPCvXVWuYf9wCise/QRFhYEEwfdl34poyTOE88vvmFrbcz34QAcsKDiQtXicXdmm1ScBx78u2r1FQJoibGgbYGPuF6YGhCCPWfds3LqGFn1W1xE1RY12HqI41cQ4B3MSoSoaXf859iRSJaIP50GbArYOJUXvbf97NTMZJri/FLQFtK/7QjUUF7B1JBhQqYfMpywIWFLDy53CtBrUBqhUbIV/Y8krCAxjx2lCjwr95vKXrRA/9wXy4qwKYPE22xct+Ou9aMVTpPXlgtwqSNshjH4Lx0fS4xctP/4DlqXtUvsGsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZYM5GY2zTSu6VwKLieOUUPjaU67nd29Z4DDwhv0LCA=;
 b=bRjRNLoBhdNq/TGRugdf+Se0ViTRekXJ80RshINeMi8TnTagaIAX51OLJySjUmkQafRIHzrUm/K6SlHF3MBlzw7zozKuicED5GX+lHutK4uM/igUPm0X6saHCm5Sq9Skb/i9+8l59CXm3/ytLthzdMMF9V0lydpyEDzKDVdKNug=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 CH3PR12MB8534.namprd12.prod.outlook.com (2603:10b6:610:15a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.41; Fri, 13 Oct
 2023 11:37:10 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5aa2:3605:1718:3332]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5aa2:3605:1718:3332%7]) with mapi id 15.20.6863.043; Fri, 13 Oct 2023
 11:37:10 +0000
Message-ID: <9d371f71-b7f9-4c4e-b42b-20cabaa42567@amd.com>
Date: Fri, 13 Oct 2023 07:37:06 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/edid: add 8 bpc quirk to the BenQ GW2765
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20231012184927.133137-1-hamza.mahfooz@amd.com>
 <ZSkcX1nJ4Ipf2ICd@intel.com>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <ZSkcX1nJ4Ipf2ICd@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0145.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8c::11) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|CH3PR12MB8534:EE_
X-MS-Office365-Filtering-Correlation-Id: a29d453e-c095-4d8d-409b-08dbcbe0bc8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IBsXEKx1LVCnXXYODDW9qhJh3N0h/MVInMrRIfehog6V+1BeZG9dDKcWx7b8bDt9pDFucTBs60k0X++OWfhmEqLejXi1SRLzh4lmlEwD2Yy0kwxSekrRlctIAZOkiBbpRKgw0uBjJf1ojq61rEmyTP4N51pyUON0D4n4RUPqoJwIIl5L/+Wdyg/8btaW4zzscdiOk/OWUSWsSATH8J7/R49CmJuVqDd7E+Hj+lvEzskr2zJUi0I755rBqV1RUUE9+x3nozG29ZZXhy0HMqWpIKC61fId80k4BtNjTcgicJkC95DGdwQTe9HFTJ9d8KvcEO1l7erEOEZDb/e00mphwemr/lSBvOul1fPrT8HIsP4Z8ksLdMkqOiT377hj3J9HewIGUmA0BpAC3JjMYwtV7khyWpPuJevZR3YbWgp1BoZ7aAzXF85bLbr7kVkuH2FI9PG9gu51QEtLyD+yvK6zbOwtn3RtHzONYtx0cpehorvLHgqn+Z3DqA34QuhliHyiwrqsLwgz4JSzpCajPT/50ekJHw3LWSWcb2gqPxPWyheKLJvJp142RqbIQqvBkIbnuhQqCItvNFazdoESQo+tMmPOm2AjavYusL/kqvp5EFDe37d3wpfoOEObFNSvAH49
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39860400002)(376002)(346002)(366004)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(54906003)(66574015)(2616005)(316002)(66556008)(6916009)(6512007)(66476007)(66946007)(6506007)(53546011)(38100700002)(6486002)(26005)(966005)(478600001)(83380400001)(6666004)(44832011)(31696002)(86362001)(2906002)(8936002)(8676002)(41300700001)(5660300002)(4326008)(36756003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rmp6OHRwcU9BTnNONGlHY3N0UmoyK2E5VWZiMGhMZk1rVzlCRGh3eGd5Q0Vw?=
 =?utf-8?B?eGJHcnBPMFF1Y2MzaWZ3YWZ0ZmVyZzg5SWk5Mno1Wi9BdGpUNldYS0hqWE9P?=
 =?utf-8?B?UGdaS0RiZVZRMFk2ZTJqLzNjZVBwcjlXVzNpVUw1Y2lCSGIxU0Y1TWZhTTdC?=
 =?utf-8?B?dU9Eczh2NlRmU2I3cC9xUjlUVUpNMTV0RklsVkZXWkdyOHBDdW1jL1RlSEhl?=
 =?utf-8?B?eEtXRDFDQWJzVkdlT0cyRHF1T0JyZzlla3IxUGNBTHFsVlJSc2p1QVlGbnNG?=
 =?utf-8?B?ZE5WOWwvTTFnVmRWTWZmMWhyaHF6SVk0bE5YNCtrUmNZMXMrb1FwYjNxcG5r?=
 =?utf-8?B?LzFyT2F5ejVHdWI3eEZlZjhZTmdsalFRMm5iUDNIR3BneHJzL2xMd2Vpb2JN?=
 =?utf-8?B?UkNCYTZBRHZyOUxRUWRUd1U1VURpd1o2a0JONXBxWXUwY3BqN2VEVkl2c3dn?=
 =?utf-8?B?MHNzRnBhVEJXUFdVcGVXREdvdmZLOWRtV3ZuK2h0YVRZekFlNjA4ZXFpZlQ5?=
 =?utf-8?B?Qi9SdEN1bzlncDFURUZ1NWkxMk9uWWptdldLRzdOUThPN2YrVVhPbit3VHU5?=
 =?utf-8?B?NnV1NTd6bkpaUjNEWGQ0bGxOYm5sTEZKYk54V084ZkNONkFCNjIzSXhBMXlW?=
 =?utf-8?B?Q2lrWDAvbDJmOXR4QlE2TmpNSXphM3RQQnozQ0QzaHd0cnk0K25BZm84M29I?=
 =?utf-8?B?bjcxZXBibnhqdThoeEhhdEJLaFpYd01ZYTk0aDgvZFo5a0luT0g5amxrYkdE?=
 =?utf-8?B?UGQwYWRhZUF2YjAzUmxwbytvNHVjc3N0aUtpQktLb2ZGRFNMU3JwNjhTVzBJ?=
 =?utf-8?B?bDVQWGZ3ZDFrb2NSNDJvU0NBMjhDNXN6b0FwdEMvbVRMYUxsc0czTHRoQkR0?=
 =?utf-8?B?OFRZUkJFYTJvZW1DMHZPcHlDeXNxcms5UEJJaGpjdnFDcHNZeFI4NWZhR09E?=
 =?utf-8?B?aEtCK0xhRXU1VzY2eVVvMkptdXhucjdyc2ZKM1ljNFVLd2h1SUJ2R3daSVhn?=
 =?utf-8?B?a2x2elR4aXZNUXFYS3J2TlFrdkQ4UEFpN0tucEFHSUVWaUtLRER2NjJsRlBH?=
 =?utf-8?B?bDFNY3pFNG40TkpmMXEzZkZZYXNvalZwbVFiWHF6NHBGdVZyWmttdTVJMHZX?=
 =?utf-8?B?cmdpaFgvTDcwWVlHV0sxdmp4b1hGc2R2NlIwWGdETEdTZklpbU1VL1BPWHZs?=
 =?utf-8?B?dXc0RURRLzFpMEFxdGF5SWI3MnJMNlppY0ZTdDJFTW5kbmZwbzA0RFJkR1gx?=
 =?utf-8?B?NCtpdG0wWnd4T2ZzVzF0T1J5T1E4TE43OU5iUk5mU2xDTURMelhXTWpoVU51?=
 =?utf-8?B?NldNMnJ2SU5lT2Y5dGYwM0JVakFYV2ZxbTFscVdJa2Z6UEVodlhheDdjZ21H?=
 =?utf-8?B?V0hMR2t2TmNuT01nNy82ZWlCeUtzTGZWc3JwdndCUHVSZDNrZm51SU85N2g0?=
 =?utf-8?B?aFd4K09lMVFsRlhLbE1la3orcERIR2cxeERFeURBQkFTMUhuMkJhMmQ2Z2g3?=
 =?utf-8?B?dGt1WjdMUExGMXBZdFJNaE9jQTVjcGdZbTJBVyt5Qng0Szg0UlZuaGV0WHpj?=
 =?utf-8?B?MEEvZHhpSVo4YTMrTk5MMDhZdnMxd3lkYTJhV0dSTzY0ZkpkN0d4ZCtDVTk1?=
 =?utf-8?B?OWtjd1d2cVl6cWsyOUFITnAxVTJDUGt2SHJnR1JxbEkvWlFWYnYvL1gyZ0Jo?=
 =?utf-8?B?aHY3dkw2RFlaTExIQXJzRWpvOXJIcXdUUFBhcWQxampCY3E0WlFkRmJtZzNV?=
 =?utf-8?B?TnhpZHVUNUdiRGx6djhLdEcrSFZieGo2Q0U4aTRlSWxwMVJmSm82ay9kOUZu?=
 =?utf-8?B?NkpJNGtnY2F0b2lZTmwzUmRCTTh2MWlYY1pmdjl3eURXQmNwUXJRQ3FzRlN5?=
 =?utf-8?B?anZVVks4T0EzbHp6d0VGcW1RYkJuMmFCTThacTNSZ3B2MnVlTmNsSUdlZ2ZO?=
 =?utf-8?B?NGdqV3ljcVlGMTd3am1JN0t1YkM1WlZITjJiV204c0tMMkRRKzhpSVQwQ0ZI?=
 =?utf-8?B?RFR6SGFhTkErUHl1UmIxY2NzbTZaOUduQldYOUh2N2xIbEVLRlJUdmNsK0c0?=
 =?utf-8?B?ZlQ0cG9JTExhYjc2WWdCUmR6a0VFQlB4aHl2Z0JtcVRQTS80bWp1VFU0L091?=
 =?utf-8?Q?t1Tx/u7EIqNyZ0hdC4k6GyCAV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a29d453e-c095-4d8d-409b-08dbcbe0bc8f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 11:37:10.1446 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Jn0B3zQGmHEosataAYoPBF5GRaomaTAHJcEnCdrrA8x+ISH3xSgoP9x2bMznAM9Q5HCFOujdoRlMGFLDp8OGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8534
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
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/13/23 06:30, Ville Syrjälä wrote:
> On Thu, Oct 12, 2023 at 02:49:27PM -0400, Hamza Mahfooz wrote:
>> The BenQ GW2765 reports that it supports higher (> 8) bpc modes, but
>> when trying to set them we end up with a black screen. So, limit it to 8
>> bpc modes.
> 
> Bad cable/etc was ruled out as the cause?

Yup, the issue was also reproduced by two different people with same
aforementioned monitor.

> 
>>
>> Cc: stable@vger.kernel.org # 6.5+
>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2610
>> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>> ---
>>   drivers/gpu/drm/drm_edid.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index 0454da505687..bca2af4fe1fc 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -123,6 +123,9 @@ static const struct edid_quirk {
>>   	/* AEO model 0 reports 8 bpc, but is a 6 bpc panel */
>>   	EDID_QUIRK('A', 'E', 'O', 0, EDID_QUIRK_FORCE_6BPC),
>>   
>> +	/* BenQ GW2765 */
>> +	EDID_QUIRK('B', 'N', 'Q', 0x78d6, EDID_QUIRK_FORCE_8BPC),
>> +
>>   	/* BOE model on HP Pavilion 15-n233sl reports 8 bpc, but is a 6 bpc panel */
>>   	EDID_QUIRK('B', 'O', 'E', 0x78b, EDID_QUIRK_FORCE_6BPC),
>>   
>> -- 
>> 2.42.0
> 
-- 
Hamza

