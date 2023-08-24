Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B37E786E10
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 13:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6570410E528;
	Thu, 24 Aug 2023 11:35:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 457A710E522;
 Thu, 24 Aug 2023 11:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692876938; x=1724412938;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GpbPBVyEtoxMbScIfmAQbpSEEOfhdO9sOioNKjtnVc8=;
 b=YjWDTE6Lf4G819iKtMoz16pwh5Cl2X7DkPnTS56H8P8oDSkPD0XjNr1D
 CP+RfKhdp+SyFEr+WgylY+Vyu0g/eCk3OuUsT2ve9XvZLQO+M8COYW2uF
 XNjUxolDQkNWKnVC256HMWW38+Y3L1zhfPfVk/vzpqioI+nLF+BFKCqSe
 pK/qKdfWvbnzrqGscCwfI5wXNZuis2Aw0K2gVu+9jHK+C0GfG7fww6O+3
 PM8Y23xPob9f1EQ0uB5neCaQ9od6ZP/WfFXIF6HgwOMOEMU6dExea+sWH
 vaw2mbTnJM97LeECIk3skfXh5XZdo0SyGLOkIywXpbXzdtM1whysQgvvn w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="460771909"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="460771909"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 04:35:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="880770413"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 24 Aug 2023 04:35:42 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 04:35:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 24 Aug 2023 04:35:36 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 24 Aug 2023 04:35:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SW/xsWuw9Pl8cJpybnxDpJVh/LyIXw0MA5fNm+p/0a5ghEKmK+CziB55ifKuPi2H3zAevB7QutBa3TFAKG5X/Bdy5LCNvH2N7w/TEt7LBK8qalEWJn/YYR5lPNiefRlkyL+pKxISikrWvNYT4G4qCdNEPg9g6D7PHOHKehj8rQGXRC1DsYPnadfAmLYP5wDICKru84uhGXVdeJ88tyRsx66ciLX+Xlm+Pu074wPDg2L7JfP8iGBL6aPw0i7TZ+EwLBu37JLWxVdyVnFGEo3pa0YtxD3qJ9UeAkbf66xjNzqUkf5NVI8T73z9KrCrbDW43OrbuFdcakVWqpgPQLMLrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/mXpe+EARnapbvtl/PWq1/1vCNNzLNKLKLBdNv3wvKE=;
 b=eM7CkjDWJPbq+Ly1Setg82oRE/8w27JdwBEYmqRCp9owNgyUhLriNlU9p6veluXY1IsgFv668WeMXfDWi1kLPeGZAGHezgqrWzIY6rp2DkVXWjyxPsePpE7LM7881umpDtVQPA+GbW8zBVejo5Pkzy+ltavoG8VVCYwNOFuLiEZmkBRVKncLeiIwsXggUrnrO7FN/4lr5g6DTaKKxFY7B0rQXsWDp86MOtHzdULNxeCmLsa1F6YIIVrQR8selFbeefBdJAJVTNzPows/5JfWv7hJ5qTNvPx+3iYWGruCXmwjI88Rk+mi+FyMrka6qTNorWJSJeqZ8e3tGdUw5WATVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CY5PR11MB6319.namprd11.prod.outlook.com (2603:10b6:930:3d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 11:35:33 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::ed57:a908:f0ad:13cd]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::ed57:a908:f0ad:13cd%7]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 11:35:33 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH 5/5] drm/i915: Implement fdinfo memory stats
 printing
Thread-Topic: [Intel-gfx] [PATCH 5/5] drm/i915: Implement fdinfo memory stats
 printing
Thread-Index: AQHZsNNkPzIudN1Zu0+lCzKFDAJ2WK/5msSw
Date: Thu, 24 Aug 2023 11:35:33 +0000
Message-ID: <SJ1PR11MB620442619CCB434B2A5A87EF811DA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230707130220.3966836-1-tvrtko.ursulin@linux.intel.com>
 <20230707130220.3966836-6-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230707130220.3966836-6-tvrtko.ursulin@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CY5PR11MB6319:EE_
x-ms-office365-filtering-correlation-id: ab05e852-4433-439c-12b4-08dba4963a5f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x0H6kFk7KMONvarclJvJWBdLUBSOKDxi7SHmw3THcYYTEJEJdUeD8syQysim+94+UI5a308iDrZe50pFKf+//FtL1ebmVXJ+csNk8aoDb2s5ZQ0z9JXANG3k4rfxixT3lXw1sFZsBD9IQopO+PL/EJRFDqdLfnXTGm782RIDB2BCW1XPKtKU8JZGY+kq58aWpj2TAqR8AkdmRogcVdaynbI5uB1xePTx+/i9Pg1MFuSVUj8uw8prYA0Cz3Mp77rx9L1pakhk+PFdF8hu38MJRy9AzbgSvo6qSXhU+NK51lxKkHmdTn33217JHxz2EPlcf2ZebycIWaAirrWjHz6AI4PQ1aM0JrO2XLoV8PYLiH0HETA5m1GBryNfVbR5JTHxXcNZ4q6xdQGKmd280YrWqZOGy81obIYqPSNk8VWzZlTlu8gvjqoUMGPZ4d8ESkRT3RwSuAba+nhkxKtHjtRkyPXnmmAd8Bk7rJhI/cOUau3mevGcgggql7o9AgCBjJIHScI8ao9g9uMb2ANyC1CxqICZFOZUwERWYb7J65yDtzUCzKGOxi++cJcUz/HCv2VXGiGcHJhECe3m7hC/AqplKqzBMpLTS8lKAudGMprR4u10PyqeYG2NqmOL/CuneLYs
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(396003)(39860400002)(376002)(346002)(451199024)(186009)(1800799009)(66446008)(64756008)(66946007)(76116006)(66476007)(66556008)(316002)(82960400001)(122000001)(478600001)(110136005)(55016003)(38070700005)(38100700002)(71200400001)(41300700001)(53546011)(86362001)(2906002)(6506007)(9686003)(7696005)(8676002)(8936002)(52536014)(5660300002)(83380400001)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?a06ez6+1kR6jEizXUcOBDQLzhcPeesDoSngUaafUnMSyelEDwFCKoCQvW/Wf?=
 =?us-ascii?Q?X9Zu/L1T4Qw9XCHc6d05d4TNSo8uICjW6X0tmleeB6ak7VOhqwjfCwQU/grk?=
 =?us-ascii?Q?iYuaQ7sRwhxnF7UIF5S+sQw8MfnX1Ev8+htWolLOeEVTVk7VhPi6gVbFjAkX?=
 =?us-ascii?Q?nSsxB7TaSM57AFiXVe4QwmIOk9o0jEZYuzqtHYd79J9GUqODlu47YiPM8t7x?=
 =?us-ascii?Q?slWdOt3v1DPchsBlHXwJKia3AAgpZ9crfUaEAFQW4owErSZfafP5NZ4u8tfx?=
 =?us-ascii?Q?gq+euyMeVz+4mqy1svX0+Zp/2IhlHRHGjkU8SEURixtlstvFlyam9GE4+EeH?=
 =?us-ascii?Q?T6h6br0ql+zE4WN56nhjijxGvnkfQe2JR+b8aDNAE/PqK5jPAqqavf7Otrtq?=
 =?us-ascii?Q?qD3JKiIkxqnaw4/fBQke7Erj7XCIg8U4hCk6spvJdLXSPG6js6CoYTpAi/Le?=
 =?us-ascii?Q?ydB8JGTJ5G3ujf1JaCIU8XfOh6xQJUS4ANjrGSW5kOsdWbBbVkVvvAHFOOdL?=
 =?us-ascii?Q?eygsnWnrR0yCkogtcEfLZSw9/MW4Ors2tW3Y+V1iiq8d13n92HJA2YROSlXJ?=
 =?us-ascii?Q?1t+hs2a4lWgXtitiEbB7KJ7O6U1GPPjZp8SI2ke7pBiV0gZmqvSz18nIGi9T?=
 =?us-ascii?Q?Vy9swGk3tDodlk3K4rVRmvUxWufx/6gfwPgIs7cRRzujJEF3bQL7Vs6w9LaZ?=
 =?us-ascii?Q?pu1Fx6aPg5XwwV8uARhDjWeRO8M+trVUt8ec2j+RjLZ1XEwR1ww1uwqzVZ7D?=
 =?us-ascii?Q?uUFZf51BdxuDiv1H8J8FYgvG8qiSRVvoAsB9AhDS7S0Xpy2AYfvBGbOVk49a?=
 =?us-ascii?Q?xhs+B4llYbcGR9PHpK62UmTerAn3x9fKGgIdoGx4npDJQU0uTYYPv48EuCeO?=
 =?us-ascii?Q?9Nn4LArnrBZTCrLdc8TEX7b45Q9Y4oJEdFAPsV+GaDQ8b0BTsHgG8FgpYvRX?=
 =?us-ascii?Q?bcz4IwVDGasRGUdRrXWxyg8rA1EjWYUIjS6Xj2jsti2h2iDvuWT7SdMCl9iz?=
 =?us-ascii?Q?vKL9PLjrer0FwwjF2QEQLk96YpPHcdZoORVwjiw0WuF0jFPRQX+VeCOcYias?=
 =?us-ascii?Q?BQwZJuhcuWLlejU0RoHHusfB2VGQmRRdRXEsr8Fmfe1JZObC+d2d3+JDJlDR?=
 =?us-ascii?Q?5tyswP/9Hh/kM//w0/zGcUr055J0t67kVz91c8qL0T2ectrT+ayBR5yseNQN?=
 =?us-ascii?Q?PVSpsxLV1VaPP2Qz18m1stE3WxitAoT4BWD6poLu1wnPP3zX/FbUr1uSHN02?=
 =?us-ascii?Q?qnxv1Z83L5jR1Gg+vrgO5k0VJ2fmhZ9nVP7GVb10SZJxsr8qOzz+39Qdmgfp?=
 =?us-ascii?Q?kcSTeZ6jUDpV7GzXKVRkDAJRCkTmZhx7dfXt6ncEDtQIDQyskrGhdyf9QPAJ?=
 =?us-ascii?Q?7bM1VevrZxGU+F3CjcU+K6t+2flDXDk63XSXSRxcdlybiELkuxQ8Xm4ckexm?=
 =?us-ascii?Q?rZT2Jh1M/AX6tN2mKMEQR1gqZCIukEve149icQ17Hzx9kbx0PI0R2TwANMmz?=
 =?us-ascii?Q?YDt5eus3sVLtgKYoqltTPl3vkVsmGTWdF/nyytT5WNevq/wCvSCMUnvjGTP7?=
 =?us-ascii?Q?QVYBj5Gs1fbOvZnvfnw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab05e852-4433-439c-12b4-08dba4963a5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2023 11:35:33.3973 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wMmleLmao7ZM0SC3EqTaeI4gx6ELswAqKRqLnJiIJ3VAyQ0XAaOBBsE4+PnRSh7DK7C5yrLVml3lb0Dom6RVDTwOiM7nZC+TYaSUSWX3zjE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6319
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Tv=
rtko
> Ursulin
> Sent: Friday, July 7, 2023 6:32 PM
> To: Intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Subject: [Intel-gfx] [PATCH 5/5] drm/i915: Implement fdinfo memory stats
> printing
>=20
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>=20
> Use the newly added drm_print_memory_stats helper to show memory
> utilisation of our objects in drm/driver specific fdinfo output.
>=20
> To collect the stats we walk the per memory regions object lists and
> accumulate object size into the respective drm_memory_stats categories.
>=20
> Objects with multiple possible placements are reported in multiple region=
s for
> total and shared sizes, while other categories are counted only for the
> currently active region.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Rob Clark <robdclark@gmail.com>
> ---
>  drivers/gpu/drm/i915/i915_drm_client.c | 85 ++++++++++++++++++++++++++
>  1 file changed, 85 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/i915_drm_client.c
> b/drivers/gpu/drm/i915/i915_drm_client.c
> index ffccb6239789..5c77d6987d90 100644
> --- a/drivers/gpu/drm/i915/i915_drm_client.c
> +++ b/drivers/gpu/drm/i915/i915_drm_client.c
> @@ -45,6 +45,89 @@ void __i915_drm_client_free(struct kref *kref)  }
>=20
>  #ifdef CONFIG_PROC_FS
> +static void
> +obj_meminfo(struct drm_i915_gem_object *obj,
> +	    struct drm_memory_stats stats[INTEL_REGION_UNKNOWN]) {
> +	struct intel_memory_region *mr;
> +	u64 sz =3D obj->base.size;
> +	enum intel_region_id id;
> +	unsigned int i;
> +
> +	/* Attribute size and shared to all possible memory regions. */
> +	for (i =3D 0; i < obj->mm.n_placements; i++) {
> +		mr =3D obj->mm.placements[i];
> +		id =3D mr->id;
> +
> +		if (obj->base.handle_count > 1)
> +			stats[id].shared +=3D sz;
> +		else
> +			stats[id].private +=3D sz;
> +	}
> +
> +	/* Attribute other categories to only the current region. */
> +	mr =3D obj->mm.region;
> +	if (mr)
> +		id =3D mr->id;
> +	else
> +		id =3D INTEL_REGION_SMEM;
> +
> +	if (!obj->mm.n_placements) {
> +		if (obj->base.handle_count > 1)
> +			stats[id].shared +=3D sz;
> +		else
> +			stats[id].private +=3D sz;
> +	}
> +
> +	if (i915_gem_object_has_pages(obj)) {
> +		stats[id].resident +=3D sz;
> +
> +		if (!dma_resv_test_signaled(obj->base.resv,
> +					    dma_resv_usage_rw(true)))

Should not DMA_RESV_USAGE_BOOKKEEP also considered active (why only "rw")? =
Some app is syncing with syncjobs and has added dma_fence with DMA_RESV_USA=
GE_BOOKKEEP during execbuf while that BO is busy on waiting on work!

Thanks,
Tejas
> +			stats[id].active +=3D sz;
> +		else if (i915_gem_object_is_shrinkable(obj) &&
> +			 obj->mm.madv =3D=3D I915_MADV_DONTNEED)
> +			stats[id].purgeable +=3D sz;
> +	}
> +}
> +
> +static void show_meminfo(struct drm_printer *p, struct drm_file *file)
> +{
> +	struct drm_memory_stats stats[INTEL_REGION_UNKNOWN] =3D {};
> +	struct drm_i915_file_private *fpriv =3D file->driver_priv;
> +	struct i915_drm_client *client =3D fpriv->client;
> +	struct drm_i915_private *i915 =3D fpriv->i915;
> +	struct drm_i915_gem_object *obj;
> +	struct intel_memory_region *mr;
> +	struct list_head *pos;
> +	unsigned int id;
> +
> +	/* Public objects. */
> +	spin_lock(&file->table_lock);
> +	idr_for_each_entry (&file->object_idr, obj, id)
> +		obj_meminfo(obj, stats);
> +	spin_unlock(&file->table_lock);
> +
> +	/* Internal objects. */
> +	rcu_read_lock();
> +	list_for_each_rcu(pos, &client->objects_list) {
> +		obj =3D i915_gem_object_get_rcu(list_entry(pos, typeof(*obj),
> +							 client_link));
> +		if (!obj)
> +			continue;
> +		obj_meminfo(obj, stats);
> +		i915_gem_object_put(obj);
> +	}
> +	rcu_read_unlock();
> +
> +	for_each_memory_region(mr, i915, id)
> +		drm_print_memory_stats(p,
> +				       &stats[id],
> +				       DRM_GEM_OBJECT_RESIDENT |
> +				       DRM_GEM_OBJECT_PURGEABLE,
> +				       mr->name);
> +}
> +
>  static const char * const uabi_class_names[] =3D {
>  	[I915_ENGINE_CLASS_RENDER] =3D "render",
>  	[I915_ENGINE_CLASS_COPY] =3D "copy",
> @@ -106,6 +189,8 @@ void i915_drm_client_fdinfo(struct drm_printer *p,
> struct drm_file *file)
>  	 *
> ****************************************************************
> **
>  	 */
>=20
> +	show_meminfo(p, file);
> +
>  	if (GRAPHICS_VER(i915) < 8)
>  		return;
>=20
> --
> 2.39.2

