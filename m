Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B971A919BF
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 12:50:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F9310EAA6;
	Thu, 17 Apr 2025 10:50:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QaOIBAKf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9441B10E082;
 Thu, 17 Apr 2025 10:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744887044; x=1776423044;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iOP6GXGMpdgr6B6g1BJmDuYuxjZhHNYDq3ZXxqUzpQU=;
 b=QaOIBAKfes4LzzW8bJvL9QMI/FD62etqxT7qFoCL0WX5O0LZ7OvozFNc
 uHePJn2Gco8bmj2drRuGpNlEZbUFtcJ1oyZ9kXDA5bvvGCw51/B+LYfGO
 wNSfSN3J1KtYJGcxQlxEMSzocUzTxaXsjZHCnarxhWVEpBtnoJvlhmtce
 Jsf3zzZY00QJuNMVTKYgeODsxAByzcQlFMP6rn5EYSBaap2JwObMfk6C0
 87W2rUteavNdk7SmPS41B9+2W/WODkr7owPcNlzUcgFxgHSaXorjH/MX9
 gKQ3PzqgUbmczUU0NauLnc3/j5KrmOFvu2togIZnVmpz8NqAMSgXwSQK4 Q==;
X-CSE-ConnectionGUID: XOkEnyahTxGwTMmfDTQ9lg==
X-CSE-MsgGUID: wI6T8sL2RgWrQytUe+M1Yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="50277098"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="50277098"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 03:50:43 -0700
X-CSE-ConnectionGUID: oAiGepqpSZ25UoKq89peRQ==
X-CSE-MsgGUID: yZESoPQpR9ijmTVnEdCaRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="153953418"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 03:50:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 03:50:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 17 Apr 2025 03:50:40 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 03:50:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cIWzZAJmYL5CNygTwY+f2REMq9/wgEsw2vXsOrH22HOXL70EnbvjDwCgsm9gmUJo6vRf89RHZgodEq1rQotNHRxldCNo27zQAniY+lFsW9XGnZccm7+aA2D/swE3CzxAKuLcYiQ9m4SeaG9FKAEfTgaciAJC1NaogGqSki75BjVMo8G5ec+pprMcB+X5WW/dGmkmJgdbi99FLLDpNSV35IjHNRTExL22ok/w2HM/0HfI621KJMtE9hqWixWHPr6pIMguoM/+j20r6EsdB7Uee6yKoFtvvIHzXgy3Zlh6brOPUnDqj6ix6YYdSegvJOD5/Z5hyproj5VLS3tS16V6Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3zDwhf6pvTelQfiiXD8hFqb3khocrpr8DFDbyYnlMME=;
 b=MTK8f81U5nuvZFtZI0vduVLb7QMVuEemPkwYvOU8x5Nx4zz2U/h1cfL+BzvZ/wC6oNCSpk1rPDAvHXcyJIbylVBkqNDKKsU/sK9eeAHYiLfoTwp+mXWpdx8fY0r0Sfx/0HjfmDB6iA9fUAkzq+lalql+WLvYiG0HacoUpbqsGpFqJtLApNXhTupyHryifkRmjocslQvbkG3wgRSn+o4Oky8xje9lslM1+Te24MfBtSaKuKaRHAosLFImObdoaiQGo7pfXuAVkTEjbYfQWJ3yVuvz0ZdOpAn6kRDCsJN+YnDLY5l/xYwU+lZ3huXRPtI3hfPreS1hfQd6KCcZPqJP3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 SJ5PPFD56E32CC2.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::859)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 10:50:37 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6%2]) with mapi id 15.20.8632.035; Thu, 17 Apr 2025
 10:50:36 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Kandpal, Suraj" <suraj.kandpal@intel.com>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "alex.hung@amd.com" <alex.hung@amd.com>, "Vetter,
 Simona" <simona.vetter@intel.com>, "airlied@gmail.com" <airlied@gmail.com>
Subject: RE: [PATCH v8 01/14] drm: Define histogram structures exposed to user
Thread-Topic: [PATCH v8 01/14] drm: Define histogram structures exposed to user
Thread-Index: AQHbcZ6jXhYSgYOyEEKLl41inbOvPbNLZHIAgAFIb4CAALFTgIAAw7qAgAJZPoCAEMRaAIAAGCgAgBlURICAAWQ0gIAJNjGAgAHDf4CAAVEvgIAfdQmQgAAebwCAADrjwA==
Date: Thu, 17 Apr 2025 10:50:36 +0000
Message-ID: <DM4PR11MB63609D6DE2066CA087F07D09F4BC2@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20250128-dpst-v8-0-871b94d777f8@intel.com>
 <20250128-dpst-v8-1-871b94d777f8@intel.com>	<20250217120808.708b9b4d@eldfell>
 <c423efcb-5ab8-41c2-af0a-621007c6175d@intel.com>
 <20250218181819.11ca41ab@eldfell>
 <cd095fd7-3043-402a-9e21-c0c85c53f8e3@intel.com>
 <20250220175047.412ee8d4@eldfell>
 <95a3e35d-2c5e-4861-b7bf-f38815a44e14@intel.com>
 <20250303112010.469b9685@eldfell>
 <IA0PR11MB7307CCBB82AF958121A6B3A9BAD92@IA0PR11MB7307.namprd11.prod.outlook.com>
 <20250320112309.1d9c3e09@eldfell>
 <IA0PR11MB73070374E14C44DA1C7EDFA3BAA62@IA0PR11MB7307.namprd11.prod.outlook.com>
 <20250327105925.1e9e8609@eldfell>
 <IA0PR11MB7307082B787829CA3569F25FBAA02@IA0PR11MB7307.namprd11.prod.outlook.com>
 <DM4PR11MB63600B85A21E03A5E6938652F4BC2@DM4PR11MB6360.namprd11.prod.outlook.com>
 <20250417101806.08df0731@eldfell>
In-Reply-To: <20250417101806.08df0731@eldfell>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|SJ5PPFD56E32CC2:EE_
x-ms-office365-filtering-correlation-id: 74ce231e-d4c4-4d68-0549-08dd7d9dafca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Yn0Uh4ndhkARAISS6oP4GSy3yULJq1E4SCOpTEeOPMEz5596SuWlYe7eF3wg?=
 =?us-ascii?Q?UGxdtpCOA69EzjjrwuIBFq47YoThLFPlD84aUSwMHgkZbVVCGdLt5eHRCLRV?=
 =?us-ascii?Q?wHmr+tbbGdUU00F9mf0Vh0VmSpzjpRSN8syRfVIIdvCCCn9c3y1rTYgngCGA?=
 =?us-ascii?Q?SV++rtW2lxii8kuX6kQKqhCrN9QfSFhJWmz9WJEpsHdBo3eaXrpocMxzL1JX?=
 =?us-ascii?Q?2NdIf5hD2FUAWeHSA2HzSCsOdW20s0560dZm5AnQgYfSF6DPyQBn9+nqgZes?=
 =?us-ascii?Q?fJvXbAMuIRovDYUGeFXsCYFw+QuBvELmqYDFjchHCUT3D2xFPrQ5u21PQ3na?=
 =?us-ascii?Q?kR0fR/8Ga4Kqzfs1oTstKcm/cZ2MQrOt414Dde1TtcatC8EAIvmoscHxNG13?=
 =?us-ascii?Q?opMKknS0kroFQ7qoTqv2UfYVPNwZbykv5X+Hb4hcCm370+gmdIS4Qp6+3lOj?=
 =?us-ascii?Q?ktukgNTmcZTL6ZfU8WwIZCsg6IAYNedp+be2KABkXi2N6m8cZHM7XWyaMCdB?=
 =?us-ascii?Q?NvFG8ENlyWFlf5jthUJhFkarWZtNCRx4F2eNl0prkuOMgQtwfAkCgpL9X+6J?=
 =?us-ascii?Q?7T1c2UsxwwTb4N7tOODgZTL8jYNwus31kxcgCAK8PVy2CHXJQeDCNLjhDt2C?=
 =?us-ascii?Q?M/GEoQnsxdTRfcFBlqY5d5MH7zllF778yUCg7MGV5Qe5cE3YM11fgXYLGWD0?=
 =?us-ascii?Q?n15q5TCyMwdbyvQnwobHjxgeKrPeC/js13xjkRTbAQoR5rMPMbalPWje/Nmd?=
 =?us-ascii?Q?SUjqc9QVhoAKYkisN9ujEBv/g/GT7y7Rnm3WPkctTnZnlpvHbg26HLWyGt/g?=
 =?us-ascii?Q?ath7LsBOb5UZ8BnC58HnNg4mG/1p32Cmm1pIgfsGHW6TMe+Kp6sIdNe2gv4r?=
 =?us-ascii?Q?DLqjPDllaG+CT1t3idUb5AhQ6IlHaS6bZJw6oaAmCxy5jfINKC8M11WBy3bV?=
 =?us-ascii?Q?neB01qmlvogCguXHgRZDeijs1URO5wC4yTBrsflN4SdVuXJuFls1qtRoYn0Q?=
 =?us-ascii?Q?gM0iVJCWL4oJ+kBlQ6fdleJz0VGk9BD8jMLiguqezrmWc/uYXr3TSTtO3lK7?=
 =?us-ascii?Q?iJyup+vXL1DGzMGik23zM9xuI4x17bfAll/9jjfojbZgnZry8RVn38ISeKl0?=
 =?us-ascii?Q?cKrcInUlP/HH6geln2TcylLXsyL90yddb2N61B7CJFuqyyL6avFPB8ryacjS?=
 =?us-ascii?Q?Sd14f5txtnzpAJu7qzg+rrp/2i0W558n4CGXcTFzPdHI/UGq4faRGI2x5CPJ?=
 =?us-ascii?Q?QEMqUjc+xm/NC/Mdezu9ODC6sbekMWhMKUZ9kmJ/tNZROX81zfrO3oHEYS/+?=
 =?us-ascii?Q?tbtNmJ0nq11oz/zSD4vT4/u1HiHCfgjeazjJsVTXjnA0etV3nifKblmBQYhZ?=
 =?us-ascii?Q?0a8YtWGBSM/YobX5YE1qhYzc2hJVem1QPCZhk/fOqV+b+gl3udaCan8KyVfU?=
 =?us-ascii?Q?XxnhWuYvISY4g8jkiSGYbdX7asaPtDaenEEZLpvt/1nOpe0mKKHyvs9LGEbj?=
 =?us-ascii?Q?LnEfM4/qTETkHB8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PeVpO/4X+OQTbWptVA9NRi1hr30zUZ8LslyfJ432OawMK48QxST58GetZr9w?=
 =?us-ascii?Q?sdOSloIoo+Sy0NVbu+2EFqiDuuNISKlQMOnE9JtOLPqVGurNiNhQwKsFPTb2?=
 =?us-ascii?Q?knFHJd7YNdq1psOBXVv62EFOyz9YrePerMVqt/MXVPsY4N/ocOKN2UYXmSvp?=
 =?us-ascii?Q?JRJsArJwJDTSR60S0AamXuWvpfAWlhP6YaK2Yg0IJ69nWBb09owRWtlNXx+G?=
 =?us-ascii?Q?IQRM6C8dLZEtK+WdJd95PC/9C2Oe5Fg1smCKMwskGIYGoh44KfQoI5cTN0RS?=
 =?us-ascii?Q?o+jB1Ajs7SYKOFUQTyqcaAKmrOdpm3ChlKt/hExsPefYC32Ic8g2LacIlUOD?=
 =?us-ascii?Q?4CMxeFGGZwsFIHgkdqfXS7T1ujPl6sqffa6hWCKRCDP1PF7IuUrqCPPCnXZu?=
 =?us-ascii?Q?/v+eVMLQtbmsUjzKJ0um2y49yHNlCK4JX5HWQmMtMM5ci89VpaGJZz54WhpF?=
 =?us-ascii?Q?VnN3drPd8beJUS1rKjbmRRAKGpNoT8FMj/OGOX2kToBJlgHuo71wTQ6o1mIi?=
 =?us-ascii?Q?R20GnqHdnEDCBtCQrHa2BU1OkS/rcwEWIXXvZqsL4CugrxDUyCXHmWntMTRR?=
 =?us-ascii?Q?JbQwCThwVjPz9eKYaTOFXEAKkrctdSUVP5h/LhIJs8gtDM//dVqkYP68Ztpm?=
 =?us-ascii?Q?mpqJ48zMliERMTUU718Skr0Wdzl6e9gQ+A1nT8bozQYcxnDT17FRVVWvCJHt?=
 =?us-ascii?Q?qwYnV7HramzOSn8TCWllRvhldlph2F+tZmx2uduZKWO4RaooJFF3jasSMaEm?=
 =?us-ascii?Q?CgySxAYCq6GiCUFp3OAa6AQ6aTjL7G4ujgdJ4tWklInYTFcYxjJQ3lALqB+A?=
 =?us-ascii?Q?u0+r8YsC0DgIaHRgXDZt/Tp0h8Nkwq0MK9pnSqM6bvlMU7djtsVVFCiJt27g?=
 =?us-ascii?Q?LVt4vSl2gWM3DZ2BqM1XSHTneMbgi00O8OQJm289RYZhqJ/aDRckWWw4wBkC?=
 =?us-ascii?Q?1TbciH3wd+1AqyUwzTJ7CjYNqH020JxGe5AFQbP6nrYYCnswncZ3U6g0Uk6X?=
 =?us-ascii?Q?XIaA6v5VTtM19ZrceUhOk9I0gEqGp3V5GVIB+NAJCqNoctdaZqbvSH69TVYN?=
 =?us-ascii?Q?5B1++oDZTM3a9WfQVOJffCVgtYioXxO6L6MBOotNrlTRnvpDeEgWkIvlTqRo?=
 =?us-ascii?Q?nONl/vXSSfGzqMDFCLHpGiCa+WJb04cZMv064e77sVIJKIpNtZ1vVj7cnXJ8?=
 =?us-ascii?Q?mR/1PTTzcEZYGWyPORJlamCqr1oQxCvf5OkW4+zS8+OF//kx41cPkxxCgad2?=
 =?us-ascii?Q?AyBUczdphW2nrALzM4idT1/exENGgKl03d4GcKitmi6b3eYOlGzjjt5236K3?=
 =?us-ascii?Q?TKzqtFXdBBPZmzjPoswxGArSOZ2ePC925bi+i/fY0NNUN/BWRVOh+mr8jpJP?=
 =?us-ascii?Q?uXR2fd+s8qoVwxqlVufbkt0nmq/cCvcMXwW63FKdDQiuTSQPojafPFIiFYOG?=
 =?us-ascii?Q?AjQQKy7PB2FWIQKdqDRv/AqBTB95OeCq3jtSDjIYXOHXw+NLugVaC4Ba2bS1?=
 =?us-ascii?Q?VOM2L20di6JxTtzqtYx12UajBiNDDfT3tYlDGzh1kcyfE1c01sTq1k/rL2sb?=
 =?us-ascii?Q?CE3wK/7Fe0bnrB2tg8mlJ6OXIH8qIENvc0YO53O+o8jpmaPLD9eKQ23Y+kj5?=
 =?us-ascii?Q?8SJgQGhSm1MjXmKnABNhOGv1N+M1kp5i+b1sCLpMhXEA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74ce231e-d4c4-4d68-0549-08dd7d9dafca
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2025 10:50:36.8725 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AfoQgr9HskwYF3UiPOf8Ho/FV6Al8E0U4ft0AwvPKeH3vnuixHYxbKRdJl7KClt50SLPI3GiOVUJzSiqxZIBnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFD56E32CC2
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
> From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
> Sent: Thursday, April 17, 2025 12:48 PM
> To: Shankar, Uma <uma.shankar@intel.com>
> Cc: Murthy, Arun R <arun.r.murthy@intel.com>; intel-xe@lists.freedesktop.=
org;
> intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Kandpal=
, Suraj
> <suraj.kandpal@intel.com>; harry.wentland@amd.com; alex.hung@amd.com;
> Vetter, Simona <simona.vetter@intel.com>; airlied@gmail.com
> Subject: Re: [PATCH v8 01/14] drm: Define histogram structures exposed to=
 user
>=20
> On Thu, 17 Apr 2025 06:31:21 +0000
> "Shankar, Uma" <uma.shankar@intel.com> wrote:
>=20
> > > -----Original Message-----
> > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > > Murthy, Arun R
> > > Sent: Friday, March 28, 2025 10:36 AM
> > > To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
> > > Cc: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org;
> > > dri- devel@lists.freedesktop.org; Kandpal, Suraj
> > > <suraj.kandpal@intel.com>; harry.wentland@amd.com;
> > > alex.hung@amd.com; Vetter, Simona <simona.vetter@intel.com>;
> > > airlied@gmail.com
> > > Subject: RE: [PATCH v8 01/14] drm: Define histogram structures
> > > exposed to user
> > >
> > > > On Wed, 26 Mar 2025 06:03:27 +0000 "Murthy, Arun R"
> > > > <arun.r.murthy@intel.com> wrote:
> > > >
> > > > > > On Wed, 19 Mar 2025 12:08:15 +0000 "Murthy, Arun R"
> > > > > > <arun.r.murthy@intel.com> wrote:
> > > > > >
> > > > > > > > On Mon, 3 Mar 2025 13:23:42 +0530 "Murthy, Arun R"
> > > > > > > > <arun.r.murthy@intel.com> wrote:
> > > > > > > >
> > > > > > > > > On 20-02-2025 21:20, Pekka Paalanen wrote:
> > > > > > > > > > On Wed, 19 Feb 2025 09:28:51 +0530 "Murthy, Arun R"
> > > > > > > > > > <arun.r.murthy@intel.com> wrote:
> > > > > >
> > > > > > ...
> > > > > >
> > > > > > > > > Hi Pekka,
> > > > > > > > > Sorry got getting back late on this.
> > > > > > > > > I totally agree that the UAPI should not be any hardware
> > > > > > > > > specific and have taken care to get rid of such if any.
> > > > > > > > > Here we are just exposing the histogram data and what
> > > > > > > > > point is the histogram generated is out of the scope.
> > > > > > > >
> > > > > > > > It's not out of scope. Understanding exactly at what point
> > > > > > > > the histogram is generated in the KMS pixel pipeline is
> > > > > > > > paramount to being able to use the results correctly - how
> > > > > > > > it relates to the
> > > > framebuffers'
> > > > > > > > contents and KMS pixel pipeline configuration.
> > > > > > > >
> > > > > > >
> > > > > > > While working around this comment, it looks to be quite
> > > > > > > challenging to address this comment and agree that this will
> > > > > > > have to be addressed and is important for the user to know
> > > > > > > at which point in the pixel pipeline configuration the histog=
ram is
> generated.
> > > > > > > I can think of 2 options on addressing this.
> > > > > > >
> > > > > > > 1.  Have this documented in the driver. Since this can vary
> > > > > > > on each vendor hardware, can have this documented in the
> > > > > > > drivers or ReST
> > > > document.
> > > > > > >
> > > > > >
> > > > > > Hi Arun,
> > > > > >
> > > > > > this is not acceptable in KMS, because it requires userspace
> > > > > > to have code that depends on the hardware revision or
> > > > > > identity. When new hardware appears, it will not be enough to
> > > > > > update the drivers, one will also need to update userspace.
> > > > > > There currently is no userspace "standard KMS library" to
> > > > > > abstract all drivers further, like there is libcamera
> > > > and Mesa.
> > > > > >
> > > > > > > 2. Maybe have a bitmapping like we have it for histogram_mode=
.
> > > > > > > Define user readable macros for that.
> > > > > > > Ex: CC1_DEGAMMA_HIST_CC2
> > > > > > > In this case histogram is between the two color conversion
> > > > > > > hardware block in the pixel pipeline.
> > > > > > > This macro will have to be defined on need basis and define
> > > > > > > a
> > > > > > > u32 variable for this bit manipulation.
> > > > > >
> > > > > > This one still has problems in that some hardware may not have
> > > > > > all the non- HIST elements or not in the same order. It's a
> > > > > > better abstraction than option 1, but it's still weak.
> > > > > >
> > > > > > I can see one solid solution, but it won't be usable for quite
> > > > > > some time I
> > > > > > suppose:
> > > > > >
> > > > > > https://lore.kernel.org/dri-devel/20241220043410.416867-5-
> > > > > > alex.hung@amd.com/
> > > > > >
> > > > > > The current work on the color pipelines UAPI is concentrated
> > > > > > on the per-plane operations. The idea is that once those are
> > > > > > hashed out, the same design is applied to CRTCs as well,
> > > > > > deprecating all existing CRTC color processing properties. A
> > > > > > histogram processing element could be exposed as a colorop
> > > > > > object, and its position in a CRTC color pipeline represents th=
e point
> where the histogram is collected.
> > > > > >
> > > > > > That would be the best possible UAPI design on current
> > > > > > knowledge in my opinion.
> > > > > >
> > > > > Yes this would be the best design, but looking into the timeline
> > > > > for this CRTC color pipeline can we proceed with this as in inter=
im solution.
> > > > > Once we have the CRTC color pipeline in drm, will rebase this
> > > > > histogram to make use of the pipeline.
> > > > > We can also take up the crtc color pipeline and will also start
> > > > > contributing to get things faster but since there is not
> > > > > timeline defined for that activity, would it be viable to go
> > > > > ahead with
> > > > > option2 as in
> > > > interim solution?
> > > >
> > > > Hi Arun,
> > > >
> > > > I think that's something the DRM maintainers should chime in on.
> >
> > As a first step, I think we can expose the Histogram through the proper=
ty.
> > We can later hook this into the crtc color pipeline once we implement i=
t.
>=20
> Do you mean upstreamed as well?
>=20
> How is that different from the original proposal here that I raised conce=
rns about?

Hi Pekka,
I meant the option 2 as an interim approach to get the visibility to usersp=
ace of histogram
blocks which can be extended further once we get the full crtc color pipeli=
ne in place.

Regards,
Uma Shankar

>=20
> Thanks,
> pq
>=20
> > A userspace implementation showing end to end benefit of the feature
> > and usecase would be needed. Hope this is ok and no strong objection
> > to this approach.
> >
> > Regards,
> > Uma Shankar
> >
