Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9792DB475
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 20:28:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53794892A8;
	Tue, 15 Dec 2020 19:28:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2064.outbound.protection.outlook.com [40.107.243.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B85892A8
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 19:28:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mt8QMNwA4PVXrVQzURCJdYf4OEO85yKDSS5xLXkaagyQhfgqalL0AkljYssrGu+t2vI7Ds+2MUZAwaF3Diw3DcNrYJlE2xGKZRhd0EV6s1lmnLqLcZ09HA84aEgNq0gB1BxjwIZn8MdR1yp1t9XF3oO3Misyqlf3qRd4MBbO/ZkoxSLCiOJiLD8r/01z8wfpnyWunma50AgCIM2IOudqycrVI3paFMBVruIdb8Ed0xeS5pHOoo6DeXRQDsDqM2Ye+lb9DZFBqknFA+QPc14m0ijSnOd9YWA3+lBMwQ7CxeU2EGNCkkfa3WH1UiedlbpAjOiFlN3pAqudWGd8L3QZWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02kY2zuQlZBhN6IaAcpdUR7P+1lKsltJU0JtidnY9NA=;
 b=LxuSnku9jbL9Ywb7bojlMzhFZK+wr4U516QQ5C+vU7haoKCZXQc04hMJfDz3Ed3XY99qAm5Y7gLddLoaBa5r4g5QH66vP69SDfgXAQgu8ZH7cS75OXPoNwT63i4J4wx+Eg37uyFzW93C4TAkKyIaC6xfu+dtduQuamkhWvdU2HEq5LlSvxMcss8WfgnUPHFdYxUtlypP/sfKPSaHmTkrFnHpOKTXcaMew0N7haMQG4fNM3l/saO/nMiic7YHO0PnPjOasiPhuUdEb4nCZPCOwa+XXNvgzgrjNN/pdD6Dp7WYC+zNEoz6lr8lNaTVFd5bKwHJHXIEj6ncqHdCr2s5Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02kY2zuQlZBhN6IaAcpdUR7P+1lKsltJU0JtidnY9NA=;
 b=Y4/4DIdy5bUjTJfsUTaKkhLPP7jUnEJML7uc96oh8gJBHli43y7y1iHNQWBqbNqvdnv5Qes6vzVBijLzNpn50PmYLDlDjrjXWULMoRdG8rOxmSSgyFKcbYSUe00Wn7FmQyPK1iRVuLO+meYqa9n5tkBeLIfO3VFnHGzKpAVdToo=
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by BL0PR12MB4721.namprd12.prod.outlook.com (2603:10b6:208:8e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Tue, 15 Dec
 2020 19:28:01 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::fca3:155c:bf43:94af]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::fca3:155c:bf43:94af%4]) with mapi id 15.20.3654.024; Tue, 15 Dec 2020
 19:28:01 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Mauro Rossi <issor.oruam@gmail.com>, kernel test robot <lkp@intel.com>
Subject: Re: [radeon-alex:amd-20.45 1953/2427]
 drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dce60/dce60_clk_mgr.c:83:5:
 warning: no previous prototype for function 'dce60_get_dp_ref_freq_khz'
Thread-Topic: [radeon-alex:amd-20.45 1953/2427]
 drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dce60/dce60_clk_mgr.c:83:5:
 warning: no previous prototype for function 'dce60_get_dp_ref_freq_khz'
Thread-Index: AQHW0s0PPgo1VMrkJUyq7uy9BWSaWan4hz6AgAADhgQ=
Date: Tue, 15 Dec 2020 19:28:01 +0000
Message-ID: <MN2PR12MB4488C8EC6F4ADD998754F504F7C60@MN2PR12MB4488.namprd12.prod.outlook.com>
References: <202012151818.lGhtGzd3-lkp@intel.com>,
 <CAEQFVGYAZLJd3b=P3j28s7gmzbXuPX4uGtLR2du5e95-N05yLA@mail.gmail.com>
In-Reply-To: <CAEQFVGYAZLJd3b=P3j28s7gmzbXuPX4uGtLR2du5e95-N05yLA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=True;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-12-15T19:28:00.457Z;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=AMD
 Public; MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged; 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [192.161.78.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1fe7edb8-19cf-432f-1fae-08d8a12f8947
x-ms-traffictypediagnostic: BL0PR12MB4721:
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR12MB4721DC08BE84AB51E2D5307DF7C60@BL0PR12MB4721.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:27;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LQk7j9kMT9yUjG4an+kDQoUq2OXkUVhXJJ8qDLo7KD9/UfkFm+2TeNO6otMuJn9VxdVHZod2JUjbWom2gekHn/g4Z+mWH/gfWlSu5evOs+TudA3EkRvlahLN7vRIuUIjKo47LfCw0sO5czPakLoZPFeblMuE8YCCThoJuJ5cTEeJQwKASVNTM1AWsfwdaoktdZoebV41HyvNNq+uLvr/EB0M1EsPvIqx+ldbot1f8h13TZGHp2kn8u/bpq4e/toXBR/GnSQhN5ISdmno5FmRPTof2l+0pkaTAWwEbjYcJ1ZVh7B3EAyg8LLZPvb0n6TKHuNUdNx/DHJMt0ZDARC44KEgRpmL6I99s4SCJVqm2v8oPxeK78rocdCz6VSVacgFxlf3HOLcM1bNYk3dFIdRMA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(136003)(4326008)(5660300002)(66946007)(52536014)(55016002)(7696005)(26005)(64756008)(110136005)(66556008)(53546011)(966005)(54906003)(9686003)(66476007)(19627405001)(166002)(8936002)(71200400001)(6506007)(33656002)(186003)(508600001)(86362001)(83380400001)(2906002)(8676002)(66446008)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?mGcxhcoPwhk8sSGUefKWGv5GRA37l2ahuOQZFJP5bhMP+wVUYuW58Go2Va6T?=
 =?us-ascii?Q?Hx8T5VL5w1FqKpja9wTRmw9RCyghvpL0gJjSb0/Tms7grzXQSyTDg6B4Xges?=
 =?us-ascii?Q?cJ1nV7EeePmIUiedBz66Z0rHVAkCkiqf+PfQdicpLkiTRdzjEDcsLB865NR6?=
 =?us-ascii?Q?GZt+t+01noqI2kEum1v7c4X2VRn5GsuSIqgpmBumUYV7DndbS37+XdwQIMy7?=
 =?us-ascii?Q?ZHNaj0iSJQUPx0x1a52bOmpdhWkHFIIqH9Pp74SgbAmo2uehDbOgOmCE5T5D?=
 =?us-ascii?Q?EIaPecwQVLb90fy5B5yv4GUibgm4jbxMRnpPRlcYpsHEqY8WyUADxkydYNQm?=
 =?us-ascii?Q?Q8038OA69kGP81WEooYZA5w6aQRkyLDx/wMpg6PMmSseV2Xxb2q3YggEypNi?=
 =?us-ascii?Q?MsLgxFpcNHGyceW9O7GS3cTkldYRgZ9P71E41EBUl5si8wqz1Uw2d/0VmRYC?=
 =?us-ascii?Q?2aioaha/R7TrCpXjyOwxw4uI4mmVbLgxOaw/x8Y/OAoNqzyqNGvHiC3D4EQT?=
 =?us-ascii?Q?VdzvcYNaVaFVhHKCtqwWkPkfAwoDo7V8Nyq7ectMMCKZghTflCdHc5Q4r//3?=
 =?us-ascii?Q?AtlemgxYIg0bam14d3zSArgvtenPEOiYzY9w+7lGOM6AJq6rjfHJu2YSg3bq?=
 =?us-ascii?Q?Gjsotr2rh/BVs9N3FCJbyxXX0CjE033Cy0UrgNbB9kxxmv8TpWpnmao8ew+P?=
 =?us-ascii?Q?2BzuXrE6Ipm5ua6/OMEyIweXcxHo4uMzt4yV8/q2dJLcq60TzA3g8c0qlocZ?=
 =?us-ascii?Q?sFThNxljIqJliRoKQ/sxplOzvZpJQv6noMSMviPXM0IvLZZmJhS4gkj6JmLz?=
 =?us-ascii?Q?kz8U3SFvSXC3QyNyLE76KI1LhmgDQ6wNfQtdFKuTGtL80LFPU23zMePeJHAt?=
 =?us-ascii?Q?hrDLqGuPmeF3zpuJEBop4nDpLi1WCIZJnoOx5amU8aP6MszldQagsoQC8mkg?=
 =?us-ascii?Q?dMub68jY8Hjrs01UQleI0OCUd4aIqQLOqPrklMrJ1OE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fe7edb8-19cf-432f-1fae-08d8a12f8947
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2020 19:28:01.0942 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ygJS6O59Yh6M1UQGmTG2YFk4+BvUdBlUfH+jiqc6cp7IcooFSE+FbJVgNjPCCr4W6oeTD3N4Fb+qanglisVjBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4721
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
Cc: "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>,
 "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, "Xiong,
 Yang \(Felix\)" <Yang.Xiong@amd.com>
Content-Type: multipart/mixed; boundary="===============1477280431=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1477280431==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB4488C8EC6F4ADD998754F504F7C60MN2PR12MB4488namp_"

--_000_MN2PR12MB4488C8EC6F4ADD998754F504F7C60MN2PR12MB4488namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Public Use]

this branch should be ignored by test robots.  It's just a public mirror of=
 our packaged driver source code.  It contains kernel compatibility and dkm=
s support which is not going upstream.

Alex

________________________________
From: Mauro Rossi <issor.oruam@gmail.com>
Sent: Tuesday, December 15, 2020 2:13 PM
To: kernel test robot <lkp@intel.com>; Deucher, Alexander <Alexander.Deuche=
r@amd.com>
Cc: kbuild-all@lists.01.org <kbuild-all@lists.01.org>; clang-built-linux@go=
oglegroups.com <clang-built-linux@googlegroups.com>; ML dri-devel <dri-deve=
l@lists.freedesktop.org>; Xiong, Yang (Felix) <Yang.Xiong@amd.com>
Subject: Re: [radeon-alex:amd-20.45 1953/2427] drivers/gpu/drm/amd/amdgpu/.=
./display/dc/clk_mgr/dce60/dce60_clk_mgr.c:83:5: warning: no previous proto=
type for function 'dce60_get_dp_ref_freq_khz'

Hello,
the mentioned branch requires the following commit, but it is already appli=
ed in 5.10 released kernel,
so I really do not know what next step here.

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=
=3D8c4e4fd607b17973e54a7e9cc4c275b12ab7308e<https://nam11.safelinks.protect=
ion.outlook.com/?url=3Dhttps%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fk=
ernel%2Fgit%2Fstable%2Flinux.git%2Fcommit%2F%3Fid%3D8c4e4fd607b17973e54a7e9=
cc4c275b12ab7308e&data=3D04%7C01%7Calexander.deucher%40amd.com%7C2ccddb80b2=
194b87979e08d8a12d78e3%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C6374365=
63973465049%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=3D4s%2Br5bporx1FuRLkI%2FJbJug4qPqK=
aIxwu6DJCaCG01U%3D&reserved=3D0>

Mauro

On Tue, Dec 15, 2020 at 11:24 AM kernel test robot <lkp@intel.com<mailto:lk=
p@intel.com>> wrote:
tree:   git://people.freedesktop.org/~agd5f/linux.git<https://nam11.safelin=
ks.protection.outlook.com/?url=3Dhttp:%2F%2Fpeople.freedesktop.org%2F~agd5f=
%2Flinux.git&data=3D04%7C01%7Calexander.deucher%40amd.com%7C2ccddb80b2194b8=
7979e08d8a12d78e3%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637436563973=
475007%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6=
Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=3DAwRdBRY9CLM5kV4FvQeKFMR1t8R6uEU%2BOvV=
LkhqQmwQ%3D&reserved=3D0> amd-20.45
head:   a3950d94b046fb206e58fd3ec717f071c0203ba3
commit: e809646e73921328d66a2fbfddf067b9cdb30998 [1953/2427] drm/amd/displa=
y: enable SI support in the Kconfig (v2)
config: x86_64-randconfig-a001-20201214 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project<https:=
//nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2F=
llvm%2Fllvm-project&data=3D04%7C01%7Calexander.deucher%40amd.com%7C2ccddb80=
b2194b87979e08d8a12d78e3%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63743=
6563973475007%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL=
CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=3DpR0HOEIksASstlWPFMR8Eq9e6v%2BT=
PBQ8lhfPVy%2Bu1iI%3D&reserved=3D0> a29ecca7819a6ed4250d3689b12b1f664bb790d7=
)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross<https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fraw.githubusercontent.com%2Fintel%2Flkp-tests%2Fmaster%2Fsbin%2Fmake.cr=
oss&data=3D04%7C01%7Calexander.deucher%40amd.com%7C2ccddb80b2194b87979e08d8=
a12d78e3%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637436563973484960%7C=
Unknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL=
CJXVCI6Mn0%3D%7C1000&sdata=3DJ9LnzLuz5PGRhi4YFVdiTNq8sQUJ3igy%2FtJWq3BrsSE%=
3D&reserved=3D0> -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install x86_64 cross compiling tool for clang build
        # apt-get install binutils-x86-64-linux-gnu
        git remote add radeon-alex git://people.freedesktop.org/~agd5f/linu=
x.git<https://nam11.safelinks.protection.outlook.com/?url=3Dhttp:%2F%2Fpeop=
le.freedesktop.org%2F~agd5f%2Flinux.git&data=3D04%7C01%7Calexander.deucher%=
40amd.com%7C2ccddb80b2194b87979e08d8a12d78e3%7C3dd8961fe4884e608e11a82d994e=
183d%7C0%7C0%7C637436563973484960%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=3Da%2FwjGAji=
R1C5wpjwPtmt%2BLkwVcix2gwFzsBvYB8PmDs%3D&reserved=3D0>
        git fetch --no-tags radeon-alex amd-20.45
        git checkout e809646e73921328d66a2fbfddf067b9cdb30998
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com<mailto:lkp@intel.com>>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dce60/dce60_clk_mgr.c:8=
3:5: warning: no previous prototype for function 'dce60_get_dp_ref_freq_khz=
' [-Wmissing-prototypes]
   int dce60_get_dp_ref_freq_khz(struct clk_mgr *clk_mgr_base)
       ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dce60/dce60_clk_mgr.c:8=
3:1: note: declare 'static' if the function is not intended to be used outs=
ide of this translation unit
   int dce60_get_dp_ref_freq_khz(struct clk_mgr *clk_mgr_base)
   ^
   static
   1 warning generated.

vim +/dce60_get_dp_ref_freq_khz +83 drivers/gpu/drm/amd/amdgpu/../display/d=
c/clk_mgr/dce60/dce60_clk_mgr.c

2428ad5c6ece1a6 Mauro Rossi 2020-07-11   82
2428ad5c6ece1a6 Mauro Rossi 2020-07-11  @83  int dce60_get_dp_ref_freq_khz(=
struct clk_mgr *clk_mgr_base)
2428ad5c6ece1a6 Mauro Rossi 2020-07-11   84  {
2428ad5c6ece1a6 Mauro Rossi 2020-07-11   85     struct clk_mgr_internal *cl=
k_mgr =3D TO_CLK_MGR_INTERNAL(clk_mgr_base);
2428ad5c6ece1a6 Mauro Rossi 2020-07-11   86     int dprefclk_wdivider;
2428ad5c6ece1a6 Mauro Rossi 2020-07-11   87     int dp_ref_clk_khz;
2428ad5c6ece1a6 Mauro Rossi 2020-07-11   88     int target_div;
2428ad5c6ece1a6 Mauro Rossi 2020-07-11   89
2428ad5c6ece1a6 Mauro Rossi 2020-07-11   90     /* DCE6 has no DPREFCLK_CNT=
L to read DP Reference Clock source */
2428ad5c6ece1a6 Mauro Rossi 2020-07-11   91
2428ad5c6ece1a6 Mauro Rossi 2020-07-11   92     /* Read the mmDENTIST_DISPC=
LK_CNTL to get the currently
2428ad5c6ece1a6 Mauro Rossi 2020-07-11   93      * programmed DID DENTIST_D=
PREFCLK_WDIVIDER*/
2428ad5c6ece1a6 Mauro Rossi 2020-07-11   94     REG_GET(DENTIST_DISPCLK_CNT=
L, DENTIST_DPREFCLK_WDIVIDER, &dprefclk_wdivider);
2428ad5c6ece1a6 Mauro Rossi 2020-07-11   95
2428ad5c6ece1a6 Mauro Rossi 2020-07-11   96     /* Convert DENTIST_DPREFCLK=
_WDIVIDERto actual divider*/
2428ad5c6ece1a6 Mauro Rossi 2020-07-11   97     target_div =3D dentist_get_=
divider_from_did(dprefclk_wdivider);
2428ad5c6ece1a6 Mauro Rossi 2020-07-11   98
2428ad5c6ece1a6 Mauro Rossi 2020-07-11   99     /* Calculate the current DF=
S clock, in kHz.*/
2428ad5c6ece1a6 Mauro Rossi 2020-07-11  100     dp_ref_clk_khz =3D (DENTIST=
_DIVIDER_RANGE_SCALE_FACTOR
2428ad5c6ece1a6 Mauro Rossi 2020-07-11  101             * clk_mgr->base.den=
tist_vco_freq_khz) / target_div;
2428ad5c6ece1a6 Mauro Rossi 2020-07-11  102
2428ad5c6ece1a6 Mauro Rossi 2020-07-11  103     return dce_adjust_dp_ref_fr=
eq_for_ss(clk_mgr, dp_ref_clk_khz);
2428ad5c6ece1a6 Mauro Rossi 2020-07-11  104  }
2428ad5c6ece1a6 Mauro Rossi 2020-07-11  105

:::::: The code at line 83 was first introduced by commit
:::::: 2428ad5c6ece1a6861278c01c5e71c8ea258f3d9 drm/amd/display: dc/clk_mgr=
: add support for SI parts (v2)

:::::: TO: Mauro Rossi <issor.oruam@gmail.com<mailto:issor.oruam@gmail.com>=
>
:::::: CC: Yang Xiong <Yang.Xiong@amd.com<mailto:Yang.Xiong@amd.com>>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org<https://nam11.=
safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.01.org%2Fhyperk=
itty%2Flist%2Fkbuild-all%40lists.01.org&data=3D04%7C01%7Calexander.deucher%=
40amd.com%7C2ccddb80b2194b87979e08d8a12d78e3%7C3dd8961fe4884e608e11a82d994e=
183d%7C0%7C0%7C637436563973494918%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=3DByv0OS%2F6=
hHj3RDlt5qF7YxWIiNLvD91r%2Bd1APoUzDkE%3D&reserved=3D0>

--_000_MN2PR12MB4488C8EC6F4ADD998754F504F7C60MN2PR12MB4488namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#317100;margin:15pt;" al=
ign=3D"Left">
[AMD Public Use]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
this branch should be ignored by test robots.&nbsp; It's just a public mirr=
or of our packaged driver source code.&nbsp; It contains kernel compatibili=
ty and dkms support which is not going upstream.&nbsp;
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Alex</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Mauro Rossi &lt;issor=
.oruam@gmail.com&gt;<br>
<b>Sent:</b> Tuesday, December 15, 2020 2:13 PM<br>
<b>To:</b> kernel test robot &lt;lkp@intel.com&gt;; Deucher, Alexander &lt;=
Alexander.Deucher@amd.com&gt;<br>
<b>Cc:</b> kbuild-all@lists.01.org &lt;kbuild-all@lists.01.org&gt;; clang-b=
uilt-linux@googlegroups.com &lt;clang-built-linux@googlegroups.com&gt;; ML =
dri-devel &lt;dri-devel@lists.freedesktop.org&gt;; Xiong, Yang (Felix) &lt;=
Yang.Xiong@amd.com&gt;<br>
<b>Subject:</b> Re: [radeon-alex:amd-20.45 1953/2427] drivers/gpu/drm/amd/a=
mdgpu/../display/dc/clk_mgr/dce60/dce60_clk_mgr.c:83:5: warning: no previou=
s prototype for function 'dce60_get_dp_ref_freq_khz'</font>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"ltr">
<div dir=3D"ltr">Hello,
<div>the mentioned branch requires the following commit, but it is already =
applied in 5.10 released kernel,</div>
<div>so I really do not know what next step here.</div>
<div><br>
</div>
<div><a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fstable%2Flinux=
.git%2Fcommit%2F%3Fid%3D8c4e4fd607b17973e54a7e9cc4c275b12ab7308e&amp;data=
=3D04%7C01%7Calexander.deucher%40amd.com%7C2ccddb80b2194b87979e08d8a12d78e3=
%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637436563973465049%7CUnknown%=
7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6M=
n0%3D%7C1000&amp;sdata=3D4s%2Br5bporx1FuRLkI%2FJbJug4qPqKaIxwu6DJCaCG01U%3D=
&amp;reserved=3D0" originalsrc=3D"https://git.kernel.org/pub/scm/linux/kern=
el/git/stable/linux.git/commit/?id=3D8c4e4fd607b17973e54a7e9cc4c275b12ab730=
8e" shash=3D"b7/FCDnvPh/sOaJ4yyzqer0lptzPT/0bSQJSzA6OQEaScrfifui/N3l2keMi2N=
E0kdDbzUNmH3H6mkLOafjDFvYfi4OFTeo65F4Cf1u50uXxxWJjsxeahu7RCE1cv76u8OSBh8gDV=
AJIo+iguAEpblJCwKXmWZgjtABmTpCM2Fc=3D">https://git.kernel.org/pub/scm/linux=
/kernel/git/stable/linux.git/commit/?id=3D8c4e4fd607b17973e54a7e9cc4c275b12=
ab7308e</a><br>
</div>
<div><br>
</div>
<div>Mauro</div>
</div>
<br>
<div class=3D"x_gmail_quote">
<div dir=3D"ltr" class=3D"x_gmail_attr">On Tue, Dec 15, 2020 at 11:24 AM ke=
rnel test robot &lt;<a href=3D"mailto:lkp@intel.com">lkp@intel.com</a>&gt; =
wrote:<br>
</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bord=
er-left:1px solid rgb(204,204,204); padding-left:1ex">
tree:&nbsp; &nbsp;git://<a href=3D"https://nam11.safelinks.protection.outlo=
ok.com/?url=3Dhttp:%2F%2Fpeople.freedesktop.org%2F~agd5f%2Flinux.git&amp;da=
ta=3D04%7C01%7Calexander.deucher%40amd.com%7C2ccddb80b2194b87979e08d8a12d78=
e3%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637436563973475007%7CUnknow=
n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI=
6Mn0%3D%7C1000&amp;sdata=3DAwRdBRY9CLM5kV4FvQeKFMR1t8R6uEU%2BOvVLkhqQmwQ%3D=
&amp;reserved=3D0" originalsrc=3D"http://people.freedesktop.org/~agd5f/linu=
x.git" shash=3D"Ok3cQXelRh3q4vwuE3hiLkzN7ZJy+UfBjEjpH6f0muuax+mFVlzm6lgugp5=
5w5dbnxeV4vMD3KMrzNtC2C7acabk6pKvczhmzAmaXwnrVhBEtnjF5BByRMFE5DUyDpE0caXSNd=
HroCgybGr1scwGlkmLnYhW7g2lvx4LinceTaY=3D" rel=3D"noreferrer" target=3D"_bla=
nk">people.freedesktop.org/~agd5f/linux.git</a>
 amd-20.45<br>
head:&nbsp; &nbsp;a3950d94b046fb206e58fd3ec717f071c0203ba3<br>
commit: e809646e73921328d66a2fbfddf067b9cdb30998 [1953/2427] drm/amd/displa=
y: enable SI support in the Kconfig (v2)<br>
config: x86_64-randconfig-a001-20201214 (attached as .config)<br>
compiler: clang version 12.0.0 (<a href=3D"https://nam11.safelinks.protecti=
on.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fllvm%2Fllvm-project&amp;da=
ta=3D04%7C01%7Calexander.deucher%40amd.com%7C2ccddb80b2194b87979e08d8a12d78=
e3%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637436563973475007%7CUnknow=
n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI=
6Mn0%3D%7C1000&amp;sdata=3DpR0HOEIksASstlWPFMR8Eq9e6v%2BTPBQ8lhfPVy%2Bu1iI%=
3D&amp;reserved=3D0" originalsrc=3D"https://github.com/llvm/llvm-project" s=
hash=3D"q87WDUGyKIyHfFb7mQZBUUsEtaNFDYfdKXUKwBhr0Bikn2PLhUP4xRgXrffe97v0ymt=
PXmn742FfEsmqi44lf4ovfPLk+TWw8dEq6qxD72qgemTNbW3t1fblehK4gb0qJJdwaG0+mWqi3w=
4JqYEYDncECo13i8C//IMNtdL/280=3D" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/llvm/llvm-project</a>
 a29ecca7819a6ed4250d3689b12b1f664bb790d7)<br>
reproduce (this is a W=3D1 build):<br>
&nbsp; &nbsp; &nbsp; &nbsp; wget <a href=3D"https://nam11.safelinks.protect=
ion.outlook.com/?url=3Dhttps%3A%2F%2Fraw.githubusercontent.com%2Fintel%2Flk=
p-tests%2Fmaster%2Fsbin%2Fmake.cross&amp;data=3D04%7C01%7Calexander.deucher=
%40amd.com%7C2ccddb80b2194b87979e08d8a12d78e3%7C3dd8961fe4884e608e11a82d994=
e183d%7C0%7C0%7C637436563973484960%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw=
MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DJ9Lnz=
Luz5PGRhi4YFVdiTNq8sQUJ3igy%2FtJWq3BrsSE%3D&amp;reserved=3D0" originalsrc=
=3D"https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cros=
s" shash=3D"jKxt3pWn74qNQEWsnVRP+QAfp4J+CeoNw5EovvDSZMzsQgYe1kFicBzvCzEbXyu=
0c8VpbCETjFEBPPAKZzhh22twvHRkyzPGVZXVX4TW0hfxJQZuIpWbIZPdC2diUr7KZv8wKl0rpa=
A8YEGsVepa1geQPmzWZkOs05a8aPvID8g=3D" rel=3D"noreferrer" target=3D"_blank">
https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross</a=
> -O ~/bin/make.cross<br>
&nbsp; &nbsp; &nbsp; &nbsp; chmod +x ~/bin/make.cross<br>
&nbsp; &nbsp; &nbsp; &nbsp; # install x86_64 cross compiling tool for clang=
 build<br>
&nbsp; &nbsp; &nbsp; &nbsp; # apt-get install binutils-x86-64-linux-gnu<br>
&nbsp; &nbsp; &nbsp; &nbsp; git remote add radeon-alex git://<a href=3D"htt=
ps://nam11.safelinks.protection.outlook.com/?url=3Dhttp:%2F%2Fpeople.freede=
sktop.org%2F~agd5f%2Flinux.git&amp;data=3D04%7C01%7Calexander.deucher%40amd=
.com%7C2ccddb80b2194b87979e08d8a12d78e3%7C3dd8961fe4884e608e11a82d994e183d%=
7C0%7C0%7C637436563973484960%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLC=
JQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3Da%2FwjGAjiR=
1C5wpjwPtmt%2BLkwVcix2gwFzsBvYB8PmDs%3D&amp;reserved=3D0" originalsrc=3D"ht=
tp://people.freedesktop.org/~agd5f/linux.git" shash=3D"QxjKXUg0YY3Ixeo0cLyP=
gpwJ4UQumBmZOfS61jZRhFjVrShp2CxhhIjyPTKDrlKPm1ccwaP2a7JiiKisjI/wSPillPB5uki=
uT5yvCyJOY+DHOwaKgGq61jwRonZcr0/QUpfziqkMg8WSFHh4RWAoz2cFSq/9g9FxoU1/yJjhZp=
A=3D" rel=3D"noreferrer" target=3D"_blank">people.freedesktop.org/~agd5f/li=
nux.git</a><br>
&nbsp; &nbsp; &nbsp; &nbsp; git fetch --no-tags radeon-alex amd-20.45<br>
&nbsp; &nbsp; &nbsp; &nbsp; git checkout e809646e73921328d66a2fbfddf067b9cd=
b30998<br>
&nbsp; &nbsp; &nbsp; &nbsp; # save the attached .config to linux build tree=
<br>
&nbsp; &nbsp; &nbsp; &nbsp; COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dc=
lang make.cross ARCH=3Dx86_64 <br>
<br>
If you fix the issue, kindly add following tag as appropriate<br>
Reported-by: kernel test robot &lt;<a href=3D"mailto:lkp@intel.com" target=
=3D"_blank">lkp@intel.com</a>&gt;<br>
<br>
All warnings (new ones prefixed by &gt;&gt;):<br>
<br>
&gt;&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dce60/dce60_clk_m=
gr.c:83:5: warning: no previous prototype for function 'dce60_get_dp_ref_fr=
eq_khz' [-Wmissing-prototypes]<br>
&nbsp; &nbsp;int dce60_get_dp_ref_freq_khz(struct clk_mgr *clk_mgr_base)<br=
>
&nbsp; &nbsp; &nbsp; &nbsp;^<br>
&nbsp; &nbsp;drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dce60/dce60_c=
lk_mgr.c:83:1: note: declare 'static' if the function is not intended to be=
 used outside of this translation unit<br>
&nbsp; &nbsp;int dce60_get_dp_ref_freq_khz(struct clk_mgr *clk_mgr_base)<br=
>
&nbsp; &nbsp;^<br>
&nbsp; &nbsp;static <br>
&nbsp; &nbsp;1 warning generated.<br>
<br>
vim +/dce60_get_dp_ref_freq_khz +83 drivers/gpu/drm/amd/amdgpu/../display/d=
c/clk_mgr/dce60/dce60_clk_mgr.c<br>
<br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11&nbsp; &nbsp;82&nbsp; <br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11&nbsp; @83&nbsp; int dce60_get_dp_ref=
_freq_khz(struct clk_mgr *clk_mgr_base)<br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11&nbsp; &nbsp;84&nbsp; {<br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11&nbsp; &nbsp;85&nbsp; &nbsp; &nbsp;st=
ruct clk_mgr_internal *clk_mgr =3D TO_CLK_MGR_INTERNAL(clk_mgr_base);<br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11&nbsp; &nbsp;86&nbsp; &nbsp; &nbsp;in=
t dprefclk_wdivider;<br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11&nbsp; &nbsp;87&nbsp; &nbsp; &nbsp;in=
t dp_ref_clk_khz;<br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11&nbsp; &nbsp;88&nbsp; &nbsp; &nbsp;in=
t target_div;<br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11&nbsp; &nbsp;89&nbsp; <br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11&nbsp; &nbsp;90&nbsp; &nbsp; &nbsp;/*=
 DCE6 has no DPREFCLK_CNTL to read DP Reference Clock source */<br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11&nbsp; &nbsp;91&nbsp; <br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11&nbsp; &nbsp;92&nbsp; &nbsp; &nbsp;/*=
 Read the mmDENTIST_DISPCLK_CNTL to get the currently<br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11&nbsp; &nbsp;93&nbsp; &nbsp; &nbsp; *=
 programmed DID DENTIST_DPREFCLK_WDIVIDER*/<br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11&nbsp; &nbsp;94&nbsp; &nbsp; &nbsp;RE=
G_GET(DENTIST_DISPCLK_CNTL, DENTIST_DPREFCLK_WDIVIDER, &amp;dprefclk_wdivid=
er);<br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11&nbsp; &nbsp;95&nbsp; <br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11&nbsp; &nbsp;96&nbsp; &nbsp; &nbsp;/*=
 Convert DENTIST_DPREFCLK_WDIVIDERto actual divider*/<br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11&nbsp; &nbsp;97&nbsp; &nbsp; &nbsp;ta=
rget_div =3D dentist_get_divider_from_did(dprefclk_wdivider);<br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11&nbsp; &nbsp;98&nbsp; <br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11&nbsp; &nbsp;99&nbsp; &nbsp; &nbsp;/*=
 Calculate the current DFS clock, in kHz.*/<br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11&nbsp; 100&nbsp; &nbsp; &nbsp;dp_ref_=
clk_khz =3D (DENTIST_DIVIDER_RANGE_SCALE_FACTOR<br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11&nbsp; 101&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;* clk_mgr-&gt;base.dentist_vco_freq_khz) / target_div;=
<br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11&nbsp; 102&nbsp; <br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11&nbsp; 103&nbsp; &nbsp; &nbsp;return =
dce_adjust_dp_ref_freq_for_ss(clk_mgr, dp_ref_clk_khz);<br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11&nbsp; 104&nbsp; }<br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11&nbsp; 105&nbsp; <br>
<br>
:::::: The code at line 83 was first introduced by commit<br>
:::::: 2428ad5c6ece1a6861278c01c5e71c8ea258f3d9 drm/amd/display: dc/clk_mgr=
: add support for SI parts (v2)<br>
<br>
:::::: TO: Mauro Rossi &lt;<a href=3D"mailto:issor.oruam@gmail.com" target=
=3D"_blank">issor.oruam@gmail.com</a>&gt;<br>
:::::: CC: Yang Xiong &lt;<a href=3D"mailto:Yang.Xiong@amd.com" target=3D"_=
blank">Yang.Xiong@amd.com</a>&gt;<br>
<br>
---<br>
0-DAY CI Kernel Test Service, Intel Corporation<br>
<a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Flists.01.org%2Fhyperkitty%2Flist%2Fkbuild-all%40lists.01.org&amp;data=
=3D04%7C01%7Calexander.deucher%40amd.com%7C2ccddb80b2194b87979e08d8a12d78e3=
%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637436563973494918%7CUnknown%=
7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6M=
n0%3D%7C1000&amp;sdata=3DByv0OS%2F6hHj3RDlt5qF7YxWIiNLvD91r%2Bd1APoUzDkE%3D=
&amp;reserved=3D0" originalsrc=3D"https://lists.01.org/hyperkitty/list/kbui=
ld-all@lists.01.org" shash=3D"U6EERVlu+0ZsZgZRkVXxwK0B3EpnyG6q2f+/1dBXj7SUn=
6nOVsGIgVVXej50Xmy7YvPRvBNa+RKWKYhBzCsli9TZ1UnuWVzMxinyEEFxh1NwRv+zQAfmrl7k=
PE2NX/MWxkTKOuYyv4+eFhHz4n3Vtp7UUUjl1qAMBX7di9w4+ek=3D" rel=3D"noreferrer" =
target=3D"_blank">https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.=
org</a><br>
</blockquote>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_MN2PR12MB4488C8EC6F4ADD998754F504F7C60MN2PR12MB4488namp_--

--===============1477280431==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1477280431==--
