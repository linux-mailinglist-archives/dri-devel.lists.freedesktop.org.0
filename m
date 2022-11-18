Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A4D62FF73
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 22:40:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8319A10E7DB;
	Fri, 18 Nov 2022 21:40:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A0210E246;
 Fri, 18 Nov 2022 21:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668807648; x=1700343648;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=umf0vUiaCZaiMVicyBvaIInu9GLluFtYPlCW9mYBFd8=;
 b=XbTPo5G+71JNWzy7g+X3Ob/H6ZMEAT2RpunmRf1ZtZpiCCsTscPk71Js
 GNYHEFPVhk7M7K9aMQjr8aIN/N9XJW8W3NDskZ/AlLB+okUBkexcvy3Jd
 tGu44PuMEZ4Nly9pAhkaspKzA4e6DU/bJDXntOcrGiF+wXONy73pwIagK
 87FvLuaTmxieJjjogJly2O/RoV8iDQu7EpNkxL0lOI1NxKkxwS2QUuSku
 bZSGZUeF+cfsfgBLcBQa2iTNHnPG5EOiUwWguwL1TJ4XLwP91jOCHselo
 0Fw2eoRrnyTa72qF/1mGWuHT7egCInxoS+7AjtVfZseysd0V7wk2thQdi w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10535"; a="377506775"
X-IronPort-AV: E=Sophos;i="5.96,175,1665471600"; d="scan'208";a="377506775"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2022 13:40:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10535"; a="618156910"
X-IronPort-AV: E=Sophos;i="5.96,175,1665471600"; d="scan'208";a="618156910"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 18 Nov 2022 13:40:47 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 18 Nov 2022 13:40:46 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 18 Nov 2022 13:40:46 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 18 Nov 2022 13:40:46 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 18 Nov 2022 13:40:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XgDEA6yAFih7PaHKZHqZLD/QISENK8HjUvVJBEvEQmEsQ1H4nx5A1eKj12+IsVwRV43+n+kxyhhRsVKTtqI9LUvcYKYUafKwYKwDP/73qI7g8e2MvsDEkXjxWAGB8CqKfZ+NcJEk1L+dYRsOTsmPyjbI8IgcX4N1DZk879shmQjfm6vNpHdA1q2vgDa3wlnokPZ8b7PYmOZqFO0pqTkQjwjZDfigauUkkYneuH5XlL0WyO6EgvABh6za+zFMPjKdtmENhp2GsTmPsGUqnmTTPtrGwiRP+Y/6T1Ka3Y9zlXs32sTExPWZKHrOvluEG6YPHpvLHRCCdJ7RYkkGwL+BFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tt1KD3t+HHTbzncmVKInK0CWxJvlA/dQkJOeB73+UbE=;
 b=N472WznMtIef0lRUy9+TxGflDfXBGx65bYJKo8azbZTl7Owbn8kTmkM5VIrGLPL+s3ztLxuIjK5dSjv9T9IKMGiLfjc8qSVW24LvHS/RlI776Y5WpIindgtBO2O4cYULfs8ly9ogUizA+a4/tlg/E7YMfA58sJT2pcmQRY9Yu2yu/s0QPCavpNuj7NtfiX9BrozFi/ZvXBRplQyOk+FVgsRBuS/MP80Pj1Tg9D/j0j7I9U0YE4kgxWmWVYOxsUOiaz/lSP+W6bBCABG/jsb7ehi3ERlOH1KAEvA7V/tJGBU7nsNe8CU9XeBUyt554irYB5ZjAbg/VzBp+bRf50wS5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA0PR11MB4767.namprd11.prod.outlook.com (2603:10b6:806:97::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 18 Nov
 2022 21:40:44 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286%5]) with mapi id 15.20.5813.020; Fri, 18 Nov 2022
 21:40:44 +0000
Date: Fri, 18 Nov 2022 16:40:38 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next
Message-ID: <Y3f71obyEkImXoUF@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0178.namprd05.prod.outlook.com
 (2603:10b6:a03:339::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA0PR11MB4767:EE_
X-MS-Office365-Filtering-Correlation-Id: 6463bbd4-b5da-4a23-9e57-08dac9ad8c06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7D7xAhyZx1l5m9HYnfPS3qjlW/TAkOIYDT+09stFQYIlXeIubtZvb3R3tqQibWnSzV7yI/n2RDQ+IoDy2M9JA14cFz6HeHL8baARP/bg2shi61/fT/f1xty+t6r9GDUUU0W1I9TDxz6bwj7dlB1HV3y1y4JxhUT/AgWV15nolqZFd54Fs9YdqkJKUKrjtD1lfgw2VBMXz0BCoSAxLBHwsSqiy0woZ9284ibi37dVS0grz4GSi+J9N7dUvOS5UftzLEsJDs1tUaXkTYinkVHACnX2ZNLO4210KOXR1952gPr4k6ovVtXC4RyJfp3Pc7KX7NuMKN4uKGPgtjMjerF5JOLGONoHwNNQJ74wY18gh42FCSec6Dw5hH0ioutMCTliauCTLn4UhzOwIXovmbrbxx2Wd+pJ0593cTzo+l6puys9J6kjPIPkF45GiOGX/4a+W3wDWjMfFXi9EyhhMmchzbiXU+45ErI90v7GosiEA6dPQavruDFn98cTLBAN415eiK0yBLuvzZdp3w5H2GNoUGn8m4LGFgFSAGPPiOuhGsDv2kkpLhglJgg3wQgoSkjAt1zFv18MISTxIpkgq5YsS6i9k8e3alMXvzm8er4RPAWDKHhKBiIryWnP5o1HesnxbPHtFS6XiyVsR2QAbBqpYWQWoQV0csE9fOmlhzgvtw8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(136003)(366004)(346002)(376002)(396003)(451199015)(36756003)(86362001)(38100700002)(82960400001)(6512007)(316002)(54906003)(26005)(110136005)(6506007)(2616005)(6666004)(66574015)(4001150100001)(2906002)(30864003)(478600001)(44832011)(83380400001)(7416002)(6486002)(41300700001)(966005)(66556008)(4326008)(66476007)(8676002)(66946007)(5660300002)(186003)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/V7qkbBbnyIw7SawEnBG/1mzcPDD75fkUIbPSekqEhyvPESL5ZiZpWtMrO?=
 =?iso-8859-1?Q?P2hg3qCuQ56yIKZFZouP06fbSIBaoi4oYxakvYgqoXGhO4Tbt9qIUvhKy+?=
 =?iso-8859-1?Q?a4H9ZQNUyPqe6LRnb5hd/OIIN0+dONNzClPAPuxLEq8M4yN0iNJ7ThrSP/?=
 =?iso-8859-1?Q?n3Kxj/UnnCA2OZliiP8Ztuuc0U7LFPaxqUlTk3cOC6gUKmvk12vAdOwgpf?=
 =?iso-8859-1?Q?nxLWG6aXlwC715wz4RBDwdL0JLOz1pOZ1/iKwTrVVasjfKL86gXB9Scikl?=
 =?iso-8859-1?Q?GQXDlXp6UcJLA62DJyY2eThxxiAzawatxpV3Uto3CDikicyFMrduvUy0Lc?=
 =?iso-8859-1?Q?vQAMXJ2aE4mC22oKJiujNYRT8wKOLaT4NpNhWWllWt3TgM4xv+xpkROHZb?=
 =?iso-8859-1?Q?Z3A3/IFHRPWSJAdHqLAurLN8gyWv/ZjfsXg/zgGpIt7Mgb9/uPBhx5Y0u7?=
 =?iso-8859-1?Q?F1fRfyp6lyaRSY26qjniIrcBWaQtnPMkMpbLIPlHv7QPmDS0NYUY3N7Sko?=
 =?iso-8859-1?Q?ovUifh6FXa0dCo09vX85DrelTeXZjkwoMYjKd/SkKok1s4XRICS91DPVPK?=
 =?iso-8859-1?Q?bVIu9f+mHj/JG30tjwWxM3Ub2e4CuO8h+u4cf1qIRfZrUvCKfbO4ZQ4rIC?=
 =?iso-8859-1?Q?hg9L6bdBwdFu3axw0e0lmggip4DvYKSYKDbxy5Qhk+W6/ThA+IVYSH6UnC?=
 =?iso-8859-1?Q?Oa3ANXrtTCXlzb72r+nmaEf5KEEX8F/vZPFOhmu8Ll11ZhhSAnW6yZLnp1?=
 =?iso-8859-1?Q?i1A9xL1HAnurHCcXrSw9YHNB+dhaN/urpzTmYQGodOgaKyCLPHvcWNOlRK?=
 =?iso-8859-1?Q?qCbRWVXFlhMocD5ptBdWn83D6hOU57lBbQ4S5yM5AQRi9wCmLLvwu1qe+V?=
 =?iso-8859-1?Q?jfJvI6ED+VHR60Ie+yfet/Ba4VMEaFMm5rcIPehwjIVmZHGPG4tRe920Kf?=
 =?iso-8859-1?Q?as13R+8E+FBv9VSlUqrhe0v8yMwGuB1idhNs2e2/A5kcZSqJg5+IWp7UNM?=
 =?iso-8859-1?Q?ypYq6HGtc6nV+t3Q3RYDNeIHrNgpTpnFlBCb+vJHAUpZJVXNab+peWojV7?=
 =?iso-8859-1?Q?pON537iRWHWa18rfnIKWkZq+/jEGKEQriJMib7msjrUT+SX+WAggYur7Le?=
 =?iso-8859-1?Q?hdlQs2xBUKjLCQxK3PtF4bscnn4oHEkapiTdniFbkAmb4bC9E+rIx2AbgK?=
 =?iso-8859-1?Q?x0rGsoUOVFxb+pEXxxjPGIN2Hg8ovz2kT2Nbr337PV/40Sc9NeKmVLGMz2?=
 =?iso-8859-1?Q?lSvJA2pWmIF/GI1+8VXd6n0ydrcSYVnoymHoYzagNPXh9k/fhBtHGzEyPG?=
 =?iso-8859-1?Q?raaW6l6HACVRexPu64yixxRPvz+FFiVh+bFnr554xlc/M08xJ7fjpgGO2S?=
 =?iso-8859-1?Q?S2dntc23aJ7u02mm0mucg28NoO+/EDAyGzZ9t70SVfQrJUpcoHuXNpSziS?=
 =?iso-8859-1?Q?GBIbsus6E2yiLyNb8BgA+VRYNisA7YkjXtU41qyoyEjsnCsMekGsteQLtR?=
 =?iso-8859-1?Q?9dV4Rvk9LAeaejesJJ6BDFyUxQzaUXs8wqDawYZNfxkWwtjPdNFKR9VNa8?=
 =?iso-8859-1?Q?w6wSpPHt3C6HWOVMVI1x40NjpGsUkel0B6VRXFrYqoL5GpLLSUy74CWm8i?=
 =?iso-8859-1?Q?KsETxW5SoilHVo3mRRQo62I0h8YrekaEOv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6463bbd4-b5da-4a23-9e57-08dac9ad8c06
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 21:40:44.5083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Foh3W1+SKBQM/dVz6PnxKUaZR+rzj1faq6r7l+NgIwYG9RbeZwfDMq3WqzgS1zQtDma7MVJNokWpf1XVTKfig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4767
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

Here goes the final pull request from drm-intel-next targeting 6.2.

Manly more display clean-ups and the removal of the force_probe
protection on DG2.

drm-intel-next-2022-11-18:

GVT Changes:
- gvt-next stuff mostly with refactor for the new MDEV interface.

i915 Changes:
- PSR fixes and improvements (Jouni)
- DP DSC fixes (Vinod, Jouni)
- More general display cleanups (Jani)
- More display collor management cleanup targetting degamma (Ville)
- remove circ_buf.h includes (Jiri)
- wait power off delay at driver remove to optimize probe (Jani)
- More audio cleanup targeting the ELD precompute readout (Ville)
- Enable DC power states on all eDP ports (Imre)
- RPL-P stepping info (Matt Atwood)
- MTL enabling patches (RK)
- Removal of DG2 force_probe (Matt)

Thanks,
Rodrigo.

The following changes since commit c02f20d38fb90eba606277874581db124ace42c4:

  drm/nouveau/disp: fix incorrect/broken hdmi methods (2022-11-14 16:17:22 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2022-11-18

for you to fetch changes up to d2eae8e98d5979aa4a767e1cbf53ab9f6a83a38e:

  drm/i915/dg2: Drop force_probe requirement (2022-11-18 15:38:33 -0500)

----------------------------------------------------------------
GVT Changes:
- gvt-next stuff mostly with refactor for the new MDEV interface.

i915 Changes:
- PSR fixes and improvements (Jouni)
- DP DSC fixes (Vinod, Jouni)
- More general display cleanups (Jani)
- More display collor management cleanup targetting degamma (Ville)
- remove circ_buf.h includes (Jiri)
- wait power off delay at driver remove to optimize probe (Jani)
- More audio cleanup targeting the ELD precompute readout (Ville)
- Enable DC power states on all eDP ports (Imre)
- RPL-P stepping info (Matt Atwood)
- MTL enabling patches (RK)
- Removal of DG2 force_probe (Matt)

----------------------------------------------------------------
Colin Ian King (1):
      drm/i915/reg: Fix spelling mistake "Unsupport" -> "Unsupported"

Imre Deak (9):
      drm/i915: Fix warn in intel_display_power_*_domain() functions
      drm/i915: Preallocate the debug power domain wakerefs array
      drm/i915: Move the POWER_DOMAIN_AUX_IO_A definition to its logical place
      drm/i915: Use the AUX_IO power domain only for eDP/PSR port
      drm/i915/tgl+: Enable display DC power states on all eDP ports
      drm/i915: Add missing AUX_IO_A power domain->well mappings
      drm/i915: Add missing DC_OFF power domain->well mappings
      drm/i915: Factor out function to get/put AUX_IO power for main link
      drm/i915/mtl+: Don't enable the AUX_IO power for non-eDP port main links

Jani Nikula (21):
      drm/i915/gmbus: move GPIO enum to gmbus
      drm/i915: reduce includes in intel_connector.h
      drm/i915: reduce includes in intel_fifo_underrun.h
      drm/i915: un-inline icl_hdr_plane_mask() to simplify includes
      drm/i915/dpio: un-inline the vlv phy/channel mapping functions
      drm/i915/dpio: move dpio_channel and dpio_phy enums to intel_dpio_phy.h
      drm/i915: reduce includes in intel_display_power.h
      drm/i915/display: reduce the includes in intel_dvo_dev.h
      drm/i915/display: reduce includes in intel_hdmi.h
      drm/i915/display: reduce includes in g4x_dp.h includes
      drm/i915/irq: make gen2_irq_init()/gen2_irq_reset() static
      drm/i915/display: move struct intel_link_m_n to intel_display_types.h
      drm/i915/reg: move masked field helpers to i915_reg_defs.h
      drm/i915/reg: move pick even and pick to reg defs
      drm/i915: split out intel_display_reg_defs.h
      drm/i915: stop including i915_irq.h from i915_trace.h
      drm/i915/edp: wait power off delay at driver remove to optimize probe
      drm/i915/hti: abstract hti handling
      drm/i915/display: move hti under display sub-struct
      drm/i915/display: move global_obj_list under display sub-struct
      drm/i915/display: move restore state and ctx under display sub-struct

Jiapeng Chong (4):
      drm/i915/gvt: Fix kernel-doc
      drm/i915/gvt: Fix kernel-doc
      drm/i915/gvt: Fix kernel-doc
      drm/i915/gvt: Remove the unused function get_pt_type()

Jiri Slaby (SUSE) (1):
      drm/i915: remove circ_buf.h includes

Jouni Högander (4):
      drm/i915/psr: Send update also on invalidate
      drm/i915/mtl: Fix PSR2_MAN_TRK_CTL bit getter functions for MTL
      drm/i915/psr: Ensure panel granularity aligns with DSC slice height
      drm/i915/psr: Remove inappropriate DSC slice alignment warning

Julia Lawall (1):
      drm/i915/gvt: fix typo in comment

Matt Atwood (1):
      drm/i915/rpl-p: Add stepping info

Matt Roper (1):
      drm/i915/dg2: Drop force_probe requirement

Mauro Carvalho Chehab (1):
      drm/i915: gvt: fix kernel-doc trivial warnings

Paulo Miguel Almeida (1):
      i915/gvt: remove hardcoded value on crc32_start calculation

Radhakrishna Sripada (2):
      drm/i915/mtl: Fix dram info readout
      drm/i915/mtl: Skip doubling channel numbers for LPDDR4/LPDDDR5

Rodrigo Vivi (2):
      Merge drm/drm-next into drm-intel-next
      Merge tag 'gvt-next-2022-11-17' of https://github.com/intel/gvt-linux into drm-intel-next

Ville Syrjälä (26):
      drm/i915: Use sizeof(variable) instead sizeof(type)
      drm/i915: Use _MMIO_PIPE() for SKL_BOTTOM_COLOR
      drm/i915: s/dev_priv/i915/ in intel_color.c
      drm/i915: s/icl_load_gcmax/ivb_load_lut_max/
      drm/i915: Split ivb_load_lut_ext_max() into two parts
      drm/i915: Deconfuse the ilk+ 12.4 LUT entry functions
      drm/i915: Pass limited_range explicitly to ilk_csc_convert_ctm()
      drm/i915: Reuse ilk_gamma_mode() on ivb+
      drm/i915: Reject YCbCr output with degamma+gamma on pre-icl
      drm/i915: Share {csc,gamma}_enable calculation for ilk/snb vs. ivb+
      drm/i915: Use intel_crtc_needs_modeset() more
      drm/i915: Create resized LUTs for ivb+ split gamma mode
      drm/i915: Pass intel_plane to plane tracepoints
      drm/i915: Print plane name in fbc tracepoints
      drm/i915: Pass i915 to frontbuffer tracepoints
      drm/i915: Add device name to display tracepoints
      drm/i915: Clean up legacy palette defines
      drm/i915: Clean up 10bit precision palette defines
      drm/i915: Clean up 12.4bit precision palette defines
      drm/i915: Clean up chv CGM (de)gamma defines
      drm/i915: Reorder 12.4 lut udw vs. ldw functions
      drm/i915: Introduce g4x_hdmi_compute_config()
      drm/i915: Force RGB output for DVI sink
      drm/i915: Treat HDMI as DVI when cloning
      drm/i915/audio: Unify get_saved_enc()
      drm/i915/audio: Realign some function arguments

Vinod Govindapillai (1):
      drm/i915: update DSC feature flag handling during device init

Zhi Wang (1):
      drm/i915/gvt: remove the vgpu->released and its sanity check

wangjianli (1):
      drm/i915: fix repeated words in comments

 drivers/gpu/drm/i915/Makefile                      |   1 +
 drivers/gpu/drm/i915/display/g4x_dp.c              |   1 +
 drivers/gpu/drm/i915/display/g4x_dp.h              |   2 +-
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |  15 +-
 drivers/gpu/drm/i915/display/i9xx_plane.c          |   4 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |   1 +
 drivers/gpu/drm/i915/display/icl_dsi_regs.h        |   2 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |   6 +-
 drivers/gpu/drm/i915/display/intel_audio.c         |  28 +-
 drivers/gpu/drm/i915/display/intel_audio_regs.h    |   2 +-
 drivers/gpu/drm/i915/display/intel_backlight.c     |   1 +
 .../gpu/drm/i915/display/intel_backlight_regs.h    |   2 +-
 drivers/gpu/drm/i915/display/intel_bw.c            |   3 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |   3 +-
 drivers/gpu/drm/i915/display/intel_color.c         | 594 ++++++++++++---------
 drivers/gpu/drm/i915/display/intel_combo_phy.c     |   1 +
 drivers/gpu/drm/i915/display/intel_connector.h     |   2 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |   2 +
 drivers/gpu/drm/i915/display/intel_cursor.c        |   3 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           | 102 ++--
 drivers/gpu/drm/i915/display/intel_display.c       |  39 +-
 drivers/gpu/drm/i915/display/intel_display.h       |  39 +-
 drivers/gpu/drm/i915/display/intel_display_core.h  |  21 +
 .../gpu/drm/i915/display/intel_display_debugfs.c   |   2 +
 drivers/gpu/drm/i915/display/intel_display_power.c |  42 +-
 drivers/gpu/drm/i915/display/intel_display_power.h |  15 +-
 .../gpu/drm/i915/display/intel_display_power_map.c |  69 ++-
 .../drm/i915/display/intel_display_power_well.h    |   2 +-
 .../gpu/drm/i915/display/intel_display_reg_defs.h  |  53 ++
 drivers/gpu/drm/i915/display/intel_display_trace.h | 206 ++++---
 drivers/gpu/drm/i915/display/intel_display_types.h |  55 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |   7 +
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |   1 +
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       |   1 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   1 +
 drivers/gpu/drm/i915/display/intel_dpio_phy.c      |  43 ++
 drivers/gpu/drm/i915/display/intel_dpio_phy.h      |  19 +-
 drivers/gpu/drm/i915/display/intel_dpll.c          |   2 +
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |  12 +-
 drivers/gpu/drm/i915/display/intel_drrs.c          |   1 +
 drivers/gpu/drm/i915/display/intel_dsb.c           |   1 +
 drivers/gpu/drm/i915/display/intel_dvo.c           |   1 +
 drivers/gpu/drm/i915/display/intel_dvo_dev.h       |   8 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |   2 +-
 drivers/gpu/drm/i915/display/intel_fdi.c           |   1 +
 drivers/gpu/drm/i915/display/intel_fifo_underrun.h |   3 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.c   |   4 +-
 drivers/gpu/drm/i915/display/intel_global_state.c  |   4 +-
 drivers/gpu/drm/i915/display/intel_global_state.h  |   2 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c         |  22 +-
 drivers/gpu/drm/i915/display/intel_hdcp_regs.h     |   2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |  33 +-
 drivers/gpu/drm/i915/display/intel_hdmi.h          |   8 +-
 drivers/gpu/drm/i915/display/intel_hti.c           |  38 ++
 drivers/gpu/drm/i915/display/intel_hti.h           |  18 +
 drivers/gpu/drm/i915/display/intel_hti_regs.h      |  16 +
 drivers/gpu/drm/i915/display/intel_lpe_audio.c     |   2 +
 drivers/gpu/drm/i915/display/intel_lspcon.c        |   1 +
 drivers/gpu/drm/i915/display/intel_lvds.c          |   1 +
 drivers/gpu/drm/i915/display/intel_mg_phy_regs.h   |   2 +-
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |   1 +
 drivers/gpu/drm/i915/display/intel_panel.c         |   1 +
 drivers/gpu/drm/i915/display/intel_pch_display.c   |   1 +
 drivers/gpu/drm/i915/display/intel_pch_refclk.c    |   1 +
 drivers/gpu/drm/i915/display/intel_pipe_crc.c      |   3 +-
 drivers/gpu/drm/i915/display/intel_pps.c           |  10 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |  21 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c          |   1 +
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |   1 +
 drivers/gpu/drm/i915/display/intel_snps_phy_regs.h |   2 +-
 drivers/gpu/drm/i915/display/intel_sprite.c        |   1 +
 drivers/gpu/drm/i915/display/intel_sprite.h        |   9 +-
 drivers/gpu/drm/i915/display/intel_tv.c            |   2 +
 drivers/gpu/drm/i915/display/intel_vdsc.c          |   1 +
 drivers/gpu/drm/i915/display/intel_vga.c           |   1 +
 drivers/gpu/drm/i915/display/intel_vrr.c           |   1 +
 drivers/gpu/drm/i915/display/skl_scaler.c          |   2 +
 drivers/gpu/drm/i915/display/skl_universal_plane.c |   7 +
 drivers/gpu/drm/i915/display/skl_universal_plane.h |   1 +
 drivers/gpu/drm/i915/display/skl_watermark.c       |   2 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |   1 +
 drivers/gpu/drm/i915/display/vlv_dsi_regs.h        |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |   1 +
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |   1 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |   2 +
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |   1 +
 drivers/gpu/drm/i915/gt/intel_gt.c                 |   1 +
 drivers/gpu/drm/i915/gt/intel_gt_pm.c              |   1 +
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |   1 +
 drivers/gpu/drm/i915/gt/intel_gtt.c                |   1 +
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    |   2 +
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |   1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |   1 +
 drivers/gpu/drm/i915/gvt/cfg_space.c               |   2 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |   1 +
 drivers/gpu/drm/i915/gvt/display.c                 |   2 +
 drivers/gpu/drm/i915/gvt/dmabuf.h                  |   2 +-
 drivers/gpu/drm/i915/gvt/firmware.c                |   2 +-
 drivers/gpu/drm/i915/gvt/gtt.c                     |   7 +-
 drivers/gpu/drm/i915/gvt/gvt.h                     |   2 -
 drivers/gpu/drm/i915/gvt/handlers.c                |   1 +
 drivers/gpu/drm/i915/gvt/kvmgt.c                   |   4 -
 drivers/gpu/drm/i915/gvt/mmio.c                    |   1 +
 drivers/gpu/drm/i915/gvt/mmio_context.c            |   1 +
 drivers/gpu/drm/i915/gvt/page_track.c              |   2 +-
 drivers/gpu/drm/i915/gvt/vgpu.c                    |   6 +-
 drivers/gpu/drm/i915/i915_drv.h                    |  15 -
 drivers/gpu/drm/i915/i915_gpu_error.c              |   1 +
 drivers/gpu/drm/i915/i915_irq.c                    |  11 +-
 drivers/gpu/drm/i915/i915_irq.h                    |   9 -
 drivers/gpu/drm/i915/i915_pci.c                    |   1 -
 drivers/gpu/drm/i915/i915_perf.c                   |   1 +
 drivers/gpu/drm/i915/i915_reg.h                    | 131 ++---
 drivers/gpu/drm/i915/i915_reg_defs.h               |  30 +-
 drivers/gpu/drm/i915/i915_trace.h                  |   1 -
 drivers/gpu/drm/i915/intel_device_info.c           |   5 +-
 drivers/gpu/drm/i915/intel_dram.c                  |   3 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c        |   1 +
 drivers/gpu/drm/i915/intel_pm.c                    |  11 +-
 drivers/gpu/drm/i915/intel_step.c                  |   7 +
 drivers/gpu/drm/i915/intel_uncore.c                |   1 +
 drivers/gpu/drm/i915/vlv_sideband.c                |   2 +
 122 files changed, 1173 insertions(+), 749 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_reg_defs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_hti.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_hti.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_hti_regs.h
