Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCF35B9BBA
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 15:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2085610EB28;
	Thu, 15 Sep 2022 13:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D8D10EB09;
 Thu, 15 Sep 2022 13:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663248007; x=1694784007;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=b/r2cIiKF9y229+U7mEZrtO/yTTRexF612SYogUQ+Z8=;
 b=N4gHrGlHXZy+S4TVr6rFbsEsNKZNuplsEECPRdASTkJrv298zxbSYzSE
 18Pbe/7E8rjG3R6byPKwPR00pq9D+PIoGoN1CtWriIZVnTRPsYDelTnl2
 h+Zb0eftXb90J+FLJHvVQAR7oQeZ1oUNjDZ2nr0/KnMnQA3dUG2hbX7ua
 gJXqAdbwnQkxhzu6H7mm+3d6Hk7UBgmRYoIsRaDEIco3c4bILCxdIQjVq
 A+txsT/55RzF7D3t1YZrHxYBlTaxZHhEqu6+xtKt/5eXUX3A8gg/YyVqQ
 4FfnqhLltWUtyoGIDfwGSdPExVJC3t4MGSkZeVS6XJdzpRQBnK2KGpQ3C g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="324972007"
X-IronPort-AV: E=Sophos;i="5.93,318,1654585200"; d="scan'208";a="324972007"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 06:20:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,318,1654585200"; d="scan'208";a="594815837"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 15 Sep 2022 06:20:05 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 15 Sep 2022 06:20:05 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 15 Sep 2022 06:20:04 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 15 Sep 2022 06:20:04 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 15 Sep 2022 06:20:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kH6monHgyxd84CfNR/QMyhi9KjpvXXtGi2mDfqmeWTpDiLs8+m5lr8jubfs9F8DewyNmP8A498zWvtjyO1R11g2eNNavevuuAxGMPdgWGxY0WMiUsGJB4gTJzMs+2rEVECKGRGXfdEfLXwWcX4rRfW536T9A7f88uZNR90v0lromcV54pzRDrB3xYFZJcr2iYSpblRt1tdW8nWPfOehTURlZyoLidNprhjYX1hiuWwajbMEPc5jtdC0GVBbLctDzXwfYnVFvSnshiCXlleCQY7eV1jBnYesgY0whh7IEXYeCwaLRzRZN5HWgFFeUbUKz6yToVjl2OcX3uF2v/yHVKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/r2cIiKF9y229+U7mEZrtO/yTTRexF612SYogUQ+Z8=;
 b=NPq3OvC/oYEIGwEJY/4BP/92MX5hzuTv8xoBdK/PKkkFJfqmTndSatv+nwegdKVLHsRjsfb+RSBD6mgBE62ehn7FGHe40xW7U2/lWLNSXWI4x3f/AZ8gwxgF6ZFuTKwlJgDaTWBdl/ARkOPBsU80RYIcAx6nqmLG975nmdQBNma9GpNYj49xCBd4sIAodOX5j8MCAYbr3SpDtqH8bCCXhUnmzrzYrg44KTnYmPiXBSXSvsTcUmCR7cuwkvAd7XBBGclm/61VEtNdQYG39P/3F7t7jwzHLNr9z5TtC5MssQqalG4bZfkOwPhPmAPapV+/om/4WixgJ1f2oXcXphB9Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR11MB1324.namprd11.prod.outlook.com (2603:10b6:3:15::14) by
 SA2PR11MB4906.namprd11.prod.outlook.com (2603:10b6:806:fa::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.22; Thu, 15 Sep 2022 13:20:00 +0000
Received: from DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::64f9:b9bd:85bb:c756]) by DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::64f9:b9bd:85bb:c756%3]) with mapi id 15.20.5632.015; Thu, 15 Sep 2022
 13:19:59 +0000
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
 Sumit Semwal <sumit.semwal@linaro.org>, =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?=
 <christian.koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, "Thierry
 Reding" <thierry.reding@gmail.com>, Tomasz Figa <tfiga@chromium.org>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Alex Deucher <alexander.deucher@amd.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas_os@shipmail.org>, Qiang Yu
 <yuq825@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, "Gross, Jurgen" <jgross@suse.com>,
 "Stefano Stabellini" <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Tomi Valkeinen <tomba@kernel.org>, "Russell
 King" <linux@armlinux.org.uk>, Lucas Stach <l.stach@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Subject: RE: [PATCH v5 06/21] drm/i915: Prepare to dynamic dma-buf locking
 specification
Thread-Topic: [PATCH v5 06/21] drm/i915: Prepare to dynamic dma-buf locking
 specification
Thread-Index: AQHYx6chL5Og8tLRv0O9ApcOSblAH63ge07A
Date: Thu, 15 Sep 2022 13:19:59 +0000
Message-ID: <DM5PR11MB1324D697A3C881F8A58E1004C1499@DM5PR11MB1324.namprd11.prod.outlook.com>
References: <20220913192757.37727-1-dmitry.osipenko@collabora.com>
 <20220913192757.37727-7-dmitry.osipenko@collabora.com>
In-Reply-To: <20220913192757.37727-7-dmitry.osipenko@collabora.com>
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
x-ms-traffictypediagnostic: DM5PR11MB1324:EE_|SA2PR11MB4906:EE_
x-ms-office365-filtering-correlation-id: 3954e8ab-a6ef-4bd0-69d9-08da971cfdae
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EP97Ivv1vxuCnNtPmjXPac4WgsYFqjf7Y3ueg79MQ3uDLisX5umYa6X9aG6i65fjg8yMVQgfyu1beknEm4NfscV23zFhflGr8mKKo+X/Qbbwfp1uYwfKbUncBhMTtmVD4q2aWKsUj6G1kU/7LHSiU9pnPPaJDS0v3plGQ/I7NNQf5M6nhGCJu294/fG+X9VFDxNrSMV7gw1TMiVURQzSPRgyHNxcDbkRJwkF1kym3aaPYRnPpfH1BsaPp+ceXUtG1/8GLSLiWXwH3ljJ4cOI7uQz6SWSeBqQ3no4KWwEm3EP8jOicbpva480ZKc0WGBzW3OKjMn39lNDE8LSD6A0p8o2PNgMNTwk/TMOF5mv78ivYMSAazQnTvybjYAN2jUD0r5k9PpBqfl+tPUKW1RvhdgID3HiZPEtKe3aSGYHOC6gPTfVaiA4dWJ9jPXLt60mCF1Ci7nG7So6l5wZzameeswXbA2Za2LLinW4bBMT1xb4dxEvfCC1hnJBhoeS2IbGNEF+ZOZB1tXyYlhTBQUXAcFR4PQ+a9GZ+qO/y2CyvzjDFLIsKAyBsxQa95AZQ4fetpjfXgIi7Lc7O0x9DB8VYkyAKNzCFe2AFccVONH9Li+B+/oGnrNhkVrK4TDu+zzdQbX18Y5O9RVSFYlsde7FuU6pLA/V7h3KGgDGLfOwRKRTiievZ62JWffZZT/edSyJjYhC4qblSWZ5jybEHpaKd+WxzBC5h0zTv/rjucV1Ow53y+wV9L34q8IZGA4pQWJLBiyqiREjuaRUQub1JVIZbPH0i2+JYp2SYwxMaoKBoaY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1324.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(346002)(136003)(376002)(366004)(39860400002)(451199015)(4326008)(86362001)(110136005)(54906003)(66446008)(64756008)(55016003)(82960400001)(66476007)(71200400001)(66946007)(9686003)(7416002)(38070700005)(7406005)(478600001)(41300700001)(26005)(316002)(2906002)(83380400001)(8936002)(52536014)(5660300002)(66574015)(7366002)(66556008)(186003)(8676002)(38100700002)(6506007)(921005)(76116006)(122000001)(33656002)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SlJEWFVJNWhSVUZWMXhYVEt4VlN0VmpxQzYrdHpCa0d2c09GaWpOejk3cWpj?=
 =?utf-8?B?Rjh4U0dDWWRxS2FJSExYT2xZSzBVK25tN3lDQmVyOHhUUVErYm1vdVpDLzhu?=
 =?utf-8?B?TytIa241VFdtaFpvMjJuaWVLRkRuYzBmd09uRXg5L0sxbTJPc21YMUtzcWFh?=
 =?utf-8?B?OXdmQVVMTHVUTWx0L2cxSERtRXkxeFVCN1o3Y1Z3Mm1za0FOMDdnd0w2M21O?=
 =?utf-8?B?NkxGeWlROWJFZm9tSHNJc0VOdDN1b0ltdU9DaTNnTWV2SGlXaW51VVFpTU5Q?=
 =?utf-8?B?RE9aLy85V3NDZGlqK2VLd0ZrWDlDMDhndzk5bGh2NzJTbHppWEVhM3NSTUYy?=
 =?utf-8?B?QVlLZ3ByQTFGQlpCcklmSHZyNFBpWmxycnNDVUpYTWZWM0ZqL1RIUzFWMmg1?=
 =?utf-8?B?aHROWGdtNnEzbE1CZHhxejVEcWM2L3pnWUxIaFVzajlLQi9hcVg1dmFyaW1t?=
 =?utf-8?B?eEh0Tk04NVdGK1NlSTluQ3pvamxFY1FrV0VzSllRM0RkMmx5NzF3YTdKdVdR?=
 =?utf-8?B?SHI0VS9UZ0xlWTB2aU1DZFhrYklYaGFNNDZTVm0reTRxcUpwLzY4enN3RzJX?=
 =?utf-8?B?OWhxRVZuTGpDV2dDSGt2RXNtSnRueWF1bEpXaFFWQ0hlWTducXZSOVhvMHEz?=
 =?utf-8?B?dWovSWtmSDNrUm1SRjIrOEdMenVBZGY1WHUvQXNCWmgrZXZvNHJDSHFramlk?=
 =?utf-8?B?aVU0cy9JYnBLT01MQVhIZURFcU1oZ2FZVkkrbmtXL3h2WHVoT1hxVWR4OFJm?=
 =?utf-8?B?UDRzQ3BXQTFEMHZrTFEvRHNLT3BSQzRFUGJNdGRMbXh4SnN4b3E5QTlwekJG?=
 =?utf-8?B?VE9zMFNHemc5QVBmZk5odlBqSGU3RFRUTWFLdXQ0S3hORnBHTHk0UUFXWTZj?=
 =?utf-8?B?WEc4RTk1TXMwVFU5Mm4rSkt5a0V1UElGeEY3aTJQbmIxdG5mNG4vRFlLYnlC?=
 =?utf-8?B?MnF1VERESFNaTlZwWnFENnBoa2J0enRkRjA2RHkwK1RZd2pmVzB0R2pBRnFu?=
 =?utf-8?B?bml5cmFTVXRJWlhmSVJCYnppUVpNZkN1ZXpOOVlnNGpUaFN5ZHVXS1RDWXRl?=
 =?utf-8?B?Tko4T1VqblY4dFFrN1FORHZzK2prekV0WTlZS1NtQ0NBbzNTOWVSQS9FVlc2?=
 =?utf-8?B?aSs1TitiS0U2YzZrREpBcU9NR2dRMUFhWWlKWCtVSEdjSjBDL2ZYaGtEekpT?=
 =?utf-8?B?bjRhdHh4dWhtam5rSEgxUW1CTERQQVdwc012NFYvK2JIOHhETVZKamhrZzEr?=
 =?utf-8?B?dnZmZHQ0V3FTM3EzdCtVKzJ6bGppWENZMjhlV0x2T3pFMk5hdFdMZ3lCSXR5?=
 =?utf-8?B?blJpbFdBV010YUVyQkF2bFZmQk9wYXI2bmNEYzRhVDhtZjhNTmNnUngycnFW?=
 =?utf-8?B?WDl4dTczb1NxUjJ1Ri85NmQ3Y0FnaGZwMUpLelUxcWc4KzFaTDRmMURRS21t?=
 =?utf-8?B?Y0NtN25UOFFDckN0V0tYbzIzQWdVSGpiVHlhRE0wdXY0ZW1HeE1tb1JqRlc2?=
 =?utf-8?B?TTJacTBxY3Q3NUVkaDdRZnFQN0RHM0xRRzZNNS9ZQXRFM3llTVl3bWdBVG9u?=
 =?utf-8?B?MmNIWDI1SXpLWGoreG1UUHpyTzVxekpwNFpBR1VvT21IaXNMTkR0YnpuZmJy?=
 =?utf-8?B?VGxrWFRrNmtTaWJXYnpZYkNuYTFEekV2c0loNDVFdFRWTyt6aWdHdU10MVVx?=
 =?utf-8?B?cTIrY0JFVlk0RklxenU2YUwzeGZ5M3M2eU13SFp0dm5yZWR1eDF5TWk4WlBJ?=
 =?utf-8?B?U052ZDA3enhPZHRWZnNjNXZDMkdsQmU0TTg0WFhDVE1vRWN6UDVTcnpGaTZT?=
 =?utf-8?B?WEJOVXd5YWJBSmk0V0JlL1l1c2YrL0R0OWpISGJPRkR5WnVveGNzKytyZVl2?=
 =?utf-8?B?U2FzMytNMGdqZW1tOFZCVzBQalhFWFlTdStYOEhuMlBvTFQ0Ym9BREorckJh?=
 =?utf-8?B?QTRHbVAvcHh6b3p4OFBsTy9rZFpuNFlDYlU5aEtnYmhhZnZ2d0N3dGV4bTFn?=
 =?utf-8?B?dkJodHRUVmVZQ0xrSXZJNmxZUGE0WEhXQms4NkM0SjVCdURSYmdiZmxLeHN4?=
 =?utf-8?B?YjR4ZzNiU2Vyc3lNR081NkRuaEVySGtpQXhkZzEvSFBPeWpNbmh2Qy93Z1Bv?=
 =?utf-8?Q?jMRr8HSAgePx7szGmUKmcXvX6?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1324.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3954e8ab-a6ef-4bd0-69d9-08da971cfdae
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2022 13:19:59.6978 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ypsHXk8BjHhk7KvfakAkLHzSqBD7+izRpb7RUmPhq8XeUUByZOt29h/6zgMQbWA/1PkCfZxRV3Mugofi3uAMK5kKTNThSBptn5ubV1nBb3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4906
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

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogRG1pdHJ5IE9zaXBlbmtvIDxkbWl0
cnkub3NpcGVua29AY29sbGFib3JhLmNvbT4NCj5TZW50OiBUdWVzZGF5LCBTZXB0ZW1iZXIgMTMs
IDIwMjIgMzoyOCBQTQ0KPlRvOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+OyBHZXJk
IEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT47DQo+R3VyY2hldGFuIFNpbmdoIDxndXJjaGV0
YW5zaW5naEBjaHJvbWl1bS5vcmc+OyBDaGlhLUkgV3UNCj48b2x2YWZmZUBnbWFpbC5jb20+OyBE
YW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+OyBEYW5pZWwgQWxtZWlkYQ0KPjxkYW5pZWwu
YWxtZWlkYUBjb2xsYWJvcmEuY29tPjsgR2VydCBXb2xsbnkgPGdlcnQud29sbG55QGNvbGxhYm9y
YS5jb20+Ow0KPkd1c3Rhdm8gUGFkb3ZhbiA8Z3VzdGF2by5wYWRvdmFuQGNvbGxhYm9yYS5jb20+
OyBEYW5pZWwgU3RvbmUNCj48ZGFuaWVsQGZvb2lzaGJhci5vcmc+OyBUb21ldSBWaXpvc28gPHRv
bWV1LnZpem9zb0Bjb2xsYWJvcmEuY29tPjsNCj5NYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5s
YW5raG9yc3RAbGludXguaW50ZWwuY29tPjsgTWF4aW1lIFJpcGFyZA0KPjxtcmlwYXJkQGtlcm5l
bC5vcmc+OyBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT47DQo+Um9iIENs
YXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPjsgU3VtaXQgU2Vtd2FsDQo+PHN1bWl0LnNlbXdhbEBs
aW5hcm8ub3JnPjsgQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPjsN
Cj5QYW4sIFhpbmh1aSA8WGluaHVpLlBhbkBhbWQuY29tPjsgVGhpZXJyeSBSZWRpbmcNCj48dGhp
ZXJyeS5yZWRpbmdAZ21haWwuY29tPjsgVG9tYXN6IEZpZ2EgPHRmaWdhQGNocm9taXVtLm9yZz47
IE1hcmVrDQo+U3p5cHJvd3NraSA8bS5zenlwcm93c2tpQHNhbXN1bmcuY29tPjsgTWF1cm8gQ2Fy
dmFsaG8gQ2hlaGFiDQo+PG1jaGVoYWJAa2VybmVsLm9yZz47IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT47IEphbmkNCj5OaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4Lmlu
dGVsLmNvbT47IEpvb25hcyBMYWh0aW5lbg0KPjxqb29uYXMubGFodGluZW5AbGludXguaW50ZWwu
Y29tPjsgVml2aSwgUm9kcmlnbyA8cm9kcmlnby52aXZpQGludGVsLmNvbT47DQo+VHZydGtvIFVy
c3VsaW4gPHR2cnRrby51cnN1bGluQGxpbnV4LmludGVsLmNvbT47IFRob21hcyBIZWxsc3Ryw7Zt
DQo+PHRob21hc19vc0BzaGlwbWFpbC5vcmc+OyBRaWFuZyBZdSA8eXVxODI1QGdtYWlsLmNvbT47
IFNyaW5pdmFzDQo+S2FuZGFnYXRsYSA8c3Jpbml2YXMua2FuZGFnYXRsYUBsaW5hcm8ub3JnPjsg
QW1vbCBNYWhlc2h3YXJpDQo+PGFtYWhlc2hAcXRpLnF1YWxjb21tLmNvbT47IEphc29uIEd1bnRo
b3JwZSA8amdnQHppZXBlLmNhPjsgTGVvbg0KPlJvbWFub3Zza3kgPGxlb25Aa2VybmVsLm9yZz47
IEdyb3NzLCBKdXJnZW4gPGpncm9zc0BzdXNlLmNvbT47IFN0ZWZhbm8NCj5TdGFiZWxsaW5pIDxz
c3RhYmVsbGluaUBrZXJuZWwub3JnPjsgT2xla3NhbmRyIFR5c2hjaGVua28NCj48b2xla3NhbmRy
X3R5c2hjaGVua29AZXBhbS5jb20+OyBUb21pIFZhbGtlaW5lbiA8dG9tYmFAa2VybmVsLm9yZz47
DQo+UnVzc2VsbCBLaW5nIDxsaW51eEBhcm1saW51eC5vcmcudWs+OyBMdWNhcyBTdGFjaCA8bC5z
dGFjaEBwZW5ndXRyb25peC5kZT47DQo+Q2hyaXN0aWFuIEdtZWluZXIgPGNocmlzdGlhbi5nbWVp
bmVyQGdtYWlsLmNvbT47IFJ1aGwsIE1pY2hhZWwgSg0KPjxtaWNoYWVsLmoucnVobEBpbnRlbC5j
b20+DQo+Q2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmc7IERtaXRyeQ0KPk9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPjsgbGlu
dXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOyBsaW5hcm8tbW0tDQo+c2lnQGxpc3RzLmxpbmFyby5v
cmc7IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC0NCj5nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnOyBrZXJuZWxAY29sbGFib3JhLmNvbTsgdmlydHVhbGl6YXRpb25AbGlzdHMu
bGludXgtDQo+Zm91bmRhdGlvbi5vcmc7IGxpbnV4LXJkbWFAdmdlci5rZXJuZWwub3JnOyBsaW51
eC1hcm0tDQo+bXNtQHZnZXIua2VybmVsLm9yZw0KPlN1YmplY3Q6IFtQQVRDSCB2NSAwNi8yMV0g
ZHJtL2k5MTU6IFByZXBhcmUgdG8gZHluYW1pYyBkbWEtYnVmIGxvY2tpbmcNCj5zcGVjaWZpY2F0
aW9uDQo+DQo+UHJlcGFyZSBpOTE1IGRyaXZlciB0byB0aGUgY29tbW9uIGR5bmFtaWMgZG1hLWJ1
ZiBsb2NraW5nIGNvbnZlbnRpb24NCj5ieSBzdGFydGluZyB0byB1c2UgdGhlIHVubG9ja2VkIHZl
cnNpb25zIG9mIGRtYS1idWYgQVBJIGZ1bmN0aW9ucw0KPmFuZCBoYW5kbGluZyBjYXNlcyB3aGVy
ZSBpbXBvcnRlciBub3cgaG9sZHMgdGhlIHJlc2VydmF0aW9uIGxvY2suDQo+DQo+QWNrZWQtYnk6
IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj5TaWduZWQtb2Zm
LWJ5OiBEbWl0cnkgT3NpcGVua28gPGRtaXRyeS5vc2lwZW5rb0Bjb2xsYWJvcmEuY29tPg0KPi0t
LQ0KPiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fZG1hYnVmLmMgICAgICAgfCAg
MiArLQ0KPiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fb2JqZWN0LmMgICAgICAg
fCAxNCArKysrKysrKysrKysrKw0KPiAuLi4vZ3B1L2RybS9pOTE1L2dlbS9zZWxmdGVzdHMvaTkx
NV9nZW1fZG1hYnVmLmMgfCAxNiArKysrKysrKy0tLS0tLS0tDQo+IDMgZmlsZXMgY2hhbmdlZCwg
MjMgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkNCj4NCj5kaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2RtYWJ1Zi5jDQo+Yi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9nZW0vaTkxNV9nZW1fZG1hYnVmLmMNCj5pbmRleCBmNTA2MmQwYzYzMzMuLjA3ZWVlMWMw
OWFhZiAxMDA2NDQNCj4tLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fZG1h
YnVmLmMNCj4rKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fZG1hYnVmLmMN
Cj5AQCAtNzIsNyArNzIsNyBAQCBzdGF0aWMgaW50IGk5MTVfZ2VtX2RtYWJ1Zl92bWFwKHN0cnVj
dCBkbWFfYnVmDQo+KmRtYV9idWYsDQo+IAlzdHJ1Y3QgZHJtX2k5MTVfZ2VtX29iamVjdCAqb2Jq
ID0gZG1hX2J1Zl90b19vYmooZG1hX2J1Zik7DQo+IAl2b2lkICp2YWRkcjsNCj4NCj4tCXZhZGRy
ID0gaTkxNV9nZW1fb2JqZWN0X3Bpbl9tYXBfdW5sb2NrZWQob2JqLCBJOTE1X01BUF9XQik7DQo+
Kwl2YWRkciA9IGk5MTVfZ2VtX29iamVjdF9waW5fbWFwKG9iaiwgSTkxNV9NQVBfV0IpOw0KPiAJ
aWYgKElTX0VSUih2YWRkcikpDQo+IAkJcmV0dXJuIFBUUl9FUlIodmFkZHIpOw0KPg0KPmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fb2JqZWN0LmMNCj5iL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9vYmplY3QuYw0KPmluZGV4IDg1NDgyYTA0
ZDE1OC4uN2NhYjg5NjE4YmFkIDEwMDY0NA0KPi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dl
bS9pOTE1X2dlbV9vYmplY3QuYw0KPisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1
X2dlbV9vYmplY3QuYw0KPkBAIC0yOTAsNyArMjkwLDIxIEBAIHZvaWQgX19pOTE1X2dlbV9vYmpl
Y3RfcGFnZXNfZmluaShzdHJ1Y3QNCj5kcm1faTkxNV9nZW1fb2JqZWN0ICpvYmopDQo+IAlfX2k5
MTVfZ2VtX29iamVjdF9mcmVlX21tYXBzKG9iaik7DQo+DQo+IAlhdG9taWNfc2V0KCZvYmotPm1t
LnBhZ2VzX3Bpbl9jb3VudCwgMCk7DQo+Kw0KPisJLyoNCj4rCSAqIGRtYV9idWZfdW5tYXBfYXR0
YWNobWVudCgpIHJlcXVpcmVzIHJlc2VydmF0aW9uIHRvIGJlDQo+KwkgKiBsb2NrZWQuIFRoZSBp
bXBvcnRlZCBHRU0gc2hvdWxkbid0IHNoYXJlIHJlc2VydmF0aW9uIGxvY2sNCj4rCSAqIGFuZCB0
dG1fYm9fY2xlYW51cF9tZW10eXBlX3VzZSgpIHNob3VsZG4ndCBiZSBpbnZva2VkIGZvcg0KPisJ
ICogZG1hLWJ1Ziwgc28gaXQncyBzYWZlIHRvIHRha2UgdGhlIGxvY2suDQo+KwkgKi8NCj4rCWlm
IChvYmotPmJhc2UuaW1wb3J0X2F0dGFjaCkNCj4rCQlpOTE1X2dlbV9vYmplY3RfbG9jayhvYmos
IE5VTEwpOw0KPisNCj4gCV9faTkxNV9nZW1fb2JqZWN0X3B1dF9wYWdlcyhvYmopOw0KPisNCj4r
CWlmIChvYmotPmJhc2UuaW1wb3J0X2F0dGFjaCkNCj4rCQlpOTE1X2dlbV9vYmplY3RfdW5sb2Nr
KG9iaik7DQo+Kw0KPiAJR0VNX0JVR19PTihpOTE1X2dlbV9vYmplY3RfaGFzX3BhZ2VzKG9iaikp
Ow0KPiB9DQoNCkhpIERtaXRyeSwNCg0KSSB0aGluayB0aGF0IHRoaXMgbG9va3MgY29ycmVjdCBh
bmQgcmVhc29uYWJsZS4NCg0KUmV2aWV3ZWQtYnk6IE1pY2hhZWwgSi4gUnVobCA8bWljaGFlbC5q
LnJ1aGxAaW50ZWwuY29tPg0KDQptDQoNCj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ2VtL3NlbGZ0ZXN0cy9pOTE1X2dlbV9kbWFidWYuYw0KPmIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ2VtL3NlbGZ0ZXN0cy9pOTE1X2dlbV9kbWFidWYuYw0KPmluZGV4IDUxZWQ4MjRiMDIwYy4u
ZjJmM2NmYWQ4MDdiIDEwMDY0NA0KPi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9zZWxm
dGVzdHMvaTkxNV9nZW1fZG1hYnVmLmMNCj4rKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0v
c2VsZnRlc3RzL2k5MTVfZ2VtX2RtYWJ1Zi5jDQo+QEAgLTIxMyw3ICsyMTMsNyBAQCBzdGF0aWMg
aW50IGlndF9kbWFidWZfaW1wb3J0X3NhbWVfZHJpdmVyKHN0cnVjdA0KPmRybV9pOTE1X3ByaXZh
dGUgKmk5MTUsDQo+IAkJZ290byBvdXRfaW1wb3J0Ow0KPiAJfQ0KPg0KPi0Jc3QgPSBkbWFfYnVm
X21hcF9hdHRhY2htZW50KGltcG9ydF9hdHRhY2gsDQo+RE1BX0JJRElSRUNUSU9OQUwpOw0KPisJ
c3QgPSBkbWFfYnVmX21hcF9hdHRhY2htZW50X3VubG9ja2VkKGltcG9ydF9hdHRhY2gsDQo+RE1B
X0JJRElSRUNUSU9OQUwpOw0KPiAJaWYgKElTX0VSUihzdCkpIHsNCj4gCQllcnIgPSBQVFJfRVJS
KHN0KTsNCj4gCQlnb3RvIG91dF9kZXRhY2g7DQo+QEAgLTIyNiw3ICsyMjYsNyBAQCBzdGF0aWMg
aW50IGlndF9kbWFidWZfaW1wb3J0X3NhbWVfZHJpdmVyKHN0cnVjdA0KPmRybV9pOTE1X3ByaXZh
dGUgKmk5MTUsDQo+IAkJdGltZW91dCA9IC1FVElNRTsNCj4gCX0NCj4gCWVyciA9IHRpbWVvdXQg
PiAwID8gMCA6IHRpbWVvdXQ7DQo+LQlkbWFfYnVmX3VubWFwX2F0dGFjaG1lbnQoaW1wb3J0X2F0
dGFjaCwgc3QsDQo+RE1BX0JJRElSRUNUSU9OQUwpOw0KPisJZG1hX2J1Zl91bm1hcF9hdHRhY2ht
ZW50X3VubG9ja2VkKGltcG9ydF9hdHRhY2gsIHN0LA0KPkRNQV9CSURJUkVDVElPTkFMKTsNCj4g
b3V0X2RldGFjaDoNCj4gCWRtYV9idWZfZGV0YWNoKGRtYWJ1ZiwgaW1wb3J0X2F0dGFjaCk7DQo+
IG91dF9pbXBvcnQ6DQo+QEAgLTI5Niw3ICsyOTYsNyBAQCBzdGF0aWMgaW50IGlndF9kbWFidWZf
aW1wb3J0KHZvaWQgKmFyZykNCj4gCQlnb3RvIG91dF9vYmo7DQo+IAl9DQo+DQo+LQllcnIgPSBk
bWFfYnVmX3ZtYXAoZG1hYnVmLCAmbWFwKTsNCj4rCWVyciA9IGRtYV9idWZfdm1hcF91bmxvY2tl
ZChkbWFidWYsICZtYXApOw0KPiAJZG1hX21hcCA9IGVyciA/IE5VTEwgOiBtYXAudmFkZHI7DQo+
IAlpZiAoIWRtYV9tYXApIHsNCj4gCQlwcl9lcnIoImRtYV9idWZfdm1hcCBmYWlsZWRcbiIpOw0K
PkBAIC0zMzcsNyArMzM3LDcgQEAgc3RhdGljIGludCBpZ3RfZG1hYnVmX2ltcG9ydCh2b2lkICph
cmcpDQo+DQo+IAllcnIgPSAwOw0KPiBvdXRfZG1hX21hcDoNCj4tCWRtYV9idWZfdnVubWFwKGRt
YWJ1ZiwgJm1hcCk7DQo+KwlkbWFfYnVmX3Z1bm1hcF91bmxvY2tlZChkbWFidWYsICZtYXApOw0K
PiBvdXRfb2JqOg0KPiAJaTkxNV9nZW1fb2JqZWN0X3B1dChvYmopOw0KPiBvdXRfZG1hYnVmOg0K
PkBAIC0zNTgsNyArMzU4LDcgQEAgc3RhdGljIGludCBpZ3RfZG1hYnVmX2ltcG9ydF9vd25lcnNo
aXAodm9pZCAqYXJnKQ0KPiAJaWYgKElTX0VSUihkbWFidWYpKQ0KPiAJCXJldHVybiBQVFJfRVJS
KGRtYWJ1Zik7DQo+DQo+LQllcnIgPSBkbWFfYnVmX3ZtYXAoZG1hYnVmLCAmbWFwKTsNCj4rCWVy
ciA9IGRtYV9idWZfdm1hcF91bmxvY2tlZChkbWFidWYsICZtYXApOw0KPiAJcHRyID0gZXJyID8g
TlVMTCA6IG1hcC52YWRkcjsNCj4gCWlmICghcHRyKSB7DQo+IAkJcHJfZXJyKCJkbWFfYnVmX3Zt
YXAgZmFpbGVkXG4iKTsNCj5AQCAtMzY3LDcgKzM2Nyw3IEBAIHN0YXRpYyBpbnQgaWd0X2RtYWJ1
Zl9pbXBvcnRfb3duZXJzaGlwKHZvaWQgKmFyZykNCj4gCX0NCj4NCj4gCW1lbXNldChwdHIsIDB4
YzUsIFBBR0VfU0laRSk7DQo+LQlkbWFfYnVmX3Z1bm1hcChkbWFidWYsICZtYXApOw0KPisJZG1h
X2J1Zl92dW5tYXBfdW5sb2NrZWQoZG1hYnVmLCAmbWFwKTsNCj4NCj4gCW9iaiA9IHRvX2ludGVs
X2JvKGk5MTVfZ2VtX3ByaW1lX2ltcG9ydCgmaTkxNS0+ZHJtLCBkbWFidWYpKTsNCj4gCWlmIChJ
U19FUlIob2JqKSkgew0KPkBAIC00MTgsNyArNDE4LDcgQEAgc3RhdGljIGludCBpZ3RfZG1hYnVm
X2V4cG9ydF92bWFwKHZvaWQgKmFyZykNCj4gCX0NCj4gCWk5MTVfZ2VtX29iamVjdF9wdXQob2Jq
KTsNCj4NCj4tCWVyciA9IGRtYV9idWZfdm1hcChkbWFidWYsICZtYXApOw0KPisJZXJyID0gZG1h
X2J1Zl92bWFwX3VubG9ja2VkKGRtYWJ1ZiwgJm1hcCk7DQo+IAlwdHIgPSBlcnIgPyBOVUxMIDog
bWFwLnZhZGRyOw0KPiAJaWYgKCFwdHIpIHsNCj4gCQlwcl9lcnIoImRtYV9idWZfdm1hcCBmYWls
ZWRcbiIpOw0KPkBAIC00MzUsNyArNDM1LDcgQEAgc3RhdGljIGludCBpZ3RfZG1hYnVmX2V4cG9y
dF92bWFwKHZvaWQgKmFyZykNCj4gCW1lbXNldChwdHIsIDB4YzUsIGRtYWJ1Zi0+c2l6ZSk7DQo+
DQo+IAllcnIgPSAwOw0KPi0JZG1hX2J1Zl92dW5tYXAoZG1hYnVmLCAmbWFwKTsNCj4rCWRtYV9i
dWZfdnVubWFwX3VubG9ja2VkKGRtYWJ1ZiwgJm1hcCk7DQo+IG91dDoNCj4gCWRtYV9idWZfcHV0
KGRtYWJ1Zik7DQo+IAlyZXR1cm4gZXJyOw0KPi0tDQo+Mi4zNy4zDQoNCg==
