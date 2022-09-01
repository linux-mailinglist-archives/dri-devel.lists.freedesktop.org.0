Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E7F5A99A4
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 16:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05AC410E71B;
	Thu,  1 Sep 2022 14:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F43610E67E;
 Thu,  1 Sep 2022 14:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662041021; x=1693577021;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=H7oNPMaMGRMvpqrmWoiI7VVYWC1hv+BhSiD5ZVZNMhs=;
 b=Pg66OGvwIYPnsqRtXzERRtpatK3B30qJXr8Icb7CU2tlBifahDRv2wgP
 2Midy2cqNkr528XK/EdEU9HOpF8ZytY356MQ2P0gTiw07X99p+HeEbnKx
 U5kOknA5mED81kCzWKwn+b6jmtxkNSWRPVkalNyaMN59Ao4W69Cr4rzbv
 G3VPOZopSG6TZruf9YGLgoJmtFvXWgRwdRUlfM9+nXqH+Wgwrii0tusAm
 VLdWdvOw8Bu5rRJgtTpsInrodLDsw/R7tQlY7QmTNxdVYd73lVfqLNMhr
 Xv0nIRYaiM6gV4snZTncFEA5PnIYpv6//Pvi0iBvQmQySgb3Fwq1iwCC2 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="293299215"
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; d="scan'208";a="293299215"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 07:03:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; d="scan'208";a="940859749"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP; 01 Sep 2022 07:03:26 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 1 Sep 2022 07:03:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 1 Sep 2022 07:03:25 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 1 Sep 2022 07:03:25 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 1 Sep 2022 07:03:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AXYRwln+kGLwEahVtKb+mgYSHUWAtGOmA9oLOzsI8aq1bKkY5l3w5iGEtWJzsNDd/6LvM+4WVo8izghZx+rvqtFrXXPHtzcp3GttrvaVXDGCG+Z+0KfokXByjHyAM0RwsLoX0lcb23fR1f4PvR+nm8rexHtCRfsx231dOArvvSI0VSiSd7Kj8n45AalLVnYoyAqOIUs3Fl9Ndryi+oAZxZuBCtwh2HqzBa/oicTPOwYIpBjujC5YZo/xsF0dvmnhUMiEewgruE6O7y/E/2ubp7V+dXd96+T1EAIRYdU8aiMww+XEwXcQ30IrBM2MiTQHp2IUkrnUCW5S8DBsCKOaVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oogV8wEgaxlGmFuNC1AWMk6XFu0TpR3Q+a0Y1F5tmEg=;
 b=RpWr91LUoU6x18JsnJehmCzQdLRz6eLCgVO1TQFVuE0lleIxUu3ylsZeWjcpKg2YrvU9hmTI1a8SRMZbBrpzpkZxpaUDhLtnJnmFUPNXawxJqw+FofeTChzORcA3VtQU5WMNRDo6EOsC/w7QQdH3LUkMG1qsrcT1i1JDr6r2fTNgJAK9xb3xKs/OHSOT4vvRItmXB1aaDMaBFxMvMTuMzC+yLDDlR40IxZW/cy7emy+Yo+kF+39Dv9uqkT3AKRc8bzvpk8QQRbZZCUXAOg/qN+ofGNuCmvapeABi+sm4YXm4lMlWuN1wkiaVfHGe3BKUgKyBtEEdTwgOgSZJBai+lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR11MB1324.namprd11.prod.outlook.com (2603:10b6:3:15::14) by
 BN8PR11MB3634.namprd11.prod.outlook.com (2603:10b6:408:88::31) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.19; Thu, 1 Sep 2022 14:03:00 +0000
Received: from DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::64f9:b9bd:85bb:c756]) by DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::64f9:b9bd:85bb:c756%3]) with mapi id 15.20.5588.010; Thu, 1 Sep 2022
 14:03:00 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, David Airlie
 <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>, Gurchetan Singh
 <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Daniel Almeida <daniel.almeida@collabora.com>, Gert Wollny
 <gert.wollny@collabora.com>, Gustavo Padovan <gustavo.padovan@collabora.com>, 
 Daniel Stone <daniel@fooishbar.org>, Tomeu Vizoso
 <tomeu.vizoso@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Clark <robdclark@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, =?iso-8859-1?Q?Christian_K=F6nig?=
 <christian.koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, "Thierry
 Reding" <thierry.reding@gmail.com>, Tomasz Figa <tfiga@chromium.org>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Alex Deucher <alexander.deucher@amd.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?iso-8859-1?Q?Thomas_Hellstr=F6m?= <thomas_os@shipmail.org>, Qiang Yu
 <yuq825@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, "Gross, Jurgen" <jgross@suse.com>,
 "Stefano Stabellini" <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Tomi Valkeinen <tomba@kernel.org>, "Russell
 King" <linux@armlinux.org.uk>, Lucas Stach <l.stach@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Subject: RE: [PATCH v4 06/21] drm/i915: Prepare to dynamic dma-buf locking
 specification
Thread-Topic: [PATCH v4 06/21] drm/i915: Prepare to dynamic dma-buf locking
 specification
Thread-Index: AQHYvVAKt26jWPyWVUOQMFIjO4nTPq3Km+VA
Date: Thu, 1 Sep 2022 14:02:59 +0000
Message-ID: <DM5PR11MB1324088635FDE00B0D957816C17B9@DM5PR11MB1324.namprd11.prod.outlook.com>
References: <20220831153757.97381-1-dmitry.osipenko@collabora.com>
 <20220831153757.97381-7-dmitry.osipenko@collabora.com>
In-Reply-To: <20220831153757.97381-7-dmitry.osipenko@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.17
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dfed438e-2f29-44bb-b802-08da8c22add9
x-ms-traffictypediagnostic: BN8PR11MB3634:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mMq9NvvlP9ajuIOC+hjVMXkGSs9f2xATLCHpzwcW4K4uToAIfBItl5anbvP8D/tQkrT742txZ6/mHbjfpGASPB8x9p1ncMrB0QFSlHxRxlOQVWknKM3MoLvkLON8VozxWRFvN1syZWQqgQJA/p4CjZPA5UiTVocZuABTpmbkAGiMklGi5RNQQwaPuXDrWYdj/gWUdWQTGnlR/A/mddFikY8agDGlTEsdwHne2hwREGmzZw/5AlnKcp1wfIzXf4CTqRnBju5VUVVi/xadfb9bdfSuEySg06roQZkBmPRBgOGbRcKa8+6JthIwfkys6ct4f84bzD+yljkDAOsuFfflPz8aiboRrzyaadxWeRMkILum86jOPwoh+KeA22P24Dk1W4XlI48XxRrQoi68MG62CY11/oU3j9ceXm4OsaLyvsBh+R7eOzhfszvGdC7QwXJVv74kz2QiPJum3Jpnt3nWhIRybmJzXtp763eUPN0+NFzP5CEhThNSOvr0e3Sz4ArzsDhNegaHnyGHHoD/JRIUslAnyj+PwIV6Afp4hmAT3QHa9b6eSEaheRKa2bYORMG4MUDn5Re8cBWy4kk/xAVNife9tDF7FyYPm7mHS90Hy3UdWE3cry1jjGEMTowtmuzQtuSJcqSnNasuZjZPTFvdMdfEkXIkI2VMnLoBBVe/awD7kVsTq5XZvCw59IYht95KIj83kBl2oDzgjfHs7xfcw71TJ3dxNuLN1pyZaEskaF/4mECTzGyTIA38xyVzS3x/sCHzmlBR8L0C3MaNGcmgEU1UCzawHIOHatEDsMHlLvw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1324.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(396003)(376002)(136003)(346002)(366004)(66446008)(66556008)(38070700005)(82960400001)(4326008)(76116006)(64756008)(921005)(8676002)(66946007)(33656002)(122000001)(38100700002)(86362001)(66574015)(41300700001)(83380400001)(7416002)(9686003)(71200400001)(6506007)(186003)(7696005)(7366002)(478600001)(2906002)(26005)(54906003)(316002)(5660300002)(110136005)(52536014)(7406005)(55016003)(66476007)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?eTE9ZUc5shAZ4zJTDbsqtqeqDWyXoP1oKxD87GwpnAsCuETLBlz+u51mBd?=
 =?iso-8859-1?Q?knTY2+M0+J1kXabO31GvuNv5a9D+ZJ4Ynw9IWa7aKUmeMzumDAqObeLlrA?=
 =?iso-8859-1?Q?z3Q58azARmZfMlxV7G00pcey1FtYjqFH92Hbf0P6fHoqTgA1EI7ycr02wJ?=
 =?iso-8859-1?Q?Kq9Fyp5aOMEXy+v4f0/vFl2Ndh0FyJhKNdpZ3Z//ZBeLi+WrBL96ouOeqc?=
 =?iso-8859-1?Q?Tu7HCI8rV8jkVP1/pYV1OEPfJWIp3CROGKhNAip/6X/644CT4NF4FMn2ve?=
 =?iso-8859-1?Q?3urYPNNBOdPLloNug9hfrvyeZNDNTAjBFRWkdzfX+1KVO7YQK8qwn2hbqa?=
 =?iso-8859-1?Q?lJPQY85ld4q7eJ3zbaY5VrBW02tNDPGKYsMCOd6tYT8FlPVgs+0P+qwL3w?=
 =?iso-8859-1?Q?PWLYWmOkvkhai+o0aJKSrcCu1wrlhfbaEwU0hPPyTbvdRZx5g+X7Is7COZ?=
 =?iso-8859-1?Q?LgTO3CPAsL9ZdVNzmzdAgp+4Azis8B5TCFbwMT6g88hHkfuHSJfTvrEJJt?=
 =?iso-8859-1?Q?BME5gI+0Kgb4ORJhN78XwD8Z2H2IezeXmSNsq+d790fB608CGBEzneNnzG?=
 =?iso-8859-1?Q?udrGnWUosS5dcODPNQqyHl/pyViEQUk7OqUu+Mh1iO1CtieQSJDe87/O1R?=
 =?iso-8859-1?Q?aSswHbAtre/6ueRmxi20a5b4n5RX0Df2KZAoG2f8mqD0+eoxZBZFTXGu6d?=
 =?iso-8859-1?Q?F+i0kb5J507GDB9YKL6QYu1VLEQTux01VyIpSmd9d+0oySgs00dFG3nyYl?=
 =?iso-8859-1?Q?PFTD/R50P+z7teGeS2XLcY50/JaRRPG24LWHWuGbhw+SrY3/DyLZWZ/KXd?=
 =?iso-8859-1?Q?eC2BYNePDP6JtMWFwr3nyIjHFA3kElGtHpMeiP/LpRzRr1cPJMy2yvGkD/?=
 =?iso-8859-1?Q?s+POeWW5yQ3h0W4jsXw4r+tKjzfXJp5eokNeQ1ILGwYsN7Q6VSuEKfH0y1?=
 =?iso-8859-1?Q?MFrkn8OTdnV9bsuoNo0CQYNVDpYFcr8QcZkbxxDyBEfYt7DShSN/sHLqdX?=
 =?iso-8859-1?Q?6hIYav44JP9lr3fPSLAQNnN7DIQy7rXF/Ih5hSj2S/IurSixf7a/I4xrxn?=
 =?iso-8859-1?Q?/p+Z4sjcZPiIQuVjy816arXYEd4eVsEM5SBJFmhqSrTgKqJOUDt+VQHgiz?=
 =?iso-8859-1?Q?ZA5Oum2QZoiTlhDJ+ZkDOgNiwJxAK0dQ6qlVBNYjsnmUtZtrez+Ga6N6RC?=
 =?iso-8859-1?Q?1jbCv4JYo5M9rBxewQhslZyLBfvSHMP59pRbQ5JEvnwbncpLe6tt0BMlSp?=
 =?iso-8859-1?Q?IE4FjZyHkOR+8zWJ72yGJzn1icb3P/dd2K8lkutOowgmyBtc1JTvh0XT4v?=
 =?iso-8859-1?Q?KB4/EX0rx+EuKInpRJ8A3eptyTStszd40DBtPSeQhO2vR+DY2q8T3pIRTO?=
 =?iso-8859-1?Q?AjAmmLwUUTPxWVsrDXwMtHWT5ITwemVogrHKUhk2REko+hK0+U8J3keUYw?=
 =?iso-8859-1?Q?b/YMDmxvbHTAf+b4WKN7nQz2YVgq1cFnVcGeXQzomczzHwzw8BQe2cbLQy?=
 =?iso-8859-1?Q?sJxACFam/yO2EoDzb33S12SZ5oA8N5tL9qtA7Fx3TlxFaF173q5AmEH8P4?=
 =?iso-8859-1?Q?1bso8HoKU5rdnQHknlGPfOG5XDhVOJQYuRlpUTt+kBqWhV0Kvi6aUXUw6o?=
 =?iso-8859-1?Q?xDJvotJoE5Hufyev5Z4n83S2NvhD3fk6H2?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1324.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfed438e-2f29-44bb-b802-08da8c22add9
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2022 14:02:59.9225 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g4ycS2vn1nGCJetZEgi48T+II34HkcCyIwVoRqc8cCeDu0JsHdf6zxPEc6wzDGuRYDM1mGqbVX1T5j3KqAM+NmwjRh1luBMpOlzNGEZf7UE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3634
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
Cc: "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Dmitry
 Osipenko <digetx@gmail.com>, "kernel@collabora.com" <kernel@collabora.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>-----Original Message-----
>From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>Sent: Wednesday, August 31, 2022 11:38 AM
>To: David Airlie <airlied@linux.ie>; Gerd Hoffmann <kraxel@redhat.com>;
>Gurchetan Singh <gurchetansingh@chromium.org>; Chia-I Wu
><olvaffe@gmail.com>; Daniel Vetter <daniel@ffwll.ch>; Daniel Almeida
><daniel.almeida@collabora.com>; Gert Wollny <gert.wollny@collabora.com>;
>Gustavo Padovan <gustavo.padovan@collabora.com>; Daniel Stone
><daniel@fooishbar.org>; Tomeu Vizoso <tomeu.vizoso@collabora.com>;
>Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripard
><mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>;
>Rob Clark <robdclark@gmail.com>; Sumit Semwal
><sumit.semwal@linaro.org>; Christian K=F6nig <christian.koenig@amd.com>;
>Pan, Xinhui <Xinhui.Pan@amd.com>; Thierry Reding
><thierry.reding@gmail.com>; Tomasz Figa <tfiga@chromium.org>; Marek
>Szyprowski <m.szyprowski@samsung.com>; Mauro Carvalho Chehab
><mchehab@kernel.org>; Alex Deucher <alexander.deucher@amd.com>; Jani
>Nikula <jani.nikula@linux.intel.com>; Joonas Lahtinen
><joonas.lahtinen@linux.intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
>Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>; Thomas Hellstr=F6m
><thomas_os@shipmail.org>; Qiang Yu <yuq825@gmail.com>; Srinivas
>Kandagatla <srinivas.kandagatla@linaro.org>; Amol Maheshwari
><amahesh@qti.qualcomm.com>; Jason Gunthorpe <jgg@ziepe.ca>; Leon
>Romanovsky <leon@kernel.org>; Gross, Jurgen <jgross@suse.com>; Stefano
>Stabellini <sstabellini@kernel.org>; Oleksandr Tyshchenko
><oleksandr_tyshchenko@epam.com>; Tomi Valkeinen <tomba@kernel.org>;
>Russell King <linux@armlinux.org.uk>; Lucas Stach <l.stach@pengutronix.de>=
;
>Christian Gmeiner <christian.gmeiner@gmail.com>
>Cc: dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; Dmitry
>Osipenko <digetx@gmail.com>; linux-media@vger.kernel.org; linaro-mm-
>sig@lists.linaro.org; amd-gfx@lists.freedesktop.org; intel-
>gfx@lists.freedesktop.org; kernel@collabora.com; virtualization@lists.linu=
x-
>foundation.org; linux-rdma@vger.kernel.org; linux-arm-
>msm@vger.kernel.org
>Subject: [PATCH v4 06/21] drm/i915: Prepare to dynamic dma-buf locking
>specification
>
>Prepare i915 driver to the common dynamic dma-buf locking convention
>by starting to use the unlocked versions of dma-buf API functions
>and handling cases where importer now holds the reservation lock.
>
>Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>---
> drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c       |  2 +-
> drivers/gpu/drm/i915/gem/i915_gem_object.c       | 12 ++++++++++++
> .../gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c | 16 ++++++++--------
> 3 files changed, 21 insertions(+), 9 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>index f5062d0c6333..07eee1c09aaf 100644
>--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>@@ -72,7 +72,7 @@ static int i915_gem_dmabuf_vmap(struct dma_buf
>*dma_buf,
> 	struct drm_i915_gem_object *obj =3D dma_buf_to_obj(dma_buf);
> 	void *vaddr;
>
>-	vaddr =3D i915_gem_object_pin_map_unlocked(obj, I915_MAP_WB);
>+	vaddr =3D i915_gem_object_pin_map(obj, I915_MAP_WB);
> 	if (IS_ERR(vaddr))
> 		return PTR_ERR(vaddr);
>
>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>index 389e9f157ca5..7e2a9b02526c 100644
>--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>@@ -331,7 +331,19 @@ static void __i915_gem_free_objects(struct
>drm_i915_private *i915,
> 			continue;
> 		}
>
>+		/*
>+		 * dma_buf_unmap_attachment() requires reservation to be
>+		 * locked. The imported GEM shouldn't share reservation lock,
>+		 * so it's safe to take the lock.
>+		 */
>+		if (obj->base.import_attach)
>+			i915_gem_object_lock(obj, NULL);

There is a lot of stuff going here.  Taking the lock may be premature...

> 		__i915_gem_object_pages_fini(obj);

The i915_gem_dmabuf.c:i915_gem_object_put_pages_dmabuf is where
unmap_attachment is actually called, would it make more sense to make
do the locking there?

Mike


>+
>+		if (obj->base.import_attach)
>+			i915_gem_object_unlock(obj);
>+
> 		__i915_gem_free_object(obj);
>
> 		/* But keep the pointer alive for RCU-protected lookups */
>diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
>b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
>index 62c61af77a42..9e3ed634aa0e 100644
>--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
>+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
>@@ -213,7 +213,7 @@ static int igt_dmabuf_import_same_driver(struct
>drm_i915_private *i915,
> 		goto out_import;
> 	}
>
>-	st =3D dma_buf_map_attachment(import_attach,
>DMA_BIDIRECTIONAL);
>+	st =3D dma_buf_map_attachment_unlocked(import_attach,
>DMA_BIDIRECTIONAL);
> 	if (IS_ERR(st)) {
> 		err =3D PTR_ERR(st);
> 		goto out_detach;
>@@ -226,7 +226,7 @@ static int igt_dmabuf_import_same_driver(struct
>drm_i915_private *i915,
> 		timeout =3D -ETIME;
> 	}
> 	err =3D timeout > 0 ? 0 : timeout;
>-	dma_buf_unmap_attachment(import_attach, st,
>DMA_BIDIRECTIONAL);
>+	dma_buf_unmap_attachment_unlocked(import_attach, st,
>DMA_BIDIRECTIONAL);
> out_detach:
> 	dma_buf_detach(dmabuf, import_attach);
> out_import:
>@@ -296,7 +296,7 @@ static int igt_dmabuf_import(void *arg)
> 		goto out_obj;
> 	}
>
>-	err =3D dma_buf_vmap(dmabuf, &map);
>+	err =3D dma_buf_vmap_unlocked(dmabuf, &map);
> 	dma_map =3D err ? NULL : map.vaddr;
> 	if (!dma_map) {
> 		pr_err("dma_buf_vmap failed\n");
>@@ -337,7 +337,7 @@ static int igt_dmabuf_import(void *arg)
>
> 	err =3D 0;
> out_dma_map:
>-	dma_buf_vunmap(dmabuf, &map);
>+	dma_buf_vunmap_unlocked(dmabuf, &map);
> out_obj:
> 	i915_gem_object_put(obj);
> out_dmabuf:
>@@ -358,7 +358,7 @@ static int igt_dmabuf_import_ownership(void *arg)
> 	if (IS_ERR(dmabuf))
> 		return PTR_ERR(dmabuf);
>
>-	err =3D dma_buf_vmap(dmabuf, &map);
>+	err =3D dma_buf_vmap_unlocked(dmabuf, &map);
> 	ptr =3D err ? NULL : map.vaddr;
> 	if (!ptr) {
> 		pr_err("dma_buf_vmap failed\n");
>@@ -367,7 +367,7 @@ static int igt_dmabuf_import_ownership(void *arg)
> 	}
>
> 	memset(ptr, 0xc5, PAGE_SIZE);
>-	dma_buf_vunmap(dmabuf, &map);
>+	dma_buf_vunmap_unlocked(dmabuf, &map);
>
> 	obj =3D to_intel_bo(i915_gem_prime_import(&i915->drm, dmabuf));
> 	if (IS_ERR(obj)) {
>@@ -418,7 +418,7 @@ static int igt_dmabuf_export_vmap(void *arg)
> 	}
> 	i915_gem_object_put(obj);
>
>-	err =3D dma_buf_vmap(dmabuf, &map);
>+	err =3D dma_buf_vmap_unlocked(dmabuf, &map);
> 	ptr =3D err ? NULL : map.vaddr;
> 	if (!ptr) {
> 		pr_err("dma_buf_vmap failed\n");
>@@ -435,7 +435,7 @@ static int igt_dmabuf_export_vmap(void *arg)
> 	memset(ptr, 0xc5, dmabuf->size);
>
> 	err =3D 0;
>-	dma_buf_vunmap(dmabuf, &map);
>+	dma_buf_vunmap_unlocked(dmabuf, &map);
> out:
> 	dma_buf_put(dmabuf);
> 	return err;
>--
>2.37.2

