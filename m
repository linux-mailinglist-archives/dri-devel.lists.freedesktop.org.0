Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2736D216A
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 15:22:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030E010F22A;
	Fri, 31 Mar 2023 13:22:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 709A410F22A;
 Fri, 31 Mar 2023 13:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680268933; x=1711804933;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IElQnUtzV3XAl/GT6FTDPoN16SECZWI0hTZnySp0dtQ=;
 b=MuRTmSLaY9thUNCvNCa7LthoQH7h4uDy65ZdeLrqxs4A9Ld1qO4AJzlf
 IjMoAlZAwkDY9ubYoUtPzQ1+h2zokh7uusoLjWy7OvnxNHxSieDChpwHT
 yVZk7K37My5TnQZggBZFV3JNVayNbRBCG231soe4Jjq+xNXKRLr+IT6KJ
 QVQ/0iIV1xfN6TrmO7+56jdeN8cI7cCHPbotALA0hysDM8kGFEfhIzUOh
 L0+tQtVS60xeqvFJa6l/Q3z5iUxnteMtYCKb6x3k235aVOoZdnLjLchdA
 llkit9iEKjtFLTbenODRdEFHzxHh0GjOUyxHuUxvsaBMyJF0C8CJGhZCy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="341459541"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="341459541"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 06:22:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="774355986"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="774355986"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 31 Mar 2023 06:22:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 06:22:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 06:22:12 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 31 Mar 2023 06:22:12 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 31 Mar 2023 06:22:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HE7HLeZ1VnWLQgq3+6460NxtiAP+TNM+ps9cAwjNIZzLg9lFfpVM2iZJO+VottGHJyvlAj3q3cvzoV4/L74lLOqFAxQ7H8OX/MbhC6JbttOmgnGmwyMP7JH2gr4mpxcUkGSXiEV7ny/ePnaIIHYNt2bch2KkXLZykSnl5UHphFXsHdRi6HSPYiOHaiYs0mKlkrdwi8xmy7BgTHJ1lCGWK3vvCdFBgv9WPJZKMMrlYar3q6B8FOPWuABCta0MFmB2pElAFVOIpH1zB7v0SKrLkrLKfjwFFSNumXCUyVDzZJCSKqFMQf4KLa4MLRFXqh/p56yF4C8SoFSdLsbUftGffQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1n9HHYm5HedInqQffB2pGSVB24kfp7yXcDw3MoG0bKQ=;
 b=dccgZ2x6+JHqujEkVjgYZ381rgAkC912YhO3+IsMWsCSBOE9XXAXnsRNpHvrbMnFmUTxX7trT3YaasUZiw3Ot5E01l3Lg2x59xoUI5xsePbAD2q8XEXXjmqlPj2aSVocNzOL7l0A69IiRx+8oAbS/RgBOKCrBvRPx9xCgGg1VNyTkidzWgPuTFIYtF/JYBxZ4hdZhADQTCvqZoHG/eP0FM0cL/H2RUaavvzLO9oIzmmWvyDec+ikt/R6YWY4mSNxC1K8ZqMrSBYKn5pug/40AIihveII2fgPW2TbHM/MqWxuV04oJWyionWYO23VFltSBoR47pPEJ1h010LUIHhmjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL3PR11MB6386.namprd11.prod.outlook.com (2603:10b6:208:3b6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.20; Fri, 31 Mar
 2023 13:22:10 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6254.022; Fri, 31 Mar 2023
 13:22:09 +0000
Date: Fri, 31 Mar 2023 07:22:06 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Fix platform order
Message-ID: <20230331131955.qunxulyrz2ruddja@ldmartin-desk2>
References: <20230324051754.1346390-1-lucas.demarchi@intel.com>
 <20230324051754.1346390-3-lucas.demarchi@intel.com>
 <20230327170238.GJ4085390@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230327170238.GJ4085390@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR13CA0088.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL3PR11MB6386:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c9c56f1-ffaa-499d-b0f9-08db31eaee54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SffQCRh/7JSTiIXZ1BBzj4Bb9W+bSR+8WBygirO96ytrM7vHWsRgaoPY15LZa7TQpqRlG463P9UuW3/nijEkuYJNGXpqESTVmBfohp+1RZ2O/p/Yq+PUiAkC0oA8L6W8bvfh1IWBgc/EelkNZNmNgX5pbVMXlTmNYLGBBDbARUDRbUS2KqpnFr7TM88rx8dT/yE7ak9B67K48t7SrvIzb5/9xTRvzIyP5JZ3zGG0K541Ub2GNPAl4HHY7COVbXNwI9zq3q32id3t1mo95nT0HAYkaBc2CV5AMVbIQJijdZp+rLRxyE9ZUehM9iFjt2Q+TFqZJmMD+cCcvztkPyZuAarFcEHLR5gOVMbSil3wcP/KNP8X0MBXAMFkaJjEW/xmxtkE+sGFVnfg2h2JdpkkmjZQRttDMN0uxDhGbu6xTNkJ83Jgo3O7+ZLj7BrsJBNB+5hkrE31DHaoncdBwbjkiQbIA5MDNkn1QW53qKFsbti5KJk9llHO+gFs7RUs9p1+uf9JJi3Y0k9MOY4puTlWHJtZQijsSzMvkj8boPFh6PPkFpGoC1Vss3ITPo8f/ps/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(136003)(39860400002)(346002)(376002)(366004)(451199021)(6636002)(54906003)(478600001)(316002)(6666004)(83380400001)(186003)(82960400001)(1076003)(5660300002)(9686003)(26005)(6486002)(6512007)(38100700002)(6862004)(6506007)(8936002)(33716001)(2906002)(66556008)(41300700001)(66476007)(66946007)(4326008)(8676002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MOirn/4OWghFrqRvBpu0Xxs/DtTMbdJ9Ku2FpmfZ6bRiNhCkvvYubo6/3KSW?=
 =?us-ascii?Q?MBINr5hkv8utIQdogKM7uFBG2i657i+RA+BhFdIfDi8EtyWpPkxM7pLmVUzz?=
 =?us-ascii?Q?kP4mtk2Tj5W5BVCtqNRv+wV9TrjZ2v4Hpq979LXZyn/zMMKLWZoT5CouzRku?=
 =?us-ascii?Q?QyyYIp3mR9bXDoWgciOzJGwoO2kgcN9CZPbbmDj9+YXWyrClgjUcjoOtdCEU?=
 =?us-ascii?Q?viyB10BXxfLXqKP3HO+yHYuqT+PFGJ6/Jn6Fv+DmuL/wrUQl7k4YzvawPTi4?=
 =?us-ascii?Q?HdovRnAo4eAzjYCtgStIl7eKdCgPj/shU61cr3+s9ZYRk6d6FVtAyR4mv6ww?=
 =?us-ascii?Q?N1Kf7JOyQFkBT0bAnJla2iLVW95qlpG/lXjgYuupLngHtixbBtOzW7SATK44?=
 =?us-ascii?Q?NqQmC5tDeYP2YmVfp2JzAw2zXP38AU2AIU1+T04jVuvEh2n2ODblRQyntV1B?=
 =?us-ascii?Q?WIQBM6jgUteKESdMYNcqMaITPJ7vFBwyjYLT6zeGX6I/jmURl2dSoGChW2YR?=
 =?us-ascii?Q?eeGNfA1lo7+Fsd/03WHPrAxEOctAQVXiMe3KD9v6LMFZCl9CWun/4/7tnskm?=
 =?us-ascii?Q?iXU+qJfsR/XP+B8lEq6g/T1geudLdpsNInFrYENGIIB+ulbb4wNYkULO9NDc?=
 =?us-ascii?Q?ZfGTnRZEXBNKhkBybOa+jCOwrWpiBVdMJb5Fccfxsl8B1dpFiNdW1193X6ut?=
 =?us-ascii?Q?iUoAMSganxB6esFv8DupT+wd1VHtR/beyao/ra5dGULlAybKvz+HM2fyAiLE?=
 =?us-ascii?Q?z7EAcbVzOy5D4FNOh4o0Is/TB7IP6G2muRHYg8yNp/LGB9kO9PkGTG28xoKy?=
 =?us-ascii?Q?Ia/0mJv4mBdyyG/AfMvCnqOwfbJrOaLJoLbMkdU1zaOsJLzepbx2uYYRid0M?=
 =?us-ascii?Q?uC7pM1XNq0VEhbxfgH611fkUXNy4DD27ZLLC49VAgWJbSgHELeGz6RuoQUst?=
 =?us-ascii?Q?Fz/rdiYGX5LmjagE1JF1r8CA8oMsYRT+ir4wBA/vjzMX+p7sB1Wl+Z1GHj8M?=
 =?us-ascii?Q?g1qIhXpeEWjJS/lGpmYD3oTZ9Pl4w/vkK2FSonftKl/AEvzMOXWNFVSZepa1?=
 =?us-ascii?Q?OvIxo8O0gbdHyo3b+oDtpXSbfwRcQ5sz3Giu3X6xx1qrs0BmIG0nB6ErrO4p?=
 =?us-ascii?Q?XS8A6hz3LWj4o+0GlQkeypkqHRY3PbpHJ6fmlR73svwOXwsGUnGge+dp46kr?=
 =?us-ascii?Q?iZ7nR3CBZSVntB4FXlHrYVLleAfq5KzmVYWphVHFOHvXskZ+r1avIV+ANCnp?=
 =?us-ascii?Q?A7BbiQiIn9fY0SHp3ehx1bQvjPiTThXs0QiCvAVXQhlwtnr+i5vRwSCfmmxX?=
 =?us-ascii?Q?zdkkp7aTSPuGDCPzk1pDBO1RrxgsAgC64lBKDP48J+dkhOMPzIHkr80PpZ0W?=
 =?us-ascii?Q?avHbKWKR1bZ3qvT+OHUMAwWrSvV3wtqopxl09YA1IQp0Lv61tzz96NoDugv6?=
 =?us-ascii?Q?5MDd5xsHt4vcQN5/2E+4UVYpY53SM9NVrCwAO5ORSpABsIBgJZZ/B2X+pMzE?=
 =?us-ascii?Q?l7M5NmgDwt5jfPpVP2rzwCp8NYHBI4COtw70tmePIP8120Tvq3pUIVt3vyXr?=
 =?us-ascii?Q?6r21y5aVyXkpmlkJjMpMRA134Blvv49J/aSKOagapsdDjEGRVck5yWI1AR8C?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c9c56f1-ffaa-499d-b0f9-08db31eaee54
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 13:22:09.6960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AjkP09h1+I7eGkrzhd+xXtV7hXmyv/pNpYJgoAzfVRA8g//SUlIs3oo4k8FoAAYS5Lp1R+bBVXNlxKozsFf75/0JCXQ7kK+cTXoeHd/RIaI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6386
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 27, 2023 at 10:02:38AM -0700, Matt Roper wrote:
>On Thu, Mar 23, 2023 at 10:17:53PM -0700, Lucas De Marchi wrote:
>> Platform order is important when looping through the list of guc
>> firmware blobs since we use it to prevent loading a blob for a newer
>> platform onto an older one. Move PVC after ADL.
>
>Shouldn't we be moving the ADL platforms (graphics versions 12.0) higher
>than DG1 (12.10) and DG2 (12.50) too?

question then would be:  would we be ordering them by gt
version?  Or by when they were introduced?

I think it makes more sense to be by when they were introduced as a
platform in the driver.

	1) what about media/display?
	2) allow us to always be appending in the enum and elsewhere in
	the driver.

Lucas De Marchi

>
>
>Matt
>
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_platform_types.h | 3 +--
>>  drivers/gpu/drm/xe/xe_uc_fw.c          | 2 +-
>>  2 files changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
>> index 72612c832e88..10367f6cc75a 100644
>> --- a/drivers/gpu/drm/xe/xe_platform_types.h
>> +++ b/drivers/gpu/drm/xe/xe_platform_types.h
>> @@ -9,14 +9,13 @@
>>  /* Keep in gen based order, and chronological order within a gen */
>>  enum xe_platform {
>>  	XE_PLATFORM_UNINITIALIZED = 0,
>> -	/* gen12 */
>>  	XE_TIGERLAKE,
>>  	XE_ROCKETLAKE,
>>  	XE_DG1,
>>  	XE_DG2,
>> -	XE_PVC,
>>  	XE_ALDERLAKE_S,
>>  	XE_ALDERLAKE_P,
>> +	XE_PVC,
>>  	XE_METEORLAKE,
>>  };
>>
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>> index e2c982b37e87..174c42873ebb 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>> @@ -43,9 +43,9 @@ static struct xe_device *uc_fw_to_xe(struct xe_uc_fw *uc_fw)
>>   */
>>  #define XE_GUC_FIRMWARE_DEFS(fw_def, guc_def) \
>>  	fw_def(METEORLAKE,   guc_def(mtl,  70, 5, 2)) \
>> +	fw_def(PVC,          guc_def(pvc,  70, 5, 2)) \
>>  	fw_def(ALDERLAKE_P,  guc_def(adlp,  70, 5, 2)) \
>>  	fw_def(ALDERLAKE_S,  guc_def(tgl,  70, 5, 2)) \
>> -	fw_def(PVC,          guc_def(pvc,  70, 5, 2)) \
>>  	fw_def(DG2,          guc_def(dg2,  70, 5, 2)) \
>>  	fw_def(DG1,          guc_def(dg1,  70, 5, 2)) \
>>  	fw_def(TIGERLAKE,    guc_def(tgl,  70, 5, 2))
>> --
>> 2.39.0
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
