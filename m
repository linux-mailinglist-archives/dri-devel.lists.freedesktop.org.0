Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E562513D87
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 23:27:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 713CC10E795;
	Thu, 28 Apr 2022 21:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75C2510E1A0;
 Thu, 28 Apr 2022 21:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651181252; x=1682717252;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=V6pxyC2I4PRKL1KcDZv8cD79Il0rBGMci+VTNoRObcA=;
 b=kPeOgIaZazX3KoTS5KLTdonmYBePHuLrdb3zCYP9XWSkONyTRPX+pato
 gmgoylVOw4VtC87XKLkYmPRsHqH811kdUZiC19XQqdR7btOr/oPJbcRJM
 UAEGhzQsPE4RST0z8YaQT0ylxAmei2b87+NBlHfRa0lM4tXpHZsdEXPXx
 p1DZyz7B6PYVPshsgCbQwG1in2gT2HozQoWdev3paqcZAj+0++YJFj9ea
 48KRKVyPzWFH1e7AW+H3qvu6f9PAkLQMaEKvIagk42hFhcRycMM0L5VIG
 WtYiBULVmXbFdGCL1KEmYqtPBBzYEqwKJBn1tbdXakTQNfnhZvPGY5+Mv Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="329372058"
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="329372058"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2022 14:27:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="596986700"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 28 Apr 2022 14:27:30 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 28 Apr 2022 14:27:30 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 28 Apr 2022 14:27:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 28 Apr 2022 14:27:30 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 28 Apr 2022 14:27:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YYcBQ4HWBjH/tfmPW7/U9OX73F94YHv+zBsnuy7MlLTGb8WS7lCgzz/FjJ4DpuFAO41MCe3Df8b4ttW3wze15n7hItZ1IgLN30Eag0FgQ+FNIkGjhPiHnLhCABVYJudcBuSW4gYx3TejStoOoV5/ppyXHaYRa1vX+0VLQUlHRAfYI6l+5LFnJ7nnV8w4hiqgfoOth4ysaSCpNoEZVlLEfuhrcGqCBVCZkeKNgexipgzwIgPHViOESiOqiL/4xFlNS4yM+fvtB9GHoz2UJx+JQKtWYIVljDtUxbR26WfCAf6GgAShtP4YjcRNIbndLc31DV7fjdpBWHyjLC0SKew5Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcljYbfEzkT5ot2GYhrgB9p/ZzeFYuM3hY4t9fjBEFY=;
 b=gDQR6nhN92LCZzOul7kPslOoADCZGuyyGT+NZIGnsTmU5QDcOn3rVeY4eBm5pzQDsHyuiGCR4f89fnjAPlqazW2hCme4uGr0+I06IV7nwkgZynAG5k/86y/b89FSUGqz689y3XIFndLRoCoVVlzlELnLUto/hm52yfsn+KYrue+7LPB9fhIiQwpOFpUHgP+TK5DRZWHat3Jb5Qw64g0CQgaYyLElQldQQe/7NHAJZfp7EIdrLwDDgbJaS/AsE8+68OPuwLYKp1NMo12GpehDuYSAKLkqxEk0E/P6chSAgCS9Tz/r3bnHpuNcnQ48NquSqZLb1DVwdP37VuFUlcPzpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 MN2PR11MB4062.namprd11.prod.outlook.com (2603:10b6:208:150::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Thu, 28 Apr
 2022 21:27:26 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab%7]) with mapi id 15.20.5186.021; Thu, 28 Apr 2022
 21:27:26 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Christoph Hellwig <hch@lst.de>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>
Subject: [PULL] gvt-next-2022-04-29
Thread-Topic: [PULL] gvt-next-2022-04-29
Thread-Index: AQHYW0bBd/JlvWa/rEq+IIEFmQEI0A==
Date: Thu, 28 Apr 2022 21:27:25 +0000
Message-ID: <9c2fc678-2e6e-a9d5-a540-2a6bfda31196@intel.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7a1be113-2da6-419e-0bce-08da295de3fe
x-ms-traffictypediagnostic: MN2PR11MB4062:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MN2PR11MB4062B784F4E98EBA76F7A91ACAFD9@MN2PR11MB4062.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CVOFnD4yyya0dB758F5BddbcC7nPXBdEWWtmJBzxmaNORNdxt29tx/VE67PuULKMQIMpDkX76PgAnWGMOG9ERlvC8oBYgM77iwv9HkzvW2b1/1Jhnas/Z0iVAk4TeNBwJI1NmL2HmvYLSMghhI8HEZsYuNz9Wuk4utcY3Hur7Jr46Fg0evjhdhbgo1+SUkXPCM684RVX2D2ETedO8b8GYzIXOim0fsy1BxxKv4zI2pvmroRsJ07n7S0m7N10vA6S1M8XtJJu66tj+HPGq8gtRBb70f7feHFC/6Rra/TDiYAvrOoqXgAJ4UP3za0E0iW25201V63nARRCz9btaZO+KFAGh3bj4CyOvxu/HhxdyA8DRrnoprfDI5iASXEQzuaJ6T+RWZ4DgRyK5VOfM9GYAVxZnumdY9scQeenknziDtLMivHsw8/U2iOSs8XCtuJVwNvIPnJ0wJ0h5OkvAltzvlF4wc4K81oWR+jKhYobrJovVOJQ8Ns0tDZ0Bo7PJDmQx4L7I5NyccFG87cKaxIfwtqDfDS1vRgH3ixwvh6Owozjx0bhWBbTlWkFVtDrMY7xEv+Bokd+tdyZ5Dao/Khi1YZZaZpjjQv5jOgWOh66NzXXAH34zLCwJBI1Gb/1I+sqNXKVqZYhCw1TKXRccBgNQ/7Ye0DBcrA4AYu7IrfpEpippwgtavRVsjHK0eEPt+YdShAq0CkVNsalXi6In9IgnuA9fMgzA72NrEvOvRQ2kPULTp36Xc4RalIaamBy28AjkRLwaRoWr+bmxbpWtG6yv3uizFGn7GP07VlVlimC3fp03WdkSAi8Vnh6oMhbIw4Zo8oA6UsvN9VhEjchKaRBtCGCecbZXtcDJppc8c6vLC0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(26005)(5660300002)(7416002)(82960400001)(122000001)(8936002)(316002)(71200400001)(38100700002)(66946007)(4326008)(8676002)(38070700005)(110136005)(508600001)(86362001)(66446008)(66556008)(64756008)(66476007)(966005)(6486002)(76116006)(2616005)(6506007)(91956017)(31696002)(31686004)(186003)(36756003)(83380400001)(2906002)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?CSWZCJJcBg8EqyEjSstp8VZTxmxTN9ATQrDvYBj2ZtHv4D0bTSSlb6yF?=
 =?Windows-1252?Q?GN+dLDMIO+WQA0Gs3i8YLrBDIdWK9bwgUMy1wc47axlitcK9VlPpjIm1?=
 =?Windows-1252?Q?uZk8yCwiel+c2gPSfZK3mUtM1R4mL0qKdb9Ax4wzAqFPNUMym9q2ygdn?=
 =?Windows-1252?Q?lm5D0/H7cAWWn8fRxM2CMCuBIxaDGpnXNZMERuRWqz2dzHcyb+LtNgRz?=
 =?Windows-1252?Q?oJq9mOak9NEZpJwc5pqni6S0Cq0OiXfhvc+QYJM4MM3dZ8+8f6p3KOcq?=
 =?Windows-1252?Q?r+zJyKvpPfuD4toF1IexHrbSVx/xir7dRaZfqYwor4/oEV94VX6iFUyg?=
 =?Windows-1252?Q?7nxJm4uiflBKdLgdKOVHOmOkSL/dI4gu/w/v0RM5jDeRBuBLm6/t52T7?=
 =?Windows-1252?Q?710ZAA5sS4S0NMcseUhFHfPdX0LGARB/DaSpVpi7bOeRGzak3yZOg10l?=
 =?Windows-1252?Q?4l0ispIvdaCXTjuMsxkiUXAcn9xMvDCkOqMHFGCBqnKZeyKTnK/im6SU?=
 =?Windows-1252?Q?duWSdWlhwMc2IKVqLGwQEOULsslsMuqNCfdNKdk9T2aml56bqqqiPLoe?=
 =?Windows-1252?Q?1ZAjEsqi2/QnL08v60FrpM3Q0ky9z7Z24hwISx7dsAM+Iklx9+pGDO5d?=
 =?Windows-1252?Q?IN0NV0b8o0MV0ysb7vtkaY520R5SJhLRAR1EqyFV0T6phBCa5zIh2n5P?=
 =?Windows-1252?Q?WELg6Q0qaF2f0xVZS1jOsrKJODWD1whPhS/7sBjINY+Xg19Tzue5lZFV?=
 =?Windows-1252?Q?2lqbmbhCyrPKGQs31Omt74qK3hq+chFroQ4mk70vnT9PCbppfPVIBhJw?=
 =?Windows-1252?Q?jGjqZdHyyKA6/Yci5MMCmfmrdnIwLeUAn+59iDMQ1sCajQuM0M8wli5/?=
 =?Windows-1252?Q?5uvz/vUtb6p+SVi5yaL+6j+bz7S1VQjFdMgjyrLcfOcmIRnf4CJ0YKwi?=
 =?Windows-1252?Q?6g2g8m/AxZLMNidcyqyp4R01KhsO3/IBV89EgfgDWqQAJGCKUgO75x4n?=
 =?Windows-1252?Q?t0TMBdLL1dVx/eVQz1T9xt5V2JbmEq7cXfpjsF1A1JCd/yeV+jZZ3UwH?=
 =?Windows-1252?Q?cMBVP1sMZ9wIr7FZYsMuISQoZtljYHZjizG5Cv53tfUs38wZsULf7buR?=
 =?Windows-1252?Q?qSqsaKTaoAaRBmm4FXlBpqomPa9XyGe24+jodxyCaOtHeTsK9PvlEA61?=
 =?Windows-1252?Q?pmf8GKLaR6P77W1M2qzc4FudYdFNX4gqkxt45JxyGaGizxRBVqnwu322?=
 =?Windows-1252?Q?2gtwZubAntPqL4W3BLdDyRS0zIL2uiFL4TpWHiwf27KBFT/36lPSRdia?=
 =?Windows-1252?Q?e8b6G8ITlg32Gh3078s7iMYiM2wi+1oENwHhRkNLDLW3lp39RednYuT4?=
 =?Windows-1252?Q?1vdHrK4Q43nala05sMETnicsAalw6uGhTpdF6cTK2fLggdDgr7hw2UIa?=
 =?Windows-1252?Q?etNUXvLpxGBwkSoWU4lMUbOY01bW91PGnGHYppUXV0eREKPGptXrJX0l?=
 =?Windows-1252?Q?NaC2J0JismsDxKAvSED0TQzFKLheZaY1oJ3ezzEF6CADmGidr9/OkeSU?=
 =?Windows-1252?Q?OtNwSOT6JTAxOmaplYUuBi9cvmJsK/O6RrMiqKFOL50x5xouCbkPnmft?=
 =?Windows-1252?Q?3WI0fm1NaA9t77tr0HHBAVbizQhXe3JX2HKg0uNHu8EcIWAGg6MIqrnP?=
 =?Windows-1252?Q?JIhfXqnliSOcBlbcqxOCR9f/FWdbDZML6QYMp3o1AEyBzbHnYackgveQ?=
 =?Windows-1252?Q?mhMx+vpGwZhbSgwnRQx8tQyv9Gj3I78MLV4UL5h8rL4kRpC1XeMVgHgt?=
 =?Windows-1252?Q?TXyIX9oMDqylMDMa8aykGSCN04ha0Rb8bfstHhmonjBcMu5eaw7AXk79?=
 =?Windows-1252?Q?YI5CT2gDUpdqdw=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <C65F82B58C702F48A233F175AA6C6524@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a1be113-2da6-419e-0bce-08da295de3fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2022 21:27:25.9496 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qcYxYDhf95czE9VE4j9yg+C3x4kP0LhetQ/LWXotS5EdQPQOUaquSiDq7H/zcVnReo02Et+ZpD/CnxZ1xK6lIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4062
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi folks:

Here is the pull of gvt-next which fixes the compilation error and warnings
for the the GVT-g refactor patches:=20

- Fix a compiling warning of non-static function only having one caller.
- Fix a potential NULL pointer reference in the code re-factor.
- Fix a compiling error when CONFIG_DRM_I915_DEBUG_RUNTIME_PM=3Dn

I also tried to apply this pull on the latest drm-inte-next and it succeede=
d
without error and warnings.

The following changes since commit 5e9ae5c47052e28a31fb4f55a6e735c28d4c3948=
:

  drm/i915/gvt: Add missing symbol export. (2022-04-26 04:18:43 -0400)

are available in the Git repository at:

  https://github.com/intel/gvt-linux tags/gvt-next-2022-04-29

for you to fetch changes up to 419f8299ddad6070a6c95aaedf78e50265871f36:

  i915/gvt: Fix NULL pointer dereference in init_mmio_block_handlers (2022-=
04-28 17:06:02 -0400)

----------------------------------------------------------------
gvt-next-2022-04-29

Introduce fixes from previous pull.
- Fix a compiling warning of non-static funtion only having one caller.
- Fix a potential NULL pointer reference in the code re-factor.
- Fix a compiling error when CONFIG_DRM_I915_DEBUG_RUNTIME_PM=3Dn

----------------------------------------------------------------
Wan Jiabing (1):
      i915/gvt: Fix NULL pointer dereference in init_mmio_block_handlers

Zhi Wang (2):
      drm/i915/gvt: Make intel_gvt_match_device() static
      drm/i915/gvt: Fix the compiling error when CONFIG_DRM_I915_DEBUG_RUNT=
IME_PM=3Dn

 drivers/gpu/drm/i915/gvt/handlers.c | 4 ++--
 drivers/gpu/drm/i915/intel_gvt.c    | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)
