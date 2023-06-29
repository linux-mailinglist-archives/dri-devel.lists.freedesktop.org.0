Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F72742945
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 17:16:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D1E10E12A;
	Thu, 29 Jun 2023 15:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2079.outbound.protection.outlook.com [40.107.223.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE2A10E3E0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 15:16:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZDVf4+XOG42tsoVoVepCd0vB5sntw9RFb0jmE2ABmIieusZz0YfIzFJra+uMF+n81hRS8BEWxfcCk0GClRhr8FKKxsBKftKFmCKKId80uJDr8O4mPTHmWYPgfH3HT2HmUn2e/ahQ4d9mjZ2GANeID5moKYyPn2Pwa/Lx5bYcGbYh7r8FMTpTmr+7mDbQNQLCWg3w6ZZegCuKaKpG7iIqdzmfVEav391fHlIZGJyI2O77aSsUpJvc2gclEzZSU1Vlg8d4xY1od5O9XKwRvAhypi4PWf12AlF1cVjBi1Mkk7ck1LDu88ujbVYD8OD4pA3hvHobVl2Rfff5C2TkyU5BUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vx9BClvpm6JFLHpEzpB3wsrM1Lo9H4ade4dGqtqa3Go=;
 b=jlI0rl+MvW1fIrh+PrfhI5qGXS1zCQfY7e+9GJNp4UdXLtNkHPQ9Dzh9RFXIHwzn9DWj9K3dXZINGeZ9qnSwBzpOCkui7Sma2kJ26xiHFo/CipWvKQfpdJwF57w8gjzLjQPmcxiro4hBG5IVAxhdSwxVqla7CYsV66NWiO1tzI+QS+L7T4IofG0DiXS8bKk3uzNPyyqF4i+6dVB4q7HQuCzeG4nBpMpX4a8RAgQZhMur1oOhdl0ui4A87ds4GiduUCNVr+Oo1QAhwF6YE3Q0yOJ/7G/934x30NQ7y8QCCyjDhQ3WmxLFtDNod0g6YQcKj5NCMJZ+zbDvdVAZcQ6XKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vx9BClvpm6JFLHpEzpB3wsrM1Lo9H4ade4dGqtqa3Go=;
 b=M1P+lD/ClqOG+AUcSyx5+epnjl1YHk1RkJ9jw6ZQWCJRhDzvBtsHkYI21NSRs4ZA4HM+tlI2vdMJ8IQYIk66ti4TIFDZnxY8JW4WBZsASJHnTZYw/aaHxg1fAkfjqCRUWhCEbd8UsYq73GJYvjwyYqi7MG6k1o7uuIfvNuI/E9c=
Received: from SN1PR12MB2445.namprd12.prod.outlook.com (2603:10b6:802:31::24)
 by DS0PR12MB6533.namprd12.prod.outlook.com (2603:10b6:8:c2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 29 Jun
 2023 15:16:41 +0000
Received: from SN1PR12MB2445.namprd12.prod.outlook.com
 ([fe80::8003:206f:4024:1bf]) by SN1PR12MB2445.namprd12.prod.outlook.com
 ([fe80::8003:206f:4024:1bf%3]) with mapi id 15.20.6521.023; Thu, 29 Jun 2023
 15:16:41 +0000
From: "Liu, HaoPing (Alan)" <HaoPing.Liu@amd.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2 0/3] Checksum Region with new CRTC properties
Thread-Topic: [PATCH v2 0/3] Checksum Region with new CRTC properties
Thread-Index: AQHZodEamtebEvQPrEa1WKpdImlNZq+h9LDA
Date: Thu, 29 Jun 2023 15:16:41 +0000
Message-ID: <SN1PR12MB2445E5F0BC29AA33077B08B6F525A@SN1PR12MB2445.namprd12.prod.outlook.com>
References: <20230618103847.614721-1-HaoPing.Liu@amd.com>
In-Reply-To: <20230618103847.614721-1-HaoPing.Liu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=3a45acd3-0958-4654-ab47-740eea8ddb4c;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-06-29T15:12:46Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN1PR12MB2445:EE_|DS0PR12MB6533:EE_
x-ms-office365-filtering-correlation-id: 259ecd91-4609-47d4-e1d8-08db78b3d787
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QoPOWi03cydpvardhlQ2F0X8NnEScBhwcFvNxFjBA1LIkQeSOPxCBsGeAd5RE/KW5gjdWwZHtFej/CrR2S+jTfCu/uVVfaywlvPyWP6s50FylWaXO8li5VE5FV7Fe8ZYYcjd7gyDwY0mPIlFGc9KaRYxGZtMopclWn2l3c3xKHswvHoKy0ogpYt9uVGUI43RFMkFtNxx1CW/6kejCLs4oHW7BVp5a7ajwVNdnWRNhZQUFrIhX2hzL5Hldp4D6lcxCSiqIkFEfwSK/anZJdPhOFhungzYXHjTSWFzxWKBJrlZFKqbFxgTR8AXpsH6iT7+Kh7tc/rklxJ9KG/q0f+3OwaQA4hc6xGfeQwDr+/+HH/7UQaKhJUMVl6aTqVza1+jrzDUP65ULF6uxTpXTODcwO3BZn2osTareQxDLgsO8xueIqEhF0KTVecgAW20lx6laZ/ntDpK1hoOvf3nw3DwNPYqj596P/sjMuQ6LXhhMzyC808z1GokLiTslGPG+7F2SvfjGwSrhayCZnwm93C/G0ahEn2qdr3FYNoAq+8vyEcPJn7kR9FbGYnZPRkypvX1fOCwI8pPwxxiYVL1wl0za4cfSUvlBqPst6Z6AytmdG1G6OIo6alytxUxcfkooYdT6ZV4aYs7dhZk3G6uHC3lBw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2445.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(366004)(136003)(39860400002)(376002)(396003)(451199021)(26005)(9686003)(2906002)(86362001)(7696005)(83380400001)(38100700002)(122000001)(53546011)(38070700005)(186003)(71200400001)(54906003)(966005)(41300700001)(55016003)(4326008)(478600001)(33656002)(64756008)(66946007)(66556008)(316002)(66446008)(76116006)(66476007)(6916009)(5660300002)(52536014)(8676002)(8936002)(6506007)(66899021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?i4e/joQ0YcnwKXjsejrMY39IE/hvAmqw35OVi8X4NN13PZiHveZkaswFsApR?=
 =?us-ascii?Q?0QF6lYku2nkwGQEDNPpQt7MAs/cgJKKwpcQGE4ozZZOe3H0rca9r0RlCLDb1?=
 =?us-ascii?Q?NMPMV6dWCl9b9W5mGRCl8xx+Y2glmC/seyE5S1zfzs7136UVbez3CW/lm6vG?=
 =?us-ascii?Q?KxvDZWAc4Rs8waCqIa8KYRpKZ4Q2nykFPG5l00H+hCC+gyzcDY+LiXKfL7YG?=
 =?us-ascii?Q?v4pl9sELiGsPC2/CHVe/OwxUU6TDAxyBdZBbMnnny1beU3wfF0lTpc0V2vsB?=
 =?us-ascii?Q?QK2SsxWJq1YyVBeUmG0rFg1UCqQTE9fOeh8w/tfxH2Qt3VobmcbzaXl+AO4W?=
 =?us-ascii?Q?ShSAw/adq50uEnacv9+qC+mOyJy4dd/sd77j7zwpjy18Dor7GBeIftYLWnnk?=
 =?us-ascii?Q?D+TN6qVnv0AU4juwI09nEpzBprcNA0XkgalwuE2v5WkEPM8nqWlUsHDiwe9X?=
 =?us-ascii?Q?CaTgT2gmlYzzxqRRkLMUvjSd4mBB/iimcjq2fee/x89MI01O6/SKxkGkBBtb?=
 =?us-ascii?Q?V0MP5YPXB13p1yzHXi4CBkQ8I7PbArP8RWkZ5Zbkeve2ZpCo+jzoTv9KuyDX?=
 =?us-ascii?Q?bGuy4GWEPY8TfPxASP3x5BuFkd8xkd+6g0u2zhSMcBx/UY1dBwAAWBpU+VzY?=
 =?us-ascii?Q?+LQ3IfFGt2oDTkux03xBi9b9zv+zjjqgVJk1tbEADOWquAyFYo0x6cvoaj7t?=
 =?us-ascii?Q?vgGWqkZH9bDSlwqj23Qo4Paw5yIhfTe90aRdynueFoYbjtSKaPxOdYqMttcW?=
 =?us-ascii?Q?E8k4pJ/Gf2TlNXjnzzFulrihv02KbZxdG5Pf1WFIzTe2LQ8ZB3hJ+Ztaz6/v?=
 =?us-ascii?Q?Z8uwaeuXFivr+6M51UtoMDk8PVueJXXh89t/8cLt93fB7rIw3qiwO1JRY4yx?=
 =?us-ascii?Q?UnjHl5+DwmKMy/TQk2IS2wqtp6nxkPE9wI2ZU4kUN0VKH/yuX+RLlXQhjM4/?=
 =?us-ascii?Q?8/Thd/hVu0lYVHYqKIDxHbtmqWayaiupVvAVDx1neaYB0Ap+CJ32rIqdBzQz?=
 =?us-ascii?Q?42iDe3xYg3vgVFqYCvZwnkA4wSWAVuG+FDiD1cwYIrFUsPP1LB+QP9R8nnjS?=
 =?us-ascii?Q?M03lgTrxtrfq0ZClK0Ie5PRfCBocD3l5eFsBe0nG83gmIxFK6KWyogx6kh5N?=
 =?us-ascii?Q?fUxVH9DEuAuc/O8SqCD5pMWv/40z1Tn+eYPFHpLsIUpnewuVwvA64JD/Ukdu?=
 =?us-ascii?Q?+33y5oh2V+8DSNnY/uv7uVQmnuZ1t/3ep3BTVftgIH5pMY00hWoPhbA4wA83?=
 =?us-ascii?Q?m3gUd1Z4SBiwLhRRCmbbR5mUZb7jxwe9UB0A828aac57tZqDd9cYfALqqthH?=
 =?us-ascii?Q?txRf1n5bcknfen2bOf3Rno4gex6DcWrGONt4ynawTik//0CKJcglp+nOiZUo?=
 =?us-ascii?Q?ZCudoCXC5a7uI22JrApeAJ37QXMWUeW/AiFfWnhxbGW7NzMrqlc7/mrKmMr4?=
 =?us-ascii?Q?d0JmRohyGBdBzitNi0S2lk5Z0UxEq4XA6ktCbfiPg0oFgqNjxfmZcnhUDsXG?=
 =?us-ascii?Q?gLUGRppkj+Q+4oV6suL8JL5kH9Jm8JWkx1MxuS7ulf9og03pW+Eef2o6ejRC?=
 =?us-ascii?Q?zqUwW+tDXx1r9DMp9cE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2445.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 259ecd91-4609-47d4-e1d8-08db78b3d787
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2023 15:16:41.2984 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FCmOto2Lxp44VGJVtTlqqfOHD0dK+/m17rt9sAt8AwnwzHJEkxHWIMDPyxrG/9HU3EFpHLE+2LIYKRZSfeJqzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6533
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
Cc: "Liu, HaoPing \(Alan\)" <HaoPing.Liu@amd.com>, "Lin,
 Wayne" <Wayne.Lin@amd.com>, "Gong, Lili \(Sophia\)" <Lili.Gong@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - General]

Dear DRM development community,

I also developed an IGT for testing this checksum_region feature.
Please check it at: https://patchwork.freedesktop.org/series/120017/
Thank you and welcome any feedback.

Best Regards,
Alan

-----Original Message-----
From: Alan Liu <HaoPing.Liu@amd.com>
Sent: Sunday, June 18, 2023 6:39 PM
To: dri-devel@lists.freedesktop.org
Cc: Wentland, Harry <Harry.Wentland@amd.com>; Gong, Lili (Sophia) <Lili.Gon=
g@amd.com>; Lin, Wayne <Wayne.Lin@amd.com>; Liu, HaoPing (Alan) <HaoPing.Li=
u@amd.com>; Liu, HaoPing (Alan) <HaoPing.Liu@amd.com>
Subject: [PATCH v2 0/3] Checksum Region with new CRTC properties

Dear DRM development community,

We'd like to introduce the implementation of the new crtc properties.

First of all, please let me introduce the problem we try to address. With t=
he popularity of electric vehicles, the car vendors have increasing require=
ment for ensuring the integrity of the critical content on the display. For=
 example, tell-tales are icons to indicate malfunction or operation on a ca=
r system. For safty concern, car vendors always want to make sure these ico=
ns are not tampered and can be correctly displayed on the instrument cluste=
r.

To address this problem, since modern display control hardware is able to c=
alculate the CRC checksum of the display content, we are thinking of a feat=
ure to let userspace specify a region on display, and we can utilize the ha=
rdware to calculate the CRC checksum as frames scanned out, and finally, pr=
ovide the checksum for userspace for validation purpose.
In this case, since the icons themselves are often fixed over static backgr=
ounds, the CRC of the pixels in the region can be known in advance. So one =
of the usage of the region and corresponding CRC result is that as users kn=
ow the CRC checksum of the tell-tales in advance, at runtime they can retri=
eve the CRC value from kernel for validation as frames are scanned out.

We implement this feature and call it checksum region. To let userspace set=
 a region and retrieve the corresponding CRC value, we provide 2 new proper=
ties, CHECKSUM_REGION and CHECKSUM_CRC. Both of them are blob properties un=
der CRTC, and the detailed struct of the two properties are listed below. O=
ne for userspace to set the region to kernel, and the other for userspace t=
o retrieve CRC values from kernel. Upon userspace submitting the 4 coordina=
te values with checksum_region_enable true, kernel instructs DC hardware to=
 calculate the CRC value accordingly as frames scanned out. The result CRC =
value of RGB colors are then stored in CHECKSUM_CRC property, with a refere=
nce frame count for userspace to know which frame the CRCs are calculated a=
t.

/**
 * struct drm_checksum_region - The enablement and region of checksum_regio=
n
 * @x_start: Horizontal starting coordinate of the region.
 * @y_start: Vertical starting coordinate of the region.
 * @x_end: Horizontal ending coordinate of the region.
 * @y_end: Vertical ending coordinate of the region.
 * @checksum_region_enable: To enable or disable checksum_region.
 *
 * Userspace uses this structure to configure the region and enablement for
 * checksum_region. Userspace should not submit a region out of the display=
able
 * region because there is nothing to display and need protection.
 */
struct drm_checksum_region {
        __u32 x_start;
        __u32 y_start;
        __u32 x_end;
        __u32 y_end;
        __u8 checksum_region_enable;
        __u8 pad[7];
};

/**
 * struct drm_checksum_crc - The CRC value of the corresponding checksum re=
gion.
 * @crc_r: CRC value of red color.
 * @crc_g: CRC value of green color.
 * @crc_b: CRC value of blue color.
 * @frame_count: a referenced frame count to indicate which frame the CRC v=
alues
 *  are generated at.
 *
 * Userspace uses this structure to retrieve the CRC values of the current
 * checksum region. @frame_count will be reset once a new region is updated=
 or
 * it reaches a maximum value. Currently these CRC values are designed to
 * be validated with pre-saved CRC values, so userspace doesn't need to con=
cern
 * about the algorithm used to compute the CRC.
 */
struct drm_checksum_crc {
        __u32 crc_r;
        __u32 crc_g;
        __u32 crc_b;
        __u32 frame_count;
};

To better introduce the usage of this feature, we also have a paired Weston=
 application as an reference app to use secure display via the properties. =
Please check the Weston application and see how the application set the reg=
ion and validate the content from the CRC here: https://gitlab.freedesktop.=
org/wayland/weston/-/merge_requests/1236
This application can draw patterns on the display, and allow users to set t=
he region and submit it to kernel via properties. With kernel keeping calcu=
lating the CRC, this example application takes the first CRC as source CRC,=
 and keeps retrieving the new CRCs at each frame later. By comparing source=
 CRC with the following CRC value, the application can validate if the disp=
lay content got changed down the road.

Finally, let me briefly introduce the patches. There are 3 patches in this =
patch series. The first patch is the main patch that contains change to drm=
, including the new CRTC properties, the property creation function and a u=
pdate_checksum_region_crc() CRTC callback.
        1. drm: Introduce CRTC checksum region and CRC properties

The remaining 2 patches are only related to the processing of region and CR=
C data in our driver, also listed here for your reference.
        2. drm/amd/display: Create checksum_region properties and handle ne=
w region update
        3. drm/amd/display: Implement the retrieval of checksum_region's CR=
C data

Thanks for the reading and hope to get your feedback soon!


v2:
- Change the name of secure display to checksum region.
- Move the new properties, their creation function and their state to drm l=
ayer.
- Improve comments on the new properties's usage and limitation.
- Add a new CRTC callback update_checksum_region_crc() for updating the CRC=
 checksum to the crc blob.
- Squash patches from 7 to 3.


Alan Liu (3):
  drm: Introduce CRTC checksum region and CRC properties
  drm/amd/display: Create checksum_region properties and handle new
    region update
  drm/amd/display: Implement the retrieval of checksum_region's CRC data

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  44 +++++++  .../drm/amd/d=
isplay/amdgpu_dm/amdgpu_dm_crc.c | 112 ++++++++++++++++--  .../drm/amd/disp=
lay/amdgpu_dm/amdgpu_dm_crc.h |  14 +++
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |  52 ++++++++
 drivers/gpu/drm/drm_atomic_state_helper.c     |   7 ++
 drivers/gpu/drm/drm_atomic_uapi.c             |  21 +++-
 drivers/gpu/drm/drm_crtc.c                    |  44 +++++++
 include/drm/drm_crtc.h                        |  43 +++++++
 include/uapi/drm/drm_mode.h                   |  42 +++++++
 9 files changed, 368 insertions(+), 11 deletions(-)

--
2.34.1

