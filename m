Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D2E1E8215
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 17:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D04A6E939;
	Fri, 29 May 2020 15:40:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::623])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BADA6E939;
 Fri, 29 May 2020 15:40:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jm6xsDnijzt54vApWbku9MHyzLLYTJ1wBWY4ti/rAwctPN75Zvl8YK1K4/wV6MI9Y+WErd9HRgfukaDKY4dMaGkTrDpxNtRYeCKMB87L1uaKaKFRtM5km6kdsediFiYnjSpc2vVh6yVD8exMd2VVucc1r2F3V3df+xRKwHKk/Fc0YJorbG/kg02CNa7eR5FlpAj1I7zth9FVV9G74Qfjnk0nV1xAMXrEqtBpwAiNdtKXAKFyCmDRykb+bgr/nJCy+nrTwvcmKj4YajeRyrCHpiTopK9ZC48r/9Qd3iYqzkYOBmuFnDCDXvPe9w7Dx/T+a17+DzeCGpr7+XiYUtRuyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APyDQq6/2x/+CQCmDARG1K1aIwsH3UFfvp2LhTQUGkg=;
 b=Lz9fmRshH6DHU8NGqiyWf/ZyVO2yLEupdaJ/yWBE7qLSUZ89Qvv4PQidRu67/u4JwEunw0qiOtgBOth89V1mnG4Uy95q6CqFTuOrsxHT9B3MqrpEAqvVbEGKAHcOZ180robj+LvZesYWJr12ul3/z6y6YRzIhlZRNo62hmvvWDxhwS8hwlsZ7Qo9MJj7rcCkiagRG9CxvfaI9ZP79n1oDYndTf//Jf9OoOQE132M6cxp04d5NAO5uZvKroQGLjdjbljvpRjusae2RfHgfBQSOFxArkh00i+kBJEMbJmH5LORahzv2BtNMSMKXFLFTJk3iF9/NpiBkFcl25ZiHFsKkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APyDQq6/2x/+CQCmDARG1K1aIwsH3UFfvp2LhTQUGkg=;
 b=JJI+9vVZUbQRr7ymFavHzOFo+bEfMiZqiyAlv77UDAmghBAsxVkrO9idj+0fijvxUY6IYEQW5oPFtjR2v3LeVwnNznkkB6EksUsun8FPVoAo22tsDTwI1yj+OyuFTQA4Ckk/ACKLBwbec0aNnWmx65P87P4NxzRHQH+zfU0uZvg=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3872.namprd12.prod.outlook.com (2603:10b6:208:168::17)
 by MN2PR12MB3741.namprd12.prod.outlook.com (2603:10b6:208:162::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24; Fri, 29 May
 2020 15:40:25 +0000
Received: from MN2PR12MB3872.namprd12.prod.outlook.com
 ([fe80::8843:c094:fb2a:d60a]) by MN2PR12MB3872.namprd12.prod.outlook.com
 ([fe80::8843:c094:fb2a:d60a%7]) with mapi id 15.20.3045.018; Fri, 29 May 2020
 15:40:25 +0000
Subject: Re: [RFC PATCH 1/1] drm/mm: add ig_frag selftest
To: Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200529163351.5228-1-nirmoy.das@amd.com>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <cdb604b7-0817-c786-45f6-3c2f9a395c70@amd.com>
Date: Fri, 29 May 2020 17:40:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200529163351.5228-1-nirmoy.das@amd.com>
Content-Language: en-US
X-ClientProxiedBy: AM4PR0302CA0005.eurprd03.prod.outlook.com
 (2603:10a6:205:2::18) To MN2PR12MB3872.namprd12.prod.outlook.com
 (2603:10b6:208:168::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (217.86.127.180) by
 AM4PR0302CA0005.eurprd03.prod.outlook.com (2603:10a6:205:2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Fri, 29 May 2020 15:40:24 +0000
X-Originating-IP: [217.86.127.180]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9e2ab999-e861-4cd8-7133-08d803e69b4a
X-MS-TrafficTypeDiagnostic: MN2PR12MB3741:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB37415EAED6D979F735FA3F148B8F0@MN2PR12MB3741.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:514;
X-Forefront-PRVS: 04180B6720
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yt6ESUK6GBbn6V8ZdxEJ+0Rgz2CCxsd6Miq46XX32+SXam75Tuu4/iHSsXAmbL8a1F05F6cFrLlOsNOri59LC/I2wcRqbFkOJHIqRjLHvZ3uMzNvX1CvvQFhftyw23jXTTUNrc66ZTxmYUFzvcJnmNTHQ9u3WrqlYNTIT9T7lV7At0+9b/E8P6cidmouWcKtrCDss4IGRFQZPdGXP2qOgE14kgdfquiLMqAzVt9bnTsW4+bYnq6GGKRVcILfnJ8N5NZ0hzq9OiSITBx91xH9GUPzNUERJBNxeuQHZVq1b2UDY49tHnLAfWE2anupfCDnhNQlYOhUa+QYXj9xoPzuuytAEYrPJBekwq8yC5DyTxBRJ/7Lh6as4yjvu7FHUsfS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3872.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(396003)(136003)(346002)(366004)(376002)(52116002)(26005)(316002)(53546011)(31696002)(66946007)(31686004)(16526019)(36756003)(186003)(6666004)(6486002)(6512007)(8676002)(2906002)(8936002)(2616005)(956004)(478600001)(6506007)(4326008)(66476007)(5660300002)(66556008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: LQ5YmAJAGYF4Hqko/+hbtQWo44HqY91Ueg/Q4SnIt5YMsinB8ThFVJRVK++bF+vVtewiSLARzpkPC5LGv27449sljG+baXhf55r4w8qcT4georVDO45TawPLW/Qawfh5xwVdBi0eYUOC9JMzkvF0sKW4uFfzRiBcdpijunxYzFahc5z09ksOh2UE1stSZoc8nPzJQM+kkF55ygwY6PsBQ9JkCtcDvLveng/9QafL0aXJA9eorHKYlNt1vJ5lFAjKm2RCv9UDwoMXMVvvd1HVmmwVRYudHx/kOmoakUMd0E9h7tOVwHHao9hx5oubx7+ftFWVFkR+UeBBLPuAU5d9hg90+b26p1frdg7cU34jOdu6h5T1nB/eEpZPrKd/ySv848tjovwBzFviZmDjLcTJkh2RKHkgUB0B9k6j2EJKfPhqJ2oTAhHFPljoZ4SlvhthQRU8gDKEesGHvjhrkllCkO9f/K1flDaWIi5o5Zsm7b0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e2ab999-e861-4cd8-7133-08d803e69b4a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2020 15:40:25.8172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: REfk+AlOhFp2po0x2C82lMJcJ7zBZzZuEoioL12nUte2QLLoYeR8pXIg3GP7YV3MxpWbTixVZzLe8mnUOI/OOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3741
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
 christian.koenig@amd.com, chris@chris-wilson.co.uk
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This works correctly most of the times but sometimes

20k insertions can take more than 8 times of 10k insertion time.


Regards,

Nirmoy

On 5/29/20 6:33 PM, Nirmoy Das wrote:
> This patch introduces fragmentation in the address range
> and measures time taken by 10k and 20k insertions. ig_frag()
> will fail if time taken by 20k insertions takes more than 4 times
> of 10k insertions as we know that insertions scale quadratically.
> Also tolerate 10% error because of kernel scheduler's jitters.
>
> Output:
> <snip>
> [ 8092.653518] drm_mm: Testing DRM range manger (struct drm_mm), with random_seed=0x9bfb4117 max_iterations=8192 max_prime=128
> [ 8092.653520] drm_mm: igt_sanitycheck - ok!
> [ 8092.653525] igt_debug 0x0000000000000000-0x0000000000000200: 512: free
> [ 8092.653526] igt_debug 0x0000000000000200-0x0000000000000600: 1024: used
> [ 8092.653527] igt_debug 0x0000000000000600-0x0000000000000a00: 1024: free
> [ 8092.653528] igt_debug 0x0000000000000a00-0x0000000000000e00: 1024: used
> [ 8092.653529] igt_debug 0x0000000000000e00-0x0000000000001000: 512: free
> [ 8092.653529] igt_debug total: 4096, used 2048 free 2048
> [ 8112.569813] drm_mm: best fragmented insert of 10000 and 20000 insertions took 504 and 1996 msecs
> [ 8112.723254] drm_mm: bottom-up fragmented insert of 10000 and 20000 insertions took 44 and 108 msecs
> [ 8112.813212] drm_mm: top-down fragmented insert of 10000 and 20000 insertions took 40 and 44 msecs
> [ 8112.847733] drm_mm: evict fragmented insert of 10000 and 20000 insertions took 8 and 20 msecs
> <snip>
>
> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
> ---
>   drivers/gpu/drm/selftests/drm_mm_selftests.h |  1 +
>   drivers/gpu/drm/selftests/test-drm_mm.c      | 73 ++++++++++++++++++++
>   2 files changed, 74 insertions(+)
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
> index 9aabe82dcd3a..05d8f3659b4d 100644
> --- a/drivers/gpu/drm/selftests/test-drm_mm.c
> +++ b/drivers/gpu/drm/selftests/test-drm_mm.c
> @@ -1033,6 +1033,79 @@ static int igt_insert_range(void *ignored)
>   	return 0;
>   }
>   
> +static int get_insert_time(unsigned int num_insert,
> +			   const struct insert_mode *mode)
> +{
> +	struct drm_mm mm;
> +	struct drm_mm_node *nodes, *node, *next;
> +	unsigned int size = 4096, align = 8192;
> +	unsigned long start;
> +	unsigned int i;
> +	int ret = -EINVAL;
> +
> +	drm_mm_init(&mm, 1, U64_MAX - 2);
> +	nodes = vzalloc(array_size(num_insert, sizeof(*nodes)));
> +	if (!nodes)
> +		goto err;
> +
> +	start = jiffies;
> +	for (i = 0; i < num_insert; i++) {
> +		if (!expect_insert(&mm, &nodes[i], size, align, i, mode)) {
> +			pr_err("%s insert failed\n", mode->name);
> +			goto out;
> +		}
> +	}
> +
> +	ret = jiffies_to_msecs(jiffies - start);
> +out:
> +	drm_mm_for_each_node_safe(node, next, &mm)
> +		drm_mm_remove_node(node);
> +	drm_mm_takedown(&mm);
> +	vfree(nodes);
> +err:
> +	return ret;
> +
> +}
> +
> +static int igt_frag(void *ignored)
> +{
> +	const struct insert_mode *mode;
> +	unsigned int insert_time1, insert_time2;
> +	unsigned int insert_size = 10000;
> +	unsigned int scale_factor = 4;
> +	/* tolerate 10% excess insertion duration */
> +	unsigned int error_factor = 110;
> +	int ret = -EINVAL;
> +
> +	for (mode = insert_modes; mode->name; mode++) {
> +		unsigned int expected_time;
> +
> +		insert_time1 = get_insert_time(insert_size, mode);
> +		if (insert_time1 < 0)
> +			goto err;
> +
> +		insert_time2 = get_insert_time((insert_size * 2), mode);
> +		if (insert_time2 < 0)
> +			goto err;
> +
> +		expected_time = (scale_factor * insert_time1 *
> +				 error_factor)/100;
> +		if (insert_time2 > expected_time) {
> +			pr_err("%s fragmented insert took more %u msecs\n",
> +			       mode->name, insert_time2 - expected_time);
> +			goto err;
> +		}
> +
> +		pr_info("%s fragmented insert of %u and %u insertions took %u and %u msecs\n",
> +			mode->name, insert_size, insert_size * 2, insert_time1,
> +			insert_time2);
> +	}
> +
> +	ret = 0;
> +err:
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
