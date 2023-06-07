Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD6D725272
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 05:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C7C10E419;
	Wed,  7 Jun 2023 03:40:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F95110E418;
 Wed,  7 Jun 2023 03:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686109230; x=1717645230;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PQSuegsEp4rSy+fMW/JgT1fdGoBLhu5xKWd3Tj+W6jY=;
 b=AhrSEFWQ8RSttYQww+m9gGg+Yj8/1tXrY7EMt7Qe+/H9p4jPc+GzWQdd
 UUnk7fcSfAjGuEFZqICJpUSkumb4DsLTOddmClfkEoc0gS2VkS8cA2beV
 4f0mMv++47yJbpq/rYMt6mp0QsnxkHKtKBiGQldb/crmByIzK4ODlPtOd
 zClG9Yfk3nqicFC02UdXL3MGGk4Y8ZhC/006GkW4TPSizO8+e4+JwsPIg
 zW7dz7OZlvvY538DGNhePYGDuhIH/97C+EQCyGz4uuy8ZgYjoc9clJx0p
 /+ML3Mh4db0IAV0RagN0AdmZ8v6NmDsp2zJRsDlg2VZj0MnzzA14s/xPj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="337229420"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; d="scan'208";a="337229420"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 20:40:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="739035908"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; d="scan'208";a="739035908"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 06 Jun 2023 20:40:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 20:40:28 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 20:40:28 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 20:40:28 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 20:40:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dWrIJt0ZUdm7jKeR38PKlji57PgVR4V6106Exkt7DmwkoikgrwV6PliZWXOpeOa5vt3u1GbS23CIftEHfeI5QZQQoOF0YXNVlfkJidOetcnpSDCWQslZllUCTWbsv83iUlbnYNa6MVF9okyC+3rG+LmSBurLtyQAZfLC/KF2Gp/oCTeH5oExRoNRQ9pys/JNqmp/WiHt3+Qf2BPDCMYv0WuIekEn9E0JbQq8Jwty8m0Rag1uTompqV7jPEh5K3yC7nL+rZZGeOocEIqVp4U1qEygobqyMWH9TtQINRnRXEpqVRYF5Wb8ZEeaZCzzV9IqYydgTqq76NCBY5pxppN0vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3G2KHqaEfzbYOhYh6D8tRmFdag6hvlpM7t2u0+nUqEg=;
 b=b4WqeHspYtZdGrXVJGj3UHJ0tbSSQ0ly26qKyrvmVooUUGhG0fWZnlamhzHI9yyjZgBP9+Z3vtK1uq5n+/IC48g1OrQ/JYBSILxDqP1fS9G7uAvLa68yZyoJTKkdvYHLm0CjnNWNSFyDXXZXcSNTe2MXaiKkYyNMCIVjYelA6+Nv4+oGXsvG+lXRqe8FiHCwnhF7vWo6EAWm7MEmRi0+ZgY6FWqEmpB+mUdH8JTaTK6motrcJ9LDxbGKYfTzfH9hNWxmv+urIwhX0NmCj1LFHNtfYspizX6+i2euolVl5cclLVzKYstN7GJgWi085qX3t3jxJ0bJX8Fx+DVPRbg2Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5579.namprd11.prod.outlook.com (2603:10b6:510:e6::10)
 by DM4PR11MB6018.namprd11.prod.outlook.com (2603:10b6:8:5e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 03:40:20 +0000
Received: from PH0PR11MB5579.namprd11.prod.outlook.com
 ([fe80::29d:7629:6a6:4775]) by PH0PR11MB5579.namprd11.prod.outlook.com
 ([fe80::29d:7629:6a6:4775%6]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 03:40:20 +0000
From: "Zhang, Carl" <carl.zhang@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: RE: [PATCH v17 1/1] drm/i915: Allow user to set cache at BO creation
Thread-Topic: [PATCH v17 1/1] drm/i915: Allow user to set cache at BO creation
Thread-Index: AQHZmF3TkoTvvrD0YEWND8XQd7MDa699jWQAgAACPgCAAA8TgIAAAMuAgAEO3BA=
Date: Wed, 7 Jun 2023 03:40:20 +0000
Message-ID: <PH0PR11MB5579C119BEF9653A9A20CC4E8753A@PH0PR11MB5579.namprd11.prod.outlook.com>
References: <20230606100042.482345-1-andi.shyti@linux.intel.com>
 <20230606100042.482345-2-andi.shyti@linux.intel.com>
 <ec219702-8608-e919-cbcd-f271646845d1@linux.intel.com>
 <ZH8H3ovN20uVO+tK@ashyti-mobl2.lan>
 <168604992363.24014.14317865195655387952@jlahtine-mobl.ger.corp.intel.com>
 <ZH8VLY8a9d7i96cw@ashyti-mobl2.lan>
In-Reply-To: <ZH8VLY8a9d7i96cw@ashyti-mobl2.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5579:EE_|DM4PR11MB6018:EE_
x-ms-office365-filtering-correlation-id: c9c8505d-688f-4df8-ecb1-08db6708eb04
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g53PFbabejSIVZPxkOaf+mj0dql2loxukr00FY6CjQN0yZ+QBLHkx/2VlUhgjMuO8soj29CM3LrWTqxWPMZz+4XuIcuAxqm0uchjRNlHImUQMoemQLtQFqH3a2k5ZnKgv2XFN7j+pfQ2XBWsuxpCMna+xHiCTPPkiXOfwoe2f6bMyD/niOCd97BQsrac8VK7id42Fz6CkLgF4mzfh6YRM0gUck7aXTTSmwym0/jGzlx10xOH/w9Dqrzr9tmzMNpRuBjPoc09ZjmWtpw0hL9A5QLxAJN9Fmr72dNiBUUgi9rU1wFNxyqrz7sNJq4KRwOuWO4gAwsKIeZJ/9wrt7VU6UxPsd7LafbEdg1s+pqrXNqZQTvwO6WEJOomAE/zr/tWZ0inNHySVjfwP+aSY4ARUsQyYHiq6Zm0Me7B7Iy/uB8c6uF6jWA2B911ao8mHeBIWQ40vP039JttdxkmLyCeKqyxExSvukAFfnSrj564cQPVmCZqsAS5tRXReM23KQEINsvh3vW1NAHdD1+LAPw/DSJ3xWSL+L68MQE/roqJH+HXLQ1mngMJor0VBE8yrdI9p4ok6JKe5UPDdYKf/irhpmJtJv4Te24VhMg3DYDEtRqGIFFhzrM251ZxVnkh27mkv0GYJiv0nn4QIeBPBOTwcw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5579.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(366004)(376002)(396003)(136003)(451199021)(2906002)(83380400001)(33656002)(86362001)(38070700005)(82960400001)(38100700002)(122000001)(55016003)(7696005)(52536014)(41300700001)(5660300002)(316002)(8676002)(8936002)(54906003)(478600001)(966005)(66556008)(66446008)(66946007)(71200400001)(64756008)(76116006)(66476007)(4326008)(9686003)(53546011)(6506007)(110136005)(26005)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bLmO33CAJ6hW+F9LmuNj4/I/dUU4xRXrl48wwkMrf7L8ybsA7LN8d4Sv/Qin?=
 =?us-ascii?Q?/7JF6AdAbudzbKaYI7T8lY6YVpEs9e6j7y6pgrkKNomvsIMG7u92yeRs1t4g?=
 =?us-ascii?Q?ym4IdTmKobN7FXiIXQccvhcM7EqfMOUXumekJWMtHf8ny1lZT6Alfp0SUiD3?=
 =?us-ascii?Q?DVtY/Ry8kYK5berBz87wC+S5fH1+sFsu+ZwJug4bA4jKwk6u+T6jWQM0LE35?=
 =?us-ascii?Q?uo+a0QRKK0hahEzULU8kSAEFtRFDDcSyeuS4EaHgmzt/wDadNGsGoOONkwbC?=
 =?us-ascii?Q?nXvot0BDn6MMBc69ZQP2NaSNVsMA0F7Z90NljC16F4NrpdNLWUox30an+CUz?=
 =?us-ascii?Q?QN7AMTtbt6ovo4qMIapF8hL2WwozbaHKbC7L153q9hliuDDUsH6dqLHXFsbg?=
 =?us-ascii?Q?FSmbhnixKX+iXVHKM8jPetqybG9EItZVx9WpAXpNG8i04h1lXWsg2z49UHia?=
 =?us-ascii?Q?R3hQqNC35fHB4Oe1TaKTtTlKKRXcm3qXLFKplpdEd5jKFGfj4THziIz4OaXF?=
 =?us-ascii?Q?F3WMy6rY6nDlllz7nbRdMtiY9ejvq9r1ecI0eN13Dvd0f5UpS2+QOzQobI1x?=
 =?us-ascii?Q?DpsQaqLuV98iDXR6PvPvymThSOLlp5n5qy4bW8bBZxRO2k+Ku0S1qtkzjEog?=
 =?us-ascii?Q?SbYqclkA1UmRpqy9SAOK8aaBBGC7WnlSzelRjKNmjXarKQ5geLUjtHfFO6us?=
 =?us-ascii?Q?fFcp6iW6R+SXKEY59x8wkP70sCVlaXci6a0+7qOacqdhyvybOfgni9JFzUxU?=
 =?us-ascii?Q?k8UXWXwTwGu7I8f57BL/78lOeTe+AsqM2ViqgyMQOBAc6DPPfjm0RuZ4dTuk?=
 =?us-ascii?Q?CAzDiDwg9PB8VFVAsm0QFtY0eXs43tz+DUOsv3l+im848RgQjGwJSRiW9auv?=
 =?us-ascii?Q?zTuH7PgEyGUB7yvRxeS0injT6QwojdfrJOvQrlBzsiWaeRXMdXaofDP+09K5?=
 =?us-ascii?Q?IsF3+V34VSc2BhtpKQ+yeEbt9tZrwZKRwDGa64wi8+2g36FSq64YfVb2OqVz?=
 =?us-ascii?Q?tX0RuErpftsruiI5f9spG3bp35w/wbkYvuGfuDNCsjzGN2NA4QOBz4I489x3?=
 =?us-ascii?Q?girhAeFSlfFb2f3Q5lMoJ3sgZCC4CbCsti+qJPy0PoNTkRy/2iZy1QcDAmxH?=
 =?us-ascii?Q?kF7q9pzMpmVsolgEmRxp8B3Qa/S+65Q60dkSeC1daTe6F4LFbxh0BBwNdPRr?=
 =?us-ascii?Q?FhleFKmC0HE02FicZrFwABcH1sE1jHtvAbN2FOgf7yhEEohSv8D918cZk8fL?=
 =?us-ascii?Q?w3SK5MeNghfGlp0DxuLg1RXOSKethMeqTASgEd/vlwqepuIlcY/kxX8yLUb0?=
 =?us-ascii?Q?lSMnhiA1QC2OwWagESHi0C+bid8eilCgitZLGkDrZCar6bk3eiHC+Y9LzdV6?=
 =?us-ascii?Q?hHgzq3S4qQRz6A0iFibo69/8MAmCL3xil8z/maVVpSXLZ5Ow4eKMmkyIk25s?=
 =?us-ascii?Q?M8d8Occh6V6T42IG6cqq7kHQH+vM03SOpRdtF5cQLnwrQc2zqBPWv76kcdpN?=
 =?us-ascii?Q?sXmY4MMyvueXGABvAqQJb5WcjWE3LXzLoTmRXlgn9zM5QKydcRskG3k3hp0r?=
 =?us-ascii?Q?bVEF2UOjnstRtPHLIWATAx+Q3kStr58mExmWisVA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5579.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9c8505d-688f-4df8-ecb1-08db6708eb04
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2023 03:40:20.2924 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5A17lFN5XPqLBQ5in9+P96J6eoVHWZ70XapqgHujXK71iKjRjrOTKn8D3iTIou81kJB+fR+1ZOMsRAo5Q6hqoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6018
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
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, "Yang, Fei" <fei.yang@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Media driver reverted previous patches, and file a new  PR
https://github.com/intel/media-driver/pull/1680
will hold this PR until the uapi changes appear in drm_next.

besides this, ask a dumb question.=20
How we retrieve the pat_index from a shared resource though dma_buf fd?
maybe we need to know whether it could be CPU cached if we want map it.
Of course, looks there are no real usage to access it though CPU.=20
Just use it directly without any pat related options ?

Thanks
Carl

> -----Original Message-----
> From: Andi Shyti <andi.shyti@linux.intel.com>
> Sent: Tuesday, June 6, 2023 7:15 PM
> To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>; Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com>; Yang, Fei <fei.yang@intel.com>; Chris
> Wilson <chris@chris-wilson.co.uk>; Roper, Matthew D
> <matthew.d.roper@intel.com>; Justen, Jordan L <jordan.l.justen@intel.com>=
;
> Zhang, Carl <carl.zhang@intel.com>; Gu, Lihao <lihao.gu@intel.com>; Intel
> GFX <intel-gfx@lists.freedesktop.org>; DRI Devel <dri-
> devel@lists.freedesktop.org>
> Subject: Re: [PATCH v17 1/1] drm/i915: Allow user to set cache at BO crea=
tion
>=20
> > > > > To comply with the design that buffer objects shall have
> > > > > immutable cache setting through out their life cycle, {set,
> > > > > get}_caching ioctl's are no longer supported from MTL onward.
> > > > > With that change caching policy can only be set at object
> > > > > creation time. The current code applies a default (platform depen=
dent)
> cache setting for all objects.
> > > > > However this is not optimal for performance tuning. The patch
> > > > > extends the existing gem_create uAPI to let user set PAT index
> > > > > for the object at creation time.
> > > > > The new extension is platform independent, so UMD's can switch
> > > > > to using this extension for older platforms as well, while {set,
> > > > > get}_caching are still supported on these legacy paltforms for
> compatibility reason.
> > > > > However, since PAT index was not clearly defined for platforms
> > > > > prior to
> > > > > GEN12 (TGL), so we are limiting this externsion to GEN12+
> > > > > platforms only. See ext_set_pat() in for the implementation detai=
ls.
> > > > >
> > > > > Note: The documentation related to the PAT/MOCS tables is
> > > > > currently available for Tiger Lake here:
> > > > > https://www.intel.com/content/www/us/en/docs/graphics-for-linux/
> > > > > developer-reference/1-0/tiger-lake.html
> > > > >
> > > > > BSpec: 45101
> > > > >
> > > > > Mesa support has been submitted in this merge request:
> > > > > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/22878
> > > > >
> > > > > The media driver is supported by the following commits:
> > > > > https://github.com/intel/media-
> driver/commit/92c00a857433ebb34ec
> > > > > 575e9834f473c6fcb6341
> > > > > https://github.com/intel/media-driver/commit/fd375cf2c5e1f6bf6b4
> > > > > 3258ff797b3134aadc9fd
> > > > > https://github.com/intel/media-
> driver/commit/08dd244b22484770a33
> > > > > 464c2c8ae85430e548000
> >
> > Andi, let's still get these corrected before merging once the
> > media-driver revert is completed.
>=20
> Sure!
>=20
> At least this doesn't need a new version to be respinned.
>=20
> Please, Carl, link the new pull request and I will update the commit log.
>=20
> Andi
