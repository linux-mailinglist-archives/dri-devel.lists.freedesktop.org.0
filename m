Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D72072534B
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 07:25:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96FB10E427;
	Wed,  7 Jun 2023 05:25:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC0B10E427;
 Wed,  7 Jun 2023 05:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686115550; x=1717651550;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WeBxxyc8W0N9pSyVANDs3BGbTdG/KmKXA62Hi5lNm/E=;
 b=f98h3Qo6hGRdyCSzLR+J9WSW+F6ulQYwZcO7lfIeq/m3PoJppI5w3I11
 z7a/ZX6iLj5q5I25GG8sCtI7+yiBPEKIjc+HEnVr4Vx0ohaxdqZakvTEU
 txezgwUgYrCKZbjOonIXAu9xjVhLUPwE3OYHRPNAkvjInE0l/VQzwFumj
 l7HtwmKxsqLCZzN6YUetjS/TgNwkXEHwGqbXVc/DP+EGf4OSf0kQZN1+O
 sDsa8WgxXAEr3VZXABpDVT766b4EY4T64PnpAE2crOg+1jCb0yedpZIf9
 b8M+SPV0nM7vRHlTYSgWR+qqJsE4yOilwoE44bwNP3+xv85nRfHK3eFmd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="337248435"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="337248435"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 22:21:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="821961321"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="821961321"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 06 Jun 2023 22:21:14 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 22:21:14 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 22:21:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 22:21:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 22:21:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cTdgOExixgwhmOip8UsTQXqAhI1hg5PHb1eB3RqieJ7QeLv0J0tQHUnUMfAndhMnxiiekgUwIINnq7DLJ079rI+mItAzXp/Kh2o8Tal/tBh7kE+RzMCZa0fJrulY7oSAWOCXGvTGxOmWaINKewwcFqG6zFE0k35JX+pzy38Vt+Q88TOLfKvTnYd9/iNXgJJU0bEJFHcrqcRgy0VssTa1JxnN4NZKPHY5hzM6NNJlIIS4iXwhX5nlUPrK9BBqxQdZW1beDzk3zrNvf1vffBagXrTG0+kG1tikCbrIB/WbnAqkC/v+WcgpVBx8CXzO7Or6XsYyhzwR7OqfYFbPtJz7CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uFG8onLg0ibQV3IyIUNBPeR5EhxmxbrMDG8Gl0XEc44=;
 b=g7uy+Q9u1RSLlj+iWA0iIU2Fw2Glrp+I6m1IiNSDYRaGQL8eEI2xd+9zjlB/DN710DdL4XYOZdb4JtwohNqtA7d0r2Tz6HfqYjOIWg7thZ1Laz53kER98mPAN9XPVGwqxBj9Bu/8/ElXwlRshd1aO9KuX0QRIvlmiaSF+IJ7iLvUG4AwwW4sMDodpDIOg6eAzbTa6Oy0yjJbFtay5O5XdLlycZbplzyW+famnlCGv1Xjr6RiB/Oh3AoKKp+14l4x5pGi/HIk3u0rlF+GxR0mZyufXlDkyhp1ggoqGVXEqabn0n43ECjRqSWbSgo05TaEkFzgTX9e6y1ESwjb7yWWAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5579.namprd11.prod.outlook.com (2603:10b6:510:e6::10)
 by PH8PR11MB6561.namprd11.prod.outlook.com (2603:10b6:510:1c0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 05:21:07 +0000
Received: from PH0PR11MB5579.namprd11.prod.outlook.com
 ([fe80::29d:7629:6a6:4775]) by PH0PR11MB5579.namprd11.prod.outlook.com
 ([fe80::29d:7629:6a6:4775%6]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 05:21:07 +0000
From: "Zhang, Carl" <carl.zhang@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: RE: [PATCH v17 1/1] drm/i915: Allow user to set cache at BO creation
Thread-Topic: [PATCH v17 1/1] drm/i915: Allow user to set cache at BO creation
Thread-Index: AQHZmF3TkoTvvrD0YEWND8XQd7MDa699jWQAgAACPgCAAA8TgIAAAMuAgAEO3BCAAB3hAIAAAR2A
Date: Wed, 7 Jun 2023 05:21:07 +0000
Message-ID: <PH0PR11MB55793C2F3B66887186CF68198753A@PH0PR11MB5579.namprd11.prod.outlook.com>
References: <20230606100042.482345-1-andi.shyti@linux.intel.com>
 <20230606100042.482345-2-andi.shyti@linux.intel.com>
 <ec219702-8608-e919-cbcd-f271646845d1@linux.intel.com>
 <ZH8H3ovN20uVO+tK@ashyti-mobl2.lan>
 <168604992363.24014.14317865195655387952@jlahtine-mobl.ger.corp.intel.com>
 <ZH8VLY8a9d7i96cw@ashyti-mobl2.lan>
 <PH0PR11MB5579C119BEF9653A9A20CC4E8753A@PH0PR11MB5579.namprd11.prod.outlook.com>
 <ZIARdL44LW5BEysa@ashyti-mobl2.lan>
In-Reply-To: <ZIARdL44LW5BEysa@ashyti-mobl2.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5579:EE_|PH8PR11MB6561:EE_
x-ms-office365-filtering-correlation-id: 6ab8171b-30a9-4f91-7e0a-08db6716ff2a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8TcyPEuRotnz9+APuHQnvJgEYakbz2CgdSTlo6JetrvtwID7B3HgIGNRzFZk9HbZJPPu4b1GnKgQeLk6f/0yoeIYPx163FfsZcY+4jq3e/CK6yq9rFp5kB7ouUd6d/SF50vWmy5BFBqfybUV4We6UPAqVdCVDsDbAFEWCZQbWENL5hN3XfQghS2zvyy+ZQaTtJQhp2Yo8rGNAj5J+GpZbn8Z89jgKwri3Vqom6OCfVFIdGQxHU68ai3mHD4IiuVi6vyNuEIXH7xTZ6DOWW1uCHUaZcNvf3zaKai33q44kBlNBw2vEdkfdOKVV7OdUxRwV//JewMB+th6Nd7+ODZgctBf5zlA6pJ2C7nhmiAbNIs8+WI0B1HdKSg/vIJC0rL6g7RxK/0lStsF5xaKOpKRuiRmuZDzGnPQ3pvu+6smnbTdoz+yrwgBT2hbZL/ZvbOSrCgJOheW13bg+ELgIB3nsu4/x+7oNokLSDSzVeyuYWicw2epfB3h5URE+Z36U4lQaVgb7QH7xH7ecszxFige+km4Xt4Jj3W2TVdiL8dgXJWtAWN556Qo9GbnC4WP9DQkEKy4fHC58hYAUmmQVDGJchIP2aP5INCvMEdsGt1IOPovFMDEAyDyCHB87ml7gsNK9a0wamuUauOB6tGDaFjfpQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5579.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(136003)(396003)(366004)(376002)(451199021)(83380400001)(966005)(478600001)(54906003)(82960400001)(33656002)(55016003)(8936002)(8676002)(66446008)(41300700001)(38070700005)(316002)(76116006)(122000001)(52536014)(66946007)(66556008)(66476007)(6916009)(38100700002)(5660300002)(64756008)(4326008)(86362001)(71200400001)(2906002)(7696005)(26005)(6506007)(9686003)(53546011)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ulkqu9bOPIf6JZBeavqP/rHnwi9k/c2s6dO5RJUaihful00o2U0vdvaT3Ra9?=
 =?us-ascii?Q?iV+qUzWRu03BOD0DqB1x6BakKRkY491BU2+FqXhNTCfSpH2l6eZty44pTzBd?=
 =?us-ascii?Q?CpOJdmUhBmJFvM4ayy0T25BnNfnJ1yKHt5zX0KKoHPloCHsvn2uoElrSYpUH?=
 =?us-ascii?Q?eyZLmhUslKRfMMlytGop0B94gsOF8Lh/ODqQlswRyySdhNvobbC2FOWRtlT+?=
 =?us-ascii?Q?/lKAqQShMaVJSkpSJN242Xut7wSTyON/0gipa2q1E1Lv3oDJJKDlDe0GUtJ2?=
 =?us-ascii?Q?oxFQ2RziaiW3dhKtKnzj6mLmAyyyblHCGA0EDFSkN1SkyI8XR4WSsx2wBo+J?=
 =?us-ascii?Q?hF+CTBy74/fx3YkBmFkcGYi/bhSdQCXGTmHI7rvbpAQ9kTTtcDkavTAyhgtO?=
 =?us-ascii?Q?y+l04kiROwIhXo10wKQsmj5X2I5DpnaBFwcOsXA4US+9d412H/XBzdLUV1Al?=
 =?us-ascii?Q?80vO2fYFZiqgms9LQPG2/ZxS8TUE7z1AyYhDPDHNE/amQvw3S+xf+MEN2t+h?=
 =?us-ascii?Q?bqrjukov0lxSAd1WQSP5V/0jNjxdKEKT5PSE5aFbe7l0kRQGcm/nvGPtlE7Y?=
 =?us-ascii?Q?GN2vt7zrRkRQRiGZA6SyUmNW7UT0XS9Goc8o9ROrfLT9Qsl3JZeNTVrwKDKU?=
 =?us-ascii?Q?4SxbyMztXrcg+ZtzYiDZC6rspX9hzijx/TNXLI9eH6aoyjY0UaJOsZ3FF9h3?=
 =?us-ascii?Q?K/kX8o111f9DrDHvyUXSd6HOu7/OSIFElOQLUOK5wF/9L03THflcJR17Revf?=
 =?us-ascii?Q?g7/MKuWJS1/LPw0QFWUo6pvP3zujq7Cf04745SHeUivPFxp4OP4hRiGomJt7?=
 =?us-ascii?Q?/N47O6pyANI2tYbiqq91pn2IV/HVs3MhfY2FCaFSvFUnlX5AvTLnlksggQMF?=
 =?us-ascii?Q?xchlqEhlXhqOpDictf2pJCqzXoR8s99uoeMp75QA9EVgDkXVog20lFspd3LW?=
 =?us-ascii?Q?r8yqkjZzdx2BXBgycE0l+/Vh98/Va8naLwQI80nfCFKnDK+HseAAxuf1YVNk?=
 =?us-ascii?Q?5x6DmE7AnztrCQKhrAhfT1sLWLQ8dd9gOwuzmzReYqyq1tVhpW9pyS3auKXy?=
 =?us-ascii?Q?9dCOUAr7gKaG65Y+cIj+VgIUNVLAoTND/iz6r9s782fprXhePQe1Zj4M/dcL?=
 =?us-ascii?Q?XMFYAyGu2HDnwAREqYI/AazfMINscAa0uGlCplsi4L/j74Np4EZgVPznLSuW?=
 =?us-ascii?Q?rEOzMfWa+taMrZxYq67iyNdy8T+Qnlds+AR+J1hWtsq5w73U9QkOU1BCWwY7?=
 =?us-ascii?Q?+2JgTGoBpr61t57hqG3tINC+P2aiywEF35Pw5PWM++xyAXueBeu6I7Uu3qTo?=
 =?us-ascii?Q?30x5KalXu0vlOZGrBRzuOxkYLfUiGQuD8kTfwZJps7hqtNMe2ZoeRv9IWBrP?=
 =?us-ascii?Q?ARbNp4BBBXV/FJQCIBV3QhFW1Foi4AI1z86na6JL6jjw6iGGCd5amHE8GWFJ?=
 =?us-ascii?Q?nRZ6L06jyRdPAxNBWwwB6rokTIj/3Hm6OqrzwWqs/uma3xojNsandfKqeAT/?=
 =?us-ascii?Q?l0eivXwRukn0YW3gLe5SWyra19kj5z3UWxaj89n/liDj+x6qbHqw5pFrjDXt?=
 =?us-ascii?Q?nEVrsZOf2O5EtRO9wZmClRGLnIsLaTDPUdd/4lZk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5579.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ab8171b-30a9-4f91-7e0a-08db6716ff2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2023 05:21:07.0576 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c5bldGy8WzGuKa6bNmkrQM1cO7qQcR+8STnt0aOo0RS0OuXjiPtX2wOR/wofXZTgfM8fO5NktFcz7/3/QBF+Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6561
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, "Gu,
 Lihao" <lihao.gu@intel.com>, "Justen, Jordan L" <jordan.l.justen@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>, Chris
 Wilson <chris@chris-wilson.co.uk>, "Yang, Fei" <fei.yang@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Andi Shyti <andi.shyti@linux.intel.com>
> Sent: Wednesday, June 7, 2023 1:11 PM
> To: Zhang, Carl <carl.zhang@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>; Joonas Lahtinen
> <joonas.lahtinen@linux.intel.com>; Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com>; Yang, Fei <fei.yang@intel.com>; Chris
> Wilson <chris@chris-wilson.co.uk>; Roper, Matthew D
> <matthew.d.roper@intel.com>; Justen, Jordan L <jordan.l.justen@intel.com>=
;
> Gu, Lihao <lihao.gu@intel.com>; Intel GFX <intel-gfx@lists.freedesktop.or=
g>;
> DRI Devel <dri-devel@lists.freedesktop.org>
> Subject: Re: [PATCH v17 1/1] drm/i915: Allow user to set cache at BO crea=
tion
>=20
> Hi Carl,
>=20
> On Wed, Jun 07, 2023 at 03:40:20AM +0000, Zhang, Carl wrote:
> > Media driver reverted previous patches, and file a new  PR
> > https://github.com/intel/media-driver/pull/1680
> > will hold this PR until the uapi changes appear in drm_next.
>=20
> That's great, thanks a lot for the quick actions here.
>=20
> Before pushing I am going to replace the Media part in the commit log wit=
h
> the following sentence:
>=20
> "
> The media driver supprt has bin submitted in this merge request:
> https://github.com/intel/media-driver/pull/1680
> "
>=20
> > besides this, ask a dumb question.
> > How we retrieve the pat_index from a shared resource though dma_buf fd?
> > maybe we need to know whether it could be CPU cached if we want map it.
> > Of course, looks there are no real usage to access it though CPU.
> > Just use it directly without any pat related options ?
>=20
> I am not understanding. Do you want to ask the PAT table to the driver? A=
re
> you referring to the CPU PAT index?
>=20
> In any case, if I understood correctly, you don't necessarily always need=
 to
> set the PAT options and the cache options will fall into the default valu=
es.
>=20
> Please let me know if I haven't answered the question.
>=20

If mesa create a resource , then use DRM_IOCTL_PRIME_HANDLE_TO_FD convert i=
t to a dma fd.=20
Then share it to media, media use DRM_IOCTL_PRIME_FD_TO_HANDLE convert it t=
o a gem bo.=20
But media does not know the PAT index , because mesa create it and set it.=
=20
So, if media want to call DRM_IOCTL_I915_GEM_MMAP_OFFSET, media does not kn=
ow whether it could be WB.

> Andi
>=20
> > Thanks
> > Carl
> >
> > > -----Original Message-----
> > > From: Andi Shyti <andi.shyti@linux.intel.com>
> > > Sent: Tuesday, June 6, 2023 7:15 PM
> > > To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > > Cc: Andi Shyti <andi.shyti@linux.intel.com>; Tvrtko Ursulin
> > > <tvrtko.ursulin@linux.intel.com>; Yang, Fei <fei.yang@intel.com>;
> > > Chris Wilson <chris@chris-wilson.co.uk>; Roper, Matthew D
> > > <matthew.d.roper@intel.com>; Justen, Jordan L
> > > <jordan.l.justen@intel.com>; Zhang, Carl <carl.zhang@intel.com>; Gu,
> > > Lihao <lihao.gu@intel.com>; Intel GFX
> > > <intel-gfx@lists.freedesktop.org>; DRI Devel <dri-
> > > devel@lists.freedesktop.org>
> > > Subject: Re: [PATCH v17 1/1] drm/i915: Allow user to set cache at BO
> > > creation
> > >
> > > > > > > To comply with the design that buffer objects shall have
> > > > > > > immutable cache setting through out their life cycle, {set,
> > > > > > > get}_caching ioctl's are no longer supported from MTL onward.
> > > > > > > With that change caching policy can only be set at object
> > > > > > > creation time. The current code applies a default (platform
> > > > > > > dependent)
> > > cache setting for all objects.
> > > > > > > However this is not optimal for performance tuning. The
> > > > > > > patch extends the existing gem_create uAPI to let user set
> > > > > > > PAT index for the object at creation time.
> > > > > > > The new extension is platform independent, so UMD's can
> > > > > > > switch to using this extension for older platforms as well,
> > > > > > > while {set, get}_caching are still supported on these legacy
> > > > > > > paltforms for
> > > compatibility reason.
> > > > > > > However, since PAT index was not clearly defined for
> > > > > > > platforms prior to
> > > > > > > GEN12 (TGL), so we are limiting this externsion to GEN12+
> > > > > > > platforms only. See ext_set_pat() in for the implementation d=
etails.
> > > > > > >
> > > > > > > Note: The documentation related to the PAT/MOCS tables is
> > > > > > > currently available for Tiger Lake here:
> > > > > > > https://www.intel.com/content/www/us/en/docs/graphics-for-li
> > > > > > > nux/ developer-reference/1-0/tiger-lake.html
> > > > > > >
> > > > > > > BSpec: 45101
> > > > > > >
> > > > > > > Mesa support has been submitted in this merge request:
> > > > > > > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/22
> > > > > > > 878
> > > > > > >
> > > > > > > The media driver is supported by the following commits:
> > > > > > > https://github.com/intel/media-
> > > driver/commit/92c00a857433ebb34ec
> > > > > > > 575e9834f473c6fcb6341
> > > > > > > https://github.com/intel/media-driver/commit/fd375cf2c5e1f6b
> > > > > > > f6b4
> > > > > > > 3258ff797b3134aadc9fd
> > > > > > > https://github.com/intel/media-
> > > driver/commit/08dd244b22484770a33
> > > > > > > 464c2c8ae85430e548000
> > > >
> > > > Andi, let's still get these corrected before merging once the
> > > > media-driver revert is completed.
> > >
> > > Sure!
> > >
> > > At least this doesn't need a new version to be respinned.
> > >
> > > Please, Carl, link the new pull request and I will update the commit =
log.
> > >
> > > Andi
