Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 337D98A65FB
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 10:22:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D2910F380;
	Tue, 16 Apr 2024 08:22:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fzKoi6lJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D978E10F380;
 Tue, 16 Apr 2024 08:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713255745; x=1744791745;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=r6xz6fNVXIoFeqjt+AECGXd4rtM59NqpwCBVBVVdr6M=;
 b=fzKoi6lJXb9ISvOs2i2sevtnLD6wvLvxsDYKRS1umcU2geFPfiZpgg7c
 oEfE/VFMLC+3W+a359YTwE4f1xTSqyirWKabmpOMyqkDor908ymzZpZwm
 ryh0XMWiH3OlRC9FWNPHRG4zHAFPLUi5YZSSVVC/SPOV8iQtswSrHBQxu
 3ck8KnMP91b3EXc043sq77U/Vv8QKLZaNbJ02UN6bVSO8M2zz7g6YS7sh
 1zpso5ln7RwKZPiwXUPA9FMs1t7brTJcHG3EUHYYbXWEK2FRl/hn5jxQE
 +v+e+ss3gZ3tu+3avPi5WsyNAZBB23OyPNbZv5vyRd1k6/NfUyjko+obY g==;
X-CSE-ConnectionGUID: UjYuzi6wT3mwmsG335AJaA==
X-CSE-MsgGUID: m9Wa/qCWStmYJrcfBCzMgA==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8542293"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="8542293"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 01:22:25 -0700
X-CSE-ConnectionGUID: 1paPC/JHTqioOHbJO7l26Q==
X-CSE-MsgGUID: Ealjt23MSlqZ8AtRWBsspw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; d="scan'208";a="22254761"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 01:22:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 01:22:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 01:22:24 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 01:22:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jZ+1g8i5ukdezP01GjF3YMiDVzOuo7x1y072ZLQ4PbLUXbiR3ot+faqqQNjAGnRI2fhRTBxk4GjrpCJl2UXfq2IPBmsUGATas8gqtKF3IFKlsC3GU2VDujqn4geeK0MUgR0/fn/4GdbKme7lmYXxmHTvkxBcfMC4onyK63h2BRyWPAkqLSDK69lSu1wE0pzE1M48jxK2dCUq31g54rS+hNhyuxSQDV/6nxE74iWbT6wgboaZ9vExfw8oVqZVvwcUZF7FDhn7GYx+4wPt2Mdsy3JBnpHuZjZK+xWSgfFgYYp0mots1kBBq6opMB/MsDLQJ1sHSfa4gKhMWbAIGdRJUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qkVIulvQJ5hd0eygNsGLnmUkhYbT5KTkaDbrqcizh74=;
 b=hxJ1qye0FdhRgwtWUi0uUxia1aMLGH9ULArTcLeJT6UoDZo5ci4aNSM1fA3IaK7beQfFbnPeynFsOTgR1bcvbwRvUM/0j/zmUF8UJd+tE0vGiUmlxxMsVlb5mnxKTdjTC5CqliHR89ae1o1+rS7bJ/b+AG9xvS3xtBpmSh2DRztVYXnEQhEi7yBxUnGKInz/fU6mhg9DmYDZ65Ju/BJAEPziKS3wbAN0IIGgc1rCzMMriFWHXRmVVaBAb1Pql/Uuy2+aCZKSkbssIK3YentA8PPYB+W0L8Cyh5bWAun9BpYUsrhebDUBoSWCxESt1UrEnnyil+KMV4WCQ4AvEXIQag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB5981.namprd11.prod.outlook.com (2603:10b6:510:1e0::15)
 by CO1PR11MB4964.namprd11.prod.outlook.com (2603:10b6:303:9e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.27; Tue, 16 Apr
 2024 08:22:23 +0000
Received: from PH7PR11MB5981.namprd11.prod.outlook.com
 ([fe80::8970:61a2:f00d:b23f]) by PH7PR11MB5981.namprd11.prod.outlook.com
 ([fe80::8970:61a2:f00d:b23f%4]) with mapi id 15.20.7472.025; Tue, 16 Apr 2024
 08:22:23 +0000
From: "Manna, Animesh" <animesh.manna@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Hogander, Jouni" <jouni.hogander@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH v2 2/6] drm/i915/alpm: Move alpm related code to a new file
Thread-Topic: [PATCH v2 2/6] drm/i915/alpm: Move alpm related code to a new
 file
Thread-Index: AQHajPOnrQQzsz2B00KJ8nTR0eIfYrFpOz2AgAFZAjA=
Date: Tue, 16 Apr 2024 08:22:22 +0000
Message-ID: <PH7PR11MB5981AF35CE9396E847FDE2DCF9082@PH7PR11MB5981.namprd11.prod.outlook.com>
References: <20240412155243.2891996-1-animesh.manna@intel.com>
 <20240412155243.2891996-3-animesh.manna@intel.com> <871q764zmq.fsf@intel.com>
In-Reply-To: <871q764zmq.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5981:EE_|CO1PR11MB4964:EE_
x-ms-office365-filtering-correlation-id: bec125b0-d67b-479e-5b70-08dc5dee5766
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uYB4FGSnrLK03ZeQfERsZtqzJcHUTnsfH2oYRWBZkSPNt70uucxxxRGHQVODl+gBH/wbNIye5w7C/mI+GNb2w9kc9xz1PWU2ksE13N8O99IiOXhApzo/TPLXEU7jB4U8q1NPry7YhLN3Y+IteFb75jvjfwx3Hr3mj9jEvnhDT/O//vlLC2AUMw/kZqTZ1CszwiKTPTom4z52Bx5N3kDPJG2VjX2xR4I/8hK4Ay+vhjVchA3YpgoTwLDSAlZSk6UupjKvBNWJzzcsBSyfGP1OXjM5ATifjR0KhCgUBANVkqXG+PhURUXHokeQaf87/ygKGSnchr1nPivfoaUlI1Dr9Rk80k4FKK7/35BuBl7Gff8jhPgIxNAPpyMrGzvOBm96e4oxd4YsaP6avyt8wSI8ruTUqFM14yRG2sZPtx2NZQXzZsFOn2GuFXBBG6vScG6cYMqS0Q81qXHlDDmmDZhkV3/6F6WAZfxJ49QYSY+BVhhNV72VUgBm7eEpn6+0LDJ11s5QBfsqWa8hIaO0cF7lXBKiGEduQTkqUEmRTtr8GGkIrz7hpi8mI/N/308oGPROi7PEtKsTqfXYnscn0BS+OR1TJsXRWqynpW+kyqSgkVnVJj+/C9VfS+uSRCKu3ydUsCbEVXjYMVEoTcF6MKY8nv+yq7+nnMpqUBygpQqBqVxaAtmQcOXvFP4g75Wug+G6IWMZr7Amdkig+hCXzDIil7KEkqTgftijbSYUti/VWRk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB5981.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rPTsXbRmt9lyBXDMa1WaZ8i5DAPZfBbs3jkw5ilDVO3FY8Mgq+1GZMok2CN8?=
 =?us-ascii?Q?mMAUahzmdU6BejEjME5dV+ZuJj41iHQED5H1hrGCS6e9tG8poPWmfmxGea+J?=
 =?us-ascii?Q?Bjfap7G/BcZLHlnedzhIIXXhEuK0T4iSbjFS/te2qgP9VhMFrxW52c/ZfSxJ?=
 =?us-ascii?Q?DT9Bj1J0HHrrNMrhStpVgFee2UbQ1OsyQ3oDuQBAEOuYKCzKZ4WWn4iElBB9?=
 =?us-ascii?Q?oNMDfySGigXp2rs7UcLvtnwgTsGdq1MnCGo9nRYlh1gIJHGH2EfVHt7FtGdu?=
 =?us-ascii?Q?1E7IJa2/DLwexhFSFMQUQ2LQLaRFMQTvur2JS3PEhd/laKJmPforsEBp3n6B?=
 =?us-ascii?Q?/1/S/JMjt3yPct2dKKubxgyib+gF6+r46CP4scV+VIqx0WAbOw529GDyqj8O?=
 =?us-ascii?Q?LizODt4/pnjprLjNzDKVYJJBcQVAcS62xNw5qkmsUvt2v63v3jZdH/8nKIVr?=
 =?us-ascii?Q?pcHrp40qXttLCZ0zNEguRB3WxJF+njtJpuDYNKCYwTgGmVKYNmesKzfEa9qZ?=
 =?us-ascii?Q?inHk3klUqgCA3x/B6eE/0P+RIEA6RTcVZosXY1d5oMxJOhx1H5SZFFkrxJXv?=
 =?us-ascii?Q?x3G633i4rDiLlvaycqe/Fr2KMyUnGC9undVgHFwysqoQ2sjWaPU0KDm5D4XN?=
 =?us-ascii?Q?L/4Ay5SurnrHcU9pOiS1w9qJZBnIwLDj+AF5UfGpoG5a4eHNUkBF8sdu11jn?=
 =?us-ascii?Q?KZwb3P8pptBM3HVnPWjohVdWjYTZDVOLQznMjBj4PQkVEplWR26xZUD2ahOu?=
 =?us-ascii?Q?F9zMHs2vmtbznDMsumXevDjZ/b8Ewo624K92OPp9Fm4E3yxXG2zXkvTIo1av?=
 =?us-ascii?Q?+G8VT+MNqnTk0qiPMMSpJFBUW2wQBUCDusL6/1zFuOPGenPVp2nc3Ov1dmMz?=
 =?us-ascii?Q?6aXSnG1ZFwo1Rmq71g+Sdc8pY1S5PWfcebBu+o3FVKXOqIjcY9rLBl0rQD/s?=
 =?us-ascii?Q?bQVD5r8mc25U/MtGGZ1r3oSNYsvTRQ9nI1XXEXyAh3RRliypQT6RYhu2Rz97?=
 =?us-ascii?Q?qfuuYQCZ+x6vcJfOscXomeNeQaY9axK1uBIP/cES7Cy6ZZwYTDo8jriopizZ?=
 =?us-ascii?Q?1y6Iggi16jcqDz2GMrAIzT9mgVzhsRcawYpYanYsAg5koXONi4CbijJQhudf?=
 =?us-ascii?Q?jI65e1QWmIGrBU4eC3LGUuG2EB1rouYXyBvn47assVT8tpasMeIy3e3lst4q?=
 =?us-ascii?Q?gVwUL+0FhauRMLPxEo/QslOmISAo0dZ59p5Ot01QCCfIqaDA1BMH1mgfZyvh?=
 =?us-ascii?Q?Bnw+aoh3MweaWPZ65hm1QCDAk/ZVt9ehWZcmONNW7gAV3M1xaFvYw3wDbjEO?=
 =?us-ascii?Q?K5iiIWpU020gPIuNS192fwEvHWj97nRofvma/+ZG2iUu0FKANbRrI6xc6Gve?=
 =?us-ascii?Q?nxzIgG+HtSteXpp7DtoHI7cYGPiBq6Bvv5SCQ1azMbqJybhpRaRthIdy+XmA?=
 =?us-ascii?Q?0bRB8L3mS/llx/PYF5vYmpIr/jTgUT5ElWv+mjBtTi2bhdE+kzspKRWSz27Z?=
 =?us-ascii?Q?zjsbuIQydW40rYIUUXif0MIK9UoUk5w9UoHG2IWORajKqpjgxBAWgeu0cuQS?=
 =?us-ascii?Q?3lbzwGQgFWi/zSb8sI0F/uw7SJkqbFxNw6JCQ/eA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5981.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bec125b0-d67b-479e-5b70-08dc5dee5766
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2024 08:22:22.9161 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m6kuTK85XOkYSh4i9AGGnIPpZFhihchPB0zd8/WHPtFhtuoWiwOzdZahONxaRNznxc5X7a57GslJ5874Gl14PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4964
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
> From: Nikula, Jani <jani.nikula@intel.com>
> Sent: Monday, April 15, 2024 5:17 PM
> To: Manna, Animesh <animesh.manna@intel.com>; intel-
> gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org; Hogander, Jouni
> <jouni.hogander@intel.com>; Murthy, Arun R <arun.r.murthy@intel.com>;
> Manna, Animesh <animesh.manna@intel.com>
> Subject: Re: [PATCH v2 2/6] drm/i915/alpm: Move alpm related code to a
> new file
>=20
> On Fri, 12 Apr 2024, Animesh Manna <animesh.manna@intel.com> wrote:
> > Move ALPM feature related code as it will be used for non-psr panel
> > also thorugh LOBF feature.
> >
> > Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> > ---
> >  drivers/gpu/drm/i915/Makefile             |   1 +
> >  drivers/gpu/drm/i915/display/intel_alpm.c | 292
> > ++++++++++++++++++++++  drivers/gpu/drm/i915/display/intel_alpm.h |
> > 18 ++  drivers/gpu/drm/i915/display/intel_psr.c  | 280
> > +--------------------
> >  4 files changed, 314 insertions(+), 277 deletions(-)  create mode
> > 100644 drivers/gpu/drm/i915/display/intel_alpm.c
> >  create mode 100644 drivers/gpu/drm/i915/display/intel_alpm.h
> >
> > diff --git a/drivers/gpu/drm/i915/Makefile
> > b/drivers/gpu/drm/i915/Makefile index af9e871daf1d..c12b7bd98320
> > 100644
> > --- a/drivers/gpu/drm/i915/Makefile
> > +++ b/drivers/gpu/drm/i915/Makefile
> > @@ -246,6 +246,7 @@ i915-y +=3D \
> >  	display/intel_atomic.o \
> >  	display/intel_atomic_plane.o \
> >  	display/intel_audio.o \
> > +	display/intel_alpm.o \
> >  	display/intel_bios.o \
> >  	display/intel_bw.o \
> >  	display/intel_cdclk.o \
>=20
> That's not sorted.

Agree. Will take care in next version.

Regards,
Animesh

>=20
> BR,
> Jani.
>=20
>=20
> --
> Jani Nikula, Intel
