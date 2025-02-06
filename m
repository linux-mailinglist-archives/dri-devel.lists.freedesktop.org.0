Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12099A2A2E1
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 09:05:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E546C10E27F;
	Thu,  6 Feb 2025 08:05:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FGKFNkbT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A43A910E27F;
 Thu,  6 Feb 2025 08:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738829119; x=1770365119;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=5T8pN96HpHJBrJ9NSUrQU913oPeS3pbGRarGKh8L7h4=;
 b=FGKFNkbTPpaWkB0TSX0CBPGlC/3NawOp3G9bK+LvYX8iPdyR/KQQ5CDE
 pv0mv1CcrarOmOjftYGvSMtHGFvkiug2bdMgzeF6roR224QvLMzOYAyZy
 K0qKmStWj//Z7SHjDJ412B2yiuVHLHyXpRRLDv+WxeIOTJD5sy7jYwNq7
 60PKceYcPC4VSqYmdHBpB5bohLX/e9UoH+APBONXvdH5zFkzGMS2yTTM0
 6q3oNd/WqXZz0WMDGJueNPO02T3j2lBU4jQ3sY2WE5XjFOemsB6UpjCjw
 vIvLxqCvjOnCwj2zIxuKf4bBk2TCYU+7gFMXDuXjghyePyRGbigfKA+Hf w==;
X-CSE-ConnectionGUID: lgH7NzQ2R1mWlJEPisjpog==
X-CSE-MsgGUID: JM3d/cElSTSwPbvaK3LWbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="49664115"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; d="scan'208";a="49664115"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 00:04:59 -0800
X-CSE-ConnectionGUID: icocdkNxRQqqaIoaiFy94A==
X-CSE-MsgGUID: KEz2+5LlSVeOmaLA+7aEXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; d="scan'208";a="111340087"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 00:04:53 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 00:04:51 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 00:04:51 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 00:04:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rM+7XcM+FrReWwRFn51G/37OTldJjfB0oghePLjfPBEpl3HQE++B+bBfv0O1qG1K3WaxHxNjbtf1OoZEqdtr27vfGliBgYU4bNuND30aOPD/phCN500IDEm4lDDCZIw7HnBQ5jjPCvpqD2XP320wy36DK+6uUbZe2Aap7t8NfsIihqk5FxevJnLTtzyg2FG7mMzWIO93nme0YtOjjb18VoGS0uhHuM9Uw5VNBAebDiwFtPq/HK1osIBaRTOxLYDA2chLKfZfzBEUP/NqhcLzsLWfYtFvEZ66nPlccXD4IS02GQB08pjfEBqOGeEseXlDbUXLCpCSgGxuiRayIsVQNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hszp/ufL3IEAcAQGrIAk/UqFbFIoPtYwPb6vxR3E68k=;
 b=PcHSiS7wAXEsUV2rlXbDyddgvMimogdOHI6eUnguljKaLIWofbHRQdPLJpfLd4vcvNWH+NC3yHrFWSa4aiMe7m/9SB5ndiv2/MyO8WAhj/R49ATZj2o5+k73HVS8p5tlIhsb7xd9ynnuOclJbojKg7yRSnuMylibooksZMZdIyXVyZe9MIklj7DnBKiS8/OGpsqOjW6bWMpMuLX1I2gHqCAvseAOKWBlu8kX0RPH9EiU3CymYSHgsUHgl7EmMZjigMqD7ZJ5BZ5d9qJPNdo0JWl9kmb+kjSpJCbdUIDvZW5NODB/PTCDTDU07vSMimwnmm0AMb94SfItELE4/j/u5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7134.namprd11.prod.outlook.com (2603:10b6:930:62::17)
 by CH3PR11MB7372.namprd11.prod.outlook.com (2603:10b6:610:145::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Thu, 6 Feb
 2025 08:04:39 +0000
Received: from CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::cd87:9086:122c:be3d]) by CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::cd87:9086:122c:be3d%4]) with mapi id 15.20.8398.025; Thu, 6 Feb 2025
 08:04:39 +0000
From: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
To: "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "tursulin@ursulin.net"
 <tursulin@ursulin.net>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Zhuo, Qiuxu"
 <qiuxu.zhuo@intel.com>
Subject: =?Windows-1252?Q?Compile_error_on_"error:_call_to_=91=5F=5Fcompiletime=5F?=
 =?Windows-1252?Q?assert=5F581=92_declared_with_attribute_error:_clamp()_l?=
 =?Windows-1252?Q?ow_limit_dsc=5Fmin=5Fbpc_*_3_greater_than_high_limit_dsc?=
 =?Windows-1252?Q?=5Fmax=5Fbpc_*_3"?=
Thread-Topic: =?Windows-1252?Q?Compile_error_on_"error:_call_to_=91=5F=5Fcompiletime=5F?=
 =?Windows-1252?Q?assert=5F581=92_declared_with_attribute_error:_clamp()_l?=
 =?Windows-1252?Q?ow_limit_dsc=5Fmin=5Fbpc_*_3_greater_than_high_limit_dsc?=
 =?Windows-1252?Q?=5Fmax=5Fbpc_*_3"?=
Thread-Index: Adt4bQt4ppEmAW1NQ5OTdHEaZwpkcQ==
Date: Thu, 6 Feb 2025 08:04:39 +0000
Message-ID: <CY8PR11MB7134D2D3BD641BE58310EF0189F62@CY8PR11MB7134.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7134:EE_|CH3PR11MB7372:EE_
x-ms-office365-filtering-correlation-id: 2d324a37-6b3b-426f-7e40-08dd4684e7c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?Windows-1252?Q?cgnENP0Pa9sKAX4ylBhSqb/LXr8RW09FqOQ22OPMxWHetGjvY9WYcsf2?=
 =?Windows-1252?Q?KLXzWRgBRrZzV3UKivjoZir/WDa/YMWayMBkVHY8TRi1/9qIwOLHXexa?=
 =?Windows-1252?Q?7us5fC4VnsuaM5P2xTXcG+72JX1vy2xPjYOoe2vbW2r+gnROn5P7xYWb?=
 =?Windows-1252?Q?bQCylp7CSk4I+xZ2cUNiWmf4Yi++gQLzd3cZNC9fUip3rx0mSQQxIKbv?=
 =?Windows-1252?Q?J1XE84PXM2GlDPIyHTF5kunnDK7VjUPR+rXXs+IeVsovwt1l6OMCikyM?=
 =?Windows-1252?Q?lE8v9FonPZraNmtb/D/afDZYBEta5z4X2PcDzivjqFZztMuIURFZ7ajl?=
 =?Windows-1252?Q?8PunPXIPX+Af0YzBSbAK0BOTjD8NcfybU4BkBqVUV8oHJbtQS8jo7Oky?=
 =?Windows-1252?Q?SCzNwg85c2fC4eK/jTYEpFn63rX//ff2KsPfNP1SSHfT6W19+8kpz8AT?=
 =?Windows-1252?Q?A3jOO5RZwKIiv+tTgDSYz0su8PBFA8chK3XaijemZ2hcsqsQWKJEnlJ3?=
 =?Windows-1252?Q?1buHemqQaZgSrZMJn5OhIApJ4AYk8smR2Bjn+gWQ4qa+bLD4wGAlt8zB?=
 =?Windows-1252?Q?iy32xLskb7IiWJ+/oGJUGlEQ2CB8FPl3RKqgwlFP15pBIBoAElwLoMp+?=
 =?Windows-1252?Q?mkg/v1NBQNvjVF1ePK0Ad2eEpNoxR/hETHiKzA+yNAgS3O9z0I20Vrga?=
 =?Windows-1252?Q?miVuFZIjj5bQxz90hom9+bCRRjKbCh7Fc+yr9mfxM5+tEPFPOafq1EVN?=
 =?Windows-1252?Q?+fJCamZ43YPQcH+XwwPIYZ41mr2GJtolmHRnMGWUHS65F2WcQreazknG?=
 =?Windows-1252?Q?oQxiwThVZFlznVCu41/3AZSHDJ8bYh+UEHhwULrzQWpqrXHAuOuWlS0l?=
 =?Windows-1252?Q?YXGoRfaIk0jVwp/AFtdMPFjT+h4C8gVV6dVEBAyYf8GvJUD8OkxjyGLS?=
 =?Windows-1252?Q?k08WK3POk+jm+CExSNgLeA57kfK8vR0+NTAYtI61QR+f9AYmwMQvEE3W?=
 =?Windows-1252?Q?Avc6uAGJYG4/tY4iqXp1k73S1VwSVLsBkT/tY+6NN8xFcKsSHNZaNkyj?=
 =?Windows-1252?Q?TG1OhvuvtaxOVrwVuOPlqAh53RMlthmltnhSwL5F3fl4htPsRbHB7nMi?=
 =?Windows-1252?Q?Qq9skpcZDeq5UL9+RcX5GXTiMQArFdXTR/Jlr0KGGr5cTsdZq2y1qBzj?=
 =?Windows-1252?Q?1VXm0lCoT4Py50CJLm8hrO39buDA2CyncOP2RVJ6z9q52qATUQqsfkFx?=
 =?Windows-1252?Q?FuH2tl4s6Yy5Z+bZCJMjZZxk0F3iJBBHnfD5UHec3ro8IU4b9A/s+JsK?=
 =?Windows-1252?Q?LIDCvBrxlKqipGJ7E0bTQzOaJpU7jajxbT/P6b6edxQbyDg+qCZSASrJ?=
 =?Windows-1252?Q?0MBWRSQlOUxsuXDI0N9CJCSZK++qNgq6mH8t//a1Jr0RSl3aeAD04XYk?=
 =?Windows-1252?Q?aTNrMOPGHD8e3QuGzoIiNCxY31yeAX5TorI0JhW3Sihzone+ACQnQcRU?=
 =?Windows-1252?Q?qWDMOZT9kyYDnpAbgJ8dJPw0DUmTg3rwwNLp0GuhIE4RgqnFEOv9OyXu?=
 =?Windows-1252?Q?gFfJrcVnKH7e+PPL?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7134.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?+k8PUlgsy60gekj6+g1Fvx1TMPg3txlrw7pU0YtAezE2m7SCWZBA2aNw?=
 =?Windows-1252?Q?j3jCB4CqAEnns4T5hVxDDyrYtbVMdDjC+i2TGqEWLtRPaz7ArZHvWqTq?=
 =?Windows-1252?Q?yIZWLyhqoy+6YKlx3hN960DOSLnke/P+gGWPEj9rbw70MyQt4LQsKyxx?=
 =?Windows-1252?Q?RrJJMY1Vs7yfw0Nv34oiUBhVfZimzpxcNRyYerVEy9jpwU1CoK4Eww4T?=
 =?Windows-1252?Q?NHXTynKBO2uiy6UYQCqgkHk4ySZa14rvvkZ8HP46I+CFoM9qe7y6/Kdr?=
 =?Windows-1252?Q?3DRgoltXKQrfY3zDSgwO28rwCrA3cduJQKcSB6xQcHqIwN9EuRk3BfzK?=
 =?Windows-1252?Q?DPJ8ZjpaDo1kZigiMDDdxVh27ILVOABlBQgXCfXdOLySxAJFTbZz1b9V?=
 =?Windows-1252?Q?iVe1ze2L1R1Fw0WGuCpj+GykSHX9k08EfBOCyN30RkQnfFXlzI2t0DeT?=
 =?Windows-1252?Q?N1mqYqiHJIOXdvX5oq0OziYqEcEBYKc/hr0ZAdGv+W/fx9gLxgPop2EV?=
 =?Windows-1252?Q?K/jL3Sas0ZYG+BAtUOTrkX4kiZHeWwRcT4OYQkYfqldNwO24JBEas9hK?=
 =?Windows-1252?Q?mEIdkUPgg5CvzZGtuqoNgTUnAd1N7ozrO2KUuaHSjgJER6++e1sbEYjr?=
 =?Windows-1252?Q?4FlEGqQ2LxvNw8z6YlhgUgcZmqQz5MbPjtw5uyYqw6GLvsgoAHw6ySik?=
 =?Windows-1252?Q?gExcAKH6y0GaBCKp9iHEeCD+dHG0qJ0KuLX96/ub1C9B1XlU7xcZvnxw?=
 =?Windows-1252?Q?7FrI3/TOFtDuZ2l/WN23sFVkvU8lOnthIfahZWeR4P5fwxuoKVGut4ka?=
 =?Windows-1252?Q?R3LxUgZhSP5kwLnMqXeV9/ce+rYAArFxw588lMBGSF3jh0u1GPnxEVtm?=
 =?Windows-1252?Q?5vrpsEOcjLqadTLqHwP0DE7EeJ7yif86QjkIoslsd9pgyBxqand4SPMc?=
 =?Windows-1252?Q?4/eo6VFbG5V+NBzZGgFKbWTAQ2r7w4jm/hepJycHhccsIWYaKeds3Q7f?=
 =?Windows-1252?Q?55vliQNUvzVePYnfK/teQFpJMa+cDE2tHvcP0geP8jrWmwXrS8GyyzCR?=
 =?Windows-1252?Q?ivHUnz9GupsBunV+c/LO5qKxRPILwQzDwID0Ql9vEfZe1okoaQJqUdsv?=
 =?Windows-1252?Q?Zf1zNgJrcHctZU9lb0qm0tmTnnTxekhJrn5lDBHzkYS+HxmP38FvgHQx?=
 =?Windows-1252?Q?OC0biDsWWuE3KHBX23uwrD07l4pVBUdLD0HBhstkMo75dmRLlmp2Q4GJ?=
 =?Windows-1252?Q?YDiQZT0f4MHt/WR87GuFxzZwnzqOGRNiDe3MvvweCCYblOOtdK1xtJ7t?=
 =?Windows-1252?Q?CMCQNozt3wpLcrJO4Qzsw8nPwmdPLssGRRgQpiuJyhOqRAGUKnI04fTy?=
 =?Windows-1252?Q?CLN2b3W3kabshgQdHI0hM8Yz4ESz/mbRS7YcmTjt8gBs6nzHKmToTRYC?=
 =?Windows-1252?Q?7LFppK//xM356gwITg0e7R8YTIpax0nA86pHDg6mUTqLYfOX4Boj8zCL?=
 =?Windows-1252?Q?xCoth/ze5pY6bvcWL7CB4LCSMayFDjNAU/2eso9/YGBOPThy50bsb6D3?=
 =?Windows-1252?Q?V4ZWDd9gbK+6/5YUTH7F1e7TtV3kz1MnpvzVJYe8cPf1MjQlXe0uSYd6?=
 =?Windows-1252?Q?AocjqSPGmNDBJkE1J7cv/fxzuPDzY/ormrPXk5bUrXz2pQtk8MfFVLh8?=
 =?Windows-1252?Q?/ZURYhUmRQy8lPuZG3hBH09Bj0q53LiH?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7134.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d324a37-6b3b-426f-7e40-08dd4684e7c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2025 08:04:39.4043 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ivAzvjGPNxyJReurwnsA57UFnwU3sonAAyfOGYGW5k3ZYaZMxKGIxFHisOEzfSziVtOUmt180JCcI7+AOstd+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7372
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

Hi,

I got the compile error as below.
My GCC is: gcc (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0
kernel: v6.14-rc1

--- compile error log ---

  CC      drivers/gpu/drm/i915/display/intel_dp.o
In file included from <command-line>:0:0:
In function =91intel_dp_dsc_compute_pipe_bpp_limits.isra.77=92,
    inlined from =91intel_dp_compute_config_limits=92 at drivers/gpu/drm/i9=
15/display/intel_dp.c:2547:3:
././include/linux/compiler_types.h:542:38: error: call to =91__compiletime_=
assert_581=92 declared with attribute error: clamp() low limit dsc_min_bpc =
* 3 greater than high limit dsc_max_bpc * 3
  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                      ^
././include/linux/compiler_types.h:523:4: note: in definition of macro =91_=
_compiletime_assert=92
    prefix ## suffix();    \
    ^~~~~~
././include/linux/compiler_types.h:542:2: note: in expansion of macro =91_c=
ompiletime_assert=92
  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
  ^~~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:39:37: note: in expansion of macro =91compileti=
me_assert=92
 #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                     ^~~~~~~~~~~~~~~~~~
./include/linux/minmax.h:188:2: note: in expansion of macro =91BUILD_BUG_ON=
_MSG=92
  BUILD_BUG_ON_MSG(statically_true(ulo > uhi),    \
  ^~~~~~~~~~~~~~~~
./include/linux/minmax.h:195:2: note: in expansion of macro =91__clamp_once=
=92
  __clamp_once(type, val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQU=
E_ID(h_))
  ^~~~~~~~~~~~
./include/linux/minmax.h:206:28: note: in expansion of macro =91__careful_c=
lamp=92
 #define clamp(val, lo, hi) __careful_clamp(__auto_type, val, lo, hi)
                            ^~~~~~~~~~~~~~~
drivers/gpu/drm/i915/display/intel_dp.c:2506:25: note: in expansion of macr=
o =91clamp=92
  limits->pipe.max_bpp =3D clamp(limits->pipe.max_bpp, dsc_min_bpc * 3, dsc=
_max_bpc * 3);
                         ^~~~~
drivers/gpu/drm/xe/Makefile:165: recipe for target 'drivers/gpu/drm/xe/i915=
-display/intel_dp.o' failed

