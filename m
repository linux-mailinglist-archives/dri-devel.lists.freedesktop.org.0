Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 280DB39B46D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 09:57:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD186F5C1;
	Fri,  4 Jun 2021 07:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC8006F5C1;
 Fri,  4 Jun 2021 07:56:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S5tlwnbjHPL22haVzjpeS8KV715f92Q7uTU0wgqN1dUfre1BGOOEFEu1x3dRcYtjg21ZNx9bxD+6IAuRZym0EVj0BIq5Rdzx2KCOkK5m2lOtfcpLOEAwOEq8Nl7PHPny0NABlzreC6B5+idUPLl4G7vOPne+WmJ08LwSZZkFI2pBH+9N8om68pol4UlPpIVNd6tl4oPMyeQraioDG8TTrlzc4pEM8iHD7hqJFyzdCY/tHLdNBWxEiW89HSt7WXvNaqXe27w+Dt95eGBagfUsnDeZYiv7FXMRk4P2fmIcNPx8uIbxnUl2QUWNxObH9O0M5CzMAFRO9oilNYq/98rcZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nouoCAuuwI3hgNGSq06x7QeaswJ9IEE3Vz4a3w+AOjo=;
 b=NStV2SgKni7eTtGTuyJmvPkl1M+bZACtHZeGAjS2DuSo82PCeid1L+RfThRHWAMRHVURKV23qYXy/O69CQADvNgyWJIvAvRkl+BeB0IG0XBf7DpJCNoSHLranz/7+EIiEVTJR9kPEDadDaPDii5AJVYyD8VMjUCEf0gesgPwHX0IDDz8XV8f0tnZB1uTF8WrwzI5thsKYlKzUXsLyNoVNDqMiABfO6jJy4DyxHHX5SCb69y6UCmxuptTISusjuaqzWtOv5XYoDEttAicDISKq+L+mHu7r0nooS4UqMHsRjPL57hUUnjwjA03q+91Zf2ZLUXj3EHS871R5N7vNAwLtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nouoCAuuwI3hgNGSq06x7QeaswJ9IEE3Vz4a3w+AOjo=;
 b=5lpDdJBgNK19ExcEFNeGRvMNV9d6zat8Byy9ZTM0DAGYBpo3RZWdHFelrmHFsdPIlhH1xHxm06Kwq70kvKW59VBEUCzRHnHBWF4A3dhMZGuqF5nsKhnUktixjkoRTd1TlAFIowGBl9wouNbolRtHiedoKeiHKVFtbgzCuULe+J0=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4142.namprd12.prod.outlook.com (2603:10b6:208:1dd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Fri, 4 Jun
 2021 07:56:55 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4195.024; Fri, 4 Jun 2021
 07:56:55 +0000
Subject: Re: [PATCH] drm/amdgpu: remove redundant assignment of variable k
To: Colin King <colin.king@canonical.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui.Pan@amd.com,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210603123440.83936-1-colin.king@canonical.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <58be2108-ff6e-19c9-a10e-7ced547e2bb3@amd.com>
Date: Fri, 4 Jun 2021 09:52:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210603123440.83936-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [178.202.40.45]
X-ClientProxiedBy: PR2P264CA0031.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::19) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.137.54] (178.202.40.45) by
 PR2P264CA0031.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.15 via Frontend Transport; Fri, 4 Jun 2021 07:56:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5afc996a-e828-4826-e759-08d9272e51de
X-MS-TrafficTypeDiagnostic: MN2PR12MB4142:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4142B172793B67B1BE0AF386833B9@MN2PR12MB4142.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UHSMDBkveqVthBRXs9IrzokwZtD7yH/8y09+W49wo+EudXwE64kD02Bldmf95vCESqGLRi/aKmULjS7scEISrmU5XH1twqW2Mv/xT0LrXfByur3GyHnyIdAC9kJopYStJ4aiF1wJAwkY7voKWCIRgoHQuTVWUVvshmV3jtBNslG1VRsEPRk+zav+prA9270ftWItBzYE5jQNBTQSetQb5W0InGqhMxLudQp/TvulC9C9o9g5wPMyJghnUOT1x3ffCFdPVU/FzY2Ob41REsFaAjY43rO+vD2LA3V5RjkZ6Wtx0bpGhw4gUXN2V/+ng8+HaJR9MX0Cu+hJH2kmwvDxtI47mUgmnXumuyAUCTgPTCVDbWZX1Zq+ew0DZ76YcOEs2qHQBsCtfGLF097d5hdxv1b15MZjROw8VIUf2zTqMZFhC1zsnPDsyxfAf6owjOzRtE2RHVPlXMTqjn8r1DUNS880iYAAoKaFA7czC3jacXevZwFZX+SeoCn+7xnFd6bM0r923FUtB98FRKkhM1mk+IHI7sopO1vg8DR3WIDm/AzO1z4nviGp+Hc2kGgZaTHR6SOdUm5qQe6F+yWAkBKThvJPzSj74TXMqzhTCn6z/g9GbkBPrTUEHYE3MDrTJp2msY+oLs8I1ans0N4iN1Z8iyI/ilrMQwJfdGRAhFIhhaIjUuxHnZfcqYxhn7gfw2BWiGUG07qwz9fAOi9Gb19v0g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(396003)(346002)(39860400002)(8676002)(4326008)(2906002)(6666004)(16576012)(31696002)(16526019)(66574015)(5660300002)(186003)(316002)(2616005)(110136005)(956004)(38100700002)(6486002)(86362001)(66476007)(66556008)(8936002)(31686004)(83380400001)(36756003)(66946007)(26005)(478600001)(129723003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cEF4ZDhxU1JERnFKUURuZWFFU2pNK0xhYnRQRDhFVVhjMkg1amJqVlhNby9B?=
 =?utf-8?B?bjhmcnpxUHd2Y2dncXhENktySG9ob0pxbDQ4N1ZRU0FQZy8xZkZmdkp1OHBo?=
 =?utf-8?B?dVhjZWF1MG9XU2FHN3VRRTNhcXdUbjRTSTFBanNoakllVWw1LzlBZ1VCQlVj?=
 =?utf-8?B?Z1ZVMUtqV3gxNDJiaWplQnc3QlVNUGt6OHVMVUJ1eHBHTkd5Y3o0blpWWTNt?=
 =?utf-8?B?L0szcDNUQWo2M2NVY3N5ZCtVVlBpcWxTU0pBU3YrUk1HUVhnV1d6cUF0bjlQ?=
 =?utf-8?B?MnUzUFczeDNidHFMUlpaQVRseXJvYzBVVC84ZTNDdExpUm1wZk5ZRFV3cXQ1?=
 =?utf-8?B?MXFwVVhmTzI0YTY3SnU1MmpROCtaQ09CeWdpbjlWYmJGOUFQdk9tL240Y0Qw?=
 =?utf-8?B?S2VyOTdpMHNyQWNhakpHcW04TGNXM05EbDdtSFEvMlZ2Z3lnYk14cEY5NXRS?=
 =?utf-8?B?S1N0VXcxQXhkUXMvWEtRT1VQa3BJaGxRbWUwLzZWclRoL2pPN3UwTGxjWUxU?=
 =?utf-8?B?SWhCbXMwM2UwRi9sNXk4WUxoU0VmS1Ywcjdyck02ZkFteXhaMlJHeHhIN0RD?=
 =?utf-8?B?anM1dG1qMzVHZFJGNEN0c0FtUjBLTHBxTDVMaGVkOWRDbi8wcVhrYzJhZ0sy?=
 =?utf-8?B?bDIvMGVPc0pqenZmd3ROUFFxNU13NEJNR0hMWHA3dktqVThTS0lVUEIvZ1Bj?=
 =?utf-8?B?UHVTejJ3c3Vrd3BBc3dKWi9RaUdIQmpTUUFTREU3VGtFdk1SUXBEbGRiUHc1?=
 =?utf-8?B?Zkt4ZU5JV0dHV2ZjUDUzazRJRitWY1RSRVVCcEt6ckt3Z0grRFhoOVJBZnVj?=
 =?utf-8?B?Q0hmWWE4Sm1LMFp1UzlNODNic21WWGh4QTFqZEd3Z1MwZDg0QXBDNWd3bmtK?=
 =?utf-8?B?c3ZNTmF6SmVsazlJc0VVcCtUMU1yaVdOeXgyOEZvQ3c5NXEwMHpScXRGQTRM?=
 =?utf-8?B?LzhjMmJQRVZIejkwMEpEQTZ1TDZCOEcrT01MUzd1Q012WVhWaUpRc2RVcnNp?=
 =?utf-8?B?U3MrYktMVE1ESWFNbzhsZHpQcnI5VmFHTGNnNVNjNGVFb3Q5ei84MUNyaUNL?=
 =?utf-8?B?MTluT2llZXdZQUpDRlNZVklIWWp1OWx5NjJvQUJJTXlOSlBnam1uYnpPRVRt?=
 =?utf-8?B?d3c5ZjlqSG0wdzV1Tm5lZ2RMam90STFVeVB6bGdUTTQzYWNPODRmVjRaY0JB?=
 =?utf-8?B?amdEYmdXMnFJK05jaGFhbnNGQzJWWWhtMis3TkovR05mRDd0MzdkNlFFeUx0?=
 =?utf-8?B?bk9QQjRJekJ0Ti8yZ1MvaThVY1F1V3hkVVlRdnVJNmRSeGd3Y2tkYm5wbk9G?=
 =?utf-8?B?em5kWFdUNkJ5dEdmN2lWTHBNb0dKbXFLTVBmaTB6L1VpakhjdktWMTJEZlM1?=
 =?utf-8?B?MkQ2bVNYYUFNMW93RGowNmx1dTVtVE5YVnVxbk5vaGVLamxia2RRM1dZejIr?=
 =?utf-8?B?dUZIVjRBV0svNENZZ0FTY0daMXJiMG9Ubjd5WUV5dVh2WUp5a25jMzF3VXc3?=
 =?utf-8?B?dW9EbzNZajYyVG0zNWZremdOVm5lWUxFS1VqT0JUTElrTXI1L1F5dmQwaWFn?=
 =?utf-8?B?Qzd5bFBNa3NBbFcrSE5PKzhiTENHQlp3aXVCRzJieXdpZ2dMZGxIL1BBbVVV?=
 =?utf-8?B?aS9pczJRM0pkTkFUYWw1TjFOSXkzaHErSzVibUMyRGhSMHFTL0hmUGo0cUVl?=
 =?utf-8?B?ZE10c3pUdCtZTVk3d0c1UktZZEloYUNINE5sd2l5bnNkVkZtU0h6UWxGRTN4?=
 =?utf-8?Q?ndxYf6S4aI6evqrwzNf1Wc8bBlSoPr651/fnX6Y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5afc996a-e828-4826-e759-08d9272e51de
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 07:56:54.7296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IdL79ywZMXRX+4QRLkw/hsd/LPP64O2q6KH171lnpfzywZvJHrkgYM0mRvOfpP3C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4142
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 03.06.21 um 14:34 schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable k is being assigned a value that is never read, the
> assignment is redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 2a7bed66d50b..f545dc1248b8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -278,7 +278,7 @@ static int amdgpu_amdkfd_remove_eviction_fence(struct amdgpu_bo *bo,
>   	write_seqcount_end(&resv->seq);
>   
>   	/* Drop the references to the removed fences or move them to ef_list */
> -	for (i = j, k = 0; i < old->shared_count; ++i) {
> +	for (i = j; i < old->shared_count; ++i) {
>   		struct dma_fence *f;
>   
>   		f = rcu_dereference_protected(new->shared[i],

