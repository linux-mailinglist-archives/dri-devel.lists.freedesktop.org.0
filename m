Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F96C61464B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 10:08:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F52810E33D;
	Tue,  1 Nov 2022 09:08:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D734F10E339;
 Tue,  1 Nov 2022 09:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667293714; x=1698829714;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0eurQJOh2+tav9bzg7CwG9mJP8nc38C9vsgOEMz6AU8=;
 b=QqhbUF/vv6qabK9vBHy15LxuMIAhOumWOknXcrcsKuMpY+G6k0MrFGe1
 9LlnPkoLO2NhmfxQywGUHe7VrBuGaLO6+7W4xNXomGZwe+t/++Cct8eqN
 m35w6nfOvOKWU7pAJWCbPwCjOz5zMy/FfxCAWaxTAxcmxXFMWcT2TEyp1
 5AAHV8X4znhvil6BfokBu6r+Kr0CmJSMHcvzva5i/xdehSnKYERpHPnpH
 YjLaki5JLghsRA4SYg0xoYNFr6icd+hf3aSRAPv4AHpkQCln4MpZDt96p
 aF99SOBiwDZnrnISHHruyrnl6t4D0xfaPzVfCMfQxv75Akod02uXK6DxP A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="289489264"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; d="scan'208";a="289489264"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2022 02:08:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="879033871"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; d="scan'208";a="879033871"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 01 Nov 2022 02:08:33 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 1 Nov 2022 02:08:32 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 1 Nov 2022 02:08:32 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 1 Nov 2022 02:08:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nus4XVPLUzOyh3LJTS3B8+Vw85oMCj/z3nJgcZYV736l+wUrFjmq9yV/Isdg0R1h9ad055YV0PoSmQoM36Vb/XnvpQmts1NCyyYkveyDAnt/QaFvJsd0e6gm/+a7a0xCS8L0RT+PLn7KFM3DDCad9VgC9ugrweRHCTl1XY+85pLcFa98OJ24DqcC3CEjZroAxdjW1NoEcH/GBgM3vFhCTsQRu5f2KeKMNTtT4PRGgMJjsxQVeXmPEqM18Im0L/SryOh72Di08e/Veqi2OdnB+aBlhjV21k3N8//ntc27kTDGEZ/6XpyhkSCI639gCF5ItiJ2pM+l3ZhyVc4aKJ1ILQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x/Zc9z8WwtsOiSWq+iM3Xyc9MJJI03QXx0ttK++R/x4=;
 b=IXSKxFoNVeEJpESmKzkkhOMTs59vlN9E30u+HMAUz/9Zuuxmr3exHgsrowbeRotbIFbi6bnWkl62M2rVZWkLE9OK7i0O74m+iIBfsZrPenZGvYPkKtcEurZcDZTFfHikkGRIZw+GhtVj0b+xmeIEpxI5WOcjSAPA4f7sljkyt+nU5et3zmyqRQpQR3uUV0QPYHY1T+GsQ8ggJ7CdojjI8qiXmoZXJQV7Xa0H8CGUfnXefEQnyEQHYbQfpR0muGDoOtkGj1ErOF5ZMweVIPThuP909qr/0IgcGE3Keqeh5v6S9dZqM+LdV4/hmawZETKYwab4m7sC6UMJb5ND6YRasw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SJ1PR11MB6252.namprd11.prod.outlook.com (2603:10b6:a03:457::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Tue, 1 Nov
 2022 09:08:15 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7%5]) with mapi id 15.20.5769.021; Tue, 1 Nov 2022
 09:08:14 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Eric Farman <farman@linux.ibm.com>, Matthew Rosato
 <mjrosato@linux.ibm.com>, Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, "Liu, Yi
 L" <yi.l.liu@intel.com>
Subject: RE: [PATCH v1 4/7] vfio/ccw: move private to mdev lifecycle
Thread-Topic: [PATCH v1 4/7] vfio/ccw: move private to mdev lifecycle
Thread-Index: AQHY49b8P2GI9FlBPkaHDp4x02LD3K4p2qDQ
Date: Tue, 1 Nov 2022 09:08:14 +0000
Message-ID: <BN9PR11MB527698B0A9E039268916AA018C369@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20221019162135.798901-1-farman@linux.ibm.com>
 <20221019162135.798901-5-farman@linux.ibm.com>
In-Reply-To: <20221019162135.798901-5-farman@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SJ1PR11MB6252:EE_
x-ms-office365-filtering-correlation-id: ed20d7a2-91ff-4047-8a95-08dabbe89b85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Sjt7AoerAT5tW38TV+GHx5Nf5/C2VUyU8q9oG9Ks0FCBmri/2++MUj8jlwYl5dxK/sFBIENGTPEUJuCiTh7YENLstcbdKu/u7r1/EH1eemHsh3apgKsQK66LsguK2fExb6dHmVuyNTRIar0u3gnlSlo9nKMi5HBGx7/DL7KbhnZ7FvP6eqNukKN51fk72JGMmllm+/8Y0GeBzYLJqYfwcAhNHgK4owpk8l7c6obaIAAhTAxE3XXFXPPQSloTWaSd5luc2POaIgNqYOLwJ73hTlv00tnTazYHkAyqtyMLRpQw8EWxwfa12dZuQfqwdgAmCcPe0ocA8sPABnzE7YpheMKtr9T+Zo0mX/rjZ8HkA4DI1B4TsxNOPcNr0iOZBqCeVW1Z3CngQVOVVRlm3bsGHQ9CHjgK3DP3PfsLJ+5Og2ovXZJzRgooTL/dekXXrttWGXU69tj6/UcEyGzE3+LPijeHCzjBWBv+CW1Oomcd0iZfmELeTnf6KMctL2gfkIB2PMAGEKdp1wMVRwZpihESSPBknaEarpZ7qVMh4GSiuWi7g4ArPNDJNCS8JXI1A0TVPg2rE0BHfizu0t7fhXVPCjth886x13ARH0nYrYnfKkewfFJexEX04PHK3lCmZ1JBltjAy8/z4Xj2mmPL2BJ7Xwy5YD9Jhy9HHdN/246NVD5P9cR/nBXiYPLFjIVnLQ0nQCr6xvJ92OHwAN9ozL+w+MfLC1VlBOelLIwaB0+wckkWCm8hHrTl2w+3DLiistHCWFWeVeyE9SbvULIivHvFlQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(136003)(396003)(376002)(346002)(39860400002)(451199015)(5660300002)(186003)(66446008)(7416002)(7696005)(4326008)(9686003)(76116006)(66556008)(66946007)(8936002)(64756008)(8676002)(2906002)(66476007)(6506007)(38100700002)(82960400001)(41300700001)(86362001)(38070700005)(33656002)(122000001)(26005)(55016003)(83380400001)(52536014)(7406005)(110136005)(316002)(54906003)(71200400001)(478600001)(6636002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JaDtLy20ibVc0dykXdY1UloBw6hcVuxm5fG4/Ah7yLubqbO46bjBoHfHhdFo?=
 =?us-ascii?Q?p58aq/BPzDq4zvhHJN1Y6YUjXPMD5zyPUKWJefv0dOGvWYqVFWCGuNtJbiQA?=
 =?us-ascii?Q?cFsnopV8HjJn+eBjNMiI6PADT0iXjw81v/IyOAsivExnwNEYDfHaRw4e9y9z?=
 =?us-ascii?Q?UzJ9/ozFP4ShxGoaIXgIJ8RNbF6NC279jlCHF7I+8ZGmBEkrpU2jDSg1mkQx?=
 =?us-ascii?Q?2y0/AXS5/hehzhOsTjB+CjptkJHd2MipXOcRetuxP8V61bGzx/K6lf6oe637?=
 =?us-ascii?Q?NXURxGjRDkRmHqy8wYx1c2oXL3xVtNRCJnCBtKix/nlKK3VmOTOnjP5k3DdU?=
 =?us-ascii?Q?18rqWp+s0ruG5vSHVE1A6Z0UCBc90Jb4P//h31qG142fpHLCHVTd+tGUegsF?=
 =?us-ascii?Q?akjzNQLE/pXRQvGvXAWSnaLBYVy2LCG4bRZwfgn7hOBIf+Noxm6XXgml6aK0?=
 =?us-ascii?Q?uIkEKMXaqSlA4fjUSbFB5F/25I1cFjF+f15/9W5MBXvAhcbZVssjMeDfNBYn?=
 =?us-ascii?Q?UAtMET+vI7xaGIs/07AGGiOQnbkshnruByUBCZJN30EhCQmQNOViDIw/mQqt?=
 =?us-ascii?Q?+yGRe9vAwMy/Rc0WYJcGfdW8UHtQ+Vc3oqwhmVAaLdIvxu99LqoXGa1UtfqR?=
 =?us-ascii?Q?av7X42kITw7/xIO0SUYlvPhTBSJzF97W7Mfczhr8skH5T8rhxY25ep7JIlbW?=
 =?us-ascii?Q?m1jp9pHUKXWlpxibKNIVyhwmHgXYhkxTsmNjcWjbOFzVHJRH2vtIzu7dVRbz?=
 =?us-ascii?Q?p4+MuK8aYICYCeQfTJnAq/JyKPfgASDzUSYbUmfQ9pCH54KKBj7lE/qlDnfl?=
 =?us-ascii?Q?k+BxhIb0bAsHkP5EDQemjPibOGJxNOi2hE9NdMSH/8kcOgi532PZMi6DOlYC?=
 =?us-ascii?Q?eqn2fYKS0kZj+Uofc2qPbXUyLfy4ONa3A8LKZjiLwtaTmZDrCWm2abLmQG5P?=
 =?us-ascii?Q?LwAcWEjJGkrpzVnn0DwxgXBPFg3y2zRfqdqdATca6Q4nWCIdOI6TBDZlL3Rl?=
 =?us-ascii?Q?+eYtgQCIavTZrdbtrQckJWU3t4y40jNSwKj3fIz0Ew9biPyIAYsIN5H62nJg?=
 =?us-ascii?Q?4N9FoUqsftcj98ovcw5mqjDwMKLAFa3EKvJSciRu4a4Di/3oUSG5ZYj/H1cM?=
 =?us-ascii?Q?Zj3a1LXhWu3PDkJr1Bw20xiygpOTid6MCzGH9za9fWt5+kdW8cJYh1qsj4Ei?=
 =?us-ascii?Q?Nj+lukgZ5EroYZCM8/f8W+1Fo6y9Byk9XQr7OeUTsQlxyJb1VU5ryTiNDx4O?=
 =?us-ascii?Q?sARdBxnmtVPkNPBMrZgadSf4DbFRwGuqb8JoOaJvnsRjfxZisOqhNe6dGmd1?=
 =?us-ascii?Q?HJDXx33HcBtst58wBH33A7yWFOR+XTKRx2o2SPCJmwIx66q2m1JyNklzqSIL?=
 =?us-ascii?Q?L6y7IFuukSMlXcOJveC18DQf5sjNmrwnETRBzEs0glbbMP1Vm1TW5VJ0PiiO?=
 =?us-ascii?Q?fXybrOISCa44qdgoIky/m6f3ZGEK5RErms9Ti5Wc82uOf1unPXbH2wMc7E9X?=
 =?us-ascii?Q?2PvP0w3Qi7HE+WqoIcxoGXYx7mRR+ypM78T6RKtgnW/KhpylwMoSD8/8d+Ia?=
 =?us-ascii?Q?1nlMCHtwREEy1HUDHLlpct0WPGcyQfEQj1JwpTtL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed20d7a2-91ff-4047-8a95-08dabbe89b85
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2022 09:08:14.1748 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i8AVMrweK8UHOGx6t1jpxcPvmdvRzonst8ys/I9Ce4dfq0OMg6vmjQd5jXT/2pvFw5BuRi671Gv2gFPoNBck0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6252
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Kirti Wankhede <kwankhede@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Halil
 Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, Jason Herne <jjherne@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Eric Auger <eric.auger@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Peter
 Oberparleiter <oberpar@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
 Abhishek Sahu <abhsahu@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Eric Farman <farman@linux.ibm.com>
> Sent: Thursday, October 20, 2022 12:22 AM
>=20
> @@ -101,15 +101,20 @@ static int vfio_ccw_mdev_probe(struct
> mdev_device *mdev)
>  {
>  	struct subchannel *sch =3D to_subchannel(mdev->dev.parent);
>  	struct vfio_ccw_parent *parent =3D dev_get_drvdata(&sch->dev);
> -	struct vfio_ccw_private *private =3D dev_get_drvdata(&parent->dev);
> +	struct vfio_ccw_private *private;
>  	int ret;
>=20
> -	if (private->state =3D=3D VFIO_CCW_STATE_NOT_OPER)
> -		return -ENODEV;

Not familiar with ccw but just want to double confirm this removal
is intentional w/o side-effect?

> +	private =3D vfio_ccw_alloc_private(sch);
> +	if (!private)
> +		return -ENOMEM;
>=20
>  	ret =3D vfio_init_device(&private->vdev, &mdev->dev,
> &vfio_ccw_dev_ops);
> -	if (ret)
> +	if (ret) {
> +		kfree(private);
>  		return ret;
> +	}
> +
> +	dev_set_drvdata(&parent->dev, private);
>=20
>  	VFIO_CCW_MSG_EVENT(2, "sch %x.%x.%04x: create\n",
>  			   sch->schid.cssid,
> @@ -123,6 +128,7 @@ static int vfio_ccw_mdev_probe(struct mdev_device
> *mdev)
>  	return 0;
>=20
>  err_put_vdev:
> +	dev_set_drvdata(&parent->dev, NULL);

No need to set drvdata to NULL, iiuc
