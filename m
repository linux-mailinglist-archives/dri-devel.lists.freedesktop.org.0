Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8013B15EA
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 10:32:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAFE66E87A;
	Wed, 23 Jun 2021 08:32:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F9C6E87A;
 Wed, 23 Jun 2021 08:32:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KtTtKMexypjgH2eSpTjgZ1v1L1Rt+fy8su3/oXFzsX7teTUcQZgZLZ8uOtST0VJGvPJisW55dpfgWYRSkMIk+ZuberOfWLM5iFGCv72qHI9bugsh/T78tHvnoMYbNbdV2qWywT6qf3d4wea5Li3HrzbExHO5p+Wq9bEH8pOI3dWhmz6sLTkYVavyjCA8RKl/eil1R3ISwuF7i4RATsou2p/MF5dVEVTNU3mHntlCesCm1JyprjADbeez5x1deZE+ZADAcXEjAk4qN4ctDbdzgOsgMAHoHOePgwNZQzQEWkgQ2Vhs2jnREZDdy/xaKO/z7u35fAUwiC7M5JQU71vIgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oM+vfC1XipeGRU/f4AUhyG5S1zS3JSGlj5sTeBuaDTI=;
 b=ne1C7n5Oc8KsNUPiM2UrdylFzAHFvn5Jq06PK+srdMGx5wFukEUUKqdLdqY0Aqq2KqBZE/Njh9ZCiDkrES4LBhVGBmRtkzVnGmWBA0Q65+YxjDG+s0KclKwrAjNbCfD8drLUI+Xths62uO4TYJR6hQ50ttcz2J+xDrcV3CO5qi6NmunzIzcu2MM/VdPIC+vc+RfJemOx6R/i/DhQp5CF3jg0ozpfBpYHVPbHtOm60nphSj9r+B9TFsmEy53rZHWZ2HLIqQxpQFQLAyvMktqOFxKkZkpFoo6ONV3XJPznmOZTo8403Jg47gTV97dkCHNHttYWAHMz1xbigGqqiAWF6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oM+vfC1XipeGRU/f4AUhyG5S1zS3JSGlj5sTeBuaDTI=;
 b=UTBnp3Prss9TVLDdDTBfQGNFVzvEYlrvBwMzt+/rn3VtDreE7QMyAclm/XTKqubEj/ouOC9kzWcDko07Y3GmKowdzdhmmKBX6yKBN+JjHpIx/v1RyVD5A5sjS5RShEEotjLfL8TR3B2HFggi6VVc4U+M38ZEkoY0EWbjSnRQH4U=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4206.namprd12.prod.outlook.com (2603:10b6:208:1d5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Wed, 23 Jun
 2021 08:32:23 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4242.024; Wed, 23 Jun 2021
 08:32:23 +0000
Subject: Re: [PATCH 02/15] dma-buf: Switch to inline kerneldoc
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
 <20210622165511.3169559-3-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5043bdf9-6f39-cc91-b7f0-adfb2dab2d9a@amd.com>
Date: Wed, 23 Jun 2021 10:32:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210622165511.3169559-3-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:69e4:a619:aa86:4e9c]
X-ClientProxiedBy: PR1P264CA0025.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::12) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:69e4:a619:aa86:4e9c]
 (2a02:908:1252:fb60:69e4:a619:aa86:4e9c) by
 PR1P264CA0025.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19f::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.19 via Frontend Transport; Wed, 23 Jun 2021 08:32:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7a37e39-b847-45da-5875-08d936216c94
X-MS-TrafficTypeDiagnostic: MN2PR12MB4206:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB42068A4D15196763C7323B6F83089@MN2PR12MB4206.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BzfY40kDQaQyzzrob72jSLSwETu0LgDqFeexHPWj/E2ZM+2Gf5FuN47CuM/qIZ+QBuSKG35LfEeHGTEWnd4rEaaUHtSOBh639Pql9ML3IQL+fzgy05PTTFNDjZ8B4ElKYfZVsUTQVHCA68UcldeFjE6Qv29FMfbjNmShQLwuZ23/PJTIj2PYBqL76fZLtg/73jsM7UhXWNYmOCNAYyNfc8XQOPI/X5yFuac2pCZOJ4xPncGjdLUdBKxagwXyV6bIO3oCsSs2Ui7YlMO681YrXMBO7f8QLPEdlpg35V5zRTqxThsa6cBEMmrDNd3sRCPBWmm7sdg1GG/CR4lUnJoMBj6AgSsZ9GBD4p5vwsl0nq2P8RBTaNlFyrfKRLrUlZZG99aZuy2LmJ/tiGjbFoXKqHBZh/H/LScq4yQf5POW4bkd1lFPPk3+jwzob8W+bqbqrTH+o5lbsLQBoaGvzimx9/OCrbLznUc8t09VAppW5mmWUVrLM6ybJGU7KUOExW52Qo1frEMMCLD2tlBPmR/GH7n0VtWLtthfffQndFPvRphkLBwIzkQn4XK5gkgzKmTWL2Ew2NEsGpIairwhA33MafJPB8bXmcu7/SqxBlGkpZFFd6CV7Eq+kjoRUGG73A7EJkS8N9+QvbGUL3DlaJAodt+41kC20gPvtWhN0ymrPfdMLaSBeqME9FvGgkl9gS4y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(346002)(366004)(376002)(2906002)(7416002)(2616005)(86362001)(83380400001)(8676002)(6666004)(478600001)(4326008)(66574015)(186003)(16526019)(316002)(31686004)(5660300002)(38100700002)(66946007)(66476007)(8936002)(6486002)(66556008)(36756003)(31696002)(54906003)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2M5c0RvK3JQT3pNVFF4ZnBzTUl4NG04RjczSDNuZmdCUXh3MXRJcnhFQVBN?=
 =?utf-8?B?YjJWRDl6ZTE2RUVnbzFTTzlpQzkvcjg3TVdVVTlJeWN4Rm8rUDdPbFRGaUNa?=
 =?utf-8?B?SmRtQzc5MzhXUGJSV2ZWWG9udjEvYkVabWw4Ty9JTExCMURHbTRnRC9UUlpj?=
 =?utf-8?B?di9CQnVRTHFsbEdWVzhobERBV2JVZHdmUSt3WTg1ZmxuQk5yNU9KeGJOaXda?=
 =?utf-8?B?aG11NlNvRFVXR2pLYWxneGJzQjlxVUt5VUpUL3pVUGZ0L2JRS0N3YVVNVWNC?=
 =?utf-8?B?RUV4U1oxUmx6RGV0Yld6MC9xQWxsQWk1eHBjSkFmK2tEUlZsY2dkbEtXUG5q?=
 =?utf-8?B?aW00OUZib29kQmZEemExSGpTOFhvL2t0akxQc0pBWGhOY1BqQ2hINWliWS9i?=
 =?utf-8?B?aUtqOUkzT0pISmp6b0ZKKzcxUm9sdVMrNkZZY2RJZ21xZS9TNWRTcXIxTXRi?=
 =?utf-8?B?U1QzS1RsRmNhcTdueElEcUdzcHhGTzNJYXJCNHZkZ3lZMjdHN2YyZUo2b1F3?=
 =?utf-8?B?Y2NTRCtTOEVlQzBJdlU5cFQxT0VVWTcwWCtwVVMvc1BDdDdvUkhRVk81T1d5?=
 =?utf-8?B?dDBPZjcvUk9QVmFXenUxbVdIdlZWZDlBRHhjcStvdTdBSjhCR0ltVlJPUUxB?=
 =?utf-8?B?aFBZa0laNTNVQnllbTNPSFhvWXBNeitHS0tnRG1IbEJ6dmY2T2tNdmVCZFp4?=
 =?utf-8?B?RG93ekJ4dFBTY0tnTlhIeURrQ2xXbXRJZ2FSWGFyeFBDVmVRQ0R6MmQ1ZTND?=
 =?utf-8?B?REcvam9kNDU5ejZ3YWt5b2RmWElmQ1RTNHhtRmljVFFtNXdPcytkWnQ2SEFk?=
 =?utf-8?B?Mld3SEwxand4R0JoTElEc1Jnc09pNFRiK3Bnb0xjK01CNE9uWEVsVXNVWXlM?=
 =?utf-8?B?alYwSW1pdG9PRlhlZS9lekpSMEc2OWpleWxVai9rd2hYT3lsbHN1YW4yZkw3?=
 =?utf-8?B?TTdWaDhrSDZDdFBYcW1kTlNZSmhzYlJSNHZYV0luQU9CNDk1YXpobDE0c1Rj?=
 =?utf-8?B?enRaY2tjUU1NNlJ2bVdLcG1wQzRkQmVhbVNWMXd1aDR3RFgzMHFmb1FxLzNR?=
 =?utf-8?B?dDYyNTVicnBYYzMxU2NCQUx0SGQ2WUc2K0VyOVRwbWFCbTZqYnVNRS8rRFR3?=
 =?utf-8?B?ZW40ZjQ5SVYwMWVZOHRxWklJbGY3alo0TEkvQ2xWOXRYbTE1N0RjVXJZL01M?=
 =?utf-8?B?cDdnQitqamc2ZkEydUF3cU1QSzNWeW92b3BMZklzbXRleHJPL0lCc21ZTXpu?=
 =?utf-8?B?aWJkdHVXbU45aWVyczl1TjZZV3BOVFZkZHBQRC9QNWlTUitIUTlMWS8wU1Nw?=
 =?utf-8?B?T1hJRTBUUGUrSDlQMTNuQWI1VWVLM3NUb1lXN2ZHZVl5aUZGS0RWL3lkM2pr?=
 =?utf-8?B?TEtucXlGdkFiMlo5RWJRYjUyVU9rODAzWWJBTVhwZGNvR3U1Zld6ak1ORUY1?=
 =?utf-8?B?N1BoZjN1aGlHaHRsa0NqQ3J6MXFiRkU2eE80UWlid1hmWU5hVVhWb3VwT0Nu?=
 =?utf-8?B?b2FQcE45ZHYzRC9NMlU1V1JtbFVRZUdCUStzYklSYkpWYUtNQ094SnBCZE14?=
 =?utf-8?B?TTVFL2FmQTl0WkNkNkxuUytkNVBaY0VmbFNEYnFsUTRRYllsckJyMHlkSk5C?=
 =?utf-8?B?NUd3SE5NNHIwTjNxVWVLQ3lXcEpxVnUxWW1rcEU0d1BJUGFOU0Z0QnpFK2d0?=
 =?utf-8?B?WjB2SVBPL3htbDk1SFhpVTlWa29RdURPT1ZkMElGV1BzTGZOdVpXZ3habzVV?=
 =?utf-8?B?aXVvN2ZjS3I4dmVBS2lxczdCeUl1eEVxYTgvSjJXekdsQ0xMQ1dzZ0RIRTZV?=
 =?utf-8?B?U3NjbkNENXVMSWlLaDdRR0FJYnVQUjU4NXowUUpkQ0FZNlJsUnNJZ2hsZjdX?=
 =?utf-8?Q?RgWxzm3MQhT+g?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7a37e39-b847-45da-5875-08d936216c94
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2021 08:32:23.4716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jtr9K1cmzFoTCfvT1DcPwoqlmbQgJEuoT+DviL0bL251cO/B5k7chRT0hYINksvO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4206
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
Cc: Deepak R Varma <mh12gx2825@gmail.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Kevin Wang <kevin1.wang@amd.com>, linaro-mm-sig@lists.linaro.org,
 Nirmoy Das <nirmoy.das@amd.com>, Chen Li <chenli@uniontech.com>,
 Dave Airlie <airlied@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.06.21 um 18:54 schrieb Daniel Vetter:
> Also review & update everything while we're at it.
>
> This is prep work to smash a ton of stuff into the kerneldoc for
> @resv.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Nirmoy Das <nirmoy.das@amd.com>
> Cc: Deepak R Varma <mh12gx2825@gmail.com>
> Cc: Chen Li <chenli@uniontech.com>
> Cc: Kevin Wang <kevin1.wang@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   include/linux/dma-buf.h | 107 +++++++++++++++++++++++++++++++---------
>   1 file changed, 83 insertions(+), 24 deletions(-)
>
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 92eec38a03aa..6d18b9e448b9 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -289,28 +289,6 @@ struct dma_buf_ops {
>   
>   /**
>    * struct dma_buf - shared buffer object
> - * @size: size of the buffer; invariant over the lifetime of the buffer.
> - * @file: file pointer used for sharing buffers across, and for refcounting.
> - * @attachments: list of dma_buf_attachment that denotes all devices attached,
> - *               protected by dma_resv lock.
> - * @ops: dma_buf_ops associated with this buffer object.
> - * @lock: used internally to serialize list manipulation, attach/detach and
> - *        vmap/unmap
> - * @vmapping_counter: used internally to refcnt the vmaps
> - * @vmap_ptr: the current vmap ptr if vmapping_counter > 0
> - * @exp_name: name of the exporter; useful for debugging.
> - * @name: userspace-provided name; useful for accounting and debugging,
> - *        protected by @resv.
> - * @name_lock: spinlock to protect name access
> - * @owner: pointer to exporter module; used for refcounting when exporter is a
> - *         kernel module.
> - * @list_node: node for dma_buf accounting and debugging.
> - * @priv: exporter specific private data for this buffer object.
> - * @resv: reservation object linked to this dma-buf
> - * @poll: for userspace poll support
> - * @cb_excl: for userspace poll support
> - * @cb_shared: for userspace poll support
> - * @sysfs_entry: for exposing information about this buffer in sysfs.
>    * The attachment_uid member of @sysfs_entry is protected by dma_resv lock
>    * and is incremented on each attach.
>    *
> @@ -324,24 +302,100 @@ struct dma_buf_ops {
>    * Device DMA access is handled by the separate &struct dma_buf_attachment.
>    */
>   struct dma_buf {
> +	/**
> +	 * @size:
> +	 *
> +	 * Size of the buffer; invariant over the lifetime of the buffer.
> +	 */
>   	size_t size;
> +
> +	/**
> +	 * @file:
> +	 *
> +	 * File pointer used for sharing buffers across, and for refcounting.
> +	 * See dma_buf_get() and dma_buf_put().
> +	 */
>   	struct file *file;
> +
> +	/**
> +	 * @attachments:
> +	 *
> +	 * List of dma_buf_attachment that denotes all devices attached,
> +	 * protected by &dma_resv lock @resv.
> +	 */
>   	struct list_head attachments;
> +
> +	/** @ops: dma_buf_ops associated with this buffer object. */
>   	const struct dma_buf_ops *ops;
> +
> +	/**
> +	 * @lock:
> +	 *
> +	 * Used internally to serialize list manipulation, attach/detach and
> +	 * vmap/unmap. Note that in many cases this is superseeded by
> +	 * dma_resv_lock() on @resv.
> +	 */
>   	struct mutex lock;
> +
> +	/**
> +	 * @vmapping_counter:
> +	 *
> +	 * Used internally to refcnt the vmaps returned by dma_buf_vmap().
> +	 * Protected by @lock.
> +	 */
>   	unsigned vmapping_counter;
> +
> +	/**
> +	 * @vmap_ptr:
> +	 * The current vmap ptr if @vmapping_counter > 0. Protected by @lock.
> +	 */
>   	struct dma_buf_map vmap_ptr;
> +
> +	/**
> +	 * @exp_name:
> +	 *
> +	 * Name of the exporter; useful for debugging. See the
> +	 * DMA_BUF_SET_NAME IOCTL.
> +	 */
>   	const char *exp_name;
> +
> +	/**
> +	 * @name:
> +	 *
> +	 * Userspace-provided name; useful for accounting and debugging,
> +	 * protected by dma_resv_lock() on @resv and @name_lock for read access.
> +	 */
>   	const char *name;
> +
> +	/** @name_lock: Spinlock to protect name acces for read access. */
>   	spinlock_t name_lock;
> +
> +	/**
> +	 * @owner:
> +	 *
> +	 * Pointer to exporter module; used for refcounting when exporter is a
> +	 * kernel module.
> +	 */
>   	struct module *owner;
> +
> +	/** @list_node: node for dma_buf accounting and debugging. */
>   	struct list_head list_node;
> +
> +	/** @priv: exporter specific private data for this buffer object. */
>   	void *priv;
> +
> +	/**
> +	 * @resv:
> +	 *
> +	 * Reservation object linked to this dma-buf.
> +	 */
>   	struct dma_resv *resv;
>   
> -	/* poll support */
> +	/** @poll: for userspace poll support */
>   	wait_queue_head_t poll;
>   
> +	/** @cb_excl: for userspace poll support */
> +	/** @cb_shared: for userspace poll support */
>   	struct dma_buf_poll_cb_t {
>   		struct dma_fence_cb cb;
>   		wait_queue_head_t *poll;
> @@ -349,7 +403,12 @@ struct dma_buf {
>   		__poll_t active;
>   	} cb_excl, cb_shared;
>   #ifdef CONFIG_DMABUF_SYSFS_STATS
> -	/* for sysfs stats */
> +	/**
> +	 * @sysfs_entry:
> +	 *
> +	 * For exposing information about this buffer in sysfs. See also
> +	 * `DMA-BUF statistics`_ for the uapi this enables.
> +	 */
>   	struct dma_buf_sysfs_entry {
>   		struct kobject kobj;
>   		struct dma_buf *dmabuf;

