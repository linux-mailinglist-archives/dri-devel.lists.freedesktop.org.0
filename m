Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 169CB4ED558
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 10:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 875F710F5FA;
	Thu, 31 Mar 2022 08:21:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062.outbound.protection.outlook.com [40.107.244.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E8510F5F8;
 Thu, 31 Mar 2022 08:21:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TpqXMe1X8AzPuchXF4Y6qSVau87LZf4fYNEWxcpOe175I8PTRxuMQpaP/5RPtfmgox419Y4w3Y19UhrRrVQDHRbm5h+lxubZGvgHf2yg0JR1de9DprwIKqnu0+YFFzQYQlZQXmmWaiKVpRRYj0QuDT2JdUgE2MAa5/Z1QGm5WCHeFzsaGVEW8XaxBVRb+ECUC2yAWQ61XytLiIrxpBPVF9r8JedFcGXG+QpJHGQceulbjSrPQvkMZuRr6wxff8o8eYao7yVIumcJWxY2XI9cxwHRzvbYUoyIgScYzQx1ICIDOIW3avwpv77MKxfCDIWJ7Ogak9FMZDZXY8pBZK2tJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GaUWyRgE8KF4NGQYwWh+0WMCC9JiopnkT7StbJIrogM=;
 b=IB2e2n+5tPCJx3R4RQ0CyuBjzzX69hoOW8tPaktxAf6ZAZfhF8/f4Rx4/MsJNjEq9FStDFD/SJ/pxS8OhvPgZYPnGGfGxsQSo+UM/y2P3SwlQlNmvnSszra/BoPtSf2xnm1iWtdNychQ+TKwKAVAhP5A4cNevvQxgFsfgOLQcVFrOuvQ5zbs+oRtOa/FfHXyrhLwHtxJ9XHXuYzoCQ53kT+Bd5lyRzF+mRQPyVwTEtatpg3FhITE/z0Cg1ROU0pvgBLwmdJAbHTwjrNdPDiHfAWRNrfG2sXJsfvLs6WvMhHwibuhugJ0VKuzB8B5U0eemqfYF98AkLkpvYq5aaMHkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GaUWyRgE8KF4NGQYwWh+0WMCC9JiopnkT7StbJIrogM=;
 b=dafVAHsBlq8BBSpGvK717pVwR9/SH8rqCTb7P84kN8QgIIeRssGp6M8kSi9jnNY/LSjF7SyCt0B3BaAdpCoxPUrpW0ES/m5efZFvsAdGU2HUNO9OVelpbDl+FjmTPl4WtfnSr4uSoaeG1Eb++6FP73MgxlMy5odzcp7L3xOUpIM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (20.178.210.205) by
 BL0PR12MB4915.namprd12.prod.outlook.com (52.135.46.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.16; Thu, 31 Mar 2022 08:21:06 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5102.023; Thu, 31 Mar 2022
 08:21:06 +0000
Message-ID: <afa8f35b-88a0-236d-6740-e36ce12c851b@amd.com>
Date: Thu, 31 Mar 2022 10:20:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: drm-tip compile break
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <87o81n9ikg.wl-ashutosh.dixit@intel.com>
 <d3d90c7f-b3a9-e81c-c97e-b40ee3ee5baf@amd.com>
 <40ccaa09-42d3-37c0-65cb-5b5eabe8d706@amd.com>
 <20220331081529.4gsfd6diznsjzfay@ldmartin-desk2>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220331081529.4gsfd6diznsjzfay@ldmartin-desk2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR04CA0063.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::40) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a7ee697-cd79-4d9f-46ba-08da12ef66f5
X-MS-TrafficTypeDiagnostic: BL0PR12MB4915:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB4915AB25C43CE8E061ECDA2683E19@BL0PR12MB4915.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U98irttYLGYa+d7xFIw1bROftYjyuL43nVMLMcNk6e1eyIuEV4rOYTTCDkeNOzBJZvtHV8pY2au3Du1Q6NbD4FyEjNqzWym2lQvzPaJci36ubZuUc8Wx0qoxK2INAGDbtdYFyE3VMwFbwgYd83dOV+YPzQZ8nsltWbJucLak6MRG0XLnsSM/ZjO9oiiSD3rhSpHex5wcvsp5UbBCmWabiUeT2JA8cIRTXacqSgzb3cilwS9ZJY7E2NLHZbU/E306KqFNV/Reh421nG5AMKOcyXwKcR582srjNIMt0DaLk64WwrAHyrjuvAnT/eg5YVLeaIY9Wpox0wabXzyZtKBYtvcyhUySXVUiwiVbEEQ2OPrt4QOlierKozGVFVVBHHCg++VyZdPzlTPwCDJUiILAyz7uyuguLILnAFuZtdOs9DEX4W0bhd6nvrEgQ/zTGqGCyqnazHZzB6tR28ZylgYCSX3okdEOy9aGCXyZNHoJul3rphnvSY8me3rj6tLTxkQ2PbW0t90dXnffcNsiSja1ItOjSaQQdZ+VZuAzyFcparzKTEdKC3i9loz8Ow56Dxuy39HDa5omk9hND2rZ85P6RUKiD0Qs01RYMmbOT+NPxo+k7tKYhlL/QCdGEvEUrV5qaA4Ppe+USmXOvYgFn1w3+LkSVQSguCm7EhS3UFtcWjsq+XkScUwqoBCqf0SVQvFWfPIbOUhvggId1booHxKcouvbRVuiaDYvwC71Z4Z/XsWh4rGxzOQ4zohntvJ4cWMq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(6916009)(86362001)(6486002)(966005)(8676002)(4326008)(45080400002)(66476007)(66946007)(66556008)(54906003)(316002)(31696002)(38100700002)(2906002)(83380400001)(31686004)(6666004)(6512007)(6506007)(2616005)(26005)(66574015)(3480700007)(186003)(8936002)(5660300002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cU10U2QrNFQrcjdaZThkVWhNeUg3Q3NiczAzT0p5ZG5teHd5Yi9HMGhRTXNz?=
 =?utf-8?B?N1ZtK2hXalFQY2dlSGU2NnN3d1IrVCtmVzdxa0lETEtYcElFRmtUSUMrMWN4?=
 =?utf-8?B?blRNUnFyMWxLMENXWXpHWGZyWHZQSW9wMTVJYXM5emxTWG0xNjVKUkR5YjVO?=
 =?utf-8?B?V3pITDF4ZzhqQzgxL0RtbmZRUFVSTis1SUxZcmdnUlBocjF3NksyaHI4Z1JQ?=
 =?utf-8?B?ZFh0TnRPLy9ucDBFbzlYbUFhVzg2RisvYjJmM3J0U0h3UmYydVFsWURtUEJH?=
 =?utf-8?B?dTRubldXWWVrQzNnQ3dYcFVJV2pmYzlQcWJyQ3J1MC8yNkNwMVdIN1JpeHBo?=
 =?utf-8?B?c0d0VEVoR29pSWl2RktlRGJ6UlkwK0FGTFdSM0JjRjBrdHFOWFZtZEJJVEVE?=
 =?utf-8?B?ZWZOWDdRTkMzZGlQamlBZGgwKytxdEZ4dXR3Rmpmc2grSndWOUVXb0hRSFo4?=
 =?utf-8?B?Uzd2cDdnZjRWV242Z0FVbTF0ei90c0FUdDBtNEtGVlZ1a1p6UEgzTXJqY2Uv?=
 =?utf-8?B?RGRIWG9Hc01yRVh6UmNOS0JPWUd5WmxWT3pIaGxWa2FJUnJYZkdFRlNwLzZY?=
 =?utf-8?B?QVlCR08vQW53OVpHVVRZN0wzbm04bnFkY2VYQnNtSkFiSEhmZ2I0L1ltVWVq?=
 =?utf-8?B?VmtvbFFSNG9TbHNGYmNIb3ZnYmd0ZHYwT0I1MklTWTdjSi9wekozWkxNVjB2?=
 =?utf-8?B?YVBXS2dpRzY0QmJaTDd2OVZiR0U4cjE5UXk4R2tUMm9qb2NQbTZvMFpvMzJ0?=
 =?utf-8?B?VDRpVU8wMU9IeVJ2RFc5S21EeWU0dG5uZmlGenpWcVlrQk5zdTRtU3E0OFlX?=
 =?utf-8?B?bEpwVWZYY1V2dzgzY2lKd0lzRzRobC9ma0RSSThjMEV6YitXUlZiTnR2U1ow?=
 =?utf-8?B?cE5jREI4SVA1N2phMnh1N3o3blZUd1hzeU9HMm9XRE1KM2RZcm90QVdpczdm?=
 =?utf-8?B?RURKZUFqVXI4MWcydDg2bHZYeExqQnIxa05MQ2c0Rng1czFpNHMzeDJqSTRj?=
 =?utf-8?B?Ym1HUXgzK2htOEF4ZFBPSm1DZlpWUHVVaGFLb3VXZFlFV0x0czFxT3pkR2VU?=
 =?utf-8?B?R0QvczZycDZGamJaTFU0SHVtMUJjSm1kVS90b29SL3V1ZVptTnR6T0VzRDFl?=
 =?utf-8?B?dHhlbDRGR29Qc2FVQ2xQYWVwdWlsa0tOOWhGWXFJaGtoVnVtL29JdEtTOWZ1?=
 =?utf-8?B?NGlYU1FQeHdKVEVrc25TaFBNT3Z3eTNYQ3lmQ3BVM0U2V2h6K3hpYnlSeWJr?=
 =?utf-8?B?K0xvbUhrbTJ6amM4Z0FUcEFTK1JIU0E2bFdoQkZNa0xZTUdzb1dnaEFZeFVx?=
 =?utf-8?B?b01NdjBKb0lJRlA4S1VsVUJKSU5OcjJDUEtIZWxwVXhoREM1MVlQUXdIM25m?=
 =?utf-8?B?c0xVeU4zUzg1amI1Y1lJZWRKa3dEbDdjYjBVSysxZjR0eGdoZUV2RTlUR0Nh?=
 =?utf-8?B?aXRHKzM2VUlmdExpY29VRTl4Y2s1NXFaMSs2cFowK240OGhGeHppWEpXVzZo?=
 =?utf-8?B?NVQvQndzNlkwb2ZDYXgvOW92azFHWUhyNGZCd1NjZDJpaXdMWmNLNUhZQXFw?=
 =?utf-8?B?SjRkNUhIbU9wNW01emhSVlNobnNaTEVBc1pzMGxHRERlZ01SWUlLKy84TzF4?=
 =?utf-8?B?NGl2YXJJem5JcjBEVjFpdnRhc1g3WUdCVkVvVFk4MEkyUXBGcG8yVnJzRWNk?=
 =?utf-8?B?WkNZeFBROXkydit2cHJRUWs4d1QzQmxWbmlnZEVhd0FmdGFoUEsrY2d1VVly?=
 =?utf-8?B?RU9oNUtITVlhK0RJcU8xbXl4L0piYnlBKzJsemVSVHJEYW1oakpOY2JtZlB2?=
 =?utf-8?B?WDZMZHFiUUhnYzExWVpIMzNmZThoRUV1cjZkL3pPb2RxcjVNZndaQWZZRE5x?=
 =?utf-8?B?N2JLNTNycFNJaXNyd0FobC9ydGFEU1ZkRHlQRXkyV0gxbU94OU9vU3BTcWFE?=
 =?utf-8?B?dk9BN3lweVg3eHpscytSNzNCQmNsbzRQTWJUOXlHZ0tvSHFzdHhXVWRJZXZa?=
 =?utf-8?B?YmlCTGtXMXV5KzZJc3RKN1paQXpKazl0RkluYjFBUjJ1MGtMR01LanBWZWhs?=
 =?utf-8?B?VnZBNmM2UTlaS0tYcEllbzZ1TldDTERZRDVFTnNCaEhUUHQrUHZQeHIwa2wy?=
 =?utf-8?B?bzJralliQThwaFdYZmp2SnF1Sk44Q0c0VmtPRnJsSTJucExPejFWUnpGMDBs?=
 =?utf-8?B?cGJTS1lrbE1HdnBXVjhaNkMvTkZiaXgxMU84VVc1Vlp4QzF1U1VaWEhSQWFK?=
 =?utf-8?B?MlJUb0JXWE5Rb3JQUlUwc3dXM3U0ZkdWNjc0S1pmMk5NSEFkWGdxKytSZUJu?=
 =?utf-8?B?NkJncUtqLzZxcDBkZHh1Umh2T0RyZjd2ajhWcEJGakZ6MzNPTlE2dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a7ee697-cd79-4d9f-46ba-08da12ef66f5
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 08:21:06.1899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RAs4U5Q7XTy4Ywt9cRdjLFNHP621Gl/8brK3+ZuEP48Y2RpN0Nfy+hdoRXUIS54V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4915
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
Cc: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 31.03.22 um 10:15 schrieb Lucas De Marchi:
> On Thu, Mar 31, 2022 at 09:35:50AM +0200, Christian König wrote:
>> Well the fix is trivial, but somehow rebuilding drm-tip always fails 
>> for me while merging drm-intel-next.
>>
>> I probably have somehow messed up reverting the conflict resolution. 
>> Ideas?
>
> It looks like the error is in the wrong conflict resolution in
> 629041de3a0c M─┐ Merge remote-tracking branch 'drm-misc/drm-misc-next' 
> into drm-tip
> you'd need to redo the merge (-i) after telling git
> rerere to forget the previous conflict resolution.
>
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdrm.pages.freedesktop.org%2Fmaintainer-tools%2Fdrm-tip.html%23removing-a-wrong-conflict-resolution&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C7b9d9727a7314f7a9a8d08da12ee9ee2%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637843113330258383%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=y5KjOfpLsu%2B42zDUZmKlkOFNHiAsjHfNPNMEVeZ9wLI%3D&amp;reserved=0 
>
>
> it's also useful to use dim -i, to make sure we can build on each merge
> afterwards.
>
> AFAICS the revert would be on 141577c6d0bd ("2022y-03m-29d-09h-01m-04s 
> UTC: drm-tip rerere cache update")
>
> taking a stab on it, should be like below. It even builds,
> but I have no confidence to commit it.

Please go ahead with that, it looks correct to me.

I somehow messed up my installation so badly that even a "drm 
rebuild-tip" doesn't work any more and fails to merge drm-intel-next 
with a conflict which seems to already be resolved.

And when I try to resolve it once more drm-tip says only "Preimage für 
'drivers/gpu/drm/i915/intel_pm.c' aufgezeichnet." and doesn't seem to 
remember the conflict resolution.

Any advise how I can fix this?

Thanks,
Christian.

>
> Lucas De Marchi
>
> -------
> diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> index dd78402e3cb0,68494b959116..000000000000
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> @@@ -200,17 -187,20 +187,17 @@@ static void amdgpu_gtt_mgr_del(struct t
>    *
>    * Re-init the gart for each known BO in the GTT.
>    */
>  -int amdgpu_gtt_mgr_recover(struct amdgpu_gtt_mgr *mgr)
>  +void amdgpu_gtt_mgr_recover(struct amdgpu_gtt_mgr *mgr)
>   {
> -     struct amdgpu_gtt_node *node;
> +     struct ttm_range_mgr_node *node;
>       struct drm_mm_node *mm_node;
>       struct amdgpu_device *adev;
>  -    int r = 0;
>         adev = container_of(mgr, typeof(*adev), mman.gtt_mgr);
>       spin_lock(&mgr->lock);
>       drm_mm_for_each_node(mm_node, &mgr->mm) {
> -         node = container_of(mm_node, typeof(*node), base.mm_nodes[0]);
> -         amdgpu_ttm_recover_gart(node->tbo);
> +         node = container_of(mm_node, typeof(*node), mm_nodes[0]);
>  -        r = amdgpu_ttm_recover_gart(node->base.bo);
>  -        if (r)
>  -            break;
> ++        amdgpu_ttm_recover_gart(node->base.bo);
>       }
>       spin_unlock(&mgr->lock);
>   diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index fc4563cf2828,28f5e8b21a99..000000000000
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@@ -375,9 -375,7 +375,9 @@@ static void amdgpu_vm_bo_base_init(stru
>       if (bo->tbo.base.resv != vm->root.bo->tbo.base.resv)
>           return;
>    +    dma_resv_assert_held(vm->root.bo->tbo.base.resv);
>  +
> -     vm->bulk_moveable = false;
> +     ttm_bo_set_bulk_move(&bo->tbo, &vm->lru_bulk_move);
>       if (bo->tbo.type == ttm_bo_type_kernel && bo->parent)
>           amdgpu_vm_bo_relocated(base);
>       else
> @@@ -2660,12 -2597,9 +2606,12 @@@ void amdgpu_vm_bo_del(struct amdgpu_dev
>       struct amdgpu_vm *vm = bo_va->base.vm;
>       struct amdgpu_vm_bo_base **base;
>    +    dma_resv_assert_held(vm->root.bo->tbo.base.resv);
>  +
>       if (bo) {
>  +        dma_resv_assert_held(bo->tbo.base.resv);
>           if (bo->tbo.base.resv == vm->root.bo->tbo.base.resv)
> -             vm->bulk_moveable = false;
> +             ttm_bo_set_bulk_move(&bo->tbo, NULL);
>             for (base = &bo_va->base.bo->vm_bo; *base;
>                base = &(*base)->next) {
>
>
>>
>> Christian.
>>
>> Am 31.03.22 um 08:28 schrieb Christian König:
>>> I'm going to take a look, but need to figure out how to find the 
>>> broken merge
>>>
>>> Christian.
>>>
>>> Am 31.03.22 um 00:33 schrieb Dixit, Ashutosh:
>>>> Is anyone looking into fixing this:
>>>>
>>>> drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c: In function 
>>>> ‘amdgpu_gtt_mgr_recover’:
>>>> drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c:200:31: error: ‘struct 
>>>> ttm_range_mgr_node’ has no member named ‘tbo’
>>>>     amdgpu_ttm_recover_gart(node->tbo);
>>>>                                 ^~
>>>> make[4]: *** [scripts/Makefile.build:288: 
>>>> drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.o] Error 1
>>>>
>>>> Thanks.
>>>
>>

