Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3740736EC84
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 16:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1453F6EEAD;
	Thu, 29 Apr 2021 14:41:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17A5B6EEAD;
 Thu, 29 Apr 2021 14:41:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RgEHCEYuEfdEBKfHqTqADDwHLKyUpwlIhR5x0VxD7RbxGmbvq47euv2FbZUqqV1L7bG+0KhsarU0ZoUxJCMqTmvyzTelfd4ZSHaUJNfZ+Xnn4/6qm54ZjatLnFdgNqx/MgRbeawczs3lo7FHJZRcuQmrXiI3ybIoNbWIsdTGQ/hal8piYidKd7+Y4dEvgHH3LQ5Wbd+d81gC3ZhqhJ+9YI6Mi+rUGF/xMTjDr7WBYBc1TPNOvPeQ9AUS/eIiJoMEnPibhYaRVjoITc5WNk93z+Zev9a7zoODNdl7s7YHw4ibLkJLBDR3S/NfTOwbiSlO9vKTlkP2Tyc6J3PMTIawBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KsprsxJQ+bz52NoIk38GW3lG7+q5uCUkCBGEap9atV4=;
 b=hvPWiNkpcVnhIbw3RFtXCvVLKFp7rFqPbkrwHhzNqBN4CQNOPDegsDdqn9Y1W/xPRaDw+IABG92LWxBk5DNYg2p5iKD9nq9f91sxXfIvqODHQhd712Khr9S9zO9TYbiJjCVd8Vw4avGvrH1C2nlFGroBy7Py5cyo5PO9HYcRNHqnKrmKJ5CV8sVgtL4GL1/Gcxmufk/n+PR3gys1SJcolZ6/bOgaEHzuR6dVZZL3IL4JsImPNoMV6u5Rb686S8t8p6xkX3Xhr1aDH9P7N6jg14MCREBUzVbX4nqecbw/2Sl+CIzUUqMGNB3Ir3p+iZtfM3cwMED0dUownZeJ4qlngA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KsprsxJQ+bz52NoIk38GW3lG7+q5uCUkCBGEap9atV4=;
 b=BEdPM1GgDoXSe8xCTyTA5JGRiOplZuqEmuLyMeu80sJ1M6ZvIT6WJj+8UcrJ3vAzErJZZpDrDPsdTGiygx/vdoh2/ExbPBCXbR0v6Lajy2C4pLTzt9L/ENm15TXbgwJc+xvQMGFbx2/5N/AlLgYU4/F2Hzg9SAtKcuwU5QeAGHQ=
Authentication-Results: vivo.com; dkim=none (message not signed)
 header.d=none;vivo.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB2601.namprd12.prod.outlook.com (2603:10b6:5:45::27) by
 DM6PR12MB2859.namprd12.prod.outlook.com (2603:10b6:5:15d::29) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21; Thu, 29 Apr 2021 14:41:26 +0000
Received: from DM6PR12MB2601.namprd12.prod.outlook.com
 ([fe80::3d2c:5edf:5d51:4101]) by DM6PR12MB2601.namprd12.prod.outlook.com
 ([fe80::3d2c:5edf:5d51:4101%7]) with mapi id 15.20.4065.027; Thu, 29 Apr 2021
 14:41:26 +0000
Date: Thu, 29 Apr 2021 10:41:21 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Jiabing Wan <wanjiabing@vivo.com>
Subject: Re: [PATCH] drm/amd/display: Remove duplicate include of hubp.h
Message-ID: <20210429144121.v6ycsvwkk64s7grp@outlook.office365.com>
References: <20210429120504.sjruq5a3w2hdtusy@outlook.office365.com>
 <AN*ARACWDmq3kx33Z4tCR4oU.3.1619698995121.Hmail.wanjiabing@vivo.com>
In-Reply-To: <AN*ARACWDmq3kx33Z4tCR4oU.3.1619698995121.Hmail.wanjiabing@vivo.com>
X-Originating-IP: [2607:fea8:56e0:6d60:9d3b:95a7:19db:40c3]
X-ClientProxiedBy: BN6PR2001CA0010.namprd20.prod.outlook.com
 (2603:10b6:404:b4::20) To DM6PR12MB2601.namprd12.prod.outlook.com
 (2603:10b6:5:45::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from outlook.office365.com (2607:fea8:56e0:6d60:9d3b:95a7:19db:40c3)
 by BN6PR2001CA0010.namprd20.prod.outlook.com (2603:10b6:404:b4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27 via Frontend
 Transport; Thu, 29 Apr 2021 14:41:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9405ca4-e484-4fa6-5b63-08d90b1cddbe
X-MS-TrafficTypeDiagnostic: DM6PR12MB2859:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB285965FFD1564389AFAC459C985F9@DM6PR12MB2859.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZVEtGHvgYoMnkUgM1iK0nBjme2nla9FxPPbku4PHRvu8Y2GpjsUUW/2Fh+a8PXTIT5/Fwpk2+0Ua80UXVu1dK2UtbzT/Wb9oPKi1mc/oi8O1oVHMDdx5rssHjzj0YcuiIVb82vo5LPFTob3kZwp+AI/Ygma/3xRSg6xunU8lOgfya1dyYipH4YsQyjevMCTq/dtxqFIMhwg4rZ+1bqFrJl70YHe+GK1GaJZA2hykIr/e3SVp+qBK6JUAPPasy698sikBNJHETyTC7/GjlJ9bJ6BHDbCG2Fmdgt646e12bvbQwFg5lnQDmJQ/a50cWbgLXvaV0i2lF6RvGq22rYjJIpQ21qm1Y5ZBVAxvvwkMB1pyxrANavFU6vYOYia9bOcnjS9yanadURrd5Mu/AF22iIPEaK6zpTZwEC9+Wgv89Z4MQpnw4ZPpyVtIpvymu2CGLJBH9Fpoz+d6lwa0Oig4Xv77eg94jILZc3M46XIEy7793Ch/xGFMwINthnVWKQyoTeQ+6iQZjwkQp+83FKXHAkkYtRaSASiZgWDKdRh094lTI3IOJuGMgrsC2RhWJJlQxV6/sZ0tqwlK7naljP9Nh6yhLPCnw5tQ3u/96yV6tL81tOqcW//BauzvCezfNNFpz4Gf13Pej8v9Ptd23/XQsulJdFXrqUjbuB7LzINLVrQ9MqDCRsjh2iRhEE2pHEnxlNNZn4/aUPBAOgwQT04A+4jmVgTknp5GGwLDUAj29kg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2601.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39860400002)(346002)(366004)(396003)(316002)(186003)(45080400002)(66476007)(5660300002)(66556008)(66946007)(1076003)(8676002)(52116002)(38100700002)(83380400001)(16526019)(8936002)(966005)(6916009)(7696005)(21480400003)(6506007)(54906003)(86362001)(478600001)(2906002)(9686003)(55016002)(4326008)(44144004)(2700100001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?YSHrFUrGoJtYCs9UzMDAvfkO/ECOkRiq1XAIY5dFKbfEairNjjk7tjeoYS3T?=
 =?us-ascii?Q?WeRhjvIpOO5QJsipZPuueyFA3RVqYcnezGyyJm3lihOQ+u92xCXMJURwektS?=
 =?us-ascii?Q?KhpxFWNBBCl6LU0RsOCIq4qqOpg9DxYt+C41Fg96btJzT6qaNVb3Tc2LuOMY?=
 =?us-ascii?Q?MLGLIwVG7HvSRa3jgQ0ts/9HS21zz19izyehiN2cJs3YHikEepjIZbs6IYue?=
 =?us-ascii?Q?p/RtqJ8VfmiLuKVMKjp//yOEBs4Gw9Y/6Y5FJkY8SFmwvNUFvmRP1PFjtCEo?=
 =?us-ascii?Q?nEt10z8ipVHZHlLYfNmnK12yy9NDSsR88IUC1wR3VYysTWvUbV1xxDPmzrTV?=
 =?us-ascii?Q?QrKUCJHJhwsWMeVuxuHl5kirpzV5ASHpbpAOf0GPma+JS9s4W4k0+KzYy5yR?=
 =?us-ascii?Q?3/OUum6dzOHQKsbNOWjY10/LxO8ArRzsfOiBJ5X031rrqnDDOnI/gKajkKs2?=
 =?us-ascii?Q?JdGBJ3c39xGnrZ/KW5hCYmQOsSn92pn0zad201hvAj0eiw9EmvMSVwS3fcS+?=
 =?us-ascii?Q?+ZNtcaxMVFm83Zg+11mfK7kq4lkfunw7cV/lXQ36JPmkn9GBHurqixmzLhp8?=
 =?us-ascii?Q?f2Egk1mT9guVz+xJ/xJgOOnH+/SchieDfargUP+QzNU84Ls081Ei/UPZWUoX?=
 =?us-ascii?Q?nqtHmoLVSlOmfCR2npD8VLbCEFPnYeIHc0JRvG/dfnDngA7QlY6uAWqnkVud?=
 =?us-ascii?Q?r6ilQn5T7MXuP7UOfrUwh76KJBLzgRiZ2YKAWfbHQ7KXJvJqEtwBz31HTSrW?=
 =?us-ascii?Q?s6UQ7sJbrkNVg2L3TuVZl0vACVpqU9gxdJ+OIH9FfIDg0v0lUIwLFU5H4+kd?=
 =?us-ascii?Q?c5BbPqhz4ZumtzvW2I352QyG6323ZZVo25Qb40qUziDma0NwsF34I0k33sg3?=
 =?us-ascii?Q?j3rQQVPXKSEU9CR6SfeU4oeERoteURmnrRBQSg3QlnfCJGpGbJk3XU6nlVQv?=
 =?us-ascii?Q?riURZuThjodYA8v43mkbp2IvpZuHbFzahm9WCE1pnNvfxyoV9LlZhKmlFmUV?=
 =?us-ascii?Q?CkZUEMp9nnHUnkXo+DNh+F8vOzzYTS2zTX+9cXRKRU640D/uz5zcnEDMzt5N?=
 =?us-ascii?Q?Y/MpfwohnkXSHNgKfKUvCOGt45sXTuwHx57jInYRHiRi0xWMeAyGlX57BGch?=
 =?us-ascii?Q?9uW4257hNpqg4QeguTkA+AO08s3T0AT1Cu3+CEdFyN68eLe/fEZNElgHDpMQ?=
 =?us-ascii?Q?eu8GDey7E6MZV2tTkMLgMw+GnAFq2QIimxgtFZxO/LiN/if0a0n07Sn3uVSY?=
 =?us-ascii?Q?f/eF0Bmsyqg0BBApC5eNZfjy3Kau2vTLyDoEc+z1XRDG0OaInA+4VagyXWDo?=
 =?us-ascii?Q?yrTtB/Vm04zXjVcTO65/gwlYUtk4LtLa3Hq036fFCyE6hCULFTuLv4U/j4Oy?=
 =?us-ascii?Q?E5dO/zdKMGmixCzCVPkl8m6+z5CP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9405ca4-e484-4fa6-5b63-08d90b1cddbe
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2601.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 14:41:25.8674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 475+FxtNNQyMCJVdx3a5ImrXGRYs++9wFkDoC19RoQOogXOCmd1500G52AYRCFKcgAqkC3bXBaglSPUQZrPA7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2859
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
Cc: Anson Jacob <Anson.Jacob@amd.com>, Eric Yang <Eric.Yang2@amd.com>,
 Wesley Chalmers <Wesley.Chalmers@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, dri-devel@lists.freedesktop.org,
 Chiawen Huang <chiawen.huang@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 David Airlie <airlied@linux.ie>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Alvin Lee <alvin.lee2@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, kael_w@yeah.net,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============0717298389=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0717298389==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5epyxuu6j7ldqoh7"
Content-Disposition: inline

--5epyxuu6j7ldqoh7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Is your robot public available?

btw, applied to amd-staging-drm-next.

Thanks

On 04/29, Jiabing Wan wrote:
> =20
> >Nice catch!
> >
> >Are you using any tool to identify this problem?
>=20
> Yes, I have a robot including many detecting scripts :)
>=20
> >Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> >
> >On 04/29, Wan Jiabing wrote:
> >> In commit 482812d56698e ("drm/amd/display: Set max TTU on
> >> DPG enable"), "hubp.h" was added which caused the duplicate include.
> >> To be on the safe side, remove the later duplicate include.
> >>=20
> >> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> >> ---
> >>  drivers/gpu/drm/amd/display/dc/core/dc.c | 1 -
> >>  1 file changed, 1 deletion(-)
> >>=20
> >> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/dr=
m/amd/display/dc/core/dc.c
> >> index 8f0a13807d05..dcaa6b1e16af 100644
> >> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> >> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> >> @@ -58,7 +58,6 @@
> >>  #include "dc_link_ddc.h"
> >>  #include "dm_helpers.h"
> >>  #include "mem_input.h"
> >> -#include "hubp.h"
> >> =20
> >>  #include "dc_link_dp.h"
> >>  #include "dc_dmub_srv.h"
> >> --=20
> >> 2.25.1
> >>=20
> >
> >--=20
> >Rodrigo Siqueira
> >https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsiqu=
eira.tech%2F&amp;data=3D04%7C01%7CRodrigo.Siqueira%40amd.com%7Cb8ff161b3a90=
4a49e59808d90b0991d9%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637552958=
013669698%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT=
iI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DI7AtEiOlzUuRQag7uAuArUvfd64l1b=
3gstq7ZTeucik%3D&amp;reserved=3D0
>=20
> Yours,
> Wan Jiabing
>=20

--=20
Rodrigo Siqueira
https://siqueira.tech

--5epyxuu6j7ldqoh7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAmCKxZEACgkQWJzP/com
vP/gKA//QKvHIFd1cojUlp0NXMsQHzgdnWKRumieSZHBJNU0hxcOuhefsE7BQGYf
DokCcJxEPlRp7OwbM6g1PZ32qx49c1gmvY//czNqxnIMEvbDm20NIq/R3rHUXLOb
TPloT6RM2QqRrWFHJDHqClHs8VsUoKSM6IJL/Ft2wzbId4RAjc6rjt5fUm+m3S0C
wpXVgCJoo8OaLTq/DHcuzY6X95WVMczOpXaO9icjcD9PipYl9EjoLFIWfcn1tDTQ
DX37+93uTDqEY2Kx0cjOOK/VucmqrVXUsLuALL9g83Gg9nFr9MejXzqvD2hFOHWj
6pJu65YY5Wk+bHVaaZZIjRH1LuGleb8G+RbMV2cSlcrpf6jswjLHwqZ1OAMJMIHf
p+o6EaD11kndLSg0qFJ88E8jCoTksBb++P026l3AHIqx+FskgeKD+dCGpfEjfS1p
+KzTf/3H7wvUjhfpvobF8FG3Wxq6vqXcYcOY95aDpsVwdo+p1wNfzmMg1bzHAMmO
LVOmyit/FdxASRbhtmxkcwTKo+ODPY+GCJjcWgshCQbW5Z81klHh9DK37eWWOl0Z
xgu6Rq0LEvAfXg4ZsBlo3jttcEHBw7N3CUT53sHhNNXm+kLT+3Ghbm6z/dY2wvsU
lk0Rq4OnyV+jd01xG8fRfqY16Bdt5+FK6W/WPrFo1lpuFWrXZCY=
=HFol
-----END PGP SIGNATURE-----

--5epyxuu6j7ldqoh7--

--===============0717298389==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0717298389==--
