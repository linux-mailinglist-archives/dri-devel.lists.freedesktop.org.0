Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 613815A7BFF
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 13:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0866A10E31C;
	Wed, 31 Aug 2022 11:09:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE0DF10E31B
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Aug 2022 11:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661944181; x=1693480181;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=VATis6BTFsSvnxREJnqrwc9uyTfRQOssQOdMWOKcmUI=;
 b=JQidJzlqieVQyb1e+BMYm2tXfRv66u180aTXzDnSinu1NFJXcHvYNk1V
 ZWKFKkI2+Zbfh7CT+auYr7aKtyoyUwfNVoba94fC3843jj6WO6rS2JeTd
 Gx16txIWC+HTmPDaNnE4wz/kQR7s4xIwekYj+rYNePagctNOTGuHUg8CG
 PDQUFVibZW5tu1I7YK+RbwkRmcCL2Ttx7mUwncK9yiUCm3vZuKJeeYEni
 srBf4VnZHRguYueuI1EnElFoV53u3iFF/xkZFA3TEKL+bpK8ym4qVZJue
 rfIMwxluOPt9niJ52Y7AX6AU6xI/iMn/jrHSpjQurQp8J6JyBCB2E+YuF g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="296703604"
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; d="scan'208";a="296703604"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 04:09:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; d="scan'208";a="857431369"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 31 Aug 2022 04:09:37 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 31 Aug 2022 04:09:36 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 31 Aug 2022 04:09:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 31 Aug 2022 04:09:36 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 31 Aug 2022 04:09:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QYVO8ZB5YTTq87/UB8n3zasWH7Rvc2Mf+9+Ll4vJVrknbkU0Y4uItmL5NNhyVSGIcCi/3qY2Qefap9Dm5u+T8PaM/leefVjcRjl43LGc3EnKGLbmNyuK82lBV/mfqVJgjlOWHABE3wiAcQ/VVgO8FvRWWmJSUqxkcF/SQj+/khsfBg7xoqaMTtQH15xdOAWWhEVdakC5vIwdsTFRBqSqn6GGZXZELtqu3Ww/OfJSHKJPTtk+SJPvaEfTzhwUXK2ap9e5gXT9+2kHOS8W2iHR3UzUrtKcR6/dSvUgQmlNynHnU/N98rGzslsZpSLQhVhR/FvWM4d5HPuMQ2YrRtFCwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gE7aaFwm6Ht5iCMxJ1H2ELZroEc8llUDc81NBgGBxas=;
 b=myAgNRQ7wbDANRo8E7bouIzcB9B18hHCagkTnNqK4MLzCvDQeQkwor215tv+6OWYdE6hjUnbYR7MIo3p8PJayA6UhFtghZvu9YaVg5c3o2dHNpQ3A3O8rdpsqDwvJqshAkA3K5hQ2hD3IVx8FLCvjI+6EyLF+j5BkqrRZWm7sNH8Ll7ZcHgexf/xfevvFGlH2hmbyOkB09uIdcfkKmTbOvVZU1Vtz3UeTfE3FPoe0iymGR0k8ThAcGLgv4O0nYK90UTAPTlAZ2jpZKCxLfaRmn5VddfE5lXF7EAqVAStLMhHgpjnH4dd2+alDKO1gkQGkQ9mAN8ZZKlBUiwU3imM+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB6999.namprd11.prod.outlook.com (2603:10b6:510:221::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.19; Wed, 31 Aug
 2022 11:09:01 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e%9]) with mapi id 15.20.5566.021; Wed, 31 Aug 2022
 11:09:01 +0000
Date: Wed, 31 Aug 2022 13:08:55 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>
Subject: Re: [PATCH 2/2] drm/plane_helper: Split into parameterized test cases
Message-ID: <20220831110855.kr27lf26xpmbikxc@nostramo.hardline.pl>
References: <20220825124803.300821-1-michal.winiarski@intel.com>
 <20220825124803.300821-2-michal.winiarski@intel.com>
 <ebd659db-a0a2-24dd-b9e8-932b6c66545e@riseup.net>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ebd659db-a0a2-24dd-b9e8-932b6c66545e@riseup.net>
X-ClientProxiedBy: AM6PR04CA0033.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::46) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b385bb7-20aa-439c-fb9a-08da8b4135a6
X-MS-TrafficTypeDiagnostic: PH8PR11MB6999:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iEiDQtkFvRkUroEhZvt9kvjZij+o7Nl0O76iElZfQFzlwqqJk7V+2e5WUQPK5TkkZkx91Gx8T7pQn2aA8GbCoS5XxEUyfrPC7ZJWfXClKM/cGZHtTaAjs9nXennLm0fSnmucQTFiPCSfZaZDPOdf3TA5fsNpuFJadjoX+hr8BRDjEhMRvnIjcIkGjhEEiaTir5C75X0gJzOfnjkxO8jD6hHPO3d3v8lumGUCwqrQPe3+o+zTQ6u8GNHxggcrdexlaMlNoLEPC3nxOiXi1MGGWJI/yhPAM9HGUri+hq1EiKvKXaiKJ9EjURCSXkrIxNXY59rQnlq1uqW65SAUult581Xq///a4hon1hhnZdYX6vyKwutGUaWEQqSANh74TOouHqzsZjKoR7QrhJIfqEdBRd3n3sATc/7eox8LtopKdQirlf5d1NJ/Zx1ICepwuKk1r/1amoyrjAS8heqe24OArD9pyytQfApw0d+4oV8kFFzslNVP+m+4jePhII0O6r3jxLk5TRJytUobIbWhGIo60uVHzNFtr/+HEyt/TqdF4gq8q2w+sctxbY/VMBY3xwh0gEGK2wB6xim8ThGYGqlOy6+PFt2DxWK+NBAPfXkM/sBmKKxtPQ8sb8HGYHYZVDUwbeRIVNBukQNola+1zofTPUlh3hHR6G0tdkXeMKbccNJruhPN/IuZx5oK0bWERMAQlsX1QkbszaCGBgZ6hizAlw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(39860400002)(376002)(396003)(366004)(346002)(316002)(1076003)(6916009)(186003)(38100700002)(86362001)(82960400001)(66574015)(54906003)(2906002)(83380400001)(53546011)(66946007)(8676002)(66556008)(66476007)(6486002)(4326008)(30864003)(6666004)(478600001)(6506007)(41300700001)(9686003)(8936002)(6512007)(26005)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVZzcUJ5UVNxV1RCaTlQVzhpRTBUckQwZGRCdHEzZndMQXhGd1Fna0tpbWtz?=
 =?utf-8?B?U2pZcGh0UnVSMXNjbFpMMmtkaXRjalBIb2xxZ090d1N6eWZFSCtHZDFDZm9U?=
 =?utf-8?B?S0lyTDExUEl4dG11dlNjUllvTFN6LzFvcWlvdWFPeEpUb0RQNXl0SzVYZUNy?=
 =?utf-8?B?VVYrV2s5WGtGUFdVSmhSd3VyMElvSW04MlhiczNHWWJNbjNXMWFkbjZvaWVB?=
 =?utf-8?B?NWFTa0diNzMrM1hXVWZLK3RJN2g2QndHRWtEenRSM3VmVDd2TTVBaDFzcllx?=
 =?utf-8?B?d3pyNi85TGlucHMwb0MvcnZjL0ZDcHhkTkJYaGM0c2pRc3N3Y1pEVTA2QjI0?=
 =?utf-8?B?V1hXMzF0bFVramJUSGVwZ1diV1Nzd09TL1d0QnR2SzRmVmVjclVqNXJ3S2w3?=
 =?utf-8?B?S3JPMm56d0JGMDJBM1BEWlIrWlZRYWYyU1JPVHFUcFEvUmJFbHBQZ01nOFRC?=
 =?utf-8?B?VGw1RVhPYStoMW1VdUpiN0lreWxCL0dtTFJETWtQYVZieTNCZys1VXd5b1Vp?=
 =?utf-8?B?ODVBV3pUcFBqem1CZHE4RUxiVFRMc0hzMERmbGg4RzJhUkZOTGkxTTNMTTZW?=
 =?utf-8?B?VEdKZVRReFM3eUlmdjh6bEx6cDBJQTYwRzdnY1dvcE5rNDRHZEczWjZyVjhM?=
 =?utf-8?B?N2hjc21UZjZRMElpN29kUnFJWXFiS3NjL2IyYk5MVDJNbGtRREhUY3JLU2x4?=
 =?utf-8?B?QjhIVDZwZDRwTDdUd21NcUY4UGRTNmFQdTBNRUhQT1FWYkpQV0g5ZFJ6Sjhy?=
 =?utf-8?B?RWRsRWx6Qm9rSXgvQXBBeHZyV3RZRWZxUDRCM1NoYmtnaUdQbERYQy81YTk3?=
 =?utf-8?B?OXZSNXNaZ0x6anRWNjVGWTM5MDJDeUZWTmJacDNnS2hpVjlCTEhPM0k2M1R6?=
 =?utf-8?B?aTExdS9hQlhJaVk2RmdhUkdVNUZPK2FxUEFlcU1scVNLcmZJWFR2bEVqTDY5?=
 =?utf-8?B?SlhEVW1jT0JEYXBDeThSNnFjWndVUWttRHQvblpwNHQ0b3Z5WXY1ekpXeFFq?=
 =?utf-8?B?K3M5cktNN3VRemM2cTI2U0xnV3VoeGl3cUJqUTNWY2FPcDViOGlERlFZQ2dy?=
 =?utf-8?B?Q3lDTTIvdkFPdFlLRTZCUkFNRDRkYWxMWlVCaXlWWmhJaU5kMkNuTzFjTkk3?=
 =?utf-8?B?UVd6RytYM3B6VlVkenZzVEtiaGhGK0w4WC9YVE9xYi9yRTFOTnZrakdQUUZB?=
 =?utf-8?B?Qms1SnU3WTdRT0FJUkk1cFhMQ1ZKWSsvcVRNYS9ZZGxCcFhDR3pFd01UWnpL?=
 =?utf-8?B?aFZnd3NtT1lVb21vTG9lNUt5TnNLd3FhL1JXRzhGVGZZVWsreUNZMWR1Um5h?=
 =?utf-8?B?Ui9kUVBIRHIrTDRQWDlkUjBYNzgzVEdwak96OGVacjdoNGNSaE5nZEIyRnJY?=
 =?utf-8?B?bzRETVlPZ3pDOGtQZWZkbE5vbWFGNG9yK0VVeEZZRHZ3Mzl1SGpoNGt4STBH?=
 =?utf-8?B?ZFExVFVXKzhMNEJBSjNaczdVQXBZTzFwTTh3V1Q5ajM4R3JKanRDUUkzV1FF?=
 =?utf-8?B?c3laZS9pYi9vcDVtMFNzYzVMcHBmZE5CQ2x3WHdITmJhSjE3akk3U3FVY2hJ?=
 =?utf-8?B?STU4ekVQYW9QMTJRMngwaEtRN2dXcEVDS0prNnAxR2k0eVVGY0RZMVBCTGxM?=
 =?utf-8?B?STh4WW5TWEZoRjJyY3lkQm1Ja0o0SUNjNGV3M3RTNmxSbEN1TklnSi9HR3gy?=
 =?utf-8?B?ekU5djhLZjdZajM4WUpxSkJQbTB6cS9oQVJMLzAzaTNIaWgzQkpITkI1YUhP?=
 =?utf-8?B?SE5WNTBBNDdGcGc3blpLS0swZGlaUC9ZS0htcmpqYnlwR1hrYk5iS1VBaTd6?=
 =?utf-8?B?ZmxrbUE2d051ZU5FMmZVa1RVUjhvdlM4QjBxYWdZUnlLYVlieUkyMkpUZDlE?=
 =?utf-8?B?WTFOT3Z3K1U1NWNjRGVUM2pEZ2lhanZBU3JKa2N2b2FMZ0xxTktteFJmdkx5?=
 =?utf-8?B?c091dmJYcW1zMlN4cG5FeWVpczRzOExRQldDckl0aDM1SU5EOENybURGTEFy?=
 =?utf-8?B?THNpTFAzVUVWTlhNSVZKTHV0SkIxdGpCdGdCT0NtOWlVbEx0UUw5bzhSZmd4?=
 =?utf-8?B?c3VNbXpCQXFWVk1paDVSb1Y4cGNuN3JIVGZyTTJvMjF0eEl5QUx4TXJIbEFj?=
 =?utf-8?B?YmdKOWNKYkV0YnI2Qk5VbURHUXI5dUVpdUs4VkZ1V1NYbWFIMDN5MitFenRU?=
 =?utf-8?B?cFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b385bb7-20aa-439c-fb9a-08da8b4135a6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2022 11:09:01.8285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N7Yg+lMwliIEV8Q8N4vgtdr9mlUFFbi7HPMcOfujZrgfMYOfM6JYV70XAfMjgfRErbxWa6IQkDdIlKn4dsPpdnJHKuXrtTO4ddSayV40oPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6999
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
Cc: David Airlie <airlied@linux.ie>, Daniel Latypov <dlatypov@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 26, 2022 at 07:34:11PM -0300, Maíra Canal wrote:
> Hi Michał
> 
> Great patch! Just a few nits inline.
> 
> On 8/25/22 09:48, Michał Winiarski wrote:
> > The test was constructed as a single function (test case) which checks
> > multiple conditions, calling the function that is tested multiple times
> > with different arguments.
> > This usually means that it can be easily converted into multiple test
> > cases.
> > Split igt_check_plane_state into two parameterized test cases,
> > drm_check_plane_state and drm_check_invalid_plane_state.
> > 
> > Passing output:
> > ============================================================
> > ============== drm_plane_helper (2 subtests) ===============
> > ================== drm_check_plane_state ===================
> > [PASSED] clipping_simple
> > [PASSED] clipping_rotate_reflect
> > [PASSED] positioning_simple
> > [PASSED] upscaling
> > [PASSED] downscaling
> > [PASSED] rounding1
> > [PASSED] rounding2
> > [PASSED] rounding3
> > [PASSED] rounding4
> > ============== [PASSED] drm_check_plane_state ==============
> > ============== drm_check_invalid_plane_state ===============
> > [PASSED] positioning_invalid
> > [PASSED] upscaling_invalid
> > [PASSED] downscaling_invalid
> > ========== [PASSED] drm_check_invalid_plane_state ==========
> > ================ [PASSED] drm_plane_helper =================
> > ============================================================
> > Testing complete. Ran 12 tests: passed: 12
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/tests/drm_plane_helper_test.c | 419 +++++++++++-------
> >  1 file changed, 255 insertions(+), 164 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/tests/drm_plane_helper_test.c b/drivers/gpu/drm/tests/drm_plane_helper_test.c
> > index 0bbd42d2d37b..cb8607e5c737 100644
> > --- a/drivers/gpu/drm/tests/drm_plane_helper_test.c
> > +++ b/drivers/gpu/drm/tests/drm_plane_helper_test.c
> > @@ -12,14 +12,71 @@
> >  #include <drm/drm_modes.h>
> >  #include <drm/drm_rect.h>
> >  
> > -static void set_src(struct drm_plane_state *plane_state,
> > -		    unsigned int src_x, unsigned int src_y,
> > -		    unsigned int src_w, unsigned int src_h)
> > +static const struct drm_crtc_state crtc_state = {
> > +	.crtc = ZERO_SIZE_PTR,
> > +	.enable = true,
> > +	.active = true,
> > +	.mode = {
> > +		DRM_MODE("1024x768", 0, 65000, 1024, 1048,
> > +			 1184, 1344, 0, 768, 771, 777, 806, 0,
> > +			 DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC)
> > +	},
> > +};
> > +
> > +struct drm_check_plane_state_test {
> > +	const char *name;
> > +	const char *msg;
> > +	struct {
> > +		unsigned int x;
> > +		unsigned int y;
> > +		unsigned int w;
> > +		unsigned int h;
> > +	} src, src_expected;
> > +	struct {
> > +		int x;
> > +		int y;
> > +		unsigned int w;
> > +		unsigned int h;
> > +	} crtc, crtc_expected;
> > +	unsigned int rotation;
> > +	int min_scale;
> > +	int max_scale;
> > +	bool can_position;
> > +};
> > +
> > +static int drm_plane_helper_init(struct kunit *test)
> >  {
> > -	plane_state->src_x = src_x;
> > -	plane_state->src_y = src_y;
> > -	plane_state->src_w = src_w;
> > -	plane_state->src_h = src_h;
> > +	const struct drm_check_plane_state_test *params = test->param_value;
> > +	struct drm_plane *plane;
> > +	struct drm_framebuffer *fb;
> > +	struct drm_plane_state *mock;
> > +
> > +	plane = kunit_kzalloc(test, sizeof(*plane), GFP_KERNEL);
> > +	KUNIT_ASSERT_NOT_NULL(test, plane);
> > +
> > +	fb = kunit_kzalloc(test, sizeof(*fb), GFP_KERNEL);
> > +	KUNIT_ASSERT_NOT_NULL(test, fb);
> > +	fb->width = 2048;
> > +	fb->height = 2048;
> > +
> > +	mock = kunit_kzalloc(test, sizeof(*mock), GFP_KERNEL);
> > +	KUNIT_ASSERT_NOT_NULL(test, mock);
> > +	mock->plane = plane;
> > +	mock->crtc = ZERO_SIZE_PTR;
> > +	mock->fb = fb;
> > +	mock->rotation = params->rotation;
> > +	mock->src_x = params->src.x;
> > +	mock->src_y = params->src.y;
> > +	mock->src_w = params->src.w;
> > +	mock->src_h = params->src.h;
> > +	mock->crtc_x = params->crtc.x;
> > +	mock->crtc_y = params->crtc.y;
> > +	mock->crtc_w = params->crtc.w;
> > +	mock->crtc_h = params->crtc.h;
> > +
> > +	test->priv = mock;
> > +
> > +	return 0;
> >  }
> >  
> >  static bool check_src_eq(struct kunit *test, struct drm_plane_state *plane_state,
> > @@ -54,16 +111,6 @@ static bool check_src_eq(struct kunit *test, struct drm_plane_state *plane_state
> >  	return true;
> >  }
> >  
> > -static void set_crtc(struct drm_plane_state *plane_state,
> > -		     int crtc_x, int crtc_y,
> > -		     unsigned int crtc_w, unsigned int crtc_h)
> > -{
> > -	plane_state->crtc_x = crtc_x;
> > -	plane_state->crtc_y = crtc_y;
> > -	plane_state->crtc_w = crtc_w;
> > -	plane_state->crtc_h = crtc_h;
> > -}
> > -
> >  static bool check_crtc_eq(struct kunit *test, struct drm_plane_state *plane_state,
> >  			  int crtc_x, int crtc_y,
> >  			  unsigned int crtc_w, unsigned int crtc_h)
> > @@ -83,162 +130,206 @@ static bool check_crtc_eq(struct kunit *test, struct drm_plane_state *plane_stat
> >  	return true;
> >  }
> >  
> > -static void igt_check_plane_state(struct kunit *test)
> > +static void drm_check_plane_state(struct kunit *test)
> > +{
> > +	const struct drm_check_plane_state_test *params = test->param_value;
> > +	struct drm_plane_state *plane_state = test->priv;
> > +
> > +	KUNIT_ASSERT_EQ_MSG(test,
> > +			    drm_atomic_helper_check_plane_state(plane_state, &crtc_state,
> > +								params->min_scale,
> > +								params->max_scale,
> > +								params->can_position, false),
> > +			    0, params->msg);
> > +	KUNIT_EXPECT_TRUE(test, plane_state->visible);
> > +	check_src_eq(test, plane_state, params->src_expected.x, params->src_expected.y,
> > +		     params->src_expected.w, params->src_expected.h);
> > +	check_crtc_eq(test, plane_state, params->crtc_expected.x, params->crtc_expected.y,
> > +		      params->crtc_expected.w, params->crtc_expected.h);
> 
> In order to preserve the same function of the tests, I believe that
> check_src_eq and check_crtc_eq should be inside a KUNIT_EXPECT_TRUE. If
> there is a reason for not using KUNIT_EXPECT_TRUE, then check_src_eq and
> check_crtc_eq should not return a boolean.
> 
> Moreover, now that those functions are being called just once, you could
> just add some expectations to this function, such as:
> 
> KUNIT_EXPECT_GE_MSG(test, plane_state->src.x1, 0,
> 	"src x coordinate %x should never be below 0, src: "
> 	DRM_RECT_FP_FMT, plane_state->src.x1,
> 	DRM_RECT_FP_ARG(&plane_state->src));

Yeah, good catch, sorry about that - I lost the assert when splitting the
series.
Let me send a v2 where check_*_eq functions are void and have asserts inside
(this is fine from test output readability, since after conversion there's a
single call for each of the check, so we can still pinpoint exactly what went
wrong)

Thanks!
-Michał

> 
> Best Regards,
> - Maíra Canal
> 
> > +}
> > +
> > +static void drm_check_plane_state_desc(const struct drm_check_plane_state_test *t,
> > +				       char *desc)
> >  {
> > -	int ret;
> > -
> > -	static const struct drm_crtc_state crtc_state = {
> > -		.crtc = ZERO_SIZE_PTR,
> > -		.enable = true,
> > -		.active = true,
> > -		.mode = {
> > -			DRM_MODE("1024x768", 0, 65000, 1024, 1048, 1184, 1344, 0, 768, 771,
> > -				 777, 806, 0, DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC)
> > -		},
> > -	};
> > -	static struct drm_plane plane = {
> > -		.dev = NULL
> > -	};
> > -	static struct drm_framebuffer fb = {
> > -		.width = 2048,
> > -		.height = 2048
> > -	};
> > -	static struct drm_plane_state plane_state = {
> > -		.plane = &plane,
> > -		.crtc = ZERO_SIZE_PTR,
> > -		.fb = &fb,
> > -		.rotation = DRM_MODE_ROTATE_0
> > -	};
> > -
> > -	/* Simple clipping, no scaling. */
> > -	set_src(&plane_state, 0, 0, fb.width << 16, fb.height << 16);
> > -	set_crtc(&plane_state, 0, 0, fb.width, fb.height);
> > -	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
> > -						  DRM_PLANE_NO_SCALING,
> > -						  DRM_PLANE_NO_SCALING,
> > -						  false, false);
> > -	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Simple clipping check should pass\n");
> > -	KUNIT_EXPECT_TRUE(test, plane_state.visible);
> > -	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 1024 << 16, 768 << 16));
> > -	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1024, 768));
> > -
> > -	/* Rotated clipping + reflection, no scaling. */
> > -	plane_state.rotation = DRM_MODE_ROTATE_90 | DRM_MODE_REFLECT_X;
> > -	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
> > -						  DRM_PLANE_NO_SCALING,
> > -						  DRM_PLANE_NO_SCALING,
> > -						  false, false);
> > -	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Rotated clipping check should pass\n");
> > -	KUNIT_EXPECT_TRUE(test, plane_state.visible);
> > -	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 768 << 16, 1024 << 16));
> > -	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1024, 768));
> > -	plane_state.rotation = DRM_MODE_ROTATE_0;
> > -
> > -	/* Check whether positioning works correctly. */
> > -	set_src(&plane_state, 0, 0, 1023 << 16, 767 << 16);
> > -	set_crtc(&plane_state, 0, 0, 1023, 767);
> > -	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
> > -						  DRM_PLANE_NO_SCALING,
> > -						  DRM_PLANE_NO_SCALING,
> > -						  false, false);
> > -	KUNIT_EXPECT_TRUE_MSG(test, ret,
> > -			      "Should not be able to position on the crtc with can_position=false\n");
> > -
> > -	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
> > -						  DRM_PLANE_NO_SCALING,
> > -						  DRM_PLANE_NO_SCALING,
> > -						  true, false);
> > -	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Simple positioning should work\n");
> > -	KUNIT_EXPECT_TRUE(test, plane_state.visible);
> > -	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 1023 << 16, 767 << 16));
> > -	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1023, 767));
> > -
> > -	/* Simple scaling tests. */
> > -	set_src(&plane_state, 0, 0, 512 << 16, 384 << 16);
> > -	set_crtc(&plane_state, 0, 0, 1024, 768);
> > -	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
> > -						  0x8001,
> > -						  DRM_PLANE_NO_SCALING,
> > -						  false, false);
> > -	KUNIT_EXPECT_TRUE_MSG(test, ret, "Upscaling out of range should fail.\n");
> > -	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
> > -						  0x8000,
> > -						  DRM_PLANE_NO_SCALING,
> > -						  false, false);
> > -	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Upscaling exactly 2x should work\n");
> > -	KUNIT_EXPECT_TRUE(test, plane_state.visible);
> > -	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 512 << 16, 384 << 16));
> > -	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1024, 768));
> > -
> > -	set_src(&plane_state, 0, 0, 2048 << 16, 1536 << 16);
> > -	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
> > -						  DRM_PLANE_NO_SCALING,
> > -						  0x1ffff, false, false);
> > -	KUNIT_EXPECT_TRUE_MSG(test, ret, "Downscaling out of range should fail.\n");
> > -	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
> > -						  DRM_PLANE_NO_SCALING,
> > -						  0x20000, false, false);
> > -	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed with exact scaling limit\n");
> > -	KUNIT_EXPECT_TRUE(test, plane_state.visible);
> > -	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 2048 << 16, 1536 << 16));
> > -	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1024, 768));
> > -
> > -	/* Testing rounding errors. */
> > -	set_src(&plane_state, 0, 0, 0x40001, 0x40001);
> > -	set_crtc(&plane_state, 1022, 766, 4, 4);
> > -	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
> > -						  DRM_PLANE_NO_SCALING,
> > -						  0x10001,
> > -						  true, false);
> > -	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed by clipping to exact multiple");
> > -	KUNIT_EXPECT_TRUE(test, plane_state.visible);
> > -	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 2 << 16, 2 << 16));
> > -	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 1022, 766, 2, 2));
> > -
> > -	set_src(&plane_state, 0x20001, 0x20001, 0x4040001, 0x3040001);
> > -	set_crtc(&plane_state, -2, -2, 1028, 772);
> > -	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
> > -						  DRM_PLANE_NO_SCALING,
> > -						  0x10001,
> > -						  false, false);
> > -	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed by clipping to exact multiple");
> > -	KUNIT_EXPECT_TRUE(test, plane_state.visible);
> > -	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0x40002, 0x40002,
> > -					     1024 << 16, 768 << 16));
> > -	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1024, 768));
> > -
> > -	set_src(&plane_state, 0, 0, 0x3ffff, 0x3ffff);
> > -	set_crtc(&plane_state, 1022, 766, 4, 4);
> > -	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
> > -						  0xffff,
> > -						  DRM_PLANE_NO_SCALING,
> > -						  true, false);
> > -	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed by clipping to exact multiple");
> > -	KUNIT_EXPECT_TRUE(test, plane_state.visible);
> > -	/* Should not be rounded to 0x20001, which would be upscaling. */
> > -	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 2 << 16, 2 << 16));
> > -	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 1022, 766, 2, 2));
> > -
> > -	set_src(&plane_state, 0x1ffff, 0x1ffff, 0x403ffff, 0x303ffff);
> > -	set_crtc(&plane_state, -2, -2, 1028, 772);
> > -	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
> > -						  0xffff,
> > -						  DRM_PLANE_NO_SCALING,
> > -						  false, false);
> > -	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed by clipping to exact multiple");
> > -	KUNIT_EXPECT_TRUE(test, plane_state.visible);
> > -	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0x3fffe, 0x3fffe,
> > -					     1024 << 16, 768 << 16));
> > -	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1024, 768));
> > +	sprintf(desc, "%s", t->name);
> >  }
> >  
> > +static const struct drm_check_plane_state_test drm_check_plane_state_tests[] = {
> > +	{
> > +		.name = "clipping_simple",
> > +		.msg = "Simple clipping check should pass",
> > +		.src = { 0, 0,
> > +			 2048 << 16,
> > +			 2048 << 16 },
> > +		.crtc = { 0, 0, 2048, 2048 },
> > +		.rotation = DRM_MODE_ROTATE_0,
> > +		.min_scale = DRM_PLANE_NO_SCALING,
> > +		.max_scale = DRM_PLANE_NO_SCALING,
> > +		.can_position = false,
> > +		.src_expected = { 0, 0, 1024 << 16, 768 << 16 },
> > +		.crtc_expected = { 0, 0, 1024, 768 },
> > +	},
> > +	{
> > +		.name = "clipping_rotate_reflect",
> > +		.msg = "Rotated clipping check should pass",
> > +		.src = { 0, 0,
> > +			 2048 << 16,
> > +			 2048 << 16 },
> > +		.crtc = { 0, 0, 2048, 2048 },
> > +		.rotation = DRM_MODE_ROTATE_90 | DRM_MODE_REFLECT_X,
> > +		.min_scale = DRM_PLANE_NO_SCALING,
> > +		.max_scale = DRM_PLANE_NO_SCALING,
> > +		.can_position = false,
> > +		.src_expected = { 0, 0, 768 << 16, 1024 << 16 },
> > +		.crtc_expected = { 0, 0, 1024, 768 },
> > +	},
> > +	{
> > +		.name = "positioning_simple",
> > +		.msg = "Simple positioning should work",
> > +		.src = { 0, 0, 1023 << 16, 767 << 16 },
> > +		.crtc = { 0, 0, 1023, 767 },
> > +		.rotation = DRM_MODE_ROTATE_0,
> > +		.min_scale = DRM_PLANE_NO_SCALING,
> > +		.max_scale = DRM_PLANE_NO_SCALING,
> > +		.can_position = true,
> > +		.src_expected = { 0, 0, 1023 << 16, 767 << 16 },
> > +		.crtc_expected = { 0, 0, 1023, 767 },
> > +	},
> > +	{
> > +		.name = "upscaling",
> > +		.msg = "Upscaling exactly 2x should work",
> > +		.src = { 0, 0, 512 << 16, 384 << 16 },
> > +		.crtc = { 0, 0, 1024, 768 },
> > +		.rotation = DRM_MODE_ROTATE_0,
> > +		.min_scale = 0x8000,
> > +		.max_scale = DRM_PLANE_NO_SCALING,
> > +		.can_position = false,
> > +		.src_expected = { 0, 0, 512 << 16, 384 << 16 },
> > +		.crtc_expected = { 0, 0, 1024, 768 },
> > +	},
> > +	{
> > +		.name = "downscaling",
> > +		.msg = "Should succeed with exact scaling limit",
> > +		.src = { 0, 0, 2048 << 16, 1536 << 16 },
> > +		.crtc = { 0, 0, 1024, 768 },
> > +		.rotation = DRM_MODE_ROTATE_0,
> > +		.min_scale = DRM_PLANE_NO_SCALING,
> > +		.max_scale = 0x20000,
> > +		.can_position = false,
> > +		.src_expected = { 0, 0, 2048 << 16, 1536 << 16 },
> > +		.crtc_expected = { 0, 0, 1024, 768 },
> > +	},
> > +	{
> > +		.name = "rounding1",
> > +		.msg = "Should succeed by clipping to exact multiple",
> > +		.src = { 0, 0, 0x40001, 0x40001 },
> > +		.crtc = { 1022, 766, 4, 4 },
> > +		.rotation = DRM_MODE_ROTATE_0,
> > +		.min_scale = DRM_PLANE_NO_SCALING,
> > +		.max_scale = 0x10001,
> > +		.can_position = true,
> > +		.src_expected = { 0, 0, 2 << 16, 2 << 16 },
> > +		.crtc_expected = { 1022, 766, 2, 2 },
> > +	},
> > +	{
> > +		.name = "rounding2",
> > +		.msg = "Should succeed by clipping to exact multiple",
> > +		.src = { 0x20001, 0x20001, 0x4040001, 0x3040001 },
> > +		.crtc = { -2, -2, 1028, 772 },
> > +		.rotation = DRM_MODE_ROTATE_0,
> > +		.min_scale = DRM_PLANE_NO_SCALING,
> > +		.max_scale = 0x10001,
> > +		.can_position = false,
> > +		.src_expected = { 0x40002, 0x40002, 1024 << 16, 768 << 16 },
> > +		.crtc_expected = { 0, 0, 1024, 768 },
> > +	},
> > +	{
> > +		.name = "rounding3",
> > +		.msg = "Should succeed by clipping to exact multiple",
> > +		.src = { 0, 0, 0x3ffff, 0x3ffff },
> > +		.crtc = { 1022, 766, 4, 4 },
> > +		.rotation = DRM_MODE_ROTATE_0,
> > +		.min_scale = 0xffff,
> > +		.max_scale = DRM_PLANE_NO_SCALING,
> > +		.can_position = true,
> > +		/* Should not be rounded to 0x20001, which would be upscaling. */
> > +		.src_expected = { 0, 0, 2 << 16, 2 << 16 },
> > +		.crtc_expected = { 1022, 766, 2, 2 },
> > +	},
> > +	{
> > +		.name = "rounding4",
> > +		.msg = "Should succeed by clipping to exact multiple",
> > +		.src = { 0x1ffff, 0x1ffff, 0x403ffff, 0x303ffff },
> > +		.crtc = { -2, -2, 1028, 772 },
> > +		.rotation = DRM_MODE_ROTATE_0,
> > +		.min_scale = 0xffff,
> > +		.max_scale = DRM_PLANE_NO_SCALING,
> > +		.can_position = false,
> > +		.src_expected = { 0x3fffe, 0x3fffe, 1024 << 16, 768 << 16 },
> > +		.crtc_expected = { 0, 0, 1024, 768 },
> > +	},
> > +};
> > +
> > +KUNIT_ARRAY_PARAM(drm_check_plane_state, drm_check_plane_state_tests, drm_check_plane_state_desc);
> > +
> > +static void drm_check_invalid_plane_state(struct kunit *test)
> > +{
> > +	const struct drm_check_plane_state_test *params = test->param_value;
> > +	struct drm_plane_state *plane_state = test->priv;
> > +
> > +	KUNIT_ASSERT_LT_MSG(test,
> > +			    drm_atomic_helper_check_plane_state(plane_state, &crtc_state,
> > +								params->min_scale,
> > +								params->max_scale,
> > +								params->can_position, false),
> > +			    0, params->msg);
> > +}
> > +
> > +static const struct drm_check_plane_state_test drm_check_invalid_plane_state_tests[] = {
> > +	{
> > +		.name = "positioning_invalid",
> > +		.msg = "Should not be able to position on the crtc with can_position=false",
> > +		.src = { 0, 0, 1023 << 16, 767 << 16 },
> > +		.crtc = { 0, 0, 1023, 767 },
> > +		.rotation = DRM_MODE_ROTATE_0,
> > +		.min_scale = DRM_PLANE_NO_SCALING,
> > +		.max_scale = DRM_PLANE_NO_SCALING,
> > +		.can_position = false,
> > +	},
> > +	{
> > +		.name = "upscaling_invalid",
> > +		.msg = "Upscaling out of range should fail",
> > +		.src = { 0, 0, 512 << 16, 384 << 16 },
> > +		.crtc = { 0, 0, 1024, 768 },
> > +		.rotation = DRM_MODE_ROTATE_0,
> > +		.min_scale = 0x8001,
> > +		.max_scale = DRM_PLANE_NO_SCALING,
> > +		.can_position = false,
> > +	},
> > +	{
> > +		.name = "downscaling_invalid",
> > +		.msg = "Downscaling out of range should fail",
> > +		.src = { 0, 0, 2048 << 16, 1536 << 16 },
> > +		.crtc = { 0, 0, 1024, 768 },
> > +		.rotation = DRM_MODE_ROTATE_0,
> > +		.min_scale = DRM_PLANE_NO_SCALING,
> > +		.max_scale = 0x1ffff,
> > +		.can_position = false,
> > +	},
> > +};
> > +
> > +KUNIT_ARRAY_PARAM(drm_check_invalid_plane_state, drm_check_invalid_plane_state_tests,
> > +		  drm_check_plane_state_desc);
> > +
> >  static struct kunit_case drm_plane_helper_test[] = {
> > -	KUNIT_CASE(igt_check_plane_state),
> > +	KUNIT_CASE_PARAM(drm_check_plane_state, drm_check_plane_state_gen_params),
> > +	KUNIT_CASE_PARAM(drm_check_invalid_plane_state, drm_check_invalid_plane_state_gen_params),
> >  	{}
> >  };
> >  
> >  static struct kunit_suite drm_plane_helper_test_suite = {
> >  	.name = "drm_plane_helper",
> > +	.init = drm_plane_helper_init,
> >  	.test_cases = drm_plane_helper_test,
> >  };
> >  
