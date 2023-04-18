Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F07E06E6754
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 16:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7C1B10E66B;
	Tue, 18 Apr 2023 14:43:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE3D10E24A;
 Tue, 18 Apr 2023 14:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681828997; x=1713364997;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NgXMJ12J5lg4KTLwqbKOueW61GbT7R7D9hijwmF0e6M=;
 b=Ivq+vqzwqlWzoJy7XlgU3gVSHnjn/yq0VUleHxIsyAvABQj8pccs9U7a
 ZDMnupCTZtuZXnDsASnaSjj9QtouxI70wZK1YZfkz/tEZLl0A6XtF5+Oh
 mw3DQReA7T+GIhxn3da5NBFdYhpBdgx2JPadenyAT7XipPJ95v8UGi7Ar
 BnDjbPs0K3+LKpM/1Nd9IYNRNT9J0aECqSIsxuiGiUuCl7bbNZkwfLDni
 ftjmOgBW2S7ftqSBPyhav1P9Z3d0vqfTVKvd2b85imp1IErSJzViSRRmg
 bhmR9Xp38UGCa+5XK349FNI8oWOz40h/w7l0uiMMztvJZ4um96kqTVdUJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="325526320"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="325526320"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 07:43:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="802560098"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="802560098"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 18 Apr 2023 07:43:16 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 18 Apr 2023 07:43:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 18 Apr 2023 07:43:15 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 18 Apr 2023 07:43:15 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 18 Apr 2023 07:43:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fthe/0zwDsXtIfyLzVuFK42Qmjd8+KFCZdP1yOxSMvHyidp+LFqSAjvpv3g07wB86wfXvIjN+i++ddXBP5V7aNqUnDpfm6xodLxD2CeFJ0pRebQEghlODIw3gjIkg2pTIcV73DjwvSwMcx4WiY4UKmH7ZSKFEkBl1F3rPS9sE8uXJ40Luvm48ftGW1zswIgpJ5ljghQrgpeQVVtnzJbnVE5KWwzTQ2svd0nxv7av9TrqUovcOatu3ZvHMW0106XGk5smmvuka5Ev/PHvDjeKNWgm3y6V91AN5amh2rssfp0BhfuXTa7D9ddIMgO3YUEDtj1KEp3j3SGo7kGtUM7VEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=alUiyLrBOEDbQkEG9uUtwOqnP5dKodgoyg9ZNIUUAWY=;
 b=c85Rt2FsaN4AWvNjnKyLAR7sfdZnCsWvTuheWJ1zqI40VmBGepQ5XI/9N11m2fE6XS5ngRF/wWGk8WJP4f3XO1BeyOCZj1Ioyc4NBBryh36pVYtV9Wi8o00UTZwxCWqoUwFAEaXjzAPP/hi1LHpvWuqGPQfYZeg2PEx2MtdRJGoBhGkSpNcH6D4rb0pifT6rua8pSIW62Y6NBFXk8NuGMltRm82JVkZgYGpfQZ54IAo/d/1shidWyJuCSCuQA/5g9FvX87gStUby/UdmGOQWMf+2AXusRyHZjnFclAKBdfriEyD6gkhx6u2sVzvRAqc01BvkLmVYgUDrf3YJq3Gsvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB5031.namprd11.prod.outlook.com (2603:10b6:510:33::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 14:43:12 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%5]) with mapi id 15.20.6298.030; Tue, 18 Apr 2023
 14:43:12 +0000
Date: Tue, 18 Apr 2023 10:43:07 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH] drm/doc/rfc: Introduce the merge plan for the Xe driver.
Message-ID: <ZD6se3I6uda3llNv@intel.com>
References: <CAKMK7uGSByfvxHnY3omh7S_XV2RShnG9nBan4374Kv90bVN5sQ@mail.gmail.com>
 <20230418133133.80434-1-rodrigo.vivi@intel.com>
 <168182829003.58211.15709571878495267363@gjsousa-mobl2>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <168182829003.58211.15709571878495267363@gjsousa-mobl2>
X-ClientProxiedBy: SJ0PR13CA0188.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::13) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB5031:EE_
X-MS-Office365-Filtering-Correlation-Id: cdb9dbfd-b264-4501-7a63-08db401b3c49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v68iVehcgq7GTgSXwsultt6XzqMp8glEJlc7z2DN1gmgFiRMDcmx//s226jC0jj7nJMW6jQaoMPDxex/fgc8FNXzVVx+jD7Wt4N3nxiXK9Ql1CngqdnS4vJw2G0YLecaBTwbTZO0SEd/kZVgkvBNLSY8TTEDiTuSmvN+cyXp3VW//CRu7/M+StgZyQLZHJOai2jglok8fA9p5NYJ5DZtPUAd0xkGO3O74mIwktnWObJjKaqXrEHYHGGesTey5lwZLsONUq57bryCm5O525eLp5Wne8yZsWDzjw2fZFh63pcgT0YoXX6Q0uABJLeaHrgKC2YsojbXrRW3SgYGREUA8cB2c7dhSnNq6jXv9dmkQ5P7zkM92Wo03lyRbPgPQUEN65jaOBtun0Nzm1V7W+Z1d42jQOzn/7bovlY3pT0hg3c2BJMrwAFevVs6oarKnwj/+825kaO3rum4qLF6YIFzIYenhAY/7zi8IANAX2aO6x700VrlRKbY2JofApMv5aByxmVouMlhXjc5Eej/yte11Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(366004)(376002)(39860400002)(396003)(451199021)(66899021)(36756003)(38100700002)(8936002)(6862004)(8676002)(44832011)(5660300002)(2906002)(30864003)(86362001)(478600001)(6486002)(6666004)(54906003)(6636002)(37006003)(186003)(2616005)(966005)(6512007)(66946007)(6506007)(66476007)(66574015)(26005)(41300700001)(82960400001)(316002)(83380400001)(4326008)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGNGMjZQQ3RXWnVOcHhUVHZlRVYyTVBaWWdEMUtiTitwZ3d2dkEvV1A3b2dh?=
 =?utf-8?B?S0Z6MWNQNWR4VXJ3NXpidXFXOEprakZidFZjcEZDU3g0Q3c5ekNMSXViL2Rz?=
 =?utf-8?B?UG1lK1plbkZlUXNsL1BJM3p3T0xWTk1SVUVRODhLeXNBY1BRbmtUOHlKckda?=
 =?utf-8?B?S25RalIwc29xTkdkVG5jOUx0VkxKcm9PLzc0aW5rNXlUZnQwbUpMVHF4M3BV?=
 =?utf-8?B?VjFVMnh3eGVKck16K0FhcE5HZjNLL0g4WG15MzRBb2QyaEJjalFBVFRtdmIz?=
 =?utf-8?B?YUZERUFHSkpiNmcrcWs2MjJEdkRsM01ZeS84WGEvUnhFbFhFbThZMllHUnAx?=
 =?utf-8?B?bjc5VjVUZjcxYjcwMjlJNEJ4ZHVENGxiZnlucHE3WXk2SDcyNDRUeTVPQTFG?=
 =?utf-8?B?dkw2djkvU291VEpiNUFhYm1IUVFPT2N3TlBhek43aWVvQUhSc1BNU3NXbFhZ?=
 =?utf-8?B?TURWZlNKOU43N213cjRXYjFVYnVneGh0UGp5d016SGFYVDNmUUZESGxHVU9o?=
 =?utf-8?B?RmZ6Q3VKdHY3UU5RWldYM1BnTkxHOTRVckQvRmdwWFl6cFRtTU5VZkZVVkJF?=
 =?utf-8?B?M1JiVjAydmcwMTNpaVdLOU82RVdWcUJpNlNCd21NL2xmRTFPd0RkVHdYK0hw?=
 =?utf-8?B?czlxcUViaGN0b0N3cW1CV0VkVE4zRm5vckVkZTM4b2dDKzJ4ZGhWeDVZZko1?=
 =?utf-8?B?b2NTcnNycTJpc085b1YyMXQ4NnE0L254d2Z3S0R6UnhGTGlrMnBVRHg1clN2?=
 =?utf-8?B?TXJLeFRheGJxRTFpRlZqR0pQd2I1QlV3a2h1MUU0RFJOenk4dlFldVRCZjFh?=
 =?utf-8?B?YTA4NXdTdlo0N3hIUFVNc2V5QkdPTUJOQ1hTTU5pdjY0Mi9YTC81aVozczZ0?=
 =?utf-8?B?aEpoYmEya0RMRS9JcEE2Si9Nd2FudElqVXI1Ylh6OHVjKzk5c2F4V2RiOVZT?=
 =?utf-8?B?Q3g1Vk5LVm5VVkpBQUNoMFYyanJYdit6UHF1eTJ4RE45OW5vamxVaStjNkVL?=
 =?utf-8?B?UnNtVUx5OFVoYmp1dEFHN04vbTl2Rk50MkRBWkRQMEQyK1NkdnJJL2V6djZn?=
 =?utf-8?B?K20yVGFWZFhSQXVKSE81OVBiMHZWZnVpWU1jcXpEbXRtVVpKY2pRMlhDMXg5?=
 =?utf-8?B?TXhmQUd3ckNRR3YwRTFWMU5YZzhNQnhoQ003UmJuYlc5MmVsTVJKcGlkczM2?=
 =?utf-8?B?dzdEYXhmay9yN0t5dzBvS3kwR2FQbExHaXl0YVNmQVRCR281ZVJReUozWW1v?=
 =?utf-8?B?RmVDTitseEtaVWF2NEFLMmhsRmZtdTVoRFBEMHlOOUhxUzA0dEV5YUNwTXNt?=
 =?utf-8?B?UTA5R0JzSmVhOEFucTVQMHF0UEFnWFh2RmZmcjJTVmI2b1R5UDc2NXhxT01s?=
 =?utf-8?B?VFVING55SWVoYkxseGNpRDVrV1I2cmd0bHljdnI3RG1YNmk1TStTOWllR3o3?=
 =?utf-8?B?OWM5b1gyVmRJQld1N0VmNm9Ua0JzU1VOZXNCZjlQZDI3SkdnNjdaaktLSEFE?=
 =?utf-8?B?MEQ2MG5rNlZ6aFM3dVdjL09yRTVBTTl2eDlqZWN2SFRDaVZsOTBiUDk3aEpB?=
 =?utf-8?B?NXU5TnRaSWNzUTJWYTFHYmpjN0l4dGhFWEQ3Y1BJdisyb1g3UG4wdUNVb0xw?=
 =?utf-8?B?S255VmtsQmtWLy9KK1J5OXBveWhmT01wUy8zM0hJM1FUc2JkYkd0YS95amJX?=
 =?utf-8?B?aWJwRXFPSS9RL2xYMGZKak5aMDVLSTkxWlhwQjhUc0VVUkFDTll1bjJ4bks1?=
 =?utf-8?B?aVZxQW42VWp0eDE2MTRMenVyYWFDNWNOTnpHdVE2OTlIOE84QmNqQmU0S1Fs?=
 =?utf-8?B?RHRIbllHUm56NFJNVGQxYUFmSnBqSXBXZlE2YVhNUWpKQ3FKRzY4OTdDb0pT?=
 =?utf-8?B?cmozYktlRjNWTkpKZmZiQkZ1eG9HbTRUODlxSjZzVU9rbjhwRFlSYytsTnlp?=
 =?utf-8?B?WHkyVlYrdi9sK0d2c2tVWEdyejQ2MU9FV0taZzVVVnVVeVAvZ3o5bHRIR2l5?=
 =?utf-8?B?V1ZLSDQzMWMzUDVuY2VXWE9NMWlBSkdIRUdJQ2JMZlZpaVlEVW9FWWNvM0tO?=
 =?utf-8?B?bVloOTdjeHFMNjVtZ3dxYjJIdVNTbUc2dkpOSGxVeWtodFRINU1Ld0swSWpl?=
 =?utf-8?Q?6yh0NG1SqyJSW38EyhDjOZTnD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cdb9dbfd-b264-4501-7a63-08db401b3c49
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 14:43:12.6340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QhzPzQtX88jjZgGev49Yvzi/S/YUznDq16LhDQxHEYFyQbD9MxL9af2h+cC0Dtlp1gJr9IZVp2puPKXQ3xQaqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5031
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Oded Gabbay <ogabbay@kernel.org>,
 Francois Dugast <francois.dugast@intel.com>, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, intel-xe@lists.freedesktop.org,
 Luis Strano <luis.strano@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 18, 2023 at 11:31:30AM -0300, Gustavo Sousa wrote:
> Quoting Rodrigo Vivi (2023-04-18 10:31:33)
> > Let’s establish a merge plan for Xe, by writing down clear pre-merge goals, in
> > order to avoid unnecessary delays.
> > 
> > This initial document starts with a TODO list containing items with clear and
> > measurable key results. Xe’s initial pull request should only be sent to
> > dri-devel after all the items are clearly resolved.
> > 
> > Since many of them involve some level of a community consensus, in many cases,
> > the consensus will be reached in follow-up patches to this document with more
> > details of the API or helpers that will be developed or modified.
> > 
> > Besides of the items that are highlighted in this document, it is important
> > to highlight that Oded, has been volunteered to give the overall ack on Xe
> > driver as the way to confirm that it looks good for upstream.
> > 
> > v2: Incorporated Daniel's feedback:
> >     - Do not make long-running compute a blocker.
> >     - Add a mention to drm-exec that that ties to vm_bind and long-running
> >       compute jobs. Then I also added GPUVA since I recently noticed that this
> >       ties also to the work Matt is doing on that front.
> >     - Added the devcoredump section.
> >     - Add the mention to Oded being volunteered for the overall ack.
> > 
> > Cc: Dave Airlie <airlied@redhat.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Oded Gabbay <ogabbay@kernel.org>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > Signed-off-by: Luis Strano <luis.strano@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > ---
> >  Documentation/gpu/rfc/index.rst |   4 +
> >  Documentation/gpu/rfc/xe.rst    | 234 ++++++++++++++++++++++++++++++++
> >  2 files changed, 238 insertions(+)
> >  create mode 100644 Documentation/gpu/rfc/xe.rst
> > 
> > diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/index.rst
> > index 476719771eef..e4f7b005138d 100644
> > --- a/Documentation/gpu/rfc/index.rst
> > +++ b/Documentation/gpu/rfc/index.rst
> > @@ -31,3 +31,7 @@ host such documentation:
> >  .. toctree::
> >  
> >      i915_vm_bind.rst
> > +
> > +.. toctree::
> > +
> > +   xe.rst
> > diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
> > new file mode 100644
> > index 000000000000..9227a5370653
> > --- /dev/null
> > +++ b/Documentation/gpu/rfc/xe.rst
> > @@ -0,0 +1,234 @@
> > +==========================
> > +Xe – Merge Acceptance Plan
> > +==========================
> > +Xe is a new driver for Intel GPUs that supports both integrated and
> > +discrete platforms starting with Tiger Lake (first Intel Xe Architecture).
> > +
> > +This document aims to establish a merge plan for the Xe, by writing down clear
> > +pre-merge goals, in order to avoid unnecessary delays.
> > +
> > +Xe – Overview
> > +=============
> > +The main motivation of Xe is to have a fresh base to work from that is
> > +unencumbered by older platforms, whilst also taking the opportunity to
> > +rearchitect our driver to increase sharing across the drm subsystem, both
> > +leveraging and allowing us to contribute more towards other shared components
> > +like TTM and drm/scheduler.
> > +
> > +This is also an opportunity to start from the beginning with a clean uAPI that is
> > +extensible by design and already aligned with the modern userspace needs. For
> > +this reason, the memory model is solely based on GPU Virtual Address space
> > +bind/unbind (‘VM_BIND’) of GEM buffer objects (BOs) and execution only supporting
> > +explicit synchronization. With persistent mapping across the execution, the
> > +userspace does not need to provide a list of all required mappings during each
> > +submission.
> > +
> > +The new driver leverages a lot from i915. As for display, the intent is to share
> > +the display code with the i915 driver so that there is maximum reuse there.
> > +
> > +As for the power management area, the goal is to have a much-simplified support
> > +for the system suspend states (S-states), PCI device suspend states (D-states),
> > +GPU/Render suspend states (R-states) and frequency management. It should leverage
> > +as much as possible all the existent PCI-subsystem infrastructure (pm and
> > +runtime_pm) and underlying firmware components such PCODE and GuC for the power
> > +states and frequency decisions.
> > +
> > +Repository:
> > +
> > +https://gitlab.freedesktop.org/drm/xe/kernel (branch drm-xe-next)
> > +
> > +Xe – Platforms
> > +==============
> > +Currently, Xe is already functional and has experimental support for multiple
> > +platforms starting from Tiger Lake, with initial support in userspace implemented
> > +in Mesa (for Iris and Anv, our OpenGL and Vulkan drivers), as well as in NEO
> > +(for OpenCL and Level0).
> > +
> > +During a transition period, platforms will be supported by both Xe and i915.
> > +However, the force_probe mechanism existent in both drivers will allow only one
> > +official and by-default probe at a given time.
> > +
> > +For instance, in order to probe a DG2 which PCI ID is 0x5690 by Xe instead of
> > +i915, the following set of parameters need to be used:
> > +
> > +```
> > +i915.force_probe=!5690 xe.force_probe=5690
> > +```
> > +
> > +In both drivers, the ‘.require_force_probe’ protection forces the user to use the
> > +force_probe parameter while the driver is under development. This protection is
> > +only removed when the support for the platform and the uAPI are stable. Stability
> > +which needs to be demonstrated by CI results.
> > +
> > +In order to avoid user space regressions, i915 will continue to support all the
> > +current platforms that are already out of this protection. Xe support will be
> > +forever experimental and dependent on the usage of force_probe for these
> > +platforms.
> 
> The term "these platforms" seems to be refering to the ones mentioned in the
> previous sentence. Wouldn't that technically mean that Tiger Lake (which is
> already out of protection) is also included into "these"?
> 
> When we say at the beginning that "Xe is a new driver for Intel GPUs that
> supports both integrated and discrete platforms starting with Tiger Lake", I was
> under the impression that Tiger Lake would be the first "officially" (not
> experimental) supported platform.

Please notice that we are not promising any API compatibility with i915, so
we are free to create a clean API aligned with the modern needs.

Hence, if we removed the force_probe in i915, we cannot do the switch back to Xe
otherwise we would break Linus' main rule.

> 
> > +
> > +When the time comes for Xe, the protection will be lifted on Xe and kept in i915.
> > +
> > +Xe driver will be protected with both STAGING Kconfig and force_probe. Changes in
> > +the uAPI are expected while the driver is behind these protections. STAGING will
> > +be removed when the driver uAPI gets to a mature state where we can guarantee the
> > +‘no regression’ rule. Then force_probe will be lifted only for future platforms
> > +that will be productized with Xe driver, but not with i915.
> > +
> > +Xe – Pre-Merge Goals
> > +====================
> > +
> > +Drm_scheduler
> > +-------------
> > +Xe primarily uses Firmware based scheduling (GuC FW). However, it will use
> > +drm_scheduler as the scheduler ‘frontend’ for userspace submission in order to
> > +resolve syncobj and dma-buf implicit sync dependencies. However, drm_scheduler is
> > +not yet prepared to handle the 1-to-1 relationship between drm_gpu_scheduler and
> > +drm_sched_entity.
> > +
> > +Deeper changes to drm_scheduler should *not* be required to get Xe accepted, but
> > +some consensus needs to be reached between Xe and other community drivers that
> > +could also benefit from this work, for coupling FW based/assisted submission such
> > +as the ARM’s new Mali GPU driver, and others.
> > +
> > +As a key measurable result, the patch series introducing Xe itself shall not
> > +depend on any other patch touching drm_scheduler itself that was not yet merged
> > +through drm-misc. This, by itself, already includes the reach of an agreement for
> > +uniform 1 to 1 relationship implementation / usage across drivers.
> > +
> > +GPU VA
> > +------
> > +Two main goals of Xe are meeting together here:
> > +
> > +1) Have an uAPI that aligns with modern UMD needs.
> > +
> > +2) Early upstream engagement.
> > +
> > +RedHat engineers working on Nouveau proposed a new DRM feature to handle keeping
> > +track of GPU virtual address mappings. This is still not merged upstream, but
> > +this aligns very well with our goals and with our VM_BIND. The engagement with
> > +upstream and the port of Xe towards GPUVA is already ongoing.
> > +
> > +As a key measurable result, Xe needs to be aligned with the GPU VA and working in
> > +our tree. Missing Nouveau patches should *not* block Xe and any needed GPUVA
> > +related patch should be independent and present on dri-devel or acked by
> > +maintainers to go along with the first Xe pull request towards drm-next.
> > +
> > +DRM_VM_BIND
> > +-----------
> > +Nouveau, and Xe are all implementing ‘VM_BIND’ and new ‘Exec’ uAPIs in order to
> > +fulfill the needs of the modern uAPI. Xe merge should *not* be blocked on the
> > +development of a common new drm_infrastructure. However, the Xe team needs to
> > +engage with the community to explore the options of a common API.
> > +
> > +As a key measurable result, the DRM_VM_BIND needs to be documented in this file
> > +below, or this entire block deleted if the consensus is for independent drivers
> > +vm_bind ioctls.
> > +
> > +Although having a common DRM level IOCTL for VM_BIND is not a requirement to get
> > +Xe merged, it is mandatory to enforce the overall locking scheme for all major
> > +structs and list (so vm and vma). So, a consensus is needed, and possibly some
> > +common helpers. If helpers are needed, they should be also documented in this
> > +document.
> > +
> > +ASYNC VM_BIND
> > +-------------
> > +Although having a common DRM level IOCTL for VM_BIND is not a requirement to get
> > +Xe merged, it is mandatory to have a cross-driver consensus and understanding how
> > +to handle async VM_BIND and interactions with userspace memory fences. Ideally
> > +with helper support so people don't get it wrong in all possible ways.
> > +
> > +As a key measurable result, the benefits of ASYNC VM_BIND and a discussion of
> > +various flavors, error handling and a sample API should be documented here or in
> > +a separate document pointed to by this document.
> > +
> > +Userptr integration and vm_bind
> > +-------------------------------
> > +Different drivers implement different ways of dealing with execution of userptr.
> > +With multiple drivers currently introducing support to VM_BIND, the goal is to
> > +aim for a DRM consensus on what’s the best way to have that support. To some
> > +extent this is already getting addressed itself with the GPUVA where likely the
> > +userptr will be a GPUVA with a NULL GEM call VM bind directly on the userptr.
> > +However, there are more aspects around the rules for that and the usage of
> > +mmu_notifiers, locking and other aspects.
> > +
> > +This task here has the goal of introducing a documentation of the basic rules.
> > +
> > +The documentation *needs* to first live in this document (API session below) and
> > +then moved to another more specific document or at Xe level or at DRM level.
> > +
> > +Documentation should include:
> > +
> > + * The userptr part of the VM_BIND api.
> > +
> > + * Locking, including the page-faulting case.
> > +
> > + * O(1) complexity under VM_BIND.
> > +
> > +Some parts of userptr like mmu_notifiers should become GPUVA or DRM helpers when
> > +the second driver supporting VM_BIND+userptr appears. Details to be defined when
> > +the time comes.
> > +
> > +Long running compute: minimal data structure/scaffolding
> > +--------------------------------------------------------
> > +The generic scheduler code needs to include the handling of endless compute
> > +contexts, with the minimal scaffolding for preempt-ctx fences (probably on the
> > +drm_sched_entity) and making sure drm_scheduler can cope with the lack of job
> > +completion fence.
> > +
> > +The goal is to achieve a consensus ahead of Xe initial pull-request, ideally with
> > +this minimal drm/scheduler work, if needed, merged to drm-misc in a way that any
> > +drm driver, including Xe, could re-use and add their own individual needs on top
> > +in a next stage. However, this should not block the initial merge.
> > +
> > +This is a non-blocker item since the driver without the support for the long
> > +running compute enabled is not a showstopper.
> > +
> > +Display integration with i915
> > +-----------------------------
> > +In order to share the display code with the i915 driver so that there is maximum
> > +reuse, the i915/display/ code is built twice, once for i915.ko and then for
> > +xe.ko. Currently, the i915/display code in Xe tree is polluted with many 'ifdefs'
> > +depending on the build target. The goal is to refactor both Xe and i915/display
> > +code simultaneously in order to get a clean result before they land upstream, so
> > +that display can already be part of the initial pull request towards drm-next.
> > +
> > +However, display code should not gate the acceptance of Xe in upstream. Xe
> > +patches will be refactored in a way that display code can be removed, if needed,
> > +from the first pull request of Xe towards drm-next. The expectation is that when
> > +both drivers are part of the drm-tip, the introduction of cleaner patches will be
> > +easier and speed up.
> > +
> > +Drm_exec
> > +--------
> > +Helper to make dma_resv locking for a big number of buffers is getting removed in
> > +the drm_exec series proposed in https://patchwork.freedesktop.org/patch/524376/
> > +If that happens, Xe needs to change and incorporate the changes in the driver.
> > +The goal is to engage with the Community to understand if the best approach is to
> > +move that to the drivers that are using it or if we should keep the helpers in
> > +place waiting for Xe to get merged.
> > +
> > +This item ties into the GPUVA, VM_BIND, and even long-running compute support.
> > +
> > +As a key measurable result, we need to have a community consensus documented in
> > +this document and the Xe driver prepared for the changes, if necessary.
> > +
> > +Dev_coredump
> > +------------
> > +
> > +Xe needs to align with other drivers on the way that the error states are
> > +dumped, avoiding a Xe only error_state solution. The goal is to use devcoredump
> > +infrastructure to report error states, since it produces a standardized way
> > +by exposing a virtual and temporary /sys/class/devcoredump device.
> > +
> > +As the key measurable result, Xe driver needs to provide GPU snapshots captured
> > +at hang time through devcoredump, but without depending on any core modification
> > +of devcoredump infrastructure itself.
> > +
> > +Later, when we are in-tree, the goal is to collaborate with devcoredump
> > +infrastructure with overall possible improvements, like multiple file support
> > +for better organization of the dumps, snapshot support, dmesg extra print,
> > +and whatever may make sense and help the overall infrastructure.
> > +
> > +Xe – uAPI high level overview
> > +=============================
> > +
> > +...Warning: To be done in follow up patches after/when/where the main consensus in various items are individually reached.
> > -- 
> > 2.39.2
> >
