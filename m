Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCE760591D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 09:55:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10EC910E4BE;
	Thu, 20 Oct 2022 07:55:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4323410E133;
 Thu, 20 Oct 2022 07:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666252536; x=1697788536;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=BE/Qodisz9x//T0Cy4wFNy/JAPpYdu6Fv/md6vTsAVw=;
 b=OkcoGivkw2C16ZZuyWbzLKRy3MjD2G7jlWkdCiYcbF2y4UlwTihE5ZkV
 u//9TZRND59Qp1ugRYwDyEGjxNnVgGTi1RGu1XHT5PlgyoIOerIgIzdWF
 HpB5zRVqBR8iH2A+PX9ZGWskUwyIGLDxMXGYrd5A2IBfeFY9qqnP8sxUb
 Cei6SY+zM7FAJtAp1xavVtVLGGeqkPNKIM7dwHh8nQ2C2c/nGQs1rIRN9
 aHJfAvqj1nBFbS4ULW3ckqiK+VgSVJj0Zop5rUSyMl9N4ge44EzU2oQzx
 AvFUHiKUWdJV57XAzKfv/hxoIKyJ9HQtCNwtsoQCZH97O+BsNL5OlVSEm w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="307740358"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="307740358"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 00:55:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="874849324"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="874849324"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP; 20 Oct 2022 00:55:34 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 00:55:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 00:55:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 20 Oct 2022 00:55:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 20 Oct 2022 00:55:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eFONS77QcoRAfLYxDxp8o0Wi7V+BIHin4hfOhZ9gj/+Dh+HzugwvzmCyR479oz7PRLhGpSIywVkkRqW3NfP2aRsdC2TmcB8p79Fuf1TbIb7YH6jbWauaDgnP98x6rk5hbFRLdfu5hYCh3GlRf1qGjxln8z4r3tVFzZZEI66QGJ6K4wYWgcCtiFfdjCFzsz5Y5GpBQNBc5GMC4NvPVjfpla9JIMOP9ecg7ggMOI3fcvHzhsEfm9+FBLPFksjRXOJD5uKDXJMfnsasNYgXkilmbM9GmydulT5eBUTh3783/5RDm3CJt/HoJKByXpP8eS1ePm9Xipc74XxSiW8KBB3Khg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mEAlF50AplRfRx5dU/knZHtuhCSsPscjHqo8ulBq8ug=;
 b=luthvj/wOZYpuRYbFp9HJ1/XdxDVSFKXGFHCVEi9oBR3O/n0nAX4G95aSwtjab5ZjXMDEgYBoT+Js/ANBGWrjCK/Q+kQFvZ9fLALgvwhPVjXEnCTe3qGEqNO/UKZwZhLPtQUC8/rPq/Yvtq0xxz2FfDKwa6eGMbg0HQHytz986JVX5DP/FNQRlu01L9r6lo/HENIbABCDJI55sG5jtlPJnXwG8eHXcsu8OcX9zus3Kni349XneWYmynKa6Xfm1jQaJYwNugxKD118ZEemKDU2XUaE/bRdUGZrb+TuHfffwXi9awqxvLZqCRopF7x6twpcAZj9hw3iO50PP21yZjSpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM4PR11MB7303.namprd11.prod.outlook.com (2603:10b6:8:108::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.32; Thu, 20 Oct 2022 07:55:27 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f131:2364:3638:6505]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f131:2364:3638:6505%6]) with mapi id 15.20.5723.033; Thu, 20 Oct 2022
 07:55:26 +0000
Date: Thu, 20 Oct 2022 09:55:23 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v5 07/22] drm/client: Add some tests for
 drm_connector_pick_cmdline_mode()
Message-ID: <20221020075523.7wo6lcqwxes7x5e2@nostramo>
References: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
 <20220728-rpi-analog-tv-properties-v5-7-d841cc64fe4b@cerno.tech>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220728-rpi-analog-tv-properties-v5-7-d841cc64fe4b@cerno.tech>
X-ClientProxiedBy: FR3P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::6) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM4PR11MB7303:EE_
X-MS-Office365-Filtering-Correlation-Id: 979b0c22-7c40-49bc-aaaa-08dab27072fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iK3mHhyhnZ11OxGNISLjQK2yShUC39/FiEKFyQczT8Pctkt9ttuD/3pzSDrENos85E8r1lX/7BVc7AyDQWbBg1k09xFOCcBuHpYINLtFiNAEl6QT0V2tcukhw0lukoaUzm4Kl7E3M59e9FVkBS/20nwIZNzyH71XuLvL/Y+BpujOuuJg1iYMcxUbqU/ApTToFilCL8qCAbH6M3otvPJA2xExIXhKh1rJTaaGnwlAhXdIFemCleaY5xaNDlLTbURFXMpdgBNPGRruMeWqtJ6QT/78vZ60qBiK7WTIoyDtsT0IKP1W2m+RFw/2ICD+VrT1nDA9J/43bwHsMErkeA/PT+z5kf26GR4r1RQSSpx6upRtT+qflwEKKA744ft1FaQmyhF/BQMRKDsUKftX2NgjCJMjq+MWbMoXDNBUXSJnEZbyrPxHp+ghtNgFRD4R8n3ggckP1ilLgWXstap8Xnn/7UVzMiUEcKjLutbfCmHdZwhKqgdr/vxbeGl1Evbb0W9fzOLKeWzgpfyaUR+3PeRetWH0Mz0kqPwF3IRoV0n+4ZsYfmJLRQX5cbOppKZH6ftHLt4phmz2mZG85IZ/Giq8mXsxrlQ22shQTEBV2RqiBTZp4q+Iw8V3mtJ39Qjo3fZNVsCZAogvjgNJN+J3hsPae6NsqSVAaLRRnuchZTys9NBeP9BlphlBhoMF+5MsZAqSOBAMmYV6YQH8nBpgsfOQRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(136003)(366004)(39860400002)(376002)(346002)(396003)(451199015)(7416002)(4744005)(5660300002)(66476007)(4326008)(6916009)(54906003)(8676002)(66946007)(316002)(41300700001)(6486002)(478600001)(6666004)(33716001)(8936002)(6512007)(6506007)(9686003)(66556008)(2906002)(1076003)(38100700002)(82960400001)(186003)(86362001)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDVMV3FzVkV3M0h5ZWlpdXh6VkZ4ZkhpNkVabUVhWS9ySzZtVERaaTdqRlRn?=
 =?utf-8?B?NHQraVAwUjZsQzJXL0xtWmFFWG4wU2NMTXNpZEh1R2IzQzY4aEx5UGt6YTdi?=
 =?utf-8?B?bk53NjIxbHBLa29DUnI0TnlYbzVNdHgzVWxMa0dJejRhTCsva0pTZGoxMmZk?=
 =?utf-8?B?dGk4RUdUOHdDRVM5QXplOW5TS2kyRDI1VG80WjdUdzZsbncvdVd5Z1dZZ2Mx?=
 =?utf-8?B?M0toMFBMSGM3WXRPdTVaZWU2YWhSazhVeHU5bEJyY1VqWVZ4OUF0M2hmVHB2?=
 =?utf-8?B?dW1ZK0g0S2laa0V6VHJoRzg1SW5pVWRsS3h6SDFSQWg4OU83TlQ1b2lsdCtx?=
 =?utf-8?B?dE1VWWM2QkI3SUxLN2x4aUFqcGtMOHBtS3FHTVlrTWEzZlVaRzdnSEV5YzJS?=
 =?utf-8?B?QWNYdzVaejJLYkNTNkZQVi9SMEN0a2RocUFnYk5XV2wzbExMTkNnUmFrT0Ru?=
 =?utf-8?B?OXNhR2JzVDFGWWFOUjhyU1FQbkorTVpSczRFa0NvSnhISitmOW9jRE44V2x0?=
 =?utf-8?B?MDljWEluTXhmbExWblRkeVFkVnFPU2lrUTNneDdVR2ZnaGFscW5leTN6SmhM?=
 =?utf-8?B?UFE1bTZEcWQrWmpMaVhla1EzSjAvSlhqVlNQMGZ5c0Y2Ym5OVjJFL2FJaVY3?=
 =?utf-8?B?U3BEZ1AyMk1yMGRRY3MxcXEwVUZFYTczTFhJOFQ1TFg2SGdoOEVXRHZ3Z2Zv?=
 =?utf-8?B?M2NsRFRtUE1YQlR5Vjd2aXhqb21IQXlSc0hYNUdwQmZ3Wk9WWEVWaXJSelhz?=
 =?utf-8?B?dWpyeXYvYUt2dEcvcnRHVUVjWUdOSlhZQTNCQlpFeVdpL0dTRFRXZ004c0xI?=
 =?utf-8?B?NUZJekNyYnVzb3UwZDZ3Z29HTlNJdFVLZXdFQnBWU1djbGVYeTN3SkgvVHNl?=
 =?utf-8?B?b1lpak5yd1FDY1hLcTNXWE9uM0lKTFNDemRKSkZzSkNGWE9RV2N3NTFKYzJq?=
 =?utf-8?B?b2dpV004Wmd0MFVXUTdMWFJLYXpsaUtpWHhQanJQY1hLay8rYlBVK3E0WXZD?=
 =?utf-8?B?WWd1djVNa2EzQmVoSzlMRUZSRUhUYnRjbU9iY3dPNFV6NWd1T0xUT0wzbmRZ?=
 =?utf-8?B?aTBxZ0U4RzFET285cVpZY3lNY3VXWDc0MEw2ZTJwOVAvanI4aDhCWjEweXlo?=
 =?utf-8?B?WnFhMXFzREhJNG9RZnJVaDBqQ2lEdzhyOVBGZmV6eHgyR3pLTHJRNmlSSk1R?=
 =?utf-8?B?V1h4bE9LZ3hLSnlsc0FyYk45U042WWNWUWdDNm94Zm5VcWQzeVlNbk5wa3Rn?=
 =?utf-8?B?YXEwcVdmc2VRc2xJVU1Fb1JhZXZkVTRpUTNKNGd4Rm1yTHUwYzhtMUxLcktW?=
 =?utf-8?B?dW44YlVscFBxWHhHZmJwMUVWL2VCN050VEhORXIvR3dGM3J2YVYwak9PNFBj?=
 =?utf-8?B?NWlldkFTNWFpU1RxYjh6aURHY1JzSU1VRmpKam1GUWk0L0ZtbjdtcTBtNFNF?=
 =?utf-8?B?NWdINkNHaXdzVjhCcWxwc2R4dGtSdktJaTBhR0MyUzZRdTllS3c1SWtpM2w1?=
 =?utf-8?B?djZpalhRRndhY3JCM3B5NGJkZ25iWVNZUlhDYkdZTUJaNlQ1a0Y4elgwQ0Rj?=
 =?utf-8?B?bE1UN0szRDVpNGI4ZTRaa1FzcC84b3lmMzVoZ2h1THoySGRnR1diZU53eENq?=
 =?utf-8?B?YTRqM0MweWh2SHE1aFl0YWgyWXNRWFY5aUp1aFdNNDd1dmRseWIwNWpLeVM4?=
 =?utf-8?B?d3dxS1QxU2h3NWdrdlNhUlRwSndBVnY3aEhLZFZNdHFJTDBBRnhQUHBYSklN?=
 =?utf-8?B?MVU4ZFBpaFphcWo4U2RwdGowWlpXTTJ3Zzl6R3o2dUgzaGVCR3VNRjlFeHpx?=
 =?utf-8?B?YTZEQ1JUamoxK3BXMkMrTFR2MURvWGNFd29NenREWklldjlZa0VmdW1YaTRi?=
 =?utf-8?B?RkdtM2Q1T2kweVJyYjNsMDR3RVViMDB1TERVRTdGcnlHTUZBUnlCQndrM1d2?=
 =?utf-8?B?Y0VhYUhiZGRPVDFucCs2Sk56d1ZNMi90bis2RFc1a3ljYnlQSTIrWUVYamF3?=
 =?utf-8?B?U0p0WGhybFJYZ05HTUVnU1JLN3NnQ1VhNk9GTkdHaVVIc254cVdoMGtMSmY1?=
 =?utf-8?B?VUNaSEgySzFYZjhOS1ZuenJpOW5nK0dDZXB3d0pDOE4ySHpsYXVMSEtaVDdL?=
 =?utf-8?B?S0hleW9LdHFhcEpGUExhSWxrWml0SE12OEhHWGtDMDR4RkRNTGw1djZZbCtm?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 979b0c22-7c40-49bc-aaaa-08dab27072fd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 07:55:26.7747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oQ6HZ6v/qcStFukauMt3F16vljv/QjV3WhFoqB/oMIU1DAsbvePX9sXqM5U20TBP+Rf+VH/himn719q1vYlEkdMy2ZQdLIaeA6bitx52JDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7303
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Phil
 Elwell <phil@raspberrypi.com>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 13, 2022 at 03:18:51PM +0200, Maxime Ripard wrote:
> +static struct kunit_case drm_pick_cmdline_tests[] = {
> +	KUNIT_CASE(drm_pick_cmdline_res_1920_1080_60),
> +	{}
> +};

drm_test_pick_cmdline_res_1920_1080_60, since we adopted a consistent naming
convention for test cases in DRM.

-Michał

> +
> +static struct kunit_suite drm_pick_cmdline_test_suite = {
> +	.name = "drm_pick_cmdline",
> +	.init = drm_client_modeset_test_init,
> +	.test_cases = drm_pick_cmdline_tests
> +};
> +
> +kunit_test_suite(drm_pick_cmdline_test_suite);
> 
> -- 
> b4 0.11.0-dev-7da52
> 
