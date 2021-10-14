Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4497442D617
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 11:31:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C1C6EC4C;
	Thu, 14 Oct 2021 09:31:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E32A6EC4C;
 Thu, 14 Oct 2021 09:31:47 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="207755086"
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; d="scan'208";a="207755086"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 02:31:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; d="scan'208";a="461132436"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 14 Oct 2021 02:31:46 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 14 Oct 2021 02:31:43 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 14 Oct 2021 02:31:43 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 14 Oct 2021 02:31:43 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 14 Oct 2021 02:31:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QmK6uR12cEqGT6DWhLwYs55wU6597+Gaso4URCq5UiU6F9FZFL8PsJrgeNQCqsvkZ4hUoB19Eb1/GoHD4ctmELlIcDPlqKFf9A5LkkNdq/THeokrYhipgqWfmbadk4EdYfl++7/4F+DYAR/utFXRE/6Wr/qR9dEM7U6/qiZGEx6/f/cadEUg9zzQrutigrLvoYmee177QrMhyEIgP7WyyhutGbhbt39kbnXa7AYGC/MIKbWXWPa6r2pES4fntOV5m+au/DivS8uMocZwXUeGrj3ouL5Eao/t5bqjy3CRUUDM2uuep3IeFdXikcCVQcXVBgj7QhuyjwfEDoCHTPWz1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ZJqK4HttYw7cU+LaGUzIJzNjP+/4DEhd483cW0Z+IE=;
 b=X/Y2gaXeGLkvDFWGMGUDIBE69v9RJgfnWmitUCpyewX8PB9MUnOwwTJztcSyEEtr6iMeSI2dvneifmFz0WCTAz0XPyLuDqU3iGETSZvuwRAs5qeeIHWqtjKkkyccSQzdB1d61HLQSOL3lyz5qh74TrMZyCUkKpjDgexn3FrPNJFyuPjE6Q/nDqrYDnP3xBV+zP96/Li+pqdM/qC49HZp5swDzbbg9QCR4t0e8p3D+hhkAwymEiRsCu9HdG5EOEPDZSMRkg0Dis5HiAxbzVJ/iAlQXPwSyxJFVvt1zqXHoMVYM0MzlpgSmYUqMO1exPq06VxUq4uiyJW9GdjKxUrEcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZJqK4HttYw7cU+LaGUzIJzNjP+/4DEhd483cW0Z+IE=;
 b=ReCVPi+KYbLmkH8PkKtx7da+B4AKsRvFAT/K9389tkurEfrljJ+6mz+sh69uwiI8OUBuqpFkTBELJ3i3GWojO28ZXgCfVf+horg6vxNqA1HyM1aF/hE2YlUGGVzho8HJtb1mlz8LVKZUctofbmPMYWColWMqlftcIkFPxhUadMU=
Received: from CO6PR11MB5636.namprd11.prod.outlook.com (2603:10b6:5:357::21)
 by CO6PR11MB5588.namprd11.prod.outlook.com (2603:10b6:303:13c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Thu, 14 Oct
 2021 09:31:40 +0000
Received: from CO6PR11MB5636.namprd11.prod.outlook.com
 ([fe80::19b9:4cf9:c746:b937]) by CO6PR11MB5636.namprd11.prod.outlook.com
 ([fe80::19b9:4cf9:c746:b937%3]) with mapi id 15.20.4608.017; Thu, 14 Oct 2021
 09:31:40 +0000
From: "Sarvela, Tomi P" <tomi.p.sarvela@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 "Nikula, Jani" <jani.nikula@intel.com>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Dave
 Airlie" <airlied@redhat.com>
Subject: RE: [PATCH 4/4] drm/i915: Fix oops on platforms w/o hpd support
Thread-Topic: [PATCH 4/4] drm/i915: Fix oops on platforms w/o hpd support
Thread-Index: AQHXwN4ZJR+qwsSV7kWmKYyh0qV5bavSOotA
Date: Thu, 14 Oct 2021 09:31:40 +0000
Message-ID: <CO6PR11MB5636B8A4C7A5E0E632C55A3BDEB89@CO6PR11MB5636.namprd11.prod.outlook.com>
References: <20211014090941.12159-1-ville.syrjala@linux.intel.com>
 <20211014090941.12159-5-ville.syrjala@linux.intel.com>
 <87o87svuao.fsf@intel.com> <YWf4ll+Qr4frshuk@intel.com>
In-Reply-To: <YWf4ll+Qr4frshuk@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 623592b8-a7cd-424a-f24b-08d98ef56d93
x-ms-traffictypediagnostic: CO6PR11MB5588:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO6PR11MB55889B46EF767AE3CFF6E88DDEB89@CO6PR11MB5588.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KxsAen5Lc/w/R1EEYL/a9qfLEVTerTV5DfrXPwWZX1u9DVe/R8AKV1/Ewv4vE71Sxa8CEscH4BNfKdu2XdgZwuhf16i0T8aELkPZcma75y+6nUxmrINASxWD5YW6gTW6ZZrg5QKUNiACBDgVh/no16W0CRtKuXrsMQ+olrcYubM8Ra+qN81K4JKnLINo41mXjh9maYTyJKF0Wx84llOstEXSSQb+jXmHwP7bvjg09tKe+0ZFTJLhjWUzKP/GcjutEgdp1WPeLt+nsXJE2VNAYz+Nu0WSGEZIuSbf6f5EuwH7miW/UNejvNfHJSw1fCYr1k2rUvZn3JHBBzD6BugvKuf03cQYvLnySQd/Q8xNpgPd+opDgW7GfjNnLBE8f+4BnzC6SsLCy23pzngOJWY8gA8gCKzCAFaz4U0ScHUNHwQOynSPMaknBjjM1qzRFOtvNC68ISz7tX/TP4aHYVTdspeVozYxUC2+c/VJ/9so4xpX+k35FsW4s0n7b7DAOymD5t3noXQq5JhZWAs5MILROOL/FhGV8v7xD7Q5Fxy8uhYJ8Bi/PVPi1wBACT0oF43yd/h9CwBnppwvfQsvsINQqlAI9YQ9wO2vP/oWLXnyNdQZsthI0hUED0CIjYYJJWz5krCyUvz7xoYvLY6CWt5PNZkuuuIy5vci+nZA6AT8wDxMH6jbWZeS6BHp6209PYwIxsVwMnFPY2Bl1IdnBj400A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38100700002)(122000001)(4744005)(6506007)(9686003)(55016002)(26005)(38070700005)(508600001)(186003)(71200400001)(7696005)(316002)(66446008)(64756008)(66556008)(66476007)(4326008)(8936002)(8676002)(76116006)(6636002)(110136005)(54906003)(66946007)(86362001)(82960400001)(52536014)(33656002)(2906002)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?tpGdcpsWm06qXTQE0PybgjfkfJKLaUTbuBBmVhfVXjLeN/zPkRmssha0Ws?=
 =?iso-8859-1?Q?Aqd24z1yVf+aEAuY0A1dqdPhXrrshAClgiySQ7J/zDwS8x0iLMu1Wtb4MD?=
 =?iso-8859-1?Q?IC7J9oT2gmf9xjVABq4rrXQ0eLzzQByrEosjJ2+rbXZM7gJnQx/3M+sowz?=
 =?iso-8859-1?Q?6OEiwmIT+P0gfZBoY+6+dQ4Idxj1tpwUW7PETBTOShLQarg2m+bzYngRxu?=
 =?iso-8859-1?Q?jN3eXSfAznZ/bEZbv5alKJVbwfAagHUo21oU3fybsJf77Vk66Ktx477x/s?=
 =?iso-8859-1?Q?8qTMWS9NiFRvat/s2VA/vnid90jqmjWLRgiu5fmGKJE+GXkAUVtLc3YUCJ?=
 =?iso-8859-1?Q?oph06JEYmwtLajBTFN9i3tqxB+ln6WWH4T2rdkXcwR4sJT1uBoBm7w450L?=
 =?iso-8859-1?Q?5GyZFghpWGGqMntAy4aVfanyztMZmk64+dQhsqfek2oDp9oDxJiI7X/O3R?=
 =?iso-8859-1?Q?z1o+SGzCrhMRjw48JFTAlmvcFDnXgAWcGmGcZ6QtEj5vtUnW/8bXGi02mL?=
 =?iso-8859-1?Q?3neVcaD817Iz36HNQEUgZLPMMiCJGXpVlW/TB57MMvUSp/+/gCfzDJDyfl?=
 =?iso-8859-1?Q?BCx1E7U0j8+x1d91ji/7O4sJ3u6I9Fj9ZvcSsDe1QNoC6HPqpvOl9ZQVb7?=
 =?iso-8859-1?Q?Ku40TRK4maeW8p9K5j+DCDqzwCG9mxRB661nhK4Z7jex/uKFPHGbqpO8Tq?=
 =?iso-8859-1?Q?xXVyCG5CH/4NiryjSf45rPWkH4oSxWgxKgKvteBSLvzfIeSumuIfSrmxey?=
 =?iso-8859-1?Q?7crnwUcjpOF1iOrV1P2P1XZ2civTv68xc2jWQIikGRrk/bOqDsLsXIbrru?=
 =?iso-8859-1?Q?hwKGi/tn02BEbAipES4hnLLd/wBSKgyT9UMAZE9yzOHmJcry7pLTWre1xS?=
 =?iso-8859-1?Q?PZ4ZC30YOkmtCOsqZy13ZeJ6+Ib/+gd6XY+re+XhytQ5mO4mnyPIJqboRJ?=
 =?iso-8859-1?Q?hiY4hhuW32qoZy0WUXPtGqp4UPbi+UZPCjcRJ1ijYg+VwM0Z1yLuXBg/6L?=
 =?iso-8859-1?Q?ge1CrAlYF9SwwVlubXGIKK0dJ7UIP0+S694207wH6VS4U8Z3AgboP1ryIL?=
 =?iso-8859-1?Q?/7E9jLdg2IIS70di8W2amYOB5EyaesVywH5KMWwELN2f8i4ITO0l9cAOZm?=
 =?iso-8859-1?Q?nkka9yV3Y6MHiTSinmrAk6FtK1YjWBGfge0gh1FUjk9qnAW2aUCdCNlf9l?=
 =?iso-8859-1?Q?ubUZx3yFWXQoUbdAdBHEwK0hFnjtVpklB1146XIz43wq/mhXEcpObwZknp?=
 =?iso-8859-1?Q?5pHeDd0y1OOGWyzXjUVrp9ELghkSLBHpuVyA514QCXynuEwaLbj9guDZ9z?=
 =?iso-8859-1?Q?OI6UtpQ2c6dmAGuYfryG5FdrcR9wimRvUHha7Kcsf74gVYJviRzvTv/x/e?=
 =?iso-8859-1?Q?5nmkpOVI4+?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 623592b8-a7cd-424a-f24b-08d98ef56d93
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2021 09:31:40.4855 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HhUOQGpMJcFY7hE1U0Q4lmOxPo39jjY7xGvlNtxy2pN0jE/tpKlxM9LfnpcVoqN/3c5R7QFUhwPTsX04jY4nM+wKhjO0SQBwDLe04Pw7Yoc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5588
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

> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> On Thu, Oct 14, 2021 at 12:18:23PM +0300, Jani Nikula wrote:
> > On Thu, 14 Oct 2021, Ville Syrjala <ville.syrjala@linux.intel.com> wrot=
e:
> > > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > >
> > > We don't have hpd support on i8xx/i915 which means
> hotplug_funcs=3D=3DNULL.
> > > Let's not oops when loading the driver on one those machines.
> >
> > D'oh!
> >
> > Lemme guess, CI just casually dropped the machines from the results
> > because they didn't boot?
>=20
> Dunno where the gdg has gone actually. Tomi?

Both GDGs are dead to old age (PSU / power delivery).

Tomi
