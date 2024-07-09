Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FD592C556
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 23:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B287110E1FE;
	Tue,  9 Jul 2024 21:31:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NjkFehGR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8125A10E027;
 Tue,  9 Jul 2024 21:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720560718; x=1752096718;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=u77mU4i0p4Gnh4Lhp9cWgbg1Gp4XLoVW3lHkxrzAqnE=;
 b=NjkFehGRvRLvbtv7SQtKsGv4yp+b2NJkP/iW5p1YRpfsiTFnKuVof2Nc
 H/U8uFe3xg/g8foZjxV2rQ2oBFtUF5A94i0FzA/kC89caaNV4tJT2uv+C
 8IG/7VG+Z24u4GjktFJx+Znx0o8ZuheDAf3Ps/qJItenshyvkUMl5tWow
 NZf55eJ+JG2iCvoIp0GpVWbieetALCWmkq8/XyxC6wQ7elPpnt7AlSLoK
 zHm+YWuJLiNrtKJXaRpICk5GHWGVP3ukAgxZYkk9cPkLALQ24/WgrF/63
 5C6HYQFbK4G6Cyiqcayy8PjVini1xP3SMtp3DpRRGUO0y1VIys23tQhMV g==;
X-CSE-ConnectionGUID: A1TKor/JQ4a++Qc8x+2Edw==
X-CSE-MsgGUID: ThHNvj0KQQ2Q0WSF/CLKsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="28442211"
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; d="scan'208";a="28442211"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 14:31:58 -0700
X-CSE-ConnectionGUID: 1vKkArvdRPyYomAhBzlJlw==
X-CSE-MsgGUID: YzlE2gDEQJGQvM+PAND0mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; d="scan'208";a="78726009"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 14:31:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 14:31:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 14:31:56 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 14:31:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fGxnJD9ZR7WtjwzM3pSa3IuHKOvYdZXODVnQJeYc0T79E4qqU+YRnLSVY2RxOomAcOGhtgBqd1OnE93+8EXeMOdhXkk8fD+EKQevSdjpY+9GHmezod+iSO4FGubZuGEKeJvyPcCyRoDdAUrOJxCg0xCN40EQhCwaG/zvw85YFk4Seeb7wJ2qDwJy/AEqZFBx3O0cy2zjhGpkgmGQUj/KMAFSUzQuhiiwGPFL/BxOkcVgIs85aa42ZZULAGn7AQiVvumht2YF9uBwFAK/O9UCjrLTM7uvUcAnYw8MTciePy7eOfBwrlLz3RgCLuzudxavsB1aNSi5ccasJfgzU3SMGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQbYRxukLi6o+8coxYNZ9rJcJw1auLbP37QGwpJKWsk=;
 b=oYAg/1qirLMCcRwb4KfbwHmioAtkxvS4xZxwNBNeXvCnBldYudjlYE73EYKOKIUI/R6Hjh+86ttiedpHcyxrYIRpOuBoKpTNh3AiVRLLaIhj/lU2br6Y0PFSFCxjAlgo7TNHZz2lGyUR/+3pqXbE+CMlFQ+sE8+5aMLc+igHlthNeKoK369n4FVgsXANRQNf8Xk7HD1UuV6Gj3F8Z6Ox3cou2JkGwgPFleSa8lXJaW8Nm+lZWIdxSoQACcJUE1ywPWpFQt208z6fMuVNzProdzPEhS/pVnNDmRMEqJ12qGVYsn+kIco2wrw+ArmLwJHDx7/7NzUV/gTFgyhkAvL6Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) by
 SA0PR11MB4766.namprd11.prod.outlook.com (2603:10b6:806:92::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.35; Tue, 9 Jul 2024 21:31:43 +0000
Received: from DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095]) by DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095%3]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 21:31:43 +0000
Date: Tue, 9 Jul 2024 17:31:39 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-next-fixes
Message-ID: <Zo2sO4t32dxqy6Q7@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::20) To DM6PR11MB2859.namprd11.prod.outlook.com
 (2603:10b6:5:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:EE_|SA0PR11MB4766:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a6b4a8d-8f18-4d3f-1bf1-08dca05e8732
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Y8bA/OFE3ynDl49zSaL1Qs/fEfgZf9M0rwAUYmuKF0VcneloBuTGnEf1Dc?=
 =?iso-8859-1?Q?sD9LB9H19x5nXyQUHA47sA0DRyNSoP59mLdY7nbza5FD2YAFabjD2IHqg2?=
 =?iso-8859-1?Q?LB56vEjsX9d5NZ88NWWnxaMHq5ac+8lSTKYFcJkz41arWWeXhtX9W0ClHA?=
 =?iso-8859-1?Q?3S3e26TDCJRlaWOKM0zrIqW4+lk+QyPGqOu6XT/T8Fvk4cBJVL9BVynzcA?=
 =?iso-8859-1?Q?RuUhJQwLR5VJIZCdgmwRmC5r/9U2pBda6DfkeaLfKEIBD7NYocWVcMiwin?=
 =?iso-8859-1?Q?XNqvhh9/tU+qJRARvVbZHigvImxrQ2mIa6eOS6OyGfTFqmLyIdLxPn8xEQ?=
 =?iso-8859-1?Q?7B5n0QNXSzux+yDtufDuMVKFKaXDtmtKe0dD1JKorvL4zbk+yXfgIxa8OY?=
 =?iso-8859-1?Q?dxziOC9Z+2grrAD3vjvIrA5W84ESUt20IQbEyLJaYk/SwZO6M2DBze1xZe?=
 =?iso-8859-1?Q?O3Iygq7kTdExjN21QmN9yhIYUOv+nU6wcOR0CUSa+FxEIxLFjqL2OM9SG7?=
 =?iso-8859-1?Q?IheXmq58GQyLDsz5EepGsEZOCwDYz6+1lRNI7t9juakTisG2P/kH46WvV5?=
 =?iso-8859-1?Q?w01FEiumOdLU6Se7dOfejbyqhRS8nlNsknq1BadICv0sQM2gcG3YLir6nW?=
 =?iso-8859-1?Q?9pbAbf29EpsfDOzgg+7AmBLLZuAvML6R1iULtXrYlJw8SH2MDVEoB8k+s/?=
 =?iso-8859-1?Q?ehBuNSQWx8AjMNSpQqIOe0WF8Flr3a5KHtoCFoELPXnwOVxYkjuBfNcBSH?=
 =?iso-8859-1?Q?0ARSzbhwYyRWoK7HPxyGdDqIMDqSIEZtopG2xeGG/UOZ7IZIIk2IFoMTs+?=
 =?iso-8859-1?Q?tZl/5aPPdJ08mmw+8nktP+hAUAY+eVJQy1bWrP4/vk3FCVhq1lslSbOrZS?=
 =?iso-8859-1?Q?ielmKiwk23kFpnEtkiIIh1/iGo/TduCKEmkjhrDZPrR8n2oWVS8FypQkiY?=
 =?iso-8859-1?Q?DN7wDH1lw77Nnma95rQKBWcSF2uqWEiQo4JmZCGvDLInHvc9zW8IrLGxE+?=
 =?iso-8859-1?Q?f+g74MVCDhIc3DZ6Qin16zEoGzEkXY4p3L9huC1AmuTmQvTnEYfkn+Qb3q?=
 =?iso-8859-1?Q?lA+mS4RtM9mxvzkgvlr7bi9zBFJ39J5dXJlTxP/YywC3kBXr9ytVeM7u1t?=
 =?iso-8859-1?Q?gT2ppnx878Y89MEP3o531kaZvdL+sXgFJW/MkbpBNwvgFIJyW2eJey8wqz?=
 =?iso-8859-1?Q?mY695kpQiqK0iS/An6bCuscszYJzG9iPju4HDjkycccVhmYT+GttYyrwB9?=
 =?iso-8859-1?Q?zS0NU2P3FYhUy70rrutkSalduEDFJCHzvLuy7FkqSxrbb+Q5A2hcU7YqB1?=
 =?iso-8859-1?Q?kYuMvtZGjzVU/96yZo1At6j3n+ea4VCvulM/G+KJGhSj6rw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?DgWsmZq6/KPavm8N1tnjjfUmf38EYCbNjjSAeBzYrTVaxjXUWNoyT/hiDi?=
 =?iso-8859-1?Q?dnq2LFUWgghTwuS5rn5959o7tk9fHDP+9HzrZqIXIFiCZx3mfxy5E1lnra?=
 =?iso-8859-1?Q?DJOApSM6vaqIbPuHeP5S8jFobJdncTQJ+El4XSmideWbBCsxsWCt0Qw2Fm?=
 =?iso-8859-1?Q?21W7qGZloDe/CClFC0WmCf7xFop1yNgvLXb0TSv4MBb/I54WIMbi/bGeWn?=
 =?iso-8859-1?Q?towPnUNJP1F/XyFuyPr8N0Y61BZcOejsDQjZY2wBi+mk5iE5G/33JOqDbe?=
 =?iso-8859-1?Q?KJqwRYaGcus2Aa0TnzPc98OMe77LxjL3gqeTWHa2F5t3m+P+gDQ7kNS027?=
 =?iso-8859-1?Q?Om6Y5mfKdjMb0UOduYli+Zr+UXlDUYDzxO7tNKF2BkPmZ/JDovqXJ5y8jI?=
 =?iso-8859-1?Q?u8P20GAo5DlIZnq6HHp7NraWhqYmCwUZ/ThgYFgklnkIdKdm0axmbDtkb4?=
 =?iso-8859-1?Q?xMwpqNx4vZxqKmSoI0BGbHfNw2J5/MthpxqjoA0jB83NZvvf8TmJ3wAYMe?=
 =?iso-8859-1?Q?aNJNgqmx8Clsc0glJqrk5JzF5fgqqJS6oyeixCLbBM6xNP5NTbHez/BkbU?=
 =?iso-8859-1?Q?ToUcRnbMT65TWxryGTLPlN0zcJd7k/ffswsD+A66+TUAlpexTehatgjPPQ?=
 =?iso-8859-1?Q?KgFIb15iO3ElcAxrVJXH1qXeKzmA5xzJhnTmdyfUDmWdmf881C2DmLupI7?=
 =?iso-8859-1?Q?j1e8yo5dZrxSQ6kiWR2QcZ1Pf8lHj4UNMs7OadL/ujISE0F+g+Dx8mjNPd?=
 =?iso-8859-1?Q?nQ2Erew+5iR/0wNhUyfqlOScaoPN5t7O9v+NCgLBcQ7x+ZAWQuZRfx37I1?=
 =?iso-8859-1?Q?9qWRfJT5b5EcXgEeZ+I8ZAIg3rQqoBsrkOl0ysWaAGoohwFf+S2v51x6W6?=
 =?iso-8859-1?Q?gJo7DhRKuQwiO6iX5v6OGaQC3SBrKFuRusf6gkCskVTRn8xmOr0aPtC2bw?=
 =?iso-8859-1?Q?JFrMACHdT6EcJcmCjgGwVZiLT6K48j2e6vuim9EgwK1KeSNUsiUZ7kwWF/?=
 =?iso-8859-1?Q?16uvzEA+9XreSViNkEwhJSAnnxz8TphbYVHBlfp96TtcUE+1K17efFdqrE?=
 =?iso-8859-1?Q?sDYA9kaiqcvlnZEv8pPxEPiAQETO1DjycZawv/0eiBgHTjIhJOXHPbTs4r?=
 =?iso-8859-1?Q?Lzfp5COSYz7kClxLgUBVkdcV0MJoBRU0gEEfoSWVsGO+NVwmWSTXuQz12j?=
 =?iso-8859-1?Q?Nir5JLxccnYBEWV1tKNU8hSe3GVdpuazTAuGnES3njohBakxgeB+SJNaj0?=
 =?iso-8859-1?Q?N5gH++KPv/BOaYCFcxGRpFAs2cOw0OwqxbSErvaCFd6RaCWsDHlrTWweam?=
 =?iso-8859-1?Q?/zfw4n7GZE/E8K4HYKZ1SP4ixq/1f1pP9QatGXwybg4c1Adhy802tNrMVf?=
 =?iso-8859-1?Q?japos+rpAIHpgAkj1mH45K0kTqYgjROpurQLrUyeqLmCe1N4lkISpYjw20?=
 =?iso-8859-1?Q?bMqiAHgg/MvizBsXBXT4Cv6jFNWPspfMoEqaGpIyISZX0ihYs+9o7W6Aw8?=
 =?iso-8859-1?Q?9b+tIZjcdsnupzyPq7J2/a7TuMKBMEi+j/FwC7k6ti8k+U41pNeOYXmyr4?=
 =?iso-8859-1?Q?cc88F4QnRq3kk0LTE0Uuk/UrEUl3VI6WovCLZzCUWiJTMPZpJXR48ShGmv?=
 =?iso-8859-1?Q?DGPGR9aQKXL+fgDZKdCOOSLv88g9qrmCJdyig/xpjBbe3LE75B0zoH2w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a6b4a8d-8f18-4d3f-1bf1-08dca05e8732
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 21:31:43.7504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4mekvc6FzeCLf8D943G6D3D6jx+MohxzrLlZr8Ieq95qwoJLpGA++hCZYJrVELG7uIeojp10ca/1rvyddTSJ+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4766
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

Hi Dave and Sima,

 Here goes a very early drm-xe-next-fixes with 2 important fixes
 that are going to impact user space.

 1. The first one is the rename of the OA stuff from the bad 'perf'
 name to the xe_observation. Although the rename in the uapi
 header is likely inoffensive because our UMDs always copy the
 header to their code, there's a sysfs filename change that is
 impacting mesa.

 For this one Mesa MR is ready and they are only waiting for this
 pull request to be picked by you so they can merge that to Mesa:
 https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30027

 With both sides in place, there won't be any kernel version
 released with the bad naming and no Mesa released using that
 filename. This is the main reason that I'm sending this PR
 earlier than normal.

 2. The second case, which also impact user space is the
 write-back caching mode for system memory on DGFX. In this case
 we introduce a limitation in the cache selection uapi that is
 transparent to UMDs. I mean, no change on their side is needed.
 Coherence is maintained with some know possible visible and
 acceptable/accepted differences in CPU access speed.

 Thanks,
 Rodrigo.

drm-xe-next-fixes-2024-07-09:
UAPI Changes:
- Rename xe perf layer as xe observation layer (Ashutosh)
- Use write-back caching mode for system memory on DGFX (Thomas)

Driver Changes:
- Drop trace_xe_hw_fence_free (Brost)
The following changes since commit 62a05f4ae9c1fb70bc75d494c9c1c373d2c2e374:

  Merge tag 'drm-msm-next-2024-07-04' of https://gitlab.freedesktop.org/drm/msm into drm-next (2024-07-05 12:45:41 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-fixes-2024-07-09

for you to fetch changes up to 463108053c19f24fa228863824698d5ca72826b6:

  drm/xe: Drop trace_xe_hw_fence_free (2024-07-09 16:21:26 -0400)

----------------------------------------------------------------
UAPI Changes:
- Rename xe perf layer as xe observation layer (Ashutosh)
- Use write-back caching mode for system memory on DGFX (Thomas)

Driver Changes:
- Drop trace_xe_hw_fence_free (Brost)

----------------------------------------------------------------
Ashutosh Dixit (1):
      drm/xe/uapi: Rename xe perf layer as xe observation layer

Matthew Brost (1):
      drm/xe: Drop trace_xe_hw_fence_free

Thomas Hellström (1):
      drm/xe: Use write-back caching mode for system memory on DGFX

 drivers/gpu/drm/xe/Makefile          |   2 +-
 drivers/gpu/drm/xe/xe_bo.c           |  47 +++++++++------
 drivers/gpu/drm/xe/xe_bo_types.h     |   3 +-
 drivers/gpu/drm/xe/xe_device.c       |   4 +-
 drivers/gpu/drm/xe/xe_device_types.h |   2 +-
 drivers/gpu/drm/xe/xe_gt_types.h     |   2 +-
 drivers/gpu/drm/xe/xe_hw_fence.c     |   1 -
 drivers/gpu/drm/xe/xe_module.c       |   6 +-
 drivers/gpu/drm/xe/xe_oa.c           |  34 +++++------
 drivers/gpu/drm/xe/xe_observation.c  |  93 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_observation.h  |  20 +++++++
 drivers/gpu/drm/xe/xe_perf.c         |  92 -----------------------------
 drivers/gpu/drm/xe/xe_perf.h         |  20 -------
 drivers/gpu/drm/xe/xe_trace.h        |   5 --
 include/uapi/drm/xe_drm.h            | 110 +++++++++++++++++++----------------
 15 files changed, 227 insertions(+), 214 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_observation.c
 create mode 100644 drivers/gpu/drm/xe/xe_observation.h
 delete mode 100644 drivers/gpu/drm/xe/xe_perf.c
 delete mode 100644 drivers/gpu/drm/xe/xe_perf.h
