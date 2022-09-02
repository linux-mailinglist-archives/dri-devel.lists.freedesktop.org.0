Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A671E5AB1BB
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 15:38:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 029F410E841;
	Fri,  2 Sep 2022 13:38:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C51D610E841
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 13:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662125924; x=1693661924;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=AaVWDCxlBPJHCQvXzE1JyktxDdn9yMnPsaVzJo9zyEA=;
 b=bkRHtkraUktALiyPyRqPPXsp6WWine1kN7dUFhkQ3CkMpOpM+o7pinA2
 soE4cnnGZW92+s8Ah6IfwSPIC9j5Damn3Awi2dEcBDXmugfrsfdldkEDX
 iu9kxg/sCUG/IoPULUt/9mDPsYcgsXvtz88qckr77/y71iGtp86MpsvPE
 EAg9dkHGeajlOw4xG0Py9U4BdLh3WsGzJzrDnag7wQOmQUXdDlauD2/zP
 BLHNKGjJAVFgaviAG0eTCK3mex1i4OMQirG72FOY0B+T1rcvcDrom70wR
 PAoPsyHBOvQHiHZKqxVExJPgmQw1WTxfR2SgOn8qhQSTlm9tnkVw6ZTVs w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="296762725"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="296762725"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 06:38:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="788663892"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 02 Sep 2022 06:38:43 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 2 Sep 2022 06:38:42 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 2 Sep 2022 06:38:42 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 2 Sep 2022 06:38:42 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 2 Sep 2022 06:38:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IU4dDgmJz89r6wSKbAL3d5SszvH7r+AzatF5Q/dSPgFjVQJHOurM4hmE4q95h2qN1FLDaqrTwJgtXYu2kmjuTDldTBKluMAQDDDYNZFRyN6QU5UqCxWLvj+d68+PDbHRpNCDHbXaE1OCkF3WGf8wcB8IvYc1YCS7sr26AcoXo5e2iQ560i3Z7gj/rdAY6lOl/d7WXasvl65vy9HouQ/+mppvLr3zS9xN/nLFzrGXYPuyQArtq0D61hHzRqCN8b7McO7CuPk2jcD92XCTrbZ2CuJ8POx+QqSW8d8S45CSU+1pzTtE4o/+eQNEKJ7VMzpeGGqORMye0ZjoqMfHLKUdqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JOfKmFH12oy5Fnalgpji9xPkuVC+zTYGr1ETDcAnV9E=;
 b=BAoi/mU2Xs/yfcUeQjmG2PBAXmV+7f5vzww1R51jVitzEPgGpKNyY6kGscgui6Pvdu3oDvcNfIlG//vpscvHv4sF0xBqg+t3kHFESQ/L4NudPdsbvKY5Q3+U3mDZZXL01QpYQ7IDZPrvodZ0+pAX/oXwLj46ZWxLHPeKoDMuybOSJJPt9VY1A2YPP++O0gKWi63rtegOlyAhfTwymsBKSFeY61qkA6Mmbwd0U/FVIh40XLT5Q2XW7n4RksqYNL7ipaqJTcLt4tHhFTIsOb6MwQ9LjDUVsEmjyiQ6JMdh9HTepqbCZb5nUIs9zRLJWggrkQMT6hfbAkx/7c6kG4Ksnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CY8PR11MB7012.namprd11.prod.outlook.com (2603:10b6:930:54::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15; Fri, 2 Sep 2022 13:38:35 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e%9]) with mapi id 15.20.5588.015; Fri, 2 Sep 2022
 13:38:35 +0000
Date: Fri, 2 Sep 2022 15:38:28 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v2 2/2] drm/tests: Change "igt_" prefix to "test_drm_"
Message-ID: <20220902133828.ufwp6bgzd37yu6bv@nostramo.hardline.pl>
References: <20220901124210.591994-1-mairacanal@riseup.net>
 <20220901124210.591994-2-mairacanal@riseup.net>
 <20220901125530.b56s4zisnkfuigvc@houat>
 <04aeba53-793c-3196-3137-915f0640dc2a@riseup.net>
 <87h71qfbi9.fsf@intel.com> <20220902123400.5ljgc7z6zw34d64m@houat>
 <87mtbidj3b.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87mtbidj3b.fsf@intel.com>
X-ClientProxiedBy: FR0P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::20) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4d3812f-c259-40a7-7e6b-08da8ce86f53
X-MS-TrafficTypeDiagnostic: CY8PR11MB7012:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hLyz9uS7OGmi+cI/Hmahxi3f6p0vGdMxZsoiDwX4G2IaCcmaPQUxwmUYQbNuG9+DxfoeqSoWngNVAerV02oorEOMJ47sHEt43ypwUazSuwys9zhLPwHp31yOxii/fvASNLVtv+kG7teqp/m7lFHHHGygYb2CK2u9HGlJ4Yj4Maf2t+mW/cwX7ny0jF1Zq5KS0yXMb81dE/PLcsv5CmMzsLv+Q1Ij0GVbxFXV1hT62n98U+Esu9Yfen2uB5CgmpKnlPOGX6f5OsFnLhI6xLhReK9Ksa/y4gLiFQn1jR7fo2AQHJVcuOavYP4bjWGab3v95nt3VEVVI/vzVpZG8ElRORmvJXRe09lPLEtunSr1ykMygo5WetBXgdNkXAgFJVe+D3rALoVU9U9A+dJnUutFf4PE5ulOrKO7i4bmbPv4h4IASwGNgW5RKY6pBRXePtrir2JFDnifldAe1zMhXBO6OAlbKybmLwiXYshUvG9jx3fCi2y/dtzPbXhaILESjcirHCx9+jhO+5z2gZCWzua8WxYAWUYY6z69ScBA6waW00DZWiDSt1OUoB0ZyoZXCAUJD/i/AnzXMn3iOAchpvJRFQGa91Ao5OST5ZrChDMnHSd9s5rLFlEzI+YLrt2SfOy5MOvKrxtB/mYArneETH3BeGDwlIuVr8w9Ktpf5sXo/OaqXUUofqMmNhAkOI3Zd5CIYr0JSPETM+zK2a/DFT6dSt9UT6tZnn05cU4W0eMOvajgcYjWD1Bcpk606jTKv6DiLD8qwE4OJuLRPKOxa3XhKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(366004)(396003)(346002)(39860400002)(376002)(6506007)(6512007)(82960400001)(26005)(66574015)(2906002)(83380400001)(9686003)(6486002)(316002)(6916009)(54906003)(38100700002)(8936002)(8676002)(4326008)(66476007)(66556008)(41300700001)(66946007)(6666004)(53546011)(86362001)(5660300002)(186003)(7416002)(1076003)(478600001)(966005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q09nV0dTOUZJcDlaVU1sWkxPdG94M09pL1YwRmU1cU5vOEd1MDcyQ3ZZekVM?=
 =?utf-8?B?V1NRT0RCeXFyckN3emRQVXBvakJzdkJid29nYnI2TU5yR01kWE9lZ2VhaDFR?=
 =?utf-8?B?NHNNM0FMTVo2REV1NmFzOU9SRkJpMUZEVGdMS0hPRUpTTVpoSEJNVjNvWGRQ?=
 =?utf-8?B?clVHMXYzT3ZLSS81RnhNZXFRWjlDTU5mc1JNY0pHSFNkejVkWEJ3VExqRkxE?=
 =?utf-8?B?eGFtZ1hqMFNlOXl4SlFyc1NGZlNIZG53VUpKMzlxVlc0eXZORkhGemE5dmg0?=
 =?utf-8?B?TmtSVFA2STJoQzFNeUFmT3B5NHRzM1IvRnR3dG11NG5CamcyWWlwMzdJUzMx?=
 =?utf-8?B?SVdqRVNJOHAyN285cXh1Y3ZPRVFqeUdvN1dsYWRCb3hmRU1IYXQydUZaVyt4?=
 =?utf-8?B?RHJYWHh5akpDWVA1bDJ0K3JQN0Rtb3RoZzVObUZVeGEwK0xjWVJVV29CK05o?=
 =?utf-8?B?WW1jRlp1N04rREcrU2NrYVdPYVBUSTFwdnNtRWk0ZDNGdUJoWjNhZGp3Nm9o?=
 =?utf-8?B?Q1FBeWc3eFRTNFRxT2NlVFVTa0dNRmtzVGxuc2NrSVdNUlRkYVVldXJEWi9n?=
 =?utf-8?B?N1F4ZlF2bDhVSTNXb3BFTml5MkpQaHAwR21pMU9xVitrRjc1WDQwam4vRUJ1?=
 =?utf-8?B?RjluREtPQ0t3Ukl0NzV0Z1R1ZnNFUGJ3MzRzOVFYL2xpN1ZCMUdOTjhzK0Rq?=
 =?utf-8?B?U014ekxxMi9lbTlZTlBlb3puYkUxa0ZGaXdob1Bwa2pyNm43NW01YkNtd3dB?=
 =?utf-8?B?OTE3UHVKY1lXNm1zSnluWmNKODBjVEY4S2pqYUpHK3VqSGN5b1NkVTh4NnNt?=
 =?utf-8?B?U00yaDBsNElYekplTzgwV2U5VjlsWjk1VTd0QVhEeG1DeFlFSkhZTmYrSzdW?=
 =?utf-8?B?UUt5YW93RVVBY2FnOUZTQ1FGQU9ZYSs3WFdlV3lMcEZhTm52M2RQU2JpOEo1?=
 =?utf-8?B?OEhKVVBaNlNMSXJ1UHkwZkRtS1hxWXBmd0F5OUhnd1FQc1kwZ2NjRjlXRXpQ?=
 =?utf-8?B?Zkg2SHZHNmNGdyt3Y0ZMWUtXR0l4V3NvaHBQK1FacjI5MlR3SmNLTjhOZGwx?=
 =?utf-8?B?TmJyTHllcGdLNE0vMnd5Q25KeWVmMDdyb0ZzTEZYQVZMaytyNGw5VFpWbnhu?=
 =?utf-8?B?bTM0eUtKMkpwYkpwRkQ2MGdCTGZ0V1VUeGpRcytoaFQxaTNWamdXMUpUakdi?=
 =?utf-8?B?U2ZNTWJtbUFyb2ZSL0h0a2lyMnhDTjltS3BRV2ZwMjQ3VmdFb0pNY0ZzQVYw?=
 =?utf-8?B?YkpYZm9nN1pKbXB5SWZQNnhCMFMxR291T2xZa0VVSld4K3dJUlhsbWZadmsw?=
 =?utf-8?B?WWZ1cWxDM3F5c01iL1N6d0xFNFR6Y3dQN3QvU1NIRk1VaFV4QmVtalZEUWtP?=
 =?utf-8?B?T095aGNzamRZQnNKL1BCQjBKMlBmTkhMeWdGVllxUVJGRjJONjBtNmlYVW5j?=
 =?utf-8?B?SVA3ZHFkS25ORTgrWmIwaHMzOFhacEtHcW5pcEdzZjMzY2I1RjliTkZGMlRF?=
 =?utf-8?B?YmJ0K2FmMnJ3Nk84d21vQzJ4VFV0YzF2SlJtV1hJbWV0dWdZVkEzcURKM3dF?=
 =?utf-8?B?U0JuQkpaLzFVREFuT3c5VG5Xbm5WMFdFWGpjYm5jVTdOQ3Z3WjNkOStzYWc5?=
 =?utf-8?B?cDMvOWJGUU9lcEJkSitaNm9KNEI0Q3d3bFJ5ZDlYSytpUk5NcXhmVi9ZajlN?=
 =?utf-8?B?RGVBOXl3SWtsK0pVSVdwSkEzNE5mM3JGL3orbEh6cHZmUmtjKzRRSHdvTDdB?=
 =?utf-8?B?Q3Y3ZG1ITlUzTklXcUlkSnFmeFNPbFJOK3JXSllSTGFvVElxcUlBMU9NOWNx?=
 =?utf-8?B?U1A2cUYxYkdWcGxHMVh0MkhSZldCTlRGN3BhMWtZN1JsUjlqTjl1VWJvRXpv?=
 =?utf-8?B?Ri9yS3JsVEFJa3RZekxpclRmSjIranJRV3hodmN2Nlc4Z1pNS3JmN0tpdlJT?=
 =?utf-8?B?K1dpc3hCbm9tb0F4Ym5FcmhsU0RIZHNWSGs2WHB6OTEybE9IandJeVhtVW5o?=
 =?utf-8?B?TE84VWJoWVpEbjNCRFFLZnU4dTBJSUNXekxDbVFpNDJ2SnA2MDdSeU54QzRR?=
 =?utf-8?B?TzB3UW1XeUFjM200WHdWZ3h2R3ZGWXcya3grNnlDc0xuNUQvV2VEMFNJYmpF?=
 =?utf-8?B?Nno1L2wwYXEwU2krVVhKV1VYTFJHbkgwYjNKbk52aW1RRTZRSmF4dklLTFFF?=
 =?utf-8?B?OUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4d3812f-c259-40a7-7e6b-08da8ce86f53
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 13:38:35.5952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aJg5iCgqraHmjAlQKBXR14bbUsPTAuTtyfRYHDCVtwnt6qD6VDqPSCqhio6NJC5TPNP6DLatd5vZpENROWwe3Y9bmMggY1UCv6BrACLWwKw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7012
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
Cc: David Gow <davidgow@google.com>, siqueirajordao@riseup.net,
 magalilemes00@gmail.com, David Airlie <airlied@linux.ie>,
 tales.aparecida@gmail.com, Arthur Grillo <arthur.grillo@usp.br>,
 brendanhiggins@google.com, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, mwen@igalia.com,
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>,
 Maxime Ripard <maxime@cerno.tech>, kunit-dev@googlegroups.com,
 =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 02, 2022 at 04:03:20PM +0300, Jani Nikula wrote:
> On Fri, 02 Sep 2022, Maxime Ripard <maxime@cerno.tech> wrote:
> > On Fri, Sep 02, 2022 at 11:04:14AM +0300, Jani Nikula wrote:
> >> On Thu, 01 Sep 2022, Maíra Canal <mairacanal@riseup.net> wrote:
> >> > Hi Maxime,
> >> >
> >> > On 9/1/22 09:55, Maxime Ripard wrote:
> >> >> Hi,
> >> >> 
> >> >> On Thu, Sep 01, 2022 at 09:42:10AM -0300, Maíra Canal wrote:
> >> >>> With the introduction of KUnit, IGT is no longer the only option to run
> >> >>> the DRM unit tests, as the tests can be run through kunit-tool or on
> >> >>> real hardware with CONFIG_KUNIT.
> >> >>>
> >> >>> Therefore, remove the "igt_" prefix from the tests and replace it with
> >> >>> the "test_drm_" prefix, making the tests' names independent from the tool
> >> >>> used.
> >> >>>
> >> >>> Signed-off-by: Maíra Canal <mairacanal@riseup.net>
> >> >>>
> >> >>> ---
> >> >>> v1 -> v2: https://lore.kernel.org/dri-devel/20220830211603.191734-1-mairacanal@riseup.net/
> >> >>> - Change "drm_" prefix to "test_drm_", as "drm_" can be a bit confusing (Jani Nikula).
> >> >> 
> >> >> I appreciate it's a bit of a bikeshed but I disagree with this. The
> >> >> majority of the kunit tests already out there start with the framework
> >> >> name, including *all* the examples in the kunit doc. Plus, it's fairly
> >> >> obvious that it's a test, kunit is only about running tests in the first
> >> >> place.
> >> >
> >> > Would it be better to keep it as "drm_"?
> >> 
> >> That's not "keeping". That's renaming igt to drm.
> >
> > Well, there's like half the tests that are prefixed with drm, the other
> > with igt, so it's both really
> >
> >> > Currently, I don't think it is appropriate to hold the "igt_" prefix, as
> >> > the tests are not IGT exclusive, but I don't have a strong opinion on
> >> > using the "drm_" or the "test_drm" prefixes.
> >> 
> >> I repeat my stance that "drm_" alone is confusing.
> >
> > What are you confusing it with?
> >
> >> For the reason alone that it pollutes the code tagging tools, mixing
> >> actual drm_ types and functions with unit test functions.
> >
> > I don't get it, I'm sorry. All these functions are static and not part
> > of any API, so I can't see how it would pollute a code tagging tool. Or
> > at least, not more than any driver does.
> >
> > And we're part of a larger project here, it's about consistency with the
> > rest of the ecosystem.
> 
> Okay, so I'm just going to explain what I mean, but say "whatever" right
> after and move on.
> 
> For example, drm_buddy_test.c includes drm_buddy.h so with the igt_ ->
> drm_ rename none of the test functions may clash with the drm_buddy_
> prefixed existing functions. Ditto for all tests similarly.
> 
> For example drm_buddy_alloc_range() as a name sounds like something that
> allocs a range, not something that tests range allocation. On the other
> hand, you have drm_buddy_alloc_blocks() which is actually a real
> drm_buddy function, not a test. What would you call a test that tests
> that? Here, we end up with names that are all prefixed drm_buddy and you
> won't know what's the actual function and what's the test unless you
> look it up.
> 
> I use code tagging that I can use for finding and completing
> e.g. functions. Currently I have the following completions, for
> igt_buddy_ and drm_buddy_, respectively:
> 
> Possible completions are:
> igt_buddy_alloc_limit 	igt_buddy_alloc_optimistic 	igt_buddy_alloc_pathological
> igt_buddy_alloc_pessimistic 	igt_buddy_alloc_range 	igt_buddy_alloc_smoke
> 
> Possible completions are:
> drm_buddy_alloc_blocks 	drm_buddy_block 	drm_buddy_block_is_allocated 	drm_buddy_block_is_free
> drm_buddy_block_is_split 	drm_buddy_block_offset 	drm_buddy_block_order 	drm_buddy_block_print
> drm_buddy_block_size 	drm_buddy_block_state 	drm_buddy_block_trim 	drm_buddy_fini
> drm_buddy_free_block 	drm_buddy_free_list 	drm_buddy_init 	drm_buddy_init_test
> drm_buddy_module_exit 	drm_buddy_module_init 	drm_buddy_print
> 
> With the patch at hand, they'll all be lumped under drm_buddy_
> completions, and some of them will be actual drm buddy functions and
> some not.
> 
> I just find it a very odd convention to name the tests in a way that's
> indistinguishable from the real things. Even *within* drm_buddy_test.c
> where you read the test code. Because currently you do have calls to
> igt_buddy_ prefixed functions from other igt_buddy_ prefixed functions,
> along with the drm_buddy_ prefixed calls. I think it's just going to be
> a mess.
> 
> /rant
> 
> Whatever. Moving on.

KUnit docs [1] state:
https://docs.kernel.org/dev-tools/kunit/style.html#test-cases
"As tests are themselves functions, their names cannot conflict with other
C identifiers in the kernel. This may require some creative naming."
And give examples of names. But this should be local to individual test suite -
as long as the test is readable, and the name describes what it is testing, we
should be fine. We don't even need to pass drm_* prefix, as this convention is
expected for test suites, not test cases [2].

Having said that - I do believe that igt_* prefix don't belong here (which is
why I'm progressively trying to get rid of in the patches that refactor some of
the tests).
I agree with Jani - can we take it on a case-by-case basis?
If the test name is too similar to the function that it is testing, we could go
with one of the following (taking igt_buddy_alloc_limit as example):
drm_buddy_test_alloc_limit
test_drm_buddy_alloc_limit
buddy_test_alloc_limit
test_buddy_alloc_limit

And either of those is fine in my opinion (I'd personally go with
test_buddy_alloc_limit in this case).
We don't really need a DRM-wide (or worse, kernel wide) convention for test case
names (it's only really needed for test suites).

[1] https://docs.kernel.org/dev-tools/kunit/style.html#test-cases
[2] https://docs.kernel.org/dev-tools/kunit/style.html#suites

-Michał

> 
> 
> BR,
> Jani.
> 
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center
