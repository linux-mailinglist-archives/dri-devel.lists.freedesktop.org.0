Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AA0459620
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 21:34:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 700B289B83;
	Mon, 22 Nov 2021 20:34:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3295789B83
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 20:34:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWmm/seV+jg3yfwBz3aP8aH+F/6y4StrHLgZA59IqKTGdGBCoZJphGrrW5N3K8rhoprhKaQKVdavz6wHutgDGl41fmQz/7JXrUzipl13MT+EjJkdG3UtJWGJUsVQS9dYeoGmJbMECYwhIHbFPJga2d/OBqP6ZQFnrajVmGwIghGYNLgZ6pNH8+Fotc9jpWZwa/glilwTPUr9aZntyCnlrK3qszcmvhdECchKfTO8TFQhqhT+o7yrMpzbnuH4E9z5VwskE87H5DCqQMDO5ijcG0PXiGnpL4DEhai/Q+Q1e448osU5AZEFUpQqrI3sT4Z6sIRR9cnJNlb6XiMdtQlsmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1iN0ItMREgQjIIwzvIWVq1bIIKuxj1dlg6WoytN5bE=;
 b=KIeSBuDjOZcMQwPR6a4dGoGD7JgaNDgAByd6LrecXmgP/SeXDYbRc0SelwqstXX/iHKT9VBKPRj+DVWkVlgD3yj17OxdiYnP50bzR7NnwIV4EMQlq3DhiSN57XVEfmwOUIGI+tZvzFr9gds43jwgBsDEA8x+AddrOWI0Fm3rW4tXoctkQ8YEZoxF9w5Az9wuZRUxXWhAeAYi3WQWSG/6sx3y8NmSOuDHZ5yhxu6HxENKhEKUiGUPID+0gSCDLIuki66QoW7S+N5YOJaUWaQ/WhieT5VHNY/DdU/OTz5i2+y/kEcmFipWX2cioQZjA/ZmhEHoQjaNXPun7cvH7k/6Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1iN0ItMREgQjIIwzvIWVq1bIIKuxj1dlg6WoytN5bE=;
 b=McecedliWIl7jUyzKIEG2Y72tnM6g0R3BG47QRZe96n8nbGMXs6V/SbMAnw7qtpVzIaUbXEjig+h/r+L2QNMFuVE10ma0u5858NrtdiR5SDZ62FY6gLS81pEsL9A5WSpJ+z3BmWDeC8cvZ+d6rrjyNOI+0KE4u3jy5weCfKJSeA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1774.namprd12.prod.outlook.com
 (2603:10b6:300:112::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Mon, 22 Nov
 2021 20:34:01 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4713.025; Mon, 22 Nov 2021
 20:34:01 +0000
Subject: Re: [PATCH] drm: ttm: correct ttm_range_manager kernel-doc notation
To: Huang Rui <ray.huang@amd.com>, Randy Dunlap <rdunlap@infradead.org>
References: <20211121155453.29736-1-rdunlap@infradead.org>
 <YZsLJOUUBMnBUCu7@hr-amd>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <bf091e6e-3add-c335-85a0-95e9a93a19a0@amd.com>
Date: Mon, 22 Nov 2021 21:33:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <YZsLJOUUBMnBUCu7@hr-amd>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM5PR0201CA0015.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::25) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:9825:a518:b616:5ab2]
 (2a02:908:1252:fb60:9825:a518:b616:5ab2) by
 AM5PR0201CA0015.eurprd02.prod.outlook.com (2603:10a6:203:3d::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Mon, 22 Nov 2021 20:33:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9f14d3c-ea96-4172-776f-08d9adf76a85
X-MS-TrafficTypeDiagnostic: MWHPR12MB1774:
X-Microsoft-Antispam-PRVS: <MWHPR12MB17746FEC28D41C1C7E02C2F1839F9@MWHPR12MB1774.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vox2Q3rIxwDWHsTeLwr1loIAkPQiBc6RuZYxSn1PZLwdydZGEwW1U4zkHwUxVlaoY5Ggi5AfuJI/JeWcBr+JcRWjSS+ChbbOeKwBm8jDH9BAojY2hKNpPpI04o8h/qJ9L77llG42GmRJL5uvPuAPmFNCblGPo9xJsVbn2oZpuI8tJ0qjGU9IcgT0167b2iygdWRY9SofiPvMaX1PLnwVi0+EL6atMBR3N1rexl3Wk2RfbSVLKfMo/iVbIaed8FSlhBu2CSug+pATOgi5BBWbq0YgUj2r26feoaAmzvIAg+DpAeaso7/WKMRqYtqaQeX6aEGXwmamPsHDuTyPJD9sUpSuhNpkofZdSHUY/NdCL3DBEtcxLWuakgnA/37e3pxikxACKrbFSCj6FC68r9kQilFLymlubbeB91ojJE35jEZ4gATcS1LHHOCiNpsvRa8iJ5q5zZGLidKfwBNMHNnmXNoISltPcwLJrIxSBb856Wtfz82Jd+ozXXJVrEYjsX8ljYrH8QNzMNDRcjJsu1Mw4g5n4NZuCpwZ0yEJFkmjcfVldWoiQfg5yCqEA1/srJh40TMqwmej/AN4lsY8briqgXI5WED7G3IiT1x6wfHAB9HBi/+wriA+bgZnaQb19RAuS8t5Xc2V40C7K170/PuYPINQ+AysfM7IU962RH10WEA4HRsTAfmEP1QPyVuEpEXv0K4RuKWYPpkMCDLbFiJi5lswc4BNCPFt7qIVV4WXW0VVkqABZowGSrCQNEb9SOajO8iAdES0T2daY/SnxIYBxTWc+TElaU/CHJuP4YmjA5BlCRXbPj+s4hkW938ORzLy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(86362001)(2616005)(66574015)(84970400001)(186003)(54906003)(6486002)(6666004)(508600001)(83380400001)(110136005)(5660300002)(36756003)(2906002)(66476007)(4326008)(8676002)(31686004)(66946007)(66556008)(8936002)(316002)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlN5bVY0UWt1bGo2cWtCVk5DalI5MW5IZnp4bi9BNStoZ2VxeVRKSHM2eHly?=
 =?utf-8?B?d1ZEZE9OaThDM3pBcDBkdzhQWG1QbHczV3o0Vjd3QkZzMGlvZk52WGFKeHQx?=
 =?utf-8?B?aVdGdTFnSTYxU2h1UEFXb0lDMUxna05LSE1DMW5rQmRRbkhESmttODN2SUp1?=
 =?utf-8?B?VGZzeXhwSThxeUpRRFAxb0J6VWVxaTV5UXNpeFYvb1NTam1kVVN0L2hKSUhp?=
 =?utf-8?B?UVNMd1MvU2tyVk85clVtVE16VXh4N0p3WEhtRHorTTBsMnNqaWxkWmVrZ3hl?=
 =?utf-8?B?bk1BU0RuSGdVb2gyQ3JKVkRwZ3FIQ1ZUVEZxWVpEN1EzM1Z4S0xxUzBtZGMz?=
 =?utf-8?B?dXJiSUV3WmUyMkJGbXNzQlA4VjgrUEh0R0xtUGlyY0F6bjY5eDJSU2VHWWpM?=
 =?utf-8?B?Z1hycUZTVm1UcXBrWjJ5OGMzaUdqWm1hNkNlcUE5M0FncEVoaHVYWEl5ekdo?=
 =?utf-8?B?b1B0WXN3Zk1TRXMrcGtqSEpRMVRMem1HeFdiUUpQM1RxTGErU0pwMFJqeGZF?=
 =?utf-8?B?R1k4ZDI3T1pIOXRKVzAwcWdIQjdsVzlSUGwyY3NRbUR0OHFLdjVjSE5FSmhK?=
 =?utf-8?B?dk1jYVczOHppaENOTnlhTEN4NWtlaGdnWHRraFU5aHZDYWlFSUZtbnE1Yjh3?=
 =?utf-8?B?KzJ4R2lraGlGNW16WWtPd1RZcGx4ZHZQbllhcjRNK3NFUjYwUG10MEFIYTd3?=
 =?utf-8?B?djRaUlZzZlNVUGpwd1RBbnFBQ0R1UXFZMVVFa0pRdDZpN2labWNWSEhTaVNu?=
 =?utf-8?B?ek9qZzQxMlNYTDVrT1JyYVBEb0FwajNYZXRZdkJXaDNVTFdjOU5FVlJpNXdt?=
 =?utf-8?B?cVZTNnUwM2t4RWJORXM4MGtNL3pyRzBrdDhpSkx3Ny92K0pvKzk3WkVTZnBu?=
 =?utf-8?B?N0owVDN3RVpjVHFhdjR6SEY4SVg5K3FnYnpLOFMxS25td2JQVDYwdzNtVTk2?=
 =?utf-8?B?NnVKRHBzMGRJWm1QVStNVVJYTkNGWHFINTlSMzNaUU55QUJzNDBQNDBCbjdG?=
 =?utf-8?B?SnU5d0JKckd3dElZZWhHUEdTV0tCdEhSV3F1WEdKOXI3RGNMNDI0Wnp2R0dp?=
 =?utf-8?B?a2dLUldId0xuTmtvSkF4c0wzMDdWazg4OHFNcU14a3FOaW9JZWFKTWVxQlVT?=
 =?utf-8?B?OGt5MVlHQUx0Sk9BSU9jWERSdHlWdGs0WDRxaHZqVE1LcGJ4OEphcVR1WXV0?=
 =?utf-8?B?TVZDcmdqSWlRVEMwYk8xbHZ3QXYreHYvMTMyUGFFZ3RIamFxaVJWTFNGQmRo?=
 =?utf-8?B?QVY5UG4zanhsQ2UzMjhZbEZIWnFkTG12ZmcxRWU5d3ZtZWRvV2lJT24yQ2lG?=
 =?utf-8?B?dGg2Rmx0RUZ1azI0NEdSSzRwb25ZdEtwQWtXMVBqZGprSW8vQjR2NzM0akw5?=
 =?utf-8?B?WjBJK1lXNk5LRmlKWU9jSmpQaU1QRGI1OUNpQWZYV21CeFdlbFRUNTVVeXlP?=
 =?utf-8?B?MEVkZXh6VHZSVmt5QW9hUkV6SUY3cHhJcUZSemRSd3pkY3hPS0l1ckgrZFly?=
 =?utf-8?B?a2QxSVNEMHMyY2kreUcydTJFQ1JaMlVhYmVJVHM0bXJDcEpKS0JDMmJKbXlW?=
 =?utf-8?B?cWJzT3ZmaE96UC92N2xwbnB1MFpEL1VKaVR0NEtIYUNjcmNONG1RUExTOEZK?=
 =?utf-8?B?ek16YnBhOWRtaS93QzhJV2NtcWVvYlFTb280Y1YwTDdWWVBYRDRyNFVqZnVU?=
 =?utf-8?B?aUVyYkpidU44TjdrUXB6YzJ5Wk9pWDNSMmJkT01qaXpyQi9iZFB6WkJSUUZJ?=
 =?utf-8?B?LytCRkNjOTBmclFDSVBISExBN3pCMEhBbUFuWkxpUlFXZXpMZ3loR2x5ajlR?=
 =?utf-8?B?Qnl4MGszQzJ3cURmSjZpUWpQNCtxdlN2YU5icDJtOGo4dGtFYzJmWFExUnM2?=
 =?utf-8?B?ZzNTL0FpSTZPRHZSM3VRVmVRMFFETnNVOFdDeHlFWXhhbTR5T05uVVpDSFpz?=
 =?utf-8?B?UEpTbVJLTmdYWVVhNXFPVk9KOU9MNlFIKzZGR1Y5cHdVY0FmVkJEUDZ1bzl3?=
 =?utf-8?B?VkZDME1naWh2R3k4YUNsY3N1blZKYkVZNGd2QjhIVlI5MmtsZHREeE1WUDl0?=
 =?utf-8?B?M3NNQk9XTUZZN1NLZkhPRlVRVmdnTTUycHNZcVMwSEI1NTBiT1R6SkorOFF1?=
 =?utf-8?B?eURSb0tGR1ozRHVua3ZHOWxZM3ZVNTFjakc0MnpiTU9LTVRrRFA5bmNCMkwv?=
 =?utf-8?Q?AdxHmuq4crupJFwrxrfXoZ4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9f14d3c-ea96-4172-776f-08d9adf76a85
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 20:34:01.1981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yRrY4FViXTVn5I1bNu/2lb0Fur3xx3u49vgS0NmNzZfC9e37DilosGh8eMk+//kt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1774
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.11.21 um 04:14 schrieb Huang Rui:
> On Sun, Nov 21, 2021 at 11:54:52PM +0800, Randy Dunlap wrote:
>> Fix kernel-doc warnings in ttm_range_manager.c:
>>
>> drivers/gpu/drm/ttm/ttm_range_manager.c:144: warning: expecting prototype for ttm_range_man_init(). Prototype was for ttm_range_man_init_nocheck() instead
>> drivers/gpu/drm/ttm/ttm_range_manager.c:178: warning: expecting prototype for ttm_range_man_fini(). Prototype was for ttm_range_man_fini_nocheck() instead
>>
>> Also fix subsequent warnings from scripts/kernel-doc.
>>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Huang Rui <ray.huang@amd.com>
>> Cc: dri-devel@lists.freedesktop.org
> Reviewed-by: Huang Rui <ray.huang@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com> and pushed to 
drm-misc-next.

Thanks for the help,
Christian.

>
>> ---
>>   drivers/gpu/drm/ttm/ttm_range_manager.c |   11 +++++++----
>>   1 file changed, 7 insertions(+), 4 deletions(-)
>>
>> --- linux-next-20211118.orig/drivers/gpu/drm/ttm/ttm_range_manager.c
>> +++ linux-next-20211118/drivers/gpu/drm/ttm/ttm_range_manager.c
>> @@ -128,15 +128,17 @@ static const struct ttm_resource_manager
>>   };
>>   
>>   /**
>> - * ttm_range_man_init
>> + * ttm_range_man_init_nocheck - Initialise a generic range manager for the
>> + * selected memory type.
>>    *
>>    * @bdev: ttm device
>>    * @type: memory manager type
>>    * @use_tt: if the memory manager uses tt
>>    * @p_size: size of area to be managed in pages.
>>    *
>> - * Initialise a generic range manager for the selected memory type.
>>    * The range manager is installed for this device in the type slot.
>> + *
>> + * Return: %0 on success or a negative error code on failure
>>    */
>>   int ttm_range_man_init_nocheck(struct ttm_device *bdev,
>>   		       unsigned type, bool use_tt,
>> @@ -166,12 +168,13 @@ int ttm_range_man_init_nocheck(struct tt
>>   EXPORT_SYMBOL(ttm_range_man_init_nocheck);
>>   
>>   /**
>> - * ttm_range_man_fini
>> + * ttm_range_man_fini_nocheck - Remove the generic range manager from a slot
>> + * and tear it down.
>>    *
>>    * @bdev: ttm device
>>    * @type: memory manager type
>>    *
>> - * Remove the generic range manager from a slot and tear it down.
>> + * Return: %0 on success or a negative error code on failure
>>    */
>>   int ttm_range_man_fini_nocheck(struct ttm_device *bdev,
>>   		       unsigned type)

