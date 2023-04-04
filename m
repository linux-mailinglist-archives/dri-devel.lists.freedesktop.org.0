Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8806D685D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 18:07:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C1810E6FE;
	Tue,  4 Apr 2023 16:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR00CU002.outbound.protection.outlook.com
 (mail-centralusazon11021026.outbound.protection.outlook.com [52.101.62.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7199E10E6FD
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 16:07:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hx8soCSC+0xID2J39rIEkNbtUVCEKhbtf5v+dhi6x+wHjcVXMXfdpSwtHtCJy/f8AgwYgjQlb1T0FSCxvsHrLPKqtUcPMEY/utyC9KnK2Yly/77kL6BOmsUjDWrcz/FBGRlGAQ2kNtWofe3wWcH3nlSep+Sa+f47eEdzdzocddmjh0Sdw6sHvh2oCXKM0dSXo0lpW3d9HO1iPyC78vfl7xRcsSAkNYGxjcAx4Gx5dRsB5ubJK1LdtmOX2WsTCAl+xskNnMwb4pjZ7GBJWJL6CgtcCU4Lr08UZa8432ed7EMhJkMPgt6rM6w1nbP/TgqosevOzXOyPxXeKg8Gzr/wqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=upARG9331Xqmjlo9OwbOFmQAoTrZq31GYWM8KezR0CE=;
 b=PVA7QK6l15pUd3amnj/M8gW8Dgk91bcC+jL0qWbVxRhhGOPUC9XS8Law0lMQgbTuOU9FcrzSQr5hGiFNHEq61JjkjQ84B8eajIK81hSN//GPCGzYH0rCQGW9D6lG1JdU/f2aoSvvj6L4wXIFuFpNLFNTtJMBbLiWRGgFGrq5YB1z8TcFg6YDvembhYOqMpcxUjrZiRVwzLRoWKSD7Ja8e8UO7LsED7cedbpm/8kZxYKNi8hLvZxXu9LOIqp0TjTxiir+psEUv+G89C8q5PSfbMVBUm5uAC/hh2dI0OyoEbnKqs3jhHLKO1j6P9H2YSbIPFevP6+kMlwB8Sl7OaogxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=upARG9331Xqmjlo9OwbOFmQAoTrZq31GYWM8KezR0CE=;
 b=jtFNMIlhPQ7jG/YQGQDPaqcBW2lECv3/hcQsBLOBlxY/uKhsCytZtXiCZ4T+b0XYqpiWB0PKiX4iASoHbtzvGN2kxoyfeSHGZAbMOGBHY42mQDKNJHPj02QURJQmnV2kf3qlEQR/mVrZ8c6BilEzqoyxrc+Bx/rieU4ysfdiflU=
Received: from SA1PR21MB1335.namprd21.prod.outlook.com (2603:10b6:806:1f2::11)
 by BL1PR21MB3114.namprd21.prod.outlook.com (2603:10b6:208:392::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.8; Tue, 4 Apr
 2023 16:07:30 +0000
Received: from SA1PR21MB1335.namprd21.prod.outlook.com
 ([fe80::2e52:d6aa:9a99:500a]) by SA1PR21MB1335.namprd21.prod.outlook.com
 ([fe80::2e52:d6aa:9a99:500a%5]) with mapi id 15.20.6298.012; Tue, 4 Apr 2023
 16:07:30 +0000
From: Dexuan Cui <decui@microsoft.com>
To: Daniel Vetter <daniel@ffwll.ch>, Deepak Rawat <drawat.floss@gmail.com>
Subject: RE: [PATCH 1/2] drm/hyperv: Add DRM driver for hyperv synthetic video
 device
Thread-Topic: [PATCH 1/2] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
Thread-Index: AQHZZvhTYYwrTZ9tO0GqR4DA92xIWK8bTAsA
Date: Tue, 4 Apr 2023 16:07:30 +0000
Message-ID: <SA1PR21MB1335DE8A38834B824F1692E7BF939@SA1PR21MB1335.namprd21.prod.outlook.com>
References: <20210102060336.832866-1-drawat.floss@gmail.com>
 <CAKMK7uHRTcdZxreD5ymc2TsV9LNePeR=JgvJbnO-q2_wN99kEA@mail.gmail.com>
In-Reply-To: <CAKMK7uHRTcdZxreD5ymc2TsV9LNePeR=JgvJbnO-q2_wN99kEA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=301d13c6-c9d9-41c6-b734-de9d5a887736;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2023-04-04T15:49:07Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR21MB1335:EE_|BL1PR21MB3114:EE_
x-ms-office365-filtering-correlation-id: 3c92aa00-afb0-4e20-b7fe-08db3526b15c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vjeXtsk+0wHmcMZbmrXAeb40Gj5ZyRJJdHuAI8W8nh19PhFGmnxBger+/OdRi4Gx99zfSDHttP2UnngZGNBHsqfkxnMT352IAV26HLd2Leqmb2HgbyRUZzCDXnjgdYASVI281sWUfBjJqK0MvHwEGbBEx40sIlqCZQyjInJUHyiaiD/T8X6ZvPK2NeJ5vSXwtEOQQkmCllBbu8L0PiYCL6pqd+HBJOj6bgtbReryX1rXWhCrRG7aARoOodrUDFWHDaj0X6qMzdofSniQdwaCzXiywxi0ZHTz6YwWzNz1I6is8LZPGfPaHbWdWOhRO9d+qBJe8WaJAKgC0BR7W24Ee+VxER1D/abWxFEl21h8mg0BBcEEXNtK2fEbfywpwzqUP7oIaVzqOgtqUlI4/0vyqC3oa4IGAul99ee4HBAn4cDE/kk5imfmSHK/toAxwZ3ENRqclJq1mKDQhHKKHEHONm9nYcuz8jT6QlmU00AqAwpbIFCGh1kcPjOUYNGTV79APd59Yw09ilPkov2qVCF9645cZdk3uijIyyyobiS3BzWvJilIR7nWQ6YUw7AiI7Fq98YSNSPTvaL8DZSVH5eWFIPvO3GYR+xpGzqJ8sh4X5J25Y7djf14LeBr9AgIUkpB/XuHzebFHPpWNNnAvMnyhQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:cs; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR21MB1335.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(366004)(136003)(451199021)(66899021)(55016003)(316002)(82960400001)(82950400001)(110136005)(122000001)(8676002)(41300700001)(6506007)(66946007)(66476007)(66446008)(76116006)(786003)(64756008)(4326008)(66556008)(9686003)(186003)(26005)(10290500003)(478600001)(83380400001)(7696005)(38100700002)(107886003)(966005)(38070700005)(71200400001)(8936002)(54906003)(52536014)(8990500004)(5660300002)(2906002)(86362001)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9/2LP0DTtuQdPCB5UgBSfqCD0RY7jBOwgQPoaWRVMN8kHImoqJZPGLrR7Rgf?=
 =?us-ascii?Q?vMv9Mk0WESEqTbcUK5IbOQ9G3NWrl6N+LdPnvNUUc1tHvL8PNG72Eqw1ivjL?=
 =?us-ascii?Q?HsVAIIr0uPLRG1B39EN89D5q+XmIugeXsXyHOLwPxPFzg0c8kP20XJaMs1YV?=
 =?us-ascii?Q?pIdfKe65ma34jALFp2ZY5xgKLp+O3h79vrt3Qap+0GSCrzFexbCh2CZLb9tO?=
 =?us-ascii?Q?mZTGU4s5Zb5Qvy2XuYEnum8HKnJaOMhdMJzeSW3g51XbzJW/eX1WYESNQmVb?=
 =?us-ascii?Q?VOREehMKgbZpBPlYxauQ8RSa2QQLaevuApxOSIJr/6sXiZ37qL1hkL2Z9phH?=
 =?us-ascii?Q?MXRxMm58Co0t9G2eX3ERMm1pKSMNqTgNs0NzenCMIv4E9vQhklSWTeCgTQg0?=
 =?us-ascii?Q?P8LMh2xXa9eugBFBOUB+UABNmgtiv4Md/q5clk8XJTqXbJsy1T13aeIfREVK?=
 =?us-ascii?Q?Wlqc2ra0ecjY0GHyp88FkkcLHg6IuJaSD129nOxKattKMUWe1Ztrx5Z4PRpz?=
 =?us-ascii?Q?NliHl0eqglgvP4L2Y6gblPQnHvEP1zuHyVkQXg4kOCtP4YF/hVWkJ8dRl4gh?=
 =?us-ascii?Q?ZWCzBmD4jLMmbvctQl0pKYmI6ijvBT85h19qp8033GxaPj5HT2Wr5KPQgYrb?=
 =?us-ascii?Q?E1j57fDVXtTK7fixh53l2fCtNtfg58b+/NYR3axh36FuRc3ZOLOdzPUWVEBh?=
 =?us-ascii?Q?nStZI6XKgRSTBz/PlTEzbagCl/eU962sBFARfpA1FA6aBFc6ZAH7d7m7xwyh?=
 =?us-ascii?Q?ID40znN0kVOLUDYhs4GHtffCaybfHcqz/r6GVyTb/AA3b0KXDuy0akTRSJWo?=
 =?us-ascii?Q?mWey8Evsj5+WZIA9spWrUKGQQB9O5DWoYEyZ54rMy3puWQV0xsHzS0cN+ngG?=
 =?us-ascii?Q?u/7totFgpgY+JTnNfDarUVMaIBb0SSEhybwFckGXgdcOnCy3JSo5Fo9IJjqj?=
 =?us-ascii?Q?8RJ04KnyUfUmg/zbGHqjWiL7HH0W3QJCN5PL+3UFcszzw4DbNXd5Zf+d2A8g?=
 =?us-ascii?Q?FVebhhhZe9yXhlIcolKNFHX2y44pFo6G/07cphj5yI7RUBNMhN/UV3s7EAjl?=
 =?us-ascii?Q?e7I6Aa5u+wI+zGuUpy3Cu368zr52M7FSImBChDPkkLfw/bXt4LLDE4Lg734Z?=
 =?us-ascii?Q?UzqZQO0ER9CQyYfj9jGOSvcTRzxzvg8Zy1X+YQMEkessyFv4kWdEclx8HNUg?=
 =?us-ascii?Q?kfUontu1faggC8o+xakAzFeGVnP3lLnCkmIp8mIBvuvuc5q/IdP7+2c9cM/l?=
 =?us-ascii?Q?YEFcwPhhc9XKE/3acbvaGn/H6jz2Pb0mG6Kbba5WjSOtvB0piWbY4yuXnSkP?=
 =?us-ascii?Q?3xX1HKvO+WjF66NrWPCnAY27M/r4Iji91jskDulUY1Z7bNehtdJ9uUD39VY1?=
 =?us-ascii?Q?1SrIlI3DD3UOrx095MOF2M0XY6CC2va2KIJ7RirT7jZWVzkzlpMHI1aQXcXv?=
 =?us-ascii?Q?RtT/HY//w2Obckt+28G3Rf/ov+oRLziK6qgkDAI/xX59TpGTfmhnVCFYsA7d?=
 =?us-ascii?Q?T32IGE/D7vk+MO+cfp7uCn3Lu3b+fj4DQwn6KBOwjRNH+jIEEPlx6A2B5oQu?=
 =?us-ascii?Q?EC1Crct0kQ7eoFXRkailrUhyIaiO0COHPZHX3Jwj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR21MB1335.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c92aa00-afb0-4e20-b7fe-08db3526b15c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2023 16:07:30.3565 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ssliyOlquh64WsmXNp3gWgh30PgmeTXqXyrofz04Lu3rS9uBfcAZGHBs1totjC2Wp0Ne16GIb20+Z5UT1zvq4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR21MB3114
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
Cc: "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 Wei Hu <weh@microsoft.com>, Tang Shaofeng <shaofeng.tang@intel.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Michael Kelley
 \(LINUX\)" <mikelley@microsoft.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Daniel Vetter <daniel@ffwll.ch>
> Sent: Tuesday, April 4, 2023 6:21 AM
> ...
> On Sat, 2 Jan 2021 at 07:03, Deepak Rawat <drawat.floss@gmail.com> wrote:
> > +/*
> > + * PCI/vmbus interface
> > + */
> > +
> > +static int hyperv_pci_probe(struct pci_dev *pdev,
> > +                           const struct pci_device_id *ent)
> > +{
> > +       return 0;
> > +}
>=20
> Why do you have this dummy driver when it does nothing? Can it just be
> deleted? If it's just to have a driver, then we really don't need that
> on linux, there's no requirement to have a device driver for every
> device in a system.
>=20
> If you actually need to make sure that this pci device isn't passed to
> a guest vm or something like that, then the main driver must ensure
> that the pci driver is bound (ideally with component.c because
> otherwise you'll get the unbind/rebind dance wrong in one of the
> bazillion of subtle ways). Just having a driver doesn't stop anyone
> from unbinding it and then wreaking havoc.
> -Daniel

The hyperv_drm driver is a DRM version of the device driver for the
Hyper-V synthetic framebuffer VMBus device. Originally the device's
driver is hyperv_fb (drivers/video/fbdev/hyperv_fb.c), and commit
7ad968472160 ("hyperv-fb: add pci stub") introduced the dummy
pci_probe function in hyperv_fb:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D7ad9684721606efbfb9b347346816e1e6baff8bb

hyperv_drm just copied the dummy pci_probe function from
hyperv_fb.

When a Linux VM runs on Hyper-V, it can be a Generation-1 VM
(legacy BIOS) or a Generation-2 VM (UEFI). In a Generation-1 VM,
the framebuffer device is presented to the VM both as a Hyper-V
synthetic framebuffer VMBus device and as a legacy PCI graphics
device. We'd like to let hyperv_fb or hyeprv_drm control the device,
and would like to avoid any PCI device driver for the legacy PCI
device, so commit 7ad968472160 uses the dummy pci_probe
function as a trick for this purpose. The commit says "Another
effect is that the xorg vesa driver will not attach to the device
and thus the Xorg server will automatically use the fbdev
driver instead."

As you pointed out, I suspect the unbind/rebind scenario is
still problematic, but AFAIK normally nobody would like to
do that.

Thanks,
Dexuan
