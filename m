Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F3B9AF8E5
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 06:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC10210E9F0;
	Fri, 25 Oct 2024 04:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nI71DSI+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D0110E07F;
 Fri, 25 Oct 2024 04:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729830508; x=1761366508;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZRJt0QwrUBTqZ26fu3NY8DHIT/DPiUxr4U/C6BmxFMo=;
 b=nI71DSI+gzlzqSw4Mr6aGlrb74uTDZeyQibnz80idLzuW0fUmTtrHUx9
 cCmM+DO4CmPI5r7pQ/yLjD/0sJyYx9W3MWEg89Q28FNiZG7X4j8HIvwlv
 xT2I7fsHnNtBbnGkUo2wUzORLYHxqpcI1pGVk3rR5rWADb7VMPdmYSXbf
 GBI2BABx05kN917uBKZt3v2UkxBW2M3G3ZPg7ZtDB1dsLc9Hdo98R8WKB
 PyW1aR6N6AL3sGwFQQHg1vF6RJB1kAPdraYsFzctSntfusW7bAE6CzpmT
 IvEb4IdY0S/26oZy7WKUyNblnTbcFu6bIf8yWqnyREsso97cl0vHkEZjz w==;
X-CSE-ConnectionGUID: JaUflgURQZyiGmu2zZ9WCA==
X-CSE-MsgGUID: qqTV3n8JRrW0Gk5dUEAGQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="32348845"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="32348845"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 21:28:27 -0700
X-CSE-ConnectionGUID: MydiBw8oRzS2MNUvRz/oyg==
X-CSE-MsgGUID: 2cvMIo+CQU2dyRFe163FIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="80717601"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Oct 2024 21:28:27 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 24 Oct 2024 21:28:25 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 24 Oct 2024 21:28:25 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 21:28:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LDH8Ie7oMHsovnmwX61nfpJbDGWviJWaXmar0N0+DeamEoq6jOeSjGwnyGHXXQ1Z2GBYRtkMXeslqDQujn41ZfXLl8zUjO3VHaPUy6HHOI51MWV7UhodjzpReVXx/7gYKdOCBPjtxIRm8WHInps1NWz4sWLHcb6bQRpajDbugkznvubXL2U6UfrrBERpBX4GQzRSw95nLwP6ePGjXO0IdfccIIQCBLBseNES4tpgx0W8e/c/fL3qQyxYL2MMU6LQtG06Mjrq0IVM3uByj5qAl5ATeR93rxBtF4c07zVacQ/nBHfE4sLJJDbK+J3lPijPxdeTQemX2VYoezUTk0I+EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hddFyUynSeAc3PlFoKY6txnyLfo7IJyDf4ukI7ACX98=;
 b=f7IfD82GKDiDJAN+LPd7Sxcl3mEkqaJf/zfeVhhG+nKM5LEZCTe9Pid6QLjPM/Ts0PASfaYB8cvrc8azFQj8HsmoI71caAXFAvN5+9fcAj+aakxIJZh30R6b4nfUF3xOd7vzrCiZz9ZgkPZBGGqXwYNPNgClvUZY8/O4+PybmmNR9cdOtNKUk3cG9p2Qxee5lp8bgkkDquWkCiQsg0lMsVi4537w1EYBW8RjDAOj5TIVVIK6CuAPM9zJX5wG5Zan+TlXDrnZQf2Isn5n3fTIXWt4111KGi0Fbs9TUpG/hGUMRP0eACEz8QZUudEMqkSDEotzWU2NQyoWNLupWZ3MbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SJ0PR11MB4815.namprd11.prod.outlook.com (2603:10b6:a03:2dd::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Fri, 25 Oct
 2024 04:28:18 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.8069.027; Fri, 25 Oct 2024
 04:28:18 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/display: plane property for async supported
 modifiers
Thread-Topic: [PATCH] drm/i915/display: plane property for async supported
 modifiers
Thread-Index: AQHbH47FDuXGqBVxjkSYyqY0UpsJ5rKJX/iAgAAGqYCAAAHsAIAA65ewgAyY86A=
Date: Fri, 25 Oct 2024 04:28:18 +0000
Message-ID: <IA0PR11MB7307CD2E8E7D15D982662127BA4F2@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20241016053626.2850384-1-arun.r.murthy@intel.com>
 <Zw-_6yuy139Zmir3@intel.com> <Zw_FgeZFATAk-aMf@intel.com>
 <Zw_HHn42gYFvjWmP@intel.com>
 <IA0PR11MB73076CAE9CF2258CF83F8F49BA472@IA0PR11MB7307.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB73076CAE9CF2258CF83F8F49BA472@IA0PR11MB7307.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|SJ0PR11MB4815:EE_
x-ms-office365-filtering-correlation-id: 15752e03-f588-4eb9-4605-08dcf4ad738b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|10070799003|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?RXfgIrAU1RmVgXxSwf54XQodmj0u6zxg0pTHAJA8DTrSef5d1a0SINyXkN?=
 =?iso-8859-1?Q?J2awcdGX0/wPT0BlKwVclS2w122UOs7wAHXi5SGmD9L3YYQast61gegwwc?=
 =?iso-8859-1?Q?2baM1nHq92C7ysIjmEZozY7mXiQBTgLOq69/FWzr9XHUsAaHXgv2zhouwW?=
 =?iso-8859-1?Q?qMqf2sNVq9bFAi4Z1lEIZW0+rZhqAVA8VLCuAgjKpqp1iEDjSc5hedJRfL?=
 =?iso-8859-1?Q?IxV5Gt8JqfP80h1J0x78sy+nSFzLtn5iV8D7AsBECDWZ24ngIwi/U0aS5V?=
 =?iso-8859-1?Q?cEbJSJBRWu48id8/O4zMG/SdB26CzyOz4Jolug8Y7z3foZEdYpkXJp91IP?=
 =?iso-8859-1?Q?iyMYF9rJzPPk7NJjBhh3Jyzf7xhpEqLdnGZkWI+d73dL9by3wZhiBKv8ut?=
 =?iso-8859-1?Q?Y/nYPhXPdxT53JBEBIB7AoCHIv/PlbGbEBD/+jnC0Tlbx86bcVGNmuIn2I?=
 =?iso-8859-1?Q?PHNQcTbm7AzzhIH3sQdbrQghC1Vu+Y0IKu89xoa/vZPq2P5PfsNKSsmwm5?=
 =?iso-8859-1?Q?BgFze1nMROFP3y+EjNXqUTwM9IuKnFGw/MoqsMshA7PMGiMUcrIbqdfNfY?=
 =?iso-8859-1?Q?jD3J3jhqZNGWTa/u/gQVbNFPWqgMJOYW9cUJpPAhAlJFy1Oh/SqXlLQ0cG?=
 =?iso-8859-1?Q?I6xWzSBbVjl/adGypQY0+g0r6iRHTx3YXH1K1JysQej016U+vaDZ9igr8B?=
 =?iso-8859-1?Q?Ceh/KbbjaLmBiJURXufIAQKG4HPs2CrYnZiSAnMeo/Qlx9dLgOtqYhGRdg?=
 =?iso-8859-1?Q?NBn0mKZ3mO7t+MlXdLiVws5UmuZQMEOG2lvnbXKAoJ5yBmuh/afx2DxXf5?=
 =?iso-8859-1?Q?/wKmhCOHc3KpVrpQb3/0SNqARQGJVRlOMEs1/5UGXZt8v6tz6TamIBQ+7Q?=
 =?iso-8859-1?Q?GjQM5nBE3NgmFmsyYxaHW9nq/gOB3Lk4N/VxzhhxdMvJ2yEJoxwU4M75m/?=
 =?iso-8859-1?Q?Eqng2B4OxCzz5mGmfrtRW2f2/fTIU4IkzmmmraL1ls1uFTDCXI3VJaIoX7?=
 =?iso-8859-1?Q?ey/j0BDga0VAnihdXx0UIK5bS+AMm38M85A80RqZbg1SglzKlJCgE66BhI?=
 =?iso-8859-1?Q?nRJz/9Nirgq+DD3A8IhOv5sqrHIu1EQa3VCOlO+S49hEhA5nzmJPUYNE0u?=
 =?iso-8859-1?Q?Jb/HFrEn/bxf+hPGt3ShKbFzjlklD+XYfnsTBlJkxAeWgXsijqHZyVZezD?=
 =?iso-8859-1?Q?rK1m9Tqq6rctBOwaLU5FQ7KXnzuohpB4gsztMXNpqZRT9pLrgyFL5ff7eW?=
 =?iso-8859-1?Q?805Id4TJmBu+l+wdLNxpW+qtE7qDKeUxI+jXIZoS1opftezdsQbhLKN1ew?=
 =?iso-8859-1?Q?/hsET+OviDDKU0iF6St8LGIB5gkJfVrRdA0aEYcn5zNFW0DoLMyNnEynmf?=
 =?iso-8859-1?Q?4IYO9PSL/8?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?+IkvT1+QVuIiDclMw9UH4MMDCCIO65Hc1X5KQT24K8N0uP9klfFGDv5DXE?=
 =?iso-8859-1?Q?wRDfMZLl27YJxBNy0kyCgeZa4KE47fsw42+B6Cc8VA0OAwafOcH0Ku7uBN?=
 =?iso-8859-1?Q?9CHRrY3Z1MV8NnNgCMz6n/fwTormUN6WURV6w8Y7TQxaYKfjvofN4VL4jp?=
 =?iso-8859-1?Q?dI/muQyj7YlW9OHAz6XOAzHAbgs7pj6pYayKTVpBG2gv35biMUvrLAq+kT?=
 =?iso-8859-1?Q?0SCBtsoxFHvXuLwHDTXuxiVjUvfmWy5Cz5WIjuSxUK+93xbFYdrNz0CSiL?=
 =?iso-8859-1?Q?B4Zx/IWOA97IXb13QhAuJP7E7j5JiOLKBK5q0QLqbHk28lYYgfjzJgQAAy?=
 =?iso-8859-1?Q?vUPTjOTmKKsFefYdAQejH0I12TvD1n18ludghjYpZqHg2i1If1/3lpAfbl?=
 =?iso-8859-1?Q?oX3RcPf21duICiBLVVJ+kDDzbflXo9d2cv/OK6KXfk2uDXNQJueqD4FQJb?=
 =?iso-8859-1?Q?8lCDObBvkkiDX+KRi4fhdg89E5f1JJ70OuWCpDyQ2xVdBIvSy1bvuroOC6?=
 =?iso-8859-1?Q?93uj8JLTKs8frFsKZPPTIPtQQ6Q0dqOlPhyIcNZDWo5O6eHzD+6+CKkFLt?=
 =?iso-8859-1?Q?L7H0ZEr32kiL8oOt16qh0Hs8Z1jtwhVrvHeHvCTY81OJEBECLiRw05SN+l?=
 =?iso-8859-1?Q?oH3Beqk6PZ+5jqMm64ppmi4+VRQMnlyhui22Ekj1DbgftcYxyNa0Jq9kh3?=
 =?iso-8859-1?Q?xmOYfxKMap6MzCu44fbIbZBUsvD2Bw+wLShQozq9dzEJVz2A2JG9fpXy/t?=
 =?iso-8859-1?Q?rNMsnis5OhRZ1/vMWx3VzzcQf1meZeLYa+xUAp5Xjifk4a/2NmsgNxo98i?=
 =?iso-8859-1?Q?jtMHVW93mAtxbEoDwy+8bQlCE6zSUn5SVlAEhfZpazYDyh8/6SSDJBfTEV?=
 =?iso-8859-1?Q?zW+K20rZtGzqqB2e98pxa3XMqWuFzuECiythmLR1p5d/ZJsQXM8SNhUvJ3?=
 =?iso-8859-1?Q?kgW40brLfpkgAYdd5lz4bEkejiS7AuKBN3VJJPrTvw01ymqvGal3qtcGd6?=
 =?iso-8859-1?Q?cBYu7qilIyCe+7lUaNfffimEz+X/bM0pbRAv0hDWPZsHxEuidIkgKuSeBa?=
 =?iso-8859-1?Q?N9vgEb2iTmLAhv4W/1gNjaYZnliaySmhklKc7zJwTm83RiycUJB3vahDyh?=
 =?iso-8859-1?Q?iIdouvso3rXEwCYvKlJ95JwWQR3VcU6v0yGLrEkMNPAW2ZHJR2VJcFTeyv?=
 =?iso-8859-1?Q?dfxuKfnXVep4lMw/gbL3VmT9NYE5ZUMJYW43Acr2DTjy858voVbzJRqAbW?=
 =?iso-8859-1?Q?c3OreMbUy3doD2j2cc4Juu1Pta/dEdtUmLJvjehpqFK6Bxb4WiM1XRvOyb?=
 =?iso-8859-1?Q?0R08XXoKlfMjpE2fLhlNRfGZEQE2HhsOUgSLa3ykftHppVUV/XU10TfBW3?=
 =?iso-8859-1?Q?DXPEsdplRJSbwLhDp0cMWVnOYgcNZ2x43xx5eJ3zrdFgWr7HG7G3Mbjkzb?=
 =?iso-8859-1?Q?XUe+JEOvVpKa19aJ7z1GHgmvMvN1f132CKwJL3ZpgIX7fv378lyvYaCnMn?=
 =?iso-8859-1?Q?lz52OrNwIZ/wnISryKGmyzLMboLSF1cJdb5r4gE+0LQWCN7CgD8ywnx1/R?=
 =?iso-8859-1?Q?fUViOxz15Az7CDbKeVHd+2nrK9ejD+ychLBQNcKWUorWUHdCPEX+ZqZwJZ?=
 =?iso-8859-1?Q?f1cE4G6SIf+qnWCQ1GrSsmlm2Pn5PvW4CcbbcPa8Z5IM6hXdFu+QBJrXbC?=
 =?iso-8859-1?Q?l5+8CABMj6nsUymfPBDNMxA0aNee1dVJ6r5PCE5Z?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15752e03-f588-4eb9-4605-08dcf4ad738b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2024 04:28:18.4603 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NZGTmoQVY9UsS2unS4cAdblmz4Jf1CAGPsDbUEmisEgjIOIBfrhp/Tu6t5bbBK9csIrNyD89wJnXT2utl/KiRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4815
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

> > Subject: Re: [PATCH] drm/i915/display: plane property for async
> > supported modifiers
> >
> > On Wed, Oct 16, 2024 at 04:54:09PM +0300, Ville Syrj=E4l=E4 wrote:
> > > On Wed, Oct 16, 2024 at 04:30:19PM +0300, Ville Syrj=E4l=E4 wrote:
> > > > On Wed, Oct 16, 2024 at 11:06:26AM +0530, Arun R Murthy wrote:
> > > > > Create a i915 private plane property for sharing the async
> > > > > supported modifiers to the user.
> > > > > UMD related discussion requesting the same
> > > > > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29618#
> > > > > no
> > > > > te_2487123
> > > > >
> > > > > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > > > > ---
> > > > >  .../gpu/drm/i915/display/intel_atomic_plane.c |  6 +++
> > > > >  .../drm/i915/display/intel_display_types.h    |  4 ++
> > > > >  .../drm/i915/display/skl_universal_plane.c    | 49
> ++++++++++++++++++-
> > > >
> > > > This whole thing belongs in the drm core.
> > >
> > > And I don't even see an actual implementation of anything here.
> > > Why did you even post this when it doesn't do anything?
> > >
> > > Anyways, thinking about how we might actually implement this, we can
> > > probably leverage
> > > https://patchwork.freedesktop.org/patch/619047/?series=3D139807&rev=
=3D3
> >
> > Although we should probably pass the format to that as well...
> >
> The blob points to the struct with elements, modifier and formats.
> The main intention of this patch to get the i915 plane private property.
> The reason for not having this as drm property is we are the only user fo=
r this
> and no other vendor has this restriction.
>=20

Any comments on this?

Thanks and Regards,
Arun R Murthy
---------------------
