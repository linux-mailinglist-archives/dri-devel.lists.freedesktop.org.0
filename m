Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F6F82C1E4
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 15:33:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CC7610EB20;
	Fri, 12 Jan 2024 14:33:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2053.outbound.protection.outlook.com [40.107.102.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 438D110EB28
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 14:32:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BsjU68mMKtryidpt9b2bY7NCNWxSR3IMuiuzGbdUXzAV/KEl7+J5anLiW1Htw3e20VfxXpcLFltZ6W/kbOc/BX/cVo+1Y/C7B2VgIhhEJgaIV/9E0a8lr2HArsYXJ1oUr291bjpQf5VeQDqXl/Dp4aN7rY38WN5BkIvsWnGiJE4brt9mnDtI6VnK7m+/HZXPyR8oCXLW0vBZr/sl1yNTxv3xjNComlVVGJzw4DBIFujYIS892j7GDAcgrphE+S/ZjhguR2U1gehpIWooxc1Bk2UbAWIoHobHMLQu53W1RdwjvUUGuMohVPYWq5ANXP0vkaUDpF/1j1Iu5gyMjC3SRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ETLcm1t3ho2irt6xj5DJIQK9RQubDl+Re02Os/xDxs=;
 b=f3PUxL3RH1xU+GiSapEGkUmZZSnHGTbl1LdBIsiAUIQJDC2L1ekV+xUUBeej1SP9YXdChwoYr9dwEkedTrsfKJnT7MmkEokd7lZmve9wumXU4G5H21Hm/dlCeKYRv4ONEnWsTEWdzmyJKeYmtCTwPSf+7ADuIgx9wk3327fAuEGf5vbbopQNbxOtGbYkJnmDwLCpwDNAT3Bt1Yg3luV7u3ERONBjV8eI1BXhkPlp3PZzgp65iKUbD/ewh3YU+VBzkdX5jL/5BLsCbMc5up8lEffYTsxanDfFIbBWYB+KG1gBJ6gq5kiyT8xaaFYFr2lZWJ3R2tfqP2qcgzr0NbPl9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ETLcm1t3ho2irt6xj5DJIQK9RQubDl+Re02Os/xDxs=;
 b=4pX5Wrtlq91VDO265q+LctA3LmvlM+QrbFl2dFRxiKeV7qlLwyMGrH0vv1BlIl4T/F+kKbln0V4SD1KO3iE1sQQYIAteBqERxog4Z/W0cmGVVJ/Nxz3LDCBGx/1+v3uw38Q26HUvihTfs5kgssGOqRq6gsFUhTNE7ISCbFqL7D0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH2PR12MB4940.namprd12.prod.outlook.com (2603:10b6:610:65::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19; Fri, 12 Jan
 2024 14:32:56 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7159.020; Fri, 12 Jan 2024
 14:32:56 +0000
Message-ID: <54bf529d-c71b-4ee4-a025-bda48e6ac297@amd.com>
Date: Fri, 12 Jan 2024 15:32:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] [PATCH] dma-buf/dma-resv: fix spelling
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>, Randy Dunlap <rdunlap@infradead.org>
References: <20240111041202.32011-1-rdunlap@infradead.org>
 <ZaE4_l8PzXx9Isjp@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZaE4_l8PzXx9Isjp@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH2PR12MB4940:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bbad347-241c-44dc-2849-08dc137b5e03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bicqnWwdUlDG2yli9pNxTGcY3Jrup4yx5mkB7bjWM90berPps5nT8rmssEMvCRBDLbEz0WzGrCwz0xSlPv3wB3rPkTULOj4Dg2ls6sIlHmRD0g/7fUuYIrBlXKGC3rruByK8lPLz7hV/xxgz/yzyFqSlPScCIat1OFXFNbLfWEdtTAADGeCNZjPUNJ4WFcn1ndRWMLBePKRV2C6nK7N2JwB9tDIAfMhEhSRvEvwkGwzx1N9c3nH4yeDSrG7Zop6moRd5HGvLV4gMl05YByQKXeAeDpG4Qv53YB1qVvU86clh11pJOk4E6kFAUnWcgo7hv1FyKoRNTOQfpASmrx6VSJ9RSpLthlQqVgbY/Hol0gmtLKchhEtPir8FKzF+g9LUu/2slGQSyK5abhJ2VHjQyUHNlGMfAsmXnCMh5jBWXIvCIMQlEXy5vdLj3D+Ox0FUFeVarEkB+YZwJUO6rhUKKRVx+k9gwV1tYGkQdeGw/67dN2hDGegsVo6fE9BhmF/N4uohmfB3xDxFDaAWCG4P9JpGskFD1SPA5z4ttRBuOxxZHpMxBGvfT1E91i9DPnMhBibKMAbhUdvN5ubQTZGR71jif0geTHTPvs2sp06ygKtHaduS3eK9I9TncmD+RzJ8xURBqN4DgbXXwXzwGs4mNA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(39860400002)(366004)(346002)(136003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(66899024)(316002)(66556008)(66946007)(8936002)(4326008)(8676002)(66476007)(110136005)(36756003)(5660300002)(2906002)(41300700001)(6506007)(6666004)(6512007)(66574015)(478600001)(2616005)(38100700002)(26005)(31686004)(6486002)(83380400001)(31696002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NW1HZVRYelNOREYvNmNMaStXZUJEdVY2WEdFdENpZU1NZmxvREVQdjM5Um15?=
 =?utf-8?B?cG5xSndrblliNzA0M1hkYjhaZnJLTzEwOS9Xa0RjSVFIbjRnQ0FSLzhHWi9v?=
 =?utf-8?B?NHlZYURrK040RUFIUFczNWZRODhKQ3NqekFjNWd6OXJhMmFEdWlMUytpUVFI?=
 =?utf-8?B?d0RIa0lTVURtYVAzdzdocVRrOHdLMlJKTVBMZEF0RDNFRG1XV2h4VGR1MFpl?=
 =?utf-8?B?SmplMnJkQys0Vk9CemNXRkxDcHBBb3BHclhzaWlUVVJnZ2pUVy9QcWkxa1Bn?=
 =?utf-8?B?bk5WdDBGaloyRkpyTS96QkxOQlB0VUl3dzNoWmJNaGJMSFY0cjNlYXlBQUpL?=
 =?utf-8?B?MEU2WkljRWdkb09EeE5uYm41dlJKK3RETysrWSt6YTlzU2w1ek9pOHFlVkVY?=
 =?utf-8?B?ZjU4MzgrdHYvZDdZZXljZ2wwdUlqUzNGRjA5OHp1K1dEL3hxaE5BS21zUEo0?=
 =?utf-8?B?N3oyZEpHR2FILzNsN0dWSkVuRisxMTh1bVd2d21XandGcjhOQUY2VFBUeW5m?=
 =?utf-8?B?Uk1QVnJxeVJob2RCOG1FRVp1TEo4bTg1d3h5WEYxZmRlWDd3WktEdmROakJ2?=
 =?utf-8?B?WkRmeEJpQytnQSs2Y2hlMGI2dGthc1dySnd4QXB2TmJwRU5lU0puWnp0bG1X?=
 =?utf-8?B?TkNWZW1ROFdDejRZV0pSZXFQa0FvRVdiSGExQXMzR1dBSDFUSS90RFk1c0FM?=
 =?utf-8?B?OE1hRFZrdkpoVFdhV1NURExCVnViM0h4c3FRQU9RMEJFM0o5T0FOYXM4S3Nr?=
 =?utf-8?B?bEd4eUZNU2QzdERicHp0TnArdk1OUkc2R3RrZ3laSEkxTXFLR3lmckxCZUNN?=
 =?utf-8?B?SGRzcHl2czR2WkNOV1MxUE9iVFdLaWNGUnBPOWFBN2U3bGlySVYyU1FrRmlK?=
 =?utf-8?B?VHo2akk0NnRsMjlVM0F5cllxajJ1NTFncW9rRERDTVVoMTlWWktFeDEvc3hZ?=
 =?utf-8?B?QVpmWWp5ZlNXMDRHYU8yVU9EM1BETW1QYjFud1VmTVZFWk52NDdoSzZKRk1P?=
 =?utf-8?B?Tmp6THV3SmloTjJ4UWpIcWZrYk9PbVVsN3F0ZlZ6Z3FoVjR0MytQTTB4Rzg0?=
 =?utf-8?B?OHBpT21kNUNNdXRSaWVYVk8rQnlDbTQ3Y0h2a2pTL2ZhWDEvWStsUzJQcGo1?=
 =?utf-8?B?OURsWTg5cGVMU2gramtNekFRTzJBTHVvcnFrS3l4azYwNHBpNnFHdE9NQXdG?=
 =?utf-8?B?WEtJbElseGhTM3RVblArS2NuQUp0bTQySndtRE1UMXpEdXNheW1Dc3dYQ05s?=
 =?utf-8?B?ZGRGQU9nZ1pyL1p6Q3VManloeVpva24xbDVPR1NKd251ZDg4bnhPdi85NlZU?=
 =?utf-8?B?ZDkvK3I3MWh2RHpsY0ZDdDlndi96OXZPbXJaQU5wcU1QN1ZVeGkrcnpsUmtJ?=
 =?utf-8?B?SGZXallqYVBGK0ZNQ2NQY0dMUDZ1OU9rc0hUNzlGcEh1dmZITFlxZ3ZnNkp1?=
 =?utf-8?B?cFlBNnZ6RUhrVUEzY3hhRmNUN2xteTYwY2lFZEpkQnNObEZYQktwakQ2RUlr?=
 =?utf-8?B?MGVtVnFVQXlEQ2F2c1dKdEFVR2JGemsrQ3d3SnR3TlVmZ3lwbnNFMzJ5cWNI?=
 =?utf-8?B?QXZ6YWZRTjNuWFhDS01xMGFFczNOcm9HSWRwU0QzbXVDVDlLY1creG5rMlE0?=
 =?utf-8?B?RmhkQys0RDFJT2ZoVE9LL3FwNFRENG5EV0V1WEEzZzRrTk1EK05LQytzdmNU?=
 =?utf-8?B?eithT08zdXNlSWVva2IybmErL2JVMUFOdVFUNGdINFlWZjY4NmVYTW5ESWNs?=
 =?utf-8?B?K0xYdFZkaFFYK1hGc3krWEJyTlp1U1hkMXFOaDBiUjNFZVhmUm9CU2kvV2gz?=
 =?utf-8?B?N3NvZ09WZkxzWWRqRElzbzk4cVZZdnhwdGJzR09NaURNTDJPS3U2elNCUVFq?=
 =?utf-8?B?NitnaXg5L2pvbTgvc0FrYlkxRlpjWG5UM1RMVDJBR01Vb29lbUhqTXhDWkpF?=
 =?utf-8?B?YXFKUUpCWTMwU3hGRFR4d2QrNHJUVHBqSVYrWk80RXZscUd6aWF0aklMSkZK?=
 =?utf-8?B?amYrbWR4cVNmVldqTGhKT3k5ZDZkbkQzaUwxbFA4T1ZhTU9xNzdWM0VyMTho?=
 =?utf-8?B?Qko4NlplSUJSdDRuUFRPWEFlSTlDV1ZlOWdhUVluNDVLdENQRjE2dHU2NUE5?=
 =?utf-8?Q?D7U+XVF5xjMzsdkP7jPRR90sp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bbad347-241c-44dc-2849-08dc137b5e03
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 14:32:56.0983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: saKYIOW81qo9DDZu3yRcUxqtlRAWixYUFn0WhX2ftU2oe+OlriC+LE5Q9vv+6ZJS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4940
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
Cc: linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 patches@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 12.01.24 um 14:05 schrieb Daniel Vetter:
> On Wed, Jan 10, 2024 at 08:11:55PM -0800, Randy Dunlap wrote:
>> Fix spelling mistakes as reported by codespell.
>>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>> Cc: linux-media@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: linaro-mm-sig@lists.linaro.org
> Both dma-buf spell fixes applied to drm-misc-next, thanks!

Crap not fast enough. I was just about to reply that while at it we 
could add in the other patch that GFP_ATOMIC  or GFP_NOWAIT should be 
sufficient.

But really just a minor addition.

Christian.

> -Sima
>> ---
>>   drivers/dma-buf/dma-resv.c |    4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff -- a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
>> --- a/drivers/dma-buf/dma-resv.c
>> +++ b/drivers/dma-buf/dma-resv.c
>> @@ -405,7 +405,7 @@ static void dma_resv_iter_walk_unlocked(
>>    *
>>    * Beware that the iterator can be restarted.  Code which accumulates statistics
>>    * or similar needs to check for this with dma_resv_iter_is_restarted(). For
>> - * this reason prefer the locked dma_resv_iter_first() whenver possible.
>> + * this reason prefer the locked dma_resv_iter_first() whenever possible.
>>    *
>>    * Returns the first fence from an unlocked dma_resv obj.
>>    */
>> @@ -428,7 +428,7 @@ EXPORT_SYMBOL(dma_resv_iter_first_unlock
>>    *
>>    * Beware that the iterator can be restarted.  Code which accumulates statistics
>>    * or similar needs to check for this with dma_resv_iter_is_restarted(). For
>> - * this reason prefer the locked dma_resv_iter_next() whenver possible.
>> + * this reason prefer the locked dma_resv_iter_next() whenever possible.
>>    *
>>    * Returns the next fence from an unlocked dma_resv obj.
>>    */
>> _______________________________________________
>> Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
>> To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org

