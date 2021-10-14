Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B3E42D650
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 11:42:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D28E6E154;
	Thu, 14 Oct 2021 09:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F6246E152;
 Thu, 14 Oct 2021 09:42:38 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="214805192"
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; d="scan'208";a="214805192"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 02:42:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; d="scan'208";a="481195063"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga007.jf.intel.com with ESMTP; 14 Oct 2021 02:42:37 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 14 Oct 2021 02:42:37 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 14 Oct 2021 02:42:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 14 Oct 2021 02:42:37 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 14 Oct 2021 02:42:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nCoPMhj1VE5c95+MJ573sQ8InMjyptMuOa2vuoV92Ry6CmoXdG1YmoT2zjepQddDWwgeX4XT33yeKpXE8+5Wg8t5avybLLOizHSCrSjQAWVlNSIZ2YU0nwGHkG5IHN0EhD4+rY7X4hAs5388xJb3CAEulzA/1kP8Mud3nGkIEdY5fLZo3GbYHXknbetFSDQsYKZ8qTu8yqh2321MLZl3uVrTrvUC7N5ibx18VffDzGYJBBCTKrIXIl3yTt/U2hWpgm+S4qL0Hf0q6t9lB2Q+W94ZPa7V3lgSt+8YT+Nedc8hxsdfpIDGvUGqqJuvVUeVFXu0KImQqiDVcF6JA6sZJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ft3kSMYVDFZMXqh2gwEkhTOg1t9g2GRUP/I94sFfeWI=;
 b=Sdq7V3clAQGH3ZjQ2kQj1czVkR4CyLg/qrByM04F+gORdRHScvw1oNNHf2z+zTgwPux/54SdwrpDW9UNBn7ziRR2cedBoPGluLIGnxPNM6/ySC/yOiYMUX9AkSlCPkfcSr5oj5WPBHrTJgj9lxtxQSVPYmpu1FdYPoFjtD0riAvrvYPryPZ5I8WvS+qFTM/lalkcjkSTfLY98F9cUoWfBpqag2ZRPb4g14XkPJFBjSuYuo46Ejt6piVdnm2Pi+YtfpltePj23Tu4MgUUcUkDKK2SvFqIGM06kCgbqhCFfMCn8AKciQLvpHF6ovUDMhc0DpgstH1J9FtwuMiE6JdBHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ft3kSMYVDFZMXqh2gwEkhTOg1t9g2GRUP/I94sFfeWI=;
 b=hXSTLiYZDpjSNo77IWNYLrE2DxXJm4ECE8sIjcvEDwXQ1GUoMu01Gxd3VOsT8HK6p1joT4o4t8P0lC+meWKdBWCJw1o/BTTj7zB8L5FrjOB5Crp6hTA/TtLDcKMJyQZyAi8A0x2oUs5I5/OYhGhBEa9p9cGvTiTAhk9jNAXE3RE=
Received: from CO6PR11MB5636.namprd11.prod.outlook.com (2603:10b6:5:357::21)
 by CO6PR11MB5649.namprd11.prod.outlook.com (2603:10b6:5:35b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Thu, 14 Oct
 2021 09:42:34 +0000
Received: from CO6PR11MB5636.namprd11.prod.outlook.com
 ([fe80::19b9:4cf9:c746:b937]) by CO6PR11MB5636.namprd11.prod.outlook.com
 ([fe80::19b9:4cf9:c746:b937%3]) with mapi id 15.20.4608.017; Thu, 14 Oct 2021
 09:42:34 +0000
From: "Sarvela, Tomi P" <tomi.p.sarvela@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>
Subject: RE: [PATCH 4/4] drm/i915: Fix oops on platforms w/o hpd support
Thread-Topic: [PATCH 4/4] drm/i915: Fix oops on platforms w/o hpd support
Thread-Index: AQHXwN4ZJR+qwsSV7kWmKYyh0qV5bavSOotAgAABvICAAABBMA==
Date: Thu, 14 Oct 2021 09:42:33 +0000
Message-ID: <CO6PR11MB5636DD0497B65DF4DA1C66CDDEB89@CO6PR11MB5636.namprd11.prod.outlook.com>
References: <20211014090941.12159-1-ville.syrjala@linux.intel.com>
 <20211014090941.12159-5-ville.syrjala@linux.intel.com>
 <87o87svuao.fsf@intel.com> <YWf4ll+Qr4frshuk@intel.com>
 <CO6PR11MB5636B8A4C7A5E0E632C55A3BDEB89@CO6PR11MB5636.namprd11.prod.outlook.com>
 <YWf6L+XJ0B9BZtCX@intel.com>
In-Reply-To: <YWf6L+XJ0B9BZtCX@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e0a34b2-6b1b-4a58-7b76-08d98ef6f316
x-ms-traffictypediagnostic: CO6PR11MB5649:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO6PR11MB5649CB8D84DCD8882383CB95DEB89@CO6PR11MB5649.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q9vWVCPSalO7EQXnlxK0VVEdkWGwpWLtd5AElIurZvJ7eN2ntfwpByhhLb9YRs9+w5G96Ku1+F0yqpnuzSp6KFidJ6pjOING5bBhP9/fvQ0wUZyjDNvJ9Gtfxa/oRYQdoenbrogM7rmIwQf4MRRrEQcRCS+2YN4tA80E27RncvwLxTWQw9rWrLm4ygGAUgdIUjlvlLVWzQOsdUs7K7o3Z/NcI55MjAjO8bNcZpuyt6FQm4zEmpuUXXhM1kKWpHumndBNO3aexlXs6rBNv1G9SCP7yzekT7WMVaLGFsLkso+ZAe0bXJeYWLcPUNyZxzgUISeahoexGYjsxTR3kOEBdj0MeRaNnQHOJ6jE4zG7u0qCuuiyhJDlXXa6UB+/xbMNCCMdIr9BrqUP1Xy/iBvU0RXMHgT/Cs+lQnqV5X4X62XqpOgC70ryUFfY4Pq0ZQ2aqAf6600H7+nnuG5L0k9QlzXdYKmthdemYQa92D0glk8f8I0sDoWF5pc6Y/5h9i5Qc5SY3VxeEcg3T5AxBIk5+B8kstOTbVrTBwGWu2jsFeUKHL0BalYJD3gzGKgTJH1VNcK5TgdFF8v+Mv7N5mY507uCqiVmJZqN6jHP9bXHJL6C3w5z3wZp5qLV9RDwn7iu3gozhyhDAI8rWeVgKmFFBwQQMax/63rlloUEcZ7B3P60vmrwcdT0LSrc/h9XdjjNTuaOAV5fxoxaJxBuiMURtA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(7696005)(71200400001)(66556008)(38070700005)(76116006)(66446008)(64756008)(66946007)(66476007)(316002)(54906003)(52536014)(8676002)(122000001)(82960400001)(5660300002)(38100700002)(86362001)(9686003)(33656002)(55016002)(2906002)(4326008)(508600001)(26005)(8936002)(6916009)(186003)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?0tqhiDWWc7Iwty359yl+rxiMfbULdQL3cMUUoypw1JQKnvEE3R4mI3t4zr?=
 =?iso-8859-1?Q?Yybkd0YmDjhnAvbREFsityuImVAHYHltm/ApDR6jJiLesZg1HcOqoK8r+P?=
 =?iso-8859-1?Q?U6HYzLDNV/+08YucukUCbK5deNH/2aZHleZRCcSeJHpHXhMXKgsF05fG02?=
 =?iso-8859-1?Q?KzH30WJfVpiim3A3tneX4iWF9z2ElLs6VWH3kv697H5GXqJcDyauSh5Zph?=
 =?iso-8859-1?Q?ju98FeyDN36/hBcSp8t4HM0a9trEsLpFdD9pswEmeNAOmkYgWkUxTqsQaD?=
 =?iso-8859-1?Q?EJ5vRSx/mZmIeMJ7GOgI8sYvf/6csfRIajlVc+YC8LNi0acFgVEShuI7vG?=
 =?iso-8859-1?Q?6Fb/S/7U/7Y01reZ/Z0dXVzg7oApTUlPsvA8Fr0/m03itsRvM5FM3hmmY3?=
 =?iso-8859-1?Q?54fQtw8bsNPP1mSDL3deDfjZpZUHqUvmU8KaErLZ6gTTYGzIQLosRu65H4?=
 =?iso-8859-1?Q?HjtDWU4ZukLdJqWA8ZqTPg+7nbx+596exQpXKA/0DuxMm5IGnRYRsoJvnj?=
 =?iso-8859-1?Q?GV9HwZEw/ytftyOS+uelGm+9eHg0qlv+0pHDFNB2YK08liY9TzMpUFayiq?=
 =?iso-8859-1?Q?D/Ognd1ezZDYPpDrUt19myBXiZbTUUIEw1nYo/AhkryvGEC00sjwzH/O8U?=
 =?iso-8859-1?Q?BJxQ9CNlbo7GzekgeC3rwUf17frndgCQtQpFI5xIXmnOkHJGsPk6DtBQLC?=
 =?iso-8859-1?Q?OKP9Jm6Qc7h/w+fqWlVXQ2s/S/YSja/7rDiuTjnj9n/89ccoP4SXjYtAWq?=
 =?iso-8859-1?Q?aJyyrvkDEDfEU2960V32VQQKRpsyItVNWaBj8FNmY4M7MT5sAhuZE90F8Q?=
 =?iso-8859-1?Q?vLrCYubRqu8+AvQEOqtfCvhOWpHqE/7Uje2btU+p5lsbofLDnyZSXdC6BX?=
 =?iso-8859-1?Q?JQSk+jxCZEBmP5GVrkviwIODTwOboOX4xyO7Y2hrgsu4w4AkefpiddBVnd?=
 =?iso-8859-1?Q?qkrslITQbyb9KvlGqSlCUozYlJBIoxRx7fQdcy7VsZr/6L78GnRW/axvHE?=
 =?iso-8859-1?Q?j7QDNbMQpc5j1iFgBzlK8zwfe60BGi+ofl0hc/0v56XSlY5oOtNrm9d8VY?=
 =?iso-8859-1?Q?nNOXRc+PhAU2y4Mu5sMxWLu1vKQ2z1MmU/aeqUwtAxQUs2Dp0gbf2RQbHc?=
 =?iso-8859-1?Q?He6ttB5tHgP+ZX+MLi1jetAmg0MGO9Ff4ZscnGs1gxQljWM2lt7krkWOv9?=
 =?iso-8859-1?Q?BRdSMg2n8OvNu7Nu2Sd+AvUIU352gG5Z7EKNpgxrfkmWp5+CHq19RVO8gd?=
 =?iso-8859-1?Q?q6n+XEV+9NkYBPy/741XLd6Zkg0dWySiTfBi1qX0ZUxekPi4Dckbg/SUac?=
 =?iso-8859-1?Q?0aijvZyBCpdvTX1zjqkH/VcPJLuBWmspZgcro3PspmCgi570AI7kRKimO1?=
 =?iso-8859-1?Q?R4trsBELdZ?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e0a34b2-6b1b-4a58-7b76-08d98ef6f316
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2021 09:42:33.9508 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /7s2fL/qJ0w16itLsxieFeHUYdQTUQbONAwLS9ugbLUMreBXGHFhiXl7k59Mvz0hsTPlEUhqzmr1rDrRcEPoXlaqmaBjqn1YOgvOJAi4sKI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5649
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
> On Thu, Oct 14, 2021 at 09:31:40AM +0000, Sarvela, Tomi P wrote:
> > > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > On Thu, Oct 14, 2021 at 12:18:23PM +0300, Jani Nikula wrote:
> > > > On Thu, 14 Oct 2021, Ville Syrjala <ville.syrjala@linux.intel.com> =
wrote:
> > > > > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > > >
> > > > > We don't have hpd support on i8xx/i915 which means
> > > hotplug_funcs=3D=3DNULL.
> > > > > Let's not oops when loading the driver on one those machines.
> > > >
> > > > D'oh!
> > > >
> > > > Lemme guess, CI just casually dropped the machines from the results
> > > > because they didn't boot?
> > >
> > > Dunno where the gdg has gone actually. Tomi?
> >
> > Both GDGs are dead to old age (PSU / power delivery).
>=20
> We don't have spare PSUs to throw at them? Or are the boards also
> semi-dead due to rotted caps etc.?

It could be MB caps, PSU caps, or PSU anything else. Nothing comes on
when power is turned on, no fans, no leds, nothing. Same issue on both
hosts. No surprises there, they're identical models. It could be CPU,
but IIRC I already tried changing that.

The PSU part is vendor-specific. Standard PSU maybe could be retrofitted,
but that'd need some dedicated time.

Tomi
