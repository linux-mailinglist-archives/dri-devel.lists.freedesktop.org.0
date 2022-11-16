Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3044562BD49
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 13:13:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056AA10E48F;
	Wed, 16 Nov 2022 12:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2086.outbound.protection.outlook.com [40.107.244.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B021A10E48F;
 Wed, 16 Nov 2022 12:13:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DYZ6PGB7tweMChrHVvZKRqszuoV196k7MLoYeLSME70mdAaDkpR44bU9mpLqJpwZhL2BepwrCajVi2LNUJMuRIRK57JRVNSfeE9vzR3WuWvVKx7h9VE7V3R356s0keNs6l6QQ9Z85RRJQqLXIa8EsY6bCO/+kKCu0WFIN1ZKXyR9dQoSE1iH2ykBcs/43AsMMtmw2ZyItb0wQmd6RngQFaA2NJYl72paVXYmd6V8ZnY8LYcbvU79bDbrBZWSN4H8RhDb/m9NGpzLrYPtN5aPGS9qNkF5G89RVzoBgcv+nxqhNs9d4N8b15JZYpKR364npQt0fGAAwR4Y5Eelx2SJuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPbMCdTqJpBuh41Rp5qZJKYAWrx9IoUJwtsv+4yt2lo=;
 b=PuT+lOdh01rXRszX3mrzFshC+CZDJO46QWNM8kE2g2LVCFAKsMJbHWQ/weqyt5fgKWSvm2JOzyZoYKCxDeNoFALOhi0LoL0lRme15gU2aQZRkuV7vIx7/x9GnHZH+2SrFT+tTaM5WrSOUObbBxLkFQMYcp7nteONvN5vsT32QUXnSo1GYXX6UkC4RO/0pgRAYmU9+fJBo3l6Q+E6iR+GCALzuVeH/VWWiLD6XxU3MLhN5s3h1dBBUO/BQ98bQdJ+tay3fqIysrNH7pGqNMZjwKuhCAs4sZPnndlDIVXusc21eUXS86tlFEDMPwwiLasP0shbPXXjV4E/IMmvakxzXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EPbMCdTqJpBuh41Rp5qZJKYAWrx9IoUJwtsv+4yt2lo=;
 b=yzUoOPciuOwdmqJN02H9Z0ma6sxBlRyqRewLazKsI0bZaEISxSl0pfgFCu1CG4dkRiBuYEYR21xWoaZxM9ZHC65qfjbSfi3yjACskHulM8HDv5XSPi81m+tnRivtVrsPigIlAU5hrCLHrvRHuoQmxR2YUYBdhCo1uupoII3vJKA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN0PR12MB6368.namprd12.prod.outlook.com (2603:10b6:208:3d2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Wed, 16 Nov
 2022 12:13:13 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5813.017; Wed, 16 Nov 2022
 12:13:13 +0000
Message-ID: <b40f9be2-e76d-5860-bf95-e02d0ce1ddee@amd.com>
Date: Wed, 16 Nov 2022 13:13:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: linux-next: manual merge of the drm-misc tree with the
 drm-misc-fixes tree
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
References: <20221116104752.4c64495a@canb.auug.org.au>
 <20221116112515.3f01531b@canb.auug.org.au>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20221116112515.3f01531b@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN0PR12MB6368:EE_
X-MS-Office365-Filtering-Correlation-Id: c0aba084-0643-4308-c1e4-08dac7cbef74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l7SyLgWS4HANjhgciEOcSswd8439txRKJrCV/iUK54RXyVeE5viH8Um9END0wCxszUXIEpqzqKJnIsIMLIVbIq7aAg2GJUhwmUv4geABQ/75jclDvemp5Q1O+975PQcPAE14Aq9YYikP4DqCxA6NYErFxYQTmQSPxfoBKREveICq9ZwTde+mZ++TegvTf/pWhsS7y4brH9XLb43Z0XyewuF0hxWaDDnpCjm9bXPIrMl76hAoKHuay65/dI6PN6XfZ8GdXM9fG3J98Imhs2pPbUlP+DpVw9eJQEq3gUDgATK4ZpJZyU8nPHbhnBBb5+zQ2TAuktRrFYOB6AALm/pvnfhbJFsrXlNmRsgX5qJlIS3avrBOwe6O7ARPoKvtCYyZa2je0OX1DmuKMew/fcBV32MzP1IpExvQ2j3jespIGqzMzZea9JH/kchqcu60ko3xOEZLgJMO+B6TxGkVkzdbQxWfuG5sLqS2xvHBcRsqYLV9OFIeaEl+AjBaOi3r2BqxGrTS6B7rUrRswnU8azwIBPCVYH4xiLaJoD2vI9omY4fH+WhySaLWawpbJ3nkARY76r4YQHimbMa27rLCxx50NqWp1DXpgLPAfHv0UFRWQ3vUpCZVJgb2SIJjwtBkLXgiWhDmlkBN9LzfknUhhOUZwm/tBQMOHTXOOGIxNIoqb6sbaGajPdtdeC22izsCZ2lXLGD9+0zaEX94r9IM63lxxnme1o1MENQyCsNhFOt1x+fylWJ3YtBDxxro4A7Ok+xS83IGhEZkpBUBz3ybhSl7coLMvnuhOD3btg1LlQzERc4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(451199015)(36756003)(31686004)(86362001)(31696002)(38100700002)(186003)(110136005)(2906002)(6512007)(2616005)(8936002)(5660300002)(6666004)(478600001)(6486002)(66946007)(66476007)(316002)(41300700001)(54906003)(6506007)(66556008)(4326008)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3U0czk3WmQySWFSa3pMMHlBWjJDMFBBeVdTWnJIUzM0Z05GdHlJbTZCOS9p?=
 =?utf-8?B?MlRvRzZnMXlCQ1l4L0tjTnhqQ2dyM0ZMMXQxNFVGK0VkZkc2cXV2K3htOFQ1?=
 =?utf-8?B?ZXRTZXE4c0Vjeng3V0NkNDF3UDVETVZCY1JEbkdRekowWXhuRFZ6STVseHZq?=
 =?utf-8?B?NmlIdU5TOFcyK3NPdlVhZnFzYXJVNmtDaVhWSUFxaTlDaktRR1E2ZnkwOWQw?=
 =?utf-8?B?V1BteGZ2MVBhTUFoZTFlUHgzU0dlL3JvNENGMmZyOWNkT2dzSVhrU012TVBt?=
 =?utf-8?B?YlYvYVZjSWRhMWRqQy9GYjFtNFdNMFh6bElRcGFqK3JSMWc0bjVOa0RFc1lo?=
 =?utf-8?B?NXRCVTVlc2NyYk1tKzRWU0pFbDNmOGNWZWRSdlpMS21yM21hSWlhY21vbmw3?=
 =?utf-8?B?WHR6ZzhLdlhXRFBkRXNEUUR3Vmgxb0J2MlpRbmdHZUhVekQ2REFCQ0svQ3pH?=
 =?utf-8?B?d2g0MWN0NzRMVkh2OUVySzhIejIvQ01GZEp0bGJ5TWF5dENLVGhBRml2eEZ4?=
 =?utf-8?B?NytDZkx0aGhIMHQ2cUt0NVBEbjhTWFJZY1pCMVhtcmhuSytwM0szWGNKeCtD?=
 =?utf-8?B?cTA1UWZuT0t2SEdBKzR5alBic3l3SXlWdG8vKzJEOTN6WVVUd25PNmlSNDhI?=
 =?utf-8?B?bzdrRlFHN0RUajl3blpqV0IrMFJwbzRITUVJY090ZTNhT25oWGhPODJXUjNW?=
 =?utf-8?B?ZHNQejNmUDVQTldLUzFPM2x0OHowb3A5dGk2T2VDRkZkT2xsK1NGUEtXd0p1?=
 =?utf-8?B?VzBqbXIvN1ZUWHIzMHhGL2l0S0t1ZmtYaE9ZNUxXVUxKMGxVSUlsamJVKzJD?=
 =?utf-8?B?aEZod0thWkU5Q3FsdkcvMjNQQUZmcXpPcWpPOEwrWEd4azV4VTB5Zy92eGs3?=
 =?utf-8?B?eXM2U29raVpSZllRd2x2TEs4K1cxWlJQd2JaQzZ0MkdmdElOZy80ajVWbzg3?=
 =?utf-8?B?bDhDMTIyTEpBclhMblpoc0syMHlxeWdscGIzVjU1UTVhNkE1ZnNVSnJkWnJy?=
 =?utf-8?B?MVRxSlVsZ3JCSFk3cTNubGpTOVFMcDBueHlUV3ROZEFYVGNldXB4RXEyOUpi?=
 =?utf-8?B?SjVFb2FJaE9SN1ZXNlIzanFOamxlR1AxZEdYN3NMOHoyakRtRkMvaFB3UFFM?=
 =?utf-8?B?eS9yaVM1T3hGMVpTRHJIVHlSU1crbkZ2WXJkb1lTdUpDSTdCRWRZTnFIajhs?=
 =?utf-8?B?L1drWVRCb091TEwwQ0V3bkI2NDNnUmsxZk8ra2VDWmtZZThTbExUcDEyMDEr?=
 =?utf-8?B?L1NUdExnTXNQeHp2RXRSNys5NVhiQzkvVkR0ZHdjN01jR1ZBMXFRaDcrT0Vy?=
 =?utf-8?B?WmVEZjFMZDF0eTFFeVgvVWZ0WDhSTXFkOGc3WkE5T0MzbnV5eVNDMXVJaHlQ?=
 =?utf-8?B?dU52L1MwUnFObzdiUkxBMnQwNk8xUmJRRHcrOWFrcFBkaXJTd1I4UkdCRWdI?=
 =?utf-8?B?bkhNMndnbGhXbkd6WTM3M2ZYVy9LMjNlMFBJSFBwZjlWOGpuY1dQNTBLR0Fk?=
 =?utf-8?B?dWY0YzZnRXhvQmhvN2c3ZFYyR3YrdTM0UXZhOUtVUjdJVDBLQ0lzeFJpeVZV?=
 =?utf-8?B?aVAyUmZNWDlTVHpIQ0ZZUGNhM1h2UW9CSU5qczhBNDJlQ2pJZDRJM01SblJB?=
 =?utf-8?B?ZmxIa0NBUmxkYzc1NWdhenVSNWlDUzlYZ1pOTFNBYUZ4dkJQVDZBcTYySmE4?=
 =?utf-8?B?QTRSZ2drMUsxcHhyYUFJVWoybTZ6V1V6dVVKam8yS20xS0pabnQ4UjhvV3JH?=
 =?utf-8?B?S2x0WXM5ejh5Uk5GOHpiUTBENnpOUnNpZXlaVkpRYmNKeVRQWnMxbXJDVnZD?=
 =?utf-8?B?TmoxbU5LcjJxWEt4TU9HOVZwRUZkMW45TUtPdnpZUWVMaEFnVkRQUFVhYnpE?=
 =?utf-8?B?MDYwd1piRmxZZytUZ3VzOFZxcXBGeWg1enowN1BRZ3N5QURwa0VDUjYzUXc5?=
 =?utf-8?B?dnZzZzh1ZXVuRzFWN3I3bmRDdWZWeVVjMzdiV2lZMU9PZGdpaUlMWS8rMjVK?=
 =?utf-8?B?QUZLSU92Skl6Qm40eGp1K0g3R3h0VTdLL09wVk51eHQ5ZlpHNnhKTFNRMDds?=
 =?utf-8?B?V3NSZUthaDJubWU1d3daUWNEUndyTDFmWWJUUHFweThjVCtkVnJ5RnlWMm5S?=
 =?utf-8?B?aEdlSFpoMWo1SUpNN3ErZXBiYmRJaFZMZENuZjJzREpnKys1N2lVMlloVFlE?=
 =?utf-8?Q?farlZeDQ7gECs1jgHqMbLwg3bt4ZHtwpgcMsaP0XJLhN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0aba084-0643-4308-c1e4-08dac7cbef74
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 12:13:13.8228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xhauxm0m/O1PWkiX3E8bC+aFJbRZSf1GnpmaVxdlzu9V4MZ5e+C7sX88v82P2Hxo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6368
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 16.11.22 um 01:25 schrieb Stephen Rothwell:
> Hi all,
>
> On Wed, 16 Nov 2022 10:47:52 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> Today's linux-next merge of the drm-misc tree got a conflict in:
>>
>>    drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>
>> between commit:
>>
>>    eca13f3c67b6 ("drm/amdgpu: use the last IB as gang leader v2")
>>
>> from the drm-misc-fixes tree and commit:
>>
>>    1728baa7e4e6 ("drm/amdgpu: use scheduler dependencies for CS")
>>
>> from the drm-misc tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
>>
>> -- 
>> Cheers,
>> Stephen Rothwell
>>
>> diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> index de5cb056c9ad,0528c2b1db6e..000000000000
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> @@@ -1197,10 -1201,7 +1203,10 @@@ static int amdgpu_cs_sync_rings(struct
>>    	}
>>    
>>    	for (i = 0; i < p->gang_size; ++i) {
>>   +		if (p->jobs[i] == leader)
>>   +			continue;
>>   +
>> - 		r = amdgpu_sync_clone(&leader->sync, &p->jobs[i]->sync);
>> + 		r = amdgpu_sync_push_to_job(&p->sync, p->jobs[i]);
>>    		if (r)
>>    			return r;
>>    	}
>> @@@ -1241,14 -1243,11 +1247,14 @@@ static int amdgpu_cs_submit(struct amdg
>>    	for (i = 0; i < p->gang_size; ++i)
>>    		drm_sched_job_arm(&p->jobs[i]->base);
>>    
>>   -	for (i = 0; i < (p->gang_size - 1); ++i) {
>>   +	for (i = 0; i < p->gang_size; ++i) {
>>    		struct dma_fence *fence;
>>    
>>   +		if (p->jobs[i] == leader)
>>   +			continue;
>>   +
>>    		fence = &p->jobs[i]->base.s_fence->scheduled;
>> - 		r = amdgpu_sync_fence(&leader->sync, fence);
>> + 		r = drm_sched_job_add_dependency(&leader->base, fence);
>>    		if (r)
>>    			goto error_cleanup;
>>    	}
> Note that I had to keep the declaration of "leader" in amdgpu_cs_sync_rings().

This and all your other merge resolutions look good to me.

And sorry for the noise, drm-tip somehow doesn't seem to work any more 
and we had a lot of conflicting patches going in through -fixes and -next.

Regards,
Christian.

>

