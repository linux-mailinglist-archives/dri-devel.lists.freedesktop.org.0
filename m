Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22156555519
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 21:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD6B10E984;
	Wed, 22 Jun 2022 19:53:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D797910E7E1;
 Wed, 22 Jun 2022 19:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655927625; x=1687463625;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=pMBma0Cc6HaLoLyEpUPclrRo77AqieNp6pIX+es7ZVk=;
 b=AmaJHBCyBeQpAgq4zopTm8CT+y3ytWMVWDBtrj1OB1ItrCPcwTNy9xe/
 A491EdRCZy+5EplXOr91caVkxLVmNOTNkwIWaceQhBc443EBgOOqMW4z5
 LqoWgdoIZt/LJamQnF+ngrm3n3XmeTuA7vy4bOglmS/44+C+eiAR0Ic+g
 43nC1W2mDE6SZiZE2cwvmuc7RfslVniwURu5++F7OPq60AcozTF6UykvX
 Rqse0QY7XbKJw4g6Ome9oOgVp2oU9Ig3mgo7Ic4dssKQ/rOm9XdM9Y0N/
 x2aP3qXxkF6VFyqXUqAEpHQ6lAm6gMtKxsRMX+1DhzeEmq6jJsk0afS/A Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="281258360"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="281258360"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 12:53:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="621046131"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP; 22 Jun 2022 12:53:44 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 22 Jun 2022 12:53:43 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 22 Jun 2022 12:53:43 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 22 Jun 2022 12:53:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EG/H06BBHytr6jvQLXeTLE+fsTKXsRVDA7uuyN+SWLysGIVakYQoh1FFfudaoZB3XMY2FwXIdR3Lsp03oRMAGL5erpjkgsr8ASlLfuYCAuU8aEG8y7FLm75B+DsbN+aNqz3X93xHYdel7TtlPET4pi4/qDqnUeSpA3H1sfaN5kBVyigpE577Wfkd5ztfIezZwJKqGJNsyD4thPvL2bkrfWCw26v3jXxLeW9XHmuEr1PJ4IzE0WyV+nUuvJtcL6Q6uT+EP7na5nZGKVWFUX+KwX8IyFHGcOf7eYNFkvfIAKVk8Ny5PDfQKjKdfLbbud2HZE/DsEwzwKABXY5HJtYLgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=awquP2pKex7KXUHuCjqBaYQpsF1nbKqCRXd7gak+zvY=;
 b=BI1h5EpxkRGzdZo34ASIfb4jhrL4ZpaixpXPjqpMZSS9yZcG5BFXz957L2GNPpiDvXWe6y9gUDQ3ZusWXmucQLgzEHphD7SFZOKuiGkzfdOTgX5jgoXZl7NfGjA1JUlN6Cm7rYcg+zdBdqcJgQvw7i70mzMWg2cfZR7t3EPqjExetZQZt37bH+gJ1xaXC/3lvW3ClsA/jpg9ap5H31g4oIQl9SzXfVynH0kP0w48Cqw9vnnIfTeNFWIf/RY/S6dMKlw07cQq7J/B/9fRYOaE2yHRb8W44qx9PO7Zckkk1f8cJNuYJ0uJUPyKPkvHhj2HyhSYzhrnfYYxn/O/hhVfIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY4PR1101MB2213.namprd11.prod.outlook.com (2603:10b6:910:1b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.19; Wed, 22 Jun
 2022 19:53:41 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::9c44:e158:13c8:2c74]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::9c44:e158:13c8:2c74%5]) with mapi id 15.20.5353.014; Wed, 22 Jun 2022
 19:53:41 +0000
Date: Wed, 22 Jun 2022 15:53:35 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next
Message-ID: <YrNzP2WTf3WBvpvd@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0068.namprd03.prod.outlook.com
 (2603:10b6:a03:331::13) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57a9050a-cb5e-45f2-f693-08da5488e819
X-MS-TrafficTypeDiagnostic: CY4PR1101MB2213:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1101MB2213155E1858E09D32C37F6C8BB29@CY4PR1101MB2213.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hwy4Ek6x+urWrvdeXzPPy9VUytFl4dmq6AyQEhNxCHKVvIjA0Qa8Rl4wLxIoBEQJuLtB40uOMgTlbarIWlZaAGGLR36b9Qa1fTDqrbojhBQfxSrPAEk9Z3J3gO2Ko7ELmdaL+YudixLF5oB5jFeoTvBHn3ZbmczHqz3pHRpSta2l0QAUn0dZJR1S4a8qHrDDWmTPCvcsiJCHiyj+e76rZ7z90fgS7j3TLAb6rpVjn2SyJEe2H8n7a0wOb0fP3U/TdIClCrECFhz015anatL/OEl47rFNMdcvrpv8mwXbxZP4kiJMv3vxlFOVl21uHXAa+VxH2CfsVajBiu4OSsqmPJuRmoAiiKXpUc26MsKor/6bEkwFHimt5nNUyiJ5ND7ar1798ZxxrwjYeZH6dKPXC4dptzsbu4CBLumw/iIMLm8EZt1UL8avVE7dJDXNbbxutWSblDrayK7AveeR8nwq5oq5PmLzE/A2bNZQ0T0Txav4dhbNK/DUgvoVicvtnNY0YBaygbL95q5kCq0k6cE/3ZQ3HZ9dMnVDX03chiFR5VCBg/Awawwf5deSbVEEC2xbvJeAnv4JyQ7NCvP6rL+tHCzcdxwKBgA9TYtC/DBeRUuww326/J6C8s7IDogXTnS48gviLy/wycWiA1ELRPwcb3C8mL01mYRcvccYXV7jifv/KpAJhQCneQ4uLsq/ncZS3u1WQek3SNncjpp4WyckqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(136003)(366004)(346002)(39860400002)(396003)(66476007)(316002)(82960400001)(54906003)(186003)(8936002)(36756003)(8676002)(66556008)(4326008)(38100700002)(110136005)(86362001)(66946007)(5660300002)(83380400001)(6512007)(44832011)(41300700001)(6506007)(478600001)(6666004)(66574015)(30864003)(2616005)(26005)(6486002)(2906002)(7416002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?5bFP1qd01Nj2QQwBGWhRDGkJlI08d6THV/lmRqVMhFSX2Sy6sBOYMDckyK?=
 =?iso-8859-1?Q?jEtP18C4nl5jBCVTIFVG/E/itLeha+yWejrQSFNKriTvB2qHL6+7uaHzxD?=
 =?iso-8859-1?Q?81ETF1Eh5286SkrQ0Ao4+v6tWftyL2TV0CE+ZeS806OKzMkU5E8nNZ3Qf5?=
 =?iso-8859-1?Q?rbEQkC3zwuMBf7ySLvBiC6znubcGA3kt/sqnLclwtAk/q5IAW/4tNIqyBi?=
 =?iso-8859-1?Q?IyuiXUmcgs9ua0tZVxyeII+1eTqYKQ1/061fGa7qHmoERN7K3jrLfmtO9r?=
 =?iso-8859-1?Q?wtttXl3ry7tYzbDnezOYKNjIzEKMiFKJxcYrc0tAmDEfTxkb9HCS8zZ1Vs?=
 =?iso-8859-1?Q?iTNSexUd117mfbQLXDUa9EL0l2q8enjYjDEq8MzJSPBefdNl4NnuDgRyys?=
 =?iso-8859-1?Q?TQbPgcmyMM0WYjAU/pKQxrbpaG8xv1Pk2+GYz+sGU33ppPqA+N5hpohTI/?=
 =?iso-8859-1?Q?OeBYHtxdSGPlj1LhcltUZH685svY0fwPiC1TCm8wf/6pswuqkizNN/dB1q?=
 =?iso-8859-1?Q?hGnF2MOZRp4zJ5+eaRlqvPl7Gqe81yqiPy4slYRGNb2vNziibmI+M78+XF?=
 =?iso-8859-1?Q?UyOXF2FkbiON/YXG5+jqsDmmuh0OueRp/DBvy83WasWOQk5lhM3zRBtyYF?=
 =?iso-8859-1?Q?0kkPX8MXP9fRErGKpIYuqcm7aDYGf9ZDPMl3V387lx6SU0VsLO3FGAK9xW?=
 =?iso-8859-1?Q?v1urvTFvpN92xN0zu/xsYXNNIazW8/KoQ+SDnO+DFbONs0MfZTKqdkJKkN?=
 =?iso-8859-1?Q?n4/Q1c0therQWTRdlDAodGkdfjb8PjKD654AIR++qVD9Pqi07qY0mOLIMn?=
 =?iso-8859-1?Q?gvzhLNxtckdFQdX2OJ3Wps7Xcn469g7T2h49a4gPLKFLjILxvGsGCo2pcH?=
 =?iso-8859-1?Q?JSX2ZJqf4BbKBhkc11zKA5GNe1vNSkVEHDJpV6JGY5sAr4g8m4svogLg3d?=
 =?iso-8859-1?Q?7kUv3lcKj11wG5un3/XHX8pdbfSQsSbYk31vossEiNWfZWn/SMBfnIRHbr?=
 =?iso-8859-1?Q?9qVKWyWYsFckiXNlMP+Tk72J3FlqeJp8O+T00dKAqzLdDkdKfWFdCtTukk?=
 =?iso-8859-1?Q?/3b8deZFWMFkTTv+W48qDASTZSeKjrNAu1K4h6CFZo9IzFS57AO38LQMZw?=
 =?iso-8859-1?Q?KU0oZlm8RVPth/6aBE1NxsFCaY7Qzp34BLO/8hiz6jWu/bYWprdKJFSCHF?=
 =?iso-8859-1?Q?4nNtiZDvNXvfcIB3CbVUgMVn3NO2dp2tv2jsQdjwJJ+EUEe5bkbuufEhJJ?=
 =?iso-8859-1?Q?/noktvgp4e+kEWAWyZ2Cey9iI2wduRAf3B+80h647+/44LeGJC3byjMws+?=
 =?iso-8859-1?Q?ZFjZexip5lvV9Xrp1odJoAC188B3fyFm4oIPE5AdQV+bGukTodXHW+kmWf?=
 =?iso-8859-1?Q?lhFOjlR9fYg5jj+mKj0O2Vka3e4tjz/isN281YsBsK46Ir/U6igdLsDisZ?=
 =?iso-8859-1?Q?YMoqftPVhV9nOn7G8H0+AlSKV4v9fNSsDxWmwGV+lncFVzTYztJLmIa+Qe?=
 =?iso-8859-1?Q?z9G8EgF9kQxXe1+t5Cso1pqFzJi3/BDBIf9GnLyFLkCeHFh5R4nuA63UGv?=
 =?iso-8859-1?Q?hQLmYHYsaKH/o6VbejJelQXL/isAbdK286PnQMA3BK89Sbzu3u8n9HE4N3?=
 =?iso-8859-1?Q?3zyDIpyRP/4LvDFLMMVWc7B9xOBJzzCUke0bINi0iQ8dwUUtMz7k25Sds4?=
 =?iso-8859-1?Q?lrh2ObzQM6VquWPS8DNdx+Lc/a9MM5Mt9QhsfjgEyzPo4AH5WM7OK/OGZ3?=
 =?iso-8859-1?Q?8dHxRcl00u3aI1+iTNaBJaCEySahvcWJynFPtGeHjl8bDy1LqljlXVOwWj?=
 =?iso-8859-1?Q?E7lp7Rb1rxIiXAZMvsYP0nMlE9v/+9o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57a9050a-cb5e-45f2-f693-08da5488e819
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 19:53:41.4834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SoYLRjvn7Y5vnxPiSqX5eqqeJkloIy1/YHz6l/Rgkz4Dfm6Xq6P43jdAjFDDQB9mTlmesbJJKbW8m6kq9RPjDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2213
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

Here goes the first pull request targeting 5.20.

Kudos to Jani and Ville for a good driver clean-up.
And many other fixes and improvements from the team.

drm-intel-next-2022-06-22:
- General driver clean-up (Jani, Ville, Julia)
- DG2 enabling (Anusha, Vandita)
- Fix sparse warnings (Imre, Jani)
- DMC MMIO range checks (Anusha)
- Audio related fixes (Jani)
- Runtime PM fixes (Anshuman)
- PSR fixes (Jouni, Jose)
- Media freq factor and per-gt enhancements (Ashutosh, Dale)
- DSI fixes for ICL+ (Jani)
- Disable DMC flip queue handlers (Imre)
- ADL_P voltage swing updates (Balasubramani)
- Use more the VBT for panel information (Ville, Animesh)
- Fix on Type-C ports with TBT mode (Vivek)
- Improve fastset and allow seamless M/N changes (Ville)
- Accept more fixed modes with VRR/DMRRS panels (Ville)
- FBC fix (Jose)
- Remove noise logs (Luca)
- Disable connector polling for a headless SKU (Jouni)
- Sanitize display underrun reporting (Ville)
- ADL-S display PLL w/a (Ville)

Thanks,
Rodrigo.

The following changes since commit 949665a6e237a6fd49ff207e3876d71b20b7e9f2:

  drm/i915: Respect VBT seamless DRRS min refresh rate (2022-05-05 18:27:53 +0300)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2022-06-22

for you to fetch changes up to 6434cf630086eea2d091f122f5802582a05d9d1c:

  drm/i915/bios: calculate panel type as per child device index in VBT (2022-06-20 19:56:06 +0300)

----------------------------------------------------------------
- General driver clean-up (Jani, Ville, Julia)
- DG2 enabling (Anusha, Vandita)
- Fix sparse warnings (Imre, Jani)
- DMC MMIO range checks (Anusha)
- Audio related fixes (Jani)
- Runtime PM fixes (Anshuman)
- PSR fixes (Jouni, Jose)
- Media freq factor and per-gt enhancements (Ashutosh, Dale)
- DSI fixes for ICL+ (Jani)
- Disable DMC flip queue handlers (Imre)
- ADL_P voltage swing updates (Balasubramani)
- Use more the VBT for panel information (Ville, Animesh)
- Fix on Type-C ports with TBT mode (Vivek)
- Improve fastset and allow seamless M/N changes (Ville)
- Accept more fixed modes with VRR/DMRRS panels (Ville)
- FBC fix (Jose)
- Remove noise logs (Luca)
- Disable connector polling for a headless SKU (Jouni)
- Sanitize display underrun reporting (Ville)
- ADL-S display PLL w/a (Ville)

----------------------------------------------------------------
Animesh Manna (1):
      drm/i915/bios: calculate panel type as per child device index in VBT

Anshuman Gupta (1):
      drm/i915: Use drm_dbg for rpm logging

Anusha Srivatsa (2):
      drm/i915/dmc: Load DMC on DG2
      drm/i915/dmc: Add MMIO range restrictions

Ashutosh Dixit (2):
      drm/i915: Introduce has_media_ratio_mode
      drm/i915/pcode: Extend pcode functions for multiple gt's

Balasubramani Vivekanandan (2):
      drm/i915/display/adl_p: Updates to HDMI combo PHY voltage swing table
      drm/i915/display/adlp: More updates to voltage swing table

Dale B Stimson (1):
      drm/i915/pcode: Add a couple of pcode helpers

Imre Deak (2):
      drm/i915: Fix 'mixing different enum types' warnings in intel_display_power.c
      drm/i915/d12+: Disable DMC firmware flip queue handlers

Jani Nikula (26):
      drm/i915: remove unused GEM_DEBUG_DECL() and GEM_DEBUG_BUG_ON()
      drm/i915: remove single-use GEM_DEBUG_EXEC()
      drm/i915/audio: fix audio code enable/disable pipe logging
      drm/i915/reg: fix undefined behavior due to shift overflowing the constant
      drm/i915/dsi: fix VBT send packet port selection for ICL+
      drm/i915/display: stop using BUG()
      drm/i915/regs: split out intel audio register definitions
      drm/i915/tasklet: separate local hacks around struct tasklet_struct
      drm/i915/drv: drop intel_bios.h include
      drm/i915/utils: throw out unused stuff
      drm/i915/pxp: fix sparse warning for not declared symbol
      drm/i915/overlay: remove redundant GEM_BUG_ON()
      drm/i915/bios: use dvi and hdmi support helpers
      drm/i915/bios: no need to pass i915 to parse_ddi_port()
      drm/i915/bios: split ddi port parsing and debug printing
      drm/i915/wm: move wm state verification to intel_pm.c
      drm/i915/dpll: move shared dpll state verification to intel_dpll_mgr.c
      drm/i915/mpllb: use I915_STATE_WARN() for state mismatch warnings
      drm/i915/mpllb: move mpllb state check to intel_snps_phy.c
      drm/i915/display: split out modeset verification code
      drm/i915/display: split out crtc state dump to a separate file
      drm/i915/display: change who adds [] around crtc state dump context string
      drm/i915/display: rename dev_priv -> i915 in crtc state dump
      drm/i915/display: some struct drm_i915_private *i915 conversions
      drm/i915/display: split out hw state readout and sanitize
      drm/i915/display: convert modeset setup to struct drm_i915_private *i915

Jason A. Donenfeld (1):
      drm/i915/display: Re-add check for low voltage sku for max dp source rate

José Roberto de Souza (2):
      drm/i915/display/fbc: Do not apply WA 22014263786 to DG2
      drm/i915/display: Fix handling of enable_psr parameter

Jouni Högander (5):
      drm/i915/psr: Use full update In case of area calculation fails
      drm/i915: Ensure damage clip area is within pipe area
      drm/i915/opregion: add function to check if headless sku
      drm/i915: Do not start connector polling if display is disabled
      drm/i915: Do not start connector polling on headless sku

Julia Lawall (1):
      drm/i915: fix typos in comments

Luca Coelho (1):
      drm/i915: remove noisy logs in intel_dp_dsc_get_output_bpp()

Vandita Kulkarni (1):
      drm/i915/dg2: Support 4k@30 on HDMI

Ville Syrjälä (42):
      drm/i915: Rename block_size()/block_offset()
      drm/i915: Pass intel_connector to intel_vrr_is_capable()
      drm/i915: Extract intel_edp_fixup_vbt_bpp()
      drm/i915/pps: Split pps_init_delays() into distinct parts
      drm/i915/pps: Introduce pps_delays_valid()
      drm/i915/pps: Don't apply quirks/etc. to the VBT PPS delays if they haven't been initialized
      drm/i915/pps: Stash away original BIOS programmed PPS delays
      drm/i915/pps: Split PPS init+sanitize in two
      drm/i915/pps: Reinit PPS delays after VBT has been fully parsed
      drm/i915/pps: Keep VDD enabled during eDP probe
      drm/i915/bios: Split parse_driver_features() into two parts
      drm/i915/bios: Split VBT parsing to global vs. panel specific parts
      drm/i915/bios: Split VBT data into per-panel vs. global parts
      drm/i915/bios: Determine panel type via PNPID match
      drm/i915: Split shared dpll .get_dplls() into compute and get phases
      drm/i915: Clean up DPLL related debugs
      drm/i915: Extract PIPE_CONF_CHECK_TIMINGS()
      drm/i915: Extract PIPE_CONF_CHECK_RECT()
      drm/i915: Adjust intel_modeset_pipe_config() & co. calling convention
      drm/i915: s/pipe_config/crtc_state/
      drm/i915: Improve modeset debugs
      drm/i915: Check hw.enable and hw.active in intel_pipe_config_compare()
      drm/i915: Require an exact DP link freq match for the DG2 PLL
      drm/i915: Parse VRR capability from VBT
      drm/i915: Print out rejected fixed modes
      drm/i915: Accept more fixed modes with VRR panels
      drm/i915/bios: Fix aggressiveness typos
      drm/i915/bios: Define more BDB contents
      drm/i915: Treat DMRRS as static DRRS
      drm/i915: Initialize eDP source rates after per-panel VBT parsing
      drm/i915: Update eDP fast link training link rate parsing
      drm/i915: Parse max link rate from the eDP BDB block
      drm/i915: Extract intel_crtc_dotclock()
      drm/i915: Introduce struct iclkip_params
      drm/i915: Skip FDI vs. dotclock sanity check during readout
      drm/i915: Extract intel_sanitize_fifo_underrun_reporting()
      drm/i915: Sanitize underrun reporting before turning off any pipes
      drm/i915: Remove bogus LPT iCLKIP WARN
      drm/i915/bios: Move panel_type stuff out of parse_panel_options()
      drm/i915/bios: Don't parse the DPS panel type when the VBT does not have it
      drm/i915/bios: Introduce panel_bits() and panel_bool()
      drm/i915: Implement w/a 22010492432 for adl-s

Vivek Kasireddy (1):
      drm/i915/tc: Don't default disconnected legacy Type-C ports to TBT mode (v2)

 drivers/gpu/drm/i915/Makefile                      |    3 +
 drivers/gpu/drm/i915/TODO.txt                      |    2 +-
 drivers/gpu/drm/i915/display/g4x_dp.c              |   22 +-
 drivers/gpu/drm/i915/display/hsw_ips.c             |    4 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |   11 +-
 drivers/gpu/drm/i915/display/intel_audio.c         |    5 +-
 drivers/gpu/drm/i915/display/intel_audio_regs.h    |  160 ++
 drivers/gpu/drm/i915/display/intel_backlight.c     |   23 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |  652 ++++---
 drivers/gpu/drm/i915/display/intel_bios.h          |    7 +
 drivers/gpu/drm/i915/display/intel_bw.c            |    6 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |   16 +-
 drivers/gpu/drm/i915/display/intel_color.c         |    2 +-
 .../gpu/drm/i915/display/intel_crtc_state_dump.c   |  314 ++++
 .../gpu/drm/i915/display/intel_crtc_state_dump.h   |   16 +
 drivers/gpu/drm/i915/display/intel_ddi.c           |   52 +-
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c |   37 +-
 drivers/gpu/drm/i915/display/intel_display.c       | 1826 ++------------------
 drivers/gpu/drm/i915/display/intel_display.h       |   19 +
 drivers/gpu/drm/i915/display/intel_display_power.c |   14 +-
 .../drm/i915/display/intel_display_power_well.c    |    4 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |   89 +-
 drivers/gpu/drm/i915/display/intel_dmc.c           |  147 +-
 drivers/gpu/drm/i915/display/intel_dmc_regs.h      |   59 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |  126 +-
 drivers/gpu/drm/i915/display/intel_dp.h            |    2 +
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |    6 +-
 drivers/gpu/drm/i915/display/intel_dpll.c          |   89 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |  413 +++--
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h      |    8 +
 drivers/gpu/drm/i915/display/intel_drrs.c          |    3 -
 drivers/gpu/drm/i915/display/intel_dsi.c           |    2 +-
 .../gpu/drm/i915/display/intel_dsi_dcs_backlight.c |    9 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |   89 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |    4 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |    2 +-
 drivers/gpu/drm/i915/display/intel_hotplug.c       |    3 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |    8 +-
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |  734 ++++++++
 drivers/gpu/drm/i915/display/intel_modeset_setup.h |   15 +
 .../gpu/drm/i915/display/intel_modeset_verify.c    |  246 +++
 .../gpu/drm/i915/display/intel_modeset_verify.h    |   21 +
 drivers/gpu/drm/i915/display/intel_opregion.c      |   14 +
 drivers/gpu/drm/i915/display/intel_opregion.h      |    7 +
 drivers/gpu/drm/i915/display/intel_overlay.c       |    2 -
 drivers/gpu/drm/i915/display/intel_panel.c         |   66 +-
 drivers/gpu/drm/i915/display/intel_panel.h         |    3 +-
 drivers/gpu/drm/i915/display/intel_pch_refclk.c    |   91 +-
 drivers/gpu/drm/i915/display/intel_pps.c           |  129 +-
 drivers/gpu/drm/i915/display/intel_pps.h           |    1 +
 drivers/gpu/drm/i915/display/intel_psr.c           |   72 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c          |    5 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |   77 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.h      |    5 +-
 drivers/gpu/drm/i915/display/intel_tc.c            |    3 +-
 drivers/gpu/drm/i915/display/intel_vbt_defs.h      |   67 +-
 drivers/gpu/drm/i915/display/intel_vrr.c           |   30 +-
 drivers/gpu/drm/i915/display/intel_vrr.h           |    4 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |   14 +-
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |    2 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c      |    4 +-
 drivers/gpu/drm/i915/gt/intel_llc.c                |    3 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c                |    4 +-
 drivers/gpu/drm/i915/gt/intel_ring.c               |    3 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |    5 +-
 drivers/gpu/drm/i915/gt/selftest_llc.c             |    2 +-
 drivers/gpu/drm/i915/gt/selftest_rps.c             |    2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c         |    2 +-
 drivers/gpu/drm/i915/i915_driver.c                 |   12 +-
 drivers/gpu/drm/i915/i915_drv.h                    |   70 +-
 drivers/gpu/drm/i915/i915_gem.h                    |   39 -
 drivers/gpu/drm/i915/i915_pci.c                    |    2 +
 drivers/gpu/drm/i915/i915_reg.h                    |  186 +-
 drivers/gpu/drm/i915/i915_scheduler.h              |    1 +
 drivers/gpu/drm/i915/i915_tasklet.h                |   43 +
 drivers/gpu/drm/i915/i915_utils.h                  |   40 -
 drivers/gpu/drm/i915/intel_device_info.h           |    1 +
 drivers/gpu/drm/i915/intel_dram.c                  |    2 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c        |    2 +
 drivers/gpu/drm/i915/intel_pcode.c                 |   93 +-
 drivers/gpu/drm/i915/intel_pcode.h                 |   20 +-
 drivers/gpu/drm/i915/intel_pm.c                    |  148 +-
 drivers/gpu/drm/i915/intel_pm.h                    |   14 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c       |    5 +-
 84 files changed, 3769 insertions(+), 2796 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_audio_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_crtc_state_dump.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_modeset_setup.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_modeset_setup.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_modeset_verify.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_modeset_verify.h
 create mode 100644 drivers/gpu/drm/i915/i915_tasklet.h
