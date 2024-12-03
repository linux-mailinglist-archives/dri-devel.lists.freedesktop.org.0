Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4E29E16DB
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 10:11:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F3F10E999;
	Tue,  3 Dec 2024 09:11:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RSCzwvY6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72C610E991;
 Tue,  3 Dec 2024 09:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733217104; x=1764753104;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Q50Rx1lKa2VQBloCMK+kNkHAAIoTt4I/noFXsOZV5Bc=;
 b=RSCzwvY6u1ZryZt/VF3TuydD0/QCbAfI3uIZCAwEreKVJ5/Ra5hruKGx
 GuqjSE61mcLXQbmyb1k+cPG/uE7IJbA37wPAPP7t6XoF1P66m/ZhKCi6a
 dOmaR0UjAAGezDvdU+/0FZUodxpoFB8OW1A4DX+oE7oH9r0KwNbiGkD9P
 czMU1VKqUc6kBrpBb08WmknICAMsIeUunvRuRcjOa5KP9JGA6uJ7pIEU5
 gAPIbGzUEJYiSP4iRLiRpRNL/TogOBC4/E17Xj+pfG7ypR0cunLIksYeY
 jrfagFrnrzOk2TbED9x6QUgiIoIVyKfCzM0ljmEV0/XKKSwpYg5N5QWMS w==;
X-CSE-ConnectionGUID: RoFQtvfdQ5Kt5QuajtvhJw==
X-CSE-MsgGUID: JksA1qcKTm+AFkVpPKnZJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33476789"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="33476789"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 01:11:43 -0800
X-CSE-ConnectionGUID: n8fHczg1Q16fzRaClGtK7w==
X-CSE-MsgGUID: HK4xFYylTsiiMh2OPiYiVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="93266977"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Dec 2024 01:11:43 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 01:11:43 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Dec 2024 01:11:43 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Dec 2024 01:11:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RPkeeELBm2q49Y5VjFvbEXI0TRszbzRQ5PWHvEv07nRXFTofBpuHKUnRTC9N/7QTfTdfS+I1EjzpECxVWL37zjIi/5EDv7ec/5HZryvX+h9q88Jqzo9ILHXrQU8qP8BXeV41DpEghYghirsTNRCR7Czf5WcHaxaNmA04MI/EQrGSn/aGBrfFlXlbfKClfizwqe/RyPqyXEJ3k2NYDmn9zd5JDVkYvcP3YV19ak9ztipg4ZkdN61cdt/CGAoKVAhpPK2GwMqAhyl9xk0B6QDiD7oOBIJ0Wc91gUrF3S3oG8w3Q0wXPurHe6CVr6MCX1277QRRsOpXc2Z0ZFheFaHy7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQMccdRl9mNdnwD4ISvscG1fLIbrgFpWSkH9K2kxSIc=;
 b=Qi/kHSYpBhMaIcTV/5gWBhx8eeVsXeJYsWMwtdT8RgzToW5YrhQroJII0FlAvKBoGMh86q6MbTI+DbQf6JmCOc6tbPoVadSzHurWdlVZ/aFNqY8idYf6A32zX2fbdUJrDkVsYEvtO24fW234IoIQ1Iss9fWzP6d+bJ3u2LSQyj2V8aSYgzbbpEByevTcyiQBsNQ/JgnoNLnJh6QidugRgaASYUtMFKaI5XZJs1o8NzZyb2iPXODANnHq3oztUKOnoJsv9DF5pQuW2KbBualnhEC3OanY6nBRaT8V/Qn3h/C3wfQZnPjTMGIeP0sj6T+1cjZq3ume1PqMHNv5tAUUEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 MW4PR11MB7126.namprd11.prod.outlook.com (2603:10b6:303:222::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 09:11:35 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6%6]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 09:11:35 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "pekka.paalanen@haloniitty.fi" <pekka.paalanen@haloniitty.fi>,
 "sebastian.wick@redhat.com" <sebastian.wick@redhat.com>, "jadahl@redhat.com"
 <jadahl@redhat.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "contact@emersion.fr" <contact@emersion.fr>, "Kumar, Naveen1"
 <naveen1.kumar@intel.com>, "Borah, Chaitanya Kumar"
 <chaitanya.kumar.borah@intel.com>
Subject: RE: [v2 07/25] drm: Add 1D LUT multi-segmented color op
Thread-Topic: [v2 07/25] drm: Add 1D LUT multi-segmented color op
Thread-Index: AQHbQAXpU1S/uPZukEq1cG0c6VG4a7LPmNOAgASthdA=
Date: Tue, 3 Dec 2024 09:11:35 +0000
Message-ID: <DM4PR11MB63604BD886B2B5B0265CD4CFF4362@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20241126132730.1192571-1-uma.shankar@intel.com>
 <20241126132730.1192571-8-uma.shankar@intel.com>
 <loqr5fyomwdp7ip4vjk5onxdsmtttgtwh3nctejzcguss5phav@6amw6gzksokr>
In-Reply-To: <loqr5fyomwdp7ip4vjk5onxdsmtttgtwh3nctejzcguss5phav@6amw6gzksokr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|MW4PR11MB7126:EE_
x-ms-office365-filtering-correlation-id: 3fa8331e-db91-446d-34c8-08dd137a7c84
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?hsk5MEHjaETgVG8nL+jEDa0eDINcbUTlB6HTRdrI6ek5YmRIWgq4mx+TkXTL?=
 =?us-ascii?Q?UzhZ7z1T0g+v99PjZJ0np+DsCl1TrRWiEybQjG7Pl/3VbcHdPbKMRMHMjtTf?=
 =?us-ascii?Q?UBbIAnDVhKyhVnrlSLq/nqjyWlsoMNdvBMY1NEceZOpHvZvjKirhdYOq+PoK?=
 =?us-ascii?Q?GrximC9ltj9E4Cjq8M7Xmr9Oh9YmpGqiGmPLmxab0o8mRVBdg+gklXTcMFMX?=
 =?us-ascii?Q?FmNuywNSKo/9MH2Fd1TYT+ezlCUrL5soNPaFDXznM/m4S/89IfjLitwpneIc?=
 =?us-ascii?Q?KQMO0NGK1s5/4iwp3sRaV90fTQPqGZn5kpZDiP0ablhffP3x5hb0tNJ82J0K?=
 =?us-ascii?Q?2R9GM1v2NNlLQsciBspREA98eNxj5H+xDenKMqnGNpBwa23oQcfYcrWE/OBI?=
 =?us-ascii?Q?uRLg5APAcqINQBbdIcsH4aLO7eqnCiWm23B8oWNajdYjJrxIRM0mqWycDMDX?=
 =?us-ascii?Q?AMODTMaaRVQ75fsRQBTQJDePs07Pp7VDBvA61POofgHVk3N5xc0V5QIA6Ad6?=
 =?us-ascii?Q?gonGkT8SfQ5hnlVeRlfjKmqliebPhI3NZGYFHpLaU9Bz07ME2+aSVnF5/WLk?=
 =?us-ascii?Q?m/Wl/F2Isy5/1MBVx0YgyLeVFPfzZlDln9Yw1oVQfvqAEMOlgSmKnCKMj6MI?=
 =?us-ascii?Q?cQwBnlUJZDuvtP5/uOX8qvu/aJM9gvazeGbFflG0lV+VgjgThI4oLz+1p14q?=
 =?us-ascii?Q?GwMTrIaiX8rec33QiM2xpPirEGn4pix+c+EOqYmDxT8/2yZ32cDLU4WTnkvF?=
 =?us-ascii?Q?dlxFlSmnwSs1kPi+JM5SsoeK0BcosGwMDgmLBHu7FFcV3e0NT8vMbhfaZB9P?=
 =?us-ascii?Q?D7KUDmzuZA+SGkwWtDjQezsbd4L/9rl2MvKp4uaJKthL+3XeqFUvFm6YeQu0?=
 =?us-ascii?Q?Z7aEnlebsgw0nfQpyXrYq1JKelCfM6wUz07Ts4/6/2Mn4Bw2WfvtuQqF7obN?=
 =?us-ascii?Q?pq3RPUW54Fe1J1kzqIED912yS/Y8Wv52P3h4ChTzoabaZMXi2sN31XlbAmzA?=
 =?us-ascii?Q?7bBTByHYyTnGqIfq8jDwMA0DPV2myk3R5JG3UPR64pEQJgfliEHXjb+Rb9ZT?=
 =?us-ascii?Q?kToWjM0XxlBvs+UPTe8GP07GVctM5LI+XtKpZLxbol5GQebiYb/FgyWJL7tB?=
 =?us-ascii?Q?diw6nOaDjVfsmdaGXpT7de20nVyRbPjyhCEK69ugIDGz1CRT/4ROGlzXeGoq?=
 =?us-ascii?Q?dkSwumev6c4rUhBQGsfALRpyWxn+QThhL/aoylyo+DT91Tg5fwgn0oalq0/p?=
 =?us-ascii?Q?/7x2VZ4GcwKWNGEq9Kk2Sw92+1She4Nu+D5YyNGSl1yWJqw+ut9vvSlowAcU?=
 =?us-ascii?Q?RYvAO+tOPWwQT+g2IwaTaVDpHpsoxVN8VImlGdo2/fZzKGY3GDgMFSCf+hL5?=
 =?us-ascii?Q?yiuyBkpm+wRkaomzekkv7Rz8UcUYjFK6+LUT0v7hYXHYq/8FmA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DyBnCm+7kxJaIrwHwsX/XBBx7JB7d/26U1dqzWnP32OkyRJD24S6vfagTtTl?=
 =?us-ascii?Q?3KQaLu5Mc5Q8zt4XppYXjWXM8W2Y7WmP24L7Y+G+lgp2xSzp3t1MHjNcoXWO?=
 =?us-ascii?Q?N0KcToAzPQwavJmi5TdX9YK71cxMqSQ4xH/xkLy+Dl/HgMGEHCUc5UQM/7Fr?=
 =?us-ascii?Q?LQ8sLIiGiJv7IggVFU+IMUTRgvTjEO6VtluRtGHuuzJY/AdeF3BrBOSfi3KG?=
 =?us-ascii?Q?vvxWm+KzQ8M++NqqpotKY6aThDHFLAwqQbTDsDnsxLhsLEItDMUHO43emUNI?=
 =?us-ascii?Q?HGX3iybheFfy9gukx3scK5jTxOUllmaJpASZ5y9DdYOEW6JNdx09jSOZKgJh?=
 =?us-ascii?Q?kC9kIMxMBQwEG4wW2Plt531YcE9PgV7v8pTd0hweEF4k2lCpMqCpkRQ5oV4w?=
 =?us-ascii?Q?+rharCFlNEd6SU8RN/AXxfMfAryQhF4hE9k53cou8YJgTf3f+aIF0JlR8+yS?=
 =?us-ascii?Q?x2VVqoGF0wfF1PRav9D1Ida+JcXWa7Npx7QLfebzb81IHS0QUaOpNqpeqO3r?=
 =?us-ascii?Q?oLtPjatq7Z4zxff0+JGP72NWrxS/K6mOond5usRSKbQ0SIJHtRyaqnFDGrw+?=
 =?us-ascii?Q?N9tib20Zpg5WWC+Nm0SwzHDZK8bbYdYvkR2FKuoG1IEIU8Zu8dFxw8eYcK+m?=
 =?us-ascii?Q?Ibir30tD1lpeg0FoVBb85b1Y2Rh1esTlUHIVCZkYqx03tJg7g6gzJofyjrqC?=
 =?us-ascii?Q?6tmfjEbrJRG9Fd97A3aAiymoXMxCqnQnFFC1rWHRLU4XAeg6G7IOAccbdZ2J?=
 =?us-ascii?Q?woqP0sbDBhx0wzKPL/GF9VgRoNXB4zsfVioS3nfibX3u6XxTAYOQcJ0NTo+g?=
 =?us-ascii?Q?6Srl9adviN2Mzmv1XJDR5cJkgwE92Fg4m3O5s83KxPMbKHMtIjGP7tQkLs+0?=
 =?us-ascii?Q?F5As5hOIOX8YgdeV/QLYlCAhBEBB6MmaIx8EqKWAymqTBavKzIdQYF+9xr9X?=
 =?us-ascii?Q?9lXp1D559ga5BzqXXIvJuDoV8rhROqIPjPJEhzy0CXSna/TBqPe08Z7MzQwG?=
 =?us-ascii?Q?kRNKDiuOBOmIV6/1MICjnxfmj70CnyRsuaWxdQl9aFvBX3sukJzrzA33bnIo?=
 =?us-ascii?Q?FWbFJ3dsaTFi58HoeaYZCdInGOTgHZjE6WyHbfFdDLw0dQOOz+ctZjppEa3/?=
 =?us-ascii?Q?uKmDdxJKfs2iUKFlsxf+nCezBustj0YnTNasy0pE/gk8rXf3EkasQQ3tu3gr?=
 =?us-ascii?Q?Hc7ZVjNDAct+2rKzofF1J1plesgqbsRKm2FmCkVvyrALx8dsA+ymvZbf18tQ?=
 =?us-ascii?Q?TKPaqb8YHCGEYrDlXXuMMpfdt1Ctgm3GnKt5Q/FQfLJqSLYRaiy2AQ8f1TGk?=
 =?us-ascii?Q?CElQTVJ5fyeK4IK8vdHEXivBJVmF9Li2k5ldn7dAueVOoc1D6VQqJ2aHkmF4?=
 =?us-ascii?Q?b52bzNWoNt2Lks0jYuujXH5+qRmqMGwnnxNPe7jrH4tMGm3S56KSgxGBDwgh?=
 =?us-ascii?Q?FFkPACSoyvtux4MGbB8AWFUT0oxbiXibm9hwfsL3cxqJsuobdmYMesl1tIkd?=
 =?us-ascii?Q?NVFg0X4znVzWca8pcGYmEdkiHdesIeY0RUvMZSzPxh/S/BLJDQQwL/axUB9d?=
 =?us-ascii?Q?+M5Rg5dE6EvuwjAbdFJWUCmbNa5+YWxBj8yja6GH?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fa8331e-db91-446d-34c8-08dd137a7c84
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2024 09:11:35.1950 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 60cFdH2HTqSLnihK3gu2Q3a9Xz59BWyPR6X9JfEx3FLk5x3VkIHnEf128tjkJBesivA8ERe3XZmbhwdgAg/4HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7126
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



> -----Original Message-----
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Sent: Saturday, November 30, 2024 3:14 PM
> To: Shankar, Uma <uma.shankar@intel.com>
> Cc: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; int=
el-
> xe@lists.freedesktop.org; ville.syrjala@linux.intel.com;
> harry.wentland@amd.com; pekka.paalanen@haloniitty.fi;
> sebastian.wick@redhat.com; jadahl@redhat.com; mwen@igalia.com;
> contact@emersion.fr; Kumar, Naveen1 <naveen1.kumar@intel.com>; Borah,
> Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> Subject: Re: [v2 07/25] drm: Add 1D LUT multi-segmented color op
>=20
> On Tue, Nov 26, 2024 at 06:57:12PM +0530, Uma Shankar wrote:
> > From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> >
> > Add support for color ops that can be programmed by 1 dimensional
> > multi segmented Look Up Tables.
> >
> > Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > ---
> >  drivers/gpu/drm/drm_atomic.c      | 4 ++++
> >  drivers/gpu/drm/drm_atomic_uapi.c | 3 +++
> >  include/uapi/drm/drm_mode.h       | 8 ++++++++
> >  3 files changed, 15 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_atomic.c
> > b/drivers/gpu/drm/drm_atomic.c index 8a75f4a0637a..f344d64d42ce 100644
> > --- a/drivers/gpu/drm/drm_atomic.c
> > +++ b/drivers/gpu/drm/drm_atomic.c
> > @@ -802,6 +802,10 @@ static void drm_atomic_colorop_print_state(struct
> drm_printer *p,
> >  		drm_printf(p, "\tinterpolation=3D%s\n",
> drm_get_colorop_lut1d_interpolation_name(colorop->lut1d_interpolation));
> >  		drm_printf(p, "\tdata blob id=3D%d\n", state->data ? state->data-
> >base.id : 0);
> >  		break;
> > +	case DRM_COLOROP_1D_LUT_MULTSEG:
> > +		drm_printf(p, "\thw cap blob id=3D%d\n", state->hw_caps ? state-
> >hw_caps->base.id : 0);
> > +		drm_printf(p, "\tdata blob id=3D%d\n", state->data ? state->data-
> >base.id : 0);
> > +		break;
> >  	case DRM_COLOROP_CTM_3X3:
> >  		drm_printf(p, "\tdata blob id=3D%d\n", state->data ? state->data-
> >base.id : 0);
> >  		break;
> > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c
> > b/drivers/gpu/drm/drm_atomic_uapi.c
> > index 46cc7b0df6e8..326159bff91c 100644
> > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > @@ -720,6 +720,9 @@ static int drm_atomic_color_set_data_property(struc=
t
> drm_colorop *colorop,
> >  		size =3D modes[index].lut_stride[0] * modes[index].lut_stride[1] *
> modes[index].lut_stride[2] *
> >  		       sizeof(struct drm_color_lut);
> >  		break;
> > +	case DRM_COLOROP_1D_LUT_MULTSEG:
> > +		elem_size =3D sizeof(struct drm_color_lut_32);
> > +		break;
> >  	default:
> >  		/* should never get here */
> >  		return -EINVAL;
> > diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> > index 9ed8b1b1357a..d126a5410eea 100644
> > --- a/include/uapi/drm/drm_mode.h
> > +++ b/include/uapi/drm/drm_mode.h
> > @@ -923,6 +923,14 @@ enum drm_colorop_type {
> >  	 */
> >  	DRM_COLOROP_CTM_3X4,
> >
> > +	/**
> > +	 * @DRM_COLOROP_1D_LUT_MULTSEG:
> > +	 *
> > +	 * A 3x4 matrix. Its values are specified via the
> > +	 * &drm_color_ctm_3x4 struct provided via the DATA property.
>=20
> The comment is incorrect

Thanks Dmitry for spotting, will fix it.

Regards,
Uma Shankar

> > +	 */
> > +	DRM_COLOROP_1D_LUT_MULTSEG,
> > +
> >  	/**
> >  	 * @DRM_COLOROP_CTM_3X3:
> >  	 *
> > --
> > 2.42.0
> >
>=20
> --
> With best wishes
> Dmitry
