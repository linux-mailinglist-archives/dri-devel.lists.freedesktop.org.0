Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 329B978F922
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 09:30:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2803310E737;
	Fri,  1 Sep 2023 07:30:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2042.outbound.protection.outlook.com [40.107.223.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EEF210E731;
 Fri,  1 Sep 2023 07:30:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=exEmLposdMJ//5G10mQAex4ul3GtJY8RFzGqz+1w/fKckcS3f73fqfK/w1GmFca0lNR5t3/6Q1osv8VksbIyQMNxnB7h8+NQCeLoIAOPGNIIctLe3bGluIuxyTaF86gn6QVg0zr6JD4/oY1uDyf/w4yEijBLKda64/KltB+k8IU7miZ4kOpubFenpy22oeZP9Sfo4G5n+FQi5Pwn6SQu2S+xvNl36eBlCGM7Q3wNTCezki47r3762w9uxI4EDY20t+NS+lzbd7RDrUY8NVLqCHDCSV0nNF4glTBSP6BPZwAEKsZlnEwWY/7atXa5Oe5BQLEJvvlX3++wJ6MNS0WWoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RbOg+CIahOFgAaexmwhCs71vJUMfIU0180bF6FyI0IA=;
 b=H/3QU33QYSDZFQfFxtCqx49Le2J8eGRz0B8kwyWbu9kxx2zCeJgaGF0rmFsyA2r/6k2Bd8plGyC4wiuLjGhLsCpHR1tcYix8QryVG9n0aIsxvLjuUhGbPY8jMl73WinfYQxp12hvnS7gCVJ6Y8b6rs+yivTfAK2ohIpY5Ykzhc1ls85b+B3vWvTxXmEb8v4b1iwPcLuctQEu6hqVa9Uw4Ilf17EPSFiHEiMb4jRyR6nCAYbKr84K91CYqfOP2vKu0b/kAuqdgqbbjrDkgFiHR4tIWX1cM2ICxtpqLyfCdj2BbwenPrVpXHWVPAdm1cKv+7rpvCE+sP+b7Capr66bJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RbOg+CIahOFgAaexmwhCs71vJUMfIU0180bF6FyI0IA=;
 b=rPb/1SC9sHPh3SNrPm6qifZhrm/y91oA1fuy0UTku6ZVM/07Ck8urknoRK1+f56o48WAZ1wh/Tmu2eQYBJiaPMuwEJEbl/pzHdxUs6J8yGRzy3C1rkNtrx7MJ1lT/8HGgI7gW1x/yzEgK4HK+mF+loJWtyrrajoZTq6cH+J1Mz8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN0PR12MB6198.namprd12.prod.outlook.com (2603:10b6:208:3c5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.23; Fri, 1 Sep
 2023 07:30:46 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6745.021; Fri, 1 Sep 2023
 07:30:46 +0000
Message-ID: <a975bbdb-8cd9-35b2-ce98-f711439db3a5@amd.com>
Date: Fri, 1 Sep 2023 09:30:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/amdgpu: clean up some inconsistent indenting
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
References: <20230901070240.31027-1-jiapeng.chong@linux.alibaba.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230901070240.31027-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN0PR12MB6198:EE_
X-MS-Office365-Filtering-Correlation-Id: 9885ec11-6362-4a82-6d4a-08dbaabd5b20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tvwTgtuxuwOMah4Xa1WLR/LQrCEKVHzcg4twkZ+d+TRnV+NdMK3qSexVuoVHXmtcvZDn8R0vBTqG0rIphWnDcn8hr43ImGth2fmohdSxs3BnfRiZoOJX3AoCgYxtnhbGaKWACAF5V0DhVXP3drpsrFhhocowhlB+OfngRjPyIg6C1bKtoBPXZC1uIgt33FTx/D2/aJQgCbirBnEgdGrgyXhZWJCE2rwGMq45W7liuT6jdieBqN3+2z3sMnljI4ti6WacgMWYGLiYmEI73jhmsAA/JfEGvzLDivHaDCAqhy6aWA8HryZg1Pn6ztzfTEboOLR3aD12J2Yu1a/SotkYszUPXnzD7qd43cC0X5i6OwcJ8GSIKXuughhaPgwK84EZIojJB4my/h4nt5L/nFFQwx/sf3HZ8GVHp0HXYTHgsajdE6gCukacPkQbBCMKsCJ68B7ty8TPnWZW93jOw2b2iKwkcJny5O4BBQxkumJy3Gz9zIj/LW9k05YNGzGk4f3VsMUti51gbX0lyE0BHbQAzZNBcGvwn/RAnCFQEPtUQaugy01mhPsRKk1bQeoxivgUpbJRxTUrezUgTDbJvuV9b1GqZUGgU3geDDZUg4ubvSIVR34DIb8Qs3c4cal1mBVCwFAORvi0LW+aJzNvOCTRnA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(39860400002)(136003)(346002)(376002)(451199024)(186009)(1800799009)(6486002)(6506007)(6666004)(6512007)(966005)(478600001)(83380400001)(2616005)(26005)(2906002)(6916009)(66476007)(66556008)(316002)(41300700001)(66946007)(5660300002)(4326008)(8676002)(8936002)(36756003)(31696002)(86362001)(38100700002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3Q1NGVPenlTdDNwUFFGSS93Z25rRGxJd2RrWnNGMHNVSWU3QVljTmtYYkpx?=
 =?utf-8?B?VS9zb2xhbDR5STFRbjNEN0pNVlZvd2tzOFl1ek1YMmM2TXYwcWxlTmxiSjho?=
 =?utf-8?B?d3hCSUJuVnNBeWhjb0l5T0pObnVsWGxRclFiYWRScFhuUWFPVG1BSHZmTWla?=
 =?utf-8?B?YXFzNDJ1NXVNMHMrVXdDWTdXVWsxMjcvbldSUmpoQzhTMDlNZmdXZVFuZWFl?=
 =?utf-8?B?Ums5Vk0vWm5iRzdEVDljcHVSUnNjN3lNaGpySWhrRUZ4dExpcS9tdC9MdHM4?=
 =?utf-8?B?YWtJZkYwck50a3NHaTNmeFNKSnRuNTQ5V3NKWVhVVXF5YXBaalZCeVAxK0pK?=
 =?utf-8?B?WTc4WUhzN1FtQWdCSTdub0FqVVdqdDY3eWsvK0hIOE5HbkV6dWl1WGs0RHRT?=
 =?utf-8?B?L1llQXEyVDY5MGEzT3NucjZNUHdjYVNTTzlNUno5eXhmVDl1SSt6c3ZLMFFQ?=
 =?utf-8?B?eHFrRXRZSkg5WWRUOEhpR2FKY3VOa2pFYkVncTNyN1F5Wk5VcmpBUWg5cHZE?=
 =?utf-8?B?M1hjdTA3S1VueW5MblpLV1Npc3k0UlR3d0VLS1hoMXJ5NytoQ1VmR1Bia0cx?=
 =?utf-8?B?RXVMbWQwZ2hDTXMvZnVQYzVZVi9xZWhkY1NCSjNUUE51c0E3YnFZcjVjK0tS?=
 =?utf-8?B?d1F3NVY5VkowZ2NyQmh4ZW1JWEtrQzB5VEYzQnBNYkF2K0RWUkJBQnliM2Rt?=
 =?utf-8?B?bVBaR3dYa2lhVzk2bm12cFllMC9hS25SYXprRDZOYjhDNklLbWxFRWNvcW1i?=
 =?utf-8?B?b051Q3d0MGxRbk5OMktxRHFySUExeldsK2xWT2NHZkpwS1g3czBXdGQ5N1VN?=
 =?utf-8?B?YnB6RWtqd2lnRVp0TWd2dWVseVpkZ3Rpa2VMQm92SGZucXQvVTJNWklmaHRl?=
 =?utf-8?B?ZVAwY2xOcS9uTjBKMEh6NkJlbDVKUjFLYUg4YkljYnFmcGJuUDNNcDJJMnNi?=
 =?utf-8?B?T05TM3JtQU1GVWNva0w3TDUvckRRL3pmL21FWjhnemhpN3lSK1dFZHdCcVVO?=
 =?utf-8?B?TXQweXlDcnQ0SkNDV2pmSklneHlRRVk2T0ZMSzBWM3d3dEdyc281cjRaelBs?=
 =?utf-8?B?RzVFeGE5a0FCZlBZZFQzNEVZWVo5NWo5S0VVbW5HNGRuUFBVNVBVRDhQTkdC?=
 =?utf-8?B?L2N6OGQ0cEptRWpEWXdrRUtTZ0tDU1M4MHNDcS8zSFlNN0pqZ0lQbTlMem1E?=
 =?utf-8?B?L2JRNVJLaVBPWjB5UXRrN1c3U3F4TEpiVW9BWUFFVDNGdFB5aVhtZnY1N3Zk?=
 =?utf-8?B?SjNGcTREQ3p4TS95T2lsU0Z2TXM5OGR2NkVDKzVLdUdLcjl0cVNPWWhsa3BT?=
 =?utf-8?B?QzJOMGdEME1QOW9vRkJwcGlPOS9iTjVmS00yWWxjbnF6ZjFpem5rZGpNMHRa?=
 =?utf-8?B?ZndoODZlNlo1b2JGZjZhOGlSQlhMUDVSM21yY0xjQ2Zrck9HdU9xK2VQZnBj?=
 =?utf-8?B?Q0dzNFgzTnY5clJ3TkE2QXdZbitUbVdQNUlLTTV6anRqUGt2U2dkQVJVTXFO?=
 =?utf-8?B?Smthc3pOeEhTeDVxc2p3LzhqUUVMMGhDQkRBZi9iTi9tWUtWYVgvYjNYZk5L?=
 =?utf-8?B?eFBpZ3J1NENyazNwRWNBeElDYXFoOEpMQkNxY28wUWhQZy80TUJ2c3FGNkgz?=
 =?utf-8?B?NkxyK01aSkI3elJQMXNDd3ZXcDFTNEtKaTRmNzA1ZFVBUzlLZmtSZ2tGSzhj?=
 =?utf-8?B?R2MrUHBpZmFHc3VYVTVYeGx0NWpvVlJZTUFOVk8zSk5JSXdKQ0JoTTRHLzE1?=
 =?utf-8?B?YlpPMHphUVJrc09yc1ZENnJpUWNEWlZNVmRIampPbE85QVVNKy96Tm1uQy9J?=
 =?utf-8?B?R2RGK1VhTFE5RXBSWnUxeGIrVEs2eGdmdlVqODR6dER2TVIzdjYxZVlwM085?=
 =?utf-8?B?RldKNXFkVzFwYUhXSVNqWTU2MkNkdmVDK1lySXdXaUxzNHdwUGo2Q0Ztb3J5?=
 =?utf-8?B?U3hFU2pIbDh3NVRXSGdZN2VySkdLdzJBQlNyM0JpVWoxUmZQQkVzRHYvQVhM?=
 =?utf-8?B?aGRHK0pXTTdidzFIa1B6Rkh6YzI3a3JTN3FXb3QwRDhBckM1RWpXanZ5Sll3?=
 =?utf-8?B?UVlJRHZ2dDU1TEpnZTREOWtiS3U1cGwzVTFiNUxxSTNjZ2daUys5SXdaL3hR?=
 =?utf-8?Q?bgR9dJz77UbvvgLbzUwX3bgPU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9885ec11-6362-4a82-6d4a-08dbaabd5b20
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 07:30:46.0079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 32WC0RBkC4KevIlb1Ps7wwPRWzboZO1WDad5ATGRVAv/Pkub1et7hdlT36n9LrAI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6198
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
Cc: Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 01.09.23 um 09:02 schrieb Jiapeng Chong:
> No functional modification involved.
>
> drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c:34 nbio_v7_11_get_rev_id() warn: inconsistent indenting.


We should probably not have a printk here in the first place.

Christian.

>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=6316
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c b/drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c
> index 7c08e5f95e97..76e21357dd4d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c
> +++ b/drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c
> @@ -31,10 +31,9 @@
>   static u32 nbio_v7_11_get_rev_id(struct amdgpu_device *adev)
>   {
>   	u32 tmp;
> -         printk("%s, getid\n",__func__);
> -
> -		tmp = RREG32_SOC15(NBIO, 0, regRCC_STRAP1_RCC_DEV0_EPF0_STRAP0);
>   
> +	printk("%s, getid\n", __func__);
> +	tmp = RREG32_SOC15(NBIO, 0, regRCC_STRAP1_RCC_DEV0_EPF0_STRAP0);
>   	tmp &= RCC_STRAP0_RCC_DEV0_EPF0_STRAP0__STRAP_ATI_REV_ID_DEV0_F0_MASK;
>   	tmp >>= RCC_STRAP0_RCC_DEV0_EPF0_STRAP0__STRAP_ATI_REV_ID_DEV0_F0__SHIFT;
>   

