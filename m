Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6C8605854
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 09:22:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A58610E3AF;
	Thu, 20 Oct 2022 07:22:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE6A210F25A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 15:03:10 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29JAJuTo012523;
 Wed, 19 Oct 2022 10:43:33 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2054.outbound.protection.outlook.com [104.47.12.54])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3k9x3pkkgs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Oct 2022 10:43:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QHvVz3lupSgLrfTfRvcD6hmOiM/TVoX4vAI+Rwy9poBadEjRPI0VIgR2isPLgkW0uzjjCKqbmHrNMhK0SChTgYMJ8NE7sO5v27qCK+If1sp3JnbOk3xkscuonn0FsT3oX/A8cKYag/hHvmgFIRz2kXoxPzcVXxllWeP7pjxZ3V7uH0KF79hUjUp5qndPQnEDx5YjY231rmVKqA1usKlb2yIU7+FP8d7HYdrd26Cb+57dgj8DAp8yz791PVMOl3eJVxJD9jEP4PJlbHBxOSgQZsDcFwwfgtlm643LycvWc/HvjaY9skRM2GsFNofvKT82/7mIBbFpoXchY0bDp0aX6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+TH18d6jJiu/VsRvpIH+0CdOUoQ76uMhOxlznj9gV4I=;
 b=MQI3HD2dJxJJOuY8bxuLWIAfvIDqs48egBy/K0k6iEgU6hvDWlfxhuoGiR/jNL1oA/KSZe3DLGSalgQ61CsvaJPtO0OZ8XKCUXbQMe7FikOme2rUOiTNYtZdACR7g8Ad5w+XUGkRAfYVzXm1UJq1h/46dttCmsMzuTvC9EMt44etkgbLJxdIGe416ZNdLv7SelVPeK6+6t/vK71WgubeRHIFxktnPrKX4i2yn31/8PfJA+Y95dWdS2KIDbKpOTObwSjJjCOzhB5yw6tUhGtHOzwWctOd5A6c5U50Bu/nlyabZBsDXo9u9RdZPB7aJ6Aq/4UY++x9aEVEd/uZNlFS8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+TH18d6jJiu/VsRvpIH+0CdOUoQ76uMhOxlznj9gV4I=;
 b=gMIwodgSRJBa5Vt4wCo7ARSqjFfFRAwaUQAq/CdrlTZ8DEvTUpbqPxeHSvfpIqTUwi7tcLdtzILWb1g/BE5w7xfSxyGZWoIoG+nJCVAKCPFk9uUj1ejQLHAZ1M3ft8HZY/Wtx7Ir9YjwJfL7HTTuUPajGwiIU4YoTXtKuKIV8gpDjVAC5lfmLfSwiHtsUKRVYUk2ga0ZTzQ6GKM9U3DXjI9031ZaSDrpLRK6+a2t9rtcGyB56hkywDB7whDtLjD/IADyo9xJWWPhd6Edh0b1/odSxO3MUi98Vtmr0TjybX78zii9oUcGI3XUHgaPbBsW4RcgsUePMHZF+Giif8cG2A==
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PA4PR03MB7392.eurprd03.prod.outlook.com (2603:10a6:102:106::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Wed, 19 Oct
 2022 10:43:30 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::551e:e1bc:b684:b7bb]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::551e:e1bc:b684:b7bb%9]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 10:43:30 +0000
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "jennifer.herbert@citrix.com" <jennifer.herbert@citrix.com>
Subject: Issue on unmap_grant_pages before releasing dmabuf
Thread-Topic: Issue on unmap_grant_pages before releasing dmabuf
Thread-Index: AQHY46egGI7L6jjRBkOb9R/tnZLb7A==
Date: Wed, 19 Oct 2022 10:43:30 +0000
Message-ID: <Y0/U0RNDSRdV7bex@EPUAKYIW015D>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR03MB7136:EE_|PA4PR03MB7392:EE_
x-ms-office365-filtering-correlation-id: 248371b3-0c09-414a-9adf-08dab1bec33d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1ajmBmC2qHpjNru4mpKe2XQXhvN0PoX0vK94YZPHK+dtMn4b2XZxuquNSWpJuyRzh6xn916ikNz0XrHVxu3pFRgNJ8gFYxkfNeDCvIcUdIa7eWxhQxLBtOXTvAJgHS72SX/Oz6prHyOfrinjW58QFyb1RFu8Zpzd8uVUF9FUM3LkJ/7xD3MslIiqNI1kDLRLWKpRzSkb5ISbK2paO5dtm3UChSiEQsmGaJFJLvNxxHK/F8DnQsLIxp3VCPZ9q2Bie/KpMh9C5qKuY+ntf4EDhvBmRhliwO3GR6gcfKxoUjTvnEmh02GGlikwTrFNmmT3X9PHS7OKDGxYPyfzdEzGdiZH0lN65fz5t03RfjOB8/gB9pchff3N1Fy+ovlG8lcr0X2yfBwJHLQE/p11vgcMX4SYL5+DMYbQf/5p8JYDpeXir7iivysmMHhjmbCidJp2tGlSu6rJK6XipLXUrZm76xvDEEr8Fs292BeQiDhnb2ebF0XyZvntuoITNR/C7dZ6DKJLe9N3wpAfG1NfTGHwLjSnvx4i9oxtTftC3ZD9kjjNOYSSX86hKlxKsddr5li24NgMRghf36X/Afw7513SU4QBKMX6jbeb5hGbkqDUL+HfEfivjNk66sxZj46autZTiOeoktxb/BFvlg7sH+u9ctuiwxFy220I4EGN+m/hjYSiUmh+jAT+fwgHY3NyAcCn9MEOyy/fXQS05OYCooav4r96ZHJVYcTt/xsmdjxK/xgaUUDn3zlCpR7OfPEzVL7fMhWW6kH4f2VrFhXYYFStkkqDsECBCPwZjCyUMu3gYf9vxxB3nR/kHXWn4p5ITgq63wsOpnJPoLRessX80OyZ0g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR03MB7136.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(7916004)(376002)(366004)(396003)(136003)(346002)(39860400002)(84040400005)(451199015)(6916009)(4326008)(5660300002)(54906003)(66446008)(66556008)(76116006)(66946007)(8676002)(91956017)(8936002)(6506007)(316002)(6512007)(9686003)(26005)(41300700001)(64756008)(66476007)(38100700002)(33716001)(38070700005)(122000001)(186003)(2906002)(86362001)(83380400001)(71200400001)(478600001)(45080400002)(966005)(6486002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZWJpOr8VAGPLJ0VxmIFDkoy317kfd4FigvoqSqVahNhPD4J4wg16bPD/fjnc?=
 =?us-ascii?Q?AAxe3qDLsSM9Rqf3FS2bN2Aa9CQ7eXgnXB9oFfsmkKkSFwlGWZGAT787CqBY?=
 =?us-ascii?Q?TrDuWHTwt/F8l8a0CoCFmsl6nvfTc1qEOZ7eZXRaTG/xSRnmxUOlpGRx0Jjq?=
 =?us-ascii?Q?rptDg8DUiWvhWr6rZyIzYX3R8Yfr2vK53sbqIIhmCZaA/YaTpinlJ+fjWNsU?=
 =?us-ascii?Q?rdM9wPNVJ2h1W0cV76uG5r/4MzuPEcRaj/8euqfJ0MuCQzFbczMlOtpZQ1CX?=
 =?us-ascii?Q?CGguEyRHAzUJZ4BSdmHGl02L6kxlS28hUZazpc18nvivVVw7OhMdnYZPECay?=
 =?us-ascii?Q?99SIuNcAjfg9NBs59dzqMO8nsRySf6aR+qPYdmOSrWLhHRxxMTEOX+Ckbjik?=
 =?us-ascii?Q?IyNqJJIjMJ+UCHRBvMDOtAHTul6qDeqJC+OM3mKidKEZVDZPhZun0UZlEQ0I?=
 =?us-ascii?Q?peEYsMZ49tOMquIql8wuOJUw2gQeqdbEklC+p0TILh6JkLAxwMYUygyTiCVM?=
 =?us-ascii?Q?HXCJrX03iQOKQU6RQDKIun4334aPuafYe6jB1SRJHN1WSENddegkLAXh+ZOa?=
 =?us-ascii?Q?7exVpRr/O3lyST5Rtb6Nt/h3og6dur1WH+TQY3kBSril+JJATiPjUzcmZea3?=
 =?us-ascii?Q?Q0L4f0HXncEsptP/KZ9uHIGmdg0ofhyBh4HVUJOipdEeNvYGh6/cc5+kMG0J?=
 =?us-ascii?Q?hCBXQAt/Ibmn2JWYKtTVK7V7K/DnlF1jwJm7g0kJABIVcIz98s5XzmLFbveq?=
 =?us-ascii?Q?xGAXNSDAM7sNEnsB7/sYJcnAlSpto23xU2XNCKZJz79Lu9FyoRR7gMSpQfDu?=
 =?us-ascii?Q?1l999pkfazv63NHwFgfUkri6kEOTuImzSxinHGkYeLtqqdZiA9lIu9FbWIcn?=
 =?us-ascii?Q?dFotNDr5TYBT7q+S778BPKWae3ttjRS2H2vjg5mGHfnO/v0NOdgURFNsCkIi?=
 =?us-ascii?Q?0M2I09wMBflCixt405Jtl0DPXujPejFoB0vD7rWL/lqVFMZAqWx5r4+S2tlQ?=
 =?us-ascii?Q?hpSRLATBzrMlhA4pZHVVTXJ7uhk8avYkk+NKHnue5t0wBEkQfzduwUumN+gV?=
 =?us-ascii?Q?Vw6Py6LprvR07+tc2OFZ3lCIyNSqRzuf05hahVehV9w/8isju8RgEwzavgos?=
 =?us-ascii?Q?sRTGOqQ3wxMq5Qu8OlXL5KDp6buHuB0SzFYNym93JX/c6tv5SfjbhM1eGlF9?=
 =?us-ascii?Q?r6l54KwL3BM75QcHu3r4jmUVRse3HpmxASqIh2/wokWAgVP0R48tTvE1q35/?=
 =?us-ascii?Q?gg+8+Qa2lrBk87xby2sfW4ejmIsH8ZjuWi7EHgH/NKECSBm7uYj9fowhjhZs?=
 =?us-ascii?Q?IEcxfVItWa7Bhl1XvqQ4Zj2CItvVO8watvc23XofvfMgPMuSFzBrhTJZ2UVF?=
 =?us-ascii?Q?nU5nS5MHP9duskfHWVEv+ARnzPeq+M0PGRlorwtO8ZDMmpV7MVblOm9qxhPN?=
 =?us-ascii?Q?3OaMte7WZKHsWLr9CqT5M6pWtASeZ3RLjaHVS+JMN7zW5WRIs73AzrIMjMYH?=
 =?us-ascii?Q?Xo3rXQAxdtYEeGi3Nf05/pnAY1uA0pK7869T7Unb/B+d0Zymf8HR/KnZzjyV?=
 =?us-ascii?Q?c8rX5/R8EsQkwlicF9PzGoQ6ZV4IEBW4N9CB5IPjwkf9yrccUQmyvpvhvuer?=
 =?us-ascii?Q?9A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BF063B05B28AF1498C3E5698FDCC3D90@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 248371b3-0c09-414a-9adf-08dab1bec33d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2022 10:43:30.3374 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NARB9CSUXii2WbH8W/x7zroh+CYY27tU2CbbfySBGmnPP+EY/tFK4v/dSeqdsKZaoAihmJe5njRYtPxGWuz1TYPqSQNGhMeZCGGXEQzQDDA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7392
X-Proofpoint-ORIG-GUID: GMkuTjpDy9qh95K13P9QT05TQFhki3cI
X-Proofpoint-GUID: GMkuTjpDy9qh95K13P9QT05TQFhki3cI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-19_06,2022-10-19_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1011 mlxlogscore=999
 priorityscore=1501 suspectscore=0 mlxscore=0 bulkscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210190059
X-Mailman-Approved-At: Thu, 20 Oct 2022 07:21:18 +0000
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Greetings.

I need your advise about the problem I'm facing right now:
I'm working on the new type of dmabuf export implementation. This=20
is going to be new ioctl to the gntdev and it's purpose is to use
external buffer, provided by file descriptor as the backing storage
during export to grant refs.
Few words about the functionality I'm working on right now:
My setup is based on IMX8QM (please see PS below if you need
configuration details)

When using dma-buf exporter to create dma-buf with backing storage and
map it to the grant refs, provided from the domain, we've met a problem,
that several HW (i.MX8 gpu in our case) do not support external buffer
and requires backing storage to be created using it's native tools
(eglCreateImageKHR returns EGL_NO_IMAGE_KHR for buffers, which were not
created using gbm_bo_create).
That's why new ioctls were added to be able to pass existing dma-buffer
fd as input parameter and use it as backing storage to export to refs.
Kernel version on IMX8QM board is 5.10.72 and itworks fine on this kernel
version.

New ioctls source code can be found here:
 https://github.com/oleksiimoisieiev/linux/tree/gntdev_map_buf_upstr_for-li=
nus-6.1_2
   =20
Now regarding the problem I've met when rebased those code on master:
On my test stand I use DRM_IOCTL_MODE_CREATE_DUMB/DRM_IOCTL_MODE_DESTROY_DU=
MB ioctls
to allocate buffer and I'm observing the following backtrace on DRM_IOCTL_M=
ODE_DESTROY_DUMB:

Unable to handle kernel paging request at virtual address 0000000387000098
Mem abort info:
  ESR =3D 0x0000000096000005
  EC =3D 0x25: DABT (current EL), IL =3D 32 bits
  SET =3D 0, FnV =3D 0
  EA =3D 0, S1PTW =3D 0
  FSC =3D 0x05: level 1 translation fault
Data abort info:
  ISV =3D 0, ISS =3D 0x00000005
  CM =3D 0, WnR =3D 0
user pgtable: 4k pages, 48-bit VAs, pgdp=3D000000006df98000
[0000000387000098] pgd=3D0800000064f4f003, p4d=3D0800000064f4f003, pud=3D00=
00000000000000
Internal error: Oops: 96000005 [#1] PREEMPT SMP
Modules linked in: xen_pciback overlay crct10dif_ce ip_tables x_tables ipv6
PU: 0 PID: 34 Comm: kworker/0:1 Not tainted 6.0.0 #85
Hardware name: linux,dummy-virt (DT)
Workqueue: events virtio_gpu_dequeue_ctrl_func
pstate: 000000c5 (nzcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
pc : check_move_unevictable_folios+0xb8/0x4d0
lr : check_move_unevictable_folios+0xb4/0x4d0
sp : ffff8000081a3ad0
x29: ffff8000081a3ad0 x28: ffff03856ac98800 x27: 0000000000000000
x26: ffffde7b168ee9d8 x25: ffff03856ae26008 x24: 0000000000000000
x23: ffffde7b1758d6c0 x22: 0000000000000001 x21: ffff8000081a3b68
x20: 0000000000000001 x19: fffffc0e15935040 x18: ffffffffffffffff
x17: ffff250a68e3d000 x16: 0000000000000012 x15: ffff8000881a38d7
x14: 0000000000000000 x13: ffffde7b175a3150 x12: 0000000000002c55
x11: 0000000000000ec7 x10: ffffde7b176113f8 x9 : ffffde7b175a3150
x8 : 0000000100004ec7 x7 : ffffde7b175fb150 x6 : ffff8000081a3b70
x5 : 0000000000000001 x4 : 0000000000000000 x3 : ffff03856ac98850
x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000387000000
Call trace:
 check_move_unevictable_folios+0xb8/0x4d0
 check_move_unevictable_pages+0x8c/0x110
 drm_gem_put_pages+0x118/0x198
 drm_gem_shmem_put_pages_locked+0x4c/0x70
 drm_gem_shmem_unpin+0x30/0x50
 virtio_gpu_cleanup_object+0x84/0x130
 virtio_gpu_cmd_unref_cb+0x18/0x2c
 virtio_gpu_dequeue_ctrl_func+0x124/0x290
 process_one_work+0x1d0/0x320
 worker_thread+0x14c/0x444
 kthread+0x10c/0x110
 ret_from_fork+0x10/0x20
Code: 97fc3fe1 aa1303e0 94003ac7 b4000080 (f9404c00)=20
---[ end trace 0000000000000000 ]---

After some investigation I think I've found the cause of the problem:
This is the functionality, added in commit 3f9f1c67572f5e5e6dc84216d48d1480=
f3c4fcf6 which
introduces safe mechanism to unmap grant pages which is waiting until page_=
count(page) =3D 1
before doing unmap.
The problem is that DRM_IOCTL_MODE_CREATE_DUMB creates buffer where page_co=
unt(page) =3D 2.

On my QEMU test stand I'm using Xen 4.16 (aarch64) with debian based Dom0 +=
 DomU on the latest
kernels.
I've created some apps for testing:
The first one is to allocate grant refs on DomU:
https://github.com/oleksiimoisieiev/linux/tree/gntdev_map_buf_upstr_for-lin=
us-6.1_2
The name is test.ko and it can be built using command:
cd ./test; make
NOTE: makefile expects kernel build to be present on ../../test-build direc=
tory.

It should be run on DomU using command:
insmod test.ko; echo "create" > /sys/kernel/etx_sysfs/etx_value

Result will be the following:
[  126.104903] test: loading out-of-tree module taints kernel.
[  126.150586] Sysfs - Write!!!
[  126.150773] create
[  126.150773] =20
[  126.150888] Hello, World!
[  126.151203] Hello, World!
[  126.151324] gref 301
[  126.151376] addr ffff00000883d000
[  126.151431] gref 302
[  126.151454] addr ffff00000883e000
[  126.151478] gref 303
[  126.151497] addr ffff00000883f000
[  126.151525] gref 304
[  126.151546] addr ffff000008840000
[  126.151573] gref 305
[  126.151593] addr ffff000008841000

The second is for dom0 and can be found here:
https://github.com/oleksiimoisieiev/xen/tree/gntdev_fd

How to build:
make -C tools/console all

Result: ./tools/console/gnt_test should be uploaded to Dom0

Start: sudo ./gnt_test_map 1 301 302 303 304 305
Where 1 is DomU ID and 301 302 303 304 305 - grefs from test.ko output

This will create buffer using ioctls DRM_IOCTL_MODE_CREATE_DUMB them passes=
 it as backing=20
storage to gntdev and then destroys it using DRM_IOCTL_MODE_DESTROY_DUMB.
The problem is that when dumb buffer is created we observe page_count(page)=
 =3D 2. So
when before buffer release I'm trying to unmap grant refs using unmap_grant=
_pages it is calling
__gnttab_unmap_refs_async, which postpones actual unmapping to 5 ms because=
=20
page_count(page) > 1.
Which causes drm_gem_get_pages to try to free pages, which are still mapped=
.
Also if I change in the following line:
https://github.com/torvalds/linux/blob/bb1a1146467ad812bb65440696df0782e2bc=
63c8/drivers/xen/grant-table.c#L1313
change from page_count(item->pages[pc]) > 1 to page_count(item->pages[pc]) =
> 2 - everything works fine.
The obvious way for fix this issue I see is to make the expected page_count
for __gnttab_unmap_refs_async configurable for each buffer, but I'm now sur=
e
if this is the
best solution.

I would be happy to hear your thoughts and advises about how to fix this si=
tuation.

PS: IMX8QM configuration details:
IMX8QM board has XEN 4.16 with 2 domains:
DomU, which has 1 gpu core passed through and graphics should start;
Dom0, which has the second gpu core and weston.
Weston is starting on DomU via xen drm frontend/backend and using=20
zwp_linux_dmabuf_v1_interface to implement zerocopy support.
Details of zerocopy initialization:=20
 https://github.com/xen-troops/displ_be/blob/782471533dc1e7b38099a5583256bf=
e0c2be488c/src/displayBackend/wayland/WaylandZCopy.cpp#L410

Best regards,
Oleksii.
 =
