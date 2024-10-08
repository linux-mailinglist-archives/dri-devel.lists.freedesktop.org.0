Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D6C995962
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 23:41:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A6F10E5ED;
	Tue,  8 Oct 2024 21:41:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OMNxrf9I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB9A10E5E9;
 Tue,  8 Oct 2024 21:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728423708; x=1759959708;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dkHdVtCTFIvUB14Q3Pjm+7tdCHw7khdEJht9eg34Zb0=;
 b=OMNxrf9IY1y1niohMUcK4fXz/ZLHVG0czijnuXtFOXafDaDFcEkzQVz6
 SueqVvSp1r5HureCNDVh/v1UvbquxilrfvHpQ5QjpwIsNmk+5NIhGvDDZ
 4B7QN5UIzhwgkUSirtCBq5V7gYSJz9W09ggvRqL4E232EFchg+e97KnmT
 bglwpe3AqZsME89+VBLHDuQWqrfdrOr/oF2UesgZloJntCCpw1PZNBC3M
 VUs1QsTHXU1Xv/jmmXdpvx0F2bdQRY/Uy9qcuiO04jwqKo1gE502jaXxH
 m06vl6cIjJ3AVNzDMkmPtNRKruCmvERAggCXjZ/iwH9lsb6Z29gMZlWpZ g==;
X-CSE-ConnectionGUID: y9JZOI24QiiUF/bl8FTbjA==
X-CSE-MsgGUID: up61rzzYSi+w5zj/cIWsiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="15288672"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="15288672"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 14:41:48 -0700
X-CSE-ConnectionGUID: ElmTnGFHTlOCMU/4SYMupA==
X-CSE-MsgGUID: x8P357NXTQW3j6nMD1dv8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="80796468"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 14:41:48 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 14:41:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 14:41:47 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 14:41:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=po/cRSVZFp9ak9Nl+6ZIbKZb51+RGMzzyc/ZP8IQi+teRunH497st8mtw2PoIYwfnOfV/dyz/VGbfG1LvG+EG42e9UYaHxJc3I4Y4603aK8GYlLYPxyWAXpF3EWQVQvdmBpZ0G6jt4mdWAooUg3F/+LFKzL+L/wl8zu8z7qy/3yhTWxBEitoisF6HDOvzg58+gGcyMRd3+tqXg1Tm976G4QZEJJk+DAy2aNHH1IRZ0howbjh0m/43Wd2noee6z3vunNO8vMHpijclTxffW7AnZgeQIrKsYYupYZHzG99MRE0NFj5GOqtd9NUN/Ahn5eL+1GRJyz9QWnRp4WMHzzuQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wItdtcMuGhCpbGhP7dhNdGW5n2g4q9bAViIWX3Vnrlg=;
 b=kK+Hojsm41sS5JLK4e/3PJY0tmYK5wQg46WBETCXgmbiAqj62tG4++iC07tTV3iL5W04R4p97jIfnWsog9YPKcyCrTE1dVx7g8BeaAyIS8H5GABf6+6Bo56RKBZGxhqQlER9mywnSiqMUT9QjHtfpNp1o7HXQAmuwURUenb8w8vs4p99W8vhhpwXJJr4WfE+LuqH3cFzENgtETKq4mTUE3dn8WAraf6V7lcOrteMbzUWLM/MsuBdbTU5ASdrBai7MbnRYl/YQC74J/MCvTZUDLiiRrSmkeYwykfvbA3aV3qR/u2CuIMWZIA30aC+9O5UyEay5ghCffTS+NY+qFkO7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MW4PR11MB6667.namprd11.prod.outlook.com (2603:10b6:303:1ea::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.24; Tue, 8 Oct
 2024 21:41:44 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 21:41:44 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "airlied@gmail.com" <airlied@gmail.com>,
 "javierm@redhat.com" <javierm@redhat.com>, "jfalempe@redhat.com"
 <jfalempe@redhat.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Alex
 Deucher" <alexander.deucher@amd.com>, =?iso-8859-1?Q?Christian_K=F6nig?=
 <christian.koenig@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v3 11/12] drm/client: Make client support optional
Thread-Topic: [PATCH v3 11/12] drm/client: Make client support optional
Thread-Index: AQHbGXqmHSa7RLeJ8Em+KPnemsQc0LJ9VMpw
Date: Tue, 8 Oct 2024 21:41:44 +0000
Message-ID: <CH0PR11MB5444D98DD02DE52B6F59A5FFE57E2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241008120652.159190-1-tzimmermann@suse.de>
 <20241008120652.159190-12-tzimmermann@suse.de>
In-Reply-To: <20241008120652.159190-12-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MW4PR11MB6667:EE_
x-ms-office365-filtering-correlation-id: 1655c417-2bce-4c81-51e5-08dce7e20103
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?tc64kD3fxEYBd7HPumcY/Aw06TVgbY+xhvLXIiphPM6zQbEvA4cWTgyX+D?=
 =?iso-8859-1?Q?oWVmDYER4k/jbZF5c+msBL9WM1shuXzHIYSwS0coIygQAqaFAns8mLXSJ1?=
 =?iso-8859-1?Q?u17tPsfaIQiMcvePlkNiS9+cgFP5fnsTxLZY9fo7jDNEJkcMbbh4fEvzbG?=
 =?iso-8859-1?Q?YwSiEdZ9TzAJmEipCllg9Y0NggsBxyT1weSdtWO+I29DZBb1+y2rZDUcoL?=
 =?iso-8859-1?Q?PhnmwcAIZqSJgXISpjKnbLl0ESwXxJygnfqS4Ov3Smd3RNlbFefSrrpKHB?=
 =?iso-8859-1?Q?QCPsu4f4qvP5Otwuru7CKJ7w+IPPqctN4bHbVTqtfcoaT93Q3AHC9ZFyRC?=
 =?iso-8859-1?Q?ElkAVgRP5SL6tCLMPuHmKeh/3uOm3leaS9uIezcCVz1kQ2+JBNCy1ZSQ1/?=
 =?iso-8859-1?Q?Q8ZgDQnIxgrsUNrcNo0BCpeMj/CG9fuNFKGQMj+/J+ED4Qdc9BNiMwwJNf?=
 =?iso-8859-1?Q?dXw0DZOKkdwssdcM3B+qVGAkJ79wmIcqKKy+8DwwIUFgnlcD1x3dBYhOj/?=
 =?iso-8859-1?Q?yZFbiSotw6cyUjyQQj2ZB8bE5j+tikaIFFBZXDDezV5lfQJmNQ22T2swaa?=
 =?iso-8859-1?Q?c1L7ltSSOKNUlxqk0/NUQq8Gx8T5DMJhuq8O98aR5c6p2Uua66hZeH9NTv?=
 =?iso-8859-1?Q?vrsKbE6JIqMCEX+gaPmJ3WzKS9y0ewuH/U1Q3yQmlBF4ngyHzBoz2wylYv?=
 =?iso-8859-1?Q?gOUrF/zGQHip3ma6lWNnwYnTtF/pvh8X7KaiXcwKXobLZon9pea9JSQtbR?=
 =?iso-8859-1?Q?X98vx7+rXGBd56AZNIdRvmJlbRewv4oozltvaxAvSKNTF4Cqq0xJI2XQ1v?=
 =?iso-8859-1?Q?X13dA6RkLg4xMQFj9PZIZhD1Vi+rcMYsZh/fh8jJjLYuoraO8nHPB6b0E7?=
 =?iso-8859-1?Q?yzkuxr0OOI5uHuUbgb+RqveUjGOmnWFvRcxkdqtQHEGdp6hc5YtkrpR5iu?=
 =?iso-8859-1?Q?xnroLIdcHeVI1lXTiEFA7xqQvxbnCJEwh/PcVqO7xuRL+W9jsCRBVANEkA?=
 =?iso-8859-1?Q?ZsYw9NZ4kqgq403AX3mq9bJ/9TLvwdhhhuRnAihvy8jV2T45/3fJoUexk9?=
 =?iso-8859-1?Q?eNQYHPYPgVeXZTwLmqE/vP/3wGHfH4cFiSpJXxdHZE8Z6KORjsjeZlNwEG?=
 =?iso-8859-1?Q?VU7V5G1cTDgLE1WZ2w5I02sZ0u5e9ZWf1OGM9vyHQJNyAT750FfuUw+n+v?=
 =?iso-8859-1?Q?dQ3g/6dkrN/QbeGRDAw2yVTfV0o+T4CvnXLN50Em2Wb5lXsgzz9Oxybtyv?=
 =?iso-8859-1?Q?k1ES5EO7+Tit680+vq3a8AreNGCM4BovqHFJwydE8gEwO1p29J+glVGhZq?=
 =?iso-8859-1?Q?Z6pW/DRl9gQlli6EZwjZCXSp2sOD8+noAoYoSASZ0epi0YC3Wb+WkA37lb?=
 =?iso-8859-1?Q?1YqNRvCchVKaNxLAcWLHh8YfMK4ax6dw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?RNNvTKSPCY8cCrWv/NSS5MLutMcU7VfFt7SiCeFYNI01FfwNx03USWO1eq?=
 =?iso-8859-1?Q?+zs/GbVnQEATkxjlSVwvfCO/2WPdSU4Z1tLUuAVaVF6Jp5Wo0fe+0u8eNe?=
 =?iso-8859-1?Q?eWG3/WctHxZC48R9hPDBWOPoCh8GbPc93/D0gKEofMnSxv8kilJs45h4uN?=
 =?iso-8859-1?Q?8P+VIt033nPFxe0budoOCgAK2NS1/qCqatq3Ltye9n2uAWo3QPEJlwuSE+?=
 =?iso-8859-1?Q?FVFHaNgrqUFdXu51m3GuYvTiAxpzgIsREl5CPIsypT7Upm4kGXCQlJ/Lrc?=
 =?iso-8859-1?Q?Nfj5mXEQPU9FnZ0KmicjPl5B8692F6GuaNmjsnlGHOrXEqoVb4uH4QuJS0?=
 =?iso-8859-1?Q?sqe1Gb9FpVTB3hI+s0enlt59hhuKMJos5K1aF0Hnc7xh4tG1mIMP4urynH?=
 =?iso-8859-1?Q?aKJPMd1h+m72meqZmO0qcs0ANIkIqp95ox0BF+6qDn4AMPljKUL5TcK1UJ?=
 =?iso-8859-1?Q?Gk4zbwJYs1CExnH/gQSVT568yEoArghbJ7IfCeUQXgaSeMdjjPGNV9LGMY?=
 =?iso-8859-1?Q?cdWo3JBfSiLcE3dq5917ZoQ9N8DuEykQerXp0i8HKI4QsWjaK9mRJRxOV+?=
 =?iso-8859-1?Q?LiOfIKkSMz4RQCB8gP4crVtr24yFp86kgvnRE671eIQ4SCrESergIl1Zpq?=
 =?iso-8859-1?Q?z5nUtExNJH099xzkjOxpeMsKs7+ALHi+GS4oCtC9Nu2bZ5iZYD3nScqiMW?=
 =?iso-8859-1?Q?ajKdegmtyymYrP6DyLPuf18VLECy4W4G7g87GMdK5MMIAdchjBTRvvYSxR?=
 =?iso-8859-1?Q?Gb9y8XsE9a767xjVrPWCwM8Dtm7plVG2z+kRARrrQwhmR22zRVnU9ZVN/I?=
 =?iso-8859-1?Q?kcAK/gEvc0FmyI2E4xfaqkMgf9fA6tTDhbu9vvBNHLSJtOW+CevMqH4j9y?=
 =?iso-8859-1?Q?PxflNkii8Gvs6cjMGpjSPPQJEOdfgPak+mBxy4M7HKd8zInYiCXSwMoqlH?=
 =?iso-8859-1?Q?FJsBFXhh4EBTqcdxz8mxuawsVhv7sXWaVBD5Kb3geJ3Jt4Hzzc1BTxpMOa?=
 =?iso-8859-1?Q?BncGmbWlyF37kf8z7HxT00xX5NTge72fY97QFCsabJ/5JWivb2/YSPEV6J?=
 =?iso-8859-1?Q?Fygc082Jn+HL7OE2Gn8P2ovUTV/q6VgTsK5eHVbDvk5i3/bpd0pVyMckW6?=
 =?iso-8859-1?Q?FKflYz84VFr2TtBulO8JIKkoKVK+KmpUvsESmyVxuxQ2lLurPH3FxuQIDx?=
 =?iso-8859-1?Q?KGxqm7VKpyYEJYzkJZoladc+yNvdjBBLYKIuBE9BWQ0SSV1cgkCxt58M2u?=
 =?iso-8859-1?Q?Juc1bG+0Mc+denT19APUGXvfHpJFyRlibcvYzHLQdwfBiQI1fesAH53vFd?=
 =?iso-8859-1?Q?B3nep2tGM7Ql6JAnrWVjfUxUJur2sfQNvPN6/wlR+swiQ3j0zwWz1/bP88?=
 =?iso-8859-1?Q?46bupcM5HAyycPsVACeogN/84+8OSlAbYdnSgmXVGhkn21HFAdXJa2Optk?=
 =?iso-8859-1?Q?ggrvzplMnNyo9+/FJ/65MYw0v5IasLrLDTe9FuE8tzaln1TRA6rk5xZ94c?=
 =?iso-8859-1?Q?WQEBUawxcgsoyA/CLKk3B0toaN3zxEgwaREAO4ybI68Tfhj9GbZRe0nMCK?=
 =?iso-8859-1?Q?wwNk+EpAVjO68ctAyVZny2fNKUXcY46kUzbNqoBiiWdkASxl+DP2gisIHw?=
 =?iso-8859-1?Q?h/kJ0SOnonWqgzHj/83xg5lsHi/CQmsiklV6ddHmqdSVeISPuzmsiSKQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1655c417-2bce-4c81-51e5-08dce7e20103
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2024 21:41:44.5110 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hqCHO9yhnze6J5BURfV6ekBgDWth57bTyEsaJoAiZl6HVyUdEwaOYQk880jyRRPxHa7FiJ9zzL+f4Gp0jDaRBgEZLAqoE5jJ1ej9rsj7wWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6667
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Thomas=
 Zimmermann
Sent: Tuesday, October 8, 2024 5:00 AM
To: simona@ffwll.ch; airlied@gmail.com; javierm@redhat.com; jfalempe@redhat=
.com
Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; intel-g=
fx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Thomas Zimmermann=
 <tzimmermann@suse.de>; Alex Deucher <alexander.deucher@amd.com>; Christian=
 K=F6nig <christian.koenig@amd.com>; Xinhui Pan <Xinhui.Pan@amd.com>
Subject: [PATCH v3 11/12] drm/client: Make client support optional
>=20
> Only build client code if DRM_CLIENT has been selected. Automatially
> do so if one of the default clients has been enabled. If client support
> has been disabled, the helpers for client-related events are empty and
> the regular client functions are not present.
>=20
> Amdgpu has an internal DRM client, so it has to select DRM_CLIENT by
> itself unconditionally.
>=20
> v3:
> - provide empty drm_client_debugfs_init() if DRM_CLIENT=3Dn (kernel
>   test robot)
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=F6nig" <christian.koenig@amd.com>
> Cc: Xinhui Pan <Xinhui.Pan@amd.com>

LGTM.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/Kconfig            | 10 ++++++++++
>  drivers/gpu/drm/Makefile           |  7 ++++---
>  drivers/gpu/drm/amd/amdgpu/Kconfig |  1 +
>  drivers/gpu/drm/drm_client_event.c |  2 ++
>  drivers/gpu/drm/drm_debugfs.c      |  1 -
>  drivers/gpu/drm/drm_internal.h     |  8 ++++++++
>  include/drm/drm_client.h           |  2 --
>  include/drm/drm_client_event.h     | 13 +++++++++++++
>  8 files changed, 38 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 88c4837d070c..ea1cc924528c 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -209,6 +209,15 @@ config DRM_DEBUG_MODESET_LOCK
> =20
>  	  If in doubt, say "N".
> =20
> +config DRM_CLIENT
> +	bool
> +	depends on DRM
> +	help
> +	  Enables support for DRM clients. DRM drivers that need
> +	  struct drm_client_dev and its interfaces should select this
> +	  option. Drivers that support the default clients should
> +	  select DRM_CLIENT_SELECTION instead.
> +
>  config DRM_CLIENT_SELECTION
>  	bool
>  	depends on DRM
> @@ -224,6 +233,7 @@ config DRM_CLIENT_SETUP
>  config DRM_FBDEV_EMULATION
>  	bool "Enable legacy fbdev support for your modesetting driver"
>  	depends on DRM
> +	select DRM_CLIENT
>  	select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
>  	default FB
>  	help
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 6b7d168ca790..c3e5d353588e 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -41,9 +41,6 @@ drm-y :=3D \
>  	drm_blend.o \
>  	drm_bridge.o \
>  	drm_cache.o \
> -	drm_client.o \
> -	drm_client_event.o \
> -	drm_client_modeset.o \
>  	drm_color_mgmt.o \
>  	drm_connector.o \
>  	drm_crtc.o \
> @@ -77,6 +74,10 @@ drm-y :=3D \
>  	drm_vblank_work.o \
>  	drm_vma_manager.o \
>  	drm_writeback.o
> +drm-$(CONFIG_DRM_CLIENT) +=3D \
> +	drm_client.o \
> +	drm_client_event.o \
> +	drm_client_modeset.o
>  drm-$(CONFIG_DRM_LIB_RANDOM) +=3D lib/drm_random.o
>  drm-$(CONFIG_COMPAT) +=3D drm_ioc32.o
>  drm-$(CONFIG_DRM_PANEL) +=3D drm_panel.o
> diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amd=
gpu/Kconfig
> index 680a94c361ba..41fa3377d9cf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Kconfig
> +++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
> @@ -5,6 +5,7 @@ config DRM_AMDGPU
>  	depends on DRM && PCI && MMU
>  	depends on !UML
>  	select FW_LOADER
> +	select DRM_CLIENT
>  	select DRM_CLIENT_SELECTION
>  	select DRM_DISPLAY_DP_HELPER
>  	select DRM_DISPLAY_DSC_HELPER
> diff --git a/drivers/gpu/drm/drm_client_event.c b/drivers/gpu/drm/drm_cli=
ent_event.c
> index c52e93643672..e303de564485 100644
> --- a/drivers/gpu/drm/drm_client_event.c
> +++ b/drivers/gpu/drm/drm_client_event.c
> @@ -14,6 +14,8 @@
>  #include <drm/drm_drv.h>
>  #include <drm/drm_print.h>
> =20
> +#include "drm_internal.h"
> +
>  /**
>   * drm_client_dev_unregister - Unregister clients
>   * @dev: DRM device
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.=
c
> index 9d3e6dd68810..5844a9234d9f 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -32,7 +32,6 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_auth.h>
>  #include <drm/drm_bridge.h>
> -#include <drm/drm_client.h>
>  #include <drm/drm_debugfs.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_drv.h>
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_interna=
l.h
> index 9af72bab86d1..0bfcba6949b0 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -48,6 +48,14 @@ struct drm_prime_file_private;
>  struct drm_printer;
>  struct drm_vblank_crtc;
> =20
> +/* drm_client_event.c */
> +#if defined(CONFIG_DRM_CLIENT)
> +void drm_client_debugfs_init(struct drm_device *dev);
> +#else
> +static inline void drm_client_debugfs_init(struct drm_device *dev)
> +{ }
> +#endif
> +
>  /* drm_file.c */
>  extern struct mutex drm_global_mutex;
>  bool drm_dev_needs_global_mutex(struct drm_device *dev);
> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
> index c03c4b0f3e94..3b13cf29ed55 100644
> --- a/include/drm/drm_client.h
> +++ b/include/drm/drm_client.h
> @@ -236,6 +236,4 @@ int drm_client_modeset_dpms(struct drm_client_dev *cl=
ient, int mode);
>  	drm_for_each_connector_iter(connector, iter) \
>  		if (connector->connector_type !=3D DRM_MODE_CONNECTOR_WRITEBACK)
> =20
> -void drm_client_debugfs_init(struct drm_device *dev);
> -
>  #endif
> diff --git a/include/drm/drm_client_event.h b/include/drm/drm_client_even=
t.h
> index 72c97d111169..99863554b055 100644
> --- a/include/drm/drm_client_event.h
> +++ b/include/drm/drm_client_event.h
> @@ -5,10 +5,23 @@
> =20
>  struct drm_device;
> =20
> +#if defined(CONFIG_DRM_CLIENT)
>  void drm_client_dev_unregister(struct drm_device *dev);
>  void drm_client_dev_hotplug(struct drm_device *dev);
>  void drm_client_dev_restore(struct drm_device *dev);
>  void drm_client_dev_suspend(struct drm_device *dev, bool holds_console_l=
ock);
>  void drm_client_dev_resume(struct drm_device *dev, bool holds_console_lo=
ck);
> +#else
> +static inline void drm_client_dev_unregister(struct drm_device *dev)
> +{ }
> +static inline void drm_client_dev_hotplug(struct drm_device *dev)
> +{ }
> +static inline void drm_client_dev_restore(struct drm_device *dev)
> +{ }
> +static inline void drm_client_dev_suspend(struct drm_device *dev, bool h=
olds_console_lock)
> +{ }
> +static inline void drm_client_dev_resume(struct drm_device *dev, bool ho=
lds_console_lock)
> +{ }
> +#endif
> =20
>  #endif
> --=20
> 2.46.0
>=20
>=20
