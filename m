Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E09281EF25A
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 09:45:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 502FA6E8A3;
	Fri,  5 Jun 2020 07:45:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760040.outbound.protection.outlook.com [40.107.76.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C386E8A3;
 Fri,  5 Jun 2020 07:45:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QdvGQb82Y4cMuZo3FC00IJXRSPscfNKgYgAVyQIZoCjmxHiJjnq4da35VP5LX65efoQqQnAOB7Jm5rlx2rTOGhCHfAlrZnIideaIlU/8n3jJ+48abtvyplM51P6iMGsu0QLo0/ozRsKfwECjlr1BrRvYWYDIOjZHiY6u5CwEoeJ1GTjVv0nLrMjx4elQbKBf8dorMkXGsgSIeWFEzLZN/h8y2xcRSezOWy7I1U0FmD7xPudwUWEonO9lkRNPGMso7RBRJ4I22Z03cw5HbZJfezsISe8ZvXTi/rIrnf8szYSJz0W1+0ttK3xw6qoKelO9YfkSSTxYgFvIEQ/X3a3AkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UvYSTm8btO1Xt0MDV92LEnH3E70nPtB58iDUKLALeA=;
 b=YIhBuUg/PzIGJOpo4ekuhmDA2i11EvSBEK5ZokkRCVT4VcOFuAnKYyALxJ1GQqsETkp8bknsBv3sm7QwU2J8YKxMK0YOvBv5yp3oiuy22DHxR7xvzGQtEoL7OFv8uKtFdZEKQtkfZdhxdJ+MIDeUIfVWcUbc/WpL+tyg0aQc2ALuqxpM31nGu9UTLapANafcIDzgzvpTTIdBcjnUm8IxKCgPFICapKV+trDMXfU9TsPk/SKXyqjq8erRRih1ochaVdDhrKrJpHaPpaXq3/sLCwfmJFlVcx8ucVHMlJEibKhkl1eGFqkeYOIN3F3zjnQYkubDj5jiB4SVJyFW4q6CtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UvYSTm8btO1Xt0MDV92LEnH3E70nPtB58iDUKLALeA=;
 b=svjzT/Hx3Npf9KQlPyVr1Alhrx3sGHSMhIe8dhWo/bIdhT318LT3dK+3Gbo4DnwvDuJlpMPa5mN7s9pNntcPVCD2IrKTR6uR36aGZ3w8N22gsFSF0CbLXkyAuv/GM5clHDAqUHXz18L1bfpGeJXcRc7iHGoSOW5pjYkuqn3Wq0Q=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB3755.namprd12.prod.outlook.com (2603:10b6:5:1c2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Fri, 5 Jun
 2020 07:45:35 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%5]) with mapi id 15.20.3066.019; Fri, 5 Jun 2020
 07:45:34 +0000
Subject: Re: [PATCH v2 1/1] drm/mm: add ig_frag selftest
To: Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200603103223.10443-1-nirmoy.das@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d11d0f7b-6273-e1be-65db-1698e9c31228@amd.com>
Date: Fri, 5 Jun 2020 09:45:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200603103223.10443-1-nirmoy.das@amd.com>
Content-Language: en-US
X-ClientProxiedBy: FRYP281CA0002.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::12)
 To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FRYP281CA0002.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.20 via Frontend Transport; Fri, 5 Jun 2020 07:45:33 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ddaef1d5-24df-4e9c-2556-08d809246e38
X-MS-TrafficTypeDiagnostic: DM6PR12MB3755:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB375527B5C033C623BE3B10B383860@DM6PR12MB3755.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:586;
X-Forefront-PRVS: 0425A67DEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c9nuf2LS2zZ0mKwFvz9wNK8f6Cx5AtuTNDZtG1eeAlcZG+rTAI3JA3AHFfGrL9bS0NRZ0JJ3J2/LlbKWz2RXXJw+V0KeFgKbiPTG2vJkqY7mCpVYNxOOSTZttM/6Q8w1VOD1S06ugnn2hrhK1ecs5nAsutXNRK9Ql4t8F7Gdvz+nsbfoQVgs5mDOSXxJ/LD4Thg/NLhEOJHUdXEjBH7lXPNjBEGDyuM8S1fS+2q2qFQJMRsCyxVdsbnsTbCaYMFHxxMpJffziyKwNw2bQbF0yJIcOz7xuNlvvXPgfogVztnw1DyaM8SuhNBp3AiBppUgzbA1PcFECRaZGV3Hc8LzRJDqOn0mLqdbmiqnILzpIqf+z0OW1RH4dF37w3XkG6q+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(4326008)(66946007)(316002)(478600001)(2906002)(31686004)(31696002)(5660300002)(66556008)(2616005)(36756003)(8676002)(6666004)(186003)(83380400001)(16526019)(52116002)(6486002)(86362001)(66476007)(8936002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: LT7h95Xov6k8PsaFf5xySCTtCEMHaQBrpItS283x/5jQM6MvxmR4kdflzWmOEdhyD8I8x5NAutMKJ3RvENJA3LVOyRHdLrAnSZwGiRslqEjCDg4sp1QR9RocIyMG4LGADaFuBwZNufFmbY3InH5Md7hm8nEyuoKNWsIMr2jCwhkfawKHReu9+M+Gd/cZOg2vO+rTBsD683HXmKoDtyCWf/ZFpg5JXvrUFAstDuCeoD4uxNFQ7gAgLjZNqpsv8SWxf9D+h6pNTzN8s37lNTirKbHFntVGkX/RNY1P/LaUx9xG+Y4NAVZ9kHE6nGo03Sad/RFSGFMRl9Ar7bjNPTxptCcrJ/MAkKdmOnq1JIHSFKaPOunz2NJNgOk1BCeNpiEkHpSH45cbc3f8NsuFJyBtULI4l+XIGuqVZdzXc0M5Tqw9PeF3eqdfLIhiZ08EANP4A/oTtYF95J1JfgkouTtSj65x+yYCWCvzaTzrwD71ZeCZARIJXirCbIT6lcwpf3/Xa7FhZgYPSOJkTpVqzxlIOx1uTSmt4uICganioAcSruJQd54ICZuOn4RvISiH8jlp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddaef1d5-24df-4e9c-2556-08d809246e38
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2020 07:45:34.7950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wi+qZRv+r/mbK8pHd15hoVmdbMFBqi9AAM2iN521Ozja6IlKBYpnobM0QhSbva2+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3755
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
Cc: intel-gfx@lists.freedesktop.org, Nirmoy Das <nirmoy.das@amd.com>,
 chris@chris-wilson.co.uk
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 03.06.20 um 12:32 schrieb Nirmoy Das:
> This patch introduces fragmentation in the address range
> and measures time taken by 10k and 20k insertions. ig_frag()
> will fail if the time taken by 20k insertions takes more than
> 4 times of 10k insertions as we know that insertions should at
> most scale quadratically.
>
> v2:
> introduce fragmentation by freeing every other node.
> only test bottom-up and top-down for now.
>
> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
> ---
>   drivers/gpu/drm/selftests/drm_mm_selftests.h |   1 +
>   drivers/gpu/drm/selftests/test-drm_mm.c      | 124 +++++++++++++++++++
>   2 files changed, 125 insertions(+)
>
> diff --git a/drivers/gpu/drm/selftests/drm_mm_selftests.h b/drivers/gpu/drm/selftests/drm_mm_selftests.h
> index 6b943ea1c57d..8c87c964176b 100644
> --- a/drivers/gpu/drm/selftests/drm_mm_selftests.h
> +++ b/drivers/gpu/drm/selftests/drm_mm_selftests.h
> @@ -14,6 +14,7 @@ selftest(insert, igt_insert)
>   selftest(replace, igt_replace)
>   selftest(insert_range, igt_insert_range)
>   selftest(align, igt_align)
> +selftest(frag, igt_frag)
>   selftest(align32, igt_align32)
>   selftest(align64, igt_align64)
>   selftest(evict, igt_evict)
> diff --git a/drivers/gpu/drm/selftests/test-drm_mm.c b/drivers/gpu/drm/selftests/test-drm_mm.c
> index 9aabe82dcd3a..34231baacd87 100644
> --- a/drivers/gpu/drm/selftests/test-drm_mm.c
> +++ b/drivers/gpu/drm/selftests/test-drm_mm.c
> @@ -10,6 +10,7 @@
>   #include <linux/slab.h>
>   #include <linux/random.h>
>   #include <linux/vmalloc.h>
> +#include <linux/ktime.h>
>   
>   #include <drm/drm_mm.h>
>   
> @@ -1033,6 +1034,129 @@ static int igt_insert_range(void *ignored)
>   	return 0;
>   }
>   
> +static int prepare_igt_frag(struct drm_mm *mm,
> +			    struct drm_mm_node *nodes,
> +			    unsigned int num_insert,
> +			    const struct insert_mode *mode)
> +{
> +	unsigned int size = 4096;
> +	unsigned int i;
> +	u64 ret = -EINVAL;
> +
> +	for (i = 0; i < num_insert; i++) {
> +		if (!expect_insert(mm, &nodes[i], size, 0, i,
> +				   mode) != 0) {
> +			pr_err("%s insert failed\n", mode->name);
> +			goto out;
> +		}
> +	}
> +
> +	/* introduce fragmentation by freeing every other node */
> +	for (i = 0; i < num_insert; i++) {
> +		if (i % 2 == 0)
> +			drm_mm_remove_node(&nodes[i]);
> +	}
> +
> +out:
> +	return ret;
> +
> +}
> +
> +static u64 get_insert_time(struct drm_mm *mm,
> +			   unsigned int num_insert,
> +			   struct drm_mm_node *nodes,
> +			   const struct insert_mode *mode)
> +{
> +	unsigned int size = 8192;
> +	ktime_t start;
> +	unsigned int i;
> +	u64 ret = -EINVAL;
> +
> +	start = ktime_get();
> +	for (i = 0; i < num_insert; i++) {
> +		if (!expect_insert(mm, &nodes[i], size, 0, i, mode) != 0) {
> +			pr_err("%s insert failed\n", mode->name);
> +			goto out;
> +		}
> +	}
> +
> +	ret = ktime_to_ns(ktime_sub(ktime_get(), start));
> +
> +out:
> +	return ret;
> +
> +}
> +
> +static int igt_frag(void *ignored)
> +{
> +	struct drm_mm mm;
> +	const struct insert_mode *mode;
> +	struct drm_mm_node *nodes, *node, *next;
> +	unsigned int insert_size = 10000;
> +	unsigned int scale_factor = 4;
> +	int ret = -EINVAL;
> +
> +	/* We need 4 * insert_size nodes to hold intermediate allocated
> +	 * drm_mm nodes.
> +	 * 1 times for prepare_igt_frag()
> +	 * 1 times for get_insert_time()
> +	 * 2 times for  get_insert_time()
> +	 */
> +	nodes = vzalloc(array_size(insert_size * 4, sizeof(*nodes)));
> +	if (!nodes)
> +		return -ENOMEM;
> +
> +	/* For BOTTOMUP and TOPDOWN, we first fragment the
> +	 * address space using prepare_igt_frag() and then try to verify
> +	 * that that insertions scale quadratically from 10k to 20k insertions
> +	 */
> +	drm_mm_init(&mm, 1, U64_MAX - 2);
> +	for (mode = insert_modes; mode->name; mode++) {
> +		u64 insert_time1, insert_time2;
> +
> +		if (mode->mode != DRM_MM_INSERT_LOW ||
> +		    mode->mode != DRM_MM_INSERT_HIGH)
> +			continue;

This check here is wrong, that needs to be && instead of || or the test 
wouldn't execute at all.

Christian.

> +
> +		ret = prepare_igt_frag(&mm, nodes, insert_size, mode);
> +		if (!ret)
> +			goto err;
> +
> +		insert_time1 = get_insert_time(&mm, insert_size,
> +					       nodes + insert_size, mode);
> +		if (insert_time1 < 0)
> +			goto err;
> +
> +		insert_time2 = get_insert_time(&mm, (insert_size * 2),
> +					       nodes + insert_size * 2, mode);
> +		if (insert_time2 < 0)
> +			goto err;
> +
> +		pr_info("%s fragmented insert of %u and %u insertions took %llu and %llu nsecs\n",
> +			mode->name, insert_size, insert_size * 2,
> +			insert_time1, insert_time2);
> +
> +		if (insert_time2 > (scale_factor * insert_time1)) {
> +			pr_err("%s fragmented insert took %llu nsecs more\n",
> +			       mode->name,
> +			       insert_time2 - (scale_factor * insert_time1));
> +			goto err;
> +		}
> +
> +		drm_mm_for_each_node_safe(node, next, &mm)
> +			drm_mm_remove_node(node);
> +	}
> +
> +	ret = 0;
> +err:
> +	drm_mm_for_each_node_safe(node, next, &mm)
> +		drm_mm_remove_node(node);
> +	drm_mm_takedown(&mm);
> +	vfree(nodes);
> +
> +	return ret;
> +}
> +
>   static int igt_align(void *ignored)
>   {
>   	const struct insert_mode *mode;

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
