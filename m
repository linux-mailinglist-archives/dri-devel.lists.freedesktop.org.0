Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 245EFAE5BB7
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 07:01:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 459E810E4C8;
	Tue, 24 Jun 2025 05:01:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c2gf4LW7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ABFA10E4C3;
 Tue, 24 Jun 2025 05:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750741287; x=1782277287;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=7gdD9P3F9InJ6ikXUMIYg+EH97py8S7sZWIV8nX3qY4=;
 b=c2gf4LW76TtNhW/E7pzzmLVPl1/j76VK40mxIqBlprzSrC4tisgv82GG
 SV0VFyvZt/nES1q0SFyjXFmX/pnWKHRAp1473t0EcOoS3TCS6MIs4vCKN
 0LqVpjn3s211tbgZxCQnjG4Ni3jrhuGmhkmCkYwMqRcClKzo0fwO0IvOU
 Bi2j2HyINJZFS1TEhU9x+ugrgBGtEpgZpyGGCPE3vROxDrag2ZdZOsqpw
 gTDuHyutxAdJVTMPOqY1Y/ygdVPBF2AJgSctkzCyxyRCV8G1dmx9d5koJ
 1Yk+jl1u/uY6kmGTIV2CgioTn2F7TsRS3CFuNxUkawmE9w6Q3StRAU1YT Q==;
X-CSE-ConnectionGUID: bxXMee9mRguV71wkOsSJEA==
X-CSE-MsgGUID: p2tmXiJCQdm484H7wHy8lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52683370"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; d="scan'208";a="52683370"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 22:01:26 -0700
X-CSE-ConnectionGUID: roRyB+ksTm2XXGbAncCRPw==
X-CSE-MsgGUID: PA56cee8RPiB5fqYtoPq/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; d="scan'208";a="152105681"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 22:01:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 22:01:25 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 22:01:25 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.49) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 22:01:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zUNYTc2b3Xl2nPNLG9BSVrbcw5KRfAXWuXx79j//arvOKL1IBZoF9q8SuUe+wEWWNVPbzcqDTIr0wgZe9GHCHcxomRlM62/BOUMKZKrlw+tUBcmoRcVm2EpYnByr+p2PsCmJz711JaHyLFvoukV/hqno1REOjploBmB5NDomU723TvnwLcQKQyDOUTbOd0x13X2aHO/Y+46VFpCSU1faehnF0IZuSXK98TbADFdHCikcSoYHmOsAY6vcI+nie8POcyuJIdsk9JhFrCQs1jXix4VX2tcdrO3JhVkRE1gbi5dpH3lpSkt1e/NLkzhfHK1b/vK5+5PHvxV1BU/6nArHXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sIZkLP8jHtfwDAMMH+UceUsLgBw+tF8SV0OPI4bs7sI=;
 b=JKUmRjOZByFnr3TmswoA99n3X3AUDMaLf4RDRSgdf49WheXpC4bsVVWZCvuoAg7uvIp17bEPT9UwvXV1jrjeGuKuHdLgEwd7AxLEULISCB0KWyTDC0sLCYAq6KMPxlpNCptx9z9p3Fymrmmty8FiXX/Nq8h0QSWwLGToU3TZjGQ6EDxiYwwuXu3Wh57QQtdQP0XUd70JnBhEu26dDkCF8COnR+Ac0HYNgvCd4vpu3OTUGvoVhRaHUZdZZluzI0VzJb654QVO1Fv8oxi3r+nDZ0q+9wYqmhMf+o1lQX94rhOPLc2X/zZR+TC1dbpHzgXGL9ZpXqzYE8fb0GTcM6bYFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SN7PR11MB7042.namprd11.prod.outlook.com (2603:10b6:806:299::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Tue, 24 Jun
 2025 05:01:08 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%3]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 05:01:08 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Subject: RE: [PATCH v3 11/13] drm/i915/backlight: Use drm helper to initialize
 edp backlight
Thread-Topic: [PATCH v3 11/13] drm/i915/backlight: Use drm helper to
 initialize edp backlight
Thread-Index: AQHb4a2Wo2JZGNQcoUe4Zr5QpfO7i7QRwfIQgAACaACAAAHEIA==
Date: Tue, 24 Jun 2025 05:01:08 +0000
Message-ID: <IA0PR11MB7307EC4666FD32BD780FCF8CBA78A@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250620063445.3603086-1-suraj.kandpal@intel.com>
 <20250620063445.3603086-12-suraj.kandpal@intel.com>
 <IA0PR11MB7307746E548211C22AEE96A6BA78A@IA0PR11MB7307.namprd11.prod.outlook.com>
 <DM3PPF208195D8DC0A3BFD202B0AB765727E378A@DM3PPF208195D8D.namprd11.prod.outlook.com>
In-Reply-To: <DM3PPF208195D8DC0A3BFD202B0AB765727E378A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|SN7PR11MB7042:EE_
x-ms-office365-filtering-correlation-id: 790442f6-3bae-4dc2-871b-08ddb2dc2193
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Bxl6qrXIRb4faH7LZMF4Tb3BgQf5LQLbo7faM7dzByAigPLvwj7sFiDlGIp1?=
 =?us-ascii?Q?Kbe7sgQSVanj832FoY+OfulGM7OSw/0s2jN+kMc1jE+uB2dngHpBPofRVyKZ?=
 =?us-ascii?Q?HwUM+1+p8rE9G2Ju9LiRS2a9tbaWfEjYQl24yuRNALRVwEvQIE50Itf1z7gw?=
 =?us-ascii?Q?85PJgbyDQZHA37tXdWA9e/FzcvtZ7n86FYjIEW5c7qUwQwVyHid+6VR6bmzg?=
 =?us-ascii?Q?0Tw8YHA4uWUASCveDxxh1f02C0mJl4/9K/oWx7mFePuviOr1gk9i/AGHMcYX?=
 =?us-ascii?Q?v1I1gsKRGUV5/mAmpYEp3ftPy+V85p3RfL50xmGW86vivC4ArBjOQ0d413jP?=
 =?us-ascii?Q?bufPIeTDu82Is2aw+arAXudW6Mi8AXTmJj+79+7grkgKHo0fyYKzoXlDSx4S?=
 =?us-ascii?Q?f2UGKfcF5ONXsTG5eGIyE1wqiJ8sofsCTu2f9Ds781WWpGieaT4fMx6UmA5F?=
 =?us-ascii?Q?ATUQe0MG106B9XzK8WatCYFrll7BnKaV7S1hZFbKPIDvw0CxnfPNp1PeRvDO?=
 =?us-ascii?Q?Bx39SMOYkCvqb79O8fFR8RhNfsmksqSi6QZ+hOwMCkzT/Jx0/btoFPeK5xcr?=
 =?us-ascii?Q?2kK3fI67JuHKQo0OqPXJIbNu2S40TAy0ib/vjdfA5qIrSTxXZtiZci0Dl/0L?=
 =?us-ascii?Q?52XfuaCtlBBmjVaB/54V9lAqgVlTmR0pen9sxCtYo1xu2Ak6B751GmDIVoMp?=
 =?us-ascii?Q?u7saVy/C7/J2KOPtISRo1SdUW2t7MQyWbp7GT6HBma9MkzOEnxbGlu38sezX?=
 =?us-ascii?Q?K05go57PUDaXZQ7LJnmoNmcPkozluZRjZQee54x5SvdZhXPK/4uxYOsTtnvm?=
 =?us-ascii?Q?4fT2DyuHvq7Z2QVAA/MydbSFYNtH6m7/j+ovrTaTnVSaGp5ihVX2HLxE1XJI?=
 =?us-ascii?Q?b6/Y+sNfwfros3phUuuzD7Zg5EBBx5srYqsPR6w6Ovg+CBW571QupT1LLa24?=
 =?us-ascii?Q?oCuh5Bv85z43qPvnZWCo4rMfkqTspWLWqxYo86pEurJhfi7CYwNTEhl35It2?=
 =?us-ascii?Q?wWnPby6btwP+PlRV8DN7pZ6aUps+nHczDwKq27ahS8164YG01xtlJMG6/rTK?=
 =?us-ascii?Q?KwvPgxl5fqgnlu2l1hcXfEmoE94DGk/x41wjUiWwyLfrhbE5l2Bu3C3BTuZ2?=
 =?us-ascii?Q?0fjLMbTTagUL8L8ZI2Hhk1zOElKC9yBZWCJVks+ZPIOfDp5rwf8rKsRZVN+w?=
 =?us-ascii?Q?EqaWw2pnngVQyNDqQgsNq964zKI5c2U29B+On1Hxjj9dnuRxssmHiXacion8?=
 =?us-ascii?Q?WqSM+slCa3eFx6YX3qnpKOQNOCO+u+tEwkNZ+dF30IYrmtj9FkiDBIFA6RUc?=
 =?us-ascii?Q?Mrcb+5ScrBNi0a9ox+AkhLiMqA8uvA8NdTrJHZNmoLlErlj/TS/qT/2NcQ3g?=
 =?us-ascii?Q?62egHjQvvF7WLnqVUechBaGqoiVceP12RouWkDiOqS437CueqfcJvFVJpSq7?=
 =?us-ascii?Q?nYsLmNonrU52RrE0iFZj3Jcgc4htYgI3YXavJH4M8ChsA9FVP13ic+u2TUJd?=
 =?us-ascii?Q?omoLutAqtSnZuGw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?V2OebLJnRC6+7jegwy1uh/EpNy0pj6EnoO1uLu4qAMmBtkckHazfgQLSExR/?=
 =?us-ascii?Q?rco2VRWGaYsmydr+KFGC6nJzxUjAIHldgkgQ+ONtr6hmiaf8tKsSWt630ETO?=
 =?us-ascii?Q?wRi3raT8Myj6zr9EoqVkD1Lzf6p/dQ5JODUskAlplUgvDWLsIJQutkVcbGB6?=
 =?us-ascii?Q?4oXWwsSChHa1W+9SyS6ElWykm8DI21owVZl0s74Ne9YSlilI0Ch6JcFB4H+D?=
 =?us-ascii?Q?gsqsH/QPal3mZlEBtOw+tvCh0xkt26pdVo1PJ707rkW1x3xbkwPYU2uMzzjD?=
 =?us-ascii?Q?+pVl4pMwQJkoJedsD9iy1c72lBBWT/uJLZRvuDLeowX7wAHaGZJHn5FfRNwr?=
 =?us-ascii?Q?PzfQlbdDovUpEAAsyKl+m5SwQA3SfgRi6XuHSKDYQlVGuLMC0YQ9A0r5yAmM?=
 =?us-ascii?Q?MXQC513gXq0oE/9JB9ruvofdZdUn5mhcwY26kwzHkr1IfbAYP7n4eDZYgTta?=
 =?us-ascii?Q?rHyoGaxLIDWFzt1UW3V7+AKdDeuUJT3UrIVanfQQkR0kCFIBMXHf+8zJM7Ey?=
 =?us-ascii?Q?EENwInQD1M/LEDo1pVibhDHYtbX2Ld1+ghRcRVTzCtkhXj7cVilkJ++qCVxm?=
 =?us-ascii?Q?IjehGR91HTVNOepKKtBSfDFnIyjYw0vED0Me1uyGX9dOE+sC3SJizwuxWBSN?=
 =?us-ascii?Q?4HoDfMSvunRRVb316ukUNq1H+5K9EWkZoKg/sJ5U2pRnHqRoiELdjtzL3jaX?=
 =?us-ascii?Q?BruqmnD7We8zQctyOemEDYN/nVuaZ4L4wgOR3eHyZt4JCUmT/HER1O/Rg91v?=
 =?us-ascii?Q?WhJIAQ5Ww14xx0hdbW76XndUOSj0b7bNP+JwcJk0PkbA8ilpZIIPohhfio8+?=
 =?us-ascii?Q?lwoa2pO2UFhVyldrehBTKuyGD1g2SlxThaQAPSahp4p/ELwQl1Ls1GnzKl28?=
 =?us-ascii?Q?P0DtwlUmRQG6wZsFUci0uvkwBmd1WWqDnBHiC5F757bBFEA/bOz/3Z7+HZ0n?=
 =?us-ascii?Q?dT4e9THlBTxV+FsfSb7zhUpP1oMVYCV5wLarxX2vLrbUoF5ydoMmPsQheugm?=
 =?us-ascii?Q?Mek6qICLOqJbxKtr+rjmoe85I5jtHnhNYoMI6KQSWiU7WkMgqoMKCFIlKfKs?=
 =?us-ascii?Q?gzBmbcaocHNeXBL1AJ4z6NLhl2fiKqBNWVtAT+itmWITk9o//9k37o5YPWW4?=
 =?us-ascii?Q?CtbfVhYpuKP51nlcwyb8ggTD9U9OF2raPSeGwq7SZW2oSdSEmOXHDxYkMkWp?=
 =?us-ascii?Q?0CvI2s5QCj8BZPnUbfsaHW+Trp2kOstSxarxcu/g9i7ujaFiQmgju05K48Qo?=
 =?us-ascii?Q?33llS6Aq8inGXXhRg1XUU7EA4WqGnKjUrvRaaPaUeX5khUj3jvG4/RsArYO1?=
 =?us-ascii?Q?Wy90fylIOTpR88acCZgplBh72kkP4gDfXqxTYc57wfdzT7hUQJl7mfn2+kSn?=
 =?us-ascii?Q?8guC7z8+pYPXQ1pRqoYcvwiZC+C8tRmo1H+Oc6ykOl7bdFyZ/WbadUO2gkKI?=
 =?us-ascii?Q?6g5V473a73dDRuCEX0jhpFoU9/erY6bOZeiY0QV62ad/bgk5W7WaTc7KTQOD?=
 =?us-ascii?Q?m1kPd6Hc+8yg46IlZsRRu88A2q3AmxTD3pxxNjvpk0UYdtuvltkDgM2lU0RR?=
 =?us-ascii?Q?0NgAYmNNrYZAsm4f2y98/zET4vKOLgYmO/Eco5To?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 790442f6-3bae-4dc2-871b-08ddb2dc2193
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 05:01:08.1837 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aiNCc5sxZ+h068EE/hw8VSdyio2ZQD7xHo5qe393e3HuVitfBBOdrPAEAyJxZ+9P8yR8JjYAXtKXaGmUuRpjPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7042
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

> > > -----Original Message-----
> > > From: Kandpal, Suraj <suraj.kandpal@intel.com>
> > > Sent: Friday, June 20, 2025 12:05 PM
> > > To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org;
> > > dri- devel@lists.freedesktop.org; nouveau@lists.freedesktop.org
> > > Cc: Murthy, Arun R <arun.r.murthy@intel.com>; Kandpal, Suraj
> > > <suraj.kandpal@intel.com>
> > > Subject: [PATCH v3 11/13] drm/i915/backlight: Use drm helper to
> > > initialize edp backlight
> > >
> > > Now that drm_edp_backlight init has been modified to take into
> > > account the setup of lumininace based brightness manipulation we can
> > > just use
> > that.
> > >
> > > --v2
> > > -Fix commit message [Arun]
> > >
> > > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > > ---
> > >  .../drm/i915/display/intel_dp_aux_backlight.c | 98
> > > +++++++++----------
> > >  1 file changed, 48 insertions(+), 50 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > > b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > > index 800d07c7f041..117c762fa2fe 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > > @@ -584,9 +584,37 @@ static int
> > > intel_dp_aux_vesa_setup_backlight(struct
> > > intel_connector *connector,
> > >  	u8 current_mode;
> > >  	int ret;
> > >
> > > -	if (panel->backlight.edp.vesa.luminance_control_support) {
> > > +	ret =3D drm_edp_backlight_init(&intel_dp->aux, &panel-
> > > >backlight.edp.vesa.info,
> > > +				     luminance_range->max_luminance,
> > > +				     panel->vbt.backlight.pwm_freq_hz,
> > > +				     intel_dp->edp_dpcd, &current_level,
> > > &current_mode,
> > > +				     false);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	drm_dbg_kms(display->drm,
> > > +		    "[CONNECTOR:%d:%s] AUX VESA backlight enable is
> > > controlled through %s\n",
> > > +		    connector->base.base.id, connector->base.name,
> > > +		    dpcd_vs_pwm_str(panel-
> > > >backlight.edp.vesa.info.aux_enable));
> > > +	drm_dbg_kms(display->drm,
> > > +		    "[CONNECTOR:%d:%s] AUX VESA backlight level is
> > controlled
> > > through %s\n",
> > > +		    connector->base.base.id, connector->base.name,
> > > +		    dpcd_vs_pwm_str(panel-
> > >backlight.edp.vesa.info.aux_set));
> > > +
> > Can these both debug prints be combined?
> >
>=20
> One talks about backlight enable and other about backlight level do you s=
till
> Want to combine them ?
>=20
Yes, can replace with "enable and level controlled by"

Thanks and Regards,
Arun R Murthy
--------------------
