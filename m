Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D3D3BC764
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 09:42:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E0089A08;
	Tue,  6 Jul 2021 07:42:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44BBD899FF;
 Tue,  6 Jul 2021 07:42:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hO6dlFwSCn2FM83hOICp4//ajKWJm/YMLQk6eUk3aIvh02ZgVJC6qLENvVMHwZ2sv8FBAVDvr0O2yajSBKoPKNlMdlbPP1W21In0qC30AOtsdrTIS0LLhyl8gu5XyF2Ifs5O3ulAJondL86sORfuDM8UJCYjPt0ajFxFutZLMkfaCKuFEQA7w3dmR5llLZW52tv7/V/QR6+i6IBbOSWJe7HE8w7KSGv6DPFwOL7L9+D+H4RVoVqKM3fslRnnD/24eDIKt7ANx1d73QWLNbwCJDdQycKOGcnbbJkWQorx2omMQZKdzYOaz8odGZF9AR4iFKiFg4QZwzL2VnuBioPHlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5RqkclZzeSs1O0dDEg46p8tMA0gbS7+fqMIquKJR33s=;
 b=aObvjz94a2mqELKN64udNKH/xLUPgv3/seG0tpuEK9YvJFJobDi6w0dm4CQqMCeTgh2yKeQkEa2LiseVs+wza+XOPKdm/JGUQQ5uamrEVgnIeDTK9bvKcuG4IxHegxO5eQzmkvNKDwfQ3cwj3Bz+9Mo+ljJMxTpuw1AsLrhy5epVcE44Oy/WzPov2aoku5v+Ep94nY1gXZH0bvkW2GDCR+X7E1WasQbDHpkVYqnwg8R6RhWqCok5vy1cYN95m0cigF1oYTm4zxxedrk7HXJU3H2KQbkQSi+Hz9NmhJNxzgV/iT+LKvK08MATZMr18a9GDFo1UpLkrm36iSo35j9NLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5RqkclZzeSs1O0dDEg46p8tMA0gbS7+fqMIquKJR33s=;
 b=tcE3tVRoz44eitPHZWGU/Ar7wO23ial/HduQA/RjwaW6KQGCXf/NMDbcbqaOTa3i+pujzzig5Nuf+sHqY3zJON9VipHEmYx0HdruQqCVfNMIJoJhyZspLdXPONBIqD5E9hnKlqN1qtIOkmoDLJOAE5BfLdImb+w3XNKvRelzGuSAhJKkRT4E0YuoPK2BsQiT98nbXweChvsHMSXkNQsJtkq46ox/gZ7kmFlySrfGkokke1//qIZtq7+p0i+Y/X1p3amD0kvUQZqAT4CDKD9fYQLAd+QL2VGZ1Bfe/yiuIPm2Opa8kntHIMmDRtLgYGBOa79D8zTfhHdla+9tAJIVWA==
Received: from DM3PR14CA0127.namprd14.prod.outlook.com (2603:10b6:0:53::11) by
 MWHPR1201MB0112.namprd12.prod.outlook.com (2603:10b6:301:5a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Tue, 6 Jul
 2021 07:42:14 +0000
Received: from DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:53:cafe::7) by DM3PR14CA0127.outlook.office365.com
 (2603:10b6:0:53::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend
 Transport; Tue, 6 Jul 2021 07:42:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; lists.freedesktop.org; dkim=none (message not
 signed) header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT016.mail.protection.outlook.com (10.13.173.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4287.22 via Frontend Transport; Tue, 6 Jul 2021 07:42:13 +0000
Received: from nvdebian.localnet (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 6 Jul
 2021 07:42:11 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: nouveau: failed to initialise sync
Date: Tue, 6 Jul 2021 17:42:09 +1000
Message-ID: <3132805.L1pbqKOYlQ@nvdebian>
In-Reply-To: <dace0dea-7ca9-99cb-ad80-106824cb5e3f@amd.com>
References: <YOC4uekpD7iA3xPi@Red> <1682547.0nLxAY2a9E@nvdebian>
 <dace0dea-7ca9-99cb-ad80-106824cb5e3f@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9ec7027-0eb3-4838-dea3-08d940519202
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0112:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0112B814E4583788A02F3D6BDF1B9@MWHPR1201MB0112.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:254;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: foCKVg/hH8sijN4f9DAGYdLnT7dol3qARZvXro/yYkI/gCP5F0jpuNtKfaFGbdKRnSgZcEQ3mk0R7Wf7RYR7pSkZWfqvZD8OI3pPHefkCOG7qDfX5WaI++5ECWLh9NRl5LfbWYllyW4zVBffdb6uzKERr5SNRec4GXtx3PXd2HaEDPYsla3MYoXyMjY1VaxJAWFURRtjwMxvaHDCIWwL7nLLr4FAooOOcYOT3wByjekSytx8075tep7xBVodr/2wZzBxL8ScVf45hjBr8UrDKdkVQW+yj5ejoN8TFHdp2hiGzUyZPzufiQemZoM6zOgWzEG1/HxMiI3ESyGpff3NSwJ/fWFJu+/mGrM/3YGmjh2jeYeuQuONXLocTq5pEbZDD8QqG+PtXFkx24XYi6dsHWoMV+nxrXG/b7qnfKD7QUNgtptFWEks0lat4qnxkiNSUZqlHdiIENbdwQxpQuG7mY7BysB1rX47b3w2290zIsMNKSXjP4jPHgSmO4OA4MrerZiZbBRRldRbM6dzZOtBPI+MLRPylN3p3dQdbXzJJ1F9hDsguMSjNfmeE8XFrkIyiB24s390nhCn73s0utcGi4wrpetRefdIau5t/ijLRJE53Hrpxburuv0OSXYIeytE3MAhASJdqHkfOK3ClPgE3udBYUk9L96DyIztQ2otwuQ8EshGZHptLl29hsH2Rttlmbp5Ed5ajylVvfuKqNhAwxADkgMlN4/xg3t1/dk7uvY=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(46966006)(36840700001)(478600001)(426003)(36860700001)(966005)(9576002)(316002)(45080400002)(6916009)(54906003)(4326008)(356005)(5660300002)(186003)(36906005)(336012)(8676002)(82740400003)(7636003)(86362001)(16526019)(83380400001)(2906002)(26005)(33716001)(70206006)(66574015)(8936002)(9686003)(70586007)(82310400003)(47076005)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 07:42:13.4336 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9ec7027-0eb3-4838-dea3-08d940519202
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0112
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
Cc: airlied@linux.ie, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Corentin Labbe <clabbe.montjoie@gmail.com>, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks Christian,

That patch fixed it for me, so I guess it just hasn't quite made it upstream
yet.

 - Alistair

On Tuesday, 6 July 2021 4:58:37 PM AEST Christian K=F6nig wrote:
> Hi guys,
>=20
> yes nouveau was using the same functionality for internal BOs without=20
> noticing it. This is fixes by the following commit:
>=20
> commit d098775ed44021293b1962dea61efb19297b8d02
> Author: Christian K=F6nig <christian.koenig@amd.com>
> Date:   Wed Jun 9 19:25:56 2021 +0200
>=20
>      drm/nouveau: init the base GEM fields for internal BOs
>=20
>      TTMs buffer objects are based on GEM objects for quite a while
>      and rely on initializing those fields before initializing the TTM BO.
>=20
>      Nouveau now doesn't init the GEM object for internally allocated BOs,
>      so make sure that we at least initialize some necessary fields.
>=20
> Could be that the patch needs to be send to stable as well.
>=20
> Regards,
> Christian.
>=20
> Am 06.07.21 um 04:44 schrieb Alistair Popple:
> > I am also hitting this with upstream. Reverting d02117f8efaa ("drm/ttm:=
 remove
> > special handling for non GEM drivers") also fixed it for me.
> >
> > The change log for that commit reads:
> >
> >      drm/ttm: remove special handling for non GEM drivers
> >     =20
> >      vmwgfx is the only driver actually using this. Move the handling i=
nto
> >      the driver instead.
> >
> > I wonder if Nouveau might actually have been using this somehow too?
> >
> >   - Alistair
> >
> > On Sunday, 4 July 2021 5:21:29 AM AEST Corentin Labbe wrote:
> >> Hello
> >>
> >> Since some days on next, nouveau fail to load:
> >> [    2.754087] nouveau 0000:02:00.0: vgaarb: deactivate vga console
> >> [    2.761260] Console: switching to colour dummy device 80x25
> >> [    2.766888] nouveau 0000:02:00.0: NVIDIA MCP77/MCP78 (0aa480a2)
> >> [    2.783954] nouveau 0000:02:00.0: bios: version 62.77.2a.00.04
> >> [    2.810122] nouveau 0000:02:00.0: fb: 256 MiB stolen system memory
> >> [    3.484031] nouveau 0000:02:00.0: DRM: VRAM: 256 MiB
> >> [    3.488993] nouveau 0000:02:00.0: DRM: GART: 1048576 MiB
> >> [    3.494308] nouveau 0000:02:00.0: DRM: TMDS table version 2.0
> >> [    3.500052] nouveau 0000:02:00.0: DRM: DCB version 4.0
> >> [    3.505192] nouveau 0000:02:00.0: DRM: DCB outp 00: 01000300 000000=
1e
> >> [    3.511632] nouveau 0000:02:00.0: DRM: DCB outp 01: 01011332 000200=
10
> >> [    3.518074] nouveau 0000:02:00.0: DRM: DCB conn 00: 00000100
> >> [    3.523728] nouveau 0000:02:00.0: DRM: DCB conn 01: 00001261
> >> [    3.529455] nouveau 0000:02:00.0: DRM: failed to initialise sync
> > subsystem, -28
> >> [    3.545946] nouveau: probe of 0000:02:00.0 failed with error -28
> >>
> >> I bisected it to:
> >> git bisect start
> >> # good: [62fb9874f5da54fdb243003b386128037319b219] Linux 5.13
> >> git bisect good 62fb9874f5da54fdb243003b386128037319b219
> >> # bad: [fb0ca446157a86b75502c1636b0d81e642fe6bf1] Add linux-next speci=
fic
> > files for 20210701
> >> git bisect bad fb0ca446157a86b75502c1636b0d81e642fe6bf1
> >> # good: [f63c4fda987a19b1194cc45cb72fd5bf968d9d90] Merge remote-tracki=
ng
> > branch 'rdma/for-next'
> >> git bisect good f63c4fda987a19b1194cc45cb72fd5bf968d9d90
> >> # bad: [49c8769be0b910d4134eba07cae5d9c71b861c4a] Merge remote-tracking
> > branch 'drm/drm-next'
> >> git bisect bad 49c8769be0b910d4134eba07cae5d9c71b861c4a
> >> # good: [4e3db44a242a4e2afe33b59793898ecbb61d478e] Merge tag 'wireless-
> > drivers-next-2021-06-25' of git://git.kernel.org/pub/scm/linux/kernel/g=
it/
> > kvalo/wireless-drivers-next
> >> git bisect good 4e3db44a242a4e2afe33b59793898ecbb61d478e
> >> # bad: [5745d647d5563d3e9d32013ad4e5c629acff04d7] Merge tag 'amd-drm-
> > next-5.14-2021-06-02' of https://nam11.safelinks.protection.outlook.com=
/?url=3Dhttps%3A%2F%2Fgitlab.freedesktop.org%2Fagd5f%2Flinux&amp;data=3D04%=
7C01%7Cchristian.koenig%40amd.com%7C5f05fa59cd3b4432e71108d94027ede6%7C3dd8=
961fe4884e608e11a82d994e183d%7C0%7C0%7C637611362989756089%7CUnknown%7CTWFpb=
GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7=
C3000&amp;sdata=3DgJ98NtSRf3IyVfsCzw3DKydeMTGKIkHJNzUUhUfsWzY%3D&amp;reserv=
ed=3D0 into drm-
> > next
> >> git bisect bad 5745d647d5563d3e9d32013ad4e5c629acff04d7
> >> # bad: [c99c4d0ca57c978dcc2a2f41ab8449684ea154cc] Merge tag 'amd-drm-
> > next-5.14-2021-05-19' of https://nam11.safelinks.protection.outlook.com=
/?url=3Dhttps%3A%2F%2Fgitlab.freedesktop.org%2Fagd5f%2Flinux&amp;data=3D04%=
7C01%7Cchristian.koenig%40amd.com%7C5f05fa59cd3b4432e71108d94027ede6%7C3dd8=
961fe4884e608e11a82d994e183d%7C0%7C0%7C637611362989756089%7CUnknown%7CTWFpb=
GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7=
C3000&amp;sdata=3DgJ98NtSRf3IyVfsCzw3DKydeMTGKIkHJNzUUhUfsWzY%3D&amp;reserv=
ed=3D0 into drm-
> > next
> >> git bisect bad c99c4d0ca57c978dcc2a2f41ab8449684ea154cc
> >> # bad: [ae25ec2fc6c5a9e5767bf1922cd648501d0f914c] Merge tag 'drm-misc-
> > next-2021-05-17' of git://anongit.freedesktop.org/drm/drm-misc into drm=
=2Dnext
> >> git bisect bad ae25ec2fc6c5a9e5767bf1922cd648501d0f914c
> >> # bad: [cac80e71cfb0b00202d743c6e90333c45ba77cc5] drm/vkms: rename cur=
sor to
> > plane on ops of planes composition
> >> git bisect bad cac80e71cfb0b00202d743c6e90333c45ba77cc5
> >> # good: [178bdba84c5f0ad14de384fc7f15fba0e272919d] drm/ttm/ttm_device:
> > Demote kernel-doc abuses
> >> git bisect good 178bdba84c5f0ad14de384fc7f15fba0e272919d
> >> # bad: [3f3a6524f6065fd3d130515e012f63eac74d96da] drm/dp: Clarify DP A=
UX
> > registration time
> >> git bisect bad 3f3a6524f6065fd3d130515e012f63eac74d96da
> >> # bad: [6dd7efc437611db16d432e0030f72d0c7e890127] drm/gud: cleanup cod=
ing
> > style a bit
> >> git bisect bad 6dd7efc437611db16d432e0030f72d0c7e890127
> >> # bad: [13b29cc3a722c2c0bc9ab9f72f9047d55d08a2f9] drm/mxsfb: Don't sel=
ect
> > DRM_KMS_FB_HELPER
> >> git bisect bad 13b29cc3a722c2c0bc9ab9f72f9047d55d08a2f9
> >> # bad: [d02117f8efaa5fbc37437df1ae955a147a2a424a] drm/ttm: remove spec=
ial
> > handling for non GEM drivers
> >> git bisect bad d02117f8efaa5fbc37437df1ae955a147a2a424a
> >> # good: [13ea9aa1e7d891e950230e82f1dd2c84e5debcff] drm/ttm: fix error
> > handling if no BO can be swapped out v4
> >> git bisect good 13ea9aa1e7d891e950230e82f1dd2c84e5debcff
> >> # first bad commit: [d02117f8efaa5fbc37437df1ae955a147a2a424a] drm/ttm:
> > remove special handling for non GEM drivers
> >> Reverting the patch permit to have nouveau works again.
> >>
> >> Regards
> >>
> >>
> >
> >
> >
>=20
>=20




