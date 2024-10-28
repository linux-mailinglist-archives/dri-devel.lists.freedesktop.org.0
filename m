Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 223229B343A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 16:02:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF5610E4E4;
	Mon, 28 Oct 2024 15:02:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W6hV+FBX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE29110E4E3;
 Mon, 28 Oct 2024 15:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730127727; x=1761663727;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SX1Gj49pRyUkAtQxGyR1qw5pKepbzKZxR+EE0OK70J4=;
 b=W6hV+FBXjXqNOnvGQe93hrr4iiwXMaTKGjx3gAjQmeHfibSE3vfKJNCO
 BrbG4QdkbjHVd83Z9HDaaAkDNxYJ3YOuZ7vBXPl1NDM+LFnBKwe4yqmhD
 yMBirToy0tiGOvyDtCFqXjF5kNWngFUxd9hzCdJPWKtew0XBremUJGFkw
 v2tM6oypqNpMLjRpbFGYgsIl+aL/zThEeeZfYdXIOBwNz/e+zeAObRqlY
 k0aXhGxymM1uu6XUDRO/+VfGAb//4rRKIXZlN/w0QWRaLvQy1J4r+f3ZD
 pCUw1j28kL9AIByYRxNWfW8kAi+XFTEEEDyUSJFYUzdx7Xc/S4oQdp812 w==;
X-CSE-ConnectionGUID: rne/GzJSQZeLY3hiJvB/9Q==
X-CSE-MsgGUID: S0cFo6CwQjyzNlrtV8h0Cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="29158120"
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="29158120"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 08:02:01 -0700
X-CSE-ConnectionGUID: bA20H8FxQKKRvSf4SUNyPA==
X-CSE-MsgGUID: vDvS1xXORMijz1vSwBdXvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="81702870"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Oct 2024 08:02:01 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 28 Oct 2024 08:02:00 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 28 Oct 2024 08:02:00 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 28 Oct 2024 08:02:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cZ4D862nnAH7OfpDOsClNkKQ90jGm62JfUhDeWWwMJ4fwjkovrKGo3KlyiVGcwIBKmXpAUQ36XVhIStYmn0qTXhz7QTHo6xcynafqBMLYuM5ADS4s/J8h6TeFTEJc2Vqm/LcQaS/oR9VFO6E9nFdYW0Pqc7KmmhSRLRcXH3pbXA2MxSzxRk5k1WErQztvjwse/f83N+htCxItG9cLLG4IvrafVSm96dalBeuyDP8U9+3xnQHJq4rWEUwy2KL1T3MkSQpRYdyxa5Umuk3hHPLG9Nz408ZYgJ14EZm3hsCrkI7TeFeC80AGwt4UO8n6k8ftj+p2cvNMmmgHCHpVNIf7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OCHHAJFZGkM+I+J7db71w9rDG37ODZqco0m7oAFhI8k=;
 b=x22Omc9cnASye1bsnTZEu2i4LyWb05E38GpGZV+AMYIQry1qkx1sUV1prtpDDLYIcr2LM5a3XgTzry9jF66MpVVRuaTWj8An5OiFcNw4SH3rb9+Cc2kc63kOj3IvTACHNuDl32/1CMGlHYXOE0OtXvBho0+StdyTYozmp0gyH5YezW3u47n+5UX7/IpGNIuhKh52YFaaM9f4BeUsRav91hsxnc4Q7QC+SkwbBIOltXsdARAHO/kyiZfLTtIwoIfVbHaEXxrDW5UnOiXqB14cm5altt87vJOccxvKylY46aSner6NCbECKRrkTIdAMWuqRvjZuzpAmpFidFqewJhyBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by DS0PR11MB8000.namprd11.prod.outlook.com (2603:10b6:8:128::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Mon, 28 Oct
 2024 15:01:56 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1%5]) with mapi id 15.20.8093.025; Mon, 28 Oct 2024
 15:01:56 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Usyskin, Alexander"
 <alexander.usyskin@intel.com>, "Deak, Imre" <imre.deak@intel.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, =?iso-8859-1?Q?Thomas_Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, "Weil, Oren jer" <oren.jer.weil@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 06/10] mtd: intel-dg: wake card on operations
Thread-Topic: [PATCH 06/10] mtd: intel-dg: wake card on operations
Thread-Index: AQHbJHDIenxuxT0UF0CyvOwDSVQhtbKcSmeAgAAAuWA=
Date: Mon, 28 Oct 2024 15:01:56 +0000
Message-ID: <CY5PR11MB621157335FFB1089F49CEF8B954A2@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20241022104119.3149051-1-alexander.usyskin@intel.com>
 <20241022104119.3149051-7-alexander.usyskin@intel.com>
 <Zx-mPQSHXv5Teq_j@intel.com>
In-Reply-To: <Zx-mPQSHXv5Teq_j@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|DS0PR11MB8000:EE_
x-ms-office365-filtering-correlation-id: 1974801d-0096-4804-badf-08dcf7617754
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?rz3NELzRvbtfk9ny6QZTPv5Cfr3pinBGqAI3Ec+I3fLw7XM4nWfVyLO+Rs?=
 =?iso-8859-1?Q?YYpt8Bmkx0U2Uo9pkzrImpdsLhLquCfDC18g/bDguukK6avgDtehkWnLEO?=
 =?iso-8859-1?Q?HL9Mz2k8aJj+V91PmCt+PClOi8/BlHrWFX2OAdT2LyTlB1Hfp4qGNtur+P?=
 =?iso-8859-1?Q?JD22pOJPuJCzgWNdYV9St+r7FKFNA0rlXokumbQsi1jF4LED8nPoBDxv29?=
 =?iso-8859-1?Q?Jy87/4mYcnDiV3dPhJPaZOaeVQ/Mr8evi3dSJgoLCjoc0/5fgeG4Fuvxni?=
 =?iso-8859-1?Q?YCV93B+AXzUbCq2DsaHxvfXU+nSP5zTXJooeL45f2HlGmbAdVaBRELzZw4?=
 =?iso-8859-1?Q?8HYqiYtgOSc32CEZ7JB0n1F8fG3hcvbVbTIdyf+xW/Zng2JV2AN5R2aPi0?=
 =?iso-8859-1?Q?q96Sfqu/BSE5yrbsa2dYJNz0On1a/1fCp02UOREg3/Of3dV5xBx/rQlGLU?=
 =?iso-8859-1?Q?UylZp6X1FmejqwTXL+XQf+JM875DD8oAG5rdp7+BGmqzn7VlA80fdlBCAe?=
 =?iso-8859-1?Q?f9Iy5sbKBfMAi3qzcOd0vfduh8Xo/AOjXW4k3VyRv6EN5/JlzBLKL6lDA9?=
 =?iso-8859-1?Q?xg1fjkihOXaOnqtsmD0/l3TCo1A7F3bwgmoKUoFX5WtohmCCWC65ztmb0R?=
 =?iso-8859-1?Q?ESevg2zdhENVX+IurlVZQWNEV7MuaC5m/SmVV18aday0Fde+o6YDsyeB4V?=
 =?iso-8859-1?Q?YaLiIDcZexJxo8F4iqxvmo0oDbM7pgk+swVMgsru0rpwdWDMgMdHD5zGjW?=
 =?iso-8859-1?Q?wpWtZBBnrcTrdjfA12gIThvIRg++VwaE+XVRCRVjeXxLBfIvgcnhE8WmCY?=
 =?iso-8859-1?Q?YEql8qs9srTu+Dzv3H/Ky4V6qDXwdWGt36YCsAMqMke999qAD3fIr9tm5r?=
 =?iso-8859-1?Q?jwc53YyPhMRRcrJgpSFx26fNaT8uKjoBo8+6pP/O0kwLj2hNPLnGP46wDd?=
 =?iso-8859-1?Q?gzzaBdNZpYtW2XNDBHjIIh90St0jDRvb9XnBgpubXktZ/WRdDxmmlU7uCj?=
 =?iso-8859-1?Q?x86OYT5h2yBSlMuBDO2kGtJhfF92BFvXhybz/XEz9inmIdh5R5w5HbdABD?=
 =?iso-8859-1?Q?kEehEuXwxmGFWFWmecuIq7rIhZ5RNYc7CS9IrM6zmtBxQFLrj8LXOGaPpN?=
 =?iso-8859-1?Q?c8CCC2iZc4CCNMDTz3ItjHD3KH5qYnELRsm4neDjRQZZXoQdfk0ysCKcQV?=
 =?iso-8859-1?Q?4wvIeYL8HY0VtfsJUyPpnciu34pEHoeAHe9BNlNqDiIZO7yw2WJd0YgII9?=
 =?iso-8859-1?Q?9MuPglLHBGP1UTPmz3nsyftkm6c9hu4zhn/i6sIBtCm4eXNWEkq4rNQj0l?=
 =?iso-8859-1?Q?qWdJ9mgHHCvmUinNeUeGvNLYLAXvjZLW/LQpn70/CN8qZ9ZraTBHZXbBVn?=
 =?iso-8859-1?Q?9fuj8nAGnUlgt/odfgY+Jb38BYbxBnssNtly1MvHnufc4Lls/wRFs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ltZB7+Zd+hRh7MdQgNRLBCf5+HKnlYJgKJUYK2YV6T5Ax0gLi8RUkUg+qV?=
 =?iso-8859-1?Q?1Ic9hfdPjbb+0FYx+PhxO0M00izKqUj0ZUOFm1GBSC2RzPF9++dUxdoqPy?=
 =?iso-8859-1?Q?poVmMG+JI8I56J8e+acqUlYPkmx+3GQX4U4y8rqaWWtRJ0Kho3B79gv/ms?=
 =?iso-8859-1?Q?cQGq7Vw+1CEHFTztPZUaGgxFcVe4bX5xmViCXdcOxsaNjQfwuDtQS+Om5Z?=
 =?iso-8859-1?Q?Csyd+bzYO6QTjg6jZXV/1wu50io8WSUcQQ1NUoug1sSEBZglPYEsEe2n5k?=
 =?iso-8859-1?Q?nuFstacvl0pOQIU+nOTvCp/91oiistIR6EV4qMCs+Ju4fNXs9dPm5q8iOo?=
 =?iso-8859-1?Q?U0HZoFDlMgDNsR6Mc+S8qrADUWkyQaoFiwOcY2U6DKx2Oa4nYZf6Y9uX08?=
 =?iso-8859-1?Q?p3u3b7JIHgykxbto+7ypuYBwvCPUZeXazRjD8fj1iaEPo+OtjDNjL+aTPz?=
 =?iso-8859-1?Q?Tq7ePxONkMDz5DG0uGsaTTkWTvqkMzJQF0WiSM5JO5AUzf/BtuUPfYJin2?=
 =?iso-8859-1?Q?IF6Yul7jHm38mLb0zj8qC7QTRslK5GnqvcDFAMVBO4JZbyLBmeVAw1XsQC?=
 =?iso-8859-1?Q?uzXlsIbG8SEkzLmqNaEPJ3qT0iBW3KhWfjYnpY6mrIlwW7j/Sq46nlf4HK?=
 =?iso-8859-1?Q?l7SZbeTeRp83Ephv0nlYSP1Zkcr1wkKCkQuKlT52lDAi3g+R01bb3EgIx2?=
 =?iso-8859-1?Q?HsvnZ3H0u7UNVCQX5CkMqKA+yBR+C3aNDB7+wuqjdttD9Z/JW9pLB2BVsA?=
 =?iso-8859-1?Q?G8eaMPxJtEjuL2/dHZ8EwG8OoHnTiIsI0QyBgAdrgj5cQSBGs49LndT6KF?=
 =?iso-8859-1?Q?HJnBdu5CaBaGIzyy0epw3buTZSr5v7o90x3J80NBaanppaYAU4Qs9b7Fnh?=
 =?iso-8859-1?Q?3SMlZd9pLFB2O7IDnkzIrhGQPBnZGZJNTgPTrHJ5Lf9jiAQAQ0sCnbv9TS?=
 =?iso-8859-1?Q?SMSAkviwYtnkknVZBIfBY/Pnwa4zqIZ0CwjwInR5W5IFB5R8S3g4PY7sUq?=
 =?iso-8859-1?Q?vIWBjI6MyWLbTDoFA1BpYCgctYy8MtguafqVqgMWujjztRsxMWMB4Li1fX?=
 =?iso-8859-1?Q?Qq+iAh99AZE0YmA8Ui7MMztFOT1xmnI6G8FK5gF7jjiqqEgC5zT3XzOEWy?=
 =?iso-8859-1?Q?eVIm0ptzS09FXUR1MXLlfUF+JPvhZaAefQZulTOBZBCuPtj7QwEjuI3LzO?=
 =?iso-8859-1?Q?9IDpGcGzQdYMGc9tUQD6SQQMmq61oc88rZ7IQq9ymmD4wAg2axJlh8ldcu?=
 =?iso-8859-1?Q?50YO5jRitz3WLEgEuqtxnj+1yOoPFqlcc1vaYuia7oQ9wJbiSGcxSihhC6?=
 =?iso-8859-1?Q?xWZE3FvrJypoxTe5ksK9b0SjSJCyHltIZnxaVYQMYqCIMJ3VPhCN+CbKbV?=
 =?iso-8859-1?Q?EdMbpH3Ka40+B7uhYM+906S0GEt97g9eHMrOym+m+AYVBdKvbDjcpA7dlo?=
 =?iso-8859-1?Q?7NzJBSwWeouKE6vTvQHPgnzFC1uZL0iGITAGtdxiRK8UCWG94eufiwGfH4?=
 =?iso-8859-1?Q?dD4jQHINlwnRl6wImX2hJxx1gYhkqSe8avWR5rPffgwidCFDpU5ztVOvir?=
 =?iso-8859-1?Q?InUBQ4Xgxff9VoyIOUTRVTOgNkfexg6V60kCU49vZJurBf7ATGssNcvuwS?=
 =?iso-8859-1?Q?rTJN7Dg1qFTo8MIDwg3m2wFiXyZwOwFJAv?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1974801d-0096-4804-badf-08dcf7617754
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2024 15:01:56.5423 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MVzAmcsaLBYvQ4J8aM24nB4CGI6kmnYC6AYmETOF1ZNznmfVwGZDCiEJLkR2j5GmE0elAOZdZyWSn0N7Z6FeZ98J3rOVepBXh25Hp49Th2g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8000
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
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: Monday, October 28, 2024 8:27 PM
> To: Usyskin, Alexander <alexander.usyskin@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Deak, Imre <imre.deak@intel.com>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>; Richard Weinberger
> <richard@nod.at>; Vignesh Raghavendra <vigneshr@ti.com>; De Marchi,
> Lucas <lucas.demarchi@intel.com>; Thomas Hellstr=F6m
> <thomas.hellstrom@linux.intel.com>; Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>;
> Thomas Zimmermann <tzimmermann@suse.de>; David Airlie
> <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Jani Nikula
> <jani.nikula@linux.intel.com>; Joonas Lahtinen
> <joonas.lahtinen@linux.intel.com>; Tvrtko Ursulin <tursulin@ursulin.net>;
> Weil, Oren jer <oren.jer.weil@intel.com>; linux-mtd@lists.infradead.org; =
dri-
> devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH 06/10] mtd: intel-dg: wake card on operations
>=20
> On Tue, Oct 22, 2024 at 01:41:15PM +0300, Alexander Usyskin wrote:
> > Enable runtime PM in mtd driver to notify graphics driver that whole
> > card should be kept awake while nvm operations are performed through
> > this driver.
> >
> > CC: Lucas De Marchi <lucas.demarchi@intel.com>
> > Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> > ---
> >  drivers/mtd/devices/mtd-intel-dg.c | 73
> > +++++++++++++++++++++++++-----
> >  1 file changed, 61 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/mtd/devices/mtd-intel-dg.c
> > b/drivers/mtd/devices/mtd-intel-dg.c
> > index 4951438e8faf..3d53f35478e8 100644
> > --- a/drivers/mtd/devices/mtd-intel-dg.c
> > +++ b/drivers/mtd/devices/mtd-intel-dg.c
> > @@ -15,11 +15,14 @@
> >  #include <linux/module.h>
> >  #include <linux/mtd/mtd.h>
> >  #include <linux/mtd/partitions.h>
> > +#include <linux/pm_runtime.h>
> >  #include <linux/string.h>
> >  #include <linux/slab.h>
> >  #include <linux/sizes.h>
> >  #include <linux/types.h>
> >
> > +#define INTEL_DG_NVM_RPM_TIMEOUT 500
> > +
> >  struct intel_dg_nvm {
> >  	struct kref refcnt;
> >  	struct mtd_info mtd;
> > @@ -462,6 +465,7 @@ static int intel_dg_mtd_erase(struct mtd_info *mtd,
> struct erase_info *info)
> >  	loff_t from;
> >  	size_t len;
> >  	size_t total_len;
> > +	int ret =3D 0;
> >
> >  	if (WARN_ON(!nvm))
> >  		return -EINVAL;
> > @@ -476,20 +480,28 @@ static int intel_dg_mtd_erase(struct mtd_info
> *mtd, struct erase_info *info)
> >  	total_len =3D info->len;
> >  	addr =3D info->addr;
> >
> > +	ret =3D pm_runtime_resume_and_get(mtd->dev.parent);
> > +	if (ret < 0) {
> > +		dev_err(&mtd->dev, "rpm: get failed %d\n", ret);
> > +		return ret;
> > +	}
> > +
> >  	guard(mutex)(&nvm->lock);
> >
> >  	while (total_len > 0) {
> >  		if (!IS_ALIGNED(addr, SZ_4K) || !IS_ALIGNED(total_len,
> SZ_4K)) {
> >  			dev_err(&mtd->dev, "unaligned erase %llx %zx\n",
> addr, total_len);
> >  			info->fail_addr =3D addr;
> > -			return -ERANGE;
> > +			ret =3D -ERANGE;
> > +			goto out;
> >  		}
> >
> >  		idx =3D idg_nvm_get_region(nvm, addr);
> >  		if (idx >=3D nvm->nregions) {
> >  			dev_err(&mtd->dev, "out of range");
> >  			info->fail_addr =3D MTD_FAIL_ADDR_UNKNOWN;
> > -			return -ERANGE;
> > +			ret =3D -ERANGE;
> > +			goto out;
> >  		}
> >
> >  		from =3D addr - nvm->regions[idx].offset; @@ -505,14 +517,18
> @@
> > static int intel_dg_mtd_erase(struct mtd_info *mtd, struct erase_info *=
info)
> >  		if (bytes < 0) {
> >  			dev_dbg(&mtd->dev, "erase failed with %zd\n",
> bytes);
> >  			info->fail_addr +=3D nvm->regions[idx].offset;
> > -			return bytes;
> > +			ret =3D bytes;
> > +			goto out;
> >  		}
> >
> >  		addr +=3D len;
> >  		total_len -=3D len;
> >  	}
> >
> > -	return 0;
> > +out:
> > +	pm_runtime_mark_last_busy(mtd->dev.parent);
> > +	pm_runtime_put_autosuspend(mtd->dev.parent);
> > +	return ret;
> >  }
> >
> >  static int intel_dg_mtd_read(struct mtd_info *mtd, loff_t from,
> > size_t len, @@ -541,17 +557,25 @@ static int intel_dg_mtd_read(struct
> mtd_info *mtd, loff_t from, size_t len,
> >  	if (len > nvm->regions[idx].size - from)
> >  		len =3D nvm->regions[idx].size - from;
> >
> > +	ret =3D pm_runtime_resume_and_get(mtd->dev.parent);
> > +	if (ret < 0) {
> > +		dev_err(&mtd->dev, "rpm: get failed %zd\n", ret);
> > +		return ret;
> > +	}
> > +
> >  	guard(mutex)(&nvm->lock);
> >
> >  	ret =3D idg_read(nvm, region, from, len, buf);
> >  	if (ret < 0) {
> >  		dev_dbg(&mtd->dev, "read failed with %zd\n", ret);
> > -		return ret;
> > +	} else {
> > +		*retlen =3D ret;
> > +		ret =3D 0;
> >  	}
> >
> > -	*retlen =3D ret;
> > -
> > -	return 0;
> > +	pm_runtime_mark_last_busy(mtd->dev.parent);
> > +	pm_runtime_put_autosuspend(mtd->dev.parent);
> > +	return ret;
> >  }
> >
> >  static int intel_dg_mtd_write(struct mtd_info *mtd, loff_t to, size_t
> > len, @@ -580,17 +604,25 @@ static int intel_dg_mtd_write(struct mtd_inf=
o
> *mtd, loff_t to, size_t len,
> >  	if (len > nvm->regions[idx].size - to)
> >  		len =3D nvm->regions[idx].size - to;
> >
> > +	ret =3D pm_runtime_resume_and_get(mtd->dev.parent);
> > +	if (ret < 0) {
> > +		dev_err(&mtd->dev, "rpm: get failed %zd\n", ret);
> > +		return ret;
> > +	}
> > +
> >  	guard(mutex)(&nvm->lock);
> >
> >  	ret =3D idg_write(nvm, region, to, len, buf);
> >  	if (ret < 0) {
> >  		dev_dbg(&mtd->dev, "write failed with %zd\n", ret);
> > -		return ret;
> > +	} else {
> > +		*retlen =3D ret;
> > +		ret =3D 0;
> >  	}
> >
> > -	*retlen =3D ret;
> > -
> > -	return 0;
> > +	pm_runtime_mark_last_busy(mtd->dev.parent);
> > +	pm_runtime_put_autosuspend(mtd->dev.parent);
> > +	return ret;
> >  }
> >
> >  static void intel_dg_nvm_release(struct kref *kref) @@ -722,6 +754,17
> > @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
> >  		n++;
> >  	}
> >
> > +	pm_runtime_enable(device);
> > +
> > +	pm_runtime_set_autosuspend_delay(device,
> INTEL_DG_NVM_RPM_TIMEOUT);
> > +	pm_runtime_use_autosuspend(device);
>=20
> something looks strange here...
> on the functions above you get and put references for the parent device
> directly.
> But here you enable the rpm for this device.
>=20
> If I remember correctly from some old experiments, the rpm is smart enoug=
h
> and wake up the parent before waking up the child. So I'm wondering if we
> should only do the child without the parent.
Agree parent can't runtime suspend ind if it has active child.
Let this driver have it's own get/put routine instead of parent.
Thanks,
Anshuman Gupta.
>=20
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
>=20
> > +
> > +	ret =3D pm_runtime_resume_and_get(device);
> > +	if (ret < 0) {
> > +		dev_err(device, "rpm: get failed %d\n", ret);
> > +		goto err_norpm;
> > +	}
> > +
> >  	nvm->base =3D devm_ioremap_resource(device, &invm->bar);
> >  	if (IS_ERR(nvm->base)) {
> >  		dev_err(device, "mmio not mapped\n"); @@ -744,9 +787,13
> @@ static
> > int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
> >
> >  	dev_set_drvdata(&aux_dev->dev, nvm);
> >
> > +	pm_runtime_put(device);
> >  	return 0;
> >
> >  err:
> > +	pm_runtime_put(device);
> > +err_norpm:
> > +	pm_runtime_disable(device);
> >  	kref_put(&nvm->refcnt, intel_dg_nvm_release);
> >  	return ret;
> >  }
> > @@ -758,6 +805,8 @@ static void intel_dg_mtd_remove(struct
> auxiliary_device *aux_dev)
> >  	if (!nvm)
> >  		return;
> >
> > +	pm_runtime_disable(&aux_dev->dev);
> > +
> >  	mtd_device_unregister(&nvm->mtd);
> >
> >  	dev_set_drvdata(&aux_dev->dev, NULL);
> > --
> > 2.43.0
> >
