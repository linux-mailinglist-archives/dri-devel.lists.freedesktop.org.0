Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B24259D4C81
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 13:04:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40D010E8F1;
	Thu, 21 Nov 2024 12:04:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gQb0TCLq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCEA910E3FB;
 Thu, 21 Nov 2024 12:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732190688; x=1763726688;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=piUOSgQMoBHxx9m4xxAHPjPYyTAIL36Glj/AoCNj1EI=;
 b=gQb0TCLqcPq82JJB+F+bW7mabW9TfmaiTqOj7jXyOV2fu6cNbu0TAB2L
 KuF0hYMZfV/Mrd78NdMiZGkDF2b9oefT9gud/ek7fdTD0ZBtwCUgP59XK
 4cYqG5B90FFFeiQ726lZxKRM5tlfmvJcSSpSnR4goN3mGsHz3Z8tkqOe9
 6QDwNxPx9jFuzElun3YPFcAVMhpi0q94ACacJVorl5Fx8AVrrbY0W6839
 zg/hCKYe0/I4dsYyjHhfDtxrQQDxCfcpKK2fdLaWtDL/bw5op29DTB9df
 BiVahgSPIn3sP7dHsxWr+KM3zMtSQk71hMhmeFMx/NH1bcYLgZfJofuV0 A==;
X-CSE-ConnectionGUID: zbS3VHFaQHagc7E47eieWg==
X-CSE-MsgGUID: /UZHpw+xTAukMLUwamQF4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="42941520"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="42941520"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 04:04:46 -0800
X-CSE-ConnectionGUID: hplZBTC9SZu0OYqhOgSmKg==
X-CSE-MsgGUID: EDdMI7epQvmMUIteKV+4MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="95038415"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 04:04:41 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 04:04:40 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 04:04:40 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 04:04:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eoFcILBTeZbADlBUJxP/CGkweltAH8aRZqwU4MBzoisTJqmEKJfQvGb8J8O0ez3pwJn2cblBCHfaSd7+eLh7Nia4ZAtXL9qP2exMKHpjF+WoU5Gs7/iBrtWlJtbLnXMJsDkPQfPmuYJniZFJ0KDtJQEVvJmojmM4dEp/5hF6wflohAREu0cwYh1AI4jyP0EMU+RxhkYJsWx7hOKHLS7dNjQ9Mjpmrbb3uzlX9sYaGQGSo1ul5WuIQU0vio8OPWLk/lgh4SWAkHK/3Ay8xhb5lZ0W46RMJJZinmTL6QPEdOnIwNeq3IjQjffJifT+fRm4FpG8dpbK9g1ZuXtUE9A+mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mS1U2MySzZRsICE8PACtSPDkEoTkdEOXbwr0UF+why8=;
 b=fBeEwcQrvVh5VZaHtRggHVaZ2Ga8GGhzvk6Kr+FkOfqTj/D3VRoijQ4PeKnZZPTz19iiS/2VDJoZSTQ9qwsFb+oIXPM+T7idNfI3o5co6btpzUnC3mKOJNqJsQzoataW/ezenFXjMxo1wwLV2osT8C67uwmXCGLMPSvny1eqz02BYVD61LTsV24xBfoXx2oH86teTenLfj2DxnQBlGpGEfgEG64mCSjX6Wjppgp5jDIfmu9Q99AeAABtetvEn4vyxlSN1X8anX4qRERuTK0R3BGSB+6ZoP3Xg88YzwcqRsNcZlUkHqNFxmBl5uLb5G0lH25tmOSmsbnWFN7z3N64YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by MW4PR11MB6910.namprd11.prod.outlook.com (2603:10b6:303:225::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Thu, 21 Nov
 2024 12:04:38 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.8093.027; Thu, 21 Nov 2024
 12:04:38 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 6/8] drm/i915/histogram: histogram delay counter doesnt
 reset
Thread-Topic: [PATCH 6/8] drm/i915/histogram: histogram delay counter doesnt
 reset
Thread-Index: AQHbOnGG3iq/Tp6vREupiHfdP7yy9bK/4vgAgAF0A+A=
Date: Thu, 21 Nov 2024 12:04:37 +0000
Message-ID: <IA0PR11MB7307557051DC10C7904CAB29BA222@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20241119104521.575377-1-arun.r.murthy@intel.com>
 <20241119104521.575377-7-arun.r.murthy@intel.com>
 <SN7PR11MB67509E12E0CB7AB44CA50434E3212@SN7PR11MB6750.namprd11.prod.outlook.com>
In-Reply-To: <SN7PR11MB67509E12E0CB7AB44CA50434E3212@SN7PR11MB6750.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|MW4PR11MB6910:EE_
x-ms-office365-filtering-correlation-id: a0b705d9-da86-4ef3-bd96-08dd0a24ac2b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?GftDx92HZthb4BgXZb1b48abcWgzV8omjAkIKCJfO7nDLSEaKfkje/gRQ1TD?=
 =?us-ascii?Q?g31cFJ8ZNH7h8GQ0EpfPLSTQhF9u3mkl0JpG9AaMw5XiqXQYiUyg3wu696lF?=
 =?us-ascii?Q?oP/xIlTd0RoSX75lb8r/uD4qhpUyrOKx8NHtb2d0SfNRyQCIDdBsVNNlMWc1?=
 =?us-ascii?Q?n7TrnVSriIHKJU8fkwtENjZqYW8dD60cUEExAnqP+GTojrEtSM2EggObsVlY?=
 =?us-ascii?Q?mt87l41xN6ubMsmk+NkndreTa0/tczy0Qk+ue4CBkLk+IXygEn9Pwc1Uudjr?=
 =?us-ascii?Q?Yc2KJSNg5kqy2fImYP0sk/hKV17hysmUCR6v8rS60cc4dd0SdyYd7qFFL3s1?=
 =?us-ascii?Q?G+VqwwhfULnI/Z0aqIuLYoYU3CrphSZRhXrCUE2ENJKulfBvlK1eWW6vTPJu?=
 =?us-ascii?Q?G2pBL1prS5GiCwWE0LZ8XEx6242CjtGOX737fp17oAO26JFs0fG6kEGnJwK3?=
 =?us-ascii?Q?kHNFja0lLzUZxfWGHr2g0evkNhAn3EpsU+DnVTv/RgUThZzjzYzdHH2d1fmr?=
 =?us-ascii?Q?VLqGGzKCdTO23Uur61L11qnw4UH8892CHOCs62mKjRgGLm2YPr05QX9BwcCd?=
 =?us-ascii?Q?zN+tpFyV+0qYhZTLSUzUZ/LYbBeKMvMDm+1MvDDa8ykUw7FkPByu0HElUeU8?=
 =?us-ascii?Q?nvP4fiKbNeeBrMdRRfbTOz04DCEWFIDjW2nyGEltE1I89ypG85bC0WmzJDOY?=
 =?us-ascii?Q?tcsNbwj1iJQ4LE+DdUvW90JMrizW4ckhhkwJM9+78xU2bVNOHLVjl1ptbXvy?=
 =?us-ascii?Q?DU0r+PhwvVA+t10+3Z7r8W+SvdbbTPCqX6IOLqEZf6Ekq4RA39jESSvVq+JA?=
 =?us-ascii?Q?Bjbf/frlah3qA4LZVJderrGPTp/Y8QdVzQmCy5Ga0DZQTZ+5Qs7c1fH2n+4R?=
 =?us-ascii?Q?ejtdkfrjemvaAnpCSzjlQsoyZYBDSvqJYzf1KjDUIKC5AfgkaW+2qCTQRo95?=
 =?us-ascii?Q?lBLV/2m/iVRPZjfGbOP1R1FhKdWgtXHOtZv7HdmJD2yQ/50jGRvFd1iiylR1?=
 =?us-ascii?Q?aE7BFjZ0SVA75z0+VAB0SkKIIu0XwMdkAJMjvI6voIDuTi9WkaYYsqSwUvoM?=
 =?us-ascii?Q?pm//F2cPOHCRKT7lLdOMgTCYWBqxYvytLlVZjmqNPzvm0+S0WCI8BdD7+RIG?=
 =?us-ascii?Q?1X3yrtTqNKOcoT2cLIC8quVcjUTnHJd6Ox/KzVa3KYKsQ53MEmEOkHofXawx?=
 =?us-ascii?Q?8An8JePchIqeG6GeHm/RbHiUdSqMmWZzWGp51iM/YyAkDfpGhsfvNmSFGdKz?=
 =?us-ascii?Q?u3ZIk1tImkWq8lChqLHfTcYfup9lJPRGakiOE+Qj1ZPq46q9J1uz+MUKsKGf?=
 =?us-ascii?Q?Ga6Nq/yq2vgB+db7E8lHV+XRjB5jAYtPB2dSxzHofkw34vxukpvsJPYDhsok?=
 =?us-ascii?Q?1ONeGQ4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?InnxPRAzwzVERQ2TIluY+XGP5Br64Ij6RJp79FTT/x7ulj70MrxG6eWfELBS?=
 =?us-ascii?Q?OgQYSZyesmA16A2MTTy73yfky/oXcWikjE+YoPXxiwYqYk97hpGGhpJHzm1U?=
 =?us-ascii?Q?RSPcd59mmyAVwUuMAY3yiZ1t3VDHWon2+mln++w2WXyCkPftGllD0CiFl7S1?=
 =?us-ascii?Q?PvkIg+BPrUbFlyRVpjajtd4J8+EU9WL1KccN3qGniHrSAlsbEyBXJIOxPX3V?=
 =?us-ascii?Q?lUOf1n9GjuBUEqucT8gWVqtAWQCtR55ZTDe7D2ZDBj4sUWconGmeTkR7yAc8?=
 =?us-ascii?Q?3rw5FKBzikRlivPnphSfNpP0i7WqbPvswI5SOhz8N74O0PKVqLhQEqCJHxoo?=
 =?us-ascii?Q?ujqE2mZrPi710R2UbgeZ0nkuFkg0ZnY66iBrgXBsdYmSiHpeyYFxw/kWz1hU?=
 =?us-ascii?Q?vfbcfooDsHme4GFcTQG7XJQllVFCWEmnJdYc4KypzkLT4wsThLSbGcJP7mLt?=
 =?us-ascii?Q?X8et0mG6yOYagieEhHz9LAvgRY2sFvTVTslkoebajoGZdMFSLqnGpjcTVFE3?=
 =?us-ascii?Q?OwVqR3s9uasjFDcSWfuv10wmzMumfc8v5RNrQ0sCT/VkLbGJR5bNwUSEEJ9O?=
 =?us-ascii?Q?DG3Xs6/qsQox/4L1ZBCeBhZKkcrSequaSa0R4sL/MhM3aWLa4+Z5BHvSmECp?=
 =?us-ascii?Q?X/eleYCeIc4b1Dchk8TzI72zjYikXx15Sf7vV5Y+w06q4CTecBZxgVqst6MH?=
 =?us-ascii?Q?X51bslfe1DSbBE6at0VodrviVXewQPoPyBbXT+xbZIf3vJXr69WpSBUcKDeY?=
 =?us-ascii?Q?igHnL0/KCwa17cwBhttgDDWO5q8VRUrNgaooMd31X+8+LkVxEuCLhBQQXQcE?=
 =?us-ascii?Q?gifDYxflWZpWGCLcGrH/NZvfLLKHesGdAbBL5AvWfT5sFW8qe4i4c+6RqFN7?=
 =?us-ascii?Q?gFRtZ2wAUYPyGKUPWSnN+AUzTiruUykxOQ6Rr+J+K/+psnAIe8wi8Gxch0MK?=
 =?us-ascii?Q?+nzdS/qoVkRvA3fm4JdhDogAL4417cTm4RlHMlBS7aXUUY5bUb4mz5zwLKLm?=
 =?us-ascii?Q?NpOr8K6slH1myRexXCAo7gTlEDFL844TCxtetCgz1AmSfUwGin8QccotcjlN?=
 =?us-ascii?Q?KXAiT9G8gOSEJpQ8hRnQ1gTDIeR15VSnaV0eVL8dCMG+eeUgEEbZhF/n9Cwx?=
 =?us-ascii?Q?xCqdlgXirLcLSTrbXaL0G9UOPcuAyhdV6PxIa2smfKytGrEjE7/w86fbT7bc?=
 =?us-ascii?Q?5xfyyQDv6erpmPw2WT1lgVqfDYiPsfsnpdoRMcn4wTE4Z3yhMmQ5PDY68QKr?=
 =?us-ascii?Q?XERYOji8Z0xl9sWYNL6Z7z5sjiFNwX4Xm1YpBiLvDTPuHYFYtXAM1nIyiqH0?=
 =?us-ascii?Q?ew5rBzNZAe/U1QpHEyAbBvmiW10NDlLASS8cUS+7suGtzpKzKJze3RrEgrH1?=
 =?us-ascii?Q?r1cakWwV0TYizkE/aSVM8jJ3Lr6ypq1tNdR++A9GxyjQ5+YM6lY0ARFti/cm?=
 =?us-ascii?Q?sTXXSo0HVdhdf0A1sSisNiFrPPlwbnKqmqBKxwRF7aiBabBgzXyyHvT6cvAB?=
 =?us-ascii?Q?QgI8XiYEh9t6taY5JyFpetA4+pey1kKjr8DIcaOsCMYe1m++NQEHelEygVow?=
 =?us-ascii?Q?bjsrRdn+4Pe3rM6tKfgGrOyUVV+42UpIbYp1RJ7O3W11NtdTcScMXON8uJyh?=
 =?us-ascii?Q?DHoMwKrHGWnv0fICe8jvGGFMaJsWWZtT960owseBFAP0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0b705d9-da86-4ef3-bd96-08dd0a24ac2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2024 12:04:37.9895 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3rrRqBqZOsLZPwS5XkM+fP6otqmKvpHHLNltMSRT40i0LO+9OmEaLuuKH7q2EbUz+/wfOGMhmQP1BM9B29mKbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6910
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

> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > Arun R Murthy
> > Sent: Tuesday, November 19, 2024 4:15 PM
> > To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org;
> > dri- devel@lists.freedesktop.org
> > Cc: Murthy, Arun R <arun.r.murthy@intel.com>
> > Subject: [PATCH 6/8] drm/i915/histogram: histogram delay counter
> > doesnt reset
> >
> > The delay counter for histogram does not reset and as a result the
> > histogram bin never gets updated. Workaround would be to use save and
> > restore histogram register.
> > Wa: 14014889975
>=20
> This should be above the Signed-off-by
>=20
> >
> > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_histogram.c  | 17
> > +++++++++++++++++ .../gpu/drm/i915/display/intel_histogram_regs.h |  1
> > +
> >  2 files changed, 18 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c
> > b/drivers/gpu/drm/i915/display/intel_histogram.c
> > index cba65f4260cd..fdcc64677e96 100644
> > --- a/drivers/gpu/drm/i915/display/intel_histogram.c
> > +++ b/drivers/gpu/drm/i915/display/intel_histogram.c
> > @@ -74,6 +74,11 @@ static void intel_histogram_handle_int_work(struct
> > work_struct *work)
> >  	struct intel_display *display =3D to_intel_display(intel_crtc);
> >  	char *histogram_event[] =3D {"HISTOGRAM=3D1", NULL};
> >
> > +	/* Wa: 14014889975 */
> > +	if (IS_DISPLAY_VER(display, 12, 13))
>=20
> We have shifted to using is_display_verx100 so you can use that instead A=
lso
> there is no display ver 13 just 12 and then 14 so maybe this should be ju=
st
> display_ver =3D=3D 12
>=20
HSD mentioned above says display ver 13 ADL.
The commit 5eb2e7855910561a07d4cedf9c898624899b057b changes IS_DISPLAY_VER_=
FULL to IS_DISPLAY_VERx100
Here we are using IS_DISPLAY_VER()

>=20
> > +		intel_de_rmw(display, DPST_CTL(intel_crtc->pipe),
> > +			     DPST_CTL_RESTORE, 0);
> > +
> >  	/*
> >  	 * TODO: PSR to be exited while reading the Histogram data
> >  	 * Set DPST_CTL Bin Reg function select to TC @@ -94,6 +99,12 @@
> > static void intel_histogram_handle_int_work(struct work_struct *work)
> >  				"sending HISTOGRAM event failed\n");
> >  	}
> >
> > +	/* Wa: 14014889975 */
> > +	if (IS_DISPLAY_VER(display, 12, 13))
> > +		/* Write the value read from DPST_CTL to DPST_CTL.Interrupt
> > Delay Counter(bit 23:16) */
> > +		intel_de_write(display, DPST_CTL(intel_crtc->pipe),
> > intel_de_read(display,
> > +			       DPST_CTL(intel_crtc->pipe)) |
> > DPST_CTL_RESTORE);
> > +
>=20
> From the WA it seems we need to write 0 in the above Guardband Interrupt
> Delay Counter (bits 23:16) when servicing interrupts And only write value=
 read
> from dpst_ctl when enabling  dpst_config or doing an adjustment
>=20
Done!

Thanks and Regards,
Arun R Murthy
--------------------
