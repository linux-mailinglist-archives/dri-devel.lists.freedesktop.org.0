Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE96E476BC2
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 09:19:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D6F10E55A;
	Thu, 16 Dec 2021 08:19:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2077.outbound.protection.outlook.com [40.107.243.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B864C10E55A;
 Thu, 16 Dec 2021 08:19:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CITH4PwQfkT9OlqxlYV69DDDr0OGzWlyXm77UD7rwb7qL6T6AEuD9PEB3SD614Xaxuy0hsLfU9sy2YvtbcP2K3bYnQumXNcSGdF0fCL2DKqsk9f1QcfcCsJcoUcFbdSgkkxWthuZjppx/lQN+7yzFB8gM+T8qykMd/S/GTq6+6tiyjFPlsoZF0KL/29z2+/eJHaO4HbzMWnwCSAweQGpE7DW4QqC6G07iD8dlMNfRgWjYoK+AXaRQLkhdBfsaI661TYCnpHCwrzXkQOZxUm9amXpLkTLRT/VnsidXhYeZfUKgLzH2vHxEWMaUngI2NS8m7rmvpa9fGq/LkiI7y60xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9NS9ji2oy3ZSdfEqAc1CxuuevVLUKi0g5r+GdAnp2v0=;
 b=WdUvC9W8NqcaUZKDSNtoEPWLDEp1uGyJjQXgwK1EM0ptP4nN8RvgddutVcGbl47MjfKeqltx0CxStPNegrxCiy4pYrVVgr6e+4EGa/oAabHFf/EO5F1ACIgSmLJz0Eectmp10hS1MYcSY/cGjCswJGICQwDJY07kPdKFhx+q5OTYWgTshSaPvn8u6ior3fIptI/L2K6+zgGo9kZHdrniAteIU0h0c9yUH0Uj/m2KRihGfMqt/RbGgluz5YLshXa78ZIy/Okbjzn6vi8yFr4N3qzqngjqqeqEYYwr5hG2+mlu5nemqfNwVrRVrG1L+KrCu16wnKOEY1XE4dEcHw/ZdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9NS9ji2oy3ZSdfEqAc1CxuuevVLUKi0g5r+GdAnp2v0=;
 b=OtK1ougweRMaluHUZlH/m9GRkuaOQVO9+9xaPESMKcYZjOgW07TcpmBL3UoXKNLTtjrv7wfOHAfkq23UFNe28B2XucbS911bpmwbFpAfe4O3sO5U4w1NvI+BCkhL2uDFjrAorv6aJ43I/e4TXN+AIIVjIOhtkHPpdlOMdSn7cz4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW3PR12MB4586.namprd12.prod.outlook.com
 (2603:10b6:303:53::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 16 Dec
 2021 08:19:15 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4%12]) with mapi id 15.20.4778.018; Thu, 16 Dec
 2021 08:19:15 +0000
Subject: Re: [PATCH] drm/amdgpu: fix mismatch warning between the prototype
 and function name
To: Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
References: <20211216043937.138522-1-ray.huang@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <75a66c63-bbf8-41a3-3ba5-cfff4928b7cf@amd.com>
Date: Thu, 16 Dec 2021 09:19:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211216043937.138522-1-ray.huang@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM7PR02CA0009.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::19) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 380ab36e-943d-4666-7d5b-08d9c06cbf30
X-MS-TrafficTypeDiagnostic: MW3PR12MB4586:EE_
X-Microsoft-Antispam-PRVS: <MW3PR12MB45860B7D6B17D8A2F0374D2F83779@MW3PR12MB4586.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YRVGgA44j1oxg57E6d/NGE9wyp3BCTJ+lKynVRspTLimOJO0lc65xmP66xUAODdLS8wbpQtn9h4vnRjYBQ1gzVFU7gG9SODVg0lU8KurxTpV+kDAGbdphlnme+R+qTocq3cBZAxm7ouwUXGn0AJg1NuSOmlKozbJk6Q1qv14YHJmhfHOBNU2rvlBFsalSN/8d9EsMvUG9oXZLxOUqh2CeI6HjV0wIthwSkEfNd3vtrFhFF5riBgnlawEzCYuvqGoKSGxRNVhgfxoW+LigO0xhshzqKDThJbT138+g2EOr7Kkx60ih8344fRGs3SLuey3Dhg6sPnTFCOFzOE0DFJdPPbkSZZRjjlJi1jZD/XRJaMT+akd3wGQouUWL60VoDcy4tL0evR2I5G5jUYZKkt//MshO8gd2mk2Hn7cXP8nQDv/6TtYth/0n7OacUt2jhnnpOfrKIibeiCsLNp6gmTpEF83mXM7hHPRPyMhke5fwnXqrrmmnI3xy3NpN14KQQckBaZg2c3vni8EzHJgjt4C5wWpwPoa5QDVAIcaQXuHQ+GQEO4kz+qRPHKsuPfX5SzC+PLWtgClZpRwq00Hifef3brqDMddktRwUaFYoU/uV8/rlg2OigJ4ydkgkH9rB3s/bcdJnV1ywZtPlbWx9ITn8KKbTHsrOp0vXVTOQgdrDINHTWZgKCFacEPRHfyD+28hwmnq89+G9J9ckzZxk0kimcJi+rHF3iD3Wtt5f0jWpY5cfax5GKvu219M8Exn/CMEFr4XSi//6nutSPso6qaymkg6Rirq13BKSLKiKdQmKFM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(186003)(8936002)(31686004)(36756003)(508600001)(31696002)(86362001)(6512007)(6486002)(5660300002)(6666004)(316002)(6506007)(54906003)(110136005)(38100700002)(4326008)(66556008)(66476007)(66574015)(83380400001)(26005)(8676002)(2906002)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFhJRkR2QVczNnVCVXgvUERIclFCSGg2YUV6SUF2eFdWaG5UdTRFazl4bmhl?=
 =?utf-8?B?TmVFWFNiOElzY3VqNXB4TnJtWUdjWHVsZTZxY3V5Vk41VTVvWWZ3YjZuWGdk?=
 =?utf-8?B?L2NnQTBzSC9vWnI5NDJvckdRSkJ5aUpTYkgzVWExd2RUbjkxeTh1SUlDcDg2?=
 =?utf-8?B?M3Jiek5uNEdzcGxTaWt3dWs0ZTZvcWk1NmxhaFNqRkt0cS9iTUUycFRkMXhH?=
 =?utf-8?B?LzhmR1h2eVRPTjJLVEtNREFXeld4UEZ0SmpraEZmd0FvQXNaUFR5Wlp3Nkpy?=
 =?utf-8?B?R2hYWlJUYVRuTnpaaTdRQk5xL0ZzM1Q5ZFZFc09RZFdhb2RmWHhkSDBnN0tn?=
 =?utf-8?B?Q3prVGc0RC9Qa2wzQ2xsL0p5OUtrODV4RXNFdERKNnhVUHpJSGpqRGFodkRY?=
 =?utf-8?B?eEJ6ZnE5dVk1RHBxREFZb1VDL0lZaFVVMXhLdkpnTEZXRnBia2ZqdzVQN09j?=
 =?utf-8?B?OWM1Sy82Smx6cGhQc3NOcUkvTXdSNUZlM3FNTHpOeFhBVkVUL2hwMldwMmFu?=
 =?utf-8?B?MUF1UURlb3phb2NKMU1ZRi91SnlJSDcrS3kvVkk2eENYT2xZU3hEcjlxU2Zz?=
 =?utf-8?B?alZCS3Z3SytlOEtCVVpGUmxvQzVHc2ZVZnBRbzd1Tm9WUnhPK1E3Qi90RGd3?=
 =?utf-8?B?MXI3SEF6dXk5ZHl3VzQ1Z0c3UmtTTnJFZXQwOE1pbkdaMjkwQjJDSUpld1NX?=
 =?utf-8?B?QXUyOEZSRnpxa1B4V3pINE1ld1NGQXlWa2I3dllaRlB5MGZJU2cxU2FMazJX?=
 =?utf-8?B?aFVBTGRlZDVrNWpwdlhrbGdVMnlzc3NKMHNrdnJFQkpnSk1Xb21HMFUwekkv?=
 =?utf-8?B?ejh4MWhYN2NmMVFROSs1bXFyeERxdnZjdWRIV2hjaUNIaTFtTkNwbGJvcW03?=
 =?utf-8?B?amtoaEIweGRJZHNnTzlTbFJTR0diaDV0US91QlZXR3VTeE45UXA5TWVuWUtk?=
 =?utf-8?B?UkRiSVBTQjdEQmFnay9sb0dGeFQrWWQ4Y3kzT1ZNYmw4dXo1bVBnMlM2K2Fa?=
 =?utf-8?B?TjNhM08wM2o4Mm5zbDdhMzluaEVFTkJacDZITXU2Zk1NaXI1NnpqOWR6dkxt?=
 =?utf-8?B?UEs3clZUTkhGcW13VERUMjE1RUpYbVpMbDVTV3NkRlk0UGVBVGp0bFZId1Bp?=
 =?utf-8?B?WWVucVRjVlRiVUN2OEpqRytuOHNmSmxpM2xCWnRHRGhDVmVmNjdKb2NTUndz?=
 =?utf-8?B?eWNiSytOUEV0UXpxNTNHbWRFMERwSDZ6ZHY1QWx1OEJVbmNrMUpOL3pYL2U1?=
 =?utf-8?B?Rklkd01RaFV0ZGFPaFBqNy9LeUtNb2ZGRTVHRnNtUjNjSW10NmVVb2x5Vm1M?=
 =?utf-8?B?UExzaWNoR3psaWVRL05SWUNPVFJmbndCRjlDc2d6Z0JSWXNiai85MFFPcWFp?=
 =?utf-8?B?MnN2ZWdKZzg3TDVlaElTdTBzeVRkM3lPLy9FdGZSTmVQMHJoZUd1SGdmdk5y?=
 =?utf-8?B?aGRsNVRlOGE3QlRFM2pzOGJHY3NTUFcxYmtmdFFwUm51a21WV2xNZEREUThG?=
 =?utf-8?B?NkY2Z01lNU9iYWxPb0o4ZnB0T3ZQdGgvNDV2OXlHQVc3RTQ1RXZTaVJMK0NE?=
 =?utf-8?B?cW55dCtveXlEOUFYbU5yM3RqOStXakEyN25JSndjMjR2a2tJRUh2MlRtc0FL?=
 =?utf-8?B?VWFORTExQjk5Q3p6RnE2TWtUdlhtMnROanpBTUhtMjZHZFNzZ0FKWlBlem1r?=
 =?utf-8?B?ejFST0p2SlYrSWR1QW45UVkwZFBWSm5vWGpHcTlPemhkTHFnQ2pIRjRFZVEr?=
 =?utf-8?B?eFNXUjhZZlFoNUJSNU5nZE01cDFGQktoWlU5amxEQUh1QWhDOGZLV0xDU29F?=
 =?utf-8?B?dzlRU1FETFFkNldGTURNTTlFSCsxVkpUZzE5OVVsMC9TWG5SSmtucHNjUFZo?=
 =?utf-8?B?a2JKTXdoRFY5b0ZxR0gvbWo2QWhqTzVjSkRYdHBQWHRhQ1kraFZMc05VMlJw?=
 =?utf-8?B?M01YRGVMZ2xQanlReW4rTDAzTUhEeVZYWDBlekxod2xXQ1IxVkIvcnlvOWR1?=
 =?utf-8?B?bTcwdytHSUhSMmhEd2EzbDJLSG53UTBtM1JQSEJzdElISzVhcnk4UEVxVCtO?=
 =?utf-8?B?WDhaSXZBMDNKRFJuekF3VFNISkNGdXBuejJ1LzZvamlxT2hzajl5THd1NHNV?=
 =?utf-8?Q?Z1e8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 380ab36e-943d-4666-7d5b-08d9c06cbf30
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 08:19:14.7752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DPsTtQtkZ/Y3VrslqsGSeSKVKOeij+3SkXO7zKXbdqXUbghGj3IHVuRPBaC5mtSp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4586
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
Cc: kernel test robot <lkp@intel.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Monk Liu <Monk.Liu@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.12.21 um 05:39 schrieb Huang Rui:
> Fix the typo to align with the prototype and function name.
>
> All warnings (new ones prefixed by >>):
>
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:631: warning: expecting
> prototype for amdgpu_fence_clear_job_fences(). Prototype was for
> amdgpu_fence_driver_clear_job_fences() instead
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> index db41d16838b9..9afd11ca2709 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> @@ -622,7 +622,7 @@ void amdgpu_fence_driver_hw_init(struct amdgpu_device *adev)
>   }
>   
>   /**
> - * amdgpu_fence_clear_job_fences - clear job embedded fences of ring
> + * amdgpu_fence_driver_clear_job_fences - clear job embedded fences of ring
>    *
>    * @ring: fence of the ring to be cleared
>    *

