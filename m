Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 269C787B75C
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 06:44:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD1E10F65B;
	Thu, 14 Mar 2024 05:44:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rPuxXJOQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2051.outbound.protection.outlook.com [40.107.237.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F2710F65B;
 Thu, 14 Mar 2024 05:44:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mCyFqVV25o21jnB32t6JjF+p4xeRcGiD4rcgGdky1iFfN8VEh4f6tS8oljkiVOWkpmu8fvm6aeU1p5t3mNIrFL3BzYbbTsOIQ+nt6+CHNPRyiYj7CPXlr7/XaZNOn0UTS16udwllyRE4zLae5H/ocyi/USv+lB0cH6KPg7dWRQcQlbIN4q0OioZCrZpi8hDlTMdfZRis+g3IwPXXiIDC+/Hoj7yfIeY88YgFhl4VC87JKcWkSu44vOxl9MXAN9WBBshQiVmUWIPZHLwbQEmXfFBbiuALy1zNgUWuvcNZrn/1T7I3S7McAvqZgkfpGAl+A1cPwEuPt7CJuQYFlkAoPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LcdELSvJQsMQUSjePIjkBgHg65uORrS2o8N994ghA6c=;
 b=LF+eJWXJIZ2jGKUspfygNUrm+WjFgbhOCqD3II03POWzF1lnw9RuIIe/DIMSuUlPvY7msrq/MyW9/tomAYc04ggPb3sypiFOU4vTUDtMvoF7Xjr9oU563yPLZIhC14+4RkJ7yX99J3fEotBXmD2fqHgBtyohAYzQ4TKipIyi9gJWAbw3S3vJBpQEx0b6A25SY03FoGYRJKr6eVQ/Cq3CthhM60CdYwHFEwSlCsDCAmGnZ3gPbpfLiP+LA67mWKWfN1SEuFkpNUt13BBv5aINbw1BveQGWl033hlMjnVSLxVECKA985BYGpxVqoRUXvK07ehzCiIOcZWE6twgIxLXgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LcdELSvJQsMQUSjePIjkBgHg65uORrS2o8N994ghA6c=;
 b=rPuxXJOQqJtwnOAbZ9nMTV7/zrSU2O6v1TwoiT8IXoj69PRKzCv06l2Y8+R0mQFkh96Xs1kn39Ne9bXfj9QG6B57FD6uyIQJgAaVmES0+970+fbYHA/HjdHsCUxdfOTPpNM67FQoIPXyXXM3E8HTOynmsG8KRZpLZITgsNXMjE4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5596.namprd12.prod.outlook.com (2603:10b6:510:136::13)
 by SA3PR12MB8022.namprd12.prod.outlook.com (2603:10b6:806:307::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Thu, 14 Mar
 2024 05:44:44 +0000
Received: from PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6974:3875:ed0:7033]) by PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6974:3875:ed0:7033%3]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 05:44:44 +0000
Message-ID: <59cf081e-5924-42b5-a3f1-de8b012f09d1@amd.com>
Date: Thu, 14 Mar 2024 11:14:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/amdgpu: add the IP information of the soc
To: Alex Deucher <alexdeucher@gmail.com>, Sunil Khatri <sunil.khatri@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240312124148.257067-1-sunil.khatri@amd.com>
 <CADnq5_O-cyDkNLznZpvnZtz15Mi1_rkigirG80BmYJprP_udnw@mail.gmail.com>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <CADnq5_O-cyDkNLznZpvnZtz15Mi1_rkigirG80BmYJprP_udnw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0114.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::29) To PH7PR12MB5596.namprd12.prod.outlook.com
 (2603:10b6:510:136::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5596:EE_|SA3PR12MB8022:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d6a7180-65e8-465f-d737-08dc43e9d9c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Me+Jw/WndgkqyHP9HXIjkHTXqQfMQLsQUIiZBCnknyqDDj+eZ+fvwRcTliPDrd7mbsk4HshC++2XqAU8ZDEI4rWaTZvprV+B+XhsycQGtze8IztjACJPmbRsrp/dglVrpPnSgtDk5y6Fls//xwlZxzFkJzyA3SxJoUJjt+HRfXw7pMoe3PDiFFn58jtqWVNy1yWZQcjd5rgVTKX4bErw1uGUsVG4CJw0vuAyL3tPH33Bbib22yCl0JAXhAW9vk7nYHCcAf4dwKBMxf/oacR4Jg7YS8oFJxQRUmc6NpxTm2+QpdNUYsByPA21NX6y3Oi0UwupUJo5Peh6fF4vBJ8dFtKuDcAeIWG7O0J+rQbjsxiQU6QlAGIaILNpLEP9m7DU6erq91wJjcFxid6EWQQuz7IO2phWancKoCYkeXMWA7kgiE4dEseIzffJGlIVy6Efp7qL03k1Ryg2PUe68hWEdMeUU6SNs38NACdxdtgDKPwz9FNluSxf29Gh+lM8qIiKsbuKadTiVZMRD4hhssoW9r71AWp+YamBDxs1B5HNLep2r5ffqLaA6cvO/hs6Uv4S8Czqrr1k6S0rtuOoBCFG93MYxIjKWwBegRmjUUq2FOoSq6u7i7Sl+l53Br7h+C3OaKK73zWglrfpuLp4WVGmPoH7jUEAazKAK78D2veQQ2Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5596.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anMrOUdSKzVnbXdLOFZtKzFJa2FrWlJYb29vMGJxS2x2bVVWUExVSHpIcVlp?=
 =?utf-8?B?dER3VWhoaTBEcFgwTkMvNjlEbkxhTnA5WVpVWGovQW5USm9WYTJkTFc2ekti?=
 =?utf-8?B?a1hCN0l1blRsY2xOYkd4UllDU1N5MjhYYWFyemFGNUVaZEZRVHBFalNSNUE5?=
 =?utf-8?B?emVjZE5jTC8wSjF1ZEFZTURFZXBRU2wzZkFsVjI0UE9vWk4ycmZZeWc3bldR?=
 =?utf-8?B?eGZaRjVRRDEza1dJbEtWWlN4cXdoSGkrZUZZOGQ2M0tQSGxodFBHMkpRUmFV?=
 =?utf-8?B?Q3g1OUdaZ3Nic2VUVnRIVXNpbElhYmVScmh5eFlVMGxkOFRWU2pmWHJpWmVD?=
 =?utf-8?B?RlNpLzNiQTNkeVAyK3hOSjI3dU5lTXhwL3dUZURQZDJiNE1MQlRXdXBvSFRV?=
 =?utf-8?B?RWxOQm1QMTBpR0lJaWZpcEVLUzl6T3JSVjFNVWJ1QjVsSXVFS2dHenR2ay9Q?=
 =?utf-8?B?NTQ4YVNITUtESVB5dlU0Y1Q0RW1IYkJzRkt0S3FZT29HT0kzNVp2dEUzSTMw?=
 =?utf-8?B?ay9ZOG5yOCtuZjJRQ20yWGxBTkRJc1cxOXZGT3pOUUwwSm5TK3pzUTFGSlZy?=
 =?utf-8?B?c3RvT2M5WWNOODF3cDNmYlBVOStJRHloMUUzdVE4eW50QmhaV1dqQ0kxaTNL?=
 =?utf-8?B?d0dzcWwvZ3k4TmFzeHVMdVRLeTk5U1k4c3FoVlRUZkVUTTNFNlBiL1NkK3hX?=
 =?utf-8?B?YnBGK1Y0YkNvN2FUOXFERmNwMGI1S0JQMUV3ZnorRVh0clpBdSsrcXlnNDNE?=
 =?utf-8?B?Q2V4NmRURjZzakJWYTIwVzhwVE83Qm93V0pCT1NGaERpMkMxRTh1YURhVlV4?=
 =?utf-8?B?NGM4MDNiMmNJUVllZTQ2KzVaeHZTR042RmFZaXBtQWM0aWtVUGIrR3hiTjZL?=
 =?utf-8?B?QTBUV204UllONE9Zdzhwbk9GeWdDMm9rdHp3R0pLZFMzaWhHanFHQ1BuL1FC?=
 =?utf-8?B?MEVYRDBnN3g4Uk5nanZZUzFacjF4eFR6WmJIRHJDdUt5eWIrUmtaS1c4OHZI?=
 =?utf-8?B?QzU0RkJyN2JMWlRlT2lCSW50QTl5enZqUUsyaVprdVFkbFdWeExYN25YazFP?=
 =?utf-8?B?dzQ0U3JEOWVvTzFnUU1TSllXa2NQMVA4Y3d6UDdTYkg5MHhQYVJCNGNpUXQx?=
 =?utf-8?B?QUVvS2N4bGJkK1VJMWVoclBUb0h1VURUdjVwK2RGK21OZGJZMkRZRXRuR1Jj?=
 =?utf-8?B?UUVOcWxxNmNNa1pQc1ovaUJtL3d6MklSSitMcjJrR0thTTg3RCtxeGNmeW5S?=
 =?utf-8?B?d2tMWkRMTjZtZkw2Q29QYVNWSUJKQUVRWmlEdTAxNENIRTgzWGIvZXlLQ3RO?=
 =?utf-8?B?TjhsTXEyaUxqRXcrdmVQRlo4ZFZIQTh2cDZVUGFYcitUdUJVVitKUkd5MnJM?=
 =?utf-8?B?M3lsWnk4NXdOZi9CVi94VVhMelJUYkNyMmVtWmRPUjhvenFVU0FWU2pYcnZG?=
 =?utf-8?B?M3J1SEV4ZXk5NnhuVWFUaHRoUEVhNnVzMmRsVWpxN0JiUnd0aE9zMDdzQWYw?=
 =?utf-8?B?UnNIV1Z6b0toVmEzRGdZSmFWSyttUFNLMGljVERqeThWQW13TUVlb2lqaHZ4?=
 =?utf-8?B?OEIveGNvbGpKOUZHY3RHYU5xL2RRaDBRV0R2ZnlSaW9sa0MwcEdhV0VVN1hl?=
 =?utf-8?B?VHgzK2tqVnJIMXB4cW5YSEJ4ZFVqMmVBWllhKzZ2NVoyNy9iWjhWU1VBQkQv?=
 =?utf-8?B?cEd2OGNmRGp3d0FRaUpEK3pZS3F3MnorNkwrWFZkUHViS2NUb3BNcmJPdklW?=
 =?utf-8?B?b25FYmlFZXlDcEdiakxwell6WmNjVWtxd2cxdGNRc0h5Y1ZaWXMxaVNXbnpa?=
 =?utf-8?B?WVRXMnVxWDRSUWh6Qm5qeitvZ25vSU1EbjFGR0E1SzU5SWNLVVNXNkhrbkJB?=
 =?utf-8?B?VG5saWVsVkhjdkttR2FjeEtNMDdqdzFpYnMwbW5lWm5hM01YalREQ21ZRC9F?=
 =?utf-8?B?bEhtL09XTVR5dXgwMmRycFZ2TXRORS96YWZQd1VvRm8rU1lZZ1JxMTVybFBa?=
 =?utf-8?B?UGMvbitQY0JyNVMyNEJJYTA0UGFqRW12S3lpdkFNdm9iTW9VUDVlSVFBeGdx?=
 =?utf-8?B?ZjVyNkdvU2MyT04vZVVkUG9sVW8vVDI4cVJKTmhNSXBYUWdTa2FVR3N4WldE?=
 =?utf-8?Q?/25DFxOgsSjl4Zf+OW5P73A2L?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d6a7180-65e8-465f-d737-08dc43e9d9c9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5596.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 05:44:44.3495 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FwPhb3QSzHNQ6bXM7+bzfpWhdiDT6x1Fy0nMrd0s3KTu2JbsRXUxP36H7QdlMB1hyvowYCRfBrVR1B1KfWyJ/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8022
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


On 3/14/2024 1:58 AM, Alex Deucher wrote:
> On Tue, Mar 12, 2024 at 8:41 AM Sunil Khatri <sunil.khatri@amd.com> wrote:
>> Add all the IP's information on a SOC to the
>> devcoredump.
>>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>> index a0dbccad2f53..611fdb90a1fc 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>> @@ -196,6 +196,25 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
>>                             coredump->reset_task_info.process_name,
>>                             coredump->reset_task_info.pid);
>>
>> +       /* GPU IP's information of the SOC */
>> +       if (coredump->adev) {
>> +               drm_printf(&p, "\nIP Information\n");
>> +               drm_printf(&p, "SOC Family: %d\n", coredump->adev->family);
>> +               drm_printf(&p, "SOC Revision id: %d\n", coredump->adev->rev_id);
>> +
>> +               for (int i = 0; i < coredump->adev->num_ip_blocks; i++) {
>> +                       struct amdgpu_ip_block *ip =
>> +                               &coredump->adev->ip_blocks[i];
>> +                       drm_printf(&p, "IP type: %d IP name: %s\n",
>> +                                  ip->version->type,
>> +                                  ip->version->funcs->name);
>> +                       drm_printf(&p, "IP version: (%d,%d,%d)\n\n",
>> +                                  ip->version->major,
>> +                                  ip->version->minor,
>> +                                  ip->version->rev);
>> +               }
>> +       }
> I think the IP discovery table would be more useful.  Either walk the
> adev->ip_versions structure, or just include the IP discovery binary.

I did explore the adev->ip_versions and if i just go through the array 
it doesn't give any useful information directly.
There are no ways to find directly from adev->ip_versions below things 
until i also reparse the discovery binary again like done the discovery 
amdgpu_discovery_reg_base_init and walk through the headers of various 
ips using discovery binary.
a. Which IP is available on soc or not.
b. How many instances are there
Also i again have to change back to major, minor and rev convention for 
this information to be useful. I am exploring it more if i find some 
other information i will update.

adev->ip_block[] is derived from ip discovery only for each block which 
is there on the SOC, so we are not reading information which isnt 
applicable for the soc. We have name , type and version no of the IPs 
available on the soc. If you want i could add no of instances of each IP 
too if you think that's useful information here. Could you share what 
information is missing in this approach so i can include that.

For dumping the IP discovery binary, i dont understand how that 
information would be useful directly and needs to be decoded like we are 
doing in discovery init. Please correct me if my understanding is wrong 
here.
> Alex
>
>> +
>>          if (coredump->ring) {
>>                  drm_printf(&p, "\nRing timed out details\n");
>>                  drm_printf(&p, "IP Type: %d Ring Name: %s\n",
>> --
>> 2.34.1
>>
