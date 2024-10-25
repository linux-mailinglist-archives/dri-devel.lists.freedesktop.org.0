Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B69219AFA77
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 08:57:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A39E810EA09;
	Fri, 25 Oct 2024 06:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KWa2oYEx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9D510EA0B;
 Fri, 25 Oct 2024 06:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729839462; x=1761375462;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XuY7zBiw6fNG/tGXHIrMjA2zy7Ao0st8njvENbRLCUg=;
 b=KWa2oYExJRiYxIEAxIktYfCOF1pGgLHGFm/vPKApAO+ZLQFEW9s6ecbM
 yW/ZUAusubegZM12nWrvS4uyNlGxcuU9oLDuzEC1+BXUCs1SgcrGoB0Z2
 sr8zh0AplYtt9oSp7iC/1rsHqvUFWOwO9lSx1EHtubK4Z5x3shmVvrKjx
 wDwJipS1JuRIyyhW2PrgWlm8+uEHuxPzW9EJDh9sLrqKCk0UdsFJTYFES
 XZnvGMDG8wIZiknJTkUvfyJYHqYW9aYy3uQ4tqEN36ExX8OWbgjgK24xD
 tlUI0fqrgL8dv91XpHelxmYhypy8jSaIeBwAal2DV8adDLqQ0nvi6cH5u A==;
X-CSE-ConnectionGUID: Aip7lev1SRCh2LNFvPSUZg==
X-CSE-MsgGUID: Y157roJkQk25Hgj+ZosIFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="32360535"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="32360535"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 23:57:41 -0700
X-CSE-ConnectionGUID: GFCu+phoTUiCmcYuJ4O4YQ==
X-CSE-MsgGUID: o9IIQ5+YToeueYW4cqN2sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="111643630"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Oct 2024 23:57:41 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 24 Oct 2024 23:57:40 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 24 Oct 2024 23:57:40 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 23:57:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UvdY+L6zra5DwuLN0dtphl9LFPfY4nsgEvtNOxyPMRehBRw89m61ZRC8Q1YCw34z7bKQ1KrvvUT5VLCLozIPRZbJYZojC4POUrgA+NgfnIJzok4GUQKyokG/b+E5ccMiUl12mpJBly52uJmaeqs3dFuENB3yD4tgnAzbNJPs/v8jLtPkfc4uKsOmAa1HUxoPqy19agLLqNoC92xw4i2QLyGSY7I6oIwH7vNuAR4YtrvxqfWBKdXDwtMiX5T3Cj8gmSKk8Tt1VXPIwI99W2ZpXbWas6lFXnqDlrkxz79ssbzqNj1FsnXSIga1iAsBy0T4lGZkcDCtMrya0HtFYCWQzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0pqs9/4LG3gD44DEt5Uk7KE1yd5rzA/FMdtbscxM4R8=;
 b=mBiqPQPUIMnh66cBB9THRcnthYex2Jyen5/hM8Y2ROaTIGrdnO2e5Sq/hMU3kLlCwekn8NJxGpUw0cjYokEKXVw0f3pXJ2dEBh/g2/4e9VY7K3ch7Paa4ksduMj7L6rhE1BFrRJbgi91mMNh9N0TRBq2h54c3V+lFNfNFfD0+hpxUMlPO++lR6YpNc/sOYxt7MprC5aWJtyZFYYXZcb0Sfqf2uH2aOmGA3Tb0Pd9/7Xhv6Z2GNwRbn8mgWnGrapCMKgvPX4+KfdhoMhtlepSJahRVdd6RaZjPih426Npo4HdkolXgZJRyqcHmnsxNMTodk837qj5a3l9jDoYyoaRhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by PH7PR11MB5913.namprd11.prod.outlook.com (2603:10b6:510:137::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Fri, 25 Oct
 2024 06:57:37 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%5]) with mapi id 15.20.8093.014; Fri, 25 Oct 2024
 06:57:37 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: RE: [PATCH v2 1/5] PCI/P2PDMA: Don't enforce ACS check for functions
 of same device
Thread-Topic: [PATCH v2 1/5] PCI/P2PDMA: Don't enforce ACS check for functions
 of same device
Thread-Index: AQHbI3yK84LIcNeUG0KOOkjZ4cDCubKS47QAgAKA/4CAANFWAIAAv9ig
Date: Fri, 25 Oct 2024 06:57:37 +0000
Message-ID: <IA0PR11MB7185C903E9468C3221615F4FF84F2@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <IA0PR11MB71853199C12F60897CDE80D4F84E2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20241024175944.GA965060@bhelgaas>
In-Reply-To: <20241024175944.GA965060@bhelgaas>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|PH7PR11MB5913:EE_
x-ms-office365-filtering-correlation-id: e71c240a-0c28-4a1f-6446-08dcf4c24fbd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?F2H8x3XEDWP01Pi89Y2sc7Zw+CYYxfMDdv1ZcIY73tU6/rFuU4bQPdEXLhh6?=
 =?us-ascii?Q?Rjy+0Rtbm0NZADXBqupPxWWyQEmUF/TKiOu4pMl3hguO50gEItxDb5xnrIg3?=
 =?us-ascii?Q?U1pskx0FeziRXrPTmY1rTS8U3Tu1dZli6y9HM53Nv6nLsbX+1ymj9zG8209B?=
 =?us-ascii?Q?Tk+DVRMCL9/DNMA2P+KRgE5cc+Ozsc6Pt0YEPLISt8LPQwJ2wrhCAdZnUIhx?=
 =?us-ascii?Q?paYMb6R8tZMZQXaxwRAcIO7kMpd+WVC7axnF5oU2EuP6IWibG0BqlsQ89oBK?=
 =?us-ascii?Q?AmgUXOL+PXEbT5GTBPZtvHpsO8NImBw4HaiRKxUwrITnPqycy7fLHVKrL/th?=
 =?us-ascii?Q?zWMxoq7V56/ZGIzRALcbXKxaH9DOLNXDX1seMn4OyJe9rypkXofEteUyDtQv?=
 =?us-ascii?Q?h+ucMOfE9un8Wsk0SnGo7ySpmbrGk1b+5SUeP4lDW4lG52gs6Um0sbqWPmSD?=
 =?us-ascii?Q?0/ZtcwkoCLj49swV/hnGnowgT6Sj5a2y6kMRYnAWSR7Atd3C88kPZeT1Vk8v?=
 =?us-ascii?Q?85NxrM2gZfL0odLW5QSZAxrRH6gba/t2qXgw69jcDhamvByVEAxfuxc5Owa7?=
 =?us-ascii?Q?8Drfinm3P34yMNz1eHMESODoA9vxEIR257fQBOZRhG42XoSj3tuS3sncxSWq?=
 =?us-ascii?Q?6bpC1mKs3n+a/S6lSOoujWskEzSIdJrwCH2fZdIsWNxYvG+QwcvdFlHE5SbY?=
 =?us-ascii?Q?A2hr5TODhQhKFJ4p/QgImvSM+4DgRzrIwf7T4l8q3WCoHNwnWG8tMk750ihe?=
 =?us-ascii?Q?MgqtRuZxPqv1X0lST7ux2/MEGfzWe0YxX1HcCXdVKwQXosWhsHv6Rib8nOE3?=
 =?us-ascii?Q?nEt6IdUSuFBqx8ppdbBu/sxUyEWNg0OojYRVne32jKzFc/cT+PHhMwInz4Sd?=
 =?us-ascii?Q?VHBTuXeel/vYgdZi6UZ0za2NsXTMz6enY7k36n/hurK2vzyxxmuT7UVgEfZZ?=
 =?us-ascii?Q?3d2jF8YxvBOA+xVlAre/t4bCuoFh6w+vv3EOWVHx7BE+s0t7g+VGUQPOHete?=
 =?us-ascii?Q?9VzWjUs9QLyNCJr4Z6YPxnzoND4+WyNQ7NYzu/eZ5LNl5SQDDgitThVbxjru?=
 =?us-ascii?Q?55iLV3w8IulKLCf9XX0WwGXT8sW5CpYiqC4wFp6CLn+Z51BLYrI4dj1v2eO1?=
 =?us-ascii?Q?poMZzrl8hrn6H/p05mcG+uzSX1RGVkx6NT2XdPanqUwe6vse+4OyQQKQ3CSe?=
 =?us-ascii?Q?rJda9HOnEoiwEuEiXeDMIvhaOlvD/lyX61MXzUSfgwxJuIU4E9MM/9phfQyh?=
 =?us-ascii?Q?vhTMzc3xHk8dUNwLbDzalQCCzKpqXdQ+Phl8CGj0f0+/2J94AGWskifKYTqF?=
 =?us-ascii?Q?ZCEjMCUnso4MVlyBGsHv5x2a0+N4WMkJwVAuu+40F7m9y6fRrcztMloReu9z?=
 =?us-ascii?Q?Eyd62Yg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0yetdoQG8Jn7f4qzInN5n4IrlWrpuWt+IohXow4EB18klnc5bmse2qNOljwI?=
 =?us-ascii?Q?xCpZUP/dUFPwnjC20Ah+k1eOKo6kFFcNpzMsDYcqv4O9lnn9A31vvy38rr9k?=
 =?us-ascii?Q?hZNUHhUnCGttwgxne8UwSwEZS7eI0hm86Fu08LsGgYybvLx3mo3sMl+wTAnI?=
 =?us-ascii?Q?mY2O68Pr4xbvWWuze3jzcG+k4302/+03Bffy4v+77zOJDOyQTPp47tTcaaXk?=
 =?us-ascii?Q?fBAxpicMdmC8hlKVZH0lTA1yLCWnd9OoN6PV8rn16/EUN9zegsPXUzT5wJD7?=
 =?us-ascii?Q?Cr9osRp5p2NC2gOY6k7mpbqArv51TRoELRYHCsjXDZ+cId5B3B/5KmeG8zMp?=
 =?us-ascii?Q?GpbbbD8G9KJ14b+X56ICN8zSqNGUmzWKCgRApQ62pN1RFGnnTGBLekMYIW9w?=
 =?us-ascii?Q?opgEkfyehQC0Ia0G00ezo2C32Zb8yWoeOMEz0jHs1uPrXm2x4Mg4ktUujeL3?=
 =?us-ascii?Q?AidB7YqYeT8iq8P80zM25J5JiTjkDCmVjlKBpUYntgi2Ce1nRAp4YGZXZ082?=
 =?us-ascii?Q?pEucJ4bZfuIeHh2A7Ywo84r6jO5v/iASx9qhT2d6pkIe6Ss0rJ9MtaDgjYFc?=
 =?us-ascii?Q?8/n2CRHwo+za1mG6ZAMhtY5api5M5pETlqPB8hnF2Bh50puZfIY6n1C+TE+O?=
 =?us-ascii?Q?wLFEUTwYFhxMmRzS7MNoSur9rqWVjrhckIArx/0ntEKK0cUwo28jLAKR96aq?=
 =?us-ascii?Q?kaQCKyJqVByx3Is1R59vUw+79oIo9cip+tK5Wf0bapAYV7MZeyvipKH/kwTB?=
 =?us-ascii?Q?JOJdVpUp3ICgmE36A/XpzNg0bBZur9bSvmyp+8VNRNEPxa9V8krR28RuaJsI?=
 =?us-ascii?Q?ms1JHPO9ztON4P3RL+WSCMYu28JIJoWIE6qQsd1JStfmW7RCsGca9kGG8FeX?=
 =?us-ascii?Q?Pfowu5uF0Sk54xTVUcB280lYK0h0MWyS4OXHeoIhjWfImTW7V0QXqNmWqdWU?=
 =?us-ascii?Q?tymsMEvcyMf9Ch4zTXBevRNKf1jfOaaSoX078Qv07HglYIdgP22ll06iMAQ4?=
 =?us-ascii?Q?DnbPUZJQfOEyWQl8IkTWLBLPBisV1deWOQycv4O2LOGAzcPu9clFM4r184N3?=
 =?us-ascii?Q?/tbjql7OpvBkr9gOHSbsItu6EsBN2o9cwDybs4q8ExprfHy3puD5YZlYanJ/?=
 =?us-ascii?Q?4wq4aIjVNAALAdslLOIrevKc1wLSWJMPsjxceJc8A7nJwCiBZ9XpYH8DCDbA?=
 =?us-ascii?Q?43BNvaG53sInS0dXnp6JxEMHdzjVUpjG7IosGRrH3uVa2IAENM9w66Skvjo0?=
 =?us-ascii?Q?kFRrCG1clHYEzQmwNJxPIUHIfZrPJ41LwtD3Ia4a4a7Cm+jum3eHCr63dcvi?=
 =?us-ascii?Q?Mpjhtw97l9wbmvE2XX3NoC9pr8hLm4etuHar3ndf5Nrxb5AM9xoC993K5Lg8?=
 =?us-ascii?Q?mf6sRutaeZhtnPXow+QUjd6CG9tZ3hmlhqFiYZOkVc9cVeMduQs1sQnUl+Yo?=
 =?us-ascii?Q?DD9vEoJmL9p28+CjA3O8/kitgzkGchEeCIhW119bxNa7PMQ37NZ45p1lvo1b?=
 =?us-ascii?Q?YQ4sFSD5Fz3ju7gBMxtfZgaT3cPZX4gCkYg76M9qmgIjPEHOSLBiunlqhO/M?=
 =?us-ascii?Q?y08uw+wBwvDP485BH9dGIxOMZ8nHm4CASC0uQKpK?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e71c240a-0c28-4a1f-6446-08dcf4c24fbd
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2024 06:57:37.8025 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a8Moj0whTlLLiihqZZd+Ww985AKtMEAPFxXxIok7Dsb1VGgfb8Z1PQLhZkY9tJWFnakPiD7NowDCXlzBhVoSfPshvSWCs4pbL9hbZIWZiZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5913
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

Hi Bjorn,

> Subject: Re: [PATCH v2 1/5] PCI/P2PDMA: Don't enforce ACS check for
> functions of same device
>=20
> On Thu, Oct 24, 2024 at 05:58:48AM +0000, Kasireddy, Vivek wrote:
> > > Subject: Re: [PATCH v2 1/5] PCI/P2PDMA: Don't enforce ACS check for
> > > functions of same device
> > >
> > > On Sun, Oct 20, 2024 at 10:21:29PM -0700, Vivek Kasireddy wrote:
> > > > Functions of the same PCI device (such as a PF and a VF) share the
> > > > same bus and have a common root port and typically, the PF provisio=
ns
> > > > resources for the VF. Therefore, they can be considered compatible
> > > > as far as P2P access is considered.
>=20
> I don't understand the "therefore they can be considered compatible"
> conclusion.  The spec quote below seems like it addresses exactly this
> situation: it says ACS can control peer-to-peer requests between VFs.
I am only referring to the specific case where the PF is trying to access (=
P2P)
a VF's resource that the PF itself has provisioned. Shouldn't this be consi=
dered
a valid access?

>=20
> > ...
> > > I'm not sure what you refer to by "PF provisions resources for the
> > > VF".  Isn't it *always* the case that the architected PCI
> > > resources (BARs) are configured by the PF?  It sounds like you're
> > > referring to something Intel GPU-specific beyond that?
> >
> > What I meant to say is that since PF provisions the resources for
> > the VF in a typical scenario,
>=20
> Are you talking about BARs?  As far as I know, the PF BAR assignments
> always (not just in typical scenarios) determine the VF BAR
> assignments.
Right, I am indeed talking about BARs.

>=20
> Or are you referring to some other non-BAR resources?
>=20
> > they should be automatically P2PDMA compatible particularly when the
> > provider is the VF and PF is the client. However, since this cannot
> > be guaranteed on all the PCI devices out there for various reasons,
> > my objective is to start including the ones that can be tested and
> > are known to be compatible (Intel GPUs).
>=20
> Regardless of BAR or other VF resources, I don't think VFs are
> automatically P2PDMA compatible.
I agree that VFs in general are not automatically P2PDMA compatible
but a PF and a VF should be considered compatible particularly when the
provider is a VF and PF is the client.

> For example, PCIe r6.0, sec 6.12.1.2  says:
>=20
>   For ACS requirements, single-Function devices that are SR-IOV
>   capable must be handled as if they were Multi-Function Devices.
>=20
>   ...
>=20
>   - ACS P2P Request Redirect: must be implemented by Functions that
>     support peer-to-peer traffic with other Functions. This includes
>     SR-IOV Virtual Functions (VFs).  ACS P2P Request Redirect is
>     subject to interaction with the ACS P2P Egress Control and ACS
>     Direct Translated P2P mechanisms (if implemented). Refer to
>     Section 6.12.3 for more information.  When ACS P2P Request
>     Redirect is enabled in a Multi-Function Device that is not an
>     RCiEP, peer-to-peer Requests (between Functions of the device)
>     must be redirected Upstream towards the RC.
>=20
> Or do you mean something else by "P2PDMA compatible"?
I am no longer making any generic claims about devices' P2PDMA
compatibility. Instead, as mentioned above, I am only focused on the
interactions between a PF (client) and a VF (provider), particularly with
Intel GPUs.=20

More specifically, I am trying to address a use-case where the VF needs to
share a buffer with the PF but is unsuccessful because pci_p2pdma_distance_=
many(
provider, client, 1, true) fails (due to ACS redirect being set) although
the buffer is located within a BAR resource that the PF has provisioned
and has full access to it. Shouldn't this be allowed?

Thanks,
Vivek

>=20
> Bjorn
