Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E32659FD99
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 16:55:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7797BB6C30;
	Wed, 24 Aug 2022 14:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39D2391E0F;
 Wed, 24 Aug 2022 14:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661352879; x=1692888879;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nfnprrMsw4edI0eRYsLFuB6Id2kJwbgDOjARrGbp02A=;
 b=OAcvxGwC6jqeJUJhTCYl1wjwDqhFkCVprjNTPSLzs6xZDrHwvL+QFoBS
 Zk2i8vwUlfR6qjuCUSRDROXEh8chCnl1dylO1AsZUhPmo0M8dYWfx8sfb
 jfaCvt5ozNPZwYRuYjMiBJBIYHPurnUo//7c/7xpOw5t95eWhseW5dFze
 WY56RxWtpkxJTwi9F/B4WKRwEtFcFssQaF9Y0aXEZqeyUTqA1dliIMw8+
 hWrZTIZax36nsEgUUMKv0zL1Fwa9+szrs16EQhR9cZH/IPZFsOf8YojxI
 gfZ9Rt7HLfVC/AVoaI4ePsecXerS+clfwP0qu6kt9EPagg5pJJuZ2hLFV g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10449"; a="277010976"
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; d="scan'208";a="277010976"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2022 07:54:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; d="scan'208";a="735906364"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 24 Aug 2022 07:54:36 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 24 Aug 2022 07:54:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 24 Aug 2022 07:54:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 24 Aug 2022 07:54:35 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 24 Aug 2022 07:54:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h2Xa1BeFIinWdNA0Jh0LXZrBAUoQE810ZqwDPQSylWWjmKIVWw9LEgtVCILP9eV/D2/AUg4E59yoBjJkfL1IqYRruKUevJOyGcJFYZp5GyfRZ44YR1agt1RQRPuksvIBfAese78gpOJNpVbpc8Hsn2SNqcmxghucdStGZ6djCf78YouiYejTCUcDDLI+LNrp9zkKTBBDZoUGzNG/5bQN/9iGfS7L9bhA6c19nWx/mQShK9sgXNtQnA+9p+Lnp8sazgMeR15+CozA3YSjcp1h/FDmJXNnssNgFOotodDGzHc07og/9BZ5yqL1BMa65HhN/1BeS/K2Ug3/p1gy3kOpAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pUlRQsGU33pB34GQzRGF+5wfYCCzs/iw4ND0SJzi4WE=;
 b=PSt+U2JER3J3pnze90P2tp/ejFSOYT5YpF2NQi9xtItel6FrSfKvA2zStP8Fd7j5aLxANznuju0GECDvtAeziYrsvS0OyFryi/aRHKlXmR4SeWbNyOcaAfrxf05C8spGWokFBXd2JKorav2v7k5Kq9E6fNzYhlRKLpIAFiie873OLBMbfghhkaJ3JVHL+KrWsMr7IjDachlzpQvOx9mw3AAaKQxtsGeRNp8gqPb7wlFF2rif/GVM1buaPVX2//qJTO1C7aSdNbg3XkbhMP9Ky0SsCKFZ2IkomibGQyXGRmE06q9GcnwsI+2yIUpKIMpH9zEIj5lCIxJJ/I3+DuQ3Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 DM5PR11MB1276.namprd11.prod.outlook.com (2603:10b6:3:14::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.20; Wed, 24 Aug 2022 14:54:34 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::46f:6936:6441:5a7a]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::46f:6936:6441:5a7a%8]) with mapi id 15.20.5546.024; Wed, 24 Aug 2022
 14:54:34 +0000
Date: Wed, 24 Aug 2022 20:24:25 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 04/21] drm/i915/mtl: Don't mask off CCS according to
 DSS fusing
Message-ID: <YwY7oRazL8K3BpTm@bala-ubuntu>
References: <20220818234202.451742-1-radhakrishna.sripada@intel.com>
 <20220818234202.451742-5-radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20220818234202.451742-5-radhakrishna.sripada@intel.com>
X-ClientProxiedBy: PN3PR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::10) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 638d8553-6f64-40e1-9df8-08da85e08e96
X-MS-TrafficTypeDiagnostic: DM5PR11MB1276:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tJWKpydeWbAkc/+gcHz6xx0kAl/ygjSKyuOjTm2AtOsY2wXVO2gn86J4mwXDMLyl/6gdjnsioFkU+3IU2DX9LRjoRFkivEExZYxbDaSOn01DgTOFm0tdxNrMuCUqaBISQe9oj2n5KZ5BHdeUccyLHhxZFoknkZTMSjwXYAP4QX//wG1Yft+kgcv9fsz1JLIOfBPc+8YY8zT5lcKuxqhYxeLUu4LwpancaIFysdeD6g/7L8zL3DzTn3TYlx5sLS4QXO+P50XKV5FE6rD+6O5sJWq/OBL3gUM6g2DXMLiYK8+/4XkQjOPtrUchIhCwQmrBlcRPJ/jj9UXZUztrhz3Akhiwiq742TQDUNKVJCYTDSvSi+5O63pjp+SfocE8zX3xreAErjDq+P6+MM5o0lYaHpfFg1Vi5U9Y3S9cJVsDCjPhA/vs2giU2Tut3GWpAJixiJQYcdRZm2VEqw2JjRUY4IwsGVlUMoU8ZrBVISrfCfePCH5kiIKAlHAJUzseXq3sm+BwL+RdVO8LU8ZV4fsgFD82gBlMU2UNbw/fqTNzPlfGEbs/+o4zdi3CRBhhiqVjm3dv6tvDhuR6Rw3hRGVPNoVi+B5DgtWe4dYEFcmQ6Acegm4ZcKlZ/VUKTO5YA43B4bKGxaT0VdLwWghd5QQOJXHj8axM8oYU6vCV8HSWJIAK0RSDN0boorC8gIn4UpN7BZvsFXERP7nmV5UtFQSUAA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(346002)(136003)(376002)(366004)(396003)(39860400002)(66946007)(6486002)(450100002)(66556008)(41300700001)(44832011)(5660300002)(316002)(66476007)(38100700002)(4326008)(8676002)(478600001)(6666004)(8936002)(2906002)(53546011)(6506007)(6512007)(9686003)(186003)(83380400001)(26005)(86362001)(33716001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlZnRnY3SzduaHU4ZUIza2pPaW9xc3B2anhDM2VtdU1xdjN0TGI2SnJwTGVO?=
 =?utf-8?B?RkxzWFdTSVBXdm0reHdCcnUyNkJTWW05WmxMSHhYRC9ndGRJUzVGTWZYeXhW?=
 =?utf-8?B?NFhqWUsrN0FTSnlENC91bFZ0VThqeFdONFlLcFhUZ3lYQkh0Ky9DdUw0ZC9l?=
 =?utf-8?B?ZWY4aEpaWmRnd3VYZk4zb2Z0NW9mVW85K2s5cE5RcjU5aGZSOXJwdlVndDhk?=
 =?utf-8?B?VXRWOXdtVXE4WEpOMTI2NDZLVzlKdndtSFQzN3U0eGxwT3YzcWYvTk9zVm9n?=
 =?utf-8?B?dTNTQ0NnZVg0Z3VCT1FYMGdqeFR0d2JNcTY4amFGYUV6TEFMRGFGRkRDQ3Nl?=
 =?utf-8?B?SDU4aTM3dmVaSXczdm5seDZtWHBzS1Zld1U5clhISmtRSU9hZXdBL0pwd3pB?=
 =?utf-8?B?ZFE5OXpscE1JRG5QelBEc0xodHB3L1JOWTRiMXhTRWxTV2ZJeTFDYUNENGMx?=
 =?utf-8?B?NEF6R1lMVzFvcGNac0dkT0lrZTRrbkQ2NG5oc2NKTjFLMHRNdjB4aGVyWDZu?=
 =?utf-8?B?aDhaSWt3NUNGNGdBS0cxN01wSjNTRWhnRWVBZDRuazdNall3UGF3VlY3T3pR?=
 =?utf-8?B?Z01RT1Z1dVl4V25aQTIreWdtZ3c2dHRBck0xYlBSbFQrQUhpN3lYZ1V1K0dx?=
 =?utf-8?B?K1RuNTJPZU9mckRwZmRPSWQ3WnhIZVZXWkRNM3dKZmdmeEpaaHpPMFVBbFM2?=
 =?utf-8?B?dngxM2lDaGFETFRaT095ZmE1enVpYVltcHplaVYwVG1OZTMxMU9FR251bHVn?=
 =?utf-8?B?TVpiaCthL0NUUHF4T3lFd2pqUXJ5NTAvazhrTVhhUGVSY29xdVNNRXlaaW1u?=
 =?utf-8?B?S2lWbE51NS9Fbk1XT0tGYks0VS8wSHQyQzNzWVUrNXlzNHF5aEpNeERiei9y?=
 =?utf-8?B?MHJac3JOaERKNHJnZ3dCSTJUSkNuemsvY3hZcmxhQm1Kd2RVQ1NQb1BPa3ZY?=
 =?utf-8?B?N09ESTEvM2RvcW5mRm1DMkZWbmtpQnBhdk9ITGk0Z00rME1adTh5U1B0YnZM?=
 =?utf-8?B?WWlyRjNZVDI2MlljZWxKY3cvMHlvbkJkaGZhN0dOMysyNFFzcmJOYXQyUjRX?=
 =?utf-8?B?V3F6cGZRSHBwS2l6b3pqYnRWY3IwTytlWm1aTzYydjlyUlJLOEhrZFdJWUNM?=
 =?utf-8?B?MkpJcHRYN3hNZUNxWmtjbWkyeWw0ejVHRVJlb1Y0dmpZTkUzNnRHN2NSZFpY?=
 =?utf-8?B?UzNPWXNESDVwQVd4UENBOVJxOU5VTU9MUnd3SnlBVmNnSlZTQU9OZlVScDBk?=
 =?utf-8?B?N2NHOGpkSjdVc3VLTzFNbXhtY3l0eDVlSHUrM0pYTmZQdFJpM3d1ZXJKaXRu?=
 =?utf-8?B?a2RLTjBJRDI0dnZwVC9EK1VYZnIwREJaSW1xbXdxcVNsUks5bHVwbVpuZnJS?=
 =?utf-8?B?MUpDVWJXdHkzS1lvYlJvUVVVT1Rxb3Y3U0xMZUlNcFZjekkrbXltVzdCRjJF?=
 =?utf-8?B?bTJsQTZQTUVrK1NQMFpLaU95Z1V2Q3VRTTNLcWpoa3dpWmQ5bHZ0WUc5MGU2?=
 =?utf-8?B?RnY0RmQxN1g0eDIxdDl0UkdSRm1oaUNkTm93ZUhEeU1sM0V5RWdDK2VvQ2tt?=
 =?utf-8?B?R01WQzNFNk41Rll5NzFmdGxxRHFuc0ZDRmlPVTlYa3huR2s1b2ZBN3pKTHNF?=
 =?utf-8?B?bkVEVXUrTnpRYkk4Sm5MTXh4RHdOdVgxeU5hYmUxMlRuZ0RZTDkwREJCTEwv?=
 =?utf-8?B?aGJySmt6a3ZObElSelM0K3R3Yjdhbk5rdmcwcGJXcHFRbkc4eXgvU0N4NXQr?=
 =?utf-8?B?UnVtRnh1UDQ3THQ1MmE4d2hRTTNKa3JBNEYwWG54RTJ1SkdEUGNsSng4N0VF?=
 =?utf-8?B?MGVlTFNnMjdTeWExQ2JiNzc3YTV6dnVZWEdaRUNUTWVPVWZjcmgrVU0rZVgw?=
 =?utf-8?B?V0xVL1NaQUF4eXJrMzVlRi9GQnlIUmhReXkvYWpwVkVoL1NFc1JsdHZ1WE9J?=
 =?utf-8?B?TDBEWjRFczVibXFvem9TNGFkUU9KeXlYa1pETTZ1eXhycjVlLy9ZN2pZNElT?=
 =?utf-8?B?bU1VRnRLQWRKbStETjNDQkxRNTJtUWMzNzdkbmdQSGxGdHhjSytZQ2pZZUhx?=
 =?utf-8?B?Qm01MVJNNm1XV214Z0k3QnRHbVFiTEJJL05vWnplWmhpbnlrN3ZvYW40SHZR?=
 =?utf-8?B?NU4zaHk3OHcrbERDSDRrNjFhYXBUOFdZcDc4bExldklIcEVhcHJlWmNNQzVu?=
 =?utf-8?Q?IDwnDTUPvgL5hAoF00ibaBY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 638d8553-6f64-40e1-9df8-08da85e08e96
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 14:54:33.9156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cEbEvB0Z/JJyCHMjIrJKuBneeQ9zAouqxSLK47OfL2HJwEZC/1OKLvAv576oCcWbcbiOD2UH1fB2W6vBWE3w7E7UJ7UaKYgyvJYe10WCvIbIca4k2xtxHYTf/OH9Ewj/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1276
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18.08.2022 16:41, Radhakrishna Sripada wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> Unlike the Xe_HP platforms, MTL only has a single CCS engine; the
> quad-based engine masking logic does not apply to this platform (or
> presumably any future platforms that only have 0 or 1 CCS).
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 37fa813af766..17e7f20bbb48 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -672,7 +672,7 @@ static void engine_mask_apply_compute_fuses(struct intel_gt *gt)
>  	unsigned long ccs_mask;
>  	unsigned int i;
>  
> -	if (GRAPHICS_VER_FULL(i915) < IP_VER(12, 50))
> +	if (hweight32(CCS_MASK(gt)) <= 1)
>  		return;
>  
>  	ccs_mask = intel_slicemask_from_xehp_dssmask(info->sseu.compute_subslice_mask,
> -- 
> 2.25.1
> 
