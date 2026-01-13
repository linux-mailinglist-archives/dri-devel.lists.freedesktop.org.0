Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82599D178EC
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 10:17:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B59410E48C;
	Tue, 13 Jan 2026 09:17:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F4tJC8oo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 725C410E48B;
 Tue, 13 Jan 2026 09:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768295859; x=1799831859;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MpPdbC9CxSPhxIUZ5Ef+sW9HNHpK5T1kv0bmSkRBdss=;
 b=F4tJC8ooQ994VZge0Dzb4fN0bBPXFNq0elM4RMrL5Fl8OT8VCcnGJMRx
 XXw6ut+7cvdTU1usydofZD3/dFuYe27TZAtQQ9hUbdp3Pc6lYV3ZzxehI
 gLMeSakttTvep2xTlYo8BrkTQuUlAjqJ6srpupYWXt+AGurffPE6KHlnL
 as2jvzQagFmsGhmqPzk0fMqyxf40+y0fmxTQNV14BjPgW8Bjz/ZwAV107
 1MDY70m7kkaNIJ7ocFysK+ycE+Q8ld3GqqJAOJydzCaXn/VKueHESB2KQ
 oFo2kmprvk9oAgTYQS9pN6ttlWPJNP2EX87x60CL1CQ00uzH7YJpNDhiY Q==;
X-CSE-ConnectionGUID: tyc9jRjhQCi+t35V5K2H3g==
X-CSE-MsgGUID: o8d1hZEfRpCWEufvNcreSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80221772"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="80221772"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 01:17:38 -0800
X-CSE-ConnectionGUID: Qc6+fFemQSyaRKHyC1u4sQ==
X-CSE-MsgGUID: nORbGHvmRt2S2kkyY3jYkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="204140552"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 01:17:38 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 01:17:36 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 01:17:36 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.4) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 01:17:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZBNz6cDEXpOWVf+qwNEmo31R12kym1W0LATDls1NoFH7M5RCd6ir7RO99Whv6cb/+1dq733IfbrzkvSHjCmGlYhspefujsIZ/BwVI/98tdFwyCRczirVleQ2VsD74Q8dZiWhFzlzbeYcrP90HWV6FL8wUUYcivmZjWodxpXNHZmVOGmGkuSqBnTIGR7TPwhphxNAgXYngT3o56neZY3+TS8jblEDBKfJoh+Vw8WxGHD/TgGzrRKYUFC0+bFlYH/7W+2EVS4Sb3ThU6vd34KbvWrTITidXS1AtPkphy9OhJaVVbkc20nH1quQoV2VbVSTsOVug2EOL1SQHhtaHpsXeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MpPdbC9CxSPhxIUZ5Ef+sW9HNHpK5T1kv0bmSkRBdss=;
 b=hGDKyi0YD8aKNzumSwItAG60/v84EEtMFgZT5qNAtyo3jPg9V6Zio1wSmbnlrPWldkmjYnBPYYD0lK4Y5m/34zI1FcZFieBDlqJirUyp9LBvEQzTuZvj5HPctOJOK6SbeHUojJO1N1DbozQSGS6wRsHyJt1BUxp5UBOyaKXHKDnBDPm2TT73fw7W5wOo5qjD67R/Bz+NAbrclUqZ25h+AzqXFXEhVLneUj/FJN9HY13gcg6yL5R4kwD+e3506NZ+f1Fszs62jUVzNRfuAA7dpXBZEWuDS81xBwDH7tFuq8MDva5+5KhMSp1xJfCBWjsoOCFFsXeKoMSm+cSyV53VoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8768.namprd11.prod.outlook.com (2603:10b6:408:211::19)
 by SJ2PR11MB8452.namprd11.prod.outlook.com (2603:10b6:a03:574::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 09:17:34 +0000
Received: from LV3PR11MB8768.namprd11.prod.outlook.com
 ([fe80::154a:b33e:71c0:2308]) by LV3PR11MB8768.namprd11.prod.outlook.com
 ([fe80::154a:b33e:71c0:2308%6]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 09:17:34 +0000
From: "Kumar, Kaushlendra" <kaushlendra.kumar@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "tursulin@ursulin.net"
 <tursulin@ursulin.net>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2] drm/i915/bios: Use get_unaligned_* for VBT block size
Thread-Topic: [PATCH v2] drm/i915/bios: Use get_unaligned_* for VBT block size
Thread-Index: AQHchGuYo5xTvaMiJUqCMxUmwFqM/7VP0dlA
Date: Tue, 13 Jan 2026 09:17:34 +0000
Message-ID: <LV3PR11MB876881D2E7BBB949B4DDD57BF58EA@LV3PR11MB8768.namprd11.prod.outlook.com>
References: <20260113085553.2736470-1-kaushlendra.kumar@intel.com>
 <a5360c7a7d3804e9a99eb2eac74a8250a56b08d5@intel.com>
In-Reply-To: <a5360c7a7d3804e9a99eb2eac74a8250a56b08d5@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8768:EE_|SJ2PR11MB8452:EE_
x-ms-office365-filtering-correlation-id: e1bb48fd-e425-4c58-e4f3-08de5284968d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?xQs2exteRksWRPyxpcx+jzBKIHq3mfqH5a6ztFNm+iOnzJQioZ00eAYogZis?=
 =?us-ascii?Q?Z5TgfMDMtgVITYJyl6b15pOUf1SKbgCp3PmCh2Pa1ledL42mFNsGWqnubsHi?=
 =?us-ascii?Q?Fx0XtEFx98FCMmyma0QMpH7NWCSdfDFdCDeRkJUeySBiBWasTygTTNhUKI4F?=
 =?us-ascii?Q?NuLuzvtTFhbuHC4TUIA1KstF5mjoYghuFJxom/HcvZ0bhrrnxjcFHAEJrYDK?=
 =?us-ascii?Q?hhqGMSgS5pJKqrVM6IGwPYj0rayMg2r7mrZtlYmIFqJNvudFLMSaAOVIb2Pw?=
 =?us-ascii?Q?DqnphuUU+PLS7pCYDXOH4gTTmwK1Jqe2TOQZLfadbYrBZHqTksXsSH6wmZ3O?=
 =?us-ascii?Q?BKyfoEVZpcSnHb1lNP3V+ZDI9WNEQWMdI5rKrdNVOaQB9qZO53r1fhKPWx6X?=
 =?us-ascii?Q?U/GZbGHJYD972Q7vo4MF7L6NKslfhYxZMOubriK9OCKcKiNH+PfNhxr2L0vB?=
 =?us-ascii?Q?k1sIFp4eqJQ5xi5lJBjf1sRN+vikAyYTh03HEjRNdvsxlVJZ6/CD0sjm0PxW?=
 =?us-ascii?Q?2mahCwSq11E3tWG6vtlpbXpj7P1ND+nhre/DESMaPivD8/PuarLxfYiIL4AU?=
 =?us-ascii?Q?N5t8qcXWYCBo1YcU/n8EOArwBCoUvCD/bd3X9ZqN9uqrZKnGkA0RhKWfiV1C?=
 =?us-ascii?Q?f/TVYzTX6Oa33ucFQqljayax8IFe6EHK3qxeKEDk3Fqw4Tq5f+XVbKUSu0jp?=
 =?us-ascii?Q?G8J4Jw3fy/vqtsEYinC4PC97qmtyqkMQbclQ9opaEV/6OPz0cPRjoeOQM/n0?=
 =?us-ascii?Q?E6P2MEwx4RYOfpwAdqXbXk9Z0/D4JrrfHS2wcwGlw7x7Nuc0dYPfdIrRisk+?=
 =?us-ascii?Q?RSgi2XU65MnP/DQEXQ2TSEycbtUmil8ZSCsuFKcOXz89odhMNzUiw3eXAgvu?=
 =?us-ascii?Q?T66jgEvRMecPBQLWn8vcasAHOs55sESmcp3ExdRVfqZwq756b4Uo4AZVEjNF?=
 =?us-ascii?Q?PQpCSYQKtIowv7i0PycYkIu1F3MObfFFToM8vtWrJjsNvg7QPyJPjj/qe1zz?=
 =?us-ascii?Q?f1CMBX1M0NK5f6DqudDKTQ8OYl/8SzZoxZuINe8EaLb4SI37EFRhtU7ZlmvX?=
 =?us-ascii?Q?dNH1nDQ+LQAui+z9erFqmLSrJHzRiperafzzk+jhNnP+vfRFr681Im9NClVq?=
 =?us-ascii?Q?Uq9LpudIdwoOGUqPDQgyO4fpvC+3nbKB9QPYP8qTulXxRmCjnYOt9FQOhAdg?=
 =?us-ascii?Q?R1yRYqNfOPdrm791E2YildbDKKEmOh7uI6t0WSo9g/U0UI70CoMwUBhSfCES?=
 =?us-ascii?Q?VGb9lNLwCMB317tPptbiw0tKMSYtvQkzVbVbdN2hDRuQajxiXXaJdNexJ1by?=
 =?us-ascii?Q?/AL5cHRKoeXmMl/3HQCGnpNZjW3+Q4cShFDHop0sa2wWIi7NSgDInVmhqnC7?=
 =?us-ascii?Q?9L6m8ksAjDUif8EwbwuC2RADy5Hc0Fh88cgxOP8JfE+KYusGWXuTmQ+h03CV?=
 =?us-ascii?Q?KNOy4cNuIctMzFE+biUOg99tz3+PTNMgeO23i7YswUjuLCdMuMRxIOCvofz1?=
 =?us-ascii?Q?yN7KohfnOX5btDC847xBz3/uKSUQ3ivtH7bw?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8768.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ar2XoJjq8Gt30OHi8jy7h3EyidFcOYkjyPJuDktCvoMFKUhdXxDX+hk7vcIo?=
 =?us-ascii?Q?5zO4y89MQFT16Eq/3BRQXutMd4VS+3ihaNbhzbWoPKDCHmAUPt1mo9PTRnDs?=
 =?us-ascii?Q?VMW8r+wG8jsSUJgul/o40PCeK3rgGnlmnIsosx+Psm9IFWXf209naRZi5Re9?=
 =?us-ascii?Q?mwh5Pt2h/2TBrl5OvQY77Rjq1uW5A2Bj4ElIK1tIyYCM3Xbcy7cGvGCldz4M?=
 =?us-ascii?Q?j8E9jvzK+DXwxJxItJ//pf8pUri8OjVHVtu22fAvTauUJIR7POt4oX+BYgSV?=
 =?us-ascii?Q?LQdoFU2XrluPzuL/OlTGDoFilAWwTO+n1ZTuWfIThDMxKGLsAl9kJbv1kGUe?=
 =?us-ascii?Q?KO7SnRfp66/NBm64dTKarlcN5Dd7hfR2oLsyCR0lCSjK57JcJsnUnoH2TTU4?=
 =?us-ascii?Q?mMtqXPbi/LnhtEANA26+xNylZUPGyvpQJVAp3hLPOdakGXQb2jJrlp/HjIEA?=
 =?us-ascii?Q?2EkJYCA0TUks4vazHHiQUyDRiv7AyH6JKiF9FrXMAn6XOyIGamdLx55zNqOc?=
 =?us-ascii?Q?qRqjYCCdxyO7xYjwafE/9hHE00pAoGlrYpIht6wbOLmM3emZUKudlhDpgZey?=
 =?us-ascii?Q?coSpBneQ8I+ROJWy4X/3mX7J8lF2LHTyLTIbSCMIU6ajEETkXN4HsYRQZiL+?=
 =?us-ascii?Q?5wwYyzwtlRBspa2Q8n3j6o5ORaFFwU2YN8t6RhcKGyAzWhP4ZoCTcAN8aYrU?=
 =?us-ascii?Q?XbazY+p2TBGeVEiPSbh3pZ3YMRacpJrbfynwEM3Q48Fq4fLCtGzQl4PpRhFm?=
 =?us-ascii?Q?rIGa2CNuc/9wkgSRFd83wuh+sM6OYOa5e6LxL5XA4xl3zO9REMgh2w9phtWC?=
 =?us-ascii?Q?AiSCtg7thRCZroT1pFbhx27+3x5zS0pfYpr8XNJP/5FBGX6nzr4j9+S8Gqnt?=
 =?us-ascii?Q?pF0jvw0+5CcugBZl48Ha4nSFK1zUBzmoA6eHAayz+phZVxV2pdZ9rpq68sIo?=
 =?us-ascii?Q?Wl+Mtt9j2MBbej9rFRBN2DDLgOp/fEF8xGoquPnaToFpQTpGTQkKj6vcv4hL?=
 =?us-ascii?Q?8tIfNKSht7yalsM5S+dLI/8o1e0krdpy574XmB82ABiA1CfnWlVctYgRsGT0?=
 =?us-ascii?Q?BJGoitxy72MK+YAqnYEEp/bKWDhacKhfoZifHTlSZq1Kn29hcYyv2CQcpKCp?=
 =?us-ascii?Q?h4fh1PWSKrk/QbuA0kD00rr3vM554zU3P7/CGXvXjkaVt/1kCuix54WG++zz?=
 =?us-ascii?Q?3SyI3w4dgsUugJSMEo2dgJb5m4Aidl2TzYFQJGT86mzTQ9A1aBXb02my13cc?=
 =?us-ascii?Q?Nh0bgp3IdMJTFyLcjPsdhR2JbotR/YRHnxO4z4aU/sijG0l3SV4ZOLM8sAIu?=
 =?us-ascii?Q?b67gcflICOm8g4p+DpECezTmWPu5j5alVYPlSL7GQTksIRg/UUKmJ11RnDmF?=
 =?us-ascii?Q?mNReYNj2vKQ0miafuhD0SlQrlIPiAU2k81nRNv4l1qB3fzL7jZ4kiJ/WoNNL?=
 =?us-ascii?Q?zC9qboHkZ2GiwpOPNKX3a/r+nDrLWo2RT1SzGdgKmoO9Xbwtl/p6jIrjUVdL?=
 =?us-ascii?Q?cQXc9gm+KlIz6Y2JCGKkYim4/MeOT7SkCNn3rh3DPPzBtfUTYETXBHphIQhd?=
 =?us-ascii?Q?r0fs9mLbZO/K9NrUJkfd78iU3gfJb/Zc0uRgZeraV72Fsxj1WPAP3Ka1SiEQ?=
 =?us-ascii?Q?+6ucpAgT9QDQADTD0wASVZDK1VGnMvV+dhMtTmmtN34+KmyBdUALSfKuzlda?=
 =?us-ascii?Q?HeirHo1W+31/0ezhYl7x880NLfEUf5vglbnqKKuyUbqEqaGimRb/ZAdbVMxS?=
 =?us-ascii?Q?FuDniFfhFw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8768.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1bb48fd-e425-4c58-e4f3-08de5284968d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 09:17:34.7790 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: twf8zTKbDhtZVivYjLicHgb+jvChSauUDr25gVF8507E04gWwlXtPwkjz55Z5NjeEMJOa0vKHHkg3VYiw+P4jUYaVOH8keIrQLfQ0yWOfxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8452
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

On Tue, 13 Jan 2026, Jani Nikula wrote:

> And what about the other *((const u32 *)(...)) etc. usages?

Hi Jani,

Let me check at other places. I'll update all instances in v3.

Thanks,
Kaushlendra
