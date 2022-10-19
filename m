Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 910E660584F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 09:22:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B018110E398;
	Thu, 20 Oct 2022 07:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 7348 seconds by postgrey-1.36 at gabe;
 Wed, 19 Oct 2022 12:46:21 UTC
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0245810E18C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 12:46:21 +0000 (UTC)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29JCJ04W021098;
 Wed, 19 Oct 2022 12:46:14 GMT
Received: from eur03-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur03lp2111.outbound.protection.outlook.com [104.47.30.111])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3k9ru8njrp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Oct 2022 12:46:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h6h3TxBzyzm0CAHxPXQ6tRB8vMEafiMMSak1RHc/8gPDtm1WKvujvR/QEQwwXpUURIgi0VTC4iOYqsT40Yu5HysJsgaI2bAc2v+mmhHWCltBzt+J+4bQeJAxel9pl9s2ydVgUOpekKR+Yw0zqx6xQPoIMejw9h3Ql7W1Fc5dPy+/fo8nx3617Im6PFSYaKojKSoiekt0lmgW+3g+BerB/ict0/xCExO4oto2OkGbeD9oXVyBrnvUqPo/nxuCF9Xh9Pc0LOaFCP5n4tdO3c3uYGhyywDmfanYKm3/pja7EUyVxxjv+Fd2Zhlu45jvzZjMioE0Fw1FzAMb5+SUxNaQuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S9WgTCEAkpuz8hI3Gi58gMbr+/FmkVsfuGpafWrHMcw=;
 b=Da5mTb+pH7a9VDxmomQu9fDgLXSObXMYLWjkBNVC8p0RSLLsBqoNqe7JMiVYHl8IPYwsxoPrWxg7OTArgoPaxCAnFzL55rjb6dt28hVky9UFxxnVIc6rgUZd8CHlxZMwEzewpMPerrm0pT2eUCIxccI3XzLNPG8v/9FFOiPykAz3X8pX78JzA0Yfkb6lNHxjzeJWiG+RYnD64jfIkUVUw74inOHb3xG5gbAfHyWB6WqcqY1QDvgf2q+HCRBgpH2TtQNFIF6encLClq1WXZ/v1CDubhNc47ZJi7PGVFXwJww2MP5bjhHMRFLccKXAtqpI4sX/LY8lkH0WxIAqA/zsuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S9WgTCEAkpuz8hI3Gi58gMbr+/FmkVsfuGpafWrHMcw=;
 b=ANyk0KQZ6lXtSw2sqyNaF0mz5LjodH9RhcOqo0zhZ69ytOmWTfOSlg28fQC7HZeN6h9SBCm7e9RhMLQiP8CBdXNhYhJaPfJjQHQWE1UIkCQIs5UuOvM6w3iIkRMfvfolVyJp9ZAUfOjucMeSOth4FmKpG2vymWP+A7fcexU1+w25HlYcUbkI9zTVHGEuFRxBFFfw+YVtz45teWO3ZmRFUJI1TB1rFlqNvymNKYzIj9P5eZi5/2o1GlG/PVlRbunEH8W3BJw7TIVPfj9IVmPH8lipzXOB6NvSfFTbrrzrJoCxHKMhGVYt/CbqWvRW2m96An/SF9NrB+kHE5rMcaI9iQ==
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by DB9PR03MB9830.eurprd03.prod.outlook.com (2603:10a6:10:454::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Wed, 19 Oct
 2022 12:46:07 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::551e:e1bc:b684:b7bb]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::551e:e1bc:b684:b7bb%9]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 12:46:07 +0000
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Juergen Gross <jgross@suse.com>
Subject: Re: Issue on unmap_grant_pages before releasing dmabuf
Thread-Topic: Issue on unmap_grant_pages before releasing dmabuf
Thread-Index: AQHY46egGI7L6jjRBkOb9R/tnZLb7K4VpcKAgAAEcoA=
Date: Wed, 19 Oct 2022 12:46:07 +0000
Message-ID: <Y0/xj+TA4YLdxJ2M@EPUAKYIW015D>
References: <Y0/U0RNDSRdV7bex@EPUAKYIW015D>
 <9a13e1aa-91a8-7b06-2807-769552639b0c@suse.com>
In-Reply-To: <9a13e1aa-91a8-7b06-2807-769552639b0c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR03MB7136:EE_|DB9PR03MB9830:EE_
x-ms-office365-filtering-correlation-id: b6d7a8fb-bb11-4859-57fb-08dab1cfe477
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F4n0dz/buoVW7NLBWjjhjJAibcNj1qBpRY7kEVOxxoHkjbg/FGOIeHHvR/lVnC19zVI7Z0+f05/Z8m/CaE7QtBeuk/7OAwAO6fYvQkKv3Y09AuYNaW6VNOPkyzcwmtlwXHesL5xi+XzPTbhQo9HaxWefK2iOrxqHbP9oIyCYbd2C4NZ3pmZNokmxGH5GM89i/HvT+Mp4oQvKrfMzB8/SOtdnd1J0icWkpkpF199eL4mxhrxKvyzPyUizxisv3VDf0ctRETRiPMWXuNZNA99RSrDNh+SmezmPAf+FsRYOfZ4J7JWoYexXBtH3zFSmvlgCqmBGb/i1NUItZG04SlYfbjqbGGKM0FrOrdFEYgNSIsAqQcn8KZLgrOSQ6vP8SOOxiI7wb4IGjyU1hyEWfp6Mav/Q9e5CNHhY7y8IGH+GZePBzRb6ezXxtL948BM1RN38un7/fQNAN4t0/1CUYVMsa7xYr5ibQftZMrA4t3L5jYm9vYC41UufK1RGmOkBGbydiyRWR8V8uJoFpzZwyyULItIC9bvFCETrYzCM8wVvjg0CS9wYuqISgXGOeoY1iRU/hp2H1zBcuczDWy/FoeZTFMXL+G8JRsNdfjV+p8o2ry2WSk08i2trgzKNcYn6JuBlE7gH9ARIyZXaP4xS+wsPOaw2wUExfhCEFMk+ewCYv3ZqnkzHL1oTfRlXiWzLuzqYnSdiu+hti/riOZH9ALaC01u9+ojf/rDeA+TTYyZi0HTKDx2+NLKwnXkC4TNCeIUYGAu+zlhK1Lp+AyFw6tXc3PfbdqgOO240jW0mwIFtcszP9sciJhM+3GrDG/VnQSaNKz/qVZvP5/yArPLMrCw84A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR03MB7136.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(84040400005)(451199015)(316002)(6916009)(64756008)(4326008)(186003)(6506007)(54906003)(26005)(6512007)(8936002)(2906002)(86362001)(9686003)(41300700001)(53546011)(83380400001)(66446008)(66946007)(76116006)(91956017)(66556008)(66476007)(8676002)(5660300002)(33716001)(71200400001)(122000001)(38070700005)(6486002)(45080400002)(38100700002)(478600001)(966005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vXbCIu7qXUHMs34y2WnD1Wq7yGRIyUbSDN5huq/V04m8Xzf608WsKs+xnelU?=
 =?us-ascii?Q?T1/8mI5Gj07sSZgyQ7szuHx0soLIyF5IcdrStrLFuIu+JGvVB7pEzZADHMQ5?=
 =?us-ascii?Q?VI+DRDeKOJHnUcFAo+rDjwFDcJMTvF0ByB0gq2WTvZnkNqz1mgUXOh1JomAN?=
 =?us-ascii?Q?i1qiBtkk1FI+Y5xzAsNdCvwD0L0A+/LSzN9HjUV7V94Rr7sCA/pFeymEyaxx?=
 =?us-ascii?Q?TIt0GfKlgvACPyFXwNd0hHmoUiXLI71PqROnt9PoOZYTRkZ38IXnhTwUPuIR?=
 =?us-ascii?Q?DXKnT+4q7VhoBpSOw0Uy3Y6aKrbIQxVJ59YxW451V3Z4yQbm+i27aZtyVbHJ?=
 =?us-ascii?Q?SeE0lQiF2mJb+tw6sce1eRsfVU9ctZyhyRnU75254GF8iI/M3y279+2PFLaG?=
 =?us-ascii?Q?jWrMf60etpSyP85FXk74jfURoVZ+mqYVS3U0ZFsfhLECh0TaAqOyv1cVSQft?=
 =?us-ascii?Q?/7y3L/jynGidWF0JU3qVOhhU33ta446A2hVKkvR9VOt01CeA8V4TwLqsBtXT?=
 =?us-ascii?Q?g6k0yRnmAItstLjfmSxO4i4/Vr4aYtPNCzucDZ3ifCXUnKGBDvN4d5hZYxwL?=
 =?us-ascii?Q?zEWNrTwZh8itYzESTKrzXO1YQcnPGjReINkTXd5lVpRIEwmOBCnoI2ebemdM?=
 =?us-ascii?Q?Jg0a/kr1O6tQSWFLEWgZNcYQPcz74nCQDPWZz31mHWG7nfETynobji1l3BlH?=
 =?us-ascii?Q?y59b4ZlhQL+tIo2ANQIgZND/bvPzuWWp0TWQMkoq+JkeFZfBKGuBXQqqxqFn?=
 =?us-ascii?Q?PJp0WlXKrpXWmSfiE2qrV1m0DqNTLbhAeUJzv+J8ZnsLfC2zn6IqlChepuuW?=
 =?us-ascii?Q?b3MXzplwdWdvShja2Jh7n/dStS6y1Jzsn6vIy+R/BU9T7gAdOygCfQduIe7y?=
 =?us-ascii?Q?WegymwJTRK0ROXOWzaXPAvmIq3Lhtk6WuL+/0CoOmvb2w387UqrpL63w33Sb?=
 =?us-ascii?Q?1Sk4htnHl2vPHkbMeJx64T3WmEXLohyjkvRj4HC0R5vzYiRk8Ka4rpWHO54n?=
 =?us-ascii?Q?TfYh+tf/PbF34YWqUuGXHdMXgon7o5Cf4om+9zT+kcSaAyRDnCmpGxsFv1NG?=
 =?us-ascii?Q?NSqsGJ3jzRVbBvTJB/Dnq6c1j5F2Z9uB131yhorho2oGZpRKzc5NMzhVsofu?=
 =?us-ascii?Q?YkKcUTf65FWR/iBYPIYXMQaw+Gb45PLDqFgOsQuyIyx0ii8sjz+EXL0V1wZX?=
 =?us-ascii?Q?I5ACpaf5tNchBXR9gmNFRSZw27lRvZ+QGG4mT8yp3se1Q5gZBTm062TY1DSE?=
 =?us-ascii?Q?8m4w28Dfv/TDMS+dqE2jx0wp/aYItOHbGtnAQufUuxA0zkRuzURTh3zUw9po?=
 =?us-ascii?Q?UBvoFI61oTTFzJGbyTZgh34GbiU3/f6c4wyLquYSW96/il8QcuOHVqvT21aE?=
 =?us-ascii?Q?rI1jFN0AfEuijYWEJcVR/hVS4TSua3iiTW3mqSSl08paW6mCHCy3pXzr/QHW?=
 =?us-ascii?Q?XKI94gjaYkxGtjTADHLNPE1i3HlbRyXoKKGSNsRuMZI6ZcxpbN+1M5J+lFpW?=
 =?us-ascii?Q?4SwwaIK4Zz/c+wsuMTevIxfHlnyS1DBEpHj93dOJg+St4pZIluecQE8ExlN3?=
 =?us-ascii?Q?iXQDDhxU+LLHqdqSRC6r91gI50SPj3KVw7eUttu2ZNv6Yg5e6GWNkXPkpULb?=
 =?us-ascii?Q?+Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C041C1E4FC319C43B0C76BE07351FE99@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6d7a8fb-bb11-4859-57fb-08dab1cfe477
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2022 12:46:07.5407 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uUtL81rzEnAmi7emDdh0JlC5X77tyrBhVtHX7rVxQQidRLnBUQbbgFAcu9OzXst6iYP9CLhaOs1gRnJPpolM2q2Gw52NVa/ROO5U3xOH7ao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB9830
X-Proofpoint-ORIG-GUID: BRe2ekHQ9FEKnw-sF6ZtJ-FRmZFkq8iR
X-Proofpoint-GUID: BRe2ekHQ9FEKnw-sF6ZtJ-FRmZFkq8iR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-19_07,2022-10-19_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 mlxscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210190071
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "jennifer.herbert@citrix.com" <jennifer.herbert@citrix.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 19, 2022 at 02:30:13PM +0200, Juergen Gross wrote:
> On 19.10.22 12:43, Oleksii Moisieiev wrote:
> > Greetings.
> >=20
> > I need your advise about the problem I'm facing right now:
> > I'm working on the new type of dmabuf export implementation. This
> > is going to be new ioctl to the gntdev and it's purpose is to use
> > external buffer, provided by file descriptor as the backing storage
> > during export to grant refs.
> > Few words about the functionality I'm working on right now:
> > My setup is based on IMX8QM (please see PS below if you need
> > configuration details)
> >=20
> > When using dma-buf exporter to create dma-buf with backing storage and
> > map it to the grant refs, provided from the domain, we've met a problem=
,
> > that several HW (i.MX8 gpu in our case) do not support external buffer
> > and requires backing storage to be created using it's native tools
> > (eglCreateImageKHR returns EGL_NO_IMAGE_KHR for buffers, which were not
> > created using gbm_bo_create).
> > That's why new ioctls were added to be able to pass existing dma-buffer
> > fd as input parameter and use it as backing storage to export to refs.
> > Kernel version on IMX8QM board is 5.10.72 and itworks fine on this kern=
el
> > version.
> >=20
> > New ioctls source code can be found here:
> >   https://github.com/oleksiimoisieiev/linux/tree/gntdev_map_buf_upstr_f=
or-linus-6.1_2
> > Now regarding the problem I've met when rebased those code on master:
> > On my test stand I use DRM_IOCTL_MODE_CREATE_DUMB/DRM_IOCTL_MODE_DESTRO=
Y_DUMB ioctls
> > to allocate buffer and I'm observing the following backtrace on DRM_IOC=
TL_MODE_DESTROY_DUMB:
> >=20
> > Unable to handle kernel paging request at virtual address 0000000387000=
098
> > Mem abort info:
> >    ESR =3D 0x0000000096000005
> >    EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> >    SET =3D 0, FnV =3D 0
> >    EA =3D 0, S1PTW =3D 0
> >    FSC =3D 0x05: level 1 translation fault
> > Data abort info:
> >    ISV =3D 0, ISS =3D 0x00000005
> >    CM =3D 0, WnR =3D 0
> > user pgtable: 4k pages, 48-bit VAs, pgdp=3D000000006df98000
> > [0000000387000098] pgd=3D0800000064f4f003, p4d=3D0800000064f4f003, pud=
=3D0000000000000000
> > Internal error: Oops: 96000005 [#1] PREEMPT SMP
> > Modules linked in: xen_pciback overlay crct10dif_ce ip_tables x_tables =
ipv6
> > PU: 0 PID: 34 Comm: kworker/0:1 Not tainted 6.0.0 #85
> > Hardware name: linux,dummy-virt (DT)
> > Workqueue: events virtio_gpu_dequeue_ctrl_func
> > pstate: 000000c5 (nzcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> > pc : check_move_unevictable_folios+0xb8/0x4d0
> > lr : check_move_unevictable_folios+0xb4/0x4d0
> > sp : ffff8000081a3ad0
> > x29: ffff8000081a3ad0 x28: ffff03856ac98800 x27: 0000000000000000
> > x26: ffffde7b168ee9d8 x25: ffff03856ae26008 x24: 0000000000000000
> > x23: ffffde7b1758d6c0 x22: 0000000000000001 x21: ffff8000081a3b68
> > x20: 0000000000000001 x19: fffffc0e15935040 x18: ffffffffffffffff
> > x17: ffff250a68e3d000 x16: 0000000000000012 x15: ffff8000881a38d7
> > x14: 0000000000000000 x13: ffffde7b175a3150 x12: 0000000000002c55
> > x11: 0000000000000ec7 x10: ffffde7b176113f8 x9 : ffffde7b175a3150
> > x8 : 0000000100004ec7 x7 : ffffde7b175fb150 x6 : ffff8000081a3b70
> > x5 : 0000000000000001 x4 : 0000000000000000 x3 : ffff03856ac98850
> > x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000387000000
> > Call trace:
> >   check_move_unevictable_folios+0xb8/0x4d0
> >   check_move_unevictable_pages+0x8c/0x110
> >   drm_gem_put_pages+0x118/0x198
> >   drm_gem_shmem_put_pages_locked+0x4c/0x70
> >   drm_gem_shmem_unpin+0x30/0x50
> >   virtio_gpu_cleanup_object+0x84/0x130
> >   virtio_gpu_cmd_unref_cb+0x18/0x2c
> >   virtio_gpu_dequeue_ctrl_func+0x124/0x290
> >   process_one_work+0x1d0/0x320
> >   worker_thread+0x14c/0x444
> >   kthread+0x10c/0x110
> >   ret_from_fork+0x10/0x20
> > Code: 97fc3fe1 aa1303e0 94003ac7 b4000080 (f9404c00)
> > ---[ end trace 0000000000000000 ]---
> >=20
> > After some investigation I think I've found the cause of the problem:
> > This is the functionality, added in commit 3f9f1c67572f5e5e6dc84216d48d=
1480f3c4fcf6 which
> > introduces safe mechanism to unmap grant pages which is waiting until p=
age_count(page) =3D 1
> > before doing unmap.
> > The problem is that DRM_IOCTL_MODE_CREATE_DUMB creates buffer where pag=
e_count(page) =3D 2.
> >=20
> > On my QEMU test stand I'm using Xen 4.16 (aarch64) with debian based Do=
m0 + DomU on the latest
> > kernels.
> > I've created some apps for testing:
> > The first one is to allocate grant refs on DomU:
> > https://github.com/oleksiimoisieiev/linux/tree/gntdev_map_buf_upstr_for=
-linus-6.1_2
> > The name is test.ko and it can be built using command:
> > cd ./test; make
> > NOTE: makefile expects kernel build to be present on ../../test-build d=
irectory.
> >=20
> > It should be run on DomU using command:
> > insmod test.ko; echo "create" > /sys/kernel/etx_sysfs/etx_value
> >=20
> > Result will be the following:
> > [  126.104903] test: loading out-of-tree module taints kernel.
> > [  126.150586] Sysfs - Write!!!
> > [  126.150773] create
> > [  126.150773]
> > [  126.150888] Hello, World!
> > [  126.151203] Hello, World!
> > [  126.151324] gref 301
> > [  126.151376] addr ffff00000883d000
> > [  126.151431] gref 302
> > [  126.151454] addr ffff00000883e000
> > [  126.151478] gref 303
> > [  126.151497] addr ffff00000883f000
> > [  126.151525] gref 304
> > [  126.151546] addr ffff000008840000
> > [  126.151573] gref 305
> > [  126.151593] addr ffff000008841000
> >=20
> > The second is for dom0 and can be found here:
> > https://github.com/oleksiimoisieiev/xen/tree/gntdev_fd
> >=20
> > How to build:
> > make -C tools/console all
> >=20
> > Result: ./tools/console/gnt_test should be uploaded to Dom0
> >=20
> > Start: sudo ./gnt_test_map 1 301 302 303 304 305
> > Where 1 is DomU ID and 301 302 303 304 305 - grefs from test.ko output
> >=20
> > This will create buffer using ioctls DRM_IOCTL_MODE_CREATE_DUMB them pa=
sses it as backing
> > storage to gntdev and then destroys it using DRM_IOCTL_MODE_DESTROY_DUM=
B.
> > The problem is that when dumb buffer is created we observe page_count(p=
age) =3D 2. So
> > when before buffer release I'm trying to unmap grant refs using unmap_g=
rant_pages it is calling
> > __gnttab_unmap_refs_async, which postpones actual unmapping to 5 ms bec=
ause
> > page_count(page) > 1.
> > Which causes drm_gem_get_pages to try to free pages, which are still ma=
pped.
> > Also if I change in the following line:
> > https://github.com/torvalds/linux/blob/bb1a1146467ad812bb65440696df0782=
e2bc63c8/drivers/xen/grant-table.c#L1313
> > change from page_count(item->pages[pc]) > 1 to page_count(item->pages[p=
c]) > 2 - everything works fine.
> > The obvious way for fix this issue I see is to make the expected page_c=
ount
> > for __gnttab_unmap_refs_async configurable for each buffer, but I'm now=
 sure
> > if this is the
> > best solution.
> >=20
> > I would be happy to hear your thoughts and advises about how to fix thi=
s situation.
>=20
> My first thought would be to save the page_count() of each page when doin=
g
> the map operation, and then compare to that value.
>=20
> The natural place to store this count would be struct xen_page_foreign,
> but there are only 16 bits free for the 64-bit system case (it is using
> the struct page->private field for that purpose), so you'd need to bail
> out in case page_count() is > 65535.
>=20
>=20
> Juergen

Hello Juergen,

Thank you for the advise.
I think I'll use this approach if everybody fine with it.

Best regards,
Oleksii.=
