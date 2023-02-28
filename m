Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1B96A5B3D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 16:01:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8328E10E4C2;
	Tue, 28 Feb 2023 15:01:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6543C10E4BB;
 Tue, 28 Feb 2023 15:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677596467; x=1709132467;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=u3HoaJ0hRE2eRbL6HWZ3MYZJtaFbXs/xk7oLj6pa5KM=;
 b=Gx/QcloaInaKjV+uR+BIufcFJxMnfCBJdjSva/S8CsDX+RiHzd76Cfll
 c//VvENZRuJMpZwmhvxKwT3goP0s5Q6pGm/I1B20VVk9PkRX/aot853tr
 vqY8/qtBLdplUKPbYPkzyycUF4X7D5j+B1DHOjnN9TDh8btWo2NwnDnK/
 Efkcd8f/4/u5EIgzN8q9xhyT7qRyByWv6w9go44fsp25+DP7XBh9Qnygb
 4EDQE/wZojIJpfVK8gL81SFEAh/vhKZnIe598jL3L2zq/NtRMOR3WVdw5
 OPEed4IjjeDIo3v0XbWNr2jcAaPUXxjqh7YU9BKENBsNSOTXHd5Ms91UH A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="313824291"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; d="scan'208";a="313824291"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 07:01:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="676323791"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; d="scan'208";a="676323791"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 28 Feb 2023 07:01:04 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 28 Feb 2023 07:01:04 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 28 Feb 2023 07:01:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 28 Feb 2023 07:01:03 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 28 Feb 2023 07:01:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nMec1zEzJ23M9oYclnOIS4yhyKXcCyxUWw/8sbssul78IxLHw6M3s5XzLmK5VhhaZuITFj1z7W/5wXkGbOA2cb2nROGURBl0nZAfpTw+vI3eXCBlZQSwz+Sxo5KnsJbJ8zWldEjnRm/XTE+J2vd8krh+PvEoSrI2l/27z8M3PN5fvpOae9VNLGY7SuVcE+O75Ego1JDGS2n+bmMF8Feh3fAVF3swe9dIhszDRlaE0jP0pvkq/ex88dbZqLAM2BEt5frmNHtKVnzJJb5enNagbBr+zYhb6JbPNK/qxTijmUcYz5KC3A1YqwebwTKU8VTXKjBMgtp15SNjCCjHzDdnpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1OJBUUIf0nbHlzSYuCihGZ8b8zQdFP1JaJzjp8ELYDE=;
 b=GTYVHnTlKss/VbhFFfdre5OkM7IWouU8Bn5qk/LTbbOg9Dp4OE2MUVFKb5htcBvNN4XZZ59X5qcQBvOSSR2Ml0ufG1gjWTsWfRsnjH5hPH6VSDsLGt+z+Hb8J5y3031OcpI93sULkjQFMpzfyPFGMaifpQB5LgBAEZII0+issiIuE4FD+JA9yXL3fu8XjPwZLRFDCCS+XMq84YoWxKejxtkEFzHUyLjZ7dM2OTONqve2TG7Y7MsEZCG2D1REY17H2bv9NBprZIB31ehE88qSbZEasvHzl0XRqonJ6QaRbokygp0G8qwhQQeDVvTfevqGKws0jyMyCYpe85tsO7MAzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5655.namprd11.prod.outlook.com (2603:10b6:8:28::10) by
 SJ1PR11MB6227.namprd11.prod.outlook.com (2603:10b6:a03:45a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.28; Tue, 28 Feb
 2023 15:01:00 +0000
Received: from DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::9fb9:e089:9c08:dad]) by DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::9fb9:e089:9c08:dad%3]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 15:00:59 +0000
From: "Saarinen, Jani" <jani.saarinen@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: RE: [PATCH] drm/shmem-helper: Fix compile error
Thread-Topic: [PATCH] drm/shmem-helper: Fix compile error
Thread-Index: AQHZS4KiAv24J5rJp0CIWYJ3CCCm3K7kc2mg
Date: Tue, 28 Feb 2023 15:00:59 +0000
Message-ID: <DM8PR11MB5655820080C7190C2934A7F6E0AC9@DM8PR11MB5655.namprd11.prod.outlook.com>
References: <20230228125054.1952657-1-andi.shyti@linux.intel.com>
 <71dee5cf-3c12-8d5f-5d2a-be0a39647d8c@collabora.com>
 <Y/4AMJ/+3BhTa+FF@ashyti-mobl2.lan> <87bkldzxv1.fsf@intel.com>
 <Y/4OrBltJz1J0qxe@ashyti-mobl2.lan> <877cw1zwdf.fsf@intel.com>
In-Reply-To: <877cw1zwdf.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5655:EE_|SJ1PR11MB6227:EE_
x-ms-office365-filtering-correlation-id: 6689f864-86d3-47a9-d11d-08db199c9a24
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j2H0pjms4zIuClnMhJR1YB7gv2wjwJMJeW4xe2b+y02azdtnNSruq/uehyQa9Y7II6g5XyuRMl8s8pdZtS8g6CKq4qvZsauGaQEABdbU3c5o4qDECZisD8SQQCsJKPmQKSOd49ZP9ssL8Re8yWkTYRlXKfYB1RdSoeY1xYunNgD4X9w3c5IGkaD9ro5OD5ke9FPvUqcZyjmzu55eF7/0cDvknCZ8IQFAi918v1UiFXl3l7RZYAZ7xDbMm/Eje8ajV7e7J5rPcpsBpNrTr7qahfynoYOdeDB83OxWFOavQKRQPWBu9VTRNG4cZslp4B1fa4/bNUFTayBNkc7xihjdW7yB6QeIUg7lEScnfjEyY8qmk7Bj3lrZXgl7sy6XVpxU3QPYoJ5FZwZliHtyV52/1lzf9wMYsscZSLnmUzvKgtEwdkSMoW9j/kaseqCrPcNMQDNuQydaNB5Ey9NNuCoXrrWBIRY2lDl3t+UAIR7LhHfEWX2Aa1HsaAUcN5TwzyPAHGY2HsO2cxT/LFkg+KYE41Ya9275qYQSor3l1yxKuJwWYB2XTP94SOF5gU9CDA3N/usKtZ4dYCnsgmNQNoSlRrBXa0CZhdF4MhH9o9utE4Ja2REBD0GxIoXnIjZ5tCNLn6CSYVYNoP7INR73k5RDd+BmsH9xS9ca89I3MlBkMSqdKCQC3eeo9qMKrthu/13HPCFAakTCIZCBitiK2diKdKZXIuqadJ2CvzYcphYa7IE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5655.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(396003)(376002)(346002)(366004)(136003)(451199018)(9686003)(33656002)(54906003)(110136005)(316002)(5660300002)(55016003)(966005)(478600001)(86362001)(7696005)(8936002)(2906002)(71200400001)(52536014)(66556008)(66476007)(64756008)(76116006)(8676002)(66446008)(41300700001)(4326008)(122000001)(26005)(82960400001)(66946007)(38100700002)(7416002)(186003)(6506007)(83380400001)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Htm2whX+6DkKwx6gzEUEhXsgxlNoi/kzlwxb1YLieFIwcgnZbpM8QiwpFOMT?=
 =?us-ascii?Q?5RkPn1jwSi66Q+EViJQ2r2wUXVDzfvvzrbL4+DlUCLXj6vVvbOxDemw5dCDx?=
 =?us-ascii?Q?aD77IJoiseEl0yRnCiCRhySPOkDFkIs7agLSMPkTBE2ZS5HmzXvhM23FvK3W?=
 =?us-ascii?Q?+CrXpzb1ATXTpiprBZ20iPcol6Hf2njVZ/erjLbywmM2Kd2fMZ2ouADSKxpv?=
 =?us-ascii?Q?w8Ex2YuCvI28eDQdXb8MlP5yE8fRZrdIQAIxjGe9Kl/YXy73kImrVq7HSjyu?=
 =?us-ascii?Q?T/pdqyg3JhjtLC5alGG5vjb53OR+PF6I2jGbP6ZNEIv2dhuTd8FPMpRQ/PEM?=
 =?us-ascii?Q?ll366fWfOPjxZcuW5kLQXX+2GC1ejHw9UT7Nm485kNRwOdDDiQfglCOoDGwf?=
 =?us-ascii?Q?9tXcxEMKQ82ts67VbYpbPPaoJm7wxo2mdU1rUBloWl3rlsEw5mu9EAQqp0aQ?=
 =?us-ascii?Q?WojzvkD8WwcvqTtK4kLnSIb3flwnCCaEt9OqIW+4F0ZvLhBbPNGzLjFG+rV+?=
 =?us-ascii?Q?Kkk0uPwBisDSpRitKlthgP+YC7Tqcidf07q3JvYRq4ftyPFOIlOOSnR3rZX6?=
 =?us-ascii?Q?1BsuGFbFL3u2MH0/8FyxZOjvQ6uAwCLP9eI+QFV/KaAv+aW4Mg1X5pksbVrq?=
 =?us-ascii?Q?ULj2s1vY0FGjRFZmlZIUcn+q20ffrI84Bryo47AU9x+gc1qWf2zzhVSd5k70?=
 =?us-ascii?Q?YhSnrkt/W32jHodUSzjPjTZ6dT5M6hQePUsMGSTRoMCxl+kSKqkxyYUw/JEI?=
 =?us-ascii?Q?N54Rge4qDO2eNXlMozh9Jb9os1Bk/jyl6YYPn2vUTFElZxcUUfB0YnWso8qN?=
 =?us-ascii?Q?Uq1bMkm+fXmVlLkIxdPXo28Qbf2Q59F68kmE5ElUZvyKPQR3t6HW9QtpJgTa?=
 =?us-ascii?Q?OQw6zKg5bOfIU6FFX3ci2v2JOQh1bVmBD6SLyf/zDAViw8DxqwAcMQDdOtS4?=
 =?us-ascii?Q?6gTFdd8XEjjpG77+3HtNyWGiNFSuNgasUrvVbGXDMcWB3tuZs4AZU1zPWtI3?=
 =?us-ascii?Q?TEs6+AGXOnXUH4ukcaQrUMVYQSALwaj6ysDABAg3k0cjYfmrYllLMrkrSQSs?=
 =?us-ascii?Q?A56dlndHdyVbJ3bBl5fw2H8yAoz2yC+MxKTBTzUdAnUZUQqK1PNV6eKxH5Ie?=
 =?us-ascii?Q?qe5aLDHAI/rarguc+lnZ1Hev2CQ6AL+7u3Tzg/4jaf15B6Icl37ODlHpkTFZ?=
 =?us-ascii?Q?u9Qbcsyxa9nVRGhulIPHXoHOx+MullTM62FZR4xyuWeVBus0U5dJjnM7qjGz?=
 =?us-ascii?Q?iVVOgU1adRQmtHBEU8lB7LlykJl/C0tpFDv/nTcWZaO7ZB9mvJxia4ora/uw?=
 =?us-ascii?Q?NO/Y2IQ9WClDf6j2WHNQ7oGxhOLBu/t8CHCUiuQyUJyQjB2QvgDPzmM35Qw0?=
 =?us-ascii?Q?5yj1OEItrvjah52xYvqUHd7rmPO9efMfiebbUxPFuFuqVa5esi6O39mbXDoN?=
 =?us-ascii?Q?28Mf7Azk13KJrPBVKDzskvoA61aHA3zN3nwvbaIyUxgVg3LMTzhwaG5RvO/0?=
 =?us-ascii?Q?/BEUhTt9Y0RV0UcOY1u7tdGj4UgHfaLg1VfIA8NqtYYDvCz3AEikFb+z1eqU?=
 =?us-ascii?Q?806moIuC6ZQoYMVwWeyEqbZLFxAROEQjY4y4+kNz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5655.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6689f864-86d3-47a9-d11d-08db199c9a24
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2023 15:00:59.4116 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DP8PvHUilGuj0bIEbR2UVCQKAdezjkWJ5eu4RHW/44W0HlZM77TI0wBrGqRjdHOJA1xB7ky5Cr/DJmYzWFSv7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6227
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Asahi Lina <lina@asahilina.net>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, Andi Shyti <andi@etezian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,=20
> -----Original Message-----
> From: Nikula, Jani <jani.nikula@intel.com>
> Sent: tiistai 28. helmikuuta 2023 16.40
> To: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>; Dmitry Osipenko
> <dmitry.osipenko@collabora.com>; dri-devel@lists.freedesktop.org; Maarten
> Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripard
> <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>; David
> Airlie <airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>; Javier Marti=
nez
> Canillas <javierm@redhat.com>; Asahi Lina <lina@asahilina.net>; Andi Shyt=
i
> <andi@etezian.org>; Intel GFX <intel-gfx@lists.freedesktop.org>; Tvrtko U=
rsulin
> <tvrtko.ursulin@linux.intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;=
 Joonas
> Lahtinen <joonas.lahtinen@linux.intel.com>; Saarinen, Jani
> <jani.saarinen@intel.com>
> Subject: Re: [PATCH] drm/shmem-helper: Fix compile error
>=20
> On Tue, 28 Feb 2023, Andi Shyti <andi.shyti@linux.intel.com> wrote:
> > Hi,
> >
> >> >> > Commit 67b7836d4458 ("drm/shmem-helper: Switch to reservation
> >> >> > lock") removes the drm_gem_shmem_get_pages_locked() and
> >> >> > drm_gem_shmem_put_pages_locked().
> >> >> >
> >> >> > But then commit ddddedaa0db9 ("drm/shmem-helper: Fix locking for
> >> >> > drm_gem_shmem_get_pages_sgt()") reintroduces it.
> >> >> >
> >> >> > Somehow these two commits got mixed up and produce the following
> >> >> > compile error:
> >> >>
> >> >> The 67b7836d4458 goes after ddddedaa0db9 in misc-next. It was a
> >> >> bad merge conflict resolution in drm-tip that was fixed yesterday,
> >> >> there is no problem in misc-next. Where do you see this error?
> >> >
> >> > yes, indeed! I was indeed surprised to see this mismatch.
> >> >
> >> > I see it in the Intel's drm-tip branch[*]
> >>
> >> To set the record straight, drm-tip isn't Intel's, it's an
> >> integration branch shared by the drm community.
> >
> > yes of course... it's a matter of fast writing :)
> >
> >> Looks like the same bad merge resolution has resurrected itself
> >> somehow, maybe Thomas'
> >>
> >> commit 418ce969b4c8533c7c76cc0b7adeb432ccdc137e
> >> Author: Thomas Zimmermann <tzimmermann@suse.de>
> >> Date:   Tue Feb 28 10:03:24 2023 +0100
> >>
> >>     2023y-02m-28d-09h-02m-44s UTC: drm-tip rerere cache update
> >>
> >>     git version 2.39.2
> >>
> >> in drm-rerere brought it back.
> >>
> >> And the build is indeed currently broken.
> >>
> >> Moreover, when the build was fine for a while, apparently the changes
> >> in shmem broke a bunch of machines in Intel CI. And due to this, we
> >> aren't getting any CI results for incoming patches right now.
> >
> > Is there any plans for fixing it?
>=20
> Someone(tm) needs to step up and do it. Personally, I'm clueless.
>=20
> The whole thing is made worse by the conflict and the various resolutions=
. At this
> time, I'm not certain whether the whole thing was broken to begin with, o=
r if it's
> just the conflict resolution that caused the issues.
>=20
> I'll just note that for future reference, Cc'ing intel-gfx for anything n=
on-trivial
> touching the guts of drm will be useful for running CI on our test farm p=
re-merge.
> Now, we don't know.
Yeah, and sad story can be seen from https://intel-gfx-ci.01.org/tree/drm-t=
ip/index.html? .
All systems now abort on BAT run.=20
Just to pick one: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12789/fi-=
tgl-1115g4/igt@gem_exec_fence@basic-busy@vecs0.html
Please fix asap. Or revert from tree asap.=20

>=20
>=20
> BR,
> Jani.
>=20
>=20
> --
> Jani Nikula, Intel Open Source Graphics Center
