Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB997AF06C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 18:15:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C0110E3FB;
	Tue, 26 Sep 2023 16:15:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805F510E012;
 Tue, 26 Sep 2023 16:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695744902; x=1727280902;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/Ln4pDTvJvTFcsmOIKiABpefK40qUGsN6i0HTIY+dfA=;
 b=Zho6kl6/Vqoj6FqVNZfVryup6TpJ2YC9Izuhj4MYjRnwXoTVYWcqj+W1
 gHZjQ8nDB6gvKybN/fgqVgcuoxw+jySTnJo9uY+XNKjQypTrxzT7F6GvY
 T/AHRBiiWoR9OVk1kBD0pXwaDfISkYBrAjvQDXUopkMzFBx8FaUEh1Q+4
 ZqOCudzxLVOMbrV6cqV7ojRFg0brkECkrukv/XXTO2IpUt/tAY/ZomPqE
 +iU/on/LJdA/qMaOvqhGXE8PRpyXHV17jKNi6MlHrcRjuMsq1s2HhK4o1
 xh4POwM+5Ui5EHlLxajn6LkSjUaF19Lquhux7gtPJlbk6F2n/vXShTnWA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="448098682"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="448098682"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 09:14:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="922482629"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="922482629"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 09:14:21 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 09:14:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 09:14:22 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 09:14:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZNXkhSBV9By43PKB7+klz2jO55AG3+5kLYXEp6Sbr7KoDQDxn/h36uW0V3xw6eJrd6lP19YwCdwgXepOv5jpvh5NVZCtKd42eGDfignibZ5lMnCAVP6+gGdmrbPPZhrfCXj6949dXJqniu81+6Zrk200MsUyjlUseEodqO2qRRSJ1Cha4TQXP5cHTxPk6dxaSxDuzrhnfRVw4YnXLFIptpgj1s4FzyRUpYuJOIFipVC4CpU72cWB2oGRBwS1Qmz8sP8dK2iGVJPcOk6o+gIC7s4f3nz8RWf5otAZD4Cq119bnphx30FoYSDLLV6Pips20DbLDnrnouHDu5OW6YoD2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aD0QOfkR722VE+x/Ub69YiEo7O3/90L9558uJ6t2tvk=;
 b=K+Ko7AktDm3wAgGnj6IiYc45E3gK2QnrU95t5ehSZK7utwoG3sfE/qjAcp3/F5HtcM0xqsPWGsN0jsCmzUAKmcipEQ1AqSaYiT8uNlcw2Wi+cWFeBhy5j2yL40ClffC/MX6x4FWJzAA3liutbkHHc9K4/zCJjSSZJWaIqCYmXQkXlTDlq/SLZp1slBZD+0banVjodihF9j68qbwT70UcTVmBMkPZUOhm/M9OO/hHe7qhOd1B041lUQN6CaXMvvG090izA9MyExP43p8q2cAYKdT8Q+ljQQrvzoNc+F1M7B/84Ae+DVmuC4FSLGsY2NDKfav0ygtfRb2/leIcyWU9nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 by IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.41; Tue, 26 Sep
 2023 16:14:19 +0000
Received: from IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::4426:1551:a299:9a85]) by IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::4426:1551:a299:9a85%7]) with mapi id 15.20.6813.017; Tue, 26 Sep 2023
 16:14:19 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 4/6] drm/edid: use a temp variable for sads to drop one
 level of dereferences
Thread-Topic: [PATCH 4/6] drm/edid: use a temp variable for sads to drop one
 level of dereferences
Thread-Index: AQHZ4W2+XAvZx4OCDk2fma/k2hmYVrAr6+UQgADrx4CAAHI3UA==
Date: Tue, 26 Sep 2023 16:14:19 +0000
Message-ID: <IA1PR11MB6348BE0D88C6039837423404B2C3A@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <cover.1694078430.git.jani.nikula@intel.com>
 <6692fbce07fbc03ad8785e6e6fe81fad4354e657.1694078430.git.jani.nikula@intel.com>
 <IA1PR11MB63480D7CC408A0340BB2C777B2FCA@IA1PR11MB6348.namprd11.prod.outlook.com>
 <871qelml9k.fsf@intel.com>
In-Reply-To: <871qelml9k.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6348:EE_|IA1PR11MB6098:EE_
x-ms-office365-filtering-correlation-id: d5638197-c046-4059-c912-08dbbeaba364
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s/lJDXtUY631kvn3E4Vp/6WWawU+6BMoIDw3nq2MDP8aJk351aK/GPbS47yVvV3ZHmQKLQ1S78ZzfC14R/+T79X/DLrmFP7xi6L5dyBDf5R+a874THCnr/LvQvaSSsKrT8WNgFHwU/vRUfuz5rn3dkhF9TeYdjNMHEowRyyvuWi+jBg8563WvopbxiU7Gpze5tskqsMhOSTmHbmnudciFfRr2GMFgAr4KJ0TRDTVKuu0zncF6bF8zhGBhMHn6XJkzieRZyHpkjdwHCEeqtbla+sjgXvkYTQRWwszbkBnkUKIgJ3lvRS79xhgpuzLmNGgrbQ/jRqhe1ZR+x/3QtxIvA6c17PimbIGCjvvBLw66WOzWhiwFag2JOUhizc+9GpPrdUR6fFCSgdeM+SFu6N5o2TU4g/lY0qVJvQ+vRvjlk1CUtGPAdM5Bn8awhcQN+oizQJYN3w0PA5+BFBiqtW+SDAjoafcgqKeeXYe3ViiiJsrCrUw+CWrdnOaydK3RNI+x5Ds9yA9Vt8PV1EZZETOeXVI1w/GWpThstpYUwU/1T6fpgnfa8j1Ca6Fz6Dymsvk8Es1iQMAj1jaYczyEJsgjMA1grQL2QkJnYrflj5tuWX5GzNOAbkFc2aCMP1FthUc
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6348.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(39860400002)(136003)(396003)(230922051799003)(186009)(1800799009)(451199024)(55016003)(83380400001)(82960400001)(2906002)(38100700002)(122000001)(38070700005)(55236004)(66446008)(66556008)(64756008)(71200400001)(9686003)(7696005)(53546011)(66476007)(6506007)(41300700001)(110136005)(76116006)(316002)(478600001)(52536014)(450100002)(26005)(33656002)(86362001)(5660300002)(8936002)(66946007)(4326008)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bPtlDzGx0vfam9rDVGrXeth3JDwgrRTRLshOf3p/KDeUPQ14vTgj7A5MF8K4?=
 =?us-ascii?Q?Pg8xzcxb88tPUy1hUnhALhDnExXJysEN1O7yRMqbQusOiUHk2HtgeV46TMzk?=
 =?us-ascii?Q?aOQRpkOq+oxSYfwI63gCK8RQNWZEal3xlXizhNHalVVG7w9l4RldQ4JCxC2i?=
 =?us-ascii?Q?UY70vOyNQFXGBEdMOKdVlCwD8434/r95xWoK0rTieCnFTPnSNXCOKG3D96fD?=
 =?us-ascii?Q?0vP18hHevg872KkOCZBEAOf443sjqgMNzQwB23j9g9Xs0eYAZL/FXAI9Ztn8?=
 =?us-ascii?Q?Vsa1qaUCYJ0udGTZhjm8yWOFnFmKcecN9jtC5vgF7KaJUUDz19FxIeJsTSDO?=
 =?us-ascii?Q?lYVcWXPH3cYdd9TZQ5SOKfprp+rfGbc3oZ/EyGphS5aCz/cZcYLYLGSwYJeN?=
 =?us-ascii?Q?uT3Iblc9oYlesMXvWCzBzwf6C1BrCfyWPm4aHACwBe1gobIV+aR/GOUHV51j?=
 =?us-ascii?Q?GkSiKHtbrKCbkCRqetjaWnuJuKTbPIpTPXqdQ9PuIDeQkZkYSrbb3ix6AHyk?=
 =?us-ascii?Q?KkymMJaRhxqzkHphMl7GrvrzL9nenRybc1YZH2FEyIXcRM/WWGoNPG9CChAH?=
 =?us-ascii?Q?jDwv7F0OkkisEp+SrwES1TKWQMFQnR/wCx/C7tfkmwuswKrEXWCihRiLUAC4?=
 =?us-ascii?Q?8WgXdeUrqLN4te3yYVIUc7FDpNyzKBoGBwB5D8tnaI8zWpy5NGynd2HrOZiS?=
 =?us-ascii?Q?SB+qc1X/yAcym1ZHW0i0EC/7unyajGGAJUr9x4+6CGPUr7O8157PVbqUluXn?=
 =?us-ascii?Q?5sg8ofYD7+VnDO/9VqamaIOV1fpwFik0x6YkFJM7r6AjmHb+mqzVm4G3co1c?=
 =?us-ascii?Q?lJ2/xKtOWwDc4Odxrw7FnkWhxhUGP6n6dhdV2CC/njRVyfEPSd/XiTOCqH41?=
 =?us-ascii?Q?ChMwBHzuFDxvwF3c72801Z+pPlULOO3xmVGQG7xtZ3o2/zYDAe+7vcAECRfU?=
 =?us-ascii?Q?wJMNYRYILGtgAsgLytkDAtPXQPc4JkF+9K85h5jC+4+FESSHbdSwKJHGBk0m?=
 =?us-ascii?Q?TEWURZoz6+w27T/JTT/d9RR9299hKziu9OoIB3ssYp2r067swb2Q41fp2qPF?=
 =?us-ascii?Q?v8BvGij45itA3/XMFEAca+9yw9T+DkRUDzudSPTngRiJwAwGQj3/umRyKSVx?=
 =?us-ascii?Q?cEIv1Mslznt/4Yx4RoQafmwaXwuhHaJok2S5BIu1v+U1Y3T6FoX4LizJKOtj?=
 =?us-ascii?Q?OY9WRTvc3P7ywak2dZvfng/Vr/gqPbNtGmSisPXc+ZyJkcjVW9S5ltiCh49P?=
 =?us-ascii?Q?35YXPUOPE0klplLyRub1uuj6IeAuTvhDfHZb+Rm0T8oSOqED+EUayI5rZN22?=
 =?us-ascii?Q?RTD12jUMRffThXWt6VQoSAPx8vdo1I1Y5JKnmFR2DZgVT/s4A+I7Vs1MkHUa?=
 =?us-ascii?Q?W/OnlgUBhbE/5R0QEgMaGGSMqmTw9ntEFu+FFh6ONYcNH7HB3yawZA4ayfR3?=
 =?us-ascii?Q?WkakytcaeUMFt4YdLhkVMKS1FjnsSqN/UwBSzE/i6GCbwMQvDZLBHuBYFKcV?=
 =?us-ascii?Q?rfB3s6LgKHVXGMAMMIDTK5j7K3P312WFRCYfdSYJsHZo4sFilunbLz1BvMJu?=
 =?us-ascii?Q?Lrg053ZQ+X+BcOkTHj8hLE8eOEEJ0gGcHPPwkIiO2tJ2iO9m2MHpZpAdVJSt?=
 =?us-ascii?Q?u1hV6lWaQeu8hhb9Kwvr9rQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5638197-c046-4059-c912-08dbbeaba364
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2023 16:14:19.2995 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qi7dKaocd9/O7St7pOIqdLPx/zzlTZ9X8G3EY/voon3D6/uyRNzVm5YS2liaGnWpLuzdppGqPFKvgJFyTgAex/fKPjNwrUSLk/wQU0FJlJy3Od5jQpWRwJEddQ0dP2tV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6098
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Nikula, Jani <jani.nikula@intel.com>
> Sent: 26 September 2023 13:14
> To: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
> dri-devel@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org
> Subject: RE: [PATCH 4/6] drm/edid: use a temp variable for sads to drop o=
ne
> level of dereferences
>=20
> On Mon, 25 Sep 2023, "Golani, Mitulkumar Ajitkumar"
> <mitulkumar.ajitkumar.golani@intel.com> wrote:
> > Hi Jani,
> >
> > added comments in-line.
> >
> >> -----Original Message-----
> >> From: Nikula, Jani <jani.nikula@intel.com>
> >> Sent: Thursday, September 7, 2023 2:58 PM
> >> To: dri-devel@lists.freedesktop.org
> >> Cc: intel-gfx@lists.freedesktop.org; Nikula, Jani
> >> <jani.nikula@intel.com>; Golani, Mitulkumar Ajitkumar
> >> <mitulkumar.ajitkumar.golani@intel.com>
> >> Subject: [PATCH 4/6] drm/edid: use a temp variable for sads to drop
> >> one level of dereferences
> >>
> >> It's arguably easier on the eyes, and drops a set of parenthesis too.
> >
> > Please consider providing a bit more context in the commit message for
> better clarity.
> >
> >>
> >> Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >> ---
> >>  drivers/gpu/drm/drm_edid.c | 16 +++++++++-------
> >>  1 file changed, 9 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> >> index 2025970816c9..fcdc2c314cde 100644
> >> --- a/drivers/gpu/drm/drm_edid.c
> >> +++ b/drivers/gpu/drm/drm_edid.c
> >> @@ -5583,7 +5583,7 @@ static void drm_edid_to_eld(struct
> >> drm_connector *connector,  }
> >>
> >>  static int _drm_edid_to_sad(const struct drm_edid *drm_edid,
> >> -                         struct cea_sad **sads)
> >> +                         struct cea_sad **psads)
> >>  {
> >>       const struct cea_db *db;
> >>       struct cea_db_iter iter;
> >> @@ -5592,19 +5592,21 @@ static int _drm_edid_to_sad(const struct
> >> drm_edid *drm_edid,
> >>       cea_db_iter_edid_begin(drm_edid, &iter);
> >>       cea_db_iter_for_each(db, &iter) {
> >>               if (cea_db_tag(db) =3D=3D CTA_DB_AUDIO) {
> >> +                     struct cea_sad *sads;
> >>                       int j;
> >>
> >>                       count =3D cea_db_payload_len(db) / 3; /* SAD is =
3B */
> >> -                     *sads =3D kcalloc(count, sizeof(**sads), GFP_KER=
NEL);
> >> -                     if (!*sads)
> >> +                     sads =3D kcalloc(count, sizeof(*sads), GFP_KERNE=
L);
> >> +                     *psads =3D sads;
> >> +                     if (!sads)
> >>                               return -ENOMEM;
> >>                       for (j =3D 0; j < count; j++) {
> >>                               const u8 *sad =3D &db->data[j * 3];
> >>
> >> -                             (*sads)[j].format =3D (sad[0] & 0x78) >>=
 3;
> >> -                             (*sads)[j].channels =3D sad[0] & 0x7;
> >> -                             (*sads)[j].freq =3D sad[1] & 0x7F;
> >> -                             (*sads)[j].byte2 =3D sad[2];
> >> +                             sads[j].format =3D (sad[0] & 0x78) >> 3;
> >> +                             sads[j].channels =3D sad[0] & 0x7;
> >> +                             sads[j].freq =3D sad[1] & 0x7F;
> >> +                             sads[j].byte2 =3D sad[2];
> >
> > Thanks for the code update. I noticed the use of magic values in this
> > section, which can make the code less clear and harder to maintain.
> > Would it be possible to define constants or use descriptive names inste=
ad
> of these magic values?
>=20
> Yes, but that would be for a separate patch. The magic values aren't adde=
d
> here.
=20
Sure. Other changes looks good to me.
Reviewed-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
>=20
> BR,
> Jani.
>=20
> >
> > Regards,
> > Mitul
> >>                       }
> >>                       break;
> >>               }
> >> --
> >> 2.39.2
> >
>=20
> --
> Jani Nikula, Intel
