Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 287A755B418
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 23:02:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E255A10E316;
	Sun, 26 Jun 2022 21:01:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A516A10E316;
 Sun, 26 Jun 2022 21:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656277316; x=1687813316;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=spdjXUGDoLbuik6vVasFMV1jHL9BtxLWn6QCEt3yN1U=;
 b=VIESwOgQTKV036XovfgiiwCB5+09ytfQdVTlU/8N6Af8oQXXGgyOFvh/
 b1dC8AJufiw0u31d9zwEsVoVzIrn+w6P5Mn9XANqEnlotjrFtwXfkdoTR
 dkrv4Sn+yLF4qcLvNqa5R3hGBeI1KQVLZALxL9JKq/q9qgYatecmpSwTw
 4Lze40NlRibsuyWx3ILxvQKGkQJF/VSDOY076qGxKBZF/KCaHOaSHUPBw
 UtJYfuxIRsSqXVa4rHtfkwC595NBxpgYP4CPJet9eKzkgMNvNTDDxUhTg
 uzYgiALWDvKWd4oHRlY88jFKM9GPBX6pb3AVgaqq9CRFGkN+2pWeHd5Za Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10390"; a="281353884"
X-IronPort-AV: E=Sophos;i="5.92,224,1650956400"; d="scan'208";a="281353884"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2022 14:01:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,224,1650956400"; d="scan'208";a="835913142"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga006.fm.intel.com with ESMTP; 26 Jun 2022 14:01:56 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 26 Jun 2022 14:01:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 26 Jun 2022 14:01:55 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Sun, 26 Jun 2022 14:01:55 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Sun, 26 Jun 2022 14:01:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WfyUZnXjREt1YzjRq/emHRxjiLwKc1zJhZnslzVD/iHuCcsD/JgX8E5Jb2S/7Yc0ruyJeaK6PKjv91ARBNaxoc2bzolxzrS5/NKDzipalZXxzJZv9+4gusOnm6toRGXkCZDJyI1HqRIcT2a1B/A4u9d+OoX6OPuB3kWTIe0jkH2LrBA0o1KBo5vciT+W2DOzIW80cUZhHagO9WQVDUlBsOSxXFjsFM51daxiAhuNpCv+5Q+LKfSailIPFBokjSd6VmRVzAizhSIZW9Xj01itnFxdDPBbSj9oZVMS17zj66OkMQTYfi06QhZlxam+EtXOOAwm4C/eUM6W+pSytAvEAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3sCIEnSfWdpjGrN0dl1b9eCalS6xYzx10d5guLnQD0=;
 b=haVA5TAqefmQyssY6LRhPgGhNVcClt26qYX+/lJOzxhqpxbKC8FYRQSSutiaCYWkBp1W434ToUbHb1OhVO18+6WX/XApmD7dFy/DU3iqoHL8Mr6hD/dheq/KGhznKjA7/Slms5BCXP3u1siJYk3iuq41OPD+rAZkQnG7I+w48oRpnIg18yXBjRUNQ438xWH+7bwLYsGfmG/m6T6TZFhg8tlwfCrGwNvbYD4lNdC22/I9RYoVZvCWH+fRbX8Sbjb0uXBLgVjLJUnoiRGqjae7UvBhA1qPkcDJrBbLJJsD7zxscTZSK04YfpREf1eK1RUgWyjqLxKBV2DBaOuOfVZHdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN2PR11MB3856.namprd11.prod.outlook.com (2603:10b6:208:ef::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Sun, 26 Jun
 2022 21:01:53 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fc50:22fd:6bdb:5769]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fc50:22fd:6bdb:5769%7]) with mapi id 15.20.5373.018; Sun, 26 Jun 2022
 21:01:53 +0000
Date: Sun, 26 Jun 2022 14:01:51 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 2/2] iosys-map: Add per-word write
Message-ID: <20220626210031.4jri3ugykd2x6onu@ldmartin-desk2>
References: <20220617085204.1678035-1-lucas.demarchi@intel.com>
 <20220617085204.1678035-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220617085204.1678035-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: MWHPR02CA0022.namprd02.prod.outlook.com
 (2603:10b6:300:4b::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa0e036b-da8a-4fa9-5c4e-08da57b718b8
X-MS-TrafficTypeDiagnostic: MN2PR11MB3856:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yP0xh4kV99kgd1AcA2l3d/UQipjFrUejVewu9LkYcSEJ9A6TpMqHmc6fA2gNXwtGCCSwYqjNuLQK9bgJREyi4vjEFzTciur3mTV318nhyeS6OGM9EdcW98LTrLYla59VCELvQmOwJpnInGTNjX+UtlVr1SaaxPwjcUgs+oqYDpYTHDeJhP79slNhHK6jQDqm9aHJwnYFXKlOmFOY6lMSl4WtWxqelKVqDVBURbOV1lwDHFi5QoF3QScJEIZFhrpU3X4kIdL2M+kyWOVoiN17ckxLhL5PI0UsJbcQ4tEZF8MUieA+y5LLdOqOfCNF71GFvzaTA7ShKQEPCtYKF/Z11Vj0NXgF3Q3m9L9oTfup32l3jvRuW+2YvlL0VzY1etO60IY0kjHBXSc2xCar/QuJKL3xIoBFqaoORpRylBcnpXQvo+NttfQklfpLIKL8CAZjXD5sit46X6SG8GDj8JgpIL0Sgd3i9znoqIE3NLyGjnbc8KY1yAHvJsj8rJJXxeh03eAkuM/iN7D/Xdj3YSbJwEvXmKY30I+I+p5egvbw1cLdl/uYGIrTSA++cVuTVofzD8dTiUB1lEj9/Fh+nsen1ftmbVspFoiJ0EX8SOBySpXbl2mhAd0vjMg/iF4+bMlgU/z36FddFFbHPr6WZ9wmOqdNPZI4qIP7El57KU4I6wMDDWEPX1ax39VIR8YueyWTinmAO8kouTSLoaqATyE0V9IxR4nuSfo81mQwvSIbGk4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(136003)(346002)(376002)(39860400002)(366004)(396003)(5660300002)(8936002)(6506007)(478600001)(6486002)(33716001)(83380400001)(26005)(38100700002)(9686003)(82960400001)(1076003)(86362001)(41300700001)(4326008)(2906002)(186003)(8676002)(316002)(66574015)(6512007)(66556008)(66946007)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?7Sk7iSMzwEBCEo4SqcawKwTzO/t/AobIy6mDSquLZUg2vR6nLzBimUwrt8?=
 =?iso-8859-1?Q?A1zT3EcycJ/f2cQZUO/9Kbbk0LsynMAJqEYwtFS5ws8lS/ecQMwLwoK+5N?=
 =?iso-8859-1?Q?F+Lx1OTzm2f5nl4cGzQ46tAzmqlmuqGCfl7fQ/m2nKAqrFIzX6brnn2dm6?=
 =?iso-8859-1?Q?DVGsyNZF7lr5KUViZl9LnxWQlZeJwEIz/rFkmjTjIn4YoLgFDR/Z2JwPMd?=
 =?iso-8859-1?Q?kiBMrCaySry1WnvoucAFvxOnYO3JLJCdbYqK75G2p00naUBjhNZgIq64Yg?=
 =?iso-8859-1?Q?YBUjgdqqeMlAK0AK0hkWIaaM83IJApK2Rn62/2KA5NTGp93+erVAaO6ZZi?=
 =?iso-8859-1?Q?tgUl+XJYVsoJC+6JCAo13g+ojiKanDNmmWRBWLyaalIKbMaKlQVsaiNDjL?=
 =?iso-8859-1?Q?ysLWEZkPmpxqlNwAWNjKNfiTrgqbTHLXnWSIW/g0Fj7NsWZ3+KpdpqYYGT?=
 =?iso-8859-1?Q?wth8Eb8/c3AqXy0Pl7MbOgdGELNDLy2Upn5F625R4yMrPf0j428ZjJQBM6?=
 =?iso-8859-1?Q?mYMpQN0OF/iCwEMQCOxzmE3aiL2waD+DhEmhXnDpFDZwTZL08qe/eRnWBZ?=
 =?iso-8859-1?Q?3sPE2zaHnRVcVf2leuDEu92Hma1z/d7r8FieH74//A+1DHk4myr65gPd+b?=
 =?iso-8859-1?Q?Q90VF5dhLT+4cCLdbOHQcZbebZBDqC/QvAZLzrh845/5dv7rGIWgMGU1Sa?=
 =?iso-8859-1?Q?DOp11wiOt61iWZUdM3hvXrRzRMBy7UhB7fUZU+t5z2uh831bJZPYR/7DJt?=
 =?iso-8859-1?Q?nFQPjU1uR1iyns+J2x0DZH3fcusHYczYhuC/H8F2QQNDNeyvoFNiKmLQyk?=
 =?iso-8859-1?Q?U/1WzsUFRFot/JDxjJxINFXEu6GD58VmzGMQvPnvKEYLiBbmxOaWS7J7A0?=
 =?iso-8859-1?Q?6gNKMItpZ2HWPZmNhDMO+/mLkIGffXsqrrR/k+4um8z8vlo6C49rxarNyf?=
 =?iso-8859-1?Q?HWkjchIXc4D6CA6ysSPnDsFDHptg1UyPLXoIgf0Erfb73qZDilfUzD/gX7?=
 =?iso-8859-1?Q?B1/vn7xG1itGK0Lpb+lVuKTe/YEDB6juR3XAK34WN/WflGSSH0qF4j7fOn?=
 =?iso-8859-1?Q?lT3YiEicUAC2yWJyoUNpR4JZz7yDlPt0f91mHoF+WjDYXQLV+Yi6xSTWyj?=
 =?iso-8859-1?Q?Gxdc0dFLbI4EJMxh9f/KJlxjAtJw8rgHzeqbO+QJHx2MIIyjY16mE9WfgJ?=
 =?iso-8859-1?Q?JLBrPKnhRtOKaV0pSkjaqUnKWKx5FjV2qzCAWt4Pvxi1Ix3/vF3NCa91bO?=
 =?iso-8859-1?Q?RqEU3WgDHHjTADyZ57KnYeM9GYSb4dNYJlUTAAr3D2+daE65ERf0qO9vbe?=
 =?iso-8859-1?Q?uwDgc3j0gXs6yPOjkyGWtLXWXu7OieaUN9X1sVnYcPf0L/CqHSd+fLSGtj?=
 =?iso-8859-1?Q?FXxZq4aviwpSMeI1mXIcQIN4cnIrRr/F5Z37PudfiATnUrSVfL/VE/MW3O?=
 =?iso-8859-1?Q?0NW3OCFHW3PJacUAX7tLDA43uH2ero13la/+GaEuQmaEOjZbe+XV1SQSzw?=
 =?iso-8859-1?Q?OLK59lOo6Vvmo/kxLlD3oR61cKEL4YsXeQkff9H32eJeNoIO/j5a3NjuFM?=
 =?iso-8859-1?Q?cLov6jIzzN1oYW+zfIxKQOZqq6xtKmCz6iyfwdwM7xbVQO+ay0XlVxFAJt?=
 =?iso-8859-1?Q?y4CKrqd89CTT2GxbzN/FlqB2bozJz5nKp8CC60ER1humdfaDc5jh5baA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa0e036b-da8a-4fa9-5c4e-08da57b718b8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2022 21:01:53.3432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Yyiv9NaLHrOZ9GvL6zcUEZR5QtcKlK2MnX7kejHhlxKoVQmUBFQLGepVHTqp7xaceyTF6Z0ZuvAZNIt4Xjpk3IQlHWEunvw/4hHpbd/rm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3856
X-OriginatorOrg: intel.com
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, christian.koenig@amd.com,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 17, 2022 at 01:52:04AM -0700, Lucas De Marchi wrote:
>Like was done for read, provide the equivalent for write. Even if
>current users are not in the hot path, this should future-proof it.
>
>v2:
>  - Remove default from _Generic() - callers wanting to write more
>    than u64 should use iosys_map_memcpy_to()
>  - Add WRITE_ONCE() cases dereferencing the pointer when using system
>    memory

Thomas, do you have any additional concern on this patch regarding your
previous review?

thanks
Lucas De Marchi

>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Reviewed-by: Reviewed-by: Christian König <christian.koenig@amd.com> # v1
>---
> include/linux/iosys-map.h | 42 ++++++++++++++++++++++++++++++---------
> 1 file changed, 33 insertions(+), 9 deletions(-)
>
>diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
>index f59dd00ed202..580e14cd360c 100644
>--- a/include/linux/iosys-map.h
>+++ b/include/linux/iosys-map.h
>@@ -337,9 +337,13 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
> #ifdef CONFIG_64BIT
> #define __iosys_map_rd_io_u64_case(val_, vaddr_iomem_)				\
> 	u64: val_ = readq(vaddr_iomem_)
>+#define __iosys_map_wr_io_u64_case(val_, vaddr_iomem_)			\
>+	u64: writeq(val_, vaddr_iomem_)
> #else
> #define __iosys_map_rd_io_u64_case(val_, vaddr_iomem_)				\
> 	u64: memcpy_fromio(&(val_), vaddr_iomem__, sizeof(u64))
>+#define __iosys_map_wr_io_u64_case(val_, vaddr_iomem_)			\
>+	u64: memcpy_toio(vaddr_iomem_, &(val_), sizeof(u64))
> #endif
>
> #define __iosys_map_rd_io(val__, vaddr_iomem__, type__) _Generic(val__,		\
>@@ -354,6 +358,19 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
> 	val__ = READ_ONCE(*((type__ *)vaddr__));				\
> })
>
>+#define __iosys_map_wr_io(val__, vaddr_iomem__, type__) _Generic(val__,		\
>+	u8: writeb(val__, vaddr_iomem__),					\
>+	u16: writew(val__, vaddr_iomem__),					\
>+	u32: writel(val__, vaddr_iomem__),					\
>+	__iosys_map_wr_io_u64_case(val__, vaddr_iomem__))
>+
>+#define __iosys_map_wr_sys(val__, vaddr__, type__) ({				\
>+	compiletime_assert(sizeof(type__) <= sizeof(u64),			\
>+			   "Unsupported access size for __iosys_map_wr_sys()"); \
>+	WRITE_ONCE(*((type__ *)vaddr__), val__);				\
>+})
>+
>+
> /**
>  * iosys_map_rd - Read a C-type value from the iosys_map
>  *
>@@ -386,12 +403,17 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
>  * @type__:	Type of the value being written
>  * @val__:	Value to write
>  *
>- * Write a C-type value to the iosys_map, handling possible un-aligned accesses
>- * to the mapping.
>+ * Write a C type value (u8, u16, u32 and u64) to the iosys_map. For other types
>+ * or if pointer may be unaligned (and problematic for the architecture
>+ * supported), use iosys_map_memcpy_to()
>  */
>-#define iosys_map_wr(map__, offset__, type__, val__) ({			\
>-	type__ val = (val__);						\
>-	iosys_map_memcpy_to(map__, offset__, &val, sizeof(val));	\
>+#define iosys_map_wr(map__, offset__, type__, val__) ({				\
>+	type__ val = (val__);							\
>+	if ((map__)->is_iomem) {						\
>+		__iosys_map_wr_io(val, (map__)->vaddr_iomem + (offset__), type__);\
>+	} else {								\
>+		__iosys_map_wr_sys(val, (map__)->vaddr + (offset__), type__);	\
>+	}									\
> })
>
> /**
>@@ -472,10 +494,12 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
>  * @field__:		Member of the struct to read
>  * @val__:		Value to write
>  *
>- * Write a value to the iosys_map considering its layout is described by a C struct
>- * starting at @struct_offset__. The field offset and size is calculated and the
>- * @val__ is written handling possible un-aligned memory accesses. Refer to
>- * iosys_map_rd_field() for expected usage and memory layout.
>+ * Write a value to the iosys_map considering its layout is described by a C
>+ * struct starting at @struct_offset__. The field offset and size is calculated
>+ * and the @val__ is written. If the field access would incur in un-aligned
>+ * access, then either iosys_map_memcpy_to() needs to be used or the
>+ * architecture must support it. Refer to iosys_map_rd_field() for expected
>+ * usage and memory layout.
>  */
> #define iosys_map_wr_field(map__, struct_offset__, struct_type__, field__, val__) ({	\
> 	struct_type__ *s;								\
>-- 
>2.36.1
>
