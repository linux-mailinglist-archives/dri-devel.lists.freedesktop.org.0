Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E6283CDF3
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 22:02:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CDDC10E3D8;
	Thu, 25 Jan 2024 21:02:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 525D410E05A;
 Thu, 25 Jan 2024 21:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706216529; x=1737752529;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mejlgylJWNOAFFXeLj9KL/X3bCDgSlDM52Y9bYRGsjk=;
 b=QE2yK57mcDcupop/2f9GH5cyJdYYVfxGgKxOg9IRK+zB5MAvMhubslvs
 rNg9he1P6nbbIF6xHpqmFMyi9Tr6gdkWzu1zRRiKlZVvo0lj8maakoZJe
 +zFZhognJRwCSUEaKji9r9K1bBD3tbrr8u5ACZt+I2DfsmzNSZjCut5Cl
 ncdUPOYQ52dXKUH1I64876GlHJSkCxjoPo3TwSUhY8bn1Hy6TxNv8voyy
 Wj8PX0+bAJczN9yTf8TU517YimkCkl2N3mWOTz1xEKO4sEFRt8aOvMVuA
 //wSzpI+6CK2Vjw5Z4RhcxLbiIYgf3b22YMQiMT3QIyccdOb6trUQ1BS+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="433453683"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="433453683"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 13:02:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="959994528"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="959994528"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jan 2024 13:02:06 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jan 2024 13:02:05 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jan 2024 13:02:05 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Jan 2024 13:02:05 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Jan 2024 13:02:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gjHFaDGXxPUEZJ9IeMgNrmJQqsjL1l9IT5oWSyfSowq+T6AVFzm4J0pECcO95ROBo12yDQEK47WKmLHHU+CNwaAF/SKU/SR7Ecs43N5ovYAZuTOekfYzo1cX+UkSeZwyfy5LmA3M0QsLWK7el8r8tGJVALjhEFdARzebdwTyO3S3m85loj38v7scJ5ejbIt3abwPctbZ8pYt9qTRQH3UXCPbfqbcvwqSZ5Zx51up1P8HxnRB850c7u3q8H+98BzcqxKNjxo4ReTB+rVKQbIr8xtqh0xHNcwqTgPYEyPSTpbgxhqsfww0ypy3P67VHP3PxhUHlctXltxqZHyN6nzoIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+P3cbNSXpZEDk7vSHrD1CZCjZg6clcjLlbNC8LEpGjI=;
 b=Hg0iXrN1PuMKFdxSYGGXh58r30w7ez+72P5ApdQBXPn3LIsXfJwasrmcU0ulxPSZ+2hLuHWDwktEGJHu+F4o+ZRNUu+RDibV9f1zJ4U9nZ6VmDlYWZlhleWTkgq0RMyRcJ4mtth1cxi2QseqfBAhunzdJ5VNOBZT9LGrPXpFt02LABzGGCdTg24yz9itROTI1QD5fEBK2fh5vfbQ5U4ZsniAt+gcoCJ20J/7X7H+imHHEvYjOpeKY4rtyVxEg74T8Odyis4NssTIt2zLOsh1tQTVU3qA6wDaMJfy4RkMTQAs3VJohtKyBnMUpA2/H9TQdYzvN3T8AwUy/i8EXS304A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by PH7PR11MB5942.namprd11.prod.outlook.com (2603:10b6:510:13e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Thu, 25 Jan
 2024 21:02:02 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::b8db:cc2d:d64f:f7de]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::b8db:cc2d:d64f:f7de%5]) with mapi id 15.20.7202.035; Thu, 25 Jan 2024
 21:02:02 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, =?iso-8859-1?Q?Christian_K=F6nig?=
 <christian.koenig@amd.com>
Subject: RE: Making drm_gpuvm work across gpu devices
Thread-Topic: Making drm_gpuvm work across gpu devices
Thread-Index: AQHaTas285rAdrskSkySwbywxZaZP7DnPvcAgAA/1GCAASXNAIACOegAgAACMfA=
Date: Thu, 25 Jan 2024 21:02:02 +0000
Message-ID: <SA1PR11MB6991B8FA2291D676B66DC865927A2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240117221223.18540-1-oak.zeng@intel.com>
 <20240117221223.18540-22-oak.zeng@intel.com>
 <ad21ec11-a9cb-4fb2-b9fd-00a4fa11525f@intel.com>
 <PH7PR11MB70049E7E6A2F40BF6282ECC292742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <PH7PR11MB700440CE88BC0A94CFF8499792742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <2928ce36-06a6-4bee-b115-8dd61cc41dca@amd.com>
 <SA1PR11MB699192584C01A26C781E2F9992742@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ccf34f6a-d704-43de-a15e-2ae2890f9381@amd.com>
 <ZbKpWpOGuNKLJ6sA@phenom.ffwll.local>
In-Reply-To: <ZbKpWpOGuNKLJ6sA@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|PH7PR11MB5942:EE_
x-ms-office365-filtering-correlation-id: 02da8b9b-360a-4731-def9-08dc1de8e145
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iSBUEx/X+AJrOTY6t47uVfnvWfz6tAg33sGBNP474UlrmLNH4cX1E4uZy8zA8q7PobfTEFuJqXo80jhAz2k8GcTySwh1/1UQ70qlyn39MuuYQP+c6L1bpXDtCPjvEDPvKNe/klGzYcYudMXHBadeaJqjrXw9EqO5Eprw2SAMzs+eFaI/i2NNrlDrRZebFz2ruGP5x1XhPkL51VD2G+2tY0fKmNmLQ5DYT11dWji+XfAYxAQgM0wlGarKGm4nTe3UsETaz6Q0F0zHLpa02oQk3nsY01G4OyBasdOGoBbnQmyNdQj3c4bY7Hpt4gQ6bs3de7OpEFM1sd7q+MRmQhHOXHNCmBoa2g633/0EjbVfvbcLEhHiDg15yYzeYK4tNzGItA0dehWnb729MYrPodqk7PpUY5MvGns00mJwdb3fpyCycyP2fGQNVnqTsFSORjfF1D6QA4qfmmo/vWPKE42b8ZUibWhR1WLto0cWwUkFnhuKLRcF5KxMErg7HUcK5TflvhQjnjX7PGz+05pTIZG1sq3OD7Cdc8fEBX+VeUM4v8uDqB6UownCtnLTsFgkHPyrJoJ54Y3QLpaZbjt6RfBgk54cSwmh9xdn1j0bOUnbY28=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(136003)(376002)(396003)(39860400002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(316002)(83380400001)(64756008)(54906003)(55016003)(53546011)(71200400001)(478600001)(7696005)(6506007)(66556008)(66446008)(966005)(122000001)(38100700002)(82960400001)(8676002)(4326008)(8936002)(9686003)(66476007)(26005)(110136005)(66574015)(86362001)(76116006)(66946007)(52536014)(5660300002)(2906002)(33656002)(38070700009)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?kuOJqBTJzNlNX63v0qzTxHD4OdF1jq2RKOd4gaPqhVKWiOSXArxAOX5Mw7?=
 =?iso-8859-1?Q?pRMRYFgJu3IkHGBput60OtwiDOxagitqxjp1u9kwxlBjEMBtw+ZHXIGktP?=
 =?iso-8859-1?Q?tXFyVZrg/5iwFd7Bx8hAT7sHk80POFX0pQOeopCu4JMbVvSLvhKbv88l+a?=
 =?iso-8859-1?Q?q9TRZO0G81nBhtBwS1CGbpxmaVLqltgZaDaM7twfo8GT6elDZBGef74DjQ?=
 =?iso-8859-1?Q?qt66gn+oxq7Vt1BYazDptgR+xjRivvc2VbsY1OdY8NztX8NFnbOE0kvL2E?=
 =?iso-8859-1?Q?Lg8PByEK39OqXN/sx1PrFB9FM6NtaOPXqCwri8YDoEBxtd+MMz6hfU7XLe?=
 =?iso-8859-1?Q?iKLTLGlPuGvKoiKaJJyafZvgvARIv5sEfV2G+YQBC5fMuonYVkuhTXdOtq?=
 =?iso-8859-1?Q?9xno/1IV546eocpnNJ9mRqbEoqfE3v8PMDWfl13rU7rYZOnjRyKkOAcGdq?=
 =?iso-8859-1?Q?Wj6uABhh/CD/ZWz8napA+Lh23BhjXN1JqnDQTYZoDEDKV9qcsl6lPPIDvt?=
 =?iso-8859-1?Q?xJd6nVYae8CHMFhWttNyXlwpUaqVPso5y/2jyLJR0m/hzS9mwZHiQsay/0?=
 =?iso-8859-1?Q?SBmRZ/YHAkzy0/Ozkb/42W4lIeSg4y0gTYrPf2eAsAI/mL8UfEgYTTy496?=
 =?iso-8859-1?Q?BslnqSrXF8UajzkI7ytp+pqUkU/fP9vzS4vzJHQMbnXgh6W56gWthpeTeA?=
 =?iso-8859-1?Q?VHIJfqdJDlW0BboyYm9HSGYlgyLnUOpzd3H55ewD+b+ag/hBy6ayMGqcBL?=
 =?iso-8859-1?Q?on/pNMPDWcjKZhf0BsfwfnnIsAI1WyiLRsR62a+Fx9FTulEpz6Cfs0QHlF?=
 =?iso-8859-1?Q?Aa8dUtNMKotebP+mDTu3I57Dyr2ra5T/Xg67q4tI70v8+LhxxkDuM+dxpB?=
 =?iso-8859-1?Q?IkLVXCfcVGdFDvSW4mXcY7WU3NYjtCNokPgmV6InvOQg3dofY/0Aaod9vx?=
 =?iso-8859-1?Q?BANOGYwoaBI7b9OUzgAzOIwX/SqjyPnDk/CkzpyFNP24kvpzuQKuephlly?=
 =?iso-8859-1?Q?mPKgiTC8iwLNUnAhkjjvvay/YqlNzmOqFuMERKSjhU3N/gTk55RfG28/iJ?=
 =?iso-8859-1?Q?oot7r0udCgw2sl54n4QQFGzWCL9g6S4Eu5Kc0mhcxZqd/md1xm90nX82Af?=
 =?iso-8859-1?Q?pTktXn6aG4bv+PxgrHZldJGrDZ95SU7nzhei6+pW9ucXCicq6w1WdEp6w+?=
 =?iso-8859-1?Q?QZmJ8wj3t1SDmzG5t7PPcArQo69pPEEFg4A6BIdeptSS4DQEA11MGrnK1K?=
 =?iso-8859-1?Q?cNV1cxd6/zB3pCxG4e7pLxrLuI8PUZsYynG4zDitx3Tg0tstGShy/fpfeQ?=
 =?iso-8859-1?Q?NUNRNPMPyfeQr5/zqOPdgu0rBddhs6lkwkcK27Ons6dNp+HbbQuib/Uise?=
 =?iso-8859-1?Q?nqJVhGB1dLum3RHWS+s8SIqgwKE/Tyj+ujuIv4KBKikOP2MYKfWkzDclAM?=
 =?iso-8859-1?Q?RNaEgeNCZLhBY5ofbKz/MsjNZxqbPgqQiOYmqUGLVyEuAewykRI90UlH9C?=
 =?iso-8859-1?Q?uLBpoFCrIShuUD9GuvVXxOmb5m50XruS72UXYB39N8KGkc54ErRaYIIOVQ?=
 =?iso-8859-1?Q?1XZpCP1ZaUTBwq0ves1AwEfgSZQYRyqo/+12hm4Nafm53TXeDQBctTMrWb?=
 =?iso-8859-1?Q?L7C0JZ2WF93fU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02da8b9b-360a-4731-def9-08dc1de8e145
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2024 21:02:02.8570 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ILAnizVQ0nyQa1NJJDXQrA/lgmZzRx+FW4qmTImrUYTfLiGjJkEs6zG5sHUxI4iyAWDXee+bPYqGs8pWuZgmww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5942
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>,
 Felix Kuehling <felix.kuehling@amd.com>, "Welty,
 Brian" <brian.welty@intel.com>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>, Danilo Krummrich <dakr@redhat.com>,
 "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 Dave Airlie <airlied@redhat.com>, "Vishwanathapura,
 Niranjana" <niranjana.vishwanathapura@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Daniel Vetter <daniel@ffwll.ch>
> Sent: Thursday, January 25, 2024 1:33 PM
> To: Christian K=F6nig <christian.koenig@amd.com>
> Cc: Zeng, Oak <oak.zeng@intel.com>; Danilo Krummrich <dakr@redhat.com>;
> Dave Airlie <airlied@redhat.com>; Daniel Vetter <daniel@ffwll.ch>; Felix
> Kuehling <felix.kuehling@amd.com>; Welty, Brian <brian.welty@intel.com>; =
dri-
> devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Bommu, Krish=
naiah
> <krishnaiah.bommu@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Thomas.Hellstrom@linux.intel.com;
> Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>; Brost,
> Matthew <matthew.brost@intel.com>; Gupta, saurabhg
> <saurabhg.gupta@intel.com>
> Subject: Re: Making drm_gpuvm work across gpu devices
>=20
> On Wed, Jan 24, 2024 at 09:33:12AM +0100, Christian K=F6nig wrote:
> > Am 23.01.24 um 20:37 schrieb Zeng, Oak:
> > > [SNIP]
> > > Yes most API are per device based.
> > >
> > > One exception I know is actually the kfd SVM API. If you look at the =
svm_ioctl
> function, it is per-process based. Each kfd_process represent a process a=
cross N
> gpu devices.
> >
> > Yeah and that was a big mistake in my opinion. We should really not do =
that
> > ever again.
> >
> > > Need to say, kfd SVM represent a shared virtual address space across =
CPU
> and all GPU devices on the system. This is by the definition of SVM (shar=
ed virtual
> memory). This is very different from our legacy gpu *device* driver which=
 works
> for only one device (i.e., if you want one device to access another devic=
e's
> memory, you will have to use dma-buf export/import etc).
> >
> > Exactly that thinking is what we have currently found as blocker for a
> > virtualization projects. Having SVM as device independent feature which
> > somehow ties to the process address space turned out to be an extremely=
 bad
> > idea.
> >
> > The background is that this only works for some use cases but not all o=
f
> > them.
> >
> > What's working much better is to just have a mirror functionality which=
 says
> > that a range A..B of the process address space is mapped into a range C=
..D
> > of the GPU address space.
> >
> > Those ranges can then be used to implement the SVM feature required for
> > higher level APIs and not something you need at the UAPI or even inside=
 the
> > low level kernel memory management.
> >
> > When you talk about migrating memory to a device you also do this on a =
per
> > device basis and *not* tied to the process address space. If you then g=
et
> > crappy performance because userspace gave contradicting information whe=
re
> to
> > migrate memory then that's a bug in userspace and not something the ker=
nel
> > should try to prevent somehow.
> >
> > [SNIP]
> > > > I think if you start using the same drm_gpuvm for multiple devices =
you
> > > > will sooner or later start to run into the same mess we have seen w=
ith
> > > > KFD, where we moved more and more functionality from the KFD to the
> DRM
> > > > render node because we found that a lot of the stuff simply doesn't=
 work
> > > > correctly with a single object to maintain the state.
> > > As I understand it, KFD is designed to work across devices. A single =
pseudo
> /dev/kfd device represent all hardware gpu devices. That is why during kf=
d open,
> many pdd (process device data) is created, each for one hardware device f=
or this
> process.
> >
> > Yes, I'm perfectly aware of that. And I can only repeat myself that I s=
ee
> > this design as a rather extreme failure. And I think it's one of the re=
asons
> > why NVidia is so dominant with Cuda.
> >
> > This whole approach KFD takes was designed with the idea of extending t=
he
> > CPU process into the GPUs, but this idea only works for a few use cases=
 and
> > is not something we should apply to drivers in general.
> >
> > A very good example are virtualization use cases where you end up with =
CPU
> > address !=3D GPU address because the VAs are actually coming from the g=
uest
> VM
> > and not the host process.
> >
> > SVM is a high level concept of OpenCL, Cuda, ROCm etc.. This should not=
 have
> > any influence on the design of the kernel UAPI.
> >
> > If you want to do something similar as KFD for Xe I think you need to g=
et
> > explicit permission to do this from Dave and Daniel and maybe even Linu=
s.
>=20
> I think the one and only one exception where an SVM uapi like in kfd make=
s
> sense, is if the _hardware_ itself, not the software stack defined
> semantics that you've happened to build on top of that hw, enforces a 1:1
> mapping with the cpu process address space.
>=20
> Which means your hardware is using PASID, IOMMU based translation, PCI-AT=
S
> (address translation services) or whatever your hw calls it and has _no_
> device-side pagetables on top. Which from what I've seen all devices with
> device-memory have, simply because they need some place to store whether
> that memory is currently in device memory or should be translated using
> PASID. Currently there's no gpu that works with PASID only, but there are
> some on-cpu-die accelerator things that do work like that.
>=20
> Maybe in the future there will be some accelerators that are fully cpu
> cache coherent (including atomics) with something like CXL, and the
> on-device memory is managed as normal system memory with struct page as
> ZONE_DEVICE and accelerator va -> physical address translation is only
> done with PASID ... but for now I haven't seen that, definitely not in
> upstream drivers.
>=20
> And the moment you have some per-device pagetables or per-device memory
> management of some sort (like using gpuva mgr) then I'm 100% agreeing wit=
h
> Christian that the kfd SVM model is too strict and not a great idea.
>=20


GPU is nothing more than a piece of HW to accelerate part of a program, jus=
t like an extra CPU core. From this perspective, a unified virtual address =
space across CPU and all GPU devices (and any other accelerators) is always=
 more convenient to program than split address space b/t devices.

In reality, GPU program started from split address space.  HMM is designed =
to provide unified virtual address space w/o a lot of advanced hardware fea=
ture you listed above.=20

I am aware Nvidia's new hardware platforms such as Grace Hopper natively su=
pport the Unified Memory programming model through hardware-based memory co=
herence among all CPUs and GPUs. For such systems, HMM is not required.

You can think HMM as a software based solution to provide unified address s=
pace b/t cpu and devices. Both AMD and Nvidia have been providing unified a=
ddress space through hmm. I think it is still valuable.

Regards,
Oak =20



> Cheers, Sima
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
