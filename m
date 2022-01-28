Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A52D249F26B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 05:22:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8776010EE90;
	Fri, 28 Jan 2022 04:22:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39AEC10EE75;
 Fri, 28 Jan 2022 04:22:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=offwHOdO8dgqso4uu5iyI5rBCxkxhFwIypO9jG5jc5H0CesMgKu18qjPSU77cxjT5bJks9N/GlIGCj8yUVlqwQ2rUK4g7Lbk3y9S/1naKhNz/KHRfvnAYJaf0hFabO23h3BAZwIr3ZlWFowUjn8MIM9s/Manc2gio5jG1fp6mqL2Hahwp3siGulcNZI4sU5sNWdZ0BLyTjDmSsYYZR0JPDqQxwWNRxzrTchtKtc2j1J4JbElPOILNqzpkKj1ZJWAFXgk6dwnjNp6s+AnDJIJBQNJJxcGrYozVrzC4De0Rbd215k+uvGkK8XCVG4113Kyo0jrbaQ4neJQaPQmANDnQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r7L6u2K8eZ75PMO2siHSA5u+/ZNEcZxqXp5abnQ4OzU=;
 b=dCMumPxk4RSDQXmPIvk6W7FqQwQnyCvJX0487kKj90gL3Ok7Iwr1zA4UngSfUmfFCAs3TH17UZSKHLvyDPyGKZ7xyNH5Wp+UcRSN37n7andsvAPQ+XNkB7K8LrpmJwAhYWZHiv0pLoGAt67/CGwCWBlvlUDsPW5fCK0RuOGWIuYSfsfkZ+NqszCihMww4EOA1gSfAEI3J0kzYsV39LtYvcL9PNT/YwPlKygSjhkD0dDOOXQ2mAgqgWcOujrbuQfrs+gWjopeHMITrC1oXNsh6MzyoJzUFEO2ND7R4X/tS91I1nRCILYji/cR7j2RzvWHdRM2XwodVi9TKwWASR/2VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r7L6u2K8eZ75PMO2siHSA5u+/ZNEcZxqXp5abnQ4OzU=;
 b=DoipQKodTTuxGCae+cmRfW5cRJqXNrM+e9aN6EFrDAb5T2kEylVT7+8vpDXnJ3ghaA3BTOTmKGbid3uBF0NlCDpC21dO1NtzYW2AoJRSiVy8HH6ECoG1I3IP4IexIkG/45jrTmYrxB00W+Tw8boZcy4SOVk4QFi5KNDOgsT60x8E4zH5faYL1i7G8/wfUoDq4cOdSUr1TQVghujMJ8stLkIjiPNqFZotoXPBJn8fhdYxfzC/8gdGk7EcRZe/EbhwMurtNuajPwazRxdRsfblD6xySmIsdDkofVKmtJa7Kky11d5N7iFIo1N2IZHOcBlNDkmA0bmpcYeIPr1OsH2zMg==
Received: from BN9PR03CA0180.namprd03.prod.outlook.com (2603:10b6:408:f4::35)
 by BL0PR12MB2546.namprd12.prod.outlook.com (2603:10b6:207:3f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Fri, 28 Jan
 2022 04:22:14 +0000
Received: from BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f4:cafe::c8) by BN9PR03CA0180.outlook.office365.com
 (2603:10b6:408:f4::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Fri, 28 Jan 2022 04:22:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.234) by
 BN8NAM11FT039.mail.protection.outlook.com (10.13.177.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4930.15 via Frontend Transport; Fri, 28 Jan 2022 04:22:13 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Fri, 28 Jan 2022 04:22:12 +0000
Received: from nvdebian.localnet (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9; Thu, 27 Jan 2022
 20:22:09 -0800
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>, Alex Sierra <alex.sierra@amd.com>
Subject: Re: [PATCH v4 06/10] lib: test_hmm add ioctl to get zone device type
Date: Fri, 28 Jan 2022 15:22:06 +1100
Message-ID: <15137014.ZJgPHRIoQ4@nvdebian>
In-Reply-To: <20220127030949.19396-7-alex.sierra@amd.com>
References: <20220127030949.19396-1-alex.sierra@amd.com>
 <20220127030949.19396-7-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: drhqmail201.nvidia.com (10.126.190.180) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1bd43497-6576-46dd-1b37-08d9e215c2a2
X-MS-TrafficTypeDiagnostic: BL0PR12MB2546:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB25468962A6A37386E19A60D9DF229@BL0PR12MB2546.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wrv8+vaZR7NVwImCPi2Zu6FE2oiLctQHxuNL9giOzlhf36LDVALDt4uczgu8+KGBTYanHdIqI1p40xktDhlYVxOK8e4FurVxMnlvIf4achQwxGxvUx28/R6ibKuBtRi9rMuBBr404ChXV/gAIYi9TmquHgDkfqk2LBlZLrQELJT6iTuh3f9RT89QiVwYAP1nSb7cJK8hwx4bJPeqhzn6nFb/q0lI3VO54lM5uHtTEtVNSTEB3NmM5OJoX0fU/ACruSBAcDthT8ffhefXq7Uj5CsxdI7PnX2qtb1N7/AsBYOEevXdfysS8HM9XL6Z8QLtj+68DvhI7kuXCR/4lmtFqQ9Z0/oLobbKJmjo0WjhLJauqfzWOmOCw+TA2Tk8TOGv+1LoEwlcgqsT8eF/GUbqvRVvqhJ/uZ5/5KEyP6Lr5kFnVxLv2kM5NkfxAwD/SMNSIncgtuI5ZLwGZYCd1voQX84UjKmwWGiGf6Jr/3C9Yvv0y2i0mNETMzkc1rq4z6w9Qufmek9lzRYQkldnXd+EUr0FoNOZpoz+JP9g5Hap6op42FuqfDIdqTfjKRHtbmaSzyTt2Axt1lgmRWcd0Unf8iVgHhhm1NXbjabEiCN0U7wMMGqNLIDs4itAQidk8C8mFJzZpOaLMm/EzMnE3yJU4lysbaBlb52MosXO+jHkgF4dBO92Vp0GWp2YB/vzaW6XqGYgcCQCGVW9thlj1LZufVSdFGOt6J8oxSFHbZN6JVc=
X-Forefront-Antispam-Report: CIP:12.22.5.234; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(9686003)(47076005)(508600001)(426003)(82310400004)(4326008)(86362001)(40460700003)(186003)(336012)(26005)(16526019)(36860700001)(83380400001)(6666004)(70586007)(7416002)(9576002)(81166007)(356005)(70206006)(54906003)(110136005)(5660300002)(8936002)(316002)(8676002)(2906002)(33716001)(39026012)(36900700001)(20210929001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 04:22:13.5355 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bd43497-6576-46dd-1b37-08d9e215c2a2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.234];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2546
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
Cc: amd-gfx@lists.freedesktop.org, willy@infradead.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Alistair Popple <apopple@nvidia.com>

On Thursday, 27 January 2022 2:09:45 PM AEDT Alex Sierra wrote:
> new ioctl cmd added to query zone device type. This will be
> used once the test_hmm adds zone device coherent type.
> 
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> ---
>  lib/test_hmm.c      | 23 +++++++++++++++++++++--
>  lib/test_hmm_uapi.h |  8 ++++++++
>  2 files changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index c259842f6d44..fb1fa7c6fa98 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -84,6 +84,7 @@ struct dmirror_chunk {
>  struct dmirror_device {
>  	struct cdev		cdevice;
>  	struct hmm_devmem	*devmem;
> +	unsigned int            zone_device_type;
>  
>  	unsigned int		devmem_capacity;
>  	unsigned int		devmem_count;
> @@ -1025,6 +1026,15 @@ static int dmirror_snapshot(struct dmirror *dmirror,
>  	return ret;
>  }
>  
> +static int dmirror_get_device_type(struct dmirror *dmirror,
> +			    struct hmm_dmirror_cmd *cmd)
> +{
> +	mutex_lock(&dmirror->mutex);
> +	cmd->zone_device_type = dmirror->mdevice->zone_device_type;
> +	mutex_unlock(&dmirror->mutex);
> +
> +	return 0;
> +}
>  static long dmirror_fops_unlocked_ioctl(struct file *filp,
>  					unsigned int command,
>  					unsigned long arg)
> @@ -1075,6 +1085,9 @@ static long dmirror_fops_unlocked_ioctl(struct file *filp,
>  		ret = dmirror_snapshot(dmirror, &cmd);
>  		break;
>  
> +	case HMM_DMIRROR_GET_MEM_DEV_TYPE:
> +		ret = dmirror_get_device_type(dmirror, &cmd);
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -1235,14 +1248,20 @@ static void dmirror_device_remove(struct dmirror_device *mdevice)
>  static int __init hmm_dmirror_init(void)
>  {
>  	int ret;
> -	int id;
> +	int id = 0;
> +	int ndevices = 0;
>  
>  	ret = alloc_chrdev_region(&dmirror_dev, 0, DMIRROR_NDEVICES,
>  				  "HMM_DMIRROR");
>  	if (ret)
>  		goto err_unreg;
>  
> -	for (id = 0; id < DMIRROR_NDEVICES; id++) {
> +	memset(dmirror_devices, 0, DMIRROR_NDEVICES * sizeof(dmirror_devices[0]));
> +	dmirror_devices[ndevices++].zone_device_type =
> +				HMM_DMIRROR_MEMORY_DEVICE_PRIVATE;
> +	dmirror_devices[ndevices++].zone_device_type =
> +				HMM_DMIRROR_MEMORY_DEVICE_PRIVATE;
> +	for (id = 0; id < ndevices; id++) {
>  		ret = dmirror_device_init(dmirror_devices + id, id);
>  		if (ret)
>  			goto err_chrdev;
> diff --git a/lib/test_hmm_uapi.h b/lib/test_hmm_uapi.h
> index f14dea5dcd06..17f842f1aa02 100644
> --- a/lib/test_hmm_uapi.h
> +++ b/lib/test_hmm_uapi.h
> @@ -19,6 +19,7 @@
>   * @npages: (in) number of pages to read/write
>   * @cpages: (out) number of pages copied
>   * @faults: (out) number of device page faults seen
> + * @zone_device_type: (out) zone device memory type
>   */
>  struct hmm_dmirror_cmd {
>  	__u64		addr;
> @@ -26,6 +27,7 @@ struct hmm_dmirror_cmd {
>  	__u64		npages;
>  	__u64		cpages;
>  	__u64		faults;
> +	__u64		zone_device_type;
>  };
>  
>  /* Expose the address space of the calling process through hmm device file */
> @@ -35,6 +37,7 @@ struct hmm_dmirror_cmd {
>  #define HMM_DMIRROR_SNAPSHOT		_IOWR('H', 0x03, struct hmm_dmirror_cmd)
>  #define HMM_DMIRROR_EXCLUSIVE		_IOWR('H', 0x04, struct hmm_dmirror_cmd)
>  #define HMM_DMIRROR_CHECK_EXCLUSIVE	_IOWR('H', 0x05, struct hmm_dmirror_cmd)
> +#define HMM_DMIRROR_GET_MEM_DEV_TYPE	_IOWR('H', 0x06, struct hmm_dmirror_cmd)
>  
>  /*
>   * Values returned in hmm_dmirror_cmd.ptr for HMM_DMIRROR_SNAPSHOT.
> @@ -62,4 +65,9 @@ enum {
>  	HMM_DMIRROR_PROT_DEV_PRIVATE_REMOTE	= 0x30,
>  };
>  
> +enum {
> +	/* 0 is reserved to catch uninitialized type fields */
> +	HMM_DMIRROR_MEMORY_DEVICE_PRIVATE = 1,
> +};
> +
>  #endif /* _LIB_TEST_HMM_UAPI_H */
> 




