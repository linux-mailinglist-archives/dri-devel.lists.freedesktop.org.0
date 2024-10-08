Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24648995939
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 23:22:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7856610E1CD;
	Tue,  8 Oct 2024 21:22:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W+S4H9Vr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBA6B10E1CD;
 Tue,  8 Oct 2024 21:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728422519; x=1759958519;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=X3rDfNft/ThWLLo5QQ512ag3YlVDSRE0nc7xiZ7dVi0=;
 b=W+S4H9VrlebfzW/Ge6GgCJwXRq6AGOSSvZwudYFtrLYd3qQzbEYP6V2G
 MI8eUNZOjlSEb3iBkyz5rVz39KlroODFleLaDYXmPLkZBseAWyRbMsnXP
 7JLTUKIF3k8GrGDDTv8Tdj3Un/q4HlNQ4JiepRBoFUIyebmHV7qDzxJbD
 l+4AQMxwsb0vNfNZqeXA7mc/aYYEW7EjW80hWy6KDZolFsV3/EXtk0Uq8
 hq2puNT+dwqFX226X80j54mR8cZc9gvdPbo4jYOgcySCfzmlhgqT0U9QQ
 45bWSs5UsrGP497zQo0zg3b62L8Viuc35zIt5PLaniFYjNKr6JuBm3B0t Q==;
X-CSE-ConnectionGUID: k/sgw4CGSfS0CLkAYseVQw==
X-CSE-MsgGUID: Ob0Or4PrQFiqs+Z3TDMbww==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27149794"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="27149794"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 14:21:57 -0700
X-CSE-ConnectionGUID: 8z6J2xzXQOSo37XKznw2gg==
X-CSE-MsgGUID: cQ/PcQWnSY6cUfcm3nyFwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="75680117"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 14:21:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 14:21:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 14:21:56 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 14:21:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YpBYjn28Upjr+dHoTI6CkVuW5oYzTGMSKFrEJvH6M0f5oP0KCjhac3J74aFl/ljjqvlDlfJcsip+CRTtQ8Hrfrc52u4IIdz+rdtGMHGndeDtNay8XO/G/DohPOo4EwNld2uM3Afyrb1WOeFhwskSk/cz5VJ6FyYp2+iMLLL5HTrTuetD6pvoYPx+BrFefDPcNcw+IHoxiRPia01c/B3W2DzX6NYfBV5TPGybjuvAZUbvmwoiyK+6nJCcYiLOmnJdHhCW6ikmRfE3VTucQreJVy/Kg8MLl8bUKsInjjMopOKks1dLPHwv6YlSUWLs10BnpJneV6hTyyUXkl0hon0kJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1tS8aK6/YHgoNTp6GiOc+zuvOuYMJ6a1h3qfK9qMth4=;
 b=CKpq0xTAOk0IvGCHZur436E2BzFoPbfJ5c7KfVk9htGQujPBq5yEvCj7EHwYBPjrRZ/ofJkLWSqtvD3wdyHHHUerKxIHMsplF73uXesCp7qkolKMoftuPJ9USxzlMh8IJTbVECvoRTFoYTm6Q70vDCem7izrwKPidLZJvuPejaAHvB+fVO2RT+ghQV23dhUdjgDLLIntXOdxwXIEd/2toQDcuNnMviOReHsIxQsXCA433hM4IHtfaaajDyPyYRotMLabt2tlWzEksFWxd+yo+alGigXZlMC08dBvEJhLmCV31wEvhJO6k+XukJh/cHi63/wYxs4SWuKLUT7MnMakXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH8PR11MB6853.namprd11.prod.outlook.com (2603:10b6:510:22e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 21:21:53 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 21:21:52 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "airlied@gmail.com" <airlied@gmail.com>,
 "javierm@redhat.com" <javierm@redhat.com>, "jfalempe@redhat.com"
 <jfalempe@redhat.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v3 07/12] drm/client: Move suspend/resume into DRM client
 callbacks
Thread-Topic: [PATCH v3 07/12] drm/client: Move suspend/resume into DRM client
 callbacks
Thread-Index: AQHbGXqjtWUfvE/4Q06jPKTzdbirH7J9Rl3w
Date: Tue, 8 Oct 2024 21:21:52 +0000
Message-ID: <CH0PR11MB5444C981845CAE455287FCF5E57E2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241008120652.159190-1-tzimmermann@suse.de>
 <20241008120652.159190-8-tzimmermann@suse.de>
In-Reply-To: <20241008120652.159190-8-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH8PR11MB6853:EE_
x-ms-office365-filtering-correlation-id: 8c2dfec9-90cb-4c05-8f83-08dce7df3abb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?HDzL8i39VaREIShT0lw30I8faOkgSXT6F+uTrf3fujN1z11htzucyO4z+Y6m?=
 =?us-ascii?Q?+r00D3lEGk2VTU/rhkgsv2l1GW3bXQzEDi8NP5H+fXcE1pEDjEt9I2IeGBni?=
 =?us-ascii?Q?64ZeumZQVBIXtYTfYbYuAaCVEy0AwaCGPbkoT1CTYrKAczhYAZHmBOiiJJMd?=
 =?us-ascii?Q?8NNJiTitz/Emk/jxFBR9yrN9xTQGfwvi1ucCOcqMgI28zCE95m9u8mWqSEnP?=
 =?us-ascii?Q?MHg5uzGHx1bzHKyT7og/7ouYb82YwSrX1Oid2xYg1QCkiT5Iqyd8ATsOCZo7?=
 =?us-ascii?Q?tbkHD0v6dBiDIM0Kihz7uU52wXe90k/mX/88D9WDn+ONppLFC73+EraAZgRC?=
 =?us-ascii?Q?97vPcPrUmShkjrKvO9nT8n9sDTCBf51Ti3v8+/HfIyVD059e37QOsv44wDW+?=
 =?us-ascii?Q?B5qLlWCgu4xd90EBLumljywdQaYgA/z3KdOVdBFn1LX3IdVjhBTqYohnfz7F?=
 =?us-ascii?Q?xbHxlbBNmVU2sk8SosreHh0cei361wmkUm0IT/xj2jCQ0LOw8u2Qcg4L8b7x?=
 =?us-ascii?Q?aqkXas81R4loU7P3G5fGXnnc5Qd0QRCkWcDiTRpeWWH6oKwNU8InubU4yl9S?=
 =?us-ascii?Q?uZcVeue7rAKhERBH8DQbM5nL6VMbS2ZhIz4J+pI4oXZlGcq87pXq9iK7PWUk?=
 =?us-ascii?Q?G0kyczO3q2aWbHYotLFlW1NZXuF6R0CCeYa9y/vLImnCG5JCaifk92DGHKeY?=
 =?us-ascii?Q?XrPQy7gXI7gCSLCnoMSROPe9QYVaVs5pFxKSvJRsH3W56ZkCG1SIYInXjmNM?=
 =?us-ascii?Q?uC7/f3zzhkKqriWQa0Wf4jWoV8TA/W9c4sBgerDDNnGgr2xgmFCscK0HZKes?=
 =?us-ascii?Q?Hp13lt0GL/TSeVAdNqxsgX5BM7LkTQ6ULRk82ZOu4vBScLGTe5bL77yFXn95?=
 =?us-ascii?Q?SrHcM4sBGxcHdyF6/ywjF4CjzFaEWPIs8aKQB+r6DdBzeGQ1tIKryzgoaurm?=
 =?us-ascii?Q?2sgpoLP5m9AgamkA/1C8Aj9euEfKIdg0ezOP9ta9htnL2g8rB5DkaCGIuVHd?=
 =?us-ascii?Q?kLAztmCT48F1GP8pyWoSLt8ZoQN66moFE92lyk9BcArVHeByBmI2IAHSdlv1?=
 =?us-ascii?Q?UksS6p5qG1zAJlveY1NXHrTQmPasxi3jUByhjstjOymu1LiM7K9lVmoWRixb?=
 =?us-ascii?Q?xVmUGyARi/dIIWXj1E9P2pGGub3UoQ14Abv7r2JYvC15Ria/sK1jMCWsmG3/?=
 =?us-ascii?Q?hI9dLep3Q+oWUWgoeBXYo764taoQymBgq+NumtoRVT5sQ5AQM91/1EHx1V+F?=
 =?us-ascii?Q?HvmMkjyFXyUXP/m6/bDczl4SavQDusjvfPPV3POWww92502RSGVvKbpWhDKt?=
 =?us-ascii?Q?qEMtd7ZxN4KhhSmItE0EU2L9im+9gVxIiqBl/UgrJ7yLIg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qlJXodChXW29uT7qPt1mgOfJMUR2Zpq4/j7GO7tjsT7AxWZ34STP0bUxyZ9+?=
 =?us-ascii?Q?8r96jNPvkgHPEw2EL9YBAWt/4XNHBITf/FwpIODmfq/uiH/Eeo9YKoCkFBFF?=
 =?us-ascii?Q?RIVDocBdocSlEPk9U6ztXixZhR1UXA1TAuE07xj+9VUq9lQJKYnY8/z4W/FN?=
 =?us-ascii?Q?3Y9ITq6RlUKI9pizwmrAVIhAoLlOJrAn3BXgy8NuXY3TnsKPPlkgID1lmqY4?=
 =?us-ascii?Q?4eUFNNepYNOl8bYZa35e/rYJd1s7nUJw4i+WegbNB/dUkuFfWPkEbN9ghrMl?=
 =?us-ascii?Q?N4qswKysEeLZCoA1bbdfCnyXx+Iz9ddlEBZdNKTccZCAvnM3voAFGdHP/65m?=
 =?us-ascii?Q?KclKnlx4KMqGrEeoxfFJmUVt9o4vNAkSFbiCYsVBQ1Tk1Eb/el7jwFUX0zjH?=
 =?us-ascii?Q?hb9W3tggI8clxBXxzFHeBW/mceCMFmjQ1gZH8d4me4ZveIB5dZvA+YqREthV?=
 =?us-ascii?Q?fjEfkUMXy8Rt5+wfND8DtuxCzaRlmvDQgFDXBGpGkY0DuxzO5K5nJGLJ9HzY?=
 =?us-ascii?Q?uIzHzPVcKlkCrIFYk6+gfkQ2oQAXWCFzF2ZfcFo5W2zIXMIHTBr/FYCT6NrQ?=
 =?us-ascii?Q?IM/zaytx3ULVbLAu9dFaLLFewaPFZhLE9bGMtFxahgLtvquQ16XHBqbb9mpU?=
 =?us-ascii?Q?qaOo91w63E79w9WvByU11gW1pe+KAoKaJFnJ64JcxJHR/WT+KuCiwm03eDD/?=
 =?us-ascii?Q?Bmaz/aBreQUu+6Gi9zI218ZMVt2fLG0AJEjhRlIVGOXqUjr4J0DMz0rb/yKS?=
 =?us-ascii?Q?GgmOTTmu2ZLQjl6qBD9eE4bs8YSBazfk21E8501Xke5dgwojo8gt/PBQhn3w?=
 =?us-ascii?Q?9hfb5LqlxNIxYlhJ/zTrKznMXIN25rZKucI+YbHfE5IBIZ1qCB2JwQGDGI7G?=
 =?us-ascii?Q?uYIevho4lZ/8YV3Omk5kmBgMeaG/PrJ9XMHYNV0pHmQiGzgv+9MqVeTp+Q9t?=
 =?us-ascii?Q?IuBeuxVpMT7lTFtm/FRriteEEzC4SxkTA27BfUacCGuuq/yzfvGJtXvjJ0N7?=
 =?us-ascii?Q?Y37510lmSCF4lUAehvn7VCg2pw2+uu/tKwX6WVfoICrNxXenMr2fY0iItyiR?=
 =?us-ascii?Q?Uxo2jvEmuWfjTgNvO29krVIK6pe+Y/v3X1vA8qZrl2sQTc6KKHL1JHMYdSf5?=
 =?us-ascii?Q?VniO0gbRRgJe6sEt3Bigmiz4ZEZPLNYmt9Gvt0QHn6GmvfAW5XTZOZGm22+x?=
 =?us-ascii?Q?o3mOEhMKNAL0o4Ak5xpGFCD0I68XniZyAlOQg49GFpntF+Afp/66sLEwykoi?=
 =?us-ascii?Q?e8j5QyIDtfVJAANyWKuIPrnBxqcepXXii+FW1PqYQTrwLO9pz1QVevYCauzz?=
 =?us-ascii?Q?RB32HdYgBs+ASbOs6mo8CehsKe0olN2rslP75NZ+OrG8U28j7sCdaqqh5Nze?=
 =?us-ascii?Q?A2yMidSr4zGkdagIh5MQ81P+DxWyzEL7jKjVxeqkEYTS7r0fCzHH8ggfcb8b?=
 =?us-ascii?Q?zpQ3cCL9BeoF8Nf/UYBXMkNOhu+ti5YbqONNH1xp29CLXJGwOsqLw3to6otR?=
 =?us-ascii?Q?VFxRyxERBWaPosxByXuvXr6gUgI2MmgOh0eYc1d5+J9yA5cYrZF6l/6DFUPi?=
 =?us-ascii?Q?AKhZtGPZVNvIZJXUwzxb1MXdHa4YGxP/pT4LCMSd6gEp0yC3f8CCsSjgT7UH?=
 =?us-ascii?Q?3w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c2dfec9-90cb-4c05-8f83-08dce7df3abb
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2024 21:21:52.8513 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1FV+jHgvYP7llvE6nBqxFBJdsJ9zyyYdE2S9cqq67T4ovh7G0/WtWP4Q5meQHVC5cQ30IxnoM58dTJDh7XCKltN7wf83bfk/H46NovUfe+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6853
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
Sent: Tuesday, October 8, 2024 4:59 AM
To: simona@ffwll.ch; airlied@gmail.com; javierm@redhat.com; jfalempe@redhat=
.com
Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; intel-g=
fx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Thomas Zimmermann=
 <tzimmermann@suse.de>
Subject: [PATCH v3 07/12] drm/client: Move suspend/resume into DRM client c=
allbacks
>=20
> Suspend and resume is still tied to fbdev emulation. Modeset helpers
> and several drivers call drm_fb_helper_set_suspend_unlocked() to inform
> the fbdev client about suspend/resume events.
>=20
> To make it work with arbitrary clients, add per-client callback
> functions for suspend and resume. Implement them for fbdev emulation
> with the existing drm_fb_helper_set_suspend_unlocked(). Then update
> DRM's modeset helpers to call the new interface.
>=20
> Clients that are not fbdev can now implement suspend/resume to their
> requirements.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Some questions below, but nothing blocking.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

> ---
>  drivers/gpu/drm/drm_client_event.c   | 60 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_fbdev_client.c   | 30 +++++++++++++-
>  drivers/gpu/drm/drm_modeset_helper.c | 14 ++++---
>  include/drm/drm_client.h             | 35 ++++++++++++++++
>  include/drm/drm_client_event.h       |  2 +
>  5 files changed, 133 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_client_event.c b/drivers/gpu/drm/drm_cli=
ent_event.c
> index d13d44320c5c..c52e93643672 100644
> --- a/drivers/gpu/drm/drm_client_event.c
> +++ b/drivers/gpu/drm/drm_client_event.c
> @@ -107,6 +107,66 @@ void drm_client_dev_restore(struct drm_device *dev)
>  	mutex_unlock(&dev->clientlist_mutex);
>  }
> =20
> +static int drm_client_suspend(struct drm_client_dev *client, bool holds_=
console_lock)
> +{
> +	struct drm_device *dev =3D client->dev;
> +	int ret =3D 0;
> +
> +	if (drm_WARN_ON_ONCE(dev, client->suspended))
> +		return 0;
> +
> +	if (client->funcs && client->funcs->suspend)
> +		ret =3D client->funcs->suspend(client, holds_console_lock);
> +	drm_dbg_kms(dev, "%s: ret=3D%d\n", client->name, ret);
> +
> +	client->suspended =3D true;
> +
> +	return ret;
> +}
> +
> +void drm_client_dev_suspend(struct drm_device *dev, bool holds_console_l=
ock)
> +{
> +	struct drm_client_dev *client;
> +
> +	mutex_lock(&dev->clientlist_mutex);
> +	list_for_each_entry(client, &dev->clientlist, list) {
> +		if (!client->suspended)
> +			drm_client_suspend(client, holds_console_lock);
> +	}
> +	mutex_unlock(&dev->clientlist_mutex);
> +}
> +EXPORT_SYMBOL(drm_client_dev_suspend);
> +
> +static int drm_client_resume(struct drm_client_dev *client, bool holds_c=
onsole_lock)
> +{
> +	struct drm_device *dev =3D client->dev;
> +	int ret =3D 0;
> +
> +	if (drm_WARN_ON_ONCE(dev, !client->suspended))
> +		return 0;
> +
> +	if (client->funcs && client->funcs->resume)
> +		ret =3D client->funcs->resume(client, holds_console_lock);
> +	drm_dbg_kms(dev, "%s: ret=3D%d\n", client->name, ret);
> +
> +	client->suspended =3D false;
> +
> +	return ret;
> +}
> +
> +void drm_client_dev_resume(struct drm_device *dev, bool holds_console_lo=
ck)
> +{
> +	struct drm_client_dev *client;
> +
> +	mutex_lock(&dev->clientlist_mutex);
> +	list_for_each_entry(client, &dev->clientlist, list) {
> +		if  (client->suspended)
> +			drm_client_resume(client, holds_console_lock);
> +	}
> +	mutex_unlock(&dev->clientlist_mutex);
> +}
> +EXPORT_SYMBOL(drm_client_dev_resume);

I had to double check, as it seemed a bit weird to have a Boolean "holds_co=
nsole_lock"
if it was always going to be False in the use cases presented in this patch=
, but we do set
it to True in the Radeon use case in patch 10, so that makes more sense.

> +
>  #ifdef CONFIG_DEBUG_FS
>  static int drm_client_debugfs_internal_clients(struct seq_file *m, void =
*data)
>  {
> diff --git a/drivers/gpu/drm/drm_fbdev_client.c b/drivers/gpu/drm/drm_fbd=
ev_client.c
> index a09382afe2fb..246fb63ab250 100644
> --- a/drivers/gpu/drm/drm_fbdev_client.c
> +++ b/drivers/gpu/drm/drm_fbdev_client.c
> @@ -61,11 +61,37 @@ static int drm_fbdev_client_hotplug(struct drm_client=
_dev *client)
>  	return ret;
>  }
> =20
> +static int drm_fbdev_client_suspend(struct drm_client_dev *client, bool =
holds_console_lock)
> +{
> +	struct drm_fb_helper *fb_helper =3D drm_fb_helper_from_client(client);
> +
> +	if (holds_console_lock)
> +		drm_fb_helper_set_suspend(fb_helper, true);
> +	else
> +		drm_fb_helper_set_suspend_unlocked(fb_helper, true);
> +
> +	return 0;
> +}
> +
> +static int drm_fbdev_client_resume(struct drm_client_dev *client, bool h=
olds_console_lock)
> +{
> +	struct drm_fb_helper *fb_helper =3D drm_fb_helper_from_client(client);
> +
> +	if (holds_console_lock)
> +		drm_fb_helper_set_suspend(fb_helper, false);
> +	else
> +		drm_fb_helper_set_suspend_unlocked(fb_helper, false);
> +
> +	return 0;
> +}
> +
>  static const struct drm_client_funcs drm_fbdev_client_funcs =3D {
>  	.owner		=3D THIS_MODULE,
>  	.unregister	=3D drm_fbdev_client_unregister,
>  	.restore	=3D drm_fbdev_client_restore,
>  	.hotplug	=3D drm_fbdev_client_hotplug,
> +	.suspend	=3D drm_fbdev_client_suspend,
> +	.resume		=3D drm_fbdev_client_resume,
>  };

Just a question for my own understanding:


The expected order of operations here is:

drm_mode_config_helper_suspend calls drm_client_dev_suspend

drm_client_dev_suspend calls drm_client_suspend

drm_client_suspend calls client->funcs->suspend, which for fbdev is=20
drm_fbdev_client_suspend

drm_fbdev_client_suspend calls drm_fb_helper_set_suspend(_unlocked)

And, circling back to the start, drm_mode_config_helper_suspend is called b=
y
several drivers in the suspend case.


Is this correct?

> =20
>  /**
> @@ -76,8 +102,8 @@ static const struct drm_client_funcs drm_fbdev_client_=
funcs =3D {
>   *
>   * This function sets up fbdev emulation. Restore, hotplug events and
>   * teardown are all taken care of. Drivers that do suspend/resume need
> - * to call drm_fb_helper_set_suspend_unlocked() themselves. Simple
> - * drivers might use drm_mode_config_helper_suspend().
> + * to call drm_client_dev_suspend() and drm_client_dev_resume() by
> + * themselves. Simple drivers might use drm_mode_config_helper_suspend()=
.
>   *
>   * This function is safe to call even when there are no connectors prese=
nt.
>   * Setup will be retried on the next hotplug event.
> diff --git a/drivers/gpu/drm/drm_modeset_helper.c b/drivers/gpu/drm/drm_m=
odeset_helper.c
> index 2c582020cb42..5565464c1734 100644
> --- a/drivers/gpu/drm/drm_modeset_helper.c
> +++ b/drivers/gpu/drm/drm_modeset_helper.c
> @@ -21,7 +21,7 @@
>   */
> =20
>  #include <drm/drm_atomic_helper.h>
> -#include <drm/drm_fb_helper.h>
> +#include <drm/drm_client_event.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_modeset_helper.h>
> @@ -185,7 +185,7 @@ EXPORT_SYMBOL(drm_crtc_init);
>   * Zero on success, negative error code on error.
>   *
>   * See also:
> - * drm_kms_helper_poll_disable() and drm_fb_helper_set_suspend_unlocked(=
).
> + * drm_kms_helper_poll_disable() and drm_client_dev_suspend().
>   */
>  int drm_mode_config_helper_suspend(struct drm_device *dev)
>  {
> @@ -199,10 +199,11 @@ int drm_mode_config_helper_suspend(struct drm_devic=
e *dev)
>  	if (dev->mode_config.poll_enabled)
>  		drm_kms_helper_poll_disable(dev);
> =20
> -	drm_fb_helper_set_suspend_unlocked(dev->fb_helper, 1);
> +	drm_client_dev_suspend(dev, false);
>  	state =3D drm_atomic_helper_suspend(dev);
>  	if (IS_ERR(state)) {
> -		drm_fb_helper_set_suspend_unlocked(dev->fb_helper, 0);
> +		drm_client_dev_resume(dev, false);
> +
>  		/*
>  		 * Don't enable polling if it was never initialized
>  		 */
> @@ -230,7 +231,7 @@ EXPORT_SYMBOL(drm_mode_config_helper_suspend);
>   * Zero on success, negative error code on error.
>   *
>   * See also:
> - * drm_fb_helper_set_suspend_unlocked() and drm_kms_helper_poll_enable()=
.
> + * drm_client_dev_resume() and drm_kms_helper_poll_enable().
>   */
>  int drm_mode_config_helper_resume(struct drm_device *dev)
>  {
> @@ -247,7 +248,8 @@ int drm_mode_config_helper_resume(struct drm_device *=
dev)
>  		DRM_ERROR("Failed to resume (%d)\n", ret);
>  	dev->mode_config.suspend_state =3D NULL;
> =20
> -	drm_fb_helper_set_suspend_unlocked(dev->fb_helper, 0);
> +	drm_client_dev_resume(dev, false);
> +
>  	/*
>  	 * Don't enable polling if it is not initialized
>  	 */
> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
> index dfd5afcc9463..c03c4b0f3e94 100644
> --- a/include/drm/drm_client.h
> +++ b/include/drm/drm_client.h
> @@ -63,6 +63,34 @@ struct drm_client_funcs {
>  	 * This callback is optional.
>  	 */
>  	int (*hotplug)(struct drm_client_dev *client);
> +
> +	/**
> +	 * @suspend:
> +	 *
> +	 * Called when suspending the device.
> +	 *
> +	 * This callback is optional.
> +	 *
> +	 * FIXME: Some callers hold the console lock when invoking this
> +	 *        function. This interferes with fbdev emulation, which
> +	 *        also tries to acquire the lock. Push the console lock
> +	 *        into the callback and remove 'holds_console_lock'.
> +	 */

Is there an estimated time for the fix to this FIXME?  It's out of scope
for this series, so I won't insist on fixing it immediately, but if it's a
"quick" fix (relatively speaking), then we should definitely try to get
this FIXME resolved in short order.

-Jonathan Cavitt

> +	int (*suspend)(struct drm_client_dev *client, bool holds_console_lock);
> +
> +	/**
> +	 * @resume:
> +	 *
> +	 * Called when resuming the device from suspend.
> +	 *
> +	 * This callback is optional.
> +	 *
> +	 * FIXME: Some callers hold the console lock when invoking this
> +	 *        function. This interferes with fbdev emulation, which
> +	 *        also tries to acquire the lock. Push the console lock
> +	 *        into the callback and remove 'holds_console_lock'.
> +	 */
> +	int (*resume)(struct drm_client_dev *client, bool holds_console_lock);
>  };
> =20
>  /**
> @@ -107,6 +135,13 @@ struct drm_client_dev {
>  	 */
>  	struct drm_mode_set *modesets;
> =20
> +	/**
> +	 * @suspended:
> +	 *
> +	 * The client has been suspended.
> +	 */
> +	bool suspended;
> +
>  	/**
>  	 * @hotplug_failed:
>  	 *
> diff --git a/include/drm/drm_client_event.h b/include/drm/drm_client_even=
t.h
> index 2c8915241120..72c97d111169 100644
> --- a/include/drm/drm_client_event.h
> +++ b/include/drm/drm_client_event.h
> @@ -8,5 +8,7 @@ struct drm_device;
>  void drm_client_dev_unregister(struct drm_device *dev);
>  void drm_client_dev_hotplug(struct drm_device *dev);
>  void drm_client_dev_restore(struct drm_device *dev);
> +void drm_client_dev_suspend(struct drm_device *dev, bool holds_console_l=
ock);
> +void drm_client_dev_resume(struct drm_device *dev, bool holds_console_lo=
ck);
> =20
>  #endif
> --=20
> 2.46.0
>=20
>=20
