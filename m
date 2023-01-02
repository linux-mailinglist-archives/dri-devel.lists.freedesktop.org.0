Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCA465BC25
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 09:25:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0727010E3A5;
	Tue,  3 Jan 2023 08:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3820 seconds by postgrey-1.36 at gabe;
 Mon, 02 Jan 2023 14:45:44 UTC
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C421510E18F
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 14:45:44 +0000 (UTC)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 302Bx46C011991; Mon, 2 Jan 2023 13:41:51 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3mtd0uv746-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Jan 2023 13:41:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ABPLD1J8Kgnw715Dt1/2KX2dbDeje4uBexVMcbPScdgoa5Ic6kYbKvXO+cui/dem3U9LADmf/iKoHKFFeXuMfbZPp3U8KglwR5PTslS7OJkTJdQp1K0l5J+ufIDB1UpU6afpou/jC8ue08RNNHJqG+UAqfB0oXgLWtTqx2eFp0IugPVZKZxp2KBA9mz0yGdAbrY47e1FKNCJUk+PR/jWpeFBu6UTOMc5t9USRBdxJNGM5Tea+l/KV9Gzy0alkFTwZSbun43ey5NU6CC0bpzw1G5HdvUI5+hyMm0a08yqFJ66FNIlODhiPyNcLXPPdnwYy+pjje5Yu5kS8FKcst9ovQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iuEwZFP31bPDffsqU14aI2kPMruZO5ACTYwm5FDPm60=;
 b=B9R/I6QLYSiJU+rii9DHveI07cMZtlbZXngAXR/puw/cgHHwLp5JGWxVLrg+b3BTF2Q7WU4Z/DObyL6xLwXHlx5G4RAV2k2bKDhbyidMnRDo5sq8xCD15iFtpVjzL3tC2L3q7Qgy14QvilN3S7zgyf1O/3oP9sfwKGFY9V3w8iyghobsDLk5DlQiHN1H45QBzs6GaUwrXSaCRNBbehQ+mmg04w0fAWeuJ85YUoLzIy7XP1+qOwq4Uj5eTTpGWKuLuT6iO52xYVsv/P8iPYqExb6tmrAToRvAPHfOpeb8SW2sjIPtgQpKRfXvVk0CEXx3Y1mVGn8A6C2/v6RKrCdi1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iuEwZFP31bPDffsqU14aI2kPMruZO5ACTYwm5FDPm60=;
 b=Fj64byEjy6KUX0YgNrwxi4w4yTqByFsOVPSfZxAYH/vd6Q4mO6K0I929JQcT0CGUSh1iLJ6OVIt03Hl0cStQ0yQ2hhePHeIwmn19mSxc9aCbP25w3FPYsWgvVm19EMr7G5NnbGkWJW7LQe2uejzlWo8014RWSliHs/GLKMs60J++lOEHifxY81phUlClQxIRKuWZBr9pKxptY6IbkuS9T2dM5jEMgIOYRwsrBv1nc7DmGbBw5TfeFPY55tieXLeAmWgIvmVtzouTWQTpHKx0rAYrYA3eT5h88OeQjYD6iAV/jIgdyGWp0cAMtdP9mOVsKmFLBusZfvIdGW39WVP9WA==
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by DB9PR03MB9709.eurprd03.prod.outlook.com (2603:10a6:10:459::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Mon, 2 Jan
 2023 13:41:48 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::2da6:6d63:389b:3552]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::2da6:6d63:389b:3552%9]) with mapi id 15.20.5944.019; Mon, 2 Jan 2023
 13:41:48 +0000
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "jgross@suse.com" <jgross@suse.com>
Subject: [PATCH v1 0/3] Add ioctls to map grant refs on the external backing
 storage
Thread-Topic: [PATCH v1 0/3] Add ioctls to map grant refs on the external
 backing storage
Thread-Index: AQHZHq/2qxwFjlIdpkaeJi9xnPE21Q==
Date: Mon, 2 Jan 2023 13:41:48 +0000
Message-ID: <cover.1672666311.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR03MB7136:EE_|DB9PR03MB9709:EE_
x-ms-office365-filtering-correlation-id: d61e592b-7ca9-4505-ba47-08daecc7189d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K//txomNbdnSgoB7Ft87gMsqzlplA7ByfPveZH2lOQbvzABfonhwPmW8pHTNVcWTtxhsA5pikAmzM4H43dTGp5i67FfOE6KrsVW/xqecWgvPNpwRErzxifu/6Dh7LMSihwMtaA4ZNSJsAR5Bh7Ofo8G9TJ4zwgbQxcC+i8EvuQn5oFj41yWqthGpy5doxFGUZsePuUZrrZJURNp7H9wTJfZPr9M66lcICykSQJtytLyBXnYk4VFdf3OuCKWUkxXPLnhzpdAgsil+oTjBXbDQ5TEacgQB4Y6L9lt59W8/XuaaHqPUVUE96QFFTMU4tASrqj1T5GqGgxNvbMo05ijG7i5rDAUW8galctv+eyyR2EF1ygZBYj9ce+q4rmgE9g6b7MPadEhwy1bAhh52OVhgqA4UaaTD0ffgE6xLbwm8J2FoadXZY4dxq54JF8XrbLVHAxiEPseciaNfVFWVKslvmPS105pRW1ZRN2d0X8DLzQN9SGU40rj4rgm40/KDPDoS9wBlsa9fJwktvRREvui4tdnsPGj4DuhJzy42AsxUQ12Kz21QKNgm4rpEdmCSgXz/Q8KAFDQWpEqY7Jn2dfTwQw/X/ubqmjfaWPQx0nOFRjjwxO9qfOMc6BFaJ2V9qABylklJMBrGgAt3QNQ/5tlqJRftRFbfu0Dm0EyOIIUqZq61zsUty87JKWX/ln3ZTgwBGU35xLvoW+hkIb0dRxV2XLtAlHyksYaGai0kIpUbyHk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR03MB7136.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(136003)(376002)(39860400002)(366004)(451199015)(38100700002)(122000001)(86362001)(8676002)(38070700005)(66476007)(76116006)(66946007)(64756008)(66446008)(66556008)(6916009)(91956017)(4326008)(41300700001)(54906003)(316002)(2906002)(5660300002)(8936002)(2616005)(83380400001)(6512007)(478600001)(71200400001)(6486002)(6506007)(26005)(55236004)(186003)(36756003)(22166006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?PimHRKzqh67sap2y2kDEW/CM2rd3FBGTTabLIqTqSyMy/RLiHOm+gXm8aG?=
 =?iso-8859-1?Q?Hnuj2k+DTRaDD5ESNOehMMM846HY5OaQIkW3l4pjaaUfzUEhxjby2Ac1xK?=
 =?iso-8859-1?Q?XeDLrvdsSK+2BnhMlDHiXB7MTLeSE2E8GriDNay6Rg0zoIhthgVUqQAUbt?=
 =?iso-8859-1?Q?ifrpBbeO/oc3ErtvBDnbAFM1svMTk3dXPcybVgnRTXTuDoFieCZawXZrWe?=
 =?iso-8859-1?Q?ZiT5Dm3BVL0nXr2lRJ1ze8mcYM+OHSEtZirldOJoduV6vXz552ddktFqz7?=
 =?iso-8859-1?Q?qg1SsTjGNJtSLptzQ88HYATYXZHeeWJgzEEHwX6IpOVxazUWzHnKpwEtBW?=
 =?iso-8859-1?Q?4HnbQnEZy49jw28MWMsy8UYmt71KYKShDc+uBjCDTp1Xqdh1WLU5mxP5ZE?=
 =?iso-8859-1?Q?ViFQvCbsLM0jx67476k8SJMC4ZZOzupO0AZPMa29Z9R1RzyaTXiOCa9zHH?=
 =?iso-8859-1?Q?AjNR19bieXK/4dylgt4UGDyCQOrBWxDbRG4y64SljszHiGtZ4iZdzu1aA6?=
 =?iso-8859-1?Q?0nVLEhmpk2KtQKqjBA+HYQZXrX8sg2SWXEa3pObkLtxAjdoWmWdiuT8SKY?=
 =?iso-8859-1?Q?nb7gq3NO+o9syurpCfSjxqvCParte6GjpYJP91ItCJUWb0HPFJg1GFPAHv?=
 =?iso-8859-1?Q?DZNEQhimJzXKW+p/BQmdN9DWNWpSYInuTnWDuvGXyeRp0ixOGNlVMN5ycw?=
 =?iso-8859-1?Q?wKHcsMv+1ZTyraq8NgL04IkkQSlJ/dPTWNM0lOvwa9I1TCDBO+iW6xcrj1?=
 =?iso-8859-1?Q?9TPM3lLQ/b4SiGmGBXAJyffCCzdPXwgTAJjduf934bZ+IXPuYjit60YIgT?=
 =?iso-8859-1?Q?uU/nZSyrDoULkQvFArILSSEL5c9jcLUsfZcmVffEdFEY+YcRwcGHv/u51+?=
 =?iso-8859-1?Q?bUgdaaeju+jdcGFFla8Zc8BL3iO6Ynct9KpP3l4mXy4iLZfzq0nwnYvUXC?=
 =?iso-8859-1?Q?U/G7PVhp4Eut8dTLf/wY39NNhX/zHGA75m88nLBe2yPe2MyxG9ssZ6Wk8K?=
 =?iso-8859-1?Q?RmDJZGV4PU4yLtxVmusqZc62cZrGMo/cny0W0qRTdIUpgb+N+5X6ixu2ZI?=
 =?iso-8859-1?Q?Xi9Rqpi7hgThw7GA9fQQwFo0nPS2MTvZNZQuSLpL5qanaJgdK1AKEbQktO?=
 =?iso-8859-1?Q?j8/STEsx9CHPtOWCR7CpiuWyH3Y6/OqH5p6XGUTmAb0ze1SeXzhG7QBolX?=
 =?iso-8859-1?Q?R8xTxyYn+m+qG7LLIuP+UGb7cSmDAs3LyhMVgrNyQiclf2p2K/jcRGv9yx?=
 =?iso-8859-1?Q?HSYQlHoHpZbTRfNaCMoH2WupqAIzLrMOMa3Q6OgL81qXj7ydI40/Zh0FXb?=
 =?iso-8859-1?Q?6++sxxXzVIa9XxOvFpibW8O9W29l2taYNnkbZHadC+ar1SOrgcjNrAbxBU?=
 =?iso-8859-1?Q?p807cTlttC2AxOaZcT5VthKfvSpUCFZVO5p0x+cHDTqKJxYW6+2ppy+JRA?=
 =?iso-8859-1?Q?g6wcVY/lZqgSPKXiaZYcKebfU7b/MotBTCi098JvAYW6rSYr7+w4faH7gg?=
 =?iso-8859-1?Q?UkIsQyvfEd4FtBRbX6cQU7/ttc64DTWCP2jkhAxZZUytHjdFVd5cZCn1pC?=
 =?iso-8859-1?Q?ScOhRLV3Dk9VrgJk2kF/BpuUaTBBMFK6+3S4QQd6NZkPdieiAP7Gj6yzAD?=
 =?iso-8859-1?Q?mZbzlbnUSocfa+hX+HGmntj5hKBCpd0H0n7CK5Sv0tJkYz6ImXTtQyIw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d61e592b-7ca9-4505-ba47-08daecc7189d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2023 13:41:48.1514 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v8p9FkNMGcd+IAcNLFIF+4SgKpMOoAi7zGCwL0Q8hm7GPRWT8c9uD3HtozKM872KL0egO8w00Y3Y/YZBdiHg4+4C35ro1kP5trBmjT97ZdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB9709
X-Proofpoint-GUID: xU2f70Y-pvWxurXYXUo2TyiosKfNjL_N
X-Proofpoint-ORIG-GUID: xU2f70Y-pvWxurXYXUo2TyiosKfNjL_N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-02_08,2022-12-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=835 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301020124
X-Mailman-Approved-At: Tue, 03 Jan 2023 08:24:55 +0000
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
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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

--=20
2.25.1
