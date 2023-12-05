Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6460805854
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 16:14:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21FDE10E557;
	Tue,  5 Dec 2023 15:14:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E933D10E557;
 Tue,  5 Dec 2023 15:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701789252; x=1733325252;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tovTr3nZu2yPar+cuVmn5Z3qlEpx4S23A3o+HytAUPk=;
 b=X0e18YOdwvbMecF1Q4BE9WypyFvWSkRU6P0ybipam5jW55qQhwDrz1kY
 go6xcLRIYkiYTDopFy4HuQqkmGD+QNSEZxzX9sXvVS0VaLT3Fsc88XRqQ
 wxiFb6nVpRu72cF0fFTk2nGvobPPzt3yg+P0OwR8nhNnA/6ip6Dldmz9J
 pYZvJIlZnNkk76z9g1zSLp1Xb93xmyvMYqGSNpZgS6b7RmScEVTpWAqsu
 X2Ol2DMJCAm0E7s5OtiCVAn66EEwV6J3dhAJq3rhMoyUYMhDVpA1NYwSM
 EjZpi5zkCe82zwr0hRm6NUbFLelBC64zuTUzi2k0Q8sauxHzcZJeB3CBF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="373356405"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="373356405"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 07:13:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="18989754"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2023 07:13:53 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 07:13:53 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 07:13:52 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Dec 2023 07:13:52 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 5 Dec 2023 07:13:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CIoZBHb7gc6mi/IWEDA4kzUKlEcv56lFWVMOWsY6GH2kWBoso/PKR+YyNtzHq+aernXBHVc3CNJC5WWjfDiGOOXQlF3RASwii9nGZGvAz1m9K2jqtmR2PJU1h0jlBdLe6DzYEVd+ngQLZ8tD9UGCO5R5cYy3d+FpSLIDhoXC1cM/hHfgPpxY3nhjNGjCo7GhsH00HdJE/4H8oFwU2YHVVSKpLWm7ajzF2tMeFxMSNJCyNXWL+3QuySQHOJFXAYgPmWqBjQ5/NHF5K8AJNoeFzeIUGzvftbEEH3JQYyNcHsyr/Fae2FBbHZp5876RIW76PCfcxF+ETVKYvvZIs3dL/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QMclrL7Mtbebavq13QsiET9CqxDgtn6wpnuTbsFCzXc=;
 b=XAY8M2yRSkXk23GKlZ7NzCYwM1EhiNMm9K6rn1PM6M2xZNt/b8HsyUKenB9HXi5PiOdWQxSVC3kSNlS3bWsm0yfojWRGgQ7iQMDQdv3U3FvVdt2/ciTqQC4rdoePYW55v1oV125YX2dYu20O5QIAdrY+ID037AxH8scA9Oe/4mV3TZ/V0dNCTNsSKXgUVMSyBcAHqslHC6jDT9fGKJacUiO/2uNDTTb9ESBwDh03O8Wt2r/BnQ51ozE3UMF1HPGET17ew1pnuBwZRAYn2aHJTGulLNZnB/AQrrJc/C85HRfGKJdAAiyJpcL0m0j8sMd14r6+9EUqRrlaQPfpCFgsmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DS0PR11MB7381.namprd11.prod.outlook.com (2603:10b6:8:134::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.34; Tue, 5 Dec 2023 15:13:50 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 15:13:50 +0000
Date: Tue, 5 Dec 2023 16:13:47 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v2 3/3] drm/tests: managed: Add a simple test for
 drmm_managed_release
Message-ID: <oejxznxyvki6jg5rbrqcnwzmmygstypp24nbf3pn4nqgifmjpc@m3qqcgmuch6u>
References: <20231205012210.1491532-1-michal.winiarski@intel.com>
 <20231205012210.1491532-4-michal.winiarski@intel.com>
 <okubt4juvgbya5ybtfhozaczqvjhzqrtz3ltw4vylbmme5dzff@27tazbke5j25>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <okubt4juvgbya5ybtfhozaczqvjhzqrtz3ltw4vylbmme5dzff@27tazbke5j25>
X-ClientProxiedBy: FR2P281CA0177.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::13) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DS0PR11MB7381:EE_
X-MS-Office365-Filtering-Correlation-Id: 21949f6f-c6ab-4b0b-17f4-08dbf5a4c8e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Haa89zV0phnvcvsP3YoEQOOVG+TqT4Jb2cDUpKOqC7mJy/MITHpOhu3EjzNYgkWJuSsaopMP/npiClnqz+wvBCUHAEPa/FeCOnEF+6ucU9jRP6tSUm+/UtxvI835DEUOn3vh8jcaYaBpKtCIQxRKpJvQDo978ZdAyfFQtlwS56oABJA3ucqYWU+ChPx7FLRcyiwUksxkP/3LZNUeo9+/eZmlE/MSV7Hgm5yKtosXLApRwF6cSyoSlbNt1HK1eahBhjZRglmyxVqiwFGoyTT3Ms7pmoqnbC7gBv7y+BoSls1XQ5KnK+NfMrY3KqjLEea7mAgedUBvQ6kUEsJFxR+7DvNQth8eBiDkY/2/RxruyOhOb82PXTDmdNcEgSsjRg7Bj1OBuyH99k9UylbyK/2oopHGUuK0Dyw5sDRS2aGu4dTvCErfzXVHEV7rh1aaEgn95+4S+WYEUXxRJOLaL2Pu6kgLPUfNA59Bwjt3z7QBe99K1mtuhFGc4r6/yYXZ/7vc5fzZLZKw5KXfPPhK6I7oSBH3/4VXuOG44tcke+khBiTzASgEfrGd0aLJ3KwL5iqL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(366004)(396003)(376002)(136003)(39860400002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(38100700002)(9686003)(6512007)(6506007)(6486002)(6666004)(478600001)(54906003)(66946007)(66476007)(66556008)(316002)(26005)(83380400001)(4326008)(8676002)(6916009)(8936002)(82960400001)(5660300002)(7416002)(2906002)(41300700001)(86362001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGhCdWdSbGpqTjBEd3FQYnd0ZFlsV0R2djZuZ2VYS0ZRQngzdGt4bVBtUXVE?=
 =?utf-8?B?WXNud0w0NldHZWg0NmtaUFZtdm51UXpMMTZqY0g5UlRHci83Y1NSMHZQVEw0?=
 =?utf-8?B?cnJZZ0hwMnlKMEx4OHRFYmI0K2RFRnZRQjJ6bUs2cDlZZ3psbzRLL1J3MFJO?=
 =?utf-8?B?bVhEMGVyeGl5cGszbExWWHRGaUNmQlc0YkY5QmlVNU5QdG9ZQ1Irc1FSRG1j?=
 =?utf-8?B?bWlzQjRWY09uVzFNVjVzMTdqNEYyQ1B4RDlKL2NXOG9IMGN5N1Q5Uk1mcmFn?=
 =?utf-8?B?VGE2TnJnekVTOEhQTStvKzI1N1JzNkkvdjExT1lOcWZsWWJaQkhKMkNHM05J?=
 =?utf-8?B?VzVRT3g5WGE2ZXNsRjY1U21mOUtCN3BzSUNhOUJjSzgzcHVSVzBLSTVkOTUv?=
 =?utf-8?B?RWVUODRuandsOFBMcERLUmxIWnU5L2ErbDVEby94bzZaN1RZcVZ2WUkyUzhw?=
 =?utf-8?B?QnFOWmsrUS81OHZMQUJMVGNGNkllS1NVY094SE15bENqRStNSTM5bUdSbThr?=
 =?utf-8?B?czBTVkxlbGZEWlRldm1NZFU0ZElUMXBNa3FBdnI4WnViZzNUWnR2QzVNT0lr?=
 =?utf-8?B?bitRQytET2VSZDJsdjZXRkJRbGdmejhZYmZUc1ZmbEtndnRaQlIvNFZWNldH?=
 =?utf-8?B?TVliY3lzSy9IUy9RdW5sM1hPYzZhbVN6S2hxeUxHN1JpYk03V3h1anZjNlpr?=
 =?utf-8?B?WHMyOHp3VGFFUjgweVp1dUhHNzlMN2NOQy96SW4rMkk2RVBmZW5HdlgyU2lh?=
 =?utf-8?B?T3QxOGRrY1BrSW1za1BMazMwS0lWWUNrTll5Y2JjQXpCMi9LRTMzOUdQNkRL?=
 =?utf-8?B?U0NDelUwMUFtVnR1N1RpdDVNRUZ2YVYzd1V0M1BuUVNyWkNtKzE1eTF2UVdL?=
 =?utf-8?B?cHlsa0dUdVVaSU11K2tnNmQrTmVRS09UZmw5RzZYM3ZUSk9VWlYyZWF5cHMw?=
 =?utf-8?B?NktUWGVUaSs2TFpBNnJqSkQyQ2VaM3pYT095NldzbHRPK2phNVdzVVEvQXpw?=
 =?utf-8?B?S2VMcFMyNGVpUkV5a2JIcmxFMmhMOFg3ZkN6aStUSmNXSG9CRXZhbmEzdHAv?=
 =?utf-8?B?SXgvVEN6aG9aZGYvTVdYQ1VUYWMrbWo2dXU0VTg2RXJZcC9XTmxVMWFISS9O?=
 =?utf-8?B?UWRUMkJYT3AycVFPazcvM1hyczU1OXpBR1pCVWdQeW9lSFVPS0FqVWRUbkxR?=
 =?utf-8?B?QlowN1BNSjN0STU4d04xVm5CV1NYSTkvMnExM2h4cjloeXBWdzJsQmdLaUlK?=
 =?utf-8?B?L2Rnd1JSOXR3blNTVmh5ZytlRVA2SWc4OHVXV2h4QU5RRVlSUGNSeHBoTzhV?=
 =?utf-8?B?MjJuQTFXa0F2RDEzdjdneHYyT3FyeGhTeUtJWk9Kd0NGbDkvbXhIbGYzZkFa?=
 =?utf-8?B?WWZtSitKTXhHOGJINm5ZeEVaZE5KVzVpakt5Ykw2ZGFHcTNpYjArUFVpbjhj?=
 =?utf-8?B?TUx2NXZqRlpONTM5K3BSUjNsUkJGd3hPOUQvaU5YUjI4Y0JmdTVPRklyWjl3?=
 =?utf-8?B?S0F0TmhIZ1JEU082VEFLYTYvT3l3YTF2eTRENzhDbHVTaW5iaEx3WjdMTWdB?=
 =?utf-8?B?NktBNFFrSWtrdWN6OHVIazQ4S0JhQnVUUE1XeE0rdGxMNmpVbHIzNXhCK1Np?=
 =?utf-8?B?N3BoZ0l4bkNaRThSVFVwdDVYS3VMcGVIeWpBYnRsRUJQYVNOQXp3VXN1TUJT?=
 =?utf-8?B?UC9YSkFHMHo1N042SXNSZTBUSTNzZ2RnZ0ZxRXhNKzI4TitPay8yRU9SQ2Vn?=
 =?utf-8?B?MVBKb1ZVdm5Kdis1eEZtWVFGazZ6eVJQQ29rSUFWYVo3YTRDSUQvdGUyKzBh?=
 =?utf-8?B?SEZ4MFUzQkVueVc0bnZ2U3FydWpHaVYzeFhMb0d6WWUzTFJKVVhQSmpwQ0FM?=
 =?utf-8?B?V2tHTnFnYzBtdmRaT3VTSXNkQ1d6V2xmbkFycjJ5dExiZGFHR1c2YVlUdEFk?=
 =?utf-8?B?YU5JSFVLKzNhTllEL3RYc3I5U2doTWI3Szg0WHg4OGlKRGo5L0o0TXpza3ky?=
 =?utf-8?B?aGZwSEpsMXdIQ0FYNEdGYTNETkVJRnd6WGRKRWI4djNKbnR2SDI5UXVST09w?=
 =?utf-8?B?cHBsanRSUmhNTVBRckx2ak9UbERhelpEV2k3cUY1L2NkS05SeVY1V1JsU2ZY?=
 =?utf-8?B?cWx2VkhRclJZOUpKcEtPbUdNeUlpRG5FbllaUkt4N2tXa2Y5alV6N0NVa1N6?=
 =?utf-8?B?bWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21949f6f-c6ab-4b0b-17f4-08dbf5a4c8e5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 15:13:50.4424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NZuaPObxykfHwLf5HEasOOxX/Nd51C466nQJA05BqPumJn/nwnGWBR9+jrCJOQyoLjQVfvA8odplplG/ANZbAqgWSe3MzDmabj7BPB18bYI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7381
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

On Tue, Dec 05, 2023 at 02:50:22PM +0100, Maxime Ripard wrote:
> Hi,
> 
> Thanks for the rework
> 
> On Tue, Dec 05, 2023 at 02:22:10AM +0100, Michał Winiarski wrote:
> > Add a simple test that checks whether the action is indeed called right
> > away and that it is not called on the final drm_dev_put().
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/tests/drm_managed_test.c | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/tests/drm_managed_test.c b/drivers/gpu/drm/tests/drm_managed_test.c
> > index cabe6360aef71..8dfbea21c35c5 100644
> > --- a/drivers/gpu/drm/tests/drm_managed_test.c
> > +++ b/drivers/gpu/drm/tests/drm_managed_test.c
> > @@ -44,6 +44,29 @@ static void drm_test_managed_run_action(struct kunit *test)
> >  	KUNIT_EXPECT_GT(test, ret, 0);
> >  }
> >  
> 
> We should have a description of the intent of the test here.

The test checks that the release action is called immediately after
calling drmm_release_action, and that it is successfully removed from
the list of resources managed by DRMM (by verifying that release action
is not called upon device cleanup).
Would it be enough to expand the messages in KUNIT_EXPECT?

> 
> > +static void drm_test_managed_release_action(struct kunit *test)
> > +{
> > +	struct managed_test_priv *priv = test->priv;
> > +	int ret;
> > +
> > +	ret = drmm_add_action_or_reset(&priv->drm, drm_action, priv);
> > +	KUNIT_EXPECT_EQ(test, ret, 0);
> > +
> > +	ret = drm_dev_register(&priv->drm, 0);
> > +	KUNIT_ASSERT_EQ(test, ret, 0);
> > +
> > +	drmm_release_action(&priv->drm, drm_action, priv);
> > +	KUNIT_EXPECT_TRUE(test, priv->action_done);

KUNIT_EXPECT_TRUE_MSG(test, priv->action, "Release action was not called");

> > +	priv->action_done = false;
> > +
> > +	drm_dev_unregister(&priv->drm);
> > +	drm_kunit_helper_free_device(test, priv->drm.dev);
> > +
> > +	ret = wait_event_interruptible_timeout(priv->action_wq, priv->action_done,
> > +					       msecs_to_jiffies(TEST_TIMEOUT_MS));
> > +	KUNIT_EXPECT_EQ(test, ret, 0);

KUNIT_EXPECT_EQ_MSG(test, ret, 0, "Unexpected release action call during cleanup");

Or a comment on top? Kerneldoc? Not sure what the recommendation is, as
most (all?) tests in DRM don't have a description.

> 
> This tests that we have reached the timeout, thus the action never ran.

That's the intent, yes.

> It's not clear to me what your intent is here.
> 
> This test is:
> 
>   - Registering an action
>   - Registering the DRM device
>   - Calling drmm_release_action on the previously registered action
>   - Checking that the action has been run
>   - Clearing the flag saying the action has been run
>   - Unregistering the DRM device
>   - Freeing the DRM device
>   - Waiting for the action to run, but expecting it to never do?
> 
> I guess something like
> 
> static void drm_test_managed_release_action(struct kunit *test)
> {
> 	struct managed_test_priv *priv = test->priv;
> 	int ret;
> 
> 	ret = drmm_add_action_or_reset(&priv->drm, drm_action, priv);
> 	KUNIT_ASSERT_EQ(test, ret, 0);
> 
> 	KUNIT_ASSERT_FALSE(test, priv->action_done);
> 
> 	drmm_release_action(&priv->drm, drm_action, priv);
> 	ret = wait_event_interruptible_timeout(priv->action_wq, priv->action_done,
> 					       msecs_to_jiffies(TEST_TIMEOUT_MS));
> 	KUNIT_EXPECT_GT(test, ret, 0);
> 	KUNIT_EXPECT_TRUE(test, priv->action_done);
> }
> 
> would be enough?

It would only check that the action is called immediately, but not that
it was removed from the managed resources list. And we don't need to
wait for that - it should be called immediately.

We do need to wait when we expect it to be called (or not to be called -
in which case we expect a timeout) as part of device cleanup, otherwise
we would get a false positive when delayed release
(CONFIG_DEBUG_KOBJECT_RELEASE) is used.
I assumed that this was the intention behind introducing waitqueue in
drm_test_managed_run_action, is my understanding correct?

And BTW, now that I'm thinking about resource lifetimes. We can't really
tie priv lifetime with the device. It introduces use-after-free in both
tests, when checking if the action was called after
drm_kunit_helper_free_device() has a chance to invoke device cleanup.
Priv should be gone at that point, so I think we should go back to test
init from v1. Do you agree?

> 
> > +}
> > +
> >  static int drm_managed_test_init(struct kunit *test)
> >  {
> >  	struct managed_test_priv *priv;
> > @@ -65,6 +88,7 @@ static int drm_managed_test_init(struct kunit *test)
> >  
> >  static struct kunit_case drm_managed_tests[] = {
> >  	KUNIT_CASE(drm_test_managed_run_action),
> > +	KUNIT_CASE(drm_test_managed_release_action),
> 
> Also, tests should be organized by alphabetical order

Sure, I'll reorder it. I wasn't aware of that recommendation, as most of
the tests in DRM don't follow it.

Thanks,
-Michał

> 
> Maxime


