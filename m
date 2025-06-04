Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 872DFACE6CF
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 00:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 186E810E705;
	Wed,  4 Jun 2025 22:49:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iEP8QPys";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E75CC10E04A;
 Wed,  4 Jun 2025 22:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749077346; x=1780613346;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8gEsXiwRDqHfe7jV90V4lq9OsSvPW5U6bRlVa0wynMY=;
 b=iEP8QPys4tLgZmA6lGrStA40z4oE1tbNJZDUCKkQNYptWExOD880VBFa
 gBl+mAvNWWJpm27vC75Q2EiHhLFFP71oXyltsSoVoc5MuD+7Bc4GRYGYY
 NpPDclO7EUKEQcdDL95TJsBPoFr6Hmqe/yJrOhhJeSvzJ1vzJFbyn93dD
 ysnLQVgXXAlPO5/ZBW/9I2TrjyuXeiyeJQyETkXrruw+16mcEa0hNZSV8
 tFYcEwF0kEwITG30kTs6JqCd6zdBWaKszTLMB+UV2cga75q9/PqavKSpx
 5NTZ2+frZvQU2XzJ8dgB4Jevfoy+ZkzasJtrOygxCxz3Lp+cfN7aMaCNb g==;
X-CSE-ConnectionGUID: WXQf3BPER6ifRBEimAZ78w==
X-CSE-MsgGUID: Xq3xB6kNS2OLPfC+FnkiEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51327373"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="51327373"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 15:49:05 -0700
X-CSE-ConnectionGUID: ARmRG27/TRqo63MsPTHCHQ==
X-CSE-MsgGUID: o2fp2TRATmW/kVOvUcqcUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="176279056"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 15:49:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 15:49:05 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 15:49:05 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.74)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 4 Jun 2025 15:49:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nvd9boEDIWe74hA/z/+yoV7FthLA9ZE0onEbVD5gf2FtGRF4SIQwpNVi/AD15nE3lofK5dO9RSwD3DF5/ddnh1qQFC9Ra+e3d43UxKBoNAlnHWaR6ffeHgKMrAVOWsO8ARRIJbiCypwbVR3R2+boLNJD6OJGfc9xpa9QUKVXSMy629EzfAizirmXHZyAqOb+wDGHRTjgOFv/49tubH6VwOvmSgE2hK2uCQ4RRl5kabQ2x6zwEpEyMAKQHpWw27fCK8tcWCxqX5/HDZrg8iM8oMqheGYdCh++FJcTLg7EV7cNanA52HVNPwWJ8Pys/GA3y0Qwb4teA49Tg4jx4jwwtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7EzBdV168ZzDN3+XAPhXb/pP1TAzWiuxs7hL7H+pf4g=;
 b=OqqYNPBorOgdNTFMaIJ8f/NPWmztQdXMyTqWuDyg6WHc3TpREcGHspiVkeQe3rDC9OLLIgpsRCGyx4HUpHofCrjChtXWlp4A29r4vVPDNqejtECSCB7vDeqkCzc6ZOZUqgMVhMJ1+IyPUGvSm3syQmPsRQZYeQ+wPwpE647UXJRju1xWIiwNnsnB3+MXotRqVE5/YWSXkFthjfzrychCNEpXwUXJXuRe7Q2FI6xrXnxfe5cuYQtMojIhh4xMlakkzzry5y77P84kKSaY41pCicH8EfPchQywDEyCPgxNdqslJu+zskDQX8tAG4owY6rA490WorBUXfanKOTIgsb6Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB7005.namprd11.prod.outlook.com (2603:10b6:303:22e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Wed, 4 Jun
 2025 22:49:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.029; Wed, 4 Jun 2025
 22:49:02 +0000
Date: Wed, 4 Jun 2025 15:50:36 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Dave Airlie <airlied@gmail.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: don't store the xe device pointer inside xe_ttm_tt
Message-ID: <aEDNvCUTUdxgluzd@lstrano-desk.jf.intel.com>
References: <20250521194831.314835-1-airlied@gmail.com>
 <CAPM=9tzGqNQhGgZj-yNRcM751bR8bF4yigX1i26iH8pY28m5sA@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAPM=9tzGqNQhGgZj-yNRcM751bR8bF4yigX1i26iH8pY28m5sA@mail.gmail.com>
X-ClientProxiedBy: SJ0PR03CA0277.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB7005:EE_
X-MS-Office365-Filtering-Correlation-Id: 15505a04-fd64-450b-9ec1-08dda3ba0077
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9zxnNjD21eOFpIaMUU+wZSNmujfyDqTj+0nf2424dOCEG9tSkOKfoU27aRED?=
 =?us-ascii?Q?1nUcjrjVoKfTbfxv8zgR7c83rbwzO6M+p+wLxkTl9Nja5ddlkkvkqkylD84v?=
 =?us-ascii?Q?zJpP+itqR4vDtl/f/6MAt80adr7b2jJHKs6DmS/Q7jTLr5eU4YTzQarnqUA1?=
 =?us-ascii?Q?6G31AXl0RZ6S0emuIqtkQgq4EwLrK5x9Au22ws4wFjDSMZSfkUs9JQO8Buwy?=
 =?us-ascii?Q?dX/e6EXLybOsli6TLqIjcAf0wHzkc2betUqOOSClGAWE0cTYjj78TEIT5eL6?=
 =?us-ascii?Q?z6XVZGrW2Gkml8wVCsAOdZJOPP1c14JrE+z0bYtE2r10iBUQ31qbbKP+t7Lc?=
 =?us-ascii?Q?rBjJqNSMPA6kRx1hzjMZt7D3YiZW4UKyOwE5WQKRXNBGhP4c61L8MVNw6D4v?=
 =?us-ascii?Q?0YeLMsOJ7eY15BMPAufzjtrQGwvodZ0C3RtxDr5QnUdNbh6XtNG5LAB7eM3b?=
 =?us-ascii?Q?3FQzWIFuot6oDeb+0L5Lzvs4vLCrQyLP2VCvlBVAhqEhFpHA+rLUfmyNTYp7?=
 =?us-ascii?Q?ULHToOE5w/udksehNs3mEKg4TKBvK4NjjoG6jsvHqHJVVmRrphbp8+op0dqj?=
 =?us-ascii?Q?jhY6upClQmVEIsr/zmwlKTT6VOtheGNphpDWsw+rGG5x0qQcBU+vh1hP+30g?=
 =?us-ascii?Q?sC5WsPSOWkEZ72x6uLVCJl4RiXP1YHcTbkBOaB8YF5mCetcEAqyNB+l2iGpv?=
 =?us-ascii?Q?87S5TSrqS0atGFoUYs5FJqJgcK818eMd7F3Y6/LFxqLVO2uVEmfFqJHm8rqW?=
 =?us-ascii?Q?XhvOirHXGoGhzMTlnZJ0x9VlrR12LU1HZS4iMZQPvIZDByScoggeTICiTAbK?=
 =?us-ascii?Q?kxZlZ1fupOgBnKQ8ppwcgICR/aO5WdOvHwCv5qCRrs2B4CVtBc5ZTXsf0SdE?=
 =?us-ascii?Q?YUiWMaPk/JrJRxO4ai0seNc4RgWv6Sz4pUOCtAUySLaTLKI6CpijhoAsfjhV?=
 =?us-ascii?Q?E4s+lfHk8l+mIE3Fz+GJ03Gj+dr6WSqWScGxJlml9te3On8Lz7xFV1zc4Vvr?=
 =?us-ascii?Q?UXhb4OA6MP73A0Q2WYDHPlNTRLKcRHAnSUZnMIfnu43hZp+Or2ZF0YPhbBTF?=
 =?us-ascii?Q?3RE13m5HBldKs00uGXmj66vmmEP8XDcFgCt5M6W8QA5an1Bzw7VIa/xOmA8o?=
 =?us-ascii?Q?sUxbR3Hc1hSeexJl8n7IObMv8/ExqTYm4zU5T8g7Sr+U2tEQjF5NSj1SmaFS?=
 =?us-ascii?Q?tSl/kgBjfq5RhG41XsRj9uqvkwgb/UE5NmS99DL6u9qTL+ba3ykxjRqXIfzZ?=
 =?us-ascii?Q?5IFL4b3LOyAaeR3wuuZTQ2KaH4vDXigoQoF6bQV/54xDHyK3RRtsuJsrWmBA?=
 =?us-ascii?Q?7X01e6de0vdvH9KDuHVggJhTDdQZv3hNeBuWbyzwRIZNKUV1GxOK8Pe9Q6/i?=
 =?us-ascii?Q?5QgMlG/ZNZvIncsxvgBdOsr80bWj1nn/xoo4A0HmiCsGkC43dqavsu0A1Mqr?=
 =?us-ascii?Q?pswTV+aZVmo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fiNxP2tb5FGXxGYy2+5LP9WLKEyT2W83sOEW8bFZmBvpTk7Qq7Uu9Dop3W0F?=
 =?us-ascii?Q?wv0YGYfVNWN1T14lwFztzewbN7AQQFOK5bqvbchiFOQJgVINi8afeTkf5RI+?=
 =?us-ascii?Q?nIJ0mKGhTYUEH4t/OixJVmI3pO3mrulz8PORBE3pT/uB0IrsmXA+k3x3mXFT?=
 =?us-ascii?Q?iXBa0mO6ZkoU55BgC1Weo1y8A9Xq5HneW0hD/5LuQJdeZaImnSS3pnn9LQix?=
 =?us-ascii?Q?/LSKolv2UvJ86tDxTLbfmzN6I2aCLBmsp5vxNda3eU5enoG7sRnSDq/JVCcL?=
 =?us-ascii?Q?vNshogVsYsipE0EhyKEfPILXQYGLpWCSLn4T7QVSRETtXSdkAViFfarPHsJB?=
 =?us-ascii?Q?loMyGkCgFywvaMFrBpOYIJP5RtPGnhnuLl/fFhR9hQep+yIcc4EM4xh5aCs6?=
 =?us-ascii?Q?i/UgsWYakXqtfcAA1BTUF3XAavNIY+TKz83xFssdP0oOIweEF7eup3Rnsdv8?=
 =?us-ascii?Q?GwQXqqcHf7RrOn3YmnAY0t675zXOH2aVG09z0fcIohEa4iRCAVOXey4Vc25Y?=
 =?us-ascii?Q?JVKQtAFwh2ooRK72OsmHFCFGYwu3kPb9nYUy26sqXgSPd8ZBw0YH453riM6f?=
 =?us-ascii?Q?RCMtuUyGdY1YspevSg33BsftFy49MqRmD6NsXm/AQzuK8Bdk8eNfqi83s14C?=
 =?us-ascii?Q?MOLbM0Ul6ou9/XmtpuGovvJd4OTZXY2Y+T914YZvZiALMOMR6WKjOBfIE7dv?=
 =?us-ascii?Q?GOTE/2oyBQt1rusyajyrzoh9OZg87CiVimxtikkLoJ2m8dDIU7bIGtasG54+?=
 =?us-ascii?Q?e+M8ewWgJwHP2FQrYBuNzR+1cFKgMSO8Iii+n3WxL1rx53NjDHPbcU0OvY1/?=
 =?us-ascii?Q?DsvQyG1caVCJh5xq5Z16CqOYyV7d9W2uasA+11TJLScGfzDtXoS0cUALxhSV?=
 =?us-ascii?Q?VeBH9NQbVBKEiSzGySEO5iIwle2UPVPatDG173ULNhtkZqWJONPlb+FVjOs9?=
 =?us-ascii?Q?+k0R9oC2knuLBMElqG66Z/lIhT3Gq11XMf4nnatVNicIogDM+H2yJAXILhFv?=
 =?us-ascii?Q?bryofWLdrb+Br4l/3rT3er98LC88T0GNqWHl9fCam6Fclzq+WTrU//Kcg8jf?=
 =?us-ascii?Q?9JuSz6S2HDQJ538lTC4IeDQP+x2QVhhvydqueNzC9Hg2I/+gKdo7lK1+IuOM?=
 =?us-ascii?Q?lpFp8xQshivpbf3TdleKhHD6J/PdJSgyK72W1LQXSkILgxYmEXhZGMD3cUOt?=
 =?us-ascii?Q?YUQ+dCl62mZzrmQIVSU69i8ugzBzpBRf6qNCDzB9g3GSEjyfznCx20hu2dw5?=
 =?us-ascii?Q?7tGOEfc/WFV7py7hYyaI4xY+GJUJ+fQ+NDphqan/neAYc+XEb4pk08KmNpjs?=
 =?us-ascii?Q?VIR+6lfFF6ZVd3idkU/BW5XZwN2tMInV/sA98IuV0svVLGKr7NhkwQVlrXWA?=
 =?us-ascii?Q?gtgpKzCprsbCPgEwX3jE2uXl6QBgD0uye418VGcK4w7Cqd7KmYGIdMUjOIqv?=
 =?us-ascii?Q?MbvsBa+yOIo5UJM8kTdWjsImxcJfGxb3MI/KtUKDrz1E1OmfapoQ5modvL/e?=
 =?us-ascii?Q?ywoxBoA9kuaFq9PjEEMIZCVywlapMsG/0V+ZzoVtHokJoLEvrtOyawFddkAD?=
 =?us-ascii?Q?B4EmvpWY0G94wmZXONR6J1ZsgLLv/gVW1AhpZqrwnBbUWJMAv3TcxGCFfxfv?=
 =?us-ascii?Q?qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15505a04-fd64-450b-9ec1-08dda3ba0077
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 22:49:02.5708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0KGuKuiZBTubMLNitMMZj1yr9fzkqx9fLLLSgttQtJG1GC4RBcCCkGyx7KpuWNgo4eo8w/sZYs1zIS7M5T68Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7005
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

On Thu, Jun 05, 2025 at 08:35:40AM +1000, Dave Airlie wrote:
> Just realised I hadn't cc'ed some people.
> 
> ping,
> 
> Dave.
> 
> On Thu, 22 May 2025 at 05:48, Dave Airlie <airlied@gmail.com> wrote:
> >
> > From: Dave Airlie <airlied@redhat.com>
> >
> > This device pointer is nearly always available without storing
> > an extra copy for each tt in the system.
> >
> > Just noticed this while reading over the xe shrinker code.
> >

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

I'm not seeing a CI run for this on patchworks. Can you resend intel-xe?
You should have permission to trigger our CI. Assuming CI is clean, will
merge this one for you through drm-xe-next tomorrow.

Matt

> > Signed-off-by: Dave Airlie <airlied@redhat.com>
> > ---
> >  drivers/gpu/drm/xe/tests/xe_bo.c |  4 +--
> >  drivers/gpu/drm/xe/xe_bo.c       | 59 ++++++++++++++++----------------
> >  2 files changed, 32 insertions(+), 31 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> > index 378dcd0fb414..77ca1ab527ec 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> > @@ -514,9 +514,9 @@ static int shrink_test_run_device(struct xe_device *xe)
> >                  * other way around, they may not be subject to swapping...
> >                  */
> >                 if (alloced < purgeable) {
> > -                       xe_ttm_tt_account_subtract(&xe_tt->ttm);
> > +                       xe_ttm_tt_account_subtract(xe, &xe_tt->ttm);
> >                         xe_tt->purgeable = true;
> > -                       xe_ttm_tt_account_add(&xe_tt->ttm);
> > +                       xe_ttm_tt_account_add(xe, &xe_tt->ttm);
> >                         bo->ttm.priority = 0;
> >                         spin_lock(&bo->ttm.bdev->lru_lock);
> >                         ttm_bo_move_to_lru_tail(&bo->ttm);
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index d99d91fe8aa9..4074e6f64fd0 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -336,15 +336,13 @@ static void xe_evict_flags(struct ttm_buffer_object *tbo,
> >  /* struct xe_ttm_tt - Subclassed ttm_tt for xe */
> >  struct xe_ttm_tt {
> >         struct ttm_tt ttm;
> > -       /** @xe - The xe device */
> > -       struct xe_device *xe;
> >         struct sg_table sgt;
> >         struct sg_table *sg;
> >         /** @purgeable: Whether the content of the pages of @ttm is purgeable. */
> >         bool purgeable;
> >  };
> >
> > -static int xe_tt_map_sg(struct ttm_tt *tt)
> > +static int xe_tt_map_sg(struct xe_device *xe, struct ttm_tt *tt)
> >  {
> >         struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
> >         unsigned long num_pages = tt->num_pages;
> > @@ -359,13 +357,13 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
> >         ret = sg_alloc_table_from_pages_segment(&xe_tt->sgt, tt->pages,
> >                                                 num_pages, 0,
> >                                                 (u64)num_pages << PAGE_SHIFT,
> > -                                               xe_sg_segment_size(xe_tt->xe->drm.dev),
> > +                                               xe_sg_segment_size(xe->drm.dev),
> >                                                 GFP_KERNEL);
> >         if (ret)
> >                 return ret;
> >
> >         xe_tt->sg = &xe_tt->sgt;
> > -       ret = dma_map_sgtable(xe_tt->xe->drm.dev, xe_tt->sg, DMA_BIDIRECTIONAL,
> > +       ret = dma_map_sgtable(xe->drm.dev, xe_tt->sg, DMA_BIDIRECTIONAL,
> >                               DMA_ATTR_SKIP_CPU_SYNC);
> >         if (ret) {
> >                 sg_free_table(xe_tt->sg);
> > @@ -376,12 +374,12 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
> >         return 0;
> >  }
> >
> > -static void xe_tt_unmap_sg(struct ttm_tt *tt)
> > +static void xe_tt_unmap_sg(struct xe_device *xe, struct ttm_tt *tt)
> >  {
> >         struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
> >
> >         if (xe_tt->sg) {
> > -               dma_unmap_sgtable(xe_tt->xe->drm.dev, xe_tt->sg,
> > +               dma_unmap_sgtable(xe->drm.dev, xe_tt->sg,
> >                                   DMA_BIDIRECTIONAL, 0);
> >                 sg_free_table(xe_tt->sg);
> >                 xe_tt->sg = NULL;
> > @@ -400,24 +398,24 @@ struct sg_table *xe_bo_sg(struct xe_bo *bo)
> >   * Account ttm pages against the device shrinker's shrinkable and
> >   * purgeable counts.
> >   */
> > -static void xe_ttm_tt_account_add(struct ttm_tt *tt)
> > +static void xe_ttm_tt_account_add(struct xe_device *xe, struct ttm_tt *tt)
> >  {
> >         struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
> >
> >         if (xe_tt->purgeable)
> > -               xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker, 0, tt->num_pages);
> > +               xe_shrinker_mod_pages(xe->mem.shrinker, 0, tt->num_pages);
> >         else
> > -               xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker, tt->num_pages, 0);
> > +               xe_shrinker_mod_pages(xe->mem.shrinker, tt->num_pages, 0);
> >  }
> >
> > -static void xe_ttm_tt_account_subtract(struct ttm_tt *tt)
> > +static void xe_ttm_tt_account_subtract(struct xe_device *xe, struct ttm_tt *tt)
> >  {
> >         struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
> >
> >         if (xe_tt->purgeable)
> > -               xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker, 0, -(long)tt->num_pages);
> > +               xe_shrinker_mod_pages(xe->mem.shrinker, 0, -(long)tt->num_pages);
> >         else
> > -               xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker, -(long)tt->num_pages, 0);
> > +               xe_shrinker_mod_pages(xe->mem.shrinker, -(long)tt->num_pages, 0);
> >  }
> >
> >  static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
> > @@ -436,7 +434,6 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
> >                 return NULL;
> >
> >         tt = &xe_tt->ttm;
> > -       xe_tt->xe = xe;
> >
> >         extra_pages = 0;
> >         if (xe_bo_needs_ccs_pages(bo))
> > @@ -527,21 +524,23 @@ static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
> >                 return err;
> >
> >         xe_tt->purgeable = false;
> > -       xe_ttm_tt_account_add(tt);
> > +       xe_ttm_tt_account_add(ttm_to_xe_device(ttm_dev), tt);
> >
> >         return 0;
> >  }
> >
> >  static void xe_ttm_tt_unpopulate(struct ttm_device *ttm_dev, struct ttm_tt *tt)
> >  {
> > +       struct xe_device *xe = ttm_to_xe_device(ttm_dev);
> > +
> >         if ((tt->page_flags & TTM_TT_FLAG_EXTERNAL) &&
> >             !(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE))
> >                 return;
> >
> > -       xe_tt_unmap_sg(tt);
> > +       xe_tt_unmap_sg(xe, tt);
> >
> >         ttm_pool_free(&ttm_dev->pool, tt);
> > -       xe_ttm_tt_account_subtract(tt);
> > +       xe_ttm_tt_account_subtract(xe, tt);
> >  }
> >
> >  static void xe_ttm_tt_destroy(struct ttm_device *ttm_dev, struct ttm_tt *tt)
> > @@ -789,7 +788,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
> >         /* Bo creation path, moving to system or TT. */
> >         if ((!old_mem && ttm) && !handle_system_ccs) {
> >                 if (new_mem->mem_type == XE_PL_TT)
> > -                       ret = xe_tt_map_sg(ttm);
> > +                       ret = xe_tt_map_sg(xe, ttm);
> >                 if (!ret)
> >                         ttm_bo_move_null(ttm_bo, new_mem);
> >                 goto out;
> > @@ -812,7 +811,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
> >                 (!ttm && ttm_bo->type == ttm_bo_type_device);
> >
> >         if (new_mem->mem_type == XE_PL_TT) {
> > -               ret = xe_tt_map_sg(ttm);
> > +               ret = xe_tt_map_sg(xe, ttm);
> >                 if (ret)
> >                         goto out;
> >         }
> > @@ -973,7 +972,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
> >                 if (timeout < 0)
> >                         ret = timeout;
> >
> > -               xe_tt_unmap_sg(ttm_bo->ttm);
> > +               xe_tt_unmap_sg(xe, ttm_bo->ttm);
> >         }
> >
> >         return ret;
> > @@ -983,6 +982,7 @@ static long xe_bo_shrink_purge(struct ttm_operation_ctx *ctx,
> >                                struct ttm_buffer_object *bo,
> >                                unsigned long *scanned)
> >  {
> > +       struct xe_device *xe = ttm_to_xe_device(bo->bdev);
> >         long lret;
> >
> >         /* Fake move to system, without copying data. */
> > @@ -997,7 +997,7 @@ static long xe_bo_shrink_purge(struct ttm_operation_ctx *ctx,
> >                 if (lret)
> >                         return lret;
> >
> > -               xe_tt_unmap_sg(bo->ttm);
> > +               xe_tt_unmap_sg(xe, bo->ttm);
> >                 ttm_bo_move_null(bo, new_resource);
> >         }
> >
> > @@ -1008,7 +1008,7 @@ static long xe_bo_shrink_purge(struct ttm_operation_ctx *ctx,
> >                               .allow_move = false});
> >
> >         if (lret > 0)
> > -               xe_ttm_tt_account_subtract(bo->ttm);
> > +               xe_ttm_tt_account_subtract(xe, bo->ttm);
> >
> >         return lret;
> >  }
> > @@ -1039,7 +1039,7 @@ long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
> >         struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
> >         struct ttm_place place = {.mem_type = bo->resource->mem_type};
> >         struct xe_bo *xe_bo = ttm_to_xe_bo(bo);
> > -       struct xe_device *xe = xe_tt->xe;
> > +       struct xe_device *xe = ttm_to_xe_device(bo->bdev);
> >         bool needs_rpm;
> >         long lret = 0L;
> >
> > @@ -1076,7 +1076,7 @@ long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
> >                 xe_pm_runtime_put(xe);
> >
> >         if (lret > 0)
> > -               xe_ttm_tt_account_subtract(tt);
> > +               xe_ttm_tt_account_subtract(xe, tt);
> >
> >  out_unref:
> >         xe_bo_put(xe_bo);
> > @@ -1377,7 +1377,8 @@ int xe_bo_dma_unmap_pinned(struct xe_bo *bo)
> >                         ttm_bo->sg = NULL;
> >                         xe_tt->sg = NULL;
> >                 } else if (xe_tt->sg) {
> > -                       dma_unmap_sgtable(xe_tt->xe->drm.dev, xe_tt->sg,
> > +                       dma_unmap_sgtable(ttm_to_xe_device(ttm_bo->bdev)->drm.dev,
> > +                                         xe_tt->sg,
> >                                           DMA_BIDIRECTIONAL, 0);
> >                         sg_free_table(xe_tt->sg);
> >                         xe_tt->sg = NULL;
> > @@ -2289,7 +2290,7 @@ int xe_bo_pin_external(struct xe_bo *bo)
> >
> >         ttm_bo_pin(&bo->ttm);
> >         if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
> > -               xe_ttm_tt_account_subtract(bo->ttm.ttm);
> > +               xe_ttm_tt_account_subtract(xe, bo->ttm.ttm);
> >
> >         /*
> >          * FIXME: If we always use the reserve / unreserve functions for locking
> > @@ -2337,7 +2338,7 @@ int xe_bo_pin(struct xe_bo *bo)
> >
> >         ttm_bo_pin(&bo->ttm);
> >         if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
> > -               xe_ttm_tt_account_subtract(bo->ttm.ttm);
> > +               xe_ttm_tt_account_subtract(xe, bo->ttm.ttm);
> >
> >         /*
> >          * FIXME: If we always use the reserve / unreserve functions for locking
> > @@ -2373,7 +2374,7 @@ void xe_bo_unpin_external(struct xe_bo *bo)
> >
> >         ttm_bo_unpin(&bo->ttm);
> >         if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
> > -               xe_ttm_tt_account_add(bo->ttm.ttm);
> > +               xe_ttm_tt_account_add(xe, bo->ttm.ttm);
> >
> >         /*
> >          * FIXME: If we always use the reserve / unreserve functions for locking
> > @@ -2405,7 +2406,7 @@ void xe_bo_unpin(struct xe_bo *bo)
> >         }
> >         ttm_bo_unpin(&bo->ttm);
> >         if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
> > -               xe_ttm_tt_account_add(bo->ttm.ttm);
> > +               xe_ttm_tt_account_add(xe, bo->ttm.ttm);
> >  }
> >
> >  /**
> > --
> > 2.49.0
> >
