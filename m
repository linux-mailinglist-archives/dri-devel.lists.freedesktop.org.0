Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A12E8A9AB81
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 13:15:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA89710E7D1;
	Thu, 24 Apr 2025 11:15:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kBRJpmSE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D1010E7CF;
 Thu, 24 Apr 2025 11:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745493337; x=1777029337;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=s45XKgMhvWYyzenTyYrzqH0MHoAdPDD2MuOzxduak2s=;
 b=kBRJpmSEpgLOSP33I1tl5MEen0N7MwNOUTY8uYlL2XwZX0DxPZ6cZuuS
 EEqrD7nUzXQjMXja2iJDj4wbhUUuG6xg7yUFt6FK9iyA9KVUrSg4yHjuE
 f9fXBKozMmqY1mNGjtHvg4v4F20UVTK2TsIa6brHs5fZ+esGHw3eNfMPd
 T3cyg2seO+5Af5ij1M8/sn2p3U4Y70Hr62edTf333qVyzyfBTt4/KwoNv
 TopcqjtKHjhd7KHGwS9ms5CewGL4x5W2DodWkAQC2+sQ9RWwfrwH81PVs
 JGr0mWTpGNPskUFcutguHHKZmOsBvkEV+vy3AG//7RnAN6sBz6eLUuLG4 g==;
X-CSE-ConnectionGUID: v48mo5ypSkKZySihAk76jQ==
X-CSE-MsgGUID: QKBAPCzDSGyws3QAUWnfxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="50941369"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="50941369"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 04:15:37 -0700
X-CSE-ConnectionGUID: 3iPrY0q9Qsi+7+D/Q+nMyQ==
X-CSE-MsgGUID: jA81qL16QTC2B2nYk7OOEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="155819226"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 04:15:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Apr 2025 04:15:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 24 Apr 2025 04:15:36 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 24 Apr 2025 04:15:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A2o2gptpprOiBItNDwUwD3m0wss6fUssf5UNHfRO/hSOGYH3fSzgi5pc9cJtEccZ6zvWkhRsixtYd3m5EMPdFMpxHXmtQJLnce2T4WeAjj681QzWaCvVBK80FyJO4CkafAPduDVNz7P+YnPNDGNVwKHqk+e1rOh769jfSwMevOxdN5M3qArWheqGzXgYWnHegOC+zDSn7lozW8ctdw88XibBaWzuUEya688MCZ9DBhnEb+IqF1qyDoKd+NbD6XFb4NloOosimDCb14iH0hkvN/C+ov6yW9lreoSwuurmG+sHkkxAk047xIktOnETf0kBlZpi7KRlRnsSN1HAbUvmAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ETWKgcK7/1omtvQqNLiSLfMA545HHk9v5rwRbLzNwL4=;
 b=JugdYwKIrqb4ZTOtJGpUxfagvD8QKo27Y04vLhMFB8SiTeo5QzzT5R2Go/bV0bA0y1VUIWtV+Fvzy3S9QLH4vrHvW4mEAAG4hhhkBYSdW5XVgGSt/zlVdxy/a7g5hRbqO8icFmgBuYe+3JBHOGq4vDsGTNsPaspLEiI75uVUTvndM8rKjdeLMpyN2B3dbpmC8viigQ98TW+ywI16Vz9JJfvj9FiHb8PiFZvxNe/rW8qNM+NCyRfMqKpri6JaaNUr/AExvhe8n4hcZQRjf44LGHOdSfXJX4BVufs74mmkstbVGo2lEMg7O51rYGTYQCnU+Rd4UYIhlpY7wTXj4VzOHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by PH0PR11MB5142.namprd11.prod.outlook.com (2603:10b6:510:39::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.26; Thu, 24 Apr
 2025 11:15:33 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%5]) with mapi id 15.20.8678.023; Thu, 24 Apr 2025
 11:15:32 +0000
Date: Thu, 24 Apr 2025 14:15:37 +0300
From: Imre Deak <imre.deak@intel.com>
To: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v6 1/2] drm/display/dp: Export fn to calculate link
 symbol cycles
Message-ID: <aAodWV6uA-XEonYA@ideak-desk.fi.intel.com>
References: <20250424-hblank-v6-0-3d10442d9a31@intel.com>
 <20250424-hblank-v6-1-3d10442d9a31@intel.com>
 <d441c161e65a4e028abce954298ad5a680c1c70e.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d441c161e65a4e028abce954298ad5a680c1c70e.camel@intel.com>
X-ClientProxiedBy: DB7PR03CA0094.eurprd03.prod.outlook.com
 (2603:10a6:10:72::35) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|PH0PR11MB5142:EE_
X-MS-Office365-Filtering-Correlation-Id: c6635971-d9c9-43af-f841-08dd8321541f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?JuXThVIFFFjYZPtthbEfCD6g6Cmdb5mh1Da5SPziec2GoLA9eU/lDW1hX6?=
 =?iso-8859-1?Q?Jq7FD6M+O6F2TYmXLkkal4MJfvYi6R/h+dtSlbWp/un7jwEzwN3XxXflqs?=
 =?iso-8859-1?Q?8dTY4LP3Mdo8RcuIQEcYk1BHoYHBXdVy0r0Ef1tpunFfDV0y3RMD98HH5M?=
 =?iso-8859-1?Q?Vp5TDFMyB24APmwJV97jVLgnvPMzCBokVa1OQpbTVqApsXfpNuERMbt8Kc?=
 =?iso-8859-1?Q?4OAsWcKkQVMnZvlT/YucWik5kn1Ft64aIVk1Hk5Lx/UyHJR4wa/6Cwus+I?=
 =?iso-8859-1?Q?UTIzrweSKKSLW/2T7XAq8RtQfpDiKF0nt1XpFCGZ5gDx8QhTnFS4Jskuvd?=
 =?iso-8859-1?Q?1piYu3Aq3Ahfy+9E6W0gkepfQuWNA9HBId+02lIqAKEnqyt5wJ653bu/mo?=
 =?iso-8859-1?Q?jOLq9NG7s/944fjpai4bmYRhqilXwhmzrbimCY+/y37CXcfErbtKRgW/Fm?=
 =?iso-8859-1?Q?32RkGcJBJ4F9sRxI79EEtN41vxxlb5/V/OmL3J4AGAX4k/Ka+7Atlm2RWM?=
 =?iso-8859-1?Q?AaSP3/rfL5iZHcs8Lz3fdyvhXRW8iTu9nCw6cW0BuGiXCpb3L53XS0EztK?=
 =?iso-8859-1?Q?fQnWt4hNW1T1TzmH2jxSwTZc2wjU1zaCdDbmPIw5SNVVLjia1cLDmtVSI5?=
 =?iso-8859-1?Q?HcUZjkS1Z0W8J8JslBlQ/YES/u/G/MKSI10utUwkUzQmI1ZkKRGO4fptaA?=
 =?iso-8859-1?Q?sdx3t3g0rNF9B7Ok8m+26YRHkFpcSUWQM8IvKEfT/B32v40HCbFBuFrua4?=
 =?iso-8859-1?Q?5ch/pu2W5WO2YlT1GbgXUybc5K3/Zh6Lsnj4bFoCBw5a9qApXIUYGgQi5l?=
 =?iso-8859-1?Q?qsn4Jf1r3WORkbLafa8H5F7LxDKSpfiHodCSPvj5mbfdU6VzKnD1I2tB5X?=
 =?iso-8859-1?Q?jpbmX4I7mcAmNNi/QiA6WlH/pzTPH0pmeY1vUNFHNxsryQPIo46jAIcKuF?=
 =?iso-8859-1?Q?CDE9I5YoY4zy9IS2vnmlt5/vC/b68fiCnxLfDKRzYuwCiQC92MOHxUD1HK?=
 =?iso-8859-1?Q?hdEehBstMz7g41Ba1DoLljquWoRPeSKOFzd6/Pr3cZh5nnvgt7FrjMgQW+?=
 =?iso-8859-1?Q?c0uus2cTU/uTHp4hVoBjIyWy8LquZ7Y1KDt7Y/3qbq3JCrdXYrr4Qf4lxD?=
 =?iso-8859-1?Q?XOZlzpIrB+1UzOC8vaEhFPoeHTV4XvkXG+hW1LLeSJEnwmyDP4mDGHJWJT?=
 =?iso-8859-1?Q?FXbIr2qQBrCmDzrXGP/Y1KND/7lhn5mlS+iTUdreVoSZuWyiyaT/5mE8Yz?=
 =?iso-8859-1?Q?3df/aT7esFBdetT8OeFL4WKCjhF881wquOi+xXraDM9ofkxSxKw9u+sDFG?=
 =?iso-8859-1?Q?h4NALYABDgPn6rVERGsil4m5Lr87otVyRyHDhLHEw4hc5ZaV8taOFia0gO?=
 =?iso-8859-1?Q?RQcE7SVNNbBF+zlF9ynUbvvh8BNeIcxtoHCdceMYHVLmuGpjdqUPwMxYBJ?=
 =?iso-8859-1?Q?ja5XpvxCf9X7AYjcfuBMTMq06y5QSTvTeW77nxAqlKxdsSN+HeRByp+iC0?=
 =?iso-8859-1?Q?Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?sb7YQKxfmgFasNEiNgAineiMje2NPCQFTVItbeJgZkOC5vfwGugakQvEWD?=
 =?iso-8859-1?Q?VU+yEaGL9M8J5rSvqhYtaQGm0ZeAVcbUtE6e+jdklVHSV6BHxQj18Wx9Wt?=
 =?iso-8859-1?Q?NHvYhwNIBCyOqnIw7gs2zPDFeoQM6fy6CdsMt99QMjZbvKSuEqU4uMg0dN?=
 =?iso-8859-1?Q?1+NoDSdrQHqXb9gQdJWVbY79az+YwKTVX1Ju79Ue7eulodyoyY2fq/POox?=
 =?iso-8859-1?Q?cYT6DRvofz0oQEm2BUVOzHvU4LbKic4fhg4hp9icHh7rylaQfxDI9I8N1D?=
 =?iso-8859-1?Q?HYK2IO0eePGfNx7EN8yLQBQpfqIb71s6f43RiyDLJMfzwgRlBpOYLjGu1u?=
 =?iso-8859-1?Q?H7PFcnVo10qL9z1Zou7+uqoEwK2jQyH+tRMDGGfciR7MDwY0KvlLOVWazu?=
 =?iso-8859-1?Q?SWwkD1SUseWriucKkwHSvGAJ9awj7y7Bwc33MCQFiLPgP4ByM32eynPc3+?=
 =?iso-8859-1?Q?B+AXERJvBUqKIuB8G8qlSETA12byjDMDjUI2YL8dgunvUloEiWn/wDDh5x?=
 =?iso-8859-1?Q?bDFmf+Ye2nISg3k2q5X9qQdxKW5aDNduYJYylyrWhl/xTkspM+rnUvy0zf?=
 =?iso-8859-1?Q?ZIHHhVa27qqVGMh/vfJfyX19KHaHQFfPp2zIO776SeaS4wtNHAmB190Cf9?=
 =?iso-8859-1?Q?QMUmhr9umPEyUJKruBdQf4hEJaTJVzJYyuXxyOTEHo1uWGHNf+3W1w7GML?=
 =?iso-8859-1?Q?sNnAGgDbR7rtUJQwt7mODzIHLpSADSdSFx3dtW3ArpT0XCbdOxnTW0D5yY?=
 =?iso-8859-1?Q?apEodyOmvrWb0SHA3GAgRT6Pi9uyPCbScIAryISRGgwB1p7qHknn0YyE+3?=
 =?iso-8859-1?Q?pBg8981R9oiy805rpG8QKhvztnlbJOrDRNMaf1rfYBAoAhLRvf03SCjntn?=
 =?iso-8859-1?Q?fopORxDO8+4ll2rULzDyXqFxez1wPF6R95WgAb/49uQpYwf5sYGXY4q0q4?=
 =?iso-8859-1?Q?J3CYE32PL/vrGT4HKzTAje+8fSC4MrbhAG6Wf5AAle0lcMIFlx9s7P6dsg?=
 =?iso-8859-1?Q?KBt/XKMtATYQiyl8jPRO9/SodrvmhDdTw+55wu6eeFszlkLS+jkUQEgjn5?=
 =?iso-8859-1?Q?PLqIJeDcLqdnW+NK0xLjoXld1761ia/0XHER0BJz3pmUGcBHJ+1sMAHzqh?=
 =?iso-8859-1?Q?/NSxWp6w3bcfSe3tzNk7vxefh8mWcyRkwxAEky38K1fvjxDchkrBMRYDVR?=
 =?iso-8859-1?Q?geJQbtKwD0tvXgo6m2qBUo7k6ViCI7pWd2MQ+fygL4l9egPTBt+R9VBcvg?=
 =?iso-8859-1?Q?zWbR5CAmvUdDWKU1AuNb5KF2co2JVSd3odfx8BWV8Xr/gPCr2rHRHJQ8Wr?=
 =?iso-8859-1?Q?ckSPJSC28usrB0CG7CTWW4do+VdK77IQC44KtRcxPRBwb59DRBWEFUDphI?=
 =?iso-8859-1?Q?vDxnf2aMv44pAXfC2v9u4f8HwOYU+4B5rFMNYE2NAr8myLdXJL/7gho4CZ?=
 =?iso-8859-1?Q?ZYFLoGH/xA0MfsHSLTFoBT1bpAjjjrzhbzC4Us63y5x3R7FCXrh87x1iI7?=
 =?iso-8859-1?Q?itQ66Ylovfeuw4KpfScqrvaT8/z0ZiRX8p1RTx6/MFN6U3EDGKICacJgcD?=
 =?iso-8859-1?Q?+gCXEM8wmZi1I4xoJ9bX5+XugCu5E3sClF48lfo98knDlJ+Vwaogw1T4ER?=
 =?iso-8859-1?Q?9IbifeUcL4RE4z9QjXpbOcRBmfprVQkGEM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6635971-d9c9-43af-f841-08dd8321541f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 11:15:32.7156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5BvWk63VxwJoAXmr6xCVgVG06uO8eB/r6ZId3reOwZu+Ch4VhvjERCrhph3eo8BXk8vWx2F9AjevrN4fU3M6qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5142
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 24, 2025 at 12:40:14PM +0300, Govindapillai, Vinod wrote:
> Hi,
> 
> 
> On Thu, 2025-04-24 at 13:52 +0530, Arun R Murthy wrote:
> > Unify the function to calculate the link symbol cycles for both dsc and
> > non-dsc case and export the function so that it can be used in the
> > respective platform display drivers for other calculations.
> > 
> > v2: unify the fn for both dsc and non-dsc case (Imre)
> > v3: rename drm_dp_link_symbol_cycles to drm_dp_link_data_symbol_cycles
> >     retain slice_eoc_cycles as is (Imre)
> > v4: Expose only drm_dp_link_symbol_cycles() (Imre)
> > 
> > Reviewed-by: Imre Deak <imre.deak@intel.com>
> > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > ---
> >  drivers/gpu/drm/display/drm_dp_helper.c | 53 +++++++++++++++++++++------------
> >  include/drm/display/drm_dp_helper.h     |  2 ++
> >  2 files changed, 36 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> > index 57828f2b7b5a0582ca4a6f2a9be2d5909fe8ad24..6b451c9053a77e3e3889ae4cef64caaf942247c8 100644
> > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > @@ -4393,8 +4393,9 @@ EXPORT_SYMBOL(drm_panel_dp_aux_backlight);
> >  #endif
> >  
> >  /* See DP Standard v2.1 2.6.4.4.1.1, 2.8.4.4, 2.8.7 */
> > -static int drm_dp_link_symbol_cycles(int lane_count, int pixels, int bpp_x16,
> > -				     int symbol_size, bool is_mst)
> > +static int drm_dp_link_data_symbol_cycles(int lane_count, int pixels,
> > +					  int bpp_x16, int symbol_size,
> > +					  bool is_mst)
> >  {
> >  	int cycles = DIV_ROUND_UP(pixels * bpp_x16, 16 * symbol_size * lane_count);
> >  	int align = is_mst ? 4 / lane_count : 1;
> > @@ -4402,22 +4403,41 @@ static int drm_dp_link_symbol_cycles(int lane_count, int pixels, int
> > bpp_x16,
> >  	return ALIGN(cycles, align);
> >  }
> >  
> > -static int drm_dp_link_dsc_symbol_cycles(int lane_count, int pixels, int slice_count,
> > -					 int bpp_x16, int symbol_size, bool is_mst)
> > +/**
> > + * drm_dp_link_symbol_cycles - calculate the link symbol count with/without dsc
> > + * @lane_count: DP link lane count
> > + * @pixels: number of pixels in a scanline
> > + * @dsc_slice_count: number of slices for DSC or '0' for non-DSC
> > + * @bpp_x16: bits per pixel in .4 binary fixed format
> > + * @symbol_size: DP symbol size
> > + * @is_mst: %true for MST and %false for SST
> > + *
> > + * Calculate the link symbol cycles for both DSC (@dsc_slice_count !=0) and
> > + * non-DSC case (@dsc_slice_count == 0) and return the count.
> > + */
> > +int drm_dp_link_symbol_cycles(int lane_count, int pixels, int dsc_slice_count,
> > +			      int bpp_x16, int symbol_size, bool is_mst)
> >  {
> > -	int slice_pixels = DIV_ROUND_UP(pixels, slice_count);
> > -	int slice_data_cycles = drm_dp_link_symbol_cycles(lane_count, slice_pixels,
> > -							  bpp_x16, symbol_size, is_mst);
> > -	int slice_eoc_cycles = is_mst ? 4 / lane_count : 1;
> > +	int slice_count = dsc_slice_count ? : 1;
> > +	int slice_data_cycles = drm_dp_link_data_symbol_cycles(lane_count,
> > +							       pixels,
> > +							       bpp_x16,
> > +							       symbol_size,
> > +							       is_mst);
> 
> Btw, now we pass "pixels" in drm_dp_link_data_symbol_cycles instead of
> "pixels / slice_count" in case of dsc as well!

Arg, yes, that's a good catch, not sure why that got changed. So

	int slice_pixels = DIV_ROUND_UP(pixels, slice_count);

should be kept, and passed to drm_dp_link_data_symbol_cycles().

> Now I see the some of the modesets for example 6k @60 are failing!
> 
> BR
> Vinod
> 
> > +	int slice_eoc_cycles = 0;
> > +
> > +	if (dsc_slice_count)
> > +		slice_eoc_cycles = is_mst ? 4 / lane_count : 1;
> >  
> >  	return slice_count * (slice_data_cycles + slice_eoc_cycles);
> >  }
> > +EXPORT_SYMBOL(drm_dp_link_symbol_cycles);
> >  
> >  /**
> >   * drm_dp_bw_overhead - Calculate the BW overhead of a DP link stream
> >   * @lane_count: DP link lane count
> >   * @hactive: pixel count of the active period in one scanline of the stream
> > - * @dsc_slice_count: DSC slice count if @flags/DRM_DP_LINK_BW_OVERHEAD_DSC is set
> > + * @dsc_slice_count: number of slices for DSC or '0' for non-DSC
> >   * @bpp_x16: bits per pixel in .4 binary fixed point
> >   * @flags: DRM_DP_OVERHEAD_x flags
> >   *
> > @@ -4431,7 +4451,7 @@ static int drm_dp_link_dsc_symbol_cycles(int lane_count, int pixels, int
> > slice_c
> >   * as well as the stream's
> >   * - @hactive timing
> >   * - @bpp_x16 color depth
> > - * - compression mode (@flags / %DRM_DP_OVERHEAD_DSC).
> > + * - compression mode (@dsc_slice_count != 0)
> >   * Note that this overhead doesn't account for the 8b/10b, 128b/132b
> >   * channel coding efficiency, for that see
> >   * @drm_dp_link_bw_channel_coding_efficiency().
> > @@ -4486,15 +4506,10 @@ int drm_dp_bw_overhead(int lane_count, int hactive,
> >  	WARN_ON((flags & DRM_DP_BW_OVERHEAD_UHBR) &&
> >  		(flags & DRM_DP_BW_OVERHEAD_FEC));
> >  
> > -	if (flags & DRM_DP_BW_OVERHEAD_DSC)
> > -		symbol_cycles = drm_dp_link_dsc_symbol_cycles(lane_count, hactive,
> > -							      dsc_slice_count,
> > -							      bpp_x16, symbol_size,
> > -							      is_mst);
> > -	else
> > -		symbol_cycles = drm_dp_link_symbol_cycles(lane_count, hactive,
> > -							  bpp_x16, symbol_size,
> > -							  is_mst);
> > +	symbol_cycles = drm_dp_link_symbol_cycles(lane_count, hactive,
> > +						  dsc_slice_count,
> > +						  bpp_x16, symbol_size,
> > +						  is_mst);
> >  
> >  	return DIV_ROUND_UP_ULL(mul_u32_u32(symbol_cycles * symbol_size * lane_count,
> >  					    overhead * 16),
> > diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> > index d9614e2c89397536f44bb7258e894628ae1dccc9..7b19192c70313d66dce1b7ba40dd59c14f80a182 100644
> > --- a/include/drm/display/drm_dp_helper.h
> > +++ b/include/drm/display/drm_dp_helper.h
> > @@ -971,5 +971,7 @@ int drm_dp_bw_channel_coding_efficiency(bool is_uhbr);
> >  int drm_dp_max_dprx_data_rate(int max_link_rate, int max_lanes);
> >  
> >  ssize_t drm_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc, struct dp_sdp *sdp);
> > +int drm_dp_link_symbol_cycles(int lane_count, int pixels, int dsc_slice_count,
> > +			      int bpp_x16, int symbol_size, bool is_mst);
> >  
> >  #endif /* _DRM_DP_HELPER_H_ */
> > 
> 
