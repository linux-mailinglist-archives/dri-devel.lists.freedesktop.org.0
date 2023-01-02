Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E28B65B523
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 17:36:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C143710E1A8;
	Mon,  2 Jan 2023 16:36:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B46010E1A8
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 16:36:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQigwWBF6x3OemHSKmW41oBtjIO4MMzBqTqTL+J4zOHnr9oco0p1nV4zs5Ok97SGgvgVe6FNO2866hZW3Ozap37V7bdcZP2/uY91Ez85HGZ5J+TVqiRs9/orSP/xBR4d1S5ALWa6NWOnMX2csFW85X2BEQqfpwNkOhYU9OOioDZWAwV/mAF6ddwGmGT86zkYc3Qdj+kP3roGanE3fkqj/MURLTyAcfP462ueGPJOt+kFiyDqxzWyZyZeKib/TN2dCimYu2FcNy7IFzx/yJr+LBCedIz3gpTpvFJYuUwa9W0Tl5gN2YvRLAE1vReAQ7f7wLP+vSPrjCFrXSyNkEm4ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81NAQSNOaG4Jfe/lCufx56HmfZ33XwLIlKF0EzKp46s=;
 b=UIQfa+4xwB3WSx+wbQsopZuMcKqSDVh3lZ2uX5kvaIIcJZRfQhQm4zJMy3eIkU03+EqP+nyr77VJdUkCuBhca75sZoc2h4sP8Jh32M5SSx9PBflm5BFTwCJAR2VeedOwufh4pt+o3cGCIIhF6kdfVjcmYTIT2I7l0XAHCAhPWK4fc3dxlGLt2yyABjiMWSpqPOuy4M24jnkPbtNtF7w9sO6LOWTGailBPMEPjKtnNjBYQxI2PVdZ8NezR9jUOXzGFhNOU+ur/a7hqzeqVAOXch65H93lr3dQI8hYQImjv/iEQeaF1XdVl+s+WndPRESJe1HFdqQiJ6lqYBSuppcCCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81NAQSNOaG4Jfe/lCufx56HmfZ33XwLIlKF0EzKp46s=;
 b=nlfBcXuKCGXLIb+RPD1HMhcaz4iiQBP4ViJ0GSGOw2xiQ8YnaAPXhpBod9LccGNWbLhT4ckz4lvsnZ56FzL/+yp+O0PsL3EdUAJrW0Gz9IFgxgWaVdY9Gp+GPHsDmWI7oHfunDxWl9X2Q/kQYR2yf/Hya3O/yaBlhlD0eMDXhrE=
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH0PR12MB5204.namprd12.prod.outlook.com (2603:10b6:610:bb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Mon, 2 Jan
 2023 16:36:14 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0%3]) with mapi id 15.20.5944.019; Mon, 2 Jan 2023
 16:36:13 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>, "jgross@suse.com"
 <jgross@suse.com>
Subject: AW: [PATCH v1 0/3] Add ioctls to map grant refs on the external
 backing storage
Thread-Topic: [PATCH v1 0/3] Add ioctls to map grant refs on the external
 backing storage
Thread-Index: AQHZHq/2qxwFjlIdpkaeJi9xnPE21a6LUk6x
Date: Mon, 2 Jan 2023 16:36:13 +0000
Message-ID: <BN8PR12MB3587673F8EF2642D267E943D83F79@BN8PR12MB3587.namprd12.prod.outlook.com>
References: <cover.1672666311.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1672666311.git.oleksii_moisieiev@epam.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=True;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-01-02T16:36:13.069Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR12MB3587:EE_|CH0PR12MB5204:EE_
x-ms-office365-filtering-correlation-id: d8e81b28-214b-4d4f-fe6b-08daecdf7696
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8lfP6iV9Cj8Jf/vzIyuWKa81TwB63aWW/m+BoHNfidtF6xE+G5DGFfdL9rQqy80aQTkKnf41J6eBOL4NwXskCpP+4oKhYYfiCvV0ADvfqbbaEg9YXkk8EpxqANuJQvGr4w6oMRHgQ84+8NfaVhSIDAN4Wg7KJwZXd5Gybsj85JPVVE5W2bzRWhbzNQqFZrGD5KPEkp3U3q/U7PB7Qabh91DogSG7QXxxmzkfi9lxIrsa6Iup7qDSHw9E9oaVgzXeFRakA/MnG6oeAJGfNBQDM+Z/XdZVn/JPkN6QKr8nmUqN3//3xLga9sa+nXg4w3JgbMS/uPgCv8S0CcGJPOWXgfbJWyL0V7+nQqW+4kSb5l0gY6X1DQQ746AWpg17UAreMe5gDqgYrZ+fr1hpKvdJs6Ru/lGlUNLhWkCuBCJKrDcJ7N0sF4smbrVaAhy9SIq27YhuhXvuUzgvgboekV+Rs06X01qT7tII0y3+woBxxyRJr5X91CatSefQMQapJNRzxvVaYNuPGvj4f85+DAC6W/9vskW6fRNcIMlRVsXPlcgWD6FIWz5m7715lXknIWZ+id+xI4hL0kYICR6sMvUp4714ftltCyyNPJIBK+c4n8mIFeQBG2kR9uNck2LqQvsv0UBVu67eUfQsc98J9hIVh3CD4H2YUI9yc5h+3e5H6ybw5LoBG3GdVqHMC1Mrck3RqLLTt39X6018gjWCs56Uf2Q90pJnmdhk3QlcIsbluyg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(39860400002)(346002)(396003)(136003)(451199015)(76116006)(8676002)(66946007)(4326008)(64756008)(66446008)(66476007)(91956017)(66556008)(41300700001)(38070700005)(316002)(54906003)(110136005)(2906002)(86362001)(5660300002)(122000001)(38100700002)(33656002)(7416002)(8936002)(55016003)(83380400001)(6506007)(478600001)(7696005)(186003)(9686003)(71200400001)(52536014)(19627405001)(22166006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?iynZLw+lWnlyJUuFnxCDxh0ai/Y+taz9/0TxacvKmUXxZ4pNx/vj+EH3gq?=
 =?iso-8859-1?Q?0kMRNyinvhUWXF0+Dv1Y4cs5JAOXfVXgJkAOXeCbCrfpqZ+SmSD6+2iTu9?=
 =?iso-8859-1?Q?JfDAQlLOb+EApigzE2fGA1hojOYbiJ5nyhl5lDFnNSx6vCD4tsvcPip0iN?=
 =?iso-8859-1?Q?CWMm0eO/nPD332qWUpH9yjCsQ2mLa8DKXXMrzkegu0kqIIVYA6LWVgZiak?=
 =?iso-8859-1?Q?XBi2N8vji5MuXW6gSOPRYWe6jaYxFGWvUZ7dvx8Gs+pIAAfsw3xzDMPJa3?=
 =?iso-8859-1?Q?+99t3QFFzFCh2UnLAcYGSyNiWjwi53Kp6hd1o3V8hqPD/5b+s9IVui3+n6?=
 =?iso-8859-1?Q?DRCm2+pIFNNeeBJN+6Zkil/gIGVJqChIH1alH/QyVEj4r6Dpaf1e0xg1oo?=
 =?iso-8859-1?Q?qXw4r2sO3Van9JOa0s3XjWjdUWGAWsUdP42Dx1J49POz3sM8B6zUGoW7RY?=
 =?iso-8859-1?Q?dmOfH+bP06K042aIMuu2APFoddmOZ4ZT2WBrmMWMp1eepo4pRvv0Wj7WC+?=
 =?iso-8859-1?Q?IwldBcHkyYiOnL9QEdbY7XMUUbvfefCQvxXHXjtMA04pEwrrsRzYcHVl9r?=
 =?iso-8859-1?Q?gujegkpoZw45y0K94imEYeP9SOI5T8JrxaWyEz80wIgA8TmDU+vUHkKbIU?=
 =?iso-8859-1?Q?355p3L2B3SYOfjPQWdKpTjRsWhzH0VEilO1oKJYh5n/8BfpevEC05/CXHT?=
 =?iso-8859-1?Q?Ki74tm/rBzeQ/sx0LhoG77g87tHe3iQrZReyTqJDD5DhJytbsG3SBe2l5x?=
 =?iso-8859-1?Q?y1m4rpSBKmbitpmm3dAVUEL9E1gpYtReoRC3fQMnH3B7DsBFRYCrm2Jnrp?=
 =?iso-8859-1?Q?lrZjuIkRfo2EDp0IZ4p678cxs6+rYuytefwhmAFL375aO8XVQSNQbz6Bp4?=
 =?iso-8859-1?Q?ME2jaZfPah2N+7ZkNYiBMddxlpD6HhxWEHHYDl1UOFR+jSZXZYuUVSiAy8?=
 =?iso-8859-1?Q?kd7PU7US3RNFtjp8ziClQ1l4d81aEpWOezLtL0QkpJQ9uxMAfFT08Tn7HD?=
 =?iso-8859-1?Q?oYHFRoKyju0lOdH+jO0XRqhALrdvSE+ZYMNlnvu+ssJBY1reuoP8PITbjS?=
 =?iso-8859-1?Q?shjfR2GeMIY2+MyA2n178lkildN8e1htCB3jjZ+nrId6GhyuYmJBgiUxeg?=
 =?iso-8859-1?Q?/ZZRCm6SNho0bCvCvxk1+EuxH10FnZmamF+mntK/GGQJsVE3rolrGrZSfC?=
 =?iso-8859-1?Q?or3IvTs7hVKnQ7Kl+pmQtDSsII82ARieIFwRv8NMNb9fSC6r2iopaueEbZ?=
 =?iso-8859-1?Q?ZKevTWk0gaGoGeWxBtxLFbxdMdT8ht/bPM44CXQfvzlGjdOLNbZzp6XatM?=
 =?iso-8859-1?Q?CuBBwim3YZHGW4b0ALlT5p4ljVpgd7agKWDaNibleWniSQgxnrbYAB4RMH?=
 =?iso-8859-1?Q?el1dnVVzSQWY/ChT+j+AoYDQnR2kt1mOCJ36jHVkO7zVtleMHwHcjrIure?=
 =?iso-8859-1?Q?uaqTWtqwach2GuoYjnh7O4LbVq2UaBPllK+Ic43QJWGfBAeFBpC71FEVGD?=
 =?iso-8859-1?Q?gl8K0O552ZFeBk86gvnLQb54wBSYZA/EPzBj4uJmG7dem2vY2gJ6Cw4URu?=
 =?iso-8859-1?Q?fkShI4MISlH9rikntgbzTE8VpRazk/urs0+vf+yIaPMHAIvK1IRYN3DEPv?=
 =?iso-8859-1?Q?snEYjiOFOkEazvqO719xzd754ELKRNf34laSo9hkA8BZYN6adqOFzry4wL?=
 =?iso-8859-1?Q?R4/A8b+WNO70/FyyDpg=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BN8PR12MB3587673F8EF2642D267E943D83F79BN8PR12MB3587namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8e81b28-214b-4d4f-fe6b-08daecdf7696
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2023 16:36:13.7503 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: idFrnxasVVJCk0pFQ8h95HH9zVeB9lUNVXY57oBtij/oJpQd8jBH9GAc94odtIIr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5204
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BN8PR12MB3587673F8EF2642D267E943D83F79BN8PR12MB3587namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

Sorry for the messed up mail. We currently have mail problems here at AMD.

________________________________
Von: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Gesendet: Montag, 2. Januar 2023 14:41
An: jgross@suse.com <jgross@suse.com>
Cc: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>; Stefano Stabellini <sst=
abellini@kernel.org>; Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>;=
 xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>; linux-ker=
nel@vger.kernel.org <linux-kernel@vger.kernel.org>; Sumit Semwal <sumit.sem=
wal@linaro.org>; Koenig, Christian <Christian.Koenig@amd.com>; linux-media@=
vger.kernel.org <linux-media@vger.kernel.org>; dri-devel@lists.freedesktop.=
org <dri-devel@lists.freedesktop.org>; linaro-mm-sig@lists.linaro.org <lina=
ro-mm-sig@lists.linaro.org>
Betreff: [PATCH v1 0/3] Add ioctls to map grant refs on the external backin=
g storage

Hello,

Let me introduce the new ioctls, which are intended to allow gntdev to
map scatter-gather table on top of the existing dmabuf, referenced by
file descriptor.

When using dma-buf exporter to create dma-buf with backing storage and
map it to the grant refs, provided from the domain, we've met a problem,
that several HW (i.MX8 gpu in our case) do not support external buffer
and requires backing storage to be created using it's native tools.
That's why new ioctls were added to be able to pass existing dma-buffer
fd as input parameter and use it as backing storage to export to refs.

This is a pretty big NAK from my side to this approach.

If you need to replace a file descriptor number local to your process then =
you can simply use dup2() from userspace.

If your intention here is to replace the backing store of the fd on all pro=
cesses which currently have it open then please just completely forget that=
. This will *NEVER* ever work correctly.

Regards,
Christian.

Following calls were added:
IOCTL_GNTDEV_DMABUF_MAP_REFS_TO_BUF - map existing buffer as the backing
storage and export it to the provided grant refs;
IOCTL_GNTDEV_DMABUF_MAP_RELEASE - detach buffer from the grant table and
set notification to unmap grant refs before releasing the external
buffer. After this call the external buffer should be detroyed.
IOCTL_GNTDEV_DMABUF_MAP_WAIT_RELEASED - wait for timeout until buffer is
completely destroyed and gnt refs unmapped so domain could free grant
pages. Should be called after buffer was destoyed.

Our setup is based on IMX8QM board. We're trying to implement zero-copy
support for DomU graphics using Wayland zwp_linux_dmabuf_v1_interface
implementation.

For dma-buf exporter we used i.MX8 gpu native tools to create backing
storage grant-refs, received from DomU. Buffer for the backing storage was
allocated using gbm_bo_create call because gpu do not support external
buffer and requires backing storage to be created using it's native tools
(eglCreateImageKHR returns EGL_NO_IMAGE_KHR for buffers, which were not
created using gbm_bo_create).

This behaviour was also tested on Qemu setup using
DRM_IOCTL_MODE_CREATE_DUMB call to create backing storage buffer.

---
Oleksii Moisieiev (3):
  xen/grant-table: save page_count on map and use if during async
    unmapping
  dma-buf: add dma buffer release notifier callback
  xen/grant-table: add new ioctls to map dmabuf to existing fd

 drivers/dma-buf/dma-buf.c   |  44 ++++
 drivers/xen/gntdev-common.h |   8 +-
 drivers/xen/gntdev-dmabuf.c | 416 +++++++++++++++++++++++++++++++++++-
 drivers/xen/gntdev-dmabuf.h |   7 +
 drivers/xen/gntdev.c        | 101 ++++++++-
 drivers/xen/grant-table.c   |  73 +++++--
 include/linux/dma-buf.h     |  15 ++
 include/uapi/xen/gntdev.h   |  62 ++++++
 include/xen/grant_table.h   |   8 +
 9 files changed, 703 insertions(+), 31 deletions(-)

--
2.25.1

--_000_BN8PR12MB3587673F8EF2642D267E943D83F79BN8PR12MB3587namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only - General]<br>
</p>
<br>
<div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb=
(255, 255, 255);">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">Sorry =
for the messed up mail. We currently have mail problems here at AMD.</span>=
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>Von:</b> Oleksii Moisieiev &lt;=
Oleksii_Moisieiev@epam.com&gt;<br>
<b>Gesendet:</b> Montag, 2. Januar 2023 14:41<br>
<b>An:</b> jgross@suse.com &lt;jgross@suse.com&gt;<br>
<b>Cc:</b> Oleksii Moisieiev &lt;Oleksii_Moisieiev@epam.com&gt;; Stefano St=
abellini &lt;sstabellini@kernel.org&gt;; Oleksandr Tyshchenko &lt;Oleksandr=
_Tyshchenko@epam.com&gt;; xen-devel@lists.xenproject.org &lt;xen-devel@list=
s.xenproject.org&gt;; linux-kernel@vger.kernel.org &lt;linux-kernel@vger.ke=
rnel.org&gt;;
 Sumit Semwal &lt;sumit.semwal@linaro.org&gt;; Koenig, Christian &lt;Christ=
ian.Koenig@amd.com&gt;; linux-media@vger.kernel.org &lt;linux-media@vger.ke=
rnel.org&gt;; dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedeskt=
op.org&gt;; linaro-mm-sig@lists.linaro.org &lt;linaro-mm-sig@lists.linaro.o=
rg&gt;<br>
<b>Betreff:</b> [PATCH v1 0/3] Add ioctls to map grant refs on the external=
 backing storage</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText elementToProof">Hello,<br>
<br>
Let me introduce the new ioctls, which are intended to allow gntdev to<br>
map scatter-gather table on top of the existing dmabuf, referenced by<br>
file descriptor.<br>
<br>
When using dma-buf exporter to create dma-buf with backing storage and<br>
map it to the grant refs, provided from the domain, we've met a problem,<br=
>
that several HW (i.MX8 gpu in our case) do not support external buffer<br>
and requires backing storage to be created using it's native tools.<br>
That's why new ioctls were added to be able to pass existing dma-buffer<br>
fd as input parameter and use it as backing storage to export to refs.</div=
>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof">This is a pretty big NAK from my si=
de to this approach.</div>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof">If you need to replace a file descr=
iptor number local to your process then you can simply use dup2() from user=
space.</div>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof">If your intention here is to replac=
e the backing store of the fd on all processes which currently have it open=
 then please just completely forget that. This will *NEVER* ever work corre=
ctly.</div>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof">Regards,</div>
<div class=3D"PlainText elementToProof">Christian.</div>
<div class=3D"PlainText elementToProof"><br>
Following calls were added:<br>
IOCTL_GNTDEV_DMABUF_MAP_REFS_TO_BUF - map existing buffer as the backing<br=
>
storage and export it to the provided grant refs;<br>
IOCTL_GNTDEV_DMABUF_MAP_RELEASE - detach buffer from the grant table and<br=
>
set notification to unmap grant refs before releasing the external<br>
buffer. After this call the external buffer should be detroyed.<br>
IOCTL_GNTDEV_DMABUF_MAP_WAIT_RELEASED - wait for timeout until buffer is<br=
>
completely destroyed and gnt refs unmapped so domain could free grant<br>
pages. Should be called after buffer was destoyed.<br>
<br>
Our setup is based on IMX8QM board. We're trying to implement zero-copy<br>
support for DomU graphics using Wayland zwp_linux_dmabuf_v1_interface<br>
implementation.<br>
<br>
For dma-buf exporter we used i.MX8 gpu native tools to create backing<br>
storage grant-refs, received from DomU. Buffer for the backing storage was<=
br>
allocated using gbm_bo_create call because gpu do not support external<br>
buffer and requires backing storage to be created using it's native tools<b=
r>
(eglCreateImageKHR returns EGL_NO_IMAGE_KHR for buffers, which were not<br>
created using gbm_bo_create).<br>
<br>
This behaviour was also tested on Qemu setup using<br>
DRM_IOCTL_MODE_CREATE_DUMB call to create backing storage buffer.<br>
<br>
---<br>
Oleksii Moisieiev (3):<br>
&nbsp; xen/grant-table: save page_count on map and use if during async<br>
&nbsp;&nbsp;&nbsp; unmapping<br>
&nbsp; dma-buf: add dma buffer release notifier callback<br>
&nbsp; xen/grant-table: add new ioctls to map dmabuf to existing fd<br>
<br>
&nbsp;drivers/dma-buf/dma-buf.c&nbsp;&nbsp; |&nbsp; 44 ++++<br>
&nbsp;drivers/xen/gntdev-common.h |&nbsp;&nbsp; 8 +-<br>
&nbsp;drivers/xen/gntdev-dmabuf.c | 416 +++++++++++++++++++++++++++++++++++=
-<br>
&nbsp;drivers/xen/gntdev-dmabuf.h |&nbsp;&nbsp; 7 +<br>
&nbsp;drivers/xen/gntdev.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 101 =
++++++++-<br>
&nbsp;drivers/xen/grant-table.c&nbsp;&nbsp; |&nbsp; 73 +++++--<br>
&nbsp;include/linux/dma-buf.h&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 15 ++<br>
&nbsp;include/uapi/xen/gntdev.h&nbsp;&nbsp; |&nbsp; 62 ++++++<br>
&nbsp;include/xen/grant_table.h&nbsp;&nbsp; |&nbsp;&nbsp; 8 +<br>
&nbsp;9 files changed, 703 insertions(+), 31 deletions(-)<br>
<br>
-- <br>
2.25.1<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_BN8PR12MB3587673F8EF2642D267E943D83F79BN8PR12MB3587namp_--
