Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 724AF825E34
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jan 2024 05:36:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3BFA10E664;
	Sat,  6 Jan 2024 04:36:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2073.outbound.protection.outlook.com [40.107.94.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5846F10E664;
 Sat,  6 Jan 2024 04:36:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SpH7EmfgCRiwMdrmKRRs+XSLtk02m6LPgQYCIOSFcKM4TkoWLxqq2JVWRTef1n3yORvpjptqc8kmI3laCgORTLnmGiIzZWhmor1swAGp5CD0gGeuTWHAXssgtLNdVwplPF9RsWUyW1PYCEvo9gSJM6HYSAzjHifeA4iUXN/Pe6oZQ94q/5xHzMsgMZZrnAxbnSYKdaUhDKhsX5wFwpmZ+WDs/zGWrxZkk+zMfPG0sy3ht8Q5MLe1geiP3IkTfzqHYtz9+t9U4US+aCsV+v9tqzAqQE55uCxWwwsJ2e1NTOMveZRBWWDSL89O0Isk4RjpJWfNnt7TBZdCoSMS9LvSxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3nw9w4h8S1yEBPOp4oX3OY9jY1ik0Syb+z3Fb3xzxWg=;
 b=P9Ha2XgIqOMw4yJElwCiCGx+gf66EyQMvpcZkWU1mTkrgaGr3pnxSV3vId7hygzEDpIG7Wd1HBXZGBLFObECsTPDf14RTO43ZBhpQNpzQNLt0G9T7TmzyuLdBZJ3s2TANMSxyT3eLkOT8xsnDpJtMVLLPpOZkeiHa4Pp+EqSrzlX/LsieZqa0Poli92qUfvmIblqdJZju8VFAuC6dxy3Yuolijj062ziFvE7qtIC8KApsB+R3AYhbVm4y+0CcF6vuWnLg+WHs8tR7xQJO50dVAuBL9TBffjAuKZLxMqDB6z1FgTlhVv95jEShMoHM/WgC7HKX6mAgjwLoUJqayJR0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3nw9w4h8S1yEBPOp4oX3OY9jY1ik0Syb+z3Fb3xzxWg=;
 b=uzHPqTHY8FxjJF6AZlijQul07iXM3ZsmcEYOaO3jDjbHjtGJs2T+yXYmXVaKWGnx/2H23VMSym30JG0V9ggg53M4cervWnVJUVfVyh/wXTM2Diip0FbcPCJQuCOLWh2QBO3wG/9WwVfkMnfyygbSZr3IT36hhsC1nyCb9l5hf/k=
Received: from MN2PR12MB4128.namprd12.prod.outlook.com (2603:10b6:208:1dd::15)
 by CH0PR12MB8577.namprd12.prod.outlook.com (2603:10b6:610:18b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.15; Sat, 6 Jan
 2024 04:36:33 +0000
Received: from MN2PR12MB4128.namprd12.prod.outlook.com
 ([fe80::3508:1efc:dcab:74bb]) by MN2PR12MB4128.namprd12.prod.outlook.com
 ([fe80::3508:1efc:dcab:74bb%4]) with mapi id 15.20.7159.015; Sat, 6 Jan 2024
 04:36:33 +0000
From: "SHANMUGAM, SRINIVASAN" <SRINIVASAN.SHANMUGAM@amd.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, "Lee, Peyton"
 <Peyton.Lee@amd.com>
Subject: RE: [bug report] drm/amdgpu/vpe: enable vpe dpm
Thread-Topic: [bug report] drm/amdgpu/vpe: enable vpe dpm
Thread-Index: AQHaP985BqqR6akhvUS/7F0QbQOXprDMM79Q
Date: Sat, 6 Jan 2024 04:36:33 +0000
Message-ID: <MN2PR12MB4128CF05AAA26BA602B8C79090652@MN2PR12MB4128.namprd12.prod.outlook.com>
References: <efbcd813-8f22-44ad-a6e1-6bee6d3bb18c@moroto.mountain>
In-Reply-To: <efbcd813-8f22-44ad-a6e1-6bee6d3bb18c@moroto.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=808c98db-8dbc-4c12-acd2-98f1e320c497;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2024-01-06T04:35:27Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR12MB4128:EE_|CH0PR12MB8577:EE_
x-ms-office365-filtering-correlation-id: c70e8aef-b959-4ea6-8c14-08dc0e710f54
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4tauK8Kt7gPawqkdaatTEc3L2OPxtHbHDT9E/xABhAJ5JX0mptNvRLtlOPnYyyFSYI46U9IyepayF5125BlOgvNQ9zp/Jj1DmXhRbRPhDHVwt0Z6EvvSr6Gnxj0sc1c0BFQGrR4YM5bqoegXex4/HoYYJMf31ZEb46TVMX0RsahdmfGzvQfH7fnnY04zshf6tTWrpiJPLKB4IqrItC1hpjO09GBmS2Be0wB4129+RCpQnuRlnLYIu8z1HQ914kR8zWWXHlSi+aWpmaxZPol3cFUbSh9U5dA13uDX2JzHFZswjhzhhwYB/LMVAqLCguy21COJrXNHosqgg0BlwBoBSq08rpXwEvWki0rjfizOm3yRdJGJLedgZ8JbUh9yCjeZjIH7I1VI1tQdZkmqfpMPycisz7khqulnPZ32HuqGyzLhbwJkShXOdObwrX2k9ww0FZBGu5ryd6ekzqcvPPyrGNliGVH9ZBNsh/HfKykaRu4CrlNowkLQzlR6SoC8rhTKoZzaAqRsjuUuJVRb8y1OYvWUrxaifmeR+Z9TMBBMmUHP89pA/v4QBRdlxNnvPrB2HtqPPBTY6m7293e7rrXwnpvMTqoXPC6SrnGx0Qye08I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4128.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(230273577357003)(230922051799003)(230173577357003)(186009)(451199024)(1800799012)(38070700009)(33656002)(86362001)(83380400001)(38100700002)(122000001)(7696005)(53546011)(26005)(9686003)(55236004)(6506007)(54906003)(498600001)(71200400001)(110136005)(8936002)(8676002)(76116006)(66556008)(6636002)(66446008)(66946007)(66476007)(64756008)(55016003)(2906002)(966005)(4326008)(5660300002)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ih0v/5gM9SPT5O+EOpzeQdnkPciHlzujGayuiVFQHJlZmH+djRWRuM4Y+o5w?=
 =?us-ascii?Q?Ui6FHoqVR6vBE8B7jgZQFdw5BhowxlkyOL61xTZUZMh2BFM/qCBnFuj3Szr0?=
 =?us-ascii?Q?W8gqZf8ztujEfZgTIT7x0cZD+6BVnTrrebMyQr3XHHQ1BjCYPGja/fjGPCy/?=
 =?us-ascii?Q?ze3NnQEGsl8G567ecC5hQTkHaow1KvBM8Y0spAUP0I8w8k30FsVS96F0gWx3?=
 =?us-ascii?Q?kpU5Y8IQfPB0+8utAD/OSUGjbKkqRNxGbQBg3rMQEi8ZhrOJUBQHPxssUHlu?=
 =?us-ascii?Q?0DYw7ybnoO+q1MhE4VakFwqRkfZ1CzzTn9safOdAsFtQjWfRHDLJ3e0P6U0p?=
 =?us-ascii?Q?BIDPtu5Kl1GT+ETyvP2XRlxqOEHyyuThv6gajsEt0T6Rg3rh+uw9wn9TgD4q?=
 =?us-ascii?Q?my+/x+mPe8xDuXVmp1Hk0ZymRR0ZPiIlEPJwlUszaOYi855Bk6/E8OtApjao?=
 =?us-ascii?Q?f4/61V+r7fNYd7LgWR9s1kaNpdWbLY5lnwmRYw5coFhnIF3B0xLSgmfpXX51?=
 =?us-ascii?Q?PiBoWQXe9s45KHO4SlMz+9w4vAN6DRzCrviMdgtjcVVm5mmCEwdQaY4P2B/U?=
 =?us-ascii?Q?yS0Ow6ROogVrd4GGa0yw7vllR+aqgr4pjFJ3Y8o5lb1dqpBqPvAT7sTYoiC4?=
 =?us-ascii?Q?5D9J0D0Sd8z2n0N5M43b1rBGXQ9HN/eW3zr/9vAo445VBQyXwUvyY8MdNGS6?=
 =?us-ascii?Q?s6i/ncNwoTLdnuXY26AEXdxaH+wH6D7/oE7Zy32bUvTwP+/Bh8M/5QEfuD85?=
 =?us-ascii?Q?IKnsULvQ4LGF0B+1GGf+Kp/J5Y5zQ0cygw8d+mIKPjfKOAbQV3iwUKED6Nca?=
 =?us-ascii?Q?W/H4uRy7Zf/7TjWDljGtlqAx7JSDRKexsmKKA6Bu+PsRKldh1Jj3iHn26Bgp?=
 =?us-ascii?Q?PkDESOmwvJaQemmc/hlYnkH2P+4VpOICfY2EMvWTWRBcsjOqnQ4/85l7cn+d?=
 =?us-ascii?Q?RLRBUuPfLBwfvrB1w6q6wjrIJdd5AS63z5zj/+/fYRMfw9ULR1whUtC7AvXN?=
 =?us-ascii?Q?ao9RO8Fo8P2Rjd1mKnZ+x4pluB0c45cBcmuBgsrTQ9MXSaTzgt7PXu9qjp1a?=
 =?us-ascii?Q?1npYLB9szb+qswr141fMsPBQOP9Uk4lrvzeXrMV3Omq8Lu7387yFig5xGRjn?=
 =?us-ascii?Q?2DyodmIOZMeaFEaXyPnszW1B96WAAomEIrCWBZDwJ5vs3HFkUEhYS96Bq1UU?=
 =?us-ascii?Q?pSdSHE43x6QIUbcj1/OvNpVuAtM/jshVRCczmn8qkGC7CFmDxzveZe31nbnr?=
 =?us-ascii?Q?n0ZdL0Dblm3HVpN1dWTE3Xj2RJY/3Cm83KXHn4+YDmbiTyPvfz+XUy6w8er/?=
 =?us-ascii?Q?3P/zxAtZEDmLVlcCOehuOuEzzjgU21HDxuBglXKVE8glCCQqqJwD7dfj38yE?=
 =?us-ascii?Q?nwl8J7iW2l9u8onVmgN6cvOswc5fhikaiIlPer2Z0g3e9l4gZw6eEpIVRy5y?=
 =?us-ascii?Q?SJuD5LA5A0GvpSaIlGM9VaPPOZbEwcysHC7bM2MOkzTNFm//bF5C1CL0PGJl?=
 =?us-ascii?Q?vVDn9qp8dmQ0OChYfFhF9JM5vUnqn1AVRA6qCHrs1KQTUEfnz/NRBH38pG7S?=
 =?us-ascii?Q?vVL0BWiX/DNvVeAzK4k=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4128.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c70e8aef-b959-4ea6-8c14-08dc0e710f54
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2024 04:36:33.0592 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CSOXcKhITMNx2LgH8yd0h/6TkJ1BVFCGQa+bbwkqI3LQLSKkNiLv2K/U64LXjEVtax/+MjMqbvRQP4H2B1UNuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8577
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]

Hi Dan Carpenter,

This was fixed in https://patchwork.freedesktop.org/patch/573477/?series=3D=
128249&rev=3D1

Thank you!

Regards,
Srini

-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Dan Carp=
enter
Sent: Friday, January 5, 2024 7:04 PM
To: Lee, Peyton <Peyton.Lee@amd.com>
Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
Subject: [bug report] drm/amdgpu/vpe: enable vpe dpm

Hello Peyton Lee,

The patch 5f82a0c90cca: "drm/amdgpu/vpe: enable vpe dpm" from Dec 12,
2023 (linux-next), leads to the following Smatch static checker
warning:

drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c:62 vpe_u1_8_from_fraction() warn: u=
nsigned 'numerator' is never less than zero.
drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c:63 vpe_u1_8_from_fraction() warn: u=
nsigned 'denominator' is never less than zero.

drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
    60 static uint16_t vpe_u1_8_from_fraction(uint16_t numerator, uint16_t =
denominator)
    61 {
--> 62         bool arg1_negative =3D numerator < 0;
    63         bool arg2_negative =3D denominator < 0;

uint16_t can't be negative.

    64
    65         uint16_t arg1_value =3D (uint16_t)(arg1_negative ? -numerato=
r : numerator);
    66         uint16_t arg2_value =3D (uint16_t)(arg2_negative ? -denomina=
tor : denominator);
    67
    68         uint16_t remainder;
    69

regards,
dan carpenter
