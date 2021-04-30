Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9844336F54B
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 07:19:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051A26E222;
	Fri, 30 Apr 2021 05:19:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2085.outbound.protection.outlook.com [40.107.236.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A23D6E1B2;
 Fri, 30 Apr 2021 05:19:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CZf3/mQOkUnG2GiJ8rb2HK0GQzNGtPGXNbi9FeHl5CeqeFDZ1wxEggaArRtenDSKkFY1oPL0/NATkbFBHZGqlhxBl+Jui2TLnTP17SEwPZzrD9abqLpl2mNUHSMukfKbLPyC2JCB+Wjh3CvZ7d+q3O05cQxuiF3fP3gAoV5SJTW92qbsizMFyUA/y8UnCIEE03iHnlu7MuVPiqyqDlQNiTsvkdL3zT9TQO3UAfKBEO3TFfkbljMY+/yrIqytEqR6KIGrVK6sF0cx/dSEf957edZhlIwS2egy5f4m+mKNxbh2hfZ/ehn19kHp/XQlvG1V/Cxhc5y9WoayElpyimtGtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CrqIvttMD9QMihOYw7EB0C22L7H2XV151Jf0RhcG7qo=;
 b=gKb36XekUBx/lj2qQs7J+TTAevE5SsNbSoSzfkMvbnZYHFzVcJM56wT9QoruExOdaZ7h5e61e6zNnDXTLZcOINhE0zHvx3qzq6Nh/grlpY90cPgR/9Ji49IF0wADqoHbTEXshDgnBHZJ3eZIVlCzlSQvEbvYt/q2UxJdV5fYhmuzySXz+7J2gvYPnCVPWGE4jRQsayyc6qwsK8GR2kRoF6A6v9jEKKpFiVc8+B+fXjO/yk5z9px6j0aF2IU1HAATFj71sCwLmVte1UG73IjYbgDwbXpQUJ92TfhRIolnfOPst79x3tMKPhDD3DdIKsPGV27jX5QXGs9os08CZbPAdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CrqIvttMD9QMihOYw7EB0C22L7H2XV151Jf0RhcG7qo=;
 b=3ci83r+zTR8kg/l5Xn+ODl/N2422UrvEBP676R3pVyb6ZJfTCBRyuGghoLCFHxNg0FJwXv1ux5T3AYY0U819ICvG0jHZQ4rn79ON4dRewAXgwOT/VJCzYGvQ/HHtlcJxbwTmnpnvDOiUsu3rrjLh7K72HDr2s2LFEqYwDTFCUbQ=
Received: from MN2PR12MB4549.namprd12.prod.outlook.com (2603:10b6:208:268::15)
 by MN2PR12MB3680.namprd12.prod.outlook.com (2603:10b6:208:169::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Fri, 30 Apr
 2021 05:19:02 +0000
Received: from MN2PR12MB4549.namprd12.prod.outlook.com
 ([fe80::b83b:b880:25cc:c1b9]) by MN2PR12MB4549.namprd12.prod.outlook.com
 ([fe80::b83b:b880:25cc:c1b9%8]) with mapi id 15.20.4087.035; Fri, 30 Apr 2021
 05:19:02 +0000
From: "Lazar, Lijo" <Lijo.Lazar@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>, "Wentland, Harry"
 <Harry.Wentland@amd.com>
Subject: Re: [PATCH v5 03/27] drm/amdgpu: Split amdgpu_device_fini into early
 and late
Thread-Topic: [PATCH v5 03/27] drm/amdgpu: Split amdgpu_device_fini into early
 and late
Thread-Index: AQHXPED31dtAN1Hzr0610aKd3EouaKrMhrjr
Date: Fri, 30 Apr 2021 05:19:02 +0000
Message-ID: <MN2PR12MB4549896A55131D4A327908E4975E9@MN2PR12MB4549.namprd12.prod.outlook.com>
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>,
 <20210428151207.1212258-4-andrey.grodzovsky@amd.com>
In-Reply-To: <20210428151207.1212258-4-andrey.grodzovsky@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-04-30T05:13:53.2822074Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [106.208.139.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6b2454d0-e3d4-43ed-5a02-08d90b977788
x-ms-traffictypediagnostic: MN2PR12MB3680:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB36801769DA36914767C0DB70975E9@MN2PR12MB3680.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1468;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 23SK4Eq9j4MTk0SwY3pvQXE5KXmxxkQcf3j7GCzaiPaMksSKc/HdIi07zfo242lUe9Fh8gLqgyFDLwb//bBTfVb9jjpXxRDLpz58CAZAxpIF2B06kbV3OyMtaalAVEwamyVjisowDmSOhSjQV3aqt/J0DKKhuycnBMA98MEcZg2zRx9ZhGTBhlgnzRtkeumlqA2EGpQNIcYNnkmDIeoH0Rbx0iMwZIeUyIb1REy5gR4okDwAo1xntlhx0fZhxX/m3u+zw2NX1sBS/4J6w6HA4RMUlyexqaSPxuWjufo0JcvI3JH0YFzgJZiaT9gWZ8hoGeX2MmRYIxSP/H8WCrv5vL8qbOvJJqgHW88byObV2lrxEwgijxHmR7ZhnJVRaNAZxBi7cYbuMqKTuTOK5IMlZcTpSjkPwpl2nPyHxv0e5opFfrXJxVdFoJ1rTV3d4bFRCXZZh9jWRjxE0vUzd7gzds9gb5KxgUPPWKGE2lH2i4g9L9zrobQbMQda9TqB4KFBf8PJCj/Z+iAYc9hsY5Jee8UDwTY3ZhmCcbj3U72/FNZIEsvVeC+Sd7Go19H8Yc5i5GlbM6pFUFJhuCg4qAFo6VQwNvejKN+0lxWMBGc3nyWtkRGVekTialxj4fQ+q/4woilrkvGQaNW0+iXhanWhbQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(366004)(376002)(396003)(136003)(53546011)(52536014)(6506007)(5660300002)(966005)(86362001)(71200400001)(64756008)(66476007)(66946007)(8676002)(6636002)(76116006)(8936002)(91956017)(33656002)(2906002)(54906003)(7696005)(66556008)(166002)(478600001)(83380400001)(9686003)(26005)(186003)(66446008)(55016002)(38100700002)(45080400002)(30864003)(110136005)(316002)(122000001)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?WkBeHg4wtCUjhsUPq7owC3KyGmtA6OwY4cEaGVdipzRznRMZc3iKDzOdRfc6?=
 =?us-ascii?Q?wMefc+C9oWVjz6QIrMWVCCWg1x+LKUSF+92KJPALKJejraIriviBiOLcWTpw?=
 =?us-ascii?Q?Hxo4QGjzYFb+QJqBd6YScev2fP6Zq4LAV5AEwBVZMmaJ5Nc5BO3/RdBlc16g?=
 =?us-ascii?Q?jSNSdsRrrC8+E7cgp3Lrv4+YKAd+JdO7zEF3eskD4vh/cRw0COX1+eDqQRn0?=
 =?us-ascii?Q?IkJMW/HaIfaOJfCmDhATysxogAeKQi7FvwFIZWhD4ktfU7FqTmlHFiFFNGKo?=
 =?us-ascii?Q?3gd6xUZd8Zlj5Y9xK0mwxa/qAh0lVtzhwgRoxzc/dcugusmmoymh79MuY1gk?=
 =?us-ascii?Q?Y1lHvCNn2Nygoh8mf4sKoSxBsE6Q8/NUOcCLWwmaqJR9Ast+WOya7zz1gdRk?=
 =?us-ascii?Q?2Wtysu9hI3eIO17UFMPgCzNKbtg6hR75OC+TUEbmRnYSls+2h31FzvEE9tf2?=
 =?us-ascii?Q?h98v32LAW4yxUuafgVli0CXR/AnJxKp/22gVn0oyvvX+NYM3wjRmFSD9lEtp?=
 =?us-ascii?Q?NJCG6am6Gw/5CgH99kQVQalKZg42BDlbSai6NKIEeFYvSCBu/ArUL7pE0e9a?=
 =?us-ascii?Q?t7r8oAxrj68CRS5yVquo5lwCiG7oAeW5mhHVsUYKvybw8HfVnlfMY5RiYxFG?=
 =?us-ascii?Q?+aTPiqXjuR6Q8uqgaUIdQdxz36F9w5/26dFMJU1OkFshFiWu5nQgYCEa2ZJG?=
 =?us-ascii?Q?YzcyEQzXpiyoBDl5axTwvw5IRhhH5iOMBe6+zQdQNIOM0BdX0eFa2H6m7i/G?=
 =?us-ascii?Q?eMHnEOUszp+JEooKHA0RuL6QGKc1PRtP2ubPnjD3OwkSwqA5rsAReqfM55s3?=
 =?us-ascii?Q?SA2+kNILrlck8W7i8QygpNm89kq4DVwXghuSX3OsaBwkeGKQaesUXKJRBhL/?=
 =?us-ascii?Q?l6USdIQFiipajqQ46OTyU6mCF+hmQQ7NHkRVsuCnAgBar+mhfSYD1nPGWVQ3?=
 =?us-ascii?Q?sIPT+hNg9aPHSciwOHnVFyHv1SgyYXKNZiLgHj8399DSivpnLJxoiGuy/ztH?=
 =?us-ascii?Q?Ox/2+mrYkdGiqN0U5hjbT/f5B9O5GLuOpJqpJF+CwSbZ+Gm2W2QN3vhOG5nP?=
 =?us-ascii?Q?gyUlHhaEVeyMwMMHzs1MKxWzQM704g13j5hv77h9W6JEWqKP/R+7/fjI5mZd?=
 =?us-ascii?Q?tDyQVd10Wtr6OflnotnF4CG5Loo2X0+ZeRPI23ttgZ/SHbs+ufW5zFMfJBIs?=
 =?us-ascii?Q?oHMP9ty/IwaUFuKZQhUqVGsJ3h5xtTPshbnv3foAC0pyK8vuvPngHjtK9ncv?=
 =?us-ascii?Q?ffhtdgsL2mZ/v6or92Lv0WXLqq2hyoXwswdwZ7L8t90Gz5QF3lTItbZyW3H9?=
 =?us-ascii?Q?9FkXhGpof95NVakMp1Rm++gdZ3L4r9Opt9yu/O9AvP4igg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b2454d0-e3d4-43ed-5a02-08d90b977788
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2021 05:19:02.0210 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aB37qf9jG0BY3BPSXf1pIZt7id95ATvw1yfrU/2VUGV+v2+1XG62wPHBMq8bOkno
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3680
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "helgaas@kernel.org" <helgaas@kernel.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: multipart/mixed; boundary="===============2023377657=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2023377657==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB4549896A55131D4A327908E4975E9MN2PR12MB4549namp_"

--_000_MN2PR12MB4549896A55131D4A327908E4975E9MN2PR12MB4549namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - Internal Distribution Only]

sysfs cleanup is a sw cleanup to me but done inside hw fini. sw/hw separati=
on is not strictly followed, or name it like stage1/stage2 fini.

Thanks,
Lijo
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Andrey G=
rodzovsky <andrey.grodzovsky@amd.com>
Sent: Wednesday, April 28, 2021 8:41:43 PM
To: dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; amd-=
gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; linux-pci@vger.k=
ernel.org <linux-pci@vger.kernel.org>; ckoenig.leichtzumerken@gmail.com <ck=
oenig.leichtzumerken@gmail.com>; daniel.vetter@ffwll.ch <daniel.vetter@ffwl=
l.ch>; Wentland, Harry <Harry.Wentland@amd.com>
Cc: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; gregkh@linuxfoundation.=
org <gregkh@linuxfoundation.org>; Kuehling, Felix <Felix.Kuehling@amd.com>;=
 ppaalanen@gmail.com <ppaalanen@gmail.com>; helgaas@kernel.org <helgaas@ker=
nel.org>; Deucher, Alexander <Alexander.Deucher@amd.com>
Subject: [PATCH v5 03/27] drm/amdgpu: Split amdgpu_device_fini into early a=
nd late

Some of the stuff in amdgpu_device_fini such as HW interrupts
disable and pending fences finilization must be done right away on
pci_remove while most of the stuff which relates to finilizing and
releasing driver data structures can be kept until
drm_driver.release hook is called, i.e. when the last device
reference is dropped.

v4: Change functions prefix early->hw and late->sw

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  6 ++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 26 +++++++++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  7 ++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  | 15 ++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c    | 26 +++++++++++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h    |  3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c    | 12 +++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c    |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |  3 ++-
 drivers/gpu/drm/amd/amdgpu/cik_ih.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/cz_ih.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/iceland_ih.c    |  2 +-
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c     |  2 +-
 drivers/gpu/drm/amd/amdgpu/si_ih.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/tonga_ih.c      |  2 +-
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c     |  2 +-
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c     |  2 +-
 17 files changed, 79 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdg=
pu/amdgpu.h
index 1af2fa1591fd..fddb82897e5d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1073,7 +1073,9 @@ static inline struct amdgpu_device *amdgpu_ttm_adev(s=
truct ttm_device *bdev)

 int amdgpu_device_init(struct amdgpu_device *adev,
                        uint32_t flags);
-void amdgpu_device_fini(struct amdgpu_device *adev);
+void amdgpu_device_fini_hw(struct amdgpu_device *adev);
+void amdgpu_device_fini_sw(struct amdgpu_device *adev);
+
 int amdgpu_gpu_wait_for_idle(struct amdgpu_device *adev);

 void amdgpu_device_vram_access(struct amdgpu_device *adev, loff_t pos,
@@ -1289,6 +1291,8 @@ void amdgpu_driver_lastclose_kms(struct drm_device *d=
ev);
 int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_p=
riv);
 void amdgpu_driver_postclose_kms(struct drm_device *dev,
                                  struct drm_file *file_priv);
+void amdgpu_driver_release_kms(struct drm_device *dev);
+
 int amdgpu_device_ip_suspend(struct amdgpu_device *adev);
 int amdgpu_device_suspend(struct drm_device *dev, bool fbcon);
 int amdgpu_device_resume(struct drm_device *dev, bool fbcon);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_device.c
index 6447cd6ca5a8..8d22b79fc1cd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3590,14 +3590,12 @@ int amdgpu_device_init(struct amdgpu_device *adev,
  * Tear down the driver info (all asics).
  * Called at driver shutdown.
  */
-void amdgpu_device_fini(struct amdgpu_device *adev)
+void amdgpu_device_fini_hw(struct amdgpu_device *adev)
 {
         dev_info(adev->dev, "amdgpu: finishing device.\n");
         flush_delayed_work(&adev->delayed_init_work);
         adev->shutdown =3D true;

-       kfree(adev->pci_state);
-
         /* make sure IB test finished before entering exclusive mode
          * to avoid preemption on IB test
          * */
@@ -3614,11 +3612,24 @@ void amdgpu_device_fini(struct amdgpu_device *adev)
                 else
                         drm_atomic_helper_shutdown(adev_to_drm(adev));
         }
-       amdgpu_fence_driver_fini(adev);
+       amdgpu_fence_driver_fini_hw(adev);
+
         if (adev->pm_sysfs_en)
                 amdgpu_pm_sysfs_fini(adev);
+       if (adev->ucode_sysfs_en)
+               amdgpu_ucode_sysfs_fini(adev);
+       sysfs_remove_files(&adev->dev->kobj, amdgpu_dev_attributes);
+
+
         amdgpu_fbdev_fini(adev);
+
+       amdgpu_irq_fini_hw(adev);
+}
+
+void amdgpu_device_fini_sw(struct amdgpu_device *adev)
+{
         amdgpu_device_ip_fini(adev);
+       amdgpu_fence_driver_fini_sw(adev);
         release_firmware(adev->firmware.gpu_info_fw);
         adev->firmware.gpu_info_fw =3D NULL;
         adev->accel_working =3D false;
@@ -3647,14 +3658,13 @@ void amdgpu_device_fini(struct amdgpu_device *adev)
         adev->rmmio =3D NULL;
         amdgpu_device_doorbell_fini(adev);

-       if (adev->ucode_sysfs_en)
-               amdgpu_ucode_sysfs_fini(adev);
-
-       sysfs_remove_files(&adev->dev->kobj, amdgpu_dev_attributes);
         if (IS_ENABLED(CONFIG_PERF_EVENTS))
                 amdgpu_pmu_fini(adev);
         if (adev->mman.discovery_bin)
                 amdgpu_discovery_fini(adev);
+
+       kfree(adev->pci_state);
+
 }


diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_drv.c
index 671ec1002230..54cb5ee2f563 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1249,14 +1249,10 @@ amdgpu_pci_remove(struct pci_dev *pdev)
 {
         struct drm_device *dev =3D pci_get_drvdata(pdev);

-#ifdef MODULE
-       if (THIS_MODULE->state !=3D MODULE_STATE_GOING)
-#endif
-               DRM_ERROR("Hotplug removal is not supported\n");
         drm_dev_unplug(dev);
         amdgpu_driver_unload_kms(dev);
+
         pci_disable_device(pdev);
-       pci_set_drvdata(pdev, NULL);
 }

 static void
@@ -1587,6 +1583,7 @@ static const struct drm_driver amdgpu_kms_driver =3D =
{
         .dumb_create =3D amdgpu_mode_dumb_create,
         .dumb_map_offset =3D amdgpu_mode_dumb_mmap,
         .fops =3D &amdgpu_driver_kms_fops,
+       .release =3D &amdgpu_driver_release_kms,

         .prime_handle_to_fd =3D drm_gem_prime_handle_to_fd,
         .prime_fd_to_handle =3D drm_gem_prime_fd_to_handle,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_fence.c
index 8e0a5650d383..34d51e962799 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -523,7 +523,7 @@ int amdgpu_fence_driver_init(struct amdgpu_device *adev=
)
  *
  * Tear down the fence driver for all possible rings (all asics).
  */
-void amdgpu_fence_driver_fini(struct amdgpu_device *adev)
+void amdgpu_fence_driver_fini_hw(struct amdgpu_device *adev)
 {
         unsigned i, j;
         int r;
@@ -544,6 +544,19 @@ void amdgpu_fence_driver_fini(struct amdgpu_device *ad=
ev)
                 if (!ring->no_scheduler)
                         drm_sched_fini(&ring->sched);
                 del_timer_sync(&ring->fence_drv.fallback_timer);
+       }
+}
+
+void amdgpu_fence_driver_fini_sw(struct amdgpu_device *adev)
+{
+       unsigned int i, j;
+
+       for (i =3D 0; i < AMDGPU_MAX_RINGS; i++) {
+               struct amdgpu_ring *ring =3D adev->rings[i];
+
+               if (!ring || !ring->fence_drv.initialized)
+                       continue;
+
                 for (j =3D 0; j <=3D ring->fence_drv.num_fences_mask; ++j)
                         dma_fence_put(ring->fence_drv.fences[j]);
                 kfree(ring->fence_drv.fences);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_irq.c
index afbbec82a289..63e815c27585 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
@@ -49,6 +49,7 @@
 #include <drm/drm_irq.h>
 #include <drm/drm_vblank.h>
 #include <drm/amdgpu_drm.h>
+#include <drm/drm_drv.h>
 #include "amdgpu.h"
 #include "amdgpu_ih.h"
 #include "atom.h"
@@ -313,6 +314,20 @@ int amdgpu_irq_init(struct amdgpu_device *adev)
         return 0;
 }

+
+void amdgpu_irq_fini_hw(struct amdgpu_device *adev)
+{
+       if (adev->irq.installed) {
+               drm_irq_uninstall(&adev->ddev);
+               adev->irq.installed =3D false;
+               if (adev->irq.msi_enabled)
+                       pci_free_irq_vectors(adev->pdev);
+
+               if (!amdgpu_device_has_dc_support(adev))
+                       flush_work(&adev->hotplug_work);
+       }
+}
+
 /**
  * amdgpu_irq_fini - shut down interrupt handling
  *
@@ -322,19 +337,10 @@ int amdgpu_irq_init(struct amdgpu_device *adev)
  * functionality, shuts down vblank, hotplug and reset interrupt handling,
  * turns off interrupts from all sources (all ASICs).
  */
-void amdgpu_irq_fini(struct amdgpu_device *adev)
+void amdgpu_irq_fini_sw(struct amdgpu_device *adev)
 {
         unsigned i, j;

-       if (adev->irq.installed) {
-               drm_irq_uninstall(adev_to_drm(adev));
-               adev->irq.installed =3D false;
-               if (adev->irq.msi_enabled)
-                       pci_free_irq_vectors(adev->pdev);
-               if (!amdgpu_device_has_dc_support(adev))
-                       flush_work(&adev->hotplug_work);
-       }
-
         for (i =3D 0; i < AMDGPU_IRQ_CLIENTID_MAX; ++i) {
                 if (!adev->irq.client[i].sources)
                         continue;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_irq.h
index ac527e5deae6..392a7324e2b1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h
@@ -104,7 +104,8 @@ void amdgpu_irq_disable_all(struct amdgpu_device *adev)=
;
 irqreturn_t amdgpu_irq_handler(int irq, void *arg);

 int amdgpu_irq_init(struct amdgpu_device *adev);
-void amdgpu_irq_fini(struct amdgpu_device *adev);
+void amdgpu_irq_fini_sw(struct amdgpu_device *adev);
+void amdgpu_irq_fini_hw(struct amdgpu_device *adev);
 int amdgpu_irq_add_id(struct amdgpu_device *adev,
                       unsigned client_id, unsigned src_id,
                       struct amdgpu_irq_src *source);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_kms.c
index 64beb3399604..1af3fba7bfd4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -29,6 +29,7 @@
 #include "amdgpu.h"
 #include <drm/drm_debugfs.h>
 #include <drm/amdgpu_drm.h>
+#include <drm/drm_drv.h>
 #include "amdgpu_uvd.h"
 #include "amdgpu_vce.h"
 #include "atom.h"
@@ -93,7 +94,7 @@ void amdgpu_driver_unload_kms(struct drm_device *dev)
         }

         amdgpu_acpi_fini(adev);
-       amdgpu_device_fini(adev);
+       amdgpu_device_fini_hw(adev);
 }

 void amdgpu_register_gpu_instance(struct amdgpu_device *adev)
@@ -1151,6 +1152,15 @@ void amdgpu_driver_postclose_kms(struct drm_device *=
dev,
         pm_runtime_put_autosuspend(dev->dev);
 }

+
+void amdgpu_driver_release_kms(struct drm_device *dev)
+{
+       struct amdgpu_device *adev =3D drm_to_adev(dev);
+
+       amdgpu_device_fini_sw(adev);
+       pci_set_drvdata(adev->pdev, NULL);
+}
+
 /*
  * VBlank related functions.
  */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_ras.c
index 1fb2a91ad30a..c0a16eac4923 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -2142,6 +2142,7 @@ int amdgpu_ras_pre_fini(struct amdgpu_device *adev)
         if (!con)
                 return 0;

+
         /* Need disable ras on all IPs here before ip [hw/sw]fini */
         amdgpu_ras_disable_all_features(adev, 0);
         amdgpu_ras_recovery_fini(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_ring.h
index 56acec1075ac..0f195f7bf797 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
@@ -107,7 +107,8 @@ struct amdgpu_fence_driver {
 };

 int amdgpu_fence_driver_init(struct amdgpu_device *adev);
-void amdgpu_fence_driver_fini(struct amdgpu_device *adev);
+void amdgpu_fence_driver_fini_hw(struct amdgpu_device *adev);
+void amdgpu_fence_driver_fini_sw(struct amdgpu_device *adev);
 void amdgpu_fence_driver_force_completion(struct amdgpu_ring *ring);

 int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring,
diff --git a/drivers/gpu/drm/amd/amdgpu/cik_ih.c b/drivers/gpu/drm/amd/amdg=
pu/cik_ih.c
index d3745711d55f..183d44a6583c 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
@@ -309,7 +309,7 @@ static int cik_ih_sw_fini(void *handle)
 {
         struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;

-       amdgpu_irq_fini(adev);
+       amdgpu_irq_fini_sw(adev);
         amdgpu_ih_ring_fini(adev, &adev->irq.ih);
         amdgpu_irq_remove_domain(adev);

diff --git a/drivers/gpu/drm/amd/amdgpu/cz_ih.c b/drivers/gpu/drm/amd/amdgp=
u/cz_ih.c
index 307c01301c87..d32743949003 100644
--- a/drivers/gpu/drm/amd/amdgpu/cz_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
@@ -301,7 +301,7 @@ static int cz_ih_sw_fini(void *handle)
 {
         struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;

-       amdgpu_irq_fini(adev);
+       amdgpu_irq_fini_sw(adev);
         amdgpu_ih_ring_fini(adev, &adev->irq.ih);
         amdgpu_irq_remove_domain(adev);

diff --git a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c b/drivers/gpu/drm/amd/=
amdgpu/iceland_ih.c
index cc957471f31e..da96c6013477 100644
--- a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
@@ -300,7 +300,7 @@ static int iceland_ih_sw_fini(void *handle)
 {
         struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;

-       amdgpu_irq_fini(adev);
+       amdgpu_irq_fini_sw(adev);
         amdgpu_ih_ring_fini(adev, &adev->irq.ih);
         amdgpu_irq_remove_domain(adev);

diff --git a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c b/drivers/gpu/drm/amd/a=
mdgpu/navi10_ih.c
index f4e4040bbd25..5eea4550b856 100644
--- a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
@@ -569,7 +569,7 @@ static int navi10_ih_sw_fini(void *handle)
 {
         struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;

-       amdgpu_irq_fini(adev);
+       amdgpu_irq_fini_sw(adev);
         amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
         amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
         amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
diff --git a/drivers/gpu/drm/amd/amdgpu/si_ih.c b/drivers/gpu/drm/amd/amdgp=
u/si_ih.c
index 51880f6ef634..751307f3252c 100644
--- a/drivers/gpu/drm/amd/amdgpu/si_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/si_ih.c
@@ -175,7 +175,7 @@ static int si_ih_sw_fini(void *handle)
 {
         struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;

-       amdgpu_irq_fini(adev);
+       amdgpu_irq_fini_sw(adev);
         amdgpu_ih_ring_fini(adev, &adev->irq.ih);

         return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c b/drivers/gpu/drm/amd/am=
dgpu/tonga_ih.c
index 249fcbee7871..973d80ec7f6c 100644
--- a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
@@ -312,7 +312,7 @@ static int tonga_ih_sw_fini(void *handle)
 {
         struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;

-       amdgpu_irq_fini(adev);
+       amdgpu_irq_fini_sw(adev);
         amdgpu_ih_ring_fini(adev, &adev->irq.ih);
         amdgpu_irq_remove_domain(adev);

diff --git a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c b/drivers/gpu/drm/amd/a=
mdgpu/vega10_ih.c
index 88626d83e07b..2d0094c276ca 100644
--- a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
@@ -523,7 +523,7 @@ static int vega10_ih_sw_fini(void *handle)
 {
         struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;

-       amdgpu_irq_fini(adev);
+       amdgpu_irq_fini_sw(adev);
         amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
         amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
         amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
diff --git a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c b/drivers/gpu/drm/amd/a=
mdgpu/vega20_ih.c
index 5a3c867d5881..9059b21b079f 100644
--- a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
@@ -558,7 +558,7 @@ static int vega20_ih_sw_fini(void *handle)
 {
         struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;

-       amdgpu_irq_fini(adev);
+       amdgpu_irq_fini_sw(adev);
         amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
         amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
         amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
--
2.25.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.f=
reedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D04%7C01%7Clijo.laz=
ar%40amd.com%7C71f92dcef6d04dfea28308d90a5818c9%7C3dd8961fe4884e608e11a82d9=
94e183d%7C0%7C0%7C637552195764790324%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj=
AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DfzG=
S6ZXYffGH0DE%2BEM4jxyB8yDGpYO%2FmT%2FKAtgig1Tw%3D&amp;reserved=3D0

--_000_MN2PR12MB4549896A55131D4A327908E4975E9MN2PR12MB4549namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<p style=3D"font-family:Arial;font-size:11pt;color:#0078D7;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only - Internal Distribution Only]<br>
</p>
<br>
<div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
" dir=3D"auto">
sysfs cleanup is a sw cleanup to me but done inside hw fini. sw/hw separati=
on is not strictly followed, or name it like stage1/stage2 fini.</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
" dir=3D"auto">
<br>
</div>
<div id=3D"ms-outlook-mobile-signature">Thanks,<br>
Lijo</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Andrey Grodzovsky &lt;andrey.=
grodzovsky@amd.com&gt;<br>
<b>Sent:</b> Wednesday, April 28, 2021 8:41:43 PM<br>
<b>To:</b> dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.=
org&gt;; amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt=
;; linux-pci@vger.kernel.org &lt;linux-pci@vger.kernel.org&gt;; ckoenig.lei=
chtzumerken@gmail.com &lt;ckoenig.leichtzumerken@gmail.com&gt;;
 daniel.vetter@ffwll.ch &lt;daniel.vetter@ffwll.ch&gt;; Wentland, Harry &lt=
;Harry.Wentland@amd.com&gt;<br>
<b>Cc:</b> Grodzovsky, Andrey &lt;Andrey.Grodzovsky@amd.com&gt;; gregkh@lin=
uxfoundation.org &lt;gregkh@linuxfoundation.org&gt;; Kuehling, Felix &lt;Fe=
lix.Kuehling@amd.com&gt;; ppaalanen@gmail.com &lt;ppaalanen@gmail.com&gt;; =
helgaas@kernel.org &lt;helgaas@kernel.org&gt;; Deucher, Alexander
 &lt;Alexander.Deucher@amd.com&gt;<br>
<b>Subject:</b> [PATCH v5 03/27] drm/amdgpu: Split amdgpu_device_fini into =
early and late</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Some of the stuff in amdgpu_device_fini such as HW=
 interrupts<br>
disable and pending fences finilization must be done right away on<br>
pci_remove while most of the stuff which relates to finilizing and<br>
releasing driver data structures can be kept until<br>
drm_driver.release hook is called, i.e. when the last device<br>
reference is dropped.<br>
<br>
v4: Change functions prefix early-&gt;hw and late-&gt;sw<br>
<br>
Signed-off-by: Andrey Grodzovsky &lt;andrey.grodzovsky@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; |&nbsp; 6 ++++-<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 26 +++++++++++++++------=
-<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c&nbsp;&nbsp;&nbsp; |&nbsp; 7 +=
+----<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c&nbsp; | 15 ++++++++++++-<br=
>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c&nbsp;&nbsp;&nbsp; | 26 ++++++=
+++++++---------<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h&nbsp;&nbsp;&nbsp; |&nbsp; 3 +=
+-<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c&nbsp;&nbsp;&nbsp; | 12 ++++++=
+++-<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c&nbsp;&nbsp;&nbsp; |&nbsp; 1 +=
<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h&nbsp;&nbsp; |&nbsp; 3 ++-<br=
>
&nbsp;drivers/gpu/drm/amd/amdgpu/cik_ih.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; |&nbsp; 2 +-<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/cz_ih.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; |&nbsp; 2 +-<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/iceland_ih.c&nbsp;&nbsp;&nbsp; |&nbsp; 2 +=
-<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/navi10_ih.c&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp=
; 2 +-<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/si_ih.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; |&nbsp; 2 +-<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/tonga_ih.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |=
&nbsp; 2 +-<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/vega10_ih.c&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp=
; 2 +-<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/vega20_ih.c&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp=
; 2 +-<br>
&nbsp;17 files changed, 79 insertions(+), 36 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdg=
pu/amdgpu.h<br>
index 1af2fa1591fd..fddb82897e5d 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h<br>
@@ -1073,7 +1073,9 @@ static inline struct amdgpu_device *amdgpu_ttm_adev(s=
truct ttm_device *bdev)<br>
&nbsp;<br>
&nbsp;int amdgpu_device_init(struct amdgpu_device *adev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t fl=
ags);<br>
-void amdgpu_device_fini(struct amdgpu_device *adev);<br>
+void amdgpu_device_fini_hw(struct amdgpu_device *adev);<br>
+void amdgpu_device_fini_sw(struct amdgpu_device *adev);<br>
+<br>
&nbsp;int amdgpu_gpu_wait_for_idle(struct amdgpu_device *adev);<br>
&nbsp;<br>
&nbsp;void amdgpu_device_vram_access(struct amdgpu_device *adev, loff_t pos=
,<br>
@@ -1289,6 +1291,8 @@ void amdgpu_driver_lastclose_kms(struct drm_device *d=
ev);<br>
&nbsp;int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *f=
ile_priv);<br>
&nbsp;void amdgpu_driver_postclose_kms(struct drm_device *dev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_file *file_priv=
);<br>
+void amdgpu_driver_release_kms(struct drm_device *dev);<br>
+<br>
&nbsp;int amdgpu_device_ip_suspend(struct amdgpu_device *adev);<br>
&nbsp;int amdgpu_device_suspend(struct drm_device *dev, bool fbcon);<br>
&nbsp;int amdgpu_device_resume(struct drm_device *dev, bool fbcon);<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_device.c<br>
index 6447cd6ca5a8..8d22b79fc1cd 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
@@ -3590,14 +3590,12 @@ int amdgpu_device_init(struct amdgpu_device *adev,<=
br>
&nbsp; * Tear down the driver info (all asics).<br>
&nbsp; * Called at driver shutdown.<br>
&nbsp; */<br>
-void amdgpu_device_fini(struct amdgpu_device *adev)<br>
+void amdgpu_device_fini_hw(struct amdgpu_device *adev)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info(adev-&gt;dev, &qu=
ot;amdgpu: finishing device.\n&quot;);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; flush_delayed_work(&amp;ad=
ev-&gt;delayed_init_work);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;shutdown =3D true=
;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(adev-&gt;pci_state);<br>
-<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* make sure IB test finis=
hed before entering exclusive mode<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * to avoid preemptio=
n on IB test<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * */<br>
@@ -3614,11 +3612,24 @@ void amdgpu_device_fini(struct amdgpu_device *adev)=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; else<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_a=
tomic_helper_shutdown(adev_to_drm(adev));<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_fence_driver_fini(adev);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_fence_driver_fini_hw(adev);<br=
>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;pm_sysfs_en)<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; amdgpu_pm_sysfs_fini(adev);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;ucode_sysfs_en)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; amdgpu_ucode_sysfs_fini(adev);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sysfs_remove_files(&amp;adev-&gt;dev-=
&gt;kobj, amdgpu_dev_attributes);<br>
+<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_fbdev_fini(adev);<b=
r>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_irq_fini_hw(adev);<br>
+}<br>
+<br>
+void amdgpu_device_fini_sw(struct amdgpu_device *adev)<br>
+{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_fini(adev=
);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_fence_driver_fini_sw(adev);<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; release_firmware(adev-&gt;=
firmware.gpu_info_fw);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;firmware.gpu_info=
_fw =3D NULL;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;accel_working =3D=
 false;<br>
@@ -3647,14 +3658,13 @@ void amdgpu_device_fini(struct amdgpu_device *adev)=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;rmmio =3D NULL;<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_doorbell_fin=
i(adev);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;ucode_sysfs_en)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; amdgpu_ucode_sysfs_fini(adev);<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sysfs_remove_files(&amp;adev-&gt;dev-=
&gt;kobj, amdgpu_dev_attributes);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (IS_ENABLED(CONFIG_PERF=
_EVENTS))<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; amdgpu_pmu_fini(adev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;mman.discover=
y_bin)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; amdgpu_discovery_fini(adev);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(adev-&gt;pci_state);<br>
+<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_drv.c<br>
index 671ec1002230..54cb5ee2f563 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
@@ -1249,14 +1249,10 @@ amdgpu_pci_remove(struct pci_dev *pdev)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_device *dev =3D=
 pci_get_drvdata(pdev);<br>
&nbsp;<br>
-#ifdef MODULE<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (THIS_MODULE-&gt;state !=3D MODULE=
_STATE_GOING)<br>
-#endif<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; DRM_ERROR(&quot;Hotplug removal is not supported\n&quot;);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_dev_unplug(dev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_driver_unload_kms(d=
ev);<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pci_disable_device(pdev);<=
br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pci_set_drvdata(pdev, NULL);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;static void<br>
@@ -1587,6 +1583,7 @@ static const struct drm_driver amdgpu_kms_driver =3D =
{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dumb_create =3D amdgpu_mo=
de_dumb_create,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dumb_map_offset =3D amdgp=
u_mode_dumb_mmap,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .fops =3D &amp;amdgpu_driv=
er_kms_fops,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .release =3D &amp;amdgpu_driver_relea=
se_kms,<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .prime_handle_to_fd =3D dr=
m_gem_prime_handle_to_fd,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .prime_fd_to_handle =3D dr=
m_gem_prime_fd_to_handle,<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_fence.c<br>
index 8e0a5650d383..34d51e962799 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c<br>
@@ -523,7 +523,7 @@ int amdgpu_fence_driver_init(struct amdgpu_device *adev=
)<br>
&nbsp; *<br>
&nbsp; * Tear down the fence driver for all possible rings (all asics).<br>
&nbsp; */<br>
-void amdgpu_fence_driver_fini(struct amdgpu_device *adev)<br>
+void amdgpu_fence_driver_fini_hw(struct amdgpu_device *adev)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned i, j;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r;<br>
@@ -544,6 +544,19 @@ void amdgpu_fence_driver_fini(struct amdgpu_device *ad=
ev)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (!ring-&gt;no_scheduler)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_s=
ched_fini(&amp;ring-&gt;sched);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; del_timer_sync(&amp;ring-&gt;fence_drv.fallback_timer=
);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+}<br>
+<br>
+void amdgpu_fence_driver_fini_sw(struct amdgpu_device *adev)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int i, j;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; AMDGPU_MAX_RINGS=
; i++) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; struct amdgpu_ring *ring =3D adev-&gt;rings[i];<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (!ring || !ring-&gt;fence_drv.initialized)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; for (j =3D 0; j &lt;=3D ring-&gt;fence_drv.num_fences=
_mask; ++j)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dma_f=
ence_put(ring-&gt;fence_drv.fences[j]);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; kfree(ring-&gt;fence_drv.fences);<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_irq.c<br>
index afbbec82a289..63e815c27585 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c<br>
@@ -49,6 +49,7 @@<br>
&nbsp;#include &lt;drm/drm_irq.h&gt;<br>
&nbsp;#include &lt;drm/drm_vblank.h&gt;<br>
&nbsp;#include &lt;drm/amdgpu_drm.h&gt;<br>
+#include &lt;drm/drm_drv.h&gt;<br>
&nbsp;#include &quot;amdgpu.h&quot;<br>
&nbsp;#include &quot;amdgpu_ih.h&quot;<br>
&nbsp;#include &quot;atom.h&quot;<br>
@@ -313,6 +314,20 @@ int amdgpu_irq_init(struct amdgpu_device *adev)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;}<br>
&nbsp;<br>
+<br>
+void amdgpu_irq_fini_hw(struct amdgpu_device *adev)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;irq.installed) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; drm_irq_uninstall(&amp;adev-&gt;ddev);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; adev-&gt;irq.installed =3D false;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (adev-&gt;irq.msi_enabled)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pci_free_irq_vec=
tors(adev-&gt;pdev);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (!amdgpu_device_has_dc_support(adev))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; flush_work(&amp;=
adev-&gt;hotplug_work);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+}<br>
+<br>
&nbsp;/**<br>
&nbsp; * amdgpu_irq_fini - shut down interrupt handling<br>
&nbsp; *<br>
@@ -322,19 +337,10 @@ int amdgpu_irq_init(struct amdgpu_device *adev)<br>
&nbsp; * functionality, shuts down vblank, hotplug and reset interrupt hand=
ling,<br>
&nbsp; * turns off interrupts from all sources (all ASICs).<br>
&nbsp; */<br>
-void amdgpu_irq_fini(struct amdgpu_device *adev)<br>
+void amdgpu_irq_fini_sw(struct amdgpu_device *adev)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned i, j;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;irq.installed) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; drm_irq_uninstall(adev_to_drm(adev));<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; adev-&gt;irq.installed =3D false;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (adev-&gt;irq.msi_enabled)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pci_free_irq_vec=
tors(adev-&gt;pdev);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (!amdgpu_device_has_dc_support(adev))<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; flush_work(&amp;=
adev-&gt;hotplug_work);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; AMDGP=
U_IRQ_CLIENTID_MAX; ++i) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (!adev-&gt;irq.client[i].sources)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; conti=
nue;<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_irq.h<br>
index ac527e5deae6..392a7324e2b1 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h<br>
@@ -104,7 +104,8 @@ void amdgpu_irq_disable_all(struct amdgpu_device *adev)=
;<br>
&nbsp;irqreturn_t amdgpu_irq_handler(int irq, void *arg);<br>
&nbsp;<br>
&nbsp;int amdgpu_irq_init(struct amdgpu_device *adev);<br>
-void amdgpu_irq_fini(struct amdgpu_device *adev);<br>
+void amdgpu_irq_fini_sw(struct amdgpu_device *adev);<br>
+void amdgpu_irq_fini_hw(struct amdgpu_device *adev);<br>
&nbsp;int amdgpu_irq_add_id(struct amdgpu_device *adev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned client_i=
d, unsigned src_id,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_irq=
_src *source);<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_kms.c<br>
index 64beb3399604..1af3fba7bfd4 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c<br>
@@ -29,6 +29,7 @@<br>
&nbsp;#include &quot;amdgpu.h&quot;<br>
&nbsp;#include &lt;drm/drm_debugfs.h&gt;<br>
&nbsp;#include &lt;drm/amdgpu_drm.h&gt;<br>
+#include &lt;drm/drm_drv.h&gt;<br>
&nbsp;#include &quot;amdgpu_uvd.h&quot;<br>
&nbsp;#include &quot;amdgpu_vce.h&quot;<br>
&nbsp;#include &quot;atom.h&quot;<br>
@@ -93,7 +94,7 @@ void amdgpu_driver_unload_kms(struct drm_device *dev)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_acpi_fini(adev);<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_fini(adev);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_fini_hw(adev);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;void amdgpu_register_gpu_instance(struct amdgpu_device *adev)<br>
@@ -1151,6 +1152,15 @@ void amdgpu_driver_postclose_kms(struct drm_device *=
dev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pm_runtime_put_autosuspend=
(dev-&gt;dev);<br>
&nbsp;}<br>
&nbsp;<br>
+<br>
+void amdgpu_driver_release_kms(struct drm_device *dev)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D drm_to=
_adev(dev);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_fini_sw(adev);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pci_set_drvdata(adev-&gt;pdev, NULL);=
<br>
+}<br>
+<br>
&nbsp;/*<br>
&nbsp; * VBlank related functions.<br>
&nbsp; */<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_ras.c<br>
index 1fb2a91ad30a..c0a16eac4923 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c<br>
@@ -2142,6 +2142,7 @@ int amdgpu_ras_pre_fini(struct amdgpu_device *adev)<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!con)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Need disable ras on all=
 IPs here before ip [hw/sw]fini */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ras_disable_all_fea=
tures(adev, 0);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ras_recovery_fini(a=
dev);<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_ring.h<br>
index 56acec1075ac..0f195f7bf797 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h<br>
@@ -107,7 +107,8 @@ struct amdgpu_fence_driver {<br>
&nbsp;};<br>
&nbsp;<br>
&nbsp;int amdgpu_fence_driver_init(struct amdgpu_device *adev);<br>
-void amdgpu_fence_driver_fini(struct amdgpu_device *adev);<br>
+void amdgpu_fence_driver_fini_hw(struct amdgpu_device *adev);<br>
+void amdgpu_fence_driver_fini_sw(struct amdgpu_device *adev);<br>
&nbsp;void amdgpu_fence_driver_force_completion(struct amdgpu_ring *ring);<=
br>
&nbsp;<br>
&nbsp;int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring,<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/cik_ih.c b/drivers/gpu/drm/amd/amdg=
pu/cik_ih.c<br>
index d3745711d55f..183d44a6583c 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/cik_ih.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/cik_ih.c<br>
@@ -309,7 +309,7 @@ static int cik_ih_sw_fini(void *handle)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev=
 =3D (struct amdgpu_device *)handle;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_irq_fini(adev);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_irq_fini_sw(adev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ih_ring_fini(adev, =
&amp;adev-&gt;irq.ih);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_irq_remove_domain(a=
dev);<br>
&nbsp;<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/cz_ih.c b/drivers/gpu/drm/amd/amdgp=
u/cz_ih.c<br>
index 307c01301c87..d32743949003 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/cz_ih.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/cz_ih.c<br>
@@ -301,7 +301,7 @@ static int cz_ih_sw_fini(void *handle)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev=
 =3D (struct amdgpu_device *)handle;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_irq_fini(adev);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_irq_fini_sw(adev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ih_ring_fini(adev, =
&amp;adev-&gt;irq.ih);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_irq_remove_domain(a=
dev);<br>
&nbsp;<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c b/drivers/gpu/drm/amd/=
amdgpu/iceland_ih.c<br>
index cc957471f31e..da96c6013477 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c<br>
@@ -300,7 +300,7 @@ static int iceland_ih_sw_fini(void *handle)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev=
 =3D (struct amdgpu_device *)handle;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_irq_fini(adev);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_irq_fini_sw(adev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ih_ring_fini(adev, =
&amp;adev-&gt;irq.ih);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_irq_remove_domain(a=
dev);<br>
&nbsp;<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c b/drivers/gpu/drm/amd/a=
mdgpu/navi10_ih.c<br>
index f4e4040bbd25..5eea4550b856 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c<br>
@@ -569,7 +569,7 @@ static int navi10_ih_sw_fini(void *handle)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev=
 =3D (struct amdgpu_device *)handle;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_irq_fini(adev);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_irq_fini_sw(adev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ih_ring_fini(adev, =
&amp;adev-&gt;irq.ih_soft);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ih_ring_fini(adev, =
&amp;adev-&gt;irq.ih2);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ih_ring_fini(adev, =
&amp;adev-&gt;irq.ih1);<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/si_ih.c b/drivers/gpu/drm/amd/amdgp=
u/si_ih.c<br>
index 51880f6ef634..751307f3252c 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/si_ih.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/si_ih.c<br>
@@ -175,7 +175,7 @@ static int si_ih_sw_fini(void *handle)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev=
 =3D (struct amdgpu_device *)handle;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_irq_fini(adev);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_irq_fini_sw(adev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ih_ring_fini(adev, =
&amp;adev-&gt;irq.ih);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c b/drivers/gpu/drm/amd/am=
dgpu/tonga_ih.c<br>
index 249fcbee7871..973d80ec7f6c 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c<br>
@@ -312,7 +312,7 @@ static int tonga_ih_sw_fini(void *handle)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev=
 =3D (struct amdgpu_device *)handle;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_irq_fini(adev);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_irq_fini_sw(adev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ih_ring_fini(adev, =
&amp;adev-&gt;irq.ih);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_irq_remove_domain(a=
dev);<br>
&nbsp;<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c b/drivers/gpu/drm/amd/a=
mdgpu/vega10_ih.c<br>
index 88626d83e07b..2d0094c276ca 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c<br>
@@ -523,7 +523,7 @@ static int vega10_ih_sw_fini(void *handle)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev=
 =3D (struct amdgpu_device *)handle;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_irq_fini(adev);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_irq_fini_sw(adev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ih_ring_fini(adev, =
&amp;adev-&gt;irq.ih_soft);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ih_ring_fini(adev, =
&amp;adev-&gt;irq.ih2);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ih_ring_fini(adev, =
&amp;adev-&gt;irq.ih1);<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c b/drivers/gpu/drm/amd/a=
mdgpu/vega20_ih.c<br>
index 5a3c867d5881..9059b21b079f 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c<br>
@@ -558,7 +558,7 @@ static int vega20_ih_sw_fini(void *handle)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev=
 =3D (struct amdgpu_device *)handle;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_irq_fini(adev);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_irq_fini_sw(adev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ih_ring_fini(adev, =
&amp;adev-&gt;irq.ih_soft);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ih_ring_fini(adev, =
&amp;adev-&gt;irq.ih2);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ih_ring_fini(adev, =
&amp;adev-&gt;irq.ih1);<br>
-- <br>
2.25.1<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;data=3D04%=
7C01%7Clijo.lazar%40amd.com%7C71f92dcef6d04dfea28308d90a5818c9%7C3dd8961fe4=
884e608e11a82d994e183d%7C0%7C0%7C637552195764790324%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;amp;sdata=3DfzGS6ZXYffGH0DE%2BEM4jxyB8yDGpYO%2FmT%2FKAtgig1Tw%3D&amp;am=
p;reserved=3D0">https://nam11.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;data=
=3D04%7C01%7Clijo.lazar%40amd.com%7C71f92dcef6d04dfea28308d90a5818c9%7C3dd8=
961fe4884e608e11a82d994e183d%7C0%7C0%7C637552195764790324%7CUnknown%7CTWFpb=
GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7=
C1000&amp;amp;sdata=3DfzGS6ZXYffGH0DE%2BEM4jxyB8yDGpYO%2FmT%2FKAtgig1Tw%3D&=
amp;amp;reserved=3D0</a><br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_MN2PR12MB4549896A55131D4A327908E4975E9MN2PR12MB4549namp_--

--===============2023377657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2023377657==--
