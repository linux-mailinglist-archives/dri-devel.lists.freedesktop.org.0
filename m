Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 459806DA697
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 02:20:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA8B510ED65;
	Fri,  7 Apr 2023 00:20:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7709610E227;
 Fri,  7 Apr 2023 00:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680826839; x=1712362839;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Kq5ap+uJo7K54/YlX/B+neQQqnoT0zq7a1zHhQ+vlEc=;
 b=P6jt9goYPIv4prUWSu1hRYS6DVpID2fBcSb00PlKJ3HgsIV0Bzs6e2CD
 MyN3vUTZ9ZRe16xyCGnz9AVboVmfWcgWUO8GLSdrvq+f6A021dVw9TbCr
 sKSMHMGfWHYU6IkUsGaIwj5DOg+VlcFhC5X4CtTjALOuX62hECOEpRRq0
 nLbSy1OyAnhytN2C9dFuxnBTBMA5Vz9hj4xqDBxOfo1Lt4fDe+KzgkBu5
 tthH4RylfFq8x6kWBgWDoR1+LjAE4fYxtk2Ygyj0GHlorG6xflSZU//M+
 v93HGQed2pjDSfhjeINJmLtedjeobjkMvKk/rM7BI3kH4ihQPskwPrdab A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="340367611"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; d="scan'208";a="340367611"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 17:20:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="776671351"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; d="scan'208";a="776671351"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP; 06 Apr 2023 17:20:38 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Apr 2023 17:20:38 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Apr 2023 17:20:37 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 6 Apr 2023 17:20:37 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 6 Apr 2023 17:20:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lbfc88VJF9nnvSuFzCv17aRU1yFbo0qhraOwprJ1gfR0zWm/fD6vtLerfaz2so/qZMcmZJeuS9i9P3yzZRQjHsm7QrHJR8CIs1vWGkmGOn1SRiLN7p4BlizqAg8o5UQcARFJcNRrx7qucimxck4PBWL0orAmlpoGmwTFjzCTZjde1IudbzI6tL6QdsOTz6gQJ5a9Q2+2tcE5M3niQY+fCGsrFGF1VqhJPXY4P6xBsZRxLKlr2LM85FjK6xEVxNl5n6aPXFGkDeLr4XSRoMW67Br4zGHf9A5K6EJ8hnUIatr3Qh4mS/kvDdX9509aBHlY/qjKT3PXxxGO0B2EBhW26A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ERyRPs2vqK6jdiWbwgMbCeTqcu9lfbXSzIOCzb6iD3U=;
 b=f+1lYDP/t7ui8Jhvd0KcqXQNBVA4FnIlMcmRAJZjaCXgwFztpyA0gHoC+hpBca8GAesUIjttfupEfw4QVsBHwMoUrZQEpM1ZSif2w+11Bt/v8ds4FPplW+IT/02Ki8bB5nd2w9UAeGZ29yCEPkiESRvOleDlIGibFWlXZENEkl7ucfQqfsJcBZK9v3V3xnCgtXMrinTqc/H8W5RgYNcr93h/u5keNI814z8KfqfOUaveZVkXe+UqfkCRa5mOhpecS1858vwne9+JVg1NQXxEpVXv9GY5YY623TvqTrFbButL3z32V0Z0lm0L+iPowBj2njp/xQ2fUO2ghTqxutLrgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by MW3PR11MB4571.namprd11.prod.outlook.com (2603:10b6:303:59::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Fri, 7 Apr
 2023 00:20:35 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::faf8:6c89:f5dd:272c]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::faf8:6c89:f5dd:272c%7]) with mapi id 15.20.6254.035; Fri, 7 Apr 2023
 00:20:35 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [RFC PATCH 00/10] Xe DRM scheduler and long running workload plans
Thread-Topic: [RFC PATCH 00/10] Xe DRM scheduler and long running workload
 plans
Thread-Index: AQHZZoufWCmjZWlwlUCiRpk8O6t5ja8bagjggAAJ6wCAAN/egIAArn0QgAAQWwCAAdzcIA==
Date: Fri, 7 Apr 2023 00:20:35 +0000
Message-ID: <SA1PR11MB699131A9F895F4A7AE28FEB492969@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <SA1PR11MB69913F0A0038DA307701D44092939@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZCxnuCvmknUuLydM@DUT025-TGLU.fm.intel.com>
 <018b891d-ec31-b8c2-f987-45a204ed77ed@amd.com>
 <SA1PR11MB69918B99750334B368E196B992909@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZC3Dmno7s05/5VPN@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZC3Dmno7s05/5VPN@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|MW3PR11MB4571:EE_
x-ms-office365-filtering-correlation-id: 28028646-4ff1-435e-036e-08db36fde847
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AmDFUoSr7Z/aMuAEaEG6E5qYS0r66JDrjWMrhBnAB39X7wUy3xIrlJyvS+2HCLD9b/j2jC2sos3bFKuzh6W//fSqc1VBZ8h/9Z0WTsGBBO5CeI6f3Sft0tVyDaRffgYLVgjNSGOBo3P9mS3HsyYE/SxHEHwE+4YIaA+UMuojVyTezORoVl7sijxumQwWADHHQRBe6oF0dC9d3NurF/XtfZpqHShKQSTL1QmtNhb4eNkoItTAqrtueZgMdrkeVen6LYN8PoMzrtUb3rZ0py1VYsuslVjm7S2TtTGcn/ZGjQJ/CThpieqD1C01vq20IOKJos1PyaFYzJgvzNnW3fQRgpmDEgNn1PygUfSW6RDHdYw5fWNdJUZiQFe9JsGVhUb0oNSDydhhNKAB054t4HJ+SQQSBrq6zXcwylvVfVMNDMw/9SgvshDIhdPByfd+atXpGdh51fqq6wrruTKjUqfYioNiBaheJY3MswsZ+b2VsMFbWPvj+gYg/GfGHNZRrSfgbjwrw/LIwnovaloHbkg3+6mpTbwfphdkGlcyS+CAHmhSgm0dBByZtT7nDxeMUP92
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(396003)(366004)(136003)(376002)(451199021)(38100700002)(316002)(2906002)(64756008)(6636002)(6862004)(54906003)(41300700001)(30864003)(5660300002)(52536014)(4326008)(66556008)(186003)(8676002)(66476007)(66446008)(66946007)(66899021)(478600001)(76116006)(966005)(7696005)(71200400001)(8936002)(122000001)(26005)(53546011)(9686003)(6506007)(66574015)(33656002)(55016003)(83380400001)(38070700005)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?rLOBD9kHs9PVdCCudOrmv/GF83bJo++xwboCc3LLOToNbBHet8CKFRlMOa?=
 =?iso-8859-1?Q?g99bI2XR4jnEtCvJ3i/BPgAhzQ3aS+bLdlQg4pri/4ddWsvmylLwM00OHR?=
 =?iso-8859-1?Q?q901et+y1kKMGXe+pk3ZSVCOZbuhFDMf1vJx8t63xxik5VR9ZdGMSUgyvo?=
 =?iso-8859-1?Q?mq1O/bv7liDwNqpONNwj5+CbiJXanh72i/NpYa0kp5+R1cXYDmFFM6/EgR?=
 =?iso-8859-1?Q?kFNSRysMblagroMFIQ8Jw7z7golyo8HVdJ0ucQ84hSq3SgrAjIFRP6ypHz?=
 =?iso-8859-1?Q?7jzOj8a0PuRc15+0FYwIqF1cnCO7BxlLa+YMVRn1/EhEHoeqpp7zQRFPS8?=
 =?iso-8859-1?Q?Zr4ESuNzWIkb8QUFpP8KRirVKIvemOVQPDNXaurDXEtzf3Qk21dkWYCrm9?=
 =?iso-8859-1?Q?oWPeK0sfDETOkwcIytSJUofnTwPTFAJWzNi+YAWmUOQUfoeVhspEsMawc8?=
 =?iso-8859-1?Q?nNx/KgdUigfvweV+ft54p6wR4rQTmyraYJkHUGOL/k5IThaU9bOQwB1Y9z?=
 =?iso-8859-1?Q?8dTlTqmtgthkeZk0k5zWfb7jjr6iVe2pZmr2La/mbhUIrK9aIDX0grs8H5?=
 =?iso-8859-1?Q?z1EDk/qyhotSotS2BYr318UIKGySq1Fy0dzRzsgE9sxo5PXB2PbIxQwLeC?=
 =?iso-8859-1?Q?J+qAE7e1+OwifoVVpZwdlZI5pL/YQeFrhPliVxXU8EgfWA9u7CU3uaKGES?=
 =?iso-8859-1?Q?SzBDSwV58uQmTsEz25E9xnvOa5d/SfFA4jWAoUJH3/tuMzjNvi/sxXF7XV?=
 =?iso-8859-1?Q?GRz5M+zMFXdGW4zqm+nH3hvrCrxwqyxIVkQ5d2DVedqsDMgGdnG6ALKgjy?=
 =?iso-8859-1?Q?CxHcDQ+Eh+Eb74Z+1oMGwB7a4486P+m4ZkMdmbZ6vHOr5Epguxlxod9huZ?=
 =?iso-8859-1?Q?D/eG0Qja2gs96w0p7OSGA3vtzZkUvMo3GzP/h/BJnLTdfjXlcai6tkLlBt?=
 =?iso-8859-1?Q?6zGDRlxArPYs1SgDeGNRIQHq4/uxSN224pJ6lwDVDjAtFIy85XuPO4+7L4?=
 =?iso-8859-1?Q?219ZqfKBxrU9z5HZpOEeWH4F2cROI6qKiIT9CAqCOBbEt0oIQGaM1jrfnt?=
 =?iso-8859-1?Q?Rkp+5cHKJJjL9lD6KZgJ0cij2NJbImkumNPlDyr9auF3J5eI7iOpgwrMdk?=
 =?iso-8859-1?Q?XzYwVhqW9VPmBlF0vgGHvzbvPc7nZHJkHuMio4edjC6web6hqWNbyDyKcX?=
 =?iso-8859-1?Q?T0BkEu32H1zA6LTo3uOcX0tPAsQjCTjAZVkoXRV+uM+KujY6pDfynmGg29?=
 =?iso-8859-1?Q?x/a4q1Ikj59Yt1tGw5hU7nIFPG9duyWtKekkGEOa4yyrkbtaBe4pb5Uk+M?=
 =?iso-8859-1?Q?zRwBMKFlMlZdr6Zxtg9r8ShbFmn4P81BTV69acGei1kROOFS/GoTKglr6E?=
 =?iso-8859-1?Q?AqrbslP/Sm1oqWOjf0JrcdAzJU0BYQJkQ9ZfhqaOMGjlKD091WOfN3MKCX?=
 =?iso-8859-1?Q?iAzFQANkoa6kFls8Kfw/l3lgklOtr3IgShFV3+KA0dAEm3P/6k+muaJEGi?=
 =?iso-8859-1?Q?DbuGmOTybq+tmGb6NQUZK7kptdHtKu90N+xcwcCNUJEDzknIB3MEd2hH2y?=
 =?iso-8859-1?Q?GKqmvEcnirfoJC9LDUDNbPQuo1OFwbKdy2UQDNDgVCRpYLuR5snu2+KPif?=
 =?iso-8859-1?Q?bvvJiNUeNaQE0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28028646-4ff1-435e-036e-08db36fde847
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2023 00:20:35.4489 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tAv76N8qtu82jl7wSr+saf4L7wVSYxqeIbeBOFWY/9XSvOuur1yhSvPvZP8FIbS2IwBhCs3Cb2HbhFMbZwvu8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4571
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
Cc: "robdclark@chromium.org" <robdclark@chromium.org>,
 =?iso-8859-1?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "lina@asahilina.net" <lina@asahilina.net>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>, "Vetter, 
 Daniel" <daniel.vetter@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

So this series basically go with option 2. The part that option2 makes me u=
ncomfortable is, dma-fence doesn't work for long running workload, why we g=
enerate it in the first place? As long as dma-fence is generated, it will b=
ecome a source of confusion in the future. It doesn't matter how much you a=
nnotate it/document it. So if we decide to go with option2, the bottom line=
 is, don't generate dma-fence for long running workload during job submissi=
on. This requires some rework in drm scheduler.

The cleanest solution to me is option3. Dma-fence is a very old technology.=
 When it was created, no gpu support page fault. Obviously this is not a go=
od technology for modern gpu with page fault support. I think the best way =
is to create a new scheduler and dependency tracking mechanism works for bo=
th page fault enabled and page fault disabled context. I think this matches=
 what Christian said below. Maybe nobody think this is easy? =20

Thanks,
Oak

> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: April 5, 2023 2:53 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: Christian K=F6nig <christian.koenig@amd.com>; Vetter, Daniel
> <daniel.vetter@intel.com>; Thomas Hellstr=F6m
> <thomas.hellstrom@linux.intel.com>; dri-devel@lists.freedesktop.org; inte=
l-
> xe@lists.freedesktop.org; robdclark@chromium.org; airlied@linux.ie;
> lina@asahilina.net; boris.brezillon@collabora.com; faith.ekstrand@collabo=
ra.com
> Subject: Re: [RFC PATCH 00/10] Xe DRM scheduler and long running workload
> plans
>=20
> On Wed, Apr 05, 2023 at 12:06:53PM -0600, Zeng, Oak wrote:
> > Hi,
> >
> > Using dma-fence for completion/dependency tracking for long-run
> workload(more precisely on-demand paging/page fault enabled workload) can
> cause deadlock. This seems the significant issue here. Other issues such =
as the
> drm scheduler completion order implication etc are minors which can be so=
lve
> inside the framework of drm scheduler. We need to evaluate below paths:
> >
> > 	1) still use drm scheduler for job submission, and use dma-fence for j=
ob
> completion waiting/dependency tracking. This is solution proposed in this=
 series.
> Annotate dma-fence for long-run workload: user can still wait dma-fence f=
or job
> completion but can't wait dma-fence while holding any memory management
> locks.  We still use dma-fence for dependency tracking. But it is just ve=
ry easily
> run into deadlock when on-demand paging is in the picture. The annotation=
 helps
> us to detect deadlock but not solve deadlock problems. Seems *not* a comp=
lete
> solution: It is almost impossible to completely avoid dependency deadlock=
 in
> complex runtime environment
> >
>=20
> No one can wait on LR fence, so it is impossible to deadlock. The
> annotations enforce this. Literally this is only for flow controling the
> ring / hold pending jobs in in the DRM schedule list.
>=20
> > 	2) Still use drm scheduler but not use dma-fence for completion signal=
ing
> and dependency tracking. This way we still get some free functions (reset=
, err
> handling ring flow control as Matt said)from drm scheduler, but push the
> dependency/completion tracking completely to user space using techniques =
such
> as user space fence. User space doesn't have chance to wait fence while h=
olding
> a kernel memory management lock, thus the dma-fence deadlock issue is sol=
ved.
> >
>=20
> We use user space fence for syncs.
>=20
> > 	3) Completely discard drm scheduler and dma-fence for long-run
> workload. Use user queue/doorbell for super fast submission, directly int=
eract
> with fw scheduler. Use user fence for completion/dependency tracking.
> >
>=20
> This is a hard no from me, I want 1 submission path in Xe. Either we use
> the DRM scheduler or we don't.
>=20
> Matt
>=20
> > Thanks,
> > Oak
> >
> > > -----Original Message-----
> > > From: Christian K=F6nig <christian.koenig@amd.com>
> > > Sent: April 5, 2023 3:30 AM
> > > To: Brost, Matthew <matthew.brost@intel.com>; Zeng, Oak
> > > <oak.zeng@intel.com>
> > > Cc: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org;
> > > robdclark@chromium.org; thomas.hellstrom@linux.intel.com;
> airlied@linux.ie;
> > > lina@asahilina.net; boris.brezillon@collabora.com;
> faith.ekstrand@collabora.com
> > > Subject: Re: [RFC PATCH 00/10] Xe DRM scheduler and long running work=
load
> > > plans
> > >
> > > Am 04.04.23 um 20:08 schrieb Matthew Brost:
> > > > On Tue, Apr 04, 2023 at 12:02:03PM -0600, Zeng, Oak wrote:
> > > >> Hi Matt, Thomas,
> > > >>
> > > >> Some very bold out of box thinking in this area:
> > > >>
> > > >> 1. so you want to use drm scheduler and dma-fence for long running
> workload.
> > > Why you want to do this in the first place? What is the benefit? Drm =
scheduler
> is
> > > pretty much a software scheduler. Modern gpu has scheduler built at f=
w/hw
> > > level, as you said below for intel this is Guc. Can xe driver just di=
rectly submit
> job
> > > to Guc, bypassing drm scheduler?
> > > >>
> > > > If we did that now we have 2 paths for dependency track, flow contr=
oling
> > > > the ring, resets / error handling / backend submission implementati=
ons.
> > > > We don't want this.
> > >
> > > Well exactly that's the point: Why?
> > >
> > > As far as I can see that are two completely distinct use cases, so yo=
u
> > > absolutely do want two completely distinct implementations for this.
> > >
> > > >> 2. using dma-fence for long run workload: I am well aware that pag=
e fault
> (and
> > > the consequent memory allocation/lock acquiring to fix the fault) can=
 cause
> > > deadlock for a dma-fence wait. But I am not convinced that dma-fence =
can't
> be
> > > used purely because the nature of the workload that it runs very long
> (indefinite).
> > > I did a math: the dma_fence_wait_timeout function's third param is th=
e
> timeout
> > > which is a signed long type. If HZ is 1000, this is about 23 days. If=
 23 days is not
> long
> > > enough, can we just change the timeout parameter to signed 64 bits so=
 it is
> much
> > > longer than our life time...
> > > >>
> > > >> So I mainly argue we can't use dma-fence for long-run workload is =
not
> > > because the workload runs very long, rather because of the fact that =
we use
> > > page fault for long-run workload. If we enable page fault for short-r=
un
> workload,
> > > we can't use dma-fence either. Page fault is the key thing here.
> > > >>
> > > >> Now since we use page fault which is *fundamentally* controversial=
 with
> > > dma-fence design, why now just introduce a independent concept such a=
s
> user-
> > > fence instead of extending existing dma-fence?
> > > >>
> > > >> I like unified design. If drm scheduler, dma-fence can be extended=
 to work
> for
> > > everything, it is beautiful. But seems we have some fundamental probl=
em
> here.
> > > >>
> > > > Thomas's patches turn a dma-fence into KMD sync point (e.g. we just=
 use
> > > > the signal / CB infrastructure) and enforce we don't use use these
> > > > dma-fences from the scheduler in memory reclaim paths or export the=
se to
> > > > user space or other drivers. Think of this mode as SW only fence.
> > >
> > > Yeah and I truly think this is an really bad idea.
> > >
> > > The signal/CB infrastructure in the dma_fence turned out to be the
> > > absolutely nightmare I initially predicted. Sorry to say that, but in
> > > this case the "I've told you so" is appropriate in my opinion.
> > >
> > > If we need infrastructure for long running dependency tracking we sho=
uld
> > > encapsulate that in a new framework and not try to mangle the existin=
g
> > > code for something it was never intended for.
> > >
> > > Christian.
> > >
> > > >
> > > > Matt
> > > >
> > > >> Thanks,
> > > >> Oak
> > > >>
> > > >>> -----Original Message-----
> > > >>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Beha=
lf Of
> > > >>> Matthew Brost
> > > >>> Sent: April 3, 2023 8:22 PM
> > > >>> To: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.o=
rg
> > > >>> Cc: robdclark@chromium.org; thomas.hellstrom@linux.intel.com;
> > > airlied@linux.ie;
> > > >>> lina@asahilina.net; boris.brezillon@collabora.com; Brost, Matthew
> > > >>> <matthew.brost@intel.com>; christian.koenig@amd.com;
> > > >>> faith.ekstrand@collabora.com
> > > >>> Subject: [RFC PATCH 00/10] Xe DRM scheduler and long running work=
load
> > > plans
> > > >>>
> > > >>> Hello,
> > > >>>
> > > >>> As a prerequisite to merging the new Intel Xe DRM driver [1] [2],=
 we
> > > >>> have been asked to merge our common DRM scheduler patches first a=
s
> well
> > > >>> as develop a common solution for long running workloads with the =
DRM
> > > >>> scheduler. This RFC series is our first attempt at doing this. We
> > > >>> welcome any and all feedback.
> > > >>>
> > > >>> This can we thought of as 4 parts detailed below.
> > > >>>
> > > >>> - DRM scheduler changes for 1 to 1 relationship between scheduler=
 and
> > > >>> entity (patches 1-3)
> > > >>>
> > > >>> In Xe all of the scheduling of jobs is done by a firmware schedul=
er (the
> > > >>> GuC) which is a new paradigm WRT to the DRM scheduler and present=
s
> > > >>> severals problems as the DRM was originally designed to schedule =
jobs
> on
> > > >>> hardware queues. The main problem being that DRM scheduler expect=
s
> the
> > > >>> submission order of jobs to be the completion order of jobs even =
across
> > > >>> multiple entities. This assumption falls apart with a firmware sc=
heduler
> > > >>> as a firmware scheduler has no concept of jobs and jobs can compl=
ete
> out
> > > >>> of order. A novel solution for was originally thought of by Faith=
 during
> > > >>> the initial prototype of Xe, create a 1 to 1 relationship between=
 scheduler
> > > >>> and entity. I believe the AGX driver [3] is using this approach a=
nd
> > > >>> Boris may use approach as well for the Mali driver [4].
> > > >>>
> > > >>> To support a 1 to 1 relationship we move the main execution funct=
ion
> > > >>> from a kthread to a work queue and add a new scheduling mode whic=
h
> > > >>> bypasses code in the DRM which isn't needed in a 1 to 1 relations=
hip.
> > > >>> The new scheduling mode should unify all drivers usage with a 1 t=
o 1
> > > >>> relationship and can be thought of as using scheduler as a depend=
ency /
> > > >>> infligt job tracker rather than a true scheduler.
> > > >>>
> > > >>> - Generic messaging interface for DRM scheduler
> > > >>>
> > > >>> Idea is to be able to communicate to the submission backend with =
in
> band
> > > >>> (relative to main execution function) messages. Messages are back=
end
> > > >>> defined and flexable enough for any use case. In Xe we use these
> > > >>> messages to clean up entites, set properties for entites, and sus=
pend /
> > > >>> resume execution of an entity [5]. I suspect other driver can lev=
erage
> > > >>> this messaging concept too as it a convenient way to avoid races =
in the
> > > >>> backend.
> > > >>>
> > > >>> - Support for using TDR for all error paths of a scheduler / enti=
ty
> > > >>>
> > > >>> Fix a few races / bugs, add function to dynamically set the TDR t=
imeout.
> > > >>>
> > > >>> - Annotate dma-fences for long running workloads.
> > > >>>
> > > >>> The idea here is to use dma-fences only as sync points within the
> > > >>> scheduler and never export them for long running workloads. By
> > > >>> annotating these fences as long running we ensure that these dma-
> fences
> > > >>> are never used in a way that breaks the dma-fence rules. A benefi=
t of
> > > >>> thus approach is the scheduler can still safely flow control the
> > > >>> execution ring buffer via the job limit without breaking the dma-=
fence
> > > >>> rules.
> > > >>>
> > > >>> Again this a first draft and looking forward to feedback.
> > > >>>
> > > >>> Enjoy - Matt
> > > >>>
> > > >>> [1] https://gitlab.freedesktop.org/drm/xe/kernel
> > > >>> [2] https://patchwork.freedesktop.org/series/112188/
> > > >>> [3] https://patchwork.freedesktop.org/series/114772/
> > > >>> [4]
> https://patchwork.freedesktop.org/patch/515854/?series=3D112188&rev=3D1
> > > >>> [5] https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-
> > > >>> next/drivers/gpu/drm/xe/xe_guc_submit.c#L1031
> > > >>>
> > > >>> Matthew Brost (8):
> > > >>>    drm/sched: Convert drm scheduler to use a work queue rather th=
an
> > > >>>      kthread
> > > >>>    drm/sched: Move schedule policy to scheduler / entity
> > > >>>    drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling
> policy
> > > >>>    drm/sched: Add generic scheduler message interface
> > > >>>    drm/sched: Start run wq before TDR in drm_sched_start
> > > >>>    drm/sched: Submit job before starting TDR
> > > >>>    drm/sched: Add helper to set TDR timeout
> > > >>>    drm/syncobj: Warn on long running dma-fences
> > > >>>
> > > >>> Thomas Hellstr=F6m (2):
> > > >>>    dma-buf/dma-fence: Introduce long-running completion fences
> > > >>>    drm/sched: Support long-running sched entities
> > > >>>
> > > >>>   drivers/dma-buf/dma-fence.c                 | 142 +++++++---
> > > >>>   drivers/dma-buf/dma-resv.c                  |   5 +
> > > >>>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  14 +-
> > > >>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |  15 +-
> > > >>>   drivers/gpu/drm/drm_syncobj.c               |   5 +-
> > > >>>   drivers/gpu/drm/etnaviv/etnaviv_sched.c     |   5 +-
> > > >>>   drivers/gpu/drm/lima/lima_sched.c           |   5 +-
> > > >>>   drivers/gpu/drm/msm/adreno/adreno_device.c  |   6 +-
> > > >>>   drivers/gpu/drm/msm/msm_ringbuffer.c        |   5 +-
> > > >>>   drivers/gpu/drm/panfrost/panfrost_job.c     |   5 +-
> > > >>>   drivers/gpu/drm/scheduler/sched_entity.c    | 127 +++++++--
> > > >>>   drivers/gpu/drm/scheduler/sched_fence.c     |   6 +-
> > > >>>   drivers/gpu/drm/scheduler/sched_main.c      | 278 +++++++++++++=
++--
> ---
> > > >>>   drivers/gpu/drm/v3d/v3d_sched.c             |  25 +-
> > > >>>   include/drm/gpu_scheduler.h                 | 130 +++++++--
> > > >>>   include/linux/dma-fence.h                   |  60 ++++-
> > > >>>   16 files changed, 649 insertions(+), 184 deletions(-)
> > > >>>
> > > >>> --
> > > >>> 2.34.1
> >
