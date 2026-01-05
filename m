Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB146CF2B33
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 10:20:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D418A10E3B3;
	Mon,  5 Jan 2026 09:20:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VA38nn8S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD17C10E3B0;
 Mon,  5 Jan 2026 09:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767604851; x=1799140851;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5RMPpk7vVmcZhjEVB67DnIl3Omm3qlqIBh+OMMA78KY=;
 b=VA38nn8Sr5tSfEXA67MqfUvjsgtfH/p6vwO8UolFhsuNe1AYhYtiVkxy
 HE+2uGuZyKtlG1rzN8oZUP/6Ke75+G/b1ZRzExmQYnidSmb/klissvs/R
 z1TQ/967itDUbPAwVuKqcAgUWiuCfTdnKXNPMFMBx96q/fKlUzJcGfkC1
 btNp0U9/fwTI6ZEmuxuK2PEsS/Ewd2WRuBMkNHpBBQogrs59rjOSNWh1B
 zJIx2XWKBd6YIWQSLQQTFTQZBT/pj1LFW7QwBbGZPSnzrQR1kcWBrdRP+
 1LyTMbcZEjk5WhpWJZnyTR7mr1q+Kal1/7x9WHkhIyiwG5i2sCGTTl8eL Q==;
X-CSE-ConnectionGUID: k6y0tncRSJifLAM4RRoAIA==
X-CSE-MsgGUID: 9lPPdansRtWtLql5Rs2tug==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="68163428"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="68163428"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 01:20:50 -0800
X-CSE-ConnectionGUID: Jpj2ZtLPSUaLfypn8Ijv8Q==
X-CSE-MsgGUID: 5yTjbEc0QcyT/mwvNDkvaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="203320140"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 01:20:50 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 01:20:49 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 01:20:49 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.64) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 01:20:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=er7F7sokAnAMWrDsREV+pbqwD0bTGlTPmtbRh9GB0c8mFoq6DGS/p4KZTvxHwGZCtbkN6hgHzhG4cho11gkwFZXdTo4XHZUe1NgEHxC63MU2XGUxSpvH1vsBKcthO8+D+m96D1l9rQUEJUt88pQa+YfCpz00HegN/ZjIpSDgNowNwaCKboYLc/+rGdUA/pynG1ZvQhz1jItZ16kZ7/HVlbjJw6VInxzDC+mgZB+e1Oi4zaVLjqYMOamtMm0bcpkgLdIc5CqY3wtPs88/V+DQKbA2y8M9fkcxZHDvG0LjrmICSVkXahBiFmAFQrVFaTB+xOHEEBuhveipBx2a3dGoyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VWZJocx5XiDSUFVW7LLGuL3/gU6z4YiYq38qbKmEdfU=;
 b=T2DHpdMmRQlen+Z0gJcJ/dkfX1rxyTVQGjghi5jQ4aKM2MuxX71F1M9OiNmUQEAkYnbyAcx7KNv+Q3/jbxhvHwVG3UG9bdMNr7k43xyrHYbdOuu9wFcK3p0QpQM08reLOVGMyFOlCp7AtZJiZWZ5rEKYcncptOD4zT3osN+gO9RHZIAAxnAyLZHviupo27/OOuSM8EsdyUYyXZvLcOvZW2uB2lBV/GT0tO2sD4RSFgzJTaGv3LFT+qJjnxHRRoSAxV2ZpS1VfFHUBBsX0ScWdmixGsYbzm5iJKLJNsxjQ3w6SeTGzuU14irC4P8CLrn/YUW9CzUenbnlm9p7c23p+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SJ2PR11MB8347.namprd11.prod.outlook.com
 (2603:10b6:a03:544::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 09:20:47 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 09:20:47 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
CC: "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>, "mwen@igalia.com"
 <mwen@igalia.com>, "contact@emersion.fr" <contact@emersion.fr>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "daniels@collabora.com"
 <daniels@collabora.com>, "Shankar, Uma" <uma.shankar@intel.com>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH 10/13] drm: Clean up colorop objects during mode_config
 cleanup
Thread-Topic: [PATCH 10/13] drm: Clean up colorop objects during mode_config
 cleanup
Thread-Index: AQHccLcH/6z9hmH/rkOmvZj+rHvbMLVDZ57A
Date: Mon, 5 Jan 2026 09:20:47 +0000
Message-ID: <DM3PPF208195D8D0AE608A14993B0E29472E386A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
 <20251219065614.190834-11-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20251219065614.190834-11-chaitanya.kumar.borah@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SJ2PR11MB8347:EE_
x-ms-office365-filtering-correlation-id: 2ebe8e1f-1752-4387-8aa5-08de4c3bb646
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?MQayDCLg6nSYSA1H/2b68PzxS0hAqNEGnMuL5kRPyUIVyyjETiMJJmNPZRED?=
 =?us-ascii?Q?eY4PC8ak02NO1TaqtnQKLcfmWF0Gyce3hnnm6C/mpGxsr4tQ+3m0BhgFH8NR?=
 =?us-ascii?Q?hiTLwh7GbQysdOnF9MN/N0kUWB+K31sq7zEDnKNfMM99u0fKhqeABuxmQCje?=
 =?us-ascii?Q?x94k7wSkJME1lsukLEUtPozYvEpMq0/zXaNCy78+Vded9X06cnOO8eyh00A3?=
 =?us-ascii?Q?Aq3nTKuRUatY6v9MCMG7xxbYJviOFiS8NdWs2zaW+nZOiDdhSgAkJiASvJ4F?=
 =?us-ascii?Q?+tvInHoXrtdlg9u9/qMwpD+xVnx8I7ZMEUDurDNYin7iO0LNnmqARIbY3iuq?=
 =?us-ascii?Q?/Hlv+LMpSdc97zzOPxVh49OSC7TpDcsbxIHIZ6/Ck3YZ7AcHGQWDDWnmetJI?=
 =?us-ascii?Q?Wi7ryV2plPrr/6C8KtxnLiPIIHyJJHb/K+v3ArMUOS9EsjRAP1pz3mIke5rr?=
 =?us-ascii?Q?GXOWOzXrSeYuommzMBMvHRSgqCHW51FC6Dy0MbS/gsAWWVdXfOtvSnjxgnZI?=
 =?us-ascii?Q?6pBheobg6KRp6sm0xjctisaA89oU7k5rRNH/+3B6AIWHjHHT3NdjfX1ykmvw?=
 =?us-ascii?Q?HV6J8efswJ7qhF33s8isdFh4WlhQyf7tFakRnsE2R9q7xghiej4+hfSHVLSy?=
 =?us-ascii?Q?ZgLVF5UPN28UKumnm/+Ug8g6Wucq0Qo7kE+5XBaASQx2kyFX02gHEnNcVNQ8?=
 =?us-ascii?Q?8xxDU4SVW/WWok6hk/Bd6Y2cpXbP57duYwSW2F/dSQDWhwZUv7OTs3Dz4aUz?=
 =?us-ascii?Q?SHG49Q76Pt2NA+j0yH+qj9B+cKRoHIYVY0rdEWslSiDSb4T6CuFsBygx39gM?=
 =?us-ascii?Q?YSSNAP6E1Zro9bOjri2/dsrJJYDw/tNvqsBekUQ9q0PjIqsO9AhNDBJJ0p7d?=
 =?us-ascii?Q?558MsOv/FCe71JEVz0QhQTNvmTAmFJrH15ahq1iXgVNSDUhTZNmO6KjQE5/r?=
 =?us-ascii?Q?lCIpv8WqG4YTwB/Z8x8lhg7jKiQpX8Ry9EUugVWMX5KpvWxnUiV/eM+/IpXV?=
 =?us-ascii?Q?pZW9iVwX/FFHHKPySy7BS6In5BGgWwDhkQiHBKjkoCZC3NR1ka47MKYjrPOm?=
 =?us-ascii?Q?WwibtDLufwMDKNuP9p+4ic1BbgDyMQjPLwZ2GRSKX4c/gSOMYAR9ER0kdivW?=
 =?us-ascii?Q?EoUJbB24tvL6qB8FF09eLVGBHq9Y2Pxc9OZvXFW+svH6Y6JXFtyd+jjBoc8w?=
 =?us-ascii?Q?CaSwtHa32a3n9KPyWxB6CCKlnWo6HksM7Sa5iqx5rp9NnQICgCAT1cbanlAs?=
 =?us-ascii?Q?knfTU0jJqEuWoJ2ePpyJbjooofnmPP9ep6ApYf/Aw2X3Sys4bvcptC5uwsa2?=
 =?us-ascii?Q?KmtyOmMb+UQz8C9UH5kAW/pONDBUMk6a/MsWxL7lAIZoygsOT7tVHsalGSgO?=
 =?us-ascii?Q?iQ0QrP/izKuzsH9EzM9KVyjyqM6xQS74BAtncHxoHivGZP1YsPe8Q7aWYYok?=
 =?us-ascii?Q?Jgs6wUxA+7kRMT80itls7GgFW6wPVivZIeiSIxWH7kgemyJGY6NeRSK0zpUh?=
 =?us-ascii?Q?AFhQkkL7hpuCLzmBOB83OWT32ocBz798sfx4?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dQHPChoLYv/uNX0oo7GYpZA6sFBuWmFOdPCCmVec9q9NZ/IIbroYbPp+qckk?=
 =?us-ascii?Q?qRrsK/BeC/g/JmU+/mxBCEWm6yDcW8XRK0j7IPHOCW4TT1tw2l9BsCfic72b?=
 =?us-ascii?Q?Axq2RIbLMC/BAwz07+B1Gj1zMGIA2cpWtIeMyVwHfwxHsqFTdAOQSSPO4erG?=
 =?us-ascii?Q?c03ZY7VHQuCPw/snPDUtIA9KivnZ3Ybb6dOfdPxopdd6Axsajw6uV6dpaqEk?=
 =?us-ascii?Q?ZCvVQ86UaOGn2nSTGwU3cZzYHgDujh3xueTv6X8daRvtUmoGmdAT75lRTLY5?=
 =?us-ascii?Q?D+H71FzWNiAsr6CM5r/7rwW4AIGt/Ey59aIZ42B1US9kpJiZ6TZn8Db8TCAn?=
 =?us-ascii?Q?RbF0hDkHJ7BB5FJqq8WbPfw1XK8MBc8NH0luN1Y6tsEikOjTUF/ak0SRqqo6?=
 =?us-ascii?Q?DgiH7lgvGwc2aHahSunZi7DDrU0yBLCDQQ6HFKrhnaoV0FP4n+UgSj0tZJVk?=
 =?us-ascii?Q?0ea5RL6SlUiDlIjPxny2law+j69n79N1/q709+pv0rFihMtcOdBuX8ntLDu8?=
 =?us-ascii?Q?t+leUfGeLCRaycUVDJXMVJNrgpg1khT58sLHq/WS2Vub+Q5O7Bia7vjK87CK?=
 =?us-ascii?Q?rvrNV7mtl8Aj6b/43NWjzzf8lInQAwtVt/3usOXLnIVG5d80iKoPtKTb2Chc?=
 =?us-ascii?Q?9GECSx7rkIHJ6wfvVEa/B+tfggmPnE9ezcAZW90Xehx5TyKCkkXvKUFxszyg?=
 =?us-ascii?Q?LjmlkXK+NII2eKqSVB39PZlBGJChwme5HNJc+HLWy53R+dtVVL3ol1XVE/Ib?=
 =?us-ascii?Q?/wva0D5/xb9wNBoTYE4UK1xNRobMd7jB3xHxD52UkhGNSFaC/sRpzU2GkRs6?=
 =?us-ascii?Q?eq2mccQlvyrNrU0Xma7Up7O0evIw7bM037y/b0/QOuN9L0i3fXcZHyFVe9On?=
 =?us-ascii?Q?8hMPyFzdlAq0iwB16zHBNKH2uhJLDoZSw7pLSGH7FY8xhpI2wgcw1u+x528N?=
 =?us-ascii?Q?c7wBKu75vgVSQhbliSld4Q+yGFTVkbfD72wi5D203YvTQN1dlBbGhbVOGnR1?=
 =?us-ascii?Q?21T//ul4PZrqAuLGcbPI/rcK4CEgad5lWjxR4UAcKsGBVihLNMkRzdeXQPeV?=
 =?us-ascii?Q?svoM4d6xvwPmrmroF6eZzHZeTK9DW8XEQFkglJjrmNiJtccM7D/hPk1FS7jj?=
 =?us-ascii?Q?oG99u2J0w/kt8rF7KbQ+mGT2JdKPR6hiUgJWYy8z/+wOO/sD/Mm/locIQhII?=
 =?us-ascii?Q?uEEKj6pXdFuShq229MSWhoKGjzhyg51yLO6YPuo5gXinEA33l9Rj2SOQ3YIU?=
 =?us-ascii?Q?MgiiRX+SRyeD52X3/QNhlqhoJrytRgdomX3RN4ZEp8ixW9hwSYjmV8cejqV+?=
 =?us-ascii?Q?SEgae60CCNtxqF/4fe7m9swbxg391BShTpifq8seWwKD2MbBZmuAzGyC83Ii?=
 =?us-ascii?Q?u4+GR0zHNB5ReIonE/0Xl2SI26A5R/ARM7cUoMQIlTutfdTbd5k+NjermFuZ?=
 =?us-ascii?Q?x6i/oKW1SB/l8Xwo8Ua0n7l7lrXMeHIu9n7PrNXtfMRT2C3gm+NyD9yEinni?=
 =?us-ascii?Q?0tnbR7uEzwD+2RHErZ834x44/BgTomJMTDAJ9n4spdc0Af9ughrqdFTtfXS7?=
 =?us-ascii?Q?Dz8/L1gTqOehYpTxWjPABIDylWT3yd4JpuHiMM4DKEmfGn/EuuKIFspT2k2x?=
 =?us-ascii?Q?fsY6vp63EZ1F8sn2gaxcUryV2ixhG5Nw/90w3EvoStNVqMvAda3st6sdmkn/?=
 =?us-ascii?Q?sTFwK2j99S+2zkjzZ5Ym4ZRizl8nTjyvV1t5G8mC/SuAPMF7XrgOE4FofCJw?=
 =?us-ascii?Q?T9+UhloK3w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ebe8e1f-1752-4387-8aa5-08de4c3bb646
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 09:20:47.7504 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: msMQbpbP1GRB3cElIiiF/7m/StDQTO+iQguli1Y56V1kyrDg0u1LoQnKQmbKxkw20vfwft5HsmHQSkC8V16KKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8347
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

> Subject: [PATCH 10/13] drm: Clean up colorop objects during mode_config
> cleanup
>=20
> Tear down all registered drm_colorop objects during
> drm_mode_config_cleanup() by invoking their destroy callbacks.
>=20
> This ensures proper cleanup of color pipeline objects during DRM device
> removal.
>=20
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/drm_mode_config.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_mode_config.c
> b/drivers/gpu/drm/drm_mode_config.c
> index d12db9b0bab8..84ae8a23a367 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -524,6 +524,7 @@ void drm_mode_config_cleanup(struct drm_device
> *dev)
>  	struct drm_property *property, *pt;
>  	struct drm_property_blob *blob, *bt;
>  	struct drm_plane *plane, *plt;
> +	struct drm_colorop *colorop, *copt;
>=20
>  	list_for_each_entry_safe(encoder, enct, &dev-
> >mode_config.encoder_list,
>  				 head) {
> @@ -553,6 +554,11 @@ void drm_mode_config_cleanup(struct drm_device
> *dev)
>  		drm_property_destroy(dev, property);
>  	}
>=20
> +	list_for_each_entry_safe(colorop, copt, &dev-
> >mode_config.colorop_list,
> +				 head) {
> +		colorop->funcs->destroy(colorop);
> +	}
> +
>  	list_for_each_entry_safe(plane, plt, &dev->mode_config.plane_list,
>  				 head) {
>  		plane->funcs->destroy(plane);
> --
> 2.25.1

