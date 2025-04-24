Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F40A9B355
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 18:05:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0466F10E179;
	Thu, 24 Apr 2025 16:05:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GWqP39XY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A764410E179;
 Thu, 24 Apr 2025 16:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745510701; x=1777046701;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BuBtLTbiMP7bGmaa/qNVFxrldJB0DD+aOiHTeak0zw4=;
 b=GWqP39XYaTqZS711N/kuY+O5nb4eqquvqsGbUZFFdqkpmPfr7+kC6Tk7
 lefrF5haLWk/e32EksBKjfxH/ofzNNd8w2UNKNJx7er70WcwDJyIMh9NU
 N/QPSxM2leq6uB7Ahjmccn0KE2QvUDW+TKb/3s/ka/onejLlu8w3317qF
 Ojjy+/L2YR33Lp+STLfXuFoyXddllaJxlGa2IOcUgFnWGa8hXNwqP9P1W
 VSg8BKJU0NjROtl0qFCmhWOPXGblyiXOThEc08OeNAxHzdvdvrThoo5Ek
 /8c/EZdV9bggWNFreov69QK+sWpIPCUjwknpkSvvMAcmtf3VxflKqudh+ g==;
X-CSE-ConnectionGUID: jsXhkDO+R3OCKf2v16jdkA==
X-CSE-MsgGUID: vwKKy9bJT365GYU15I2UjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="46274827"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="46274827"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 09:05:00 -0700
X-CSE-ConnectionGUID: Bq+VEXwJTcyHmb3/eQqCmg==
X-CSE-MsgGUID: c4tmoDZdSbuqSw9T/WtaVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="133580394"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 09:05:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Apr 2025 09:04:59 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 24 Apr 2025 09:04:59 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 24 Apr 2025 09:04:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IR14M/FdKPiDwScJFdGmHDJOjQGjwYQy/DBuy2/GmBnf/Wb+rGyO2wDDRr+HgsUcG0c7XTRhEOQYlhsbBq1vqBNjygktLA/YEG4JosDmr/dkM7wVhBgY9A/4rKmYM2rAVC8n1T2sU/oGaA616T7FSFsILfeSl9SDHySHuDR4j58tvUbU7gRPWH01Ms22BiRb5TihgCkt01HXeT9hegYYR9RKKx83kq5zs0aZ2xYUb3mfWhtFY44QPNhxGbZ/C+1Es8zZL4TwUjvRdGo0sMuPvXLqXhSAaqxWoWb2VaROjDrmB7nQ4SfVsRtQ5MnN14hBasfxFWjJuBQJVwe3CzmLVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/zK9kOpQO6EzTAX0xpduXLNK7NnI3Sf/F/b3dPe+A4I=;
 b=FNy+6XaAXSk26V7jIuf0hAuUjpPgpB2Rj8tztCJSTxjaH3nWYjVP5jrsEMlNgxGi7Lkc3o6ydk70sgKDax4+X1CvQg9fBAkztHjkF6kniFo9sVs2LAQ/8eeY4vjnhn7P/BlZ8Yu3ai/LTkKhqIHh/xASsHXQNQ425X7MoqmocaDIiFAHsi/nESTW3gzXOsVBZ1Ova6SIC8BP718Sl25i1rg4HztyEeSoZYlBlCJT8Ht5L6PJadn5d+CUgQmCQHmw4FG4/iRZpqkz7cni9MFgs93Jz9178VpJeChHHIlsiEPnCPqINo3GYxGQs7+8042X685aMuZM/ZyLjBX+J5t2hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.40; Thu, 24 Apr
 2025 16:04:57 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%7]) with mapi id 15.20.8678.025; Thu, 24 Apr 2025
 16:04:56 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Zhang, Jianxun" <jianxun.zhang@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Mrozek, Michal"
 <michal.mrozek@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>, "Harrison,
 John C" <john.c.harrison@intel.com>, "Briano, Ivan" <ivan.briano@intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH v22 4/5] drm/xe/xe_vm: Add per VM fault info
Thread-Topic: [PATCH v22 4/5] drm/xe/xe_vm: Add per VM fault info
Thread-Index: AQHbtSaJF962bF+9XUqHG8YG479wlbOy+dOA
Date: Thu, 24 Apr 2025 16:04:56 +0000
Message-ID: <DM4PR11MB5456216FA96DE3230B8D57BEEA852@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20250424143812.11210-1-jonathan.cavitt@intel.com>
 <20250424143812.11210-5-jonathan.cavitt@intel.com>
In-Reply-To: <20250424143812.11210-5-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|CY8PR11MB6889:EE_
x-ms-office365-filtering-correlation-id: c9e004b7-7c44-4d65-86c5-08dd8349c1de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?f6j0AfRsyKVuZ7I3BIFBqO48H2t82a0VAdcgur4AnUZau8cp+q1MsvsJeUT1?=
 =?us-ascii?Q?bEyR9kRO51VgruT0YH6X7pM456/975F1HnowVwv06nImPKxYc7B3pyQ07kgc?=
 =?us-ascii?Q?myBnwNIpgS1W5GRJtd2d2NgLB5ticGhzDw2QBG7uuovvx2xcbUYcGgO2YQCN?=
 =?us-ascii?Q?CKMzOY31IJtgxZfNlqsO5Hr4mgfpnlh0MDdjYqPqTYRTdk1XSC8nUX+uPU+e?=
 =?us-ascii?Q?QY3IUDrwktB/J96nPjb3AOausENSiwvSxR3/9fsJS4u7CW/F2XivLJQeB8hN?=
 =?us-ascii?Q?8Q4Rgb4bFErHka5XQTxSyaa+R2l65+j2TjRGdNTEHQ0e7GL3SNnny1C37c25?=
 =?us-ascii?Q?i6IPLb+4PZbwD16GC1+wzIaxrnqWpUrZDpkHsKeuQ1LaTvxQJ8zNh7DEiW7e?=
 =?us-ascii?Q?sdITJHBu/Is+qHoHp9AwT6salGUUJy2Mq8ss/wysSH3rZCDzl9WLca8VxFd3?=
 =?us-ascii?Q?KXFqp2xgZcXHVnO9QVXGhissYjSPcBuIJc2N2pv8MD82FWMu+4y6t/qMjG6b?=
 =?us-ascii?Q?4BGoNU3rh7AE4TDcTalI3hzpDRAt3FNjnOtbUc3GTzHlpp4rqGgCrG+ScxQm?=
 =?us-ascii?Q?dh7182Rk5bLknDfP3/Y5SfkejCq4CPKkubclRc5F7PY4JMW37LYay6AD6/y4?=
 =?us-ascii?Q?Lm1tP1GqE7N4si0DleGrgsvMe3/J2T+/8RzOVXysjXdiCzyHhMjYstuohtNP?=
 =?us-ascii?Q?HS6DbC3o8qwxCoMk7GIiv/fxh0rhP+GhsskjjRXFvDUs0AzwoziHt43b4xE6?=
 =?us-ascii?Q?uKZ3Wx/bt9myCZQWloSpX4kbIof4qbikXH+4/ZYOcXEayUrGuS6wy5WHvhRN?=
 =?us-ascii?Q?YR8dJS4XjQqthTgeImmXk/Sk9ulaWGfhKBJPgLlJWBJyzoUGLMWbzKl1oStO?=
 =?us-ascii?Q?RuPNhNFSNPxtZJv9BB/er1V/h7x35K9O49/h5xgSffZNmxA0ylKx/geUPJPS?=
 =?us-ascii?Q?8UVYc3giN0dySm/1rM1ARNI1k0ir/6RMtZm6MIR7kncARmkmOYwgRs/u4mFA?=
 =?us-ascii?Q?eYJh4bamehugQPczAzEYPxLSipU95s6PQVcFFkEJsgugZGtabucpQInq4SB5?=
 =?us-ascii?Q?itTUgIP67543C7Ove+zpG5D5nPzY4vcWGQAus2XBN106O5OPwgs65wfnOE/O?=
 =?us-ascii?Q?B+VercKoOm35tC6QwCHIJej2n0sGU1S1h4H9zvZbQADJ98TvJH1vLDarKvNA?=
 =?us-ascii?Q?yHvnQTh7Y2HmbLmw7WXsWEh0u1m00GeztaLc9iwj9qz1UHT7EoFmAG5DDEsT?=
 =?us-ascii?Q?VyYRXPE5gLZhmNlyh1ct64RC+egVcFCo9soBuiY+Jfiik+vTB9BHyxATkBHG?=
 =?us-ascii?Q?U3vpJ6gBVHtwRboKyGTcq2Sd6TWKCsNkKu0rgOApQcszO7UwEjkkwABhc2Ud?=
 =?us-ascii?Q?uwaFbyzckV0TVjrlw/mSNO23aKH8qogTxwr5KokcHLDK8eW7VLTI9lEe0v7S?=
 =?us-ascii?Q?7XDKSaunebAr6oxvLVD+zK+1hk1+J+ClRpa4AsEud0OOSBoPuONV9+3DwNc8?=
 =?us-ascii?Q?uVD7/ECHE/HaJZg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JJtenccGHAFfWxPHlUCtcBnBCnpLVMz5LAhpM071jp7+j4T3QukXZmii2a9s?=
 =?us-ascii?Q?WQwc+xcZ2USPgtsopYoO44fdLkwn8BqlRkxpy8RZObfN0yvCuenjWID8FdYF?=
 =?us-ascii?Q?ypm1IWeeoGi2n7XpYrxXqWeLhAIbsfYTs4nJMSvRSVBlFLAp+EonI1jeuBVw?=
 =?us-ascii?Q?2g7b9Uv2Z/G2rmD4oLb5MbTrcKeFxO7pSLczj/eML3Z3f1J9m8Imbml0biZI?=
 =?us-ascii?Q?w31Gt5nCSfX0r2+IvgaPQcILWXCmrMCpkO7RPzeN8DtrAd2ORVk+6Akf5GCq?=
 =?us-ascii?Q?YNz/rPaa4IfQsn2y8cZwilSHeu9imSJ5P8tSJAE5ylNboGK1jfIUIESalP8q?=
 =?us-ascii?Q?PvxKeWIKT3RfhYxCRjfVqIRnxXCRvpTe9OCfNbAf5HMZiF1A1erqEBGp3JYs?=
 =?us-ascii?Q?M9JlOxeT3evmQybQ2cSh2kJDO9fvB0lrj0A2oij2l4EYRPIbW5R1PsaguXK8?=
 =?us-ascii?Q?MpSZ08tAJTrGzEZpgLbkwYWPRYi8bhsbJ8xH8zSpx9KUHp/FZBP/bYMQRSFm?=
 =?us-ascii?Q?rArbPUprEKCL+dK7K1csqTz/bTRcwk5i9jF9LCZgtapi4bAwIpit5e0UAaWY?=
 =?us-ascii?Q?7Zk0RFNrHUVMADhoFlSgp4zGizr8T3eXTP9J0WdOJ7KuCgja9/gh1zyxcvfV?=
 =?us-ascii?Q?rMyeF7Vv2gwvs7JuzwAzDA/irWqiQ1prxZdyVagII2m3VFX9Eq/pnUvWaTRP?=
 =?us-ascii?Q?WwOV1u+INI+K6wqDvZ/ngQ7J6UHI3VA9KsbXi+R0CkVKFTnMms15IqQkpwHM?=
 =?us-ascii?Q?apIF0ilcMwbjB4jn7iLDD3B9hNulnMfkCjUw1WSftnyikdBfYCKog4P+tT8R?=
 =?us-ascii?Q?KoFasXz86/aerDAvRSFHvzx2PP/X4LHGijp6OlC58nbaFuHGWT1gx6G1ln1Q?=
 =?us-ascii?Q?dW5YA+C2vGl4BT3AxIMXOEnkfc0VxNmNoLVyo/RSrE/kl/1KM+my0GQBAfKF?=
 =?us-ascii?Q?G4g5AQuLLip4yTsjHRrPYylQBKODQUwS/WnOXLiFoiRm30M2qltOdYlWfL3L?=
 =?us-ascii?Q?pDPpLc2Xip7rJnkhaCGeP9bxdbb+TNTfe9ycAnrLR63cYI3UmYAai2yKdRrF?=
 =?us-ascii?Q?UtAqaK/9eDBEXfhXz51R8neUJ2KRB995oV3lZSYAQQSkLC7+mN5IUtu5HtKx?=
 =?us-ascii?Q?CUnwU0Gd4lermdnoCkLUdIiDEvI2FnC1K+W27X94YQ/KYUWGBdK5BoMJ29Ks?=
 =?us-ascii?Q?kPuNx+IaStN63UM9iUzoZhsDJUPduX8GtHmS00i2+e2UGzTxa5sio4Sw+eoD?=
 =?us-ascii?Q?yCHudzr5AVA37gwwcRiQitnOkYx8VncLrjdcleur3oo+dzlJFnWH+OeBeQMe?=
 =?us-ascii?Q?kQxut9djYyRiJs5ckYD64vSKulUnzMfzlL2b/3stot5s2jSq6McvudwHBuZj?=
 =?us-ascii?Q?q/b+O/xgObLigTRZ+qNR4ZdTTO9XWBIIzEZxKKU7Dwgkpeguu+/JJbKpwn8T?=
 =?us-ascii?Q?hdo5p0vcADsYKmyIpTsrL9+qsPxFFwVS8leZcOfBhMYySz3anuwrjiVrcebe?=
 =?us-ascii?Q?BYgJz1kxIX9eSYHVjzuWm12P5a0CpIvFDbeZaiGQ3LBTU6ggRDEZPMHEgVoC?=
 =?us-ascii?Q?StG6kEdbXi0EKThge0HJFzqd4efvZPxtwdjUvHiL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9e004b7-7c44-4d65-86c5-08dd8349c1de
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2025 16:04:56.4821 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ua11vwVFo5luGS2tQe3P0yhtFl2jNnzyHTzGFRkJmoSHCmh4G376nyEtMlNhLsfiFqpEt6Y/R29ajf3aU3Lqng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6889
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

On Thu, April 24, 2025 7:38 AM Cavitt, Jonathan wrote:
> Add additional information to each VM so they can report up to the first
> 50 seen faults.  Only pagefaults are saved this way currently, though in =
the
> future, all faults should be tracked by the VM for future reporting.
>=20
> Additionally, of the pagefaults reported, only failed pagefaults are save=
d this
> way, as successful pagefaults should recover silently and not need to be
> reported to userspace.
>=20
> v2:
> - Free vm after use (Shuicheng)
> - Compress pf copy logic (Shuicheng)
> - Update fault_unsuccessful before storing (Shuicheng)
> - Fix old struct name in comments (Shuicheng)
> - Keep first 50 pagefaults instead of last 50 (Jianxun)
>=20
> v3:
> - Avoid unnecessary execution by checking MAX_PFS earlier (jcavitt)
> - Fix double-locking error (jcavitt)
> - Assert kmemdump is successful (Shuicheng)
>=20
> v4:
> - Rename xe_vm.pfs to xe_vm.faults (jcavitt)
> - Store fault data and not pagefault in xe_vm faults list (jcavitt)
> - Store address, address type, and address precision per fault (jcavitt)
> - Store engine class and instance data per fault (Jianxun)
> - Add and fix kernel docs (Michal W)
> - Properly handle kzalloc error (Michal W)
> - s/MAX_PFS/MAX_FAULTS_SAVED_PER_VM (Michal W)
> - Store fault level per fault (Micahl M)
>=20
> v5:
> - Store fault and access type instead of address type (Jianxun)
>=20
> v6:
> - Store pagefaults in non-fault-mode VMs as well (Jianxun)
>=20
> v7:
> - Fix kernel docs and comments (Michal W)
>=20
> v8:
> - Fix double-locking issue (Jianxun)
>=20
> v9:
> - Do not report faults from reserved engines (Jianxun)
>=20
> v10:
> - Remove engine class and instance (Ivan)
>=20
> v11:
> - Perform kzalloc outside of lock (Auld)
>=20
> v12:
> - Fix xe_vm_fault_entry kernel docs (Shuicheng)
>=20
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Jianxun Zhang <jianxun.zhang@intel.com>
> Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
> Cc: Michal Mzorek <michal.mzorek@intel.com>
> Cc: Ivan Briano <ivan.briano@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>

LGTM.
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 26 ++++++++
>  drivers/gpu/drm/xe/xe_vm.c           | 88 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h           |  9 +++
>  drivers/gpu/drm/xe/xe_vm_types.h     | 29 +++++++++
>  4 files changed, 152 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 93afa54c8780..a84f6247f8a2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -345,6 +345,31 @@ int xe_guc_pagefault_handler(struct xe_guc *guc,
> u32 *msg, u32 len)
>  	return full ? -ENOSPC : 0;
>  }
>=20
> +static void save_pagefault_to_vm(struct xe_device *xe, struct
> +xe_gt_pagefault *pf) {
> +	struct xe_vm *vm;
> +
> +	/*
> +	 * Pagefault may be associated to VM that is not in fault mode.
> +	 * Perform asid_to_vm behavior, except if vm is not in fault
> +	 * mode, return the VM anyways.
> +	 */
> +	down_read(&xe->usm.lock);
> +	vm =3D xa_load(&xe->usm.asid_to_vm, pf->asid);
> +	if (vm)
> +		xe_vm_get(vm);
> +	else
> +		vm =3D ERR_PTR(-EINVAL);
> +	up_read(&xe->usm.lock);
> +
> +	if (IS_ERR(vm))
> +		return;
> +
> +	xe_vm_add_fault_entry_pf(vm, pf);
> +
> +	xe_vm_put(vm);
> +}
> +
>  #define USM_QUEUE_MAX_RUNTIME_MS	20
>=20
>  static void pf_queue_work_func(struct work_struct *w) @@ -364,6 +389,7
> @@ static void pf_queue_work_func(struct work_struct *w)
>  		if (unlikely(ret)) {
>  			print_pagefault(xe, &pf);
>  			pf.fault_unsuccessful =3D 1;
> +			save_pagefault_to_vm(xe, &pf);
>  			drm_dbg(&xe->drm, "Fault response:
> Unsuccessful %d\n", ret);
>  		}
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c inde=
x
> 0c69ef6b5ec5..107e397b4987 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -27,7 +27,9 @@
>  #include "xe_device.h"
>  #include "xe_drm_client.h"
>  #include "xe_exec_queue.h"
> +#include "xe_gt.h"
>  #include "xe_gt_pagefault.h"
> +#include "xe_gt_pagefault_types.h"
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_migrate.h"
>  #include "xe_pat.h"
> @@ -778,6 +780,87 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
>  		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -
> EAGAIN;  }
>=20
> +static struct xe_hw_engine *
> +hw_engine_lookup_class_instance(struct xe_vm *vm,
> +				enum xe_engine_class class,
> +				u16 instance)
> +{
> +	struct xe_device *xe =3D vm->xe;
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +	struct xe_gt *gt;
> +	u8 gt_id;
> +
> +	for_each_gt(gt, xe, gt_id)
> +		for_each_hw_engine(hwe, gt, id)
> +			if (hwe->class =3D=3D class && hwe->instance =3D=3D instance)
> +				return hwe;
> +	return NULL;
> +}
> +
> +/**
> + * xe_vm_add_fault_entry_pf() - Add pagefault to vm fault list
> + * @vm: The VM.
> + * @pf: The pagefault.
> + *
> + * This function takes the data from the pagefault @pf and saves it to @=
vm-
> >faults.list.
> + *
> + * The function exits silently if the list is full, and reports a
> +warning if the pagefault
> + * could not be saved to the list.
> + */
> +void xe_vm_add_fault_entry_pf(struct xe_vm *vm, struct xe_gt_pagefault
> +*pf) {
> +	struct xe_vm_fault_entry *e =3D NULL;
> +	struct xe_hw_engine *hwe;
> +
> +	/* Do not report faults on reserved engines */
> +	hwe =3D hw_engine_lookup_class_instance(vm, pf->engine_class, pf-
> >engine_instance);
> +	if (!hwe || xe_hw_engine_is_reserved(hwe))
> +		return;
> +
> +	e =3D kzalloc(sizeof(*e), GFP_KERNEL);
> +	if (!e) {
> +		drm_warn(&vm->xe->drm,
> +			 "Could not allocate memory for fault!\n");
> +		return;
> +	}
> +
> +	spin_lock(&vm->faults.lock);
> +
> +	/*
> +	 * Limit the number of faults in the fault list to prevent
> +	 * memory overuse.
> +	 */
> +	if (vm->faults.len >=3D MAX_FAULTS_SAVED_PER_VM) {
> +		kfree(e);
> +		goto out;
> +	}
> +
> +	e->address =3D pf->page_addr;
> +	e->address_precision =3D 1;
> +	e->access_type =3D pf->access_type;
> +	e->fault_type =3D pf->fault_type;
> +	e->fault_level =3D pf->fault_level;
> +
> +	list_add_tail(&e->list, &vm->faults.list);
> +	vm->faults.len++;
> +out:
> +	spin_unlock(&vm->faults.lock);
> +}
> +
> +static void xe_vm_clear_fault_entries(struct xe_vm *vm) {
> +	struct xe_vm_fault_entry *e, *tmp;
> +
> +	spin_lock(&vm->faults.lock);
> +	list_for_each_entry_safe(e, tmp, &vm->faults.list, list) {
> +		list_del(&e->list);
> +		kfree(e);
> +	}
> +	vm->faults.len =3D 0;
> +	spin_unlock(&vm->faults.lock);
> +}
> +
>  static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds=
)  {
>  	int i;
> @@ -1660,6 +1743,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe,
> u32 flags)
>  	init_rwsem(&vm->userptr.notifier_lock);
>  	spin_lock_init(&vm->userptr.invalidated_lock);
>=20
> +	INIT_LIST_HEAD(&vm->faults.list);
> +	spin_lock_init(&vm->faults.lock);
> +
>  	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
>=20
>  	INIT_WORK(&vm->destroy_work, vm_destroy_work_func); @@ -
> 1930,6 +2016,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  	}
>  	up_write(&xe->usm.lock);
>=20
> +	xe_vm_clear_fault_entries(vm);
> +
>  	for_each_tile(tile, xe, id)
>  		xe_range_fence_tree_fini(&vm->rftree[id]);
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h inde=
x
> 0ef811fc2bde..9bd7e93824da 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -12,6 +12,12 @@
>  #include "xe_map.h"
>  #include "xe_vm_types.h"
>=20
> +/**
> + * MAX_FAULTS_SAVED_PER_VM - Maximum number of faults each vm can
> store
> +before future
> + * faults are discarded to prevent memory overuse  */
> +#define MAX_FAULTS_SAVED_PER_VM	50
> +
>  struct drm_device;
>  struct drm_printer;
>  struct drm_file;
> @@ -22,6 +28,7 @@ struct dma_fence;
>=20
>  struct xe_exec_queue;
>  struct xe_file;
> +struct xe_gt_pagefault;
>  struct xe_sync_entry;
>  struct xe_svm_range;
>  struct drm_exec;
> @@ -257,6 +264,8 @@ int xe_vma_userptr_pin_pages(struct
> xe_userptr_vma *uvma);
>=20
>  int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma);
>=20
> +void xe_vm_add_fault_entry_pf(struct xe_vm *vm, struct xe_gt_pagefault
> +*pf);
> +
>  bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t
> *end);
>=20
>  int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma); diff --gi=
t
> a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 1662604c4486..38e9f5d66386 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -19,6 +19,7 @@
>  #include "xe_range_fence.h"
>=20
>  struct xe_bo;
> +struct xe_pagefault;
>  struct xe_svm_range;
>  struct xe_sync_entry;
>  struct xe_user_fence;
> @@ -142,6 +143,24 @@ struct xe_userptr_vma {
>=20
>  struct xe_device;
>=20
> +/**
> + * struct xe_vm_fault_entry - Elements of vm->faults.list
> + * @list: link into @xe_vm.faults.list
> + * @address: address of the fault
> + * @address_precision: precision of faulted address
> + * @access_type: type of address access that resulted in fault
> + * @fault_type: type of fault reported
> + * @fault_level: fault level of the fault  */ struct xe_vm_fault_entry
> +{
> +	struct list_head list;
> +	u64 address;
> +	u32 address_precision;
> +	u8 access_type;
> +	u8 fault_type;
> +	u8 fault_level;
> +};
> +
>  struct xe_vm {
>  	/** @gpuvm: base GPUVM used to track VMAs */
>  	struct drm_gpuvm gpuvm;
> @@ -305,6 +324,16 @@ struct xe_vm {
>  		bool capture_once;
>  	} error_capture;
>=20
> +	/** @faults: List of all faults associated with this VM */
> +	struct {
> +		/** @faults.lock: lock protecting @faults.list */
> +		spinlock_t lock;
> +		/** @faults.list: list of xe_vm_fault_entry entries */
> +		struct list_head list;
> +		/** @faults.len: length of @faults.list */
> +		unsigned int len;
> +	} faults;
> +
>  	/**
>  	 * @tlb_flush_seqno: Required TLB flush seqno for the next exec.
>  	 * protected by the vm resv.
> --
> 2.43.0

