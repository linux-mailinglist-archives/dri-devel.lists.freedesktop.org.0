Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 192128043DC
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 02:17:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4C010E45A;
	Tue,  5 Dec 2023 01:16:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9A210E45B;
 Tue,  5 Dec 2023 01:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701739017; x=1733275017;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tUZHShn/KG6iKGAUA964vQfA/yq0nJLWpYHhbTjGRws=;
 b=EEs1Eqp81ZibGyHR3gTgGpaCEHH7T9gfD6axAHuAYjEJhdb06IChsdOv
 GMPSmej1bX9X7/L8SfV9Go6frIpTJv2upm4N+Bg2MSged9N6C+FRp9MS7
 ksuo9eCiQ8Zfz0/JrWsAnH6MA0CAsn7CY1FikyC0OQFyYqSg+kN1trG9h
 PF9OlxpgfWsUib9kJzS/KNYdJfKYqmDA1voBkyyDID+VCtfYitOJu6S8n
 jrkM+fvdYl9oBiAgMRvJReP9qmSgU7nmvpPwbFbk6b/pBChaAW2IwO9Z0
 G/KObyWBN2NhuBCM3ZtcCZOMuyAOdHRDi3TcnaeYP2fp1hvHVWFZGoM25 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="458145358"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="458145358"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 17:16:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="1018038872"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="1018038872"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Dec 2023 17:16:55 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 17:16:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 4 Dec 2023 17:16:54 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 4 Dec 2023 17:16:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L9ILORWcCo8YLlDBkIROGJry/ckjfpi2XAuMVKxIEaddaPEscRnfXR+MnL4P6H0QzHPjusQsWNhttQlzkHJ8krMOrJ1iKE+EZLtswLwVvv9m2O9QQ8ouwFQF17pKJUXSyh8s9P4RpYJZ1Gbr0DeM7TD947RgFVfCj59/jX1+ETH2+gii5Ipj8SV2gs95gCvmFyttLWI8FWvyBsrLu7iNvh0onqgri0GAEWNUbQmBV0pz+68hLo3WDI83JymulplxKqGMwW3rb7mvBiV8Tab4TM9kwIsxaMxg1W4AveFvUZLFzQng5wR7axTzYMX112VDAd8nKYI2wbJE+mhCFXh6dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y6Q8PyAOy9mFlkEWdsw6cUzAtI/ksX+aiH2K/5n5IUw=;
 b=BD05AHiCxyGs6648ek/teJ8lik6DQCiVYmETEWucQ93fqkVgn2MFeG4ahhrlpw2ztRRUNLNcVkeCZuUXy64qOENSXQXyVF6GauWm7gEo1OMHpgDkwyQJdfGei8MJkDymXRnVsm5hMt1uu4fWvZpDd6uH2wb6XBRYg6JjmAkVVnKEO5VGECSENRRd9/JNcUlF88ySMMV4NWbx/bLnpu7BYaBiyHF/UBXoi8ha8yz8EcEF32672huUF9tEYb9HlevqgABib6E9ZQyEe//SNmdlzyuPdJSmrl8ps3iij13INOzyRBnzPVmt6JPKO+1TgIQptuuzY30C1AdyewSwiVnOhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ2PR11MB7618.namprd11.prod.outlook.com (2603:10b6:a03:4cc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Tue, 5 Dec
 2023 01:16:51 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.033; Tue, 5 Dec 2023
 01:16:51 +0000
Date: Tue, 5 Dec 2023 02:16:48 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 2/2] drm/tests: managed: Add a simple test for
 drmm_managed_release
Message-ID: <5ec7lc2cyrfchpudujcbhlka6oqjmaxc24oebzccge3733tugp@iutnntppwzk4>
References: <20231129221412.1180549-1-michal.winiarski@intel.com>
 <20231129221412.1180549-3-michal.winiarski@intel.com>
 <3sio7356dxi5nbld2eupih3rzazvef4ebusrpdrhabnpg7pns4@5zxfnd4az4li>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3sio7356dxi5nbld2eupih3rzazvef4ebusrpdrhabnpg7pns4@5zxfnd4az4li>
X-ClientProxiedBy: WA2P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::28) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ2PR11MB7618:EE_
X-MS-Office365-Filtering-Correlation-Id: cc934d0d-e1b4-4fbd-c648-08dbf52fdc7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KdHY8Q9lbYWRwt2c96WjLkwFMlHQWVTQQdBZelhXtD3+bbj9tiZUhiv+T4F3GngvRM4O5TGxhzT9cSmxgzuo6qdeW+SMxxqNE+OhwurGRIchJarMFzpXtt3NPWS44mZ/161sJNZ89RBCY4yxxoIMy5W7KGY8gn/JjA8bOmIEWj4EFQYspR4l+9B0ldUkTsqd39B+3VFIT2boSNhb77Tgs3Za84dxlbvAWcHWApFnCBr5icBeMxnnScKMCkgscIr6kJpb4GQ9JzvjRSjNIDXaiJbMS9vH/AMVR9fu62FkMub8PVmZbm/BC6VtSSL75sTR62iEhCO8xNndUAv+UWZtmQNyV4zuPW6K8YshwZxjfKBDnnocbi2Kof9mGXZPEyprApoinkeBgUJYOS0ctLjSU1jFts1aeAdeKIjDwgFNc0KQprxVYC49HsmWeojNy3BkS+5nwcR3L9ixqhGWhY3wJTerTqRFw9+VfCTx8qZM42AKz2hnxeHc5BhTpsa3Bhi7hJ9LWW85bI4x1ZCf8uV/saqLPfXdMu3M4UaW+lDEF5U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(396003)(39860400002)(346002)(376002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(5660300002)(86362001)(4326008)(8676002)(8936002)(2906002)(7416002)(33716001)(41300700001)(6512007)(9686003)(6506007)(82960400001)(6666004)(83380400001)(6486002)(478600001)(26005)(38100700002)(316002)(54906003)(6916009)(66476007)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkJyWDBKbTdRTm5TdE1pS2d3QTlYb2U1OXJmWC85eHR1cW55MDF1SEtQQkdY?=
 =?utf-8?B?VFdSVStzZDVNSU9TYThMNGVGaUowbU5QWUMwYnlTb2ttMjN4alBmdlZGZHJL?=
 =?utf-8?B?elFQL2pwSDZjb2xzanI5MGU3dWl1UXkxaU95UnN3M0dUWEx4ekovZjA1blBT?=
 =?utf-8?B?R2JUeWlmRXJhMnZodFQ5ZC9vOVJKR0gyU1dDSFovRHBxVTVSemtESk1BRVpL?=
 =?utf-8?B?VUtoTnB3SjhKekFlY3RMWkF4ZHFkdm0rVy9CSzNESkswcnVyMHJONzJjcmkz?=
 =?utf-8?B?NTV5L2Y0Y2lld1E3TkFnQmh5Q04zREFaS1NHWEhFOUtLSDJYN1EzN0YxTjgy?=
 =?utf-8?B?YVhxWGFsdGxyTDZheFBPV2UzZU5sa0RKUEZGMU5FOWZPSmxLYk41ZitwMnl5?=
 =?utf-8?B?Qi9aMituTWZwQktFZWFoMGRiYjdUVkJjclV6R0tjbkFwSE9tdjVWellTVDFQ?=
 =?utf-8?B?SkQ2T3NKU1dlZHFVWUZGYXQwVk9pTHVxZHZDUFM1ZVVsU0lvOFhyZEtGR0FW?=
 =?utf-8?B?LzJ1SzFadUVwUHR5a1lpUE11ZDNXVDF2a09UVWUwblZRek91cFB6Ym13MXc4?=
 =?utf-8?B?MXJxZ0srTmh2UjZKU2xtd0ZUeStiTzRRUEdWMkd4b1ZQU21zNnV6cVZCVFVJ?=
 =?utf-8?B?Q1VzaS84anlYSnZNSE5YNDFqYlJrL0EvZVNtYWlPUmliTGpNeTdCSTVlZ0lS?=
 =?utf-8?B?cTFNWC9RN0hoSy9sQk9aZGxOVU1GbmcwTDVBSUdJKzlRV3UxM29mNUpsaUpU?=
 =?utf-8?B?UGRyUXY1VjR4QWdSSEtHKzB0UmlmMmFHUlpkK0FWb3crUmJtTFY4RUJiYUs2?=
 =?utf-8?B?S29sYVMra3RBajZzcmhiZ3lsd3BISDhESmhidHd3NDBWRzZsVUh5b3dwVXg5?=
 =?utf-8?B?MGNVdzN1ZWI3MFpZRWZzN2Rna1hIQlg1VCtTVkt2ZmU4eHcvNTI2U0FHNUNX?=
 =?utf-8?B?cU13M0lyZnZLL2pYcXU2RVVjQW45bjNMTXpIVGR1Y1Zwc3Rja0ZRdjdwV1Bq?=
 =?utf-8?B?NHVJRGNsamNmc0ZwWEl0MFlpd0U0RmgxRko2NU1YZ2FLSWEyaUV1MXJudExT?=
 =?utf-8?B?ZGliNzFXMHYvV1V1dTNBNWZ6cTgrell6Nk1QZ1hrNDc1dmhuaDVYTk8zTTJK?=
 =?utf-8?B?MEl4dFloUHRLZ1c5MFQyQnZTS2FMblJ4Zk54cVBZTjFKZUhiNkhVcE01aFJ4?=
 =?utf-8?B?aVhKT25La2lNL3Z4S1ozL0hBaWFBdEVnTllTcUlwemdHdWJhcENueWMxcGpS?=
 =?utf-8?B?UVhiaUNpNUN1alJoOTFXSFN1VEJwQnVKNUY4UFBaVlFJMVBHeENVZ0dnLzRi?=
 =?utf-8?B?Z0FUbUp2SUI0cmFJOWsxWlZKdFV1ditiSnlpYTV5Q3ZFZ0wxWnNnZTVOTmRs?=
 =?utf-8?B?TThxRXNrSkFXK1hrSzJpb2VHUVNRUWdNZTgxcWdibGZEeURWNDkzZlZIMjd5?=
 =?utf-8?B?dlFQU0RtTHIwbElxZUx1cFhXN3EyQ0hiTHBFMzc0SVAzWGlOL3dYTlRqR1Vl?=
 =?utf-8?B?NzVhY2dxS3owVEo5eW5pcU5jR0FVMm1vR2plTFlPbDEzNmNOSllwQUx4Wldi?=
 =?utf-8?B?cG9ZTmxZUS9FcWx3YzJWN1o4aEw5Q2Nyb3hXZUY3cXNWNHgxQ2Y0Y3pwMVRo?=
 =?utf-8?B?VWgvYkoxRGVGRTVjZUdQcDlEM2ZmOStsOEIydGhzSzNaQUlULzhNUldrZTJl?=
 =?utf-8?B?WXZCRlpNNHZ4MWxEZ25zaDJHZ3pybUF1TEcvSTNWOWIvTU5CZElISEF0c1ZY?=
 =?utf-8?B?YlFLcEdGWjQ4eXduU2tYRnN0SzdvdHRqdWV4V0VhdENSRlNuZDdIR1JtM1U1?=
 =?utf-8?B?VDlGandWN2RLMWhIRVBiMklPUi9OS3M1VmRhQXk5ZXRFRmFFL2Y5c3ZCcFdx?=
 =?utf-8?B?akUwRW41VThhM2NNK010b1JtVVJWbnh0VTlyNEdua1p2eENhL214Zm1abWJ5?=
 =?utf-8?B?L1hHdEJqNmVWRTNrZ1ovVUhJRnhrNGRNSFpwTG1sT0dEUi83TExOR2wrc29k?=
 =?utf-8?B?YUhnU2R4WUZwOFdBWHNudldJL21yRjgwN3ZnN3NCZmdHa0tJN0JjZ0lMbXh6?=
 =?utf-8?B?MmppUk8vVTNNQVducTJpMjNVNkVQV3VqSHhmQVhaWUZrY0dBM0NrUHZWN3V3?=
 =?utf-8?B?R2xDcjJzYVpvSmxjTWZERjJtQzBqUjdTdkJKWmxoSGtLTEEwU3ROQ3l1U25M?=
 =?utf-8?B?dnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc934d0d-e1b4-4fbd-c648-08dbf52fdc7f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 01:16:51.6514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D2aBqDb7AsVs7fEvbI63flpnLciXifWmIG8Op0ruZNNwjKn1Yl9tbJOeZ4QrLejPS4vsoXVDPn1/UyNy+/dXELfO6SEf2TO+tbAi9rarMbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7618
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
Cc: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Javier
 Martinez Canillas <javierm@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 30, 2023 at 09:38:35AM +0100, Maxime Ripard wrote:
> Hi,
> 
> Thanks for creating a test for that, that's really appreciated :)
> 
> On Wed, Nov 29, 2023 at 11:14:12PM +0100, Michał Winiarski wrote:
> > Add a simple test that checks whether the action is indeed called right
> > away and that it is not called on the final drm_dev_put().
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/tests/drm_managed_test.c | 65 ++++++++++++++++++------
> >  1 file changed, 50 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/tests/drm_managed_test.c b/drivers/gpu/drm/tests/drm_managed_test.c
> > index 1652dca11d30c..a645ea42aee56 100644
> > --- a/drivers/gpu/drm/tests/drm_managed_test.c
> > +++ b/drivers/gpu/drm/tests/drm_managed_test.c
> > @@ -12,6 +12,8 @@
> >  #define TEST_TIMEOUT_MS	100
> >  
> >  struct managed_test_priv {
> > +	struct drm_device *drm;
> > +	struct device *dev;
> >  	bool action_done;
> >  	wait_queue_head_t action_wq;
> >  };
> > @@ -26,42 +28,75 @@ static void drm_action(struct drm_device *drm, void *ptr)
> >  
> >  static void drm_test_managed_run_action(struct kunit *test)
> >  {
> > -	struct managed_test_priv *priv;
> > -	struct drm_device *drm;
> > -	struct device *dev;
> > +	struct managed_test_priv *priv = test->priv;
> >  	int ret;
> >  
> > -	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
> > -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
> > -	init_waitqueue_head(&priv->action_wq);
> > +	ret = drmm_add_action_or_reset(priv->drm, drm_action, priv);
> > +	KUNIT_EXPECT_EQ(test, ret, 0);
> >  
> > -	dev = drm_kunit_helper_alloc_device(test);
> > -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
> > +	ret = drm_dev_register(priv->drm, 0);
> > +	KUNIT_ASSERT_EQ(test, ret, 0);
> > +
> > +	drm_dev_unregister(priv->drm);
> > +	drm_kunit_helper_free_device(test, priv->dev);
> 
> I think we'll need two patches here, one to convert to having an init
> function, and one to actually add the new test, it's pretty confusing as
> it is.
> 
> >  
> > -	drm = __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*drm), 0, DRIVER_MODESET);
> > -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm);
> > +	ret = wait_event_interruptible_timeout(priv->action_wq, priv->action_done,
> > +					       msecs_to_jiffies(TEST_TIMEOUT_MS));
> > +	KUNIT_EXPECT_GT(test, ret, 0);
> > +}
> >  
> > -	ret = drmm_add_action_or_reset(drm, drm_action, priv);
> > +static void drm_test_managed_release_action(struct kunit *test)
> > +{
> > +	struct managed_test_priv *priv = test->priv;
> > +	int ret;
> > +
> > +	ret = drmm_add_action_or_reset(priv->drm, drm_action, priv);
> >  	KUNIT_EXPECT_EQ(test, ret, 0);
> >  
> > -	ret = drm_dev_register(drm, 0);
> > +	ret = drm_dev_register(priv->drm, 0);
> >  	KUNIT_ASSERT_EQ(test, ret, 0);
> >  
> > -	drm_dev_unregister(drm);
> > -	drm_kunit_helper_free_device(test, dev);
> > +	drmm_release_action(priv->drm, drm_action, priv);
> > +	KUNIT_EXPECT_TRUE(test, priv->action_done);
> > +	priv->action_done = false;
> > +
> > +	drm_dev_unregister(priv->drm);
> > +	drm_kunit_helper_free_device(test, priv->dev);
> >  
> >  	ret = wait_event_interruptible_timeout(priv->action_wq, priv->action_done,
> >  					       msecs_to_jiffies(TEST_TIMEOUT_MS));
> > -	KUNIT_EXPECT_GT(test, ret, 0);
> > +	KUNIT_EXPECT_EQ(test, ret, 0);
> > +}
> > +
> > +static int drm_managed_test_init(struct kunit *test)
> > +{
> > +	struct managed_test_priv *priv;
> > +
> > +	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
> > +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
> > +	init_waitqueue_head(&priv->action_wq);
> 
> Also, I know that it was there before, but I'm not sure it's valid from
> a lifetime point of view. Or at least, we have to think hard enough
> about it to just remove that construct
> 
> > +	priv->dev = drm_kunit_helper_alloc_device(test);
> > +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->dev);
> > +
> > +	priv->drm = __drm_kunit_helper_alloc_drm_device(test, priv->dev, sizeof(*priv->drm),
> > +							0, DRIVER_MODESET);
> > +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
> 
> For example by storing the drm_device struct in the priv structure
> directly, and thus everything will just work out.

Sure, makes sense, I'll include it in the patch that moves device alloc
to .init().

Thanks,
-Michał

> 
> Maxime


