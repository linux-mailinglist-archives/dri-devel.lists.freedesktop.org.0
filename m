Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27619389F08
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 09:41:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B2D6EF2C;
	Thu, 20 May 2021 07:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2108.outbound.protection.outlook.com [40.107.92.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E416E0C2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 05:41:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJgxC0qxEILOkFA5njF6biQyii7jgJ/9dYdc8ZEKJhP+KqVBGSMI3Rmt5JeBB/soj86UzQMqviVN5Q8tDa6uYrIJ5bkk07mgAE6IjZXqbG28OgAiFaw51NYVlboUYZzh75rUJQyruJAIBLPgGLscmdQH0isMoF1WxD2UAaL53NNMvyVFaaCZPxDPmr6VFUja/zAA8JqdLFTGHR4AcdZfErnn3svXCkRMhJEKlQuC2JQCrg/MCE2FmPoOMw7Pw4CBLeTOQwrTeYTEqpyOCe2WAgAQInBLbec/NVU2aeLJ4UkVxfJ7JI8jLohwoPwxgriCLUjBTWQyMVqbpfEedyF4Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EO3Mlry7/WNESUKl9MeiH6OEBfMHqCz/Uu/Va401R8g=;
 b=eRLAsFaQIUKCShIGeLenQqfshvc3HZQ4XtkpWNvHrKdAK+iAmOLvWwNon+Nsju8ixvcCv7hSY904BtWtp6U1/0F9fbw9Qj4XDOezltVutNuSDm1gur9cBV4fRMUiEXAZKyJzmxN33yQGXLEhbC08YHOMaOIHdxTDqCvSqrDrqbuakU0AOd0WcZ6jLxQuYjkwO84LdBJbG2x8jXqS5pxBuqQNeGDetBMPdlCYSqgIEoP6huEroV8YFSqfkS+oFS8xTkaUaPqVJfrw22muJJj/hs0Z3tY2zZXUTaRwGyNpgFWfWTvP7judTS8oYn2KpgtU1kTsW5EhLmWx+LmthxneyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EO3Mlry7/WNESUKl9MeiH6OEBfMHqCz/Uu/Va401R8g=;
 b=Cllj6muSEJV62M3pMeLxxjQQzmMGJNLstl0xwOWBbrE4okYYS580syI00RMINfFGp002I0c5rAVzS2cuKXGMB2J6xrGfQOLa6wK0BSQ9Uz100IPLE5gpfWbVv6nulUUUOPijUE7Sfc7qKZzVMlg2hYRnYbhy9PzoRCTSgINHC8k=
Received: from MW2PR2101MB0892.namprd21.prod.outlook.com
 (2603:10b6:302:10::24) by MWHPR2101MB0809.namprd21.prod.outlook.com
 (2603:10b6:301:76::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.11; Thu, 20 May
 2021 05:41:00 +0000
Received: from MW2PR2101MB0892.namprd21.prod.outlook.com
 ([fe80::c8f7:4efa:d81a:a7f5]) by MW2PR2101MB0892.namprd21.prod.outlook.com
 ([fe80::c8f7:4efa:d81a:a7f5%5]) with mapi id 15.20.4173.012; Thu, 20 May 2021
 05:41:00 +0000
From: Dexuan Cui <decui@microsoft.com>
To: Deepak Rawat <drawat.floss@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>
Subject: RE: [PATCH v5 1/3] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
Thread-Topic: [PATCH v5 1/3] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
Thread-Index: AQHXTM1U5lorNEtIAUG8A6X7sQ43Iqrr2pSw
Date: Thu, 20 May 2021 05:41:00 +0000
Message-ID: <MW2PR2101MB08920209B00F7692FA83BBD0BF2A9@MW2PR2101MB0892.namprd21.prod.outlook.com>
References: <20210519163739.1312-1-drawat.floss@gmail.com>
In-Reply-To: <20210519163739.1312-1-drawat.floss@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=0a61c073-cdc3-46e3-bc79-3635bdf396b8;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2021-05-20T05:36:32Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=microsoft.com;
x-originating-ip: [2601:600:8b00:6b90:9d8f:5c96:de46:7c93]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d7f3cf38-c237-49c6-8438-08d91b51d95b
x-ms-traffictypediagnostic: MWHPR2101MB0809:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2101MB0809F6EDB19D747F3C08A02EBF2A9@MWHPR2101MB0809.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1247;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w2OHtCp3kzUhAqXQspOfQDYpWCW4KgDuDzFJqqjNfQV30c6TRJyorgniVBejwLrdMDhXOqKWl5H7Gd0j/zhn2xDnhOHWeFarskudRoHrEbr1aCR+uSyIkLPrDsWLbcI+3imZEz9FLsYUBRfS0mQnTA0dnDeXW7KrelH1JIdcM5JoI0GBZW/Gl33fN/qxoDjxPb4enm0D4ho9ky3eAEdfNxIsBNCG2Z/lB+XxfOgCCECotHcStMt54ntMuhQNkhJhjH4Q1jussTljTJEJYJpqZM4zWgLHMD3xO0BiwvRUxWaT0Xoh247iBVSm++WRgVp02+2CgM3puQLHi+siXFp2UNwot9KmG5HlYk/V/XxToWnYaxBpIdRFYKdlnfbKIkbJArDvcnWpzt7h9d9bf/k0X45+wxAMQpwcrK9v99EUoCWzi33WC4Xe6d/4OhQhhlUQr1MpAv1rQS2/fOOIXerWI7NKq65gFwjl9OLcWAHc6idX6a2Yw475NciLlHgXH1aGRlDTsZRoBkDbFJxcHU21xRC1yq2C5wjKV6V/M0LWNPltAGe9eWmGC1QymCWEnlfYYpVpOKJEN3HJqjhANCfD1JCGWiNnbw1Ay/P7PJoTI4Q=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR2101MB0892.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(71200400001)(122000001)(2906002)(8676002)(82960400001)(82950400001)(38100700002)(10290500003)(4326008)(8936002)(478600001)(4744005)(5660300002)(52536014)(83380400001)(107886003)(86362001)(66446008)(76116006)(64756008)(66476007)(110136005)(66946007)(54906003)(66556008)(316002)(9686003)(186003)(55016002)(7696005)(6506007)(8990500004)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GeQgSEidKebF7fo384Bbo1n9Y7DOlegqksn2st/6uNKJMxTiB4WbYmifRPBk?=
 =?us-ascii?Q?olneP3zAYSaK+wOjXa486T9joNmRXx56ohVEfZt6tDmAdkXZP3R6cWmiTjuW?=
 =?us-ascii?Q?dxeiOW1O9ipOx1OZ8enQSX3bmL5I9sS0KUt805/Jv1fY6BjEfJoH4QG9C/Pt?=
 =?us-ascii?Q?4LR/vKeO8Ro7iKEQ4lTVCVspKQrsYmDjezBcL1IqUQzQXt41UoIgYBa4+0i5?=
 =?us-ascii?Q?dt+YDNK1e7pjUTUwbGoSTnLhmvTYcV8nzwHTkaNt+VPpDEPdWDOMceFf/gMd?=
 =?us-ascii?Q?6kV1AW1LkLETPQIs8+J/7DvVPePpFNo8vpz8RF3qCTtpX0KLvxqHHFL7pCYh?=
 =?us-ascii?Q?vCbt6SE/WaLolUxZMIJufy2/SIH14PqRrguj2qOkwVAwJgTDBDMU0e9ElcZX?=
 =?us-ascii?Q?DOH8SE2qh/nYK4YsMt7RbXuRINgVEmdWSDoYptBMxFYV4pY4Re9CJScP9gcL?=
 =?us-ascii?Q?LUJABItbZNN/IztQ1yvxKnxh7n6EjjeXZ8Kz4N4CgA+J9F9vax/TrxcZsqnn?=
 =?us-ascii?Q?Q8qUov4rGzRUtA9DojDo0910reEisyOX3tOPmFYPdv/VT/wi66/ZN44paJnO?=
 =?us-ascii?Q?+sKXRbvCa9t2hpRJnjHJVEIr/65AbgrTDMbblamPPuqKahWFvMQT7BfnCnml?=
 =?us-ascii?Q?Qajb0i58Dg6pT1UkkRedIo6BjG+KNg3RxLemOxx3x/vZkI0FEi+gz0gOEDYt?=
 =?us-ascii?Q?kBD21P+FiqwPlJyk6d+523K9iy+vMK/xA8sIqnoxF5OUDQOZiac/Cei7gFgo?=
 =?us-ascii?Q?aFHLYGXsyXj5p9omLILPWHAfpq/lzY2rD+9Wn84/Ex7f/3e4z173aIJbQQdE?=
 =?us-ascii?Q?iUy9Bax0jVMpLsKk594kGh1nKGqMzdawMiB1qV+xDSNfdBTvrfbyGrusHYb/?=
 =?us-ascii?Q?LJ3Uwwdp0ksi4IkpIYEJei15Ou2VM0pos1bEfr3n5jZAjLO31CK30ZwSbenQ?=
 =?us-ascii?Q?D+Bx/V+0wGRgh8tY/op+JzOmedyGKBeoVlar2e6w?=
x-ms-exchange-antispam-messagedata-1: l62AkmtbLeHi+DGbt5r4pv1f/j3Z3/EjDNIm9NsTRziweQM3OM+Uo7geNzzCJWyD/IypwCkAFONrXjvSMdWvnK0Q3eUm7DZmJCdEmCp9ujCOgu+zbLc2rJvHkFCjv3FjDy1jNxYm4Wqbo2YUQh8dJ+xgFcHxSnnzvo3V4xieOREl+iMn+XL2U2mAC45388htncFPmpj86hetX/OJ/qqhXWh2n1CI8HRF4MBOnDpJBbfhlEbjUVCp+gzhHC6OT/zKBXsbj+DsQCoEfvEjLVq7HWr8Gi951icNfJUxmY3yuKuG/IDW6uvS8Htj7rMI3pSF0rlCt+VncDZFtw2D2DXRSGSbfptWeqXU1vL4QeIk7mR4psHniYYq2Di4oL/nGMJqWOf7hpadkFvNyO5DevyqR0so
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR2101MB0892.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7f3cf38-c237-49c6-8438-08d91b51d95b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2021 05:41:00.1730 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rlaP5BRvQ2ibaBXSkyTfKwGs97P3jxs394lOWG5HRJ5DNScAg8+dYioIAxLdhM/MkzeMLDAU91oRsyA5p6vYtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2101MB0809
X-Mailman-Approved-At: Thu, 20 May 2021 07:41:41 +0000
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Kelley <mikelley@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Deepak Rawat <drawat.floss@gmail.com>
> Sent: Wednesday, May 19, 2021 9:38 AM
> ...
> +static int hyperv_vmbus_suspend(struct hv_device *hdev)
> +{
> +	struct drm_device *dev =3D hv_get_drvdata(hdev);
> +	int ret;
> +
> +	ret =3D drm_mode_config_helper_suspend(dev);

If 'ret' is not zero, return immediately?

> +
> +	vmbus_close(hdev->channel);
> +
> +	return ret;
> +}


> +MODULE_DESCRIPTION("DRM driver for hyperv synthetic video device");

s/hyperv/Hyper-V ?

