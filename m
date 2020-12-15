Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 227212DAEDA
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 15:25:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2F689361;
	Tue, 15 Dec 2020 14:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2048.outbound.protection.outlook.com [40.107.223.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACC0589361
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 14:24:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Swfx1bxwY9+0n4HDh8VQCXldPfM4Y4wUMZGJzcc9cSMUcp4Q+B+YbSUz7vXjuyd5OwP18fXKhFXe8XuYX9UxsLLxLoukXloktHo7Ug2hehvIluW+PnXVePcCkQJK4bUrXUlZgffGTJyhnuOPuJJOGPYxG+9DEw4skZ9qocgWPryyTANV3d865T0KmPB6UjmWW9U50fRPDwnBPFHC9f+QDDgH27P0cwvLN828180vVqrdV1uB2vjRblCG88VEGzoJA0fKkG+CuwvSmZu2EcFQjW3RY3CWfqDWGYQLhDurU04QhDpfwDRbjEZsV4K8VuhXkHdD7AzAci9K2tVNOnU0AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Qcmy8DNslR08QKqMJH439Byf5TuOBVVXC6aYw0A+Ao=;
 b=K5TG/8l6wBkHZ6roipDhSnG0UFEUk9D44ceMd+itoSipfUgmNxPaX7JiqpCFbuV9TTSX+GP4zdRXQiYAt8NINpvRAwMvHNE3UsxKjbJljVr1Nk0GtHk+LC5SMW5u16BAg5dwVU/qdmCLNbez8npLgMoy0ngIUhx0MJhic977DKsVP5TVM6Ur/dImgzNKIQLNHdQAvAnrVl6nDdFEytjAVHLs4ps7Yh3FdIvnZsUevan1KesNaB1QqpPbs+A5GC0/g+rJH8S9pN9UPgNKp80d49xV5RxWoBY6F4mbgku3WrXZzLQnDbQcA3lDUJOVvqiHJHatq31pL7YpgyuY3YJHAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Qcmy8DNslR08QKqMJH439Byf5TuOBVVXC6aYw0A+Ao=;
 b=jzkPSKWWnWZsIWzul5YeNV7lbVHP8C5/sf6ADUq5oAJR1Jwc1Rfq+f2eqwD4DIwEgoNsCKMAkXzslt6DfmirGYKgsjk54nR2FT9+ymoh5AXMez3d3W1bWlMWi1uYE/taySg1P7Sxw3m1tjd83f8khrQMWa5257GaoHGd2FeWv9s=
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by MN2PR12MB4078.namprd12.prod.outlook.com (2603:10b6:208:1de::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.24; Tue, 15 Dec
 2020 14:24:50 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::fca3:155c:bf43:94af]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::fca3:155c:bf43:94af%4]) with mapi id 15.20.3654.024; Tue, 15 Dec 2020
 14:24:50 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Qinglang Miao <miaoqinglang@huawei.com>, kernel test robot <lkp@intel.com>
Subject: Re: [radeon-alex:amd-20.45 2127/2427]
 drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1880:39:
 sparse: sparse: incorrect type in argument 1 (different base types)
Thread-Topic: [radeon-alex:amd-20.45 2127/2427]
 drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1880:39:
 sparse: sparse: incorrect type in argument 1 (different base types)
Thread-Index: AQHW0q5+fKCSU4ueR0WpsaoBe8LwF6n30TUAgABlGkg=
Date: Tue, 15 Dec 2020 14:24:50 +0000
Message-ID: <MN2PR12MB4488CBBF7050A105FD6F7BF4F7C60@MN2PR12MB4488.namprd12.prod.outlook.com>
References: <202012151443.Z9Fd7yNQ-lkp@intel.com>,
 <4eb73b60-2290-f3e2-d088-9361f8d8c7f3@huawei.com>
In-Reply-To: <4eb73b60-2290-f3e2-d088-9361f8d8c7f3@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=True;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-12-15T14:24:50.217Z;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=AMD
 Public; MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged; 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [192.161.78.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a66761a3-6a2d-4b55-8d69-08d8a1052f16
x-ms-traffictypediagnostic: MN2PR12MB4078:
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB40781DE08F32A13511ED52E9F7C60@MN2PR12MB4078.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:88;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oxZnLnxpB0Si5zEXNiMSQodSsGXbpren26XWFnHEeO42jb/KDNCXH4MNCSwLMHm/2OoeS7qHQo4WBRTr23TdCdNBh0mORyEihNgYSEllCJFWJJYDFDnMmEsYlAaiVMHciohiEfT7eEE4/BjCEgNcF/2/oUVdSXD3H6rMOFKpLBSUPdK7bMdzQcDgt5z74AK7ZrrBDq6SsWIlX1HpgkGypfuL8alxU8Hh4TGyPt1IQpLFfzQFtw1RrRWGz4pVHOoxIODcOZ1jW0SBpUnja90Zi9DiLeydC5tQHTnkuoonU9UBcdbk09VH2awQq5OQL3gaAvhw7aYJuzoofSNKBL2d7bovRQzMwiau7yp7z8A1W8/HoSQMqIPW6FLVPhzt5SirKqSrD0BHJWcahn6kAmcHRw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(366004)(9686003)(7696005)(55016002)(186003)(83380400001)(33656002)(52536014)(5660300002)(2906002)(26005)(30864003)(8676002)(76116006)(966005)(53546011)(8936002)(19627405001)(110136005)(6506007)(54906003)(66556008)(66446008)(508600001)(71200400001)(66476007)(4326008)(86362001)(64756008)(66946007)(166002)(45080400002)(559001)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-2022-jp?B?MUlxRElsUThGZVFFeEVIYU53QmhZd3dYckx6NzJBNkJTWlg0N3huVGhl?=
 =?iso-2022-jp?B?T1QxbVoyd0MvVTdoSUJldWJLYXF1WnpiY2tKVy9hVi9SdnQ3d21pNkFu?=
 =?iso-2022-jp?B?V0k0VThPbnF3eHZWQjk1VVpUMnZndlNteGJYWVlUVUl2S1VrdDB2VVU1?=
 =?iso-2022-jp?B?T2hXT3IveitBQ2U0WVhPR3o0ZEp4Z1VxblVmLzZ5d0NzcWdHRGNxUHc0?=
 =?iso-2022-jp?B?MXpqOVNpd2Zkc296bjZsSDdqanNWQXJoMHMvR2REcHQ4bDRhTGp6aDh4?=
 =?iso-2022-jp?B?eGs2bUt4WEZ3YmRKcUwvT1lSSHVTaUthR25GVEpRVG1zaW14QzdMMFhj?=
 =?iso-2022-jp?B?bURhc3FVQ01IZnhKdWRtblB6MkwrRzQzd3VISUY5WHpWN1lnRFhuVW9o?=
 =?iso-2022-jp?B?bW1pdjMrQkxvVkFnTXRUd1c4NFJaWERNNU1WN0UwcHVDdDR6RG5IZjFp?=
 =?iso-2022-jp?B?VTBwNHdQK251ejY5cHJqeEdEQ2hIKzVGa2ZFcy9ZeERLWHZFRHdOeFZy?=
 =?iso-2022-jp?B?cWZxUkNETG5ueE9JYy9DdlFFdGs5RC83d3o1YVF2dXlkYytRamU3M1Zv?=
 =?iso-2022-jp?B?VHV0dGs1V2ZaenNDaFdpQ3o1cHVIaGtDMEk2NmNBZGJEaElKZDYzR25s?=
 =?iso-2022-jp?B?d0tBTDdxOCtxTEh0S29NbHZaaXZUYmRIL2p6UDBHcGRLKzloQmJFb1Vo?=
 =?iso-2022-jp?B?QWJtdUlpaHgyM0lPM3NsL1Zmc3VDTC9SSU1TY0IycTg2aEtiUU9rczVt?=
 =?iso-2022-jp?B?ZmFPYktKOFRkbGN4bGllQmplWEJhTnJidUplbnRnNGhaODJoU25iOXds?=
 =?iso-2022-jp?B?TFpvSXBtYmtUZCtlb2lwd2hXUmxGejlTTmorRUtzeU9GNHNGOFVjQkgz?=
 =?iso-2022-jp?B?czRIRllJRFRZQStIaVdCR2FhSWhvRDY4cUdYWkRuWDJvMmtDeTExOTlX?=
 =?iso-2022-jp?B?ajRtbEVNdzMzcUkwQ1NKbytESlBIR1JmbHpKQzFOZ2NtcldVTEtqbE5C?=
 =?iso-2022-jp?B?WGtvdml4dGJZd2R4NWdXRS9zc09YNUc3UWJWeEpFMjJySFhVSjVRczIz?=
 =?iso-2022-jp?B?TjlGc2VKV2pjWjJGcHF1TGhnSGJLSlFvbHhXL2ZxOGR2RTJPcy84M2Fr?=
 =?iso-2022-jp?B?S3BuUG5EQWU4eGJZb1F4QWllNW96ZkFvenA4Q3pGdWhTbzVzVnE2d3FM?=
 =?iso-2022-jp?B?bmdkMDRDNm4wMG14ZmtEUm5DUzRGcFJ2bzBFWWZCTThnNjlnL0piLys0?=
 =?iso-2022-jp?B?L1FXM1MvQU1ocnJtMzBQZmJZT3A2Y2pvOXNNOENUdlp2aW5FWXkySlJy?=
 =?iso-2022-jp?B?RDlYOFJTOEtTa1A1ejVJTUVoQm9EMmYzamZNRkVaaEswZWNBZk1WRSty?=
 =?iso-2022-jp?B?MEtPZzhXUW9jOFJ6Qmg4M2NQK1d3ZE81TGN4OUsvZzBYcXdtND0=?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a66761a3-6a2d-4b55-8d69-08d8a1052f16
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2020 14:24:50.8626 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b+cZsfqx4PLTGBzQ/H+IkGGWdqkmng5sHctk63mxbO0AxmDFx3na3B91Vig171d64Xi2Hj5PCKRz2lGTvXyADw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4078
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
Cc: "Xiong, Yang \(Felix\)" <Yang.Xiong@amd.com>,
 "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0149081893=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0149081893==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB4488CBBF7050A105FD6F7BF4F7C60MN2PR12MB4488namp_"

--_000_MN2PR12MB4488CBBF7050A105FD6F7BF4F7C60MN2PR12MB4488namp_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

[AMD Public Use]

The test robot should probably not be testing the amd-20.xx branches in the=
 first place.  They are just mirrors of our packaged drivers so they contai=
n a bunch of stuff that will never go upstream like kernel compatibility la=
yers and dkms support.

Alex

________________________________
From: Qinglang Miao <miaoqinglang@huawei.com>
Sent: Tuesday, December 15, 2020 3:21 AM
To: kernel test robot <lkp@intel.com>; Deucher, Alexander <Alexander.Deuche=
r@amd.com>
Cc: kbuild-all@lists.01.org <kbuild-all@lists.01.org>; dri-devel@lists.free=
desktop.org <dri-devel@lists.freedesktop.org>; Xiong, Yang (Felix) <Yang.Xi=
ong@amd.com>
Subject: Re: [radeon-alex:amd-20.45 2127/2427] drivers/gpu/drm/amd/amdgpu/.=
./display/dc/bios/command_table.c:1880:39: sparse: sparse: incorrect type i=
n argument 1 (different base types)

Hi Alex,

I think it's not a valid report from kernel test robot, for __le16 ought
to be the right type for cpu_to_le16. The sparse warnings seems not
right so I did't try effort to reproduce it.

otherwise, when I take a carful look at this patch, an unconditional
braces exists and I'm not sure about its benefit.

if (bp_params->flags.INTERLACE) {
                params.susModeMiscInfo.usAccess =3D
                cpu_to_le16(le16_to_cpu(params.susModeMiscInfo.usAccess) |
ATOM_INTERLACE);
                {
                        le16_add_cpu(&params.usV_SyncOffset, 1);
                }
}

patch link:
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.ke=
rnel.org%2Flkml%2FCADnq5_PunHA1VHHj7VtEHG6o2Z_Z1WS325y_R9xO%2BgsV_JCOXw%40m=
ail.gmail.com%2F&amp;data=3D04%7C01%7Calexander.deucher%40amd.com%7Cc9a5d92=
73f464451b1f808d8a0d271fe%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C6374=
36173010744629%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIi=
LCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D1TmtjBXJLf60sxq%2BH%2BVmM=
hnRV%2FuyIKQD2BYDVWMxmUA%3D&amp;reserved=3D0

How do you think?

=1B$B:_=1B(B 2020/12/15 14:44, kernel test robot =1B$B<LF;=1B(B:
> tree:   git://people.freedesktop.org/~agd5f/linux.git amd-20.45
> head:   a3950d94b046fb206e58fd3ec717f071c0203ba3
> commit: c82b6c9ed412fb7009b02dd82e50ee24f451e9a8 [2127/2427] drm/amd/disp=
lay: convert to use le16_add_cpu()
> config: arc-randconfig-s031-20201214 (attached as .config)
> compiler: arc-elf-gcc (GCC) 9.3.0
> reproduce:
>          wget https://nam11.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fraw.githubusercontent.com%2Fintel%2Flkp-tests%2Fmaster%2Fsbin%2Fma=
ke.cross&amp;data=3D04%7C01%7Calexander.deucher%40amd.com%7Cc9a5d9273f46445=
1b1f808d8a0d271fe%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637436173010=
754583%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6=
Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DDCHDVGjiXhPDoCTofTf0pxHspdydDs1JX=
neGoSGPgFQ%3D&amp;reserved=3D0 -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # apt-get install sparse
>          # sparse version: v0.6.3-184-g1b896707-dirty
>          git remote add radeon-alex git://people.freedesktop.org/~agd5f/l=
inux.git
>          git fetch --no-tags radeon-alex amd-20.45
>          git checkout c82b6c9ed412fb7009b02dd82e50ee24f451e9a8
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cro=
ss C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Darc
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
>
> "sparse warnings: (new ones prefixed by >>)"
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:879:43:=
 sparse: sparse: incorrect type in assignment (different base types) @@    =
 expected unsigned int [addressable] [assigned] [usertype] ulSymClock @@   =
  got restricted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:879:43:=
 sparse:     expected unsigned int [addressable] [assigned] [usertype] ulSy=
mClock
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:879:43:=
 sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:956:40:=
 sparse: sparse: incorrect type in assignment (different base types) @@    =
 expected unsigned short [addressable] [assigned] [usertype] usRefDiv @@   =
  got restricted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:956:40:=
 sparse:     expected unsigned short [addressable] [assigned] [usertype] us=
RefDiv
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:956:40:=
 sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:958:39:=
 sparse: sparse: incorrect type in assignment (different base types) @@    =
 expected unsigned short [addressable] [assigned] [usertype] usFbDiv @@    =
 got restricted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:958:39:=
 sparse:     expected unsigned short [addressable] [assigned] [usertype] us=
FbDiv
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:958:39:=
 sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:966:44:=
 sparse: sparse: incorrect type in assignment (different base types) @@    =
 expected unsigned short [addressable] [assigned] [usertype] usPixelClock @=
@     got restricted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:966:44:=
 sparse:     expected unsigned short [addressable] [assigned] [usertype] us=
PixelClock
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:966:44:=
 sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1029:40=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [addressable] [assigned] [usertype] usFbDiv @@   =
  got restricted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1029:40=
: sparse:     expected unsigned short [addressable] [assigned] [usertype] u=
sFbDiv
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1029:40=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1031:47=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned int [addressable] [assigned] [usertype] ulFbDivDecFrac =
@@     got restricted __le32 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1031:47=
: sparse:     expected unsigned int [addressable] [assigned] [usertype] ulF=
bDivDecFrac
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1031:47=
: sparse:     got restricted __le32 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1044:45=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [addressable] [assigned] [usertype] usPixelClock =
@@     got restricted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1044:45=
: sparse:     expected unsigned short [addressable] [assigned] [usertype] u=
sPixelClock
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1044:45=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1105:40=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [addressable] [assigned] [usertype] usFbDiv @@   =
  got restricted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1105:40=
: sparse:     expected unsigned short [addressable] [assigned] [usertype] u=
sFbDiv
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1105:40=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1107:47=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned int [addressable] [assigned] [usertype] ulFbDivDecFrac =
@@     got restricted __le32 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1107:47=
: sparse:     expected unsigned int [addressable] [assigned] [usertype] ulF=
bDivDecFrac
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1107:47=
: sparse:     got restricted __le32 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1120:60=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned int [addressable] [assigned] [usertype] ulPixelClock:24=
 @@     got restricted __le32 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1120:60=
: sparse:     expected unsigned int [addressable] [assigned] [usertype] ulP=
ixelClock:24
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1120:60=
: sparse:     got restricted __le32 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1183:34=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned int [addressable] [assigned] [usertype] ulPixelClock @@=
     got restricted __le32 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1183:34=
: sparse:     expected unsigned int [addressable] [assigned] [usertype] ulP=
ixelClock
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1183:34=
: sparse:     got restricted __le32 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1272:43=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [addressable] [assigned] [usertype] usSpreadSpect=
rumPercentage @@     got restricted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1272:43=
: sparse:     expected unsigned short [addressable] [assigned] [usertype] u=
sSpreadSpectrumPercentage
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1272:43=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1321:51=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [addressable] [assigned] [usertype] usSpreadSpect=
rumPercentage @@     got restricted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1321:51=
: sparse:     expected unsigned short [addressable] [assigned] [usertype] u=
sSpreadSpectrumPercentage
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1321:51=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1323:45=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [addressable] [assigned] [usertype] usSpreadSpect=
rumStep @@     got restricted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1323:45=
: sparse:     expected unsigned short [addressable] [assigned] [usertype] u=
sSpreadSpectrumStep
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1323:45=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1337:47=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [addressable] [assigned] [usertype] usSpreadSpect=
rumAmount @@     got restricted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1337:47=
: sparse:     expected unsigned short [addressable] [assigned] [usertype] u=
sSpreadSpectrumAmount
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1337:47=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1391:51=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [addressable] [assigned] [usertype] usSpreadSpect=
rumAmountFrac @@     got restricted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1391:51=
: sparse:     expected unsigned short [addressable] [assigned] [usertype] u=
sSpreadSpectrumAmountFrac
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1391:51=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1393:45=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [addressable] [assigned] [usertype] usSpreadSpect=
rumStep @@     got restricted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1393:45=
: sparse:     expected unsigned short [addressable] [assigned] [usertype] u=
sSpreadSpectrumStep
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1393:45=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1406:47=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [addressable] [assigned] [usertype] usSpreadSpect=
rumAmount @@     got restricted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1406:47=
: sparse:     expected unsigned short [addressable] [assigned] [usertype] u=
sSpreadSpectrumAmount
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1406:47=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1465:29=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [usertype] usPixelClock @@     got restricted __l=
e16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1465:29=
: sparse:     expected unsigned short [usertype] usPixelClock
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1465:29=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1488:36=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [addressable] [usertype] usPixelClock @@     got =
restricted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1488:36=
: sparse:     expected unsigned short [addressable] [usertype] usPixelClock
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1488:36=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1508:43=
: sparse: sparse: cast to restricted __le32
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1583:30=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [usertype] usPixelClock @@     got restricted __l=
e16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1583:30=
: sparse:     expected unsigned short [usertype] usPixelClock
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1583:30=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1826:25=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [assigned] [usertype] usH_Size @@     got restric=
ted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1826:25=
: sparse:     expected unsigned short [assigned] [usertype] usH_Size
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1826:25=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1828:34=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [assigned] [usertype] usH_Blanking_Time @@     go=
t restricted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1828:34=
: sparse:     expected unsigned short [assigned] [usertype] usH_Blanking_Ti=
me
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1828:34=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1831:25=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [assigned] [usertype] usV_Size @@     got restric=
ted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1831:25=
: sparse:     expected unsigned short [assigned] [usertype] usV_Size
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1831:25=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1833:34=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [assigned] [usertype] usV_Blanking_Time @@     go=
t restricted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1833:34=
: sparse:     expected unsigned short [assigned] [usertype] usV_Blanking_Ti=
me
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1833:34=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1838:31=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [assigned] [usertype] usH_SyncOffset @@     got r=
estricted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1838:31=
: sparse:     expected unsigned short [assigned] [usertype] usH_SyncOffset
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1838:31=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1840:30=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [assigned] [usertype] usH_SyncWidth @@     got re=
stricted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1840:30=
: sparse:     expected unsigned short [assigned] [usertype] usH_SyncWidth
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1840:30=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1844:31=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [assigned] [usertype] usV_SyncOffset @@     got r=
estricted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1844:31=
: sparse:     expected unsigned short [assigned] [usertype] usV_SyncOffset
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1844:31=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1846:30=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [assigned] [usertype] usV_SyncWidth @@     got re=
stricted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1846:30=
: sparse:     expected unsigned short [assigned] [usertype] usV_SyncWidth
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1846:30=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1855:33=
: sparse: sparse: cast to restricted __le16
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1854:49=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [assigned] [usertype] usAccess @@     got restric=
ted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1854:49=
: sparse:     expected unsigned short [assigned] [usertype] usAccess
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1854:49=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1859:33=
: sparse: sparse: cast to restricted __le16
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1858:49=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [assigned] [usertype] usAccess @@     got restric=
ted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1858:49=
: sparse:     expected unsigned short [assigned] [usertype] usAccess
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1858:49=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1863:33=
: sparse: sparse: cast to restricted __le16
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1862:49=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [assigned] [usertype] usAccess @@     got restric=
ted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1862:49=
: sparse:     expected unsigned short [assigned] [usertype] usAccess
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1862:49=
: sparse:     got restricted __le16 [usertype]
>>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1880:39: =
sparse: sparse: incorrect type in argument 1 (different base types) @@     =
expected restricted __le16 [usertype] *var @@     got unsigned short * @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1880:39=
: sparse:     expected restricted __le16 [usertype] *var
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1880:39=
: sparse:     got unsigned short *
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1886:33=
: sparse: sparse: cast to restricted __le16
>>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1885:49: =
sparse: sparse: incorrect type in assignment (different base types) @@     =
expected unsigned short [addressable] [assigned] [usertype] usAccess @@    =
 got restricted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1885:49=
: sparse:     expected unsigned short [addressable] [assigned] [usertype] u=
sAccess
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1885:49=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1752:26=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [assigned] [usertype] usH_Total @@     got restri=
cted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1752:26=
: sparse:     expected unsigned short [assigned] [usertype] usH_Total
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1752:26=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1753:25=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [assigned] [usertype] usH_Disp @@     got restric=
ted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1753:25=
: sparse:     expected unsigned short [assigned] [usertype] usH_Disp
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1753:25=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1754:30=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [assigned] [usertype] usH_SyncStart @@     got re=
stricted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1754:30=
: sparse:     expected unsigned short [assigned] [usertype] usH_SyncStart
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1754:30=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1755:30=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [assigned] [usertype] usH_SyncWidth @@     got re=
stricted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1755:30=
: sparse:     expected unsigned short [assigned] [usertype] usH_SyncWidth
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1755:30=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1756:26=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [assigned] [usertype] usV_Total @@     got restri=
cted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1756:26=
: sparse:     expected unsigned short [assigned] [usertype] usV_Total
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1756:26=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1757:25=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [assigned] [usertype] usV_Disp @@     got restric=
ted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1757:25=
: sparse:     expected unsigned short [assigned] [usertype] usV_Disp
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1757:25=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1758:30=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [assigned] [usertype] usV_SyncStart @@     got re=
stricted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1758:30=
: sparse:     expected unsigned short [assigned] [usertype] usV_SyncStart
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1758:30=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1760:30=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [assigned] [usertype] usV_SyncWidth @@     got re=
stricted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1760:30=
: sparse:     expected unsigned short [assigned] [usertype] usV_SyncWidth
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1760:30=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1776:33=
: sparse: sparse: cast to restricted __le16
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1775:49=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [assigned] [usertype] usAccess @@     got restric=
ted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1775:49=
: sparse:     expected unsigned short [assigned] [usertype] usAccess
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1775:49=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1780:33=
: sparse: sparse: cast to restricted __le16
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1779:49=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [assigned] [usertype] usAccess @@     got restric=
ted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1779:49=
: sparse:     expected unsigned short [assigned] [usertype] usAccess
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1779:49=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1784:33=
: sparse: sparse: cast to restricted __le16
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1783:49=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [assigned] [usertype] usAccess @@     got restric=
ted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1783:49=
: sparse:     expected unsigned short [assigned] [usertype] usAccess
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1783:49=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1799:38=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [assigned] [usertype] usV_SyncStart @@     got re=
stricted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1799:38=
: sparse:     expected unsigned short [assigned] [usertype] usV_SyncStart
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1799:38=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1805:33=
: sparse: sparse: cast to restricted __le16
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1804:49=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [assigned] [usertype] usAccess @@     got restric=
ted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1804:49=
: sparse:     expected unsigned short [assigned] [usertype] usAccess
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1804:49=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2047:40=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [addressable] [assigned] [usertype] usPixelClock =
@@     got restricted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2047:40=
: sparse:     expected unsigned short [addressable] [assigned] [usertype] u=
sPixelClock
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2047:40=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2079:44=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned int [addressable] [assigned] [usertype] ulDispEngClkFre=
q @@     got restricted __le32 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2079:44=
: sparse:     expected unsigned int [addressable] [assigned] [usertype] ulD=
ispEngClkFreq
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2079:44=
: sparse:     got restricted __le32 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2092:44=
: sparse: sparse: cast to restricted __le32
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2174:44=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [usertype] usConnectorId @@     got restricted __=
le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2174:44=
: sparse:     expected unsigned short [usertype] usConnectorId
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2174:44=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2183:43=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [usertype] usPixelClock @@     got restricted __l=
e16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2183:43=
: sparse:     expected unsigned short [usertype] usPixelClock
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2183:43=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2207:43=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [usertype] usPixelClock @@     got restricted __l=
e16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2207:43=
: sparse:     expected unsigned short [usertype] usPixelClock
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2207:43=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2340:45=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned int [addressable] [assigned] [usertype] ulDCEClkFreq @@=
     got restricted __le32 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2340:45=
: sparse:     expected unsigned int [addressable] [assigned] [usertype] ulD=
CEClkFreq
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2340:45=
: sparse:     got restricted __le32 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2344:53=
: sparse: sparse: cast to restricted __le32
> --
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:413:34=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned int [addressable] [assigned] [usertype] pixclk_100hz @@=
     got restricted __le32 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:413:34=
: sparse:     expected unsigned int [addressable] [assigned] [usertype] pix=
clk_100hz
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:413:34=
: sparse:     got restricted __le32 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:509:23=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [assigned] [usertype] h_size @@     got restricte=
d __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:509:23=
: sparse:     expected unsigned short [assigned] [usertype] h_size
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:509:23=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:511:32=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [assigned] [usertype] h_blanking_time @@     got =
restricted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:511:32=
: sparse:     expected unsigned short [assigned] [usertype] h_blanking_time
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:511:32=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:515:23=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [assigned] [usertype] v_size @@     got restricte=
d __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:515:23=
: sparse:     expected unsigned short [assigned] [usertype] v_size
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:515:23=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:517:32=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [assigned] [usertype] v_blanking_time @@     got =
restricted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:517:32=
: sparse:     expected unsigned short [assigned] [usertype] v_blanking_time
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:517:32=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:524:29=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [assigned] [usertype] h_syncoffset @@     got res=
tricted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:524:29=
: sparse:     expected unsigned short [assigned] [usertype] h_syncoffset
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:524:29=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:527:28=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [assigned] [usertype] h_syncwidth @@     got rest=
ricted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:527:28=
: sparse:     expected unsigned short [assigned] [usertype] h_syncwidth
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:527:28=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:532:29=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [assigned] [usertype] v_syncoffset @@     got res=
tricted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:532:29=
: sparse:     expected unsigned short [assigned] [usertype] v_syncoffset
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:532:29=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:535:28=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [assigned] [usertype] v_syncwidth @@     got rest=
ricted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:535:28=
: sparse:     expected unsigned short [assigned] [usertype] v_syncwidth
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:535:28=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:544:33=
: sparse: sparse: cast to restricted __le16
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:543:37=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [assigned] [usertype] modemiscinfo @@     got res=
tricted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:543:37=
: sparse:     expected unsigned short [assigned] [usertype] modemiscinfo
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:543:37=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:549:33=
: sparse: sparse: cast to restricted __le16
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:548:37=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [assigned] [usertype] modemiscinfo @@     got res=
tricted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:548:37=
: sparse:     expected unsigned short [assigned] [usertype] modemiscinfo
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:548:37=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:554:33=
: sparse: sparse: cast to restricted __le16
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:553:37=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned short [assigned] [usertype] modemiscinfo @@     got res=
tricted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:553:37=
: sparse:     expected unsigned short [assigned] [usertype] modemiscinfo
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:553:37=
: sparse:     got restricted __le16 [usertype]
>>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:572:39: =
sparse: sparse: incorrect type in argument 1 (different base types) @@     =
expected restricted __le16 [usertype] *var @@     got unsigned short * @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:572:39=
: sparse:     expected restricted __le16 [usertype] *var
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:572:39=
: sparse:     got unsigned short *
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:578:25=
: sparse: sparse: cast to restricted __le16
>>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:577:37: =
sparse: sparse: incorrect type in assignment (different base types) @@     =
expected unsigned short [addressable] [assigned] [usertype] modemiscinfo @@=
     got restricted __le16 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:577:37=
: sparse:     expected unsigned short [addressable] [assigned] [usertype] m=
odemiscinfo
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:577:37=
: sparse:     got restricted __le16 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:851:43=
: sparse: sparse: incorrect type in assignment (different base types) @@   =
  expected unsigned int [addressable] [assigned] [usertype] dceclk_10khz @@=
     got restricted __le32 [usertype] @@
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:851:43=
: sparse:     expected unsigned int [addressable] [assigned] [usertype] dce=
clk_10khz
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:851:43=
: sparse:     got restricted __le32 [usertype]
>     drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:860:53=
: sparse: sparse: cast to restricted __le32
>
> vim +1880 drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c
>
>    1812
>    1813       static enum bp_result set_crtc_using_dtd_timing_v3(
>    1814               struct bios_parser *bp,
>    1815               struct bp_hw_crtc_timing_parameters *bp_params)
>    1816       {
>    1817               enum bp_result result =3D BP_RESULT_FAILURE;
>    1818               SET_CRTC_USING_DTD_TIMING_PARAMETERS params =3D {0}=
;
>    1819               uint8_t atom_controller_id;
>    1820
>    1821               if (bp->cmd_helper->controller_id_to_atom(
>    1822                               bp_params->controller_id, &atom_con=
troller_id))
>    1823                       params.ucCRTC =3D atom_controller_id;
>    1824
>    1825               /* bios usH_Size wants h addressable size */
>    1826               params.usH_Size =3D cpu_to_le16((uint16_t)bp_params=
->h_addressable);
>    1827               /* bios usH_Blanking_Time wants borders included in=
 blanking */
>    1828               params.usH_Blanking_Time =3D
>    1829                               cpu_to_le16((uint16_t)(bp_params->h=
_total - bp_params->h_addressable));
>    1830               /* bios usV_Size wants v addressable size */
>    1831               params.usV_Size =3D cpu_to_le16((uint16_t)bp_params=
->v_addressable);
>    1832               /* bios usV_Blanking_Time wants borders included in=
 blanking */
>    1833               params.usV_Blanking_Time =3D
>    1834                               cpu_to_le16((uint16_t)(bp_params->v=
_total - bp_params->v_addressable));
>    1835               /* bios usHSyncOffset is the offset from the end of=
 h addressable,
>    1836                * our horizontalSyncStart is the offset from the b=
eginning
>    1837                * of h addressable */
>    1838               params.usH_SyncOffset =3D
>    1839                               cpu_to_le16((uint16_t)(bp_params->h=
_sync_start - bp_params->h_addressable));
>    1840               params.usH_SyncWidth =3D cpu_to_le16((uint16_t)bp_p=
arams->h_sync_width);
>    1841               /* bios usHSyncOffset is the offset from the end of=
 v addressable,
>    1842                * our verticalSyncStart is the offset from the beg=
inning of
>    1843                * v addressable */
>    1844               params.usV_SyncOffset =3D
>    1845                               cpu_to_le16((uint16_t)(bp_params->v=
_sync_start - bp_params->v_addressable));
>    1846               params.usV_SyncWidth =3D cpu_to_le16((uint16_t)bp_p=
arams->v_sync_width);
>    1847
>    1848               /* we assume that overscan from original timing doe=
s not get bigger
>    1849                * than 255
>    1850                * we will program all the borders in the Set CRTC =
Overscan call below
>    1851                */
>    1852
>    1853               if (0 =3D=3D bp_params->flags.HSYNC_POSITIVE_POLARI=
TY)
>    1854                       params.susModeMiscInfo.usAccess =3D
>    1855                                       cpu_to_le16(le16_to_cpu(par=
ams.susModeMiscInfo.usAccess) | ATOM_HSYNC_POLARITY);
>    1856
>    1857               if (0 =3D=3D bp_params->flags.VSYNC_POSITIVE_POLARI=
TY)
>    1858                       params.susModeMiscInfo.usAccess =3D
>    1859                                       cpu_to_le16(le16_to_cpu(par=
ams.susModeMiscInfo.usAccess) | ATOM_VSYNC_POLARITY);
>    1860
>    1861               if (bp_params->flags.INTERLACE) {
>    1862                       params.susModeMiscInfo.usAccess =3D
>    1863                                       cpu_to_le16(le16_to_cpu(par=
ams.susModeMiscInfo.usAccess) | ATOM_INTERLACE);
>    1864
>    1865                       /* original DAL code has this condition to =
apply this
>    1866                        * for non-TV/CV only
>    1867                        * due to complex MV testing for possible i=
mpact
>    1868                        * if ( pACParameters->signal !=3D SignalTy=
pe_YPbPr &&
>    1869                        *  pACParameters->signal !=3D SignalType_C=
omposite &&
>    1870                        *  pACParameters->signal !=3D SignalType_S=
Video)
>    1871                        */
>    1872                       {
>    1873                               /* HW will deduct 0.5 line from 2nd=
 feild.
>    1874                                * i.e. for 1080i, it is 2 lines fo=
r 1st field,
>    1875                                * 2.5 lines for the 2nd feild. we =
need input as 5
>    1876                                * instead of 4.
>    1877                                * but it is 4 either from Edid dat=
a (spec CEA 861)
>    1878                                * or CEA timing table.
>    1879                                */
>> 1880                         le16_add_cpu(&params.usV_SyncOffset, 1);
>    1881                       }
>    1882               }
>    1883
>    1884               if (bp_params->flags.HORZ_COUNT_BY_TWO)
>> 1885                 params.susModeMiscInfo.usAccess =3D
>    1886                                       cpu_to_le16(le16_to_cpu(par=
ams.susModeMiscInfo.usAccess) | ATOM_DOUBLE_CLOCK_MODE);
>    1887
>    1888               if (EXEC_BIOS_CMD_TABLE(SetCRTC_UsingDTDTiming, par=
ams))
>    1889                       result =3D BP_RESULT_OK;
>    1890
>    1891               return result;
>    1892       }
>    1893
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
.01.org%2Fhyperkitty%2Flist%2Fkbuild-all%40lists.01.org&amp;data=3D04%7C01%=
7Calexander.deucher%40amd.com%7Cc9a5d9273f464451b1f808d8a0d271fe%7C3dd8961f=
e4884e608e11a82d994e183d%7C0%7C0%7C637436173010754583%7CUnknown%7CTWFpbGZsb=
3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C100=
0&amp;sdata=3DYyHY6sZPmHM14xXSHmp9tcYJpzeO842YlCqX1XISOkw%3D&amp;reserved=
=3D0
>

--_000_MN2PR12MB4488CBBF7050A105FD6F7BF4F7C60MN2PR12MB4488namp_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
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
The test robot should probably not be testing the amd-20.xx branches in the=
 first place.&nbsp; They are just mirrors of our packaged drivers so they c=
ontain a bunch of stuff that will never go upstream like kernel compatibili=
ty layers and dkms support.</div>
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
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Qinglang Miao &lt;mia=
oqinglang@huawei.com&gt;<br>
<b>Sent:</b> Tuesday, December 15, 2020 3:21 AM<br>
<b>To:</b> kernel test robot &lt;lkp@intel.com&gt;; Deucher, Alexander &lt;=
Alexander.Deucher@amd.com&gt;<br>
<b>Cc:</b> kbuild-all@lists.01.org &lt;kbuild-all@lists.01.org&gt;; dri-dev=
el@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt;; Xiong, Ya=
ng (Felix) &lt;Yang.Xiong@amd.com&gt;<br>
<b>Subject:</b> Re: [radeon-alex:amd-20.45 2127/2427] drivers/gpu/drm/amd/a=
mdgpu/../display/dc/bios/command_table.c:1880:39: sparse: sparse: incorrect=
 type in argument 1 (different base types)</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi Alex,<br>
<br>
I think it's not a valid report from kernel test robot, for __le16 ought <b=
r>
to be the right type for cpu_to_le16. The sparse warnings seems not <br>
right so I did't try effort to reproduce it.<br>
<br>
otherwise, when I take a carful look at this patch, an unconditional <br>
braces exists and I'm not sure about its benefit.<br>
<br>
if (bp_params-&gt;flags.INTERLACE) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; params.susModeMiscInfo.usAccess =3D<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; cpu_to_le16(le16_to_cpu(params.susModeMiscInfo.usAccess) | =
<br>
ATOM_INTERLACE);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; le16_add_cp=
u(&amp;params.usV_SyncOffset, 1);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; }<br>
}<br>
<br>
patch link: <br>
<a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Flore.kernel.org%2Flkml%2FCADnq5_PunHA1VHHj7VtEHG6o2Z_Z1WS325y_R9xO%2Bgs=
V_JCOXw%40mail.gmail.com%2F&amp;amp;data=3D04%7C01%7Calexander.deucher%40am=
d.com%7Cc9a5d9273f464451b1f808d8a0d271fe%7C3dd8961fe4884e608e11a82d994e183d=
%7C0%7C0%7C637436173010744629%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL=
CJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3D1TmtjB=
XJLf60sxq%2BH%2BVmMhnRV%2FuyIKQD2BYDVWMxmUA%3D&amp;amp;reserved=3D0">https:=
//nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.kernel.o=
rg%2Flkml%2FCADnq5_PunHA1VHHj7VtEHG6o2Z_Z1WS325y_R9xO%2BgsV_JCOXw%40mail.gm=
ail.com%2F&amp;amp;data=3D04%7C01%7Calexander.deucher%40amd.com%7Cc9a5d9273=
f464451b1f808d8a0d271fe%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637436=
173010744629%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLC=
JBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3D1TmtjBXJLf60sxq%2BH%2BV=
mMhnRV%2FuyIKQD2BYDVWMxmUA%3D&amp;amp;reserved=3D0</a><br>
<br>
How do you think?<br>
<br>
=1B$B:_=1B(B 2020/12/15 14:44, kernel test robot =1B$B<LF;=1B(B:<br>
&gt; tree:&nbsp;&nbsp; git://people.freedesktop.org/~agd5f/linux.git amd-20=
.45<br>
&gt; head:&nbsp;&nbsp; a3950d94b046fb206e58fd3ec717f071c0203ba3<br>
&gt; commit: c82b6c9ed412fb7009b02dd82e50ee24f451e9a8 [2127/2427] drm/amd/d=
isplay: convert to use le16_add_cpu()<br>
&gt; config: arc-randconfig-s031-20201214 (attached as .config)<br>
&gt; compiler: arc-elf-gcc (GCC) 9.3.0<br>
&gt; reproduce:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wget <a href=3D"=
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fraw.git=
hubusercontent.com%2Fintel%2Flkp-tests%2Fmaster%2Fsbin%2Fmake.cross&amp;amp=
;data=3D04%7C01%7Calexander.deucher%40amd.com%7Cc9a5d9273f464451b1f808d8a0d=
271fe%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637436173010754583%7CUnk=
nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
VCI6Mn0%3D%7C1000&amp;amp;sdata=3DDCHDVGjiXhPDoCTofTf0pxHspdydDs1JXneGoSGPg=
FQ%3D&amp;amp;reserved=3D0">
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fraw.git=
hubusercontent.com%2Fintel%2Flkp-tests%2Fmaster%2Fsbin%2Fmake.cross&amp;amp=
;data=3D04%7C01%7Calexander.deucher%40amd.com%7Cc9a5d9273f464451b1f808d8a0d=
271fe%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637436173010754583%7CUnk=
nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
VCI6Mn0%3D%7C1000&amp;amp;sdata=3DDCHDVGjiXhPDoCTofTf0pxHspdydDs1JXneGoSGPg=
FQ%3D&amp;amp;reserved=3D0</a>
 -O ~/bin/make.cross<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; chmod +x ~/bin/m=
ake.cross<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # apt-get instal=
l sparse<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # sparse version=
: v0.6.3-184-g1b896707-dirty<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; git remote add r=
adeon-alex git://people.freedesktop.org/~agd5f/linux.git<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; git fetch --no-t=
ags radeon-alex amd-20.45<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; git checkout c82=
b6c9ed412fb7009b02dd82e50ee24f451e9a8<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # save the attac=
hed .config to linux build tree<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; COMPILER_INSTALL=
_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross C=3D1 CF=3D'-fdiagnostic=
-prefix -D__CHECK_ENDIAN__' ARCH=3Darc<br>
&gt; <br>
&gt; If you fix the issue, kindly add following tag as appropriate<br>
&gt; Reported-by: kernel test robot &lt;lkp@intel.com&gt;<br>
&gt; <br>
&gt; <br>
&gt; &quot;sparse warnings: (new ones prefixed by &gt;&gt;)&quot;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:879:43: sparse: sparse: incorrect type in assignment (diffe=
rent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned int [addressa=
ble] [assigned] [usertype] ulSymClock @@&nbsp;&nbsp;&nbsp;&nbsp; got restri=
cted __le16 [usertype]
 @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:879:43: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned i=
nt [addressable] [assigned] [usertype] ulSymClock<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:879:43: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le=
16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:956:40: sparse: sparse: incorrect type in assignment (diffe=
rent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addres=
sable] [assigned] [usertype] usRefDiv @@&nbsp;&nbsp;&nbsp;&nbsp; got restri=
cted __le16 [usertype]
 @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:956:40: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned s=
hort [addressable] [assigned] [usertype] usRefDiv<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:956:40: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le=
16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:958:39: sparse: sparse: incorrect type in assignment (diffe=
rent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addres=
sable] [assigned] [usertype] usFbDiv @@&nbsp;&nbsp;&nbsp;&nbsp; got restric=
ted __le16 [usertype]
 @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:958:39: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned s=
hort [addressable] [assigned] [usertype] usFbDiv<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:958:39: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le=
16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:966:44: sparse: sparse: incorrect type in assignment (diffe=
rent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addres=
sable] [assigned] [usertype] usPixelClock @@&nbsp;&nbsp;&nbsp;&nbsp; got re=
stricted __le16 [usertype]
 @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:966:44: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned s=
hort [addressable] [assigned] [usertype] usPixelClock<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:966:44: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le=
16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1029:40: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addre=
ssable] [assigned] [usertype] usFbDiv @@&nbsp;&nbsp;&nbsp;&nbsp; got restri=
cted __le16 [usertype]
 @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1029:40: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [addressable] [assigned] [usertype] usFbDiv<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1029:40: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1031:47: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned int [address=
able] [assigned] [usertype] ulFbDivDecFrac @@&nbsp;&nbsp;&nbsp;&nbsp; got r=
estricted __le32 [usertype]
 @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1031:47: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
int [addressable] [assigned] [usertype] ulFbDivDecFrac<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1031:47: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e32 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1044:45: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addre=
ssable] [assigned] [usertype] usPixelClock @@&nbsp;&nbsp;&nbsp;&nbsp; got r=
estricted __le16 [usertype]
 @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1044:45: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [addressable] [assigned] [usertype] usPixelClock<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1044:45: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1105:40: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addre=
ssable] [assigned] [usertype] usFbDiv @@&nbsp;&nbsp;&nbsp;&nbsp; got restri=
cted __le16 [usertype]
 @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1105:40: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [addressable] [assigned] [usertype] usFbDiv<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1105:40: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1107:47: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned int [address=
able] [assigned] [usertype] ulFbDivDecFrac @@&nbsp;&nbsp;&nbsp;&nbsp; got r=
estricted __le32 [usertype]
 @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1107:47: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
int [addressable] [assigned] [usertype] ulFbDivDecFrac<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1107:47: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e32 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1120:60: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned int [address=
able] [assigned] [usertype] ulPixelClock:24 @@&nbsp;&nbsp;&nbsp;&nbsp; got =
restricted __le32 [usertype]
 @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1120:60: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
int [addressable] [assigned] [usertype] ulPixelClock:24<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1120:60: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e32 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1183:34: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned int [address=
able] [assigned] [usertype] ulPixelClock @@&nbsp;&nbsp;&nbsp;&nbsp; got res=
tricted __le32 [usertype]
 @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1183:34: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
int [addressable] [assigned] [usertype] ulPixelClock<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1183:34: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e32 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1272:43: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addre=
ssable] [assigned] [usertype] usSpreadSpectrumPercentage @@&nbsp;&nbsp;&nbs=
p;&nbsp; got restricted
 __le16 [usertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1272:43: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [addressable] [assigned] [usertype] usSpreadSpectrumPercentage<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1272:43: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1321:51: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addre=
ssable] [assigned] [usertype] usSpreadSpectrumPercentage @@&nbsp;&nbsp;&nbs=
p;&nbsp; got restricted
 __le16 [usertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1321:51: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [addressable] [assigned] [usertype] usSpreadSpectrumPercentage<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1321:51: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1323:45: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addre=
ssable] [assigned] [usertype] usSpreadSpectrumStep @@&nbsp;&nbsp;&nbsp;&nbs=
p; got restricted __le16
 [usertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1323:45: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [addressable] [assigned] [usertype] usSpreadSpectrumStep<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1323:45: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1337:47: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addre=
ssable] [assigned] [usertype] usSpreadSpectrumAmount @@&nbsp;&nbsp;&nbsp;&n=
bsp; got restricted
 __le16 [usertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1337:47: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [addressable] [assigned] [usertype] usSpreadSpectrumAmount<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1337:47: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1391:51: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addre=
ssable] [assigned] [usertype] usSpreadSpectrumAmountFrac @@&nbsp;&nbsp;&nbs=
p;&nbsp; got restricted
 __le16 [usertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1391:51: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [addressable] [assigned] [usertype] usSpreadSpectrumAmountFrac<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1391:51: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1393:45: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addre=
ssable] [assigned] [usertype] usSpreadSpectrumStep @@&nbsp;&nbsp;&nbsp;&nbs=
p; got restricted __le16
 [usertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1393:45: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [addressable] [assigned] [usertype] usSpreadSpectrumStep<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1393:45: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1406:47: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addre=
ssable] [assigned] [usertype] usSpreadSpectrumAmount @@&nbsp;&nbsp;&nbsp;&n=
bsp; got restricted
 __le16 [usertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1406:47: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [addressable] [assigned] [usertype] usSpreadSpectrumAmount<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1406:47: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1465:29: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [usert=
ype] usPixelClock @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertyp=
e] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1465:29: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [usertype] usPixelClock<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1465:29: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1488:36: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addre=
ssable] [usertype] usPixelClock @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted _=
_le16 [usertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1488:36: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [addressable] [usertype] usPixelClock<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1488:36: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1508:43: sparse: sparse: cast to restricted __le32<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1583:30: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [usert=
ype] usPixelClock @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertyp=
e] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1583:30: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [usertype] usPixelClock<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1583:30: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1826:25: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assig=
ned] [usertype] usH_Size @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [=
usertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1826:25: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [assigned] [usertype] usH_Size<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1826:25: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1828:34: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assig=
ned] [usertype] usH_Blanking_Time @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted=
 __le16 [usertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1828:34: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [assigned] [usertype] usH_Blanking_Time<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1828:34: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1831:25: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assig=
ned] [usertype] usV_Size @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [=
usertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1831:25: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [assigned] [usertype] usV_Size<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1831:25: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1833:34: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assig=
ned] [usertype] usV_Blanking_Time @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted=
 __le16 [usertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1833:34: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [assigned] [usertype] usV_Blanking_Time<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1833:34: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1838:31: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assig=
ned] [usertype] usH_SyncOffset @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __=
le16 [usertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1838:31: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [assigned] [usertype] usH_SyncOffset<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1838:31: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1840:30: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assig=
ned] [usertype] usH_SyncWidth @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1840:30: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [assigned] [usertype] usH_SyncWidth<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1840:30: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1844:31: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assig=
ned] [usertype] usV_SyncOffset @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __=
le16 [usertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1844:31: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [assigned] [usertype] usV_SyncOffset<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1844:31: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1846:30: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assig=
ned] [usertype] usV_SyncWidth @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1846:30: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [assigned] [usertype] usV_SyncWidth<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1846:30: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1855:33: sparse: sparse: cast to restricted __le16<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1854:49: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assig=
ned] [usertype] usAccess @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [=
usertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1854:49: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [assigned] [usertype] usAccess<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1854:49: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1859:33: sparse: sparse: cast to restricted __le16<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1858:49: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assig=
ned] [usertype] usAccess @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [=
usertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1858:49: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [assigned] [usertype] usAccess<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1858:49: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1863:33: sparse: sparse: cast to restricted __le16<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1862:49: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assig=
ned] [usertype] usAccess @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [=
usertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1862:49: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [assigned] [usertype] usAccess<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1862:49: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&gt;&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:=
1880:39: sparse: sparse: incorrect type in argument 1 (different base types=
) @@&nbsp;&nbsp;&nbsp;&nbsp; expected restricted __le16 [usertype] *var @@&=
nbsp;&nbsp;&nbsp;&nbsp; got unsigned short * @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1880:39: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected restricte=
d __le16 [usertype] *var<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1880:39: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got unsigned short=
 *<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1886:33: sparse: sparse: cast to restricted __le16<br>
&gt;&gt;&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:=
1885:49: sparse: sparse: incorrect type in assignment (different base types=
) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addressable] [assigne=
d] [usertype] usAccess @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [us=
ertype]
 @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1885:49: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [addressable] [assigned] [usertype] usAccess<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1885:49: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1752:26: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assig=
ned] [usertype] usH_Total @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 =
[usertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1752:26: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [assigned] [usertype] usH_Total<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1752:26: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1753:25: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assig=
ned] [usertype] usH_Disp @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [=
usertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1753:25: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [assigned] [usertype] usH_Disp<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1753:25: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1754:30: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assig=
ned] [usertype] usH_SyncStart @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1754:30: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [assigned] [usertype] usH_SyncStart<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1754:30: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1755:30: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assig=
ned] [usertype] usH_SyncWidth @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1755:30: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [assigned] [usertype] usH_SyncWidth<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1755:30: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1756:26: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assig=
ned] [usertype] usV_Total @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 =
[usertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1756:26: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [assigned] [usertype] usV_Total<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1756:26: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1757:25: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assig=
ned] [usertype] usV_Disp @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [=
usertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1757:25: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [assigned] [usertype] usV_Disp<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1757:25: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1758:30: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assig=
ned] [usertype] usV_SyncStart @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1758:30: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [assigned] [usertype] usV_SyncStart<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1758:30: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1760:30: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assig=
ned] [usertype] usV_SyncWidth @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1760:30: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [assigned] [usertype] usV_SyncWidth<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1760:30: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1776:33: sparse: sparse: cast to restricted __le16<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1775:49: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assig=
ned] [usertype] usAccess @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [=
usertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1775:49: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [assigned] [usertype] usAccess<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1775:49: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1780:33: sparse: sparse: cast to restricted __le16<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1779:49: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assig=
ned] [usertype] usAccess @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [=
usertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1779:49: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [assigned] [usertype] usAccess<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1779:49: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1784:33: sparse: sparse: cast to restricted __le16<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1783:49: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assig=
ned] [usertype] usAccess @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [=
usertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1783:49: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [assigned] [usertype] usAccess<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1783:49: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1799:38: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assig=
ned] [usertype] usV_SyncStart @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1799:38: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [assigned] [usertype] usV_SyncStart<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1799:38: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1805:33: sparse: sparse: cast to restricted __le16<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1804:49: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assig=
ned] [usertype] usAccess @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [=
usertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1804:49: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [assigned] [usertype] usAccess<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:1804:49: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:2047:40: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addre=
ssable] [assigned] [usertype] usPixelClock @@&nbsp;&nbsp;&nbsp;&nbsp; got r=
estricted __le16 [usertype]
 @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:2047:40: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [addressable] [assigned] [usertype] usPixelClock<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:2047:40: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:2079:44: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned int [address=
able] [assigned] [usertype] ulDispEngClkFreq @@&nbsp;&nbsp;&nbsp;&nbsp; got=
 restricted __le32 [usertype]
 @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:2079:44: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
int [addressable] [assigned] [usertype] ulDispEngClkFreq<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:2079:44: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e32 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:2092:44: sparse: sparse: cast to restricted __le32<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:2174:44: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [usert=
ype] usConnectorId @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [userty=
pe] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:2174:44: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [usertype] usConnectorId<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:2174:44: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:2183:43: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [usert=
ype] usPixelClock @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertyp=
e] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:2183:43: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [usertype] usPixelClock<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:2183:43: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:2207:43: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [usert=
ype] usPixelClock @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertyp=
e] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:2207:43: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [usertype] usPixelClock<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:2207:43: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:2340:45: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned int [address=
able] [assigned] [usertype] ulDCEClkFreq @@&nbsp;&nbsp;&nbsp;&nbsp; got res=
tricted __le32 [usertype]
 @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:2340:45: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
int [addressable] [assigned] [usertype] ulDCEClkFreq<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:2340:45: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e32 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table.c:2344:53: sparse: sparse: cast to restricted __le32<br>
&gt; --<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:413:34: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned int [address=
able] [assigned] [usertype] pixclk_100hz @@&nbsp;&nbsp;&nbsp;&nbsp; got res=
tricted __le32 [usertype]
 @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:413:34: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
int [addressable] [assigned] [usertype] pixclk_100hz<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:413:34: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e32 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:509:23: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assig=
ned] [usertype] h_size @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [us=
ertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:509:23: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [assigned] [usertype] h_size<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:509:23: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:511:32: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assig=
ned] [usertype] h_blanking_time @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted _=
_le16 [usertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:511:32: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [assigned] [usertype] h_blanking_time<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:511:32: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:515:23: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assig=
ned] [usertype] v_size @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [us=
ertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:515:23: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [assigned] [usertype] v_size<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:515:23: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:517:32: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assig=
ned] [usertype] v_blanking_time @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted _=
_le16 [usertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:517:32: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [assigned] [usertype] v_blanking_time<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:517:32: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:524:29: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assig=
ned] [usertype] h_syncoffset @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le=
16 [usertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:524:29: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [assigned] [usertype] h_syncoffset<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:524:29: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:527:28: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assig=
ned] [usertype] h_syncwidth @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le1=
6 [usertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:527:28: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [assigned] [usertype] h_syncwidth<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:527:28: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:532:29: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assig=
ned] [usertype] v_syncoffset @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le=
16 [usertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:532:29: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [assigned] [usertype] v_syncoffset<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:532:29: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:535:28: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assig=
ned] [usertype] v_syncwidth @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le1=
6 [usertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:535:28: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [assigned] [usertype] v_syncwidth<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:535:28: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:544:33: sparse: sparse: cast to restricted __le16<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:543:37: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assig=
ned] [usertype] modemiscinfo @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le=
16 [usertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:543:37: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [assigned] [usertype] modemiscinfo<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:543:37: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:549:33: sparse: sparse: cast to restricted __le16<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:548:37: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assig=
ned] [usertype] modemiscinfo @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le=
16 [usertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:548:37: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [assigned] [usertype] modemiscinfo<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:548:37: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:554:33: sparse: sparse: cast to restricted __le16<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:553:37: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assig=
ned] [usertype] modemiscinfo @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le=
16 [usertype] @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:553:37: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [assigned] [usertype] modemiscinfo<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:553:37: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&gt;&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c=
:572:39: sparse: sparse: incorrect type in argument 1 (different base types=
) @@&nbsp;&nbsp;&nbsp;&nbsp; expected restricted __le16 [usertype] *var @@&=
nbsp;&nbsp;&nbsp;&nbsp; got unsigned short * @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:572:39: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected restricte=
d __le16 [usertype] *var<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:572:39: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got unsigned short=
 *<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:578:25: sparse: sparse: cast to restricted __le16<br>
&gt;&gt;&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c=
:577:37: sparse: sparse: incorrect type in assignment (different base types=
) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addressable] [assigne=
d] [usertype] modemiscinfo @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16=
 [usertype]
 @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:577:37: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
short [addressable] [assigned] [usertype] modemiscinfo<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:577:37: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e16 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:851:43: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned int [address=
able] [assigned] [usertype] dceclk_10khz @@&nbsp;&nbsp;&nbsp;&nbsp; got res=
tricted __le32 [usertype]
 @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:851:43: sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned =
int [addressable] [assigned] [usertype] dceclk_10khz<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:851:43: sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __l=
e32 [usertype]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/=
command_table2.c:860:53: sparse: sparse: cast to restricted __le32<br>
&gt; <br>
&gt; vim +1880 drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.=
c<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp; 1812&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp; 1813&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static enum=
 bp_result set_crtc_using_dtd_timing_v3(<br>
&gt;&nbsp;&nbsp;&nbsp; 1814&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct bios_parser *bp,<br>
&gt;&nbsp;&nbsp;&nbsp; 1815&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct bp_hw_crtc_timing_parameters *b=
p_params)<br>
&gt;&nbsp;&nbsp;&nbsp; 1816&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp; 1817&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum bp_result result =3D BP_RESULT_FA=
ILURE;<br>
&gt;&nbsp;&nbsp;&nbsp; 1818&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SET_CRTC_USING_DTD_TIMING_PARAMETERS p=
arams =3D {0};<br>
&gt;&nbsp;&nbsp;&nbsp; 1819&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint8_t atom_controller_id;<br>
&gt;&nbsp;&nbsp;&nbsp; 1820&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp; 1821&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (bp-&gt;cmd_helper-&gt;controller_i=
d_to_atom(<br>
&gt;&nbsp;&nbsp;&nbsp; 1822&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bp_params-&gt;con=
troller_id, &amp;atom_controller_id))<br>
&gt;&nbsp;&nbsp;&nbsp; 1823&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; params.ucCRTC =3D atom_controller_id;<br>
&gt;&nbsp;&nbsp;&nbsp; 1824&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp; 1825&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* bios usH_Size wants h addressable s=
ize */<br>
&gt;&nbsp;&nbsp;&nbsp; 1826&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; params.usH_Size =3D cpu_to_le16((uint1=
6_t)bp_params-&gt;h_addressable);<br>
&gt;&nbsp;&nbsp;&nbsp; 1827&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* bios usH_Blanking_Time wants border=
s included in blanking */<br>
&gt;&nbsp;&nbsp;&nbsp; 1828&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; params.usH_Blanking_Time =3D<br>
&gt;&nbsp;&nbsp;&nbsp; 1829&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cpu_to_le16((uint=
16_t)(bp_params-&gt;h_total - bp_params-&gt;h_addressable));<br>
&gt;&nbsp;&nbsp;&nbsp; 1830&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* bios usV_Size wants v addressable s=
ize */<br>
&gt;&nbsp;&nbsp;&nbsp; 1831&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; params.usV_Size =3D cpu_to_le16((uint1=
6_t)bp_params-&gt;v_addressable);<br>
&gt;&nbsp;&nbsp;&nbsp; 1832&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* bios usV_Blanking_Time wants border=
s included in blanking */<br>
&gt;&nbsp;&nbsp;&nbsp; 1833&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; params.usV_Blanking_Time =3D<br>
&gt;&nbsp;&nbsp;&nbsp; 1834&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cpu_to_le16((uint=
16_t)(bp_params-&gt;v_total - bp_params-&gt;v_addressable));<br>
&gt;&nbsp;&nbsp;&nbsp; 1835&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* bios usHSyncOffset is the offset fr=
om the end of h addressable,<br>
&gt;&nbsp;&nbsp;&nbsp; 1836&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * our horizontalSyncStart is the=
 offset from the beginning<br>
&gt;&nbsp;&nbsp;&nbsp; 1837&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * of h addressable */<br>
&gt;&nbsp;&nbsp;&nbsp; 1838&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; params.usH_SyncOffset =3D<br>
&gt;&nbsp;&nbsp;&nbsp; 1839&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cpu_to_le16((uint=
16_t)(bp_params-&gt;h_sync_start - bp_params-&gt;h_addressable));<br>
&gt;&nbsp;&nbsp;&nbsp; 1840&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; params.usH_SyncWidth =3D cpu_to_le16((=
uint16_t)bp_params-&gt;h_sync_width);<br>
&gt;&nbsp;&nbsp;&nbsp; 1841&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* bios usHSyncOffset is the offset fr=
om the end of v addressable,<br>
&gt;&nbsp;&nbsp;&nbsp; 1842&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * our verticalSyncStart is the o=
ffset from the beginning of<br>
&gt;&nbsp;&nbsp;&nbsp; 1843&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * v addressable */<br>
&gt;&nbsp;&nbsp;&nbsp; 1844&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; params.usV_SyncOffset =3D<br>
&gt;&nbsp;&nbsp;&nbsp; 1845&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cpu_to_le16((uint=
16_t)(bp_params-&gt;v_sync_start - bp_params-&gt;v_addressable));<br>
&gt;&nbsp;&nbsp;&nbsp; 1846&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; params.usV_SyncWidth =3D cpu_to_le16((=
uint16_t)bp_params-&gt;v_sync_width);<br>
&gt;&nbsp;&nbsp;&nbsp; 1847&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp; 1848&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* we assume that overscan from origin=
al timing does not get bigger<br>
&gt;&nbsp;&nbsp;&nbsp; 1849&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * than 255<br>
&gt;&nbsp;&nbsp;&nbsp; 1850&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * we will program all the border=
s in the Set CRTC Overscan call below<br>
&gt;&nbsp;&nbsp;&nbsp; 1851&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt;&nbsp;&nbsp;&nbsp; 1852&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp; 1853&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (0 =3D=3D bp_params-&gt;flags.HSYNC=
_POSITIVE_POLARITY)<br>
&gt;&nbsp;&nbsp;&nbsp; 1854&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; params.susModeMiscInfo.usAccess =3D<br>
&gt;&nbsp;&nbsp;&nbsp; 1855&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cpu_to_le16(le16_to_cpu(params.susModeMiscIn=
fo.usAccess) | ATOM_HSYNC_POLARITY);<br>
&gt;&nbsp;&nbsp;&nbsp; 1856&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp; 1857&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (0 =3D=3D bp_params-&gt;flags.VSYNC=
_POSITIVE_POLARITY)<br>
&gt;&nbsp;&nbsp;&nbsp; 1858&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; params.susModeMiscInfo.usAccess =3D<br>
&gt;&nbsp;&nbsp;&nbsp; 1859&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cpu_to_le16(le16_to_cpu(params.susModeMiscIn=
fo.usAccess) | ATOM_VSYNC_POLARITY);<br>
&gt;&nbsp;&nbsp;&nbsp; 1860&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp; 1861&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (bp_params-&gt;flags.INTERLACE) {<b=
r>
&gt;&nbsp;&nbsp;&nbsp; 1862&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; params.susModeMiscInfo.usAccess =3D<br>
&gt;&nbsp;&nbsp;&nbsp; 1863&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cpu_to_le16(le16_to_cpu(params.susModeMiscIn=
fo.usAccess) | ATOM_INTERLACE);<br>
&gt;&nbsp;&nbsp;&nbsp; 1864&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp; 1865&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; /* original DAL code has this condition to apply this<br>
&gt;&nbsp;&nbsp;&nbsp; 1866&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; * for non-TV/CV only<br>
&gt;&nbsp;&nbsp;&nbsp; 1867&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; * due to complex MV testing for possible impact<br>
&gt;&nbsp;&nbsp;&nbsp; 1868&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; * if ( pACParameters-&gt;signal !=3D SignalType_YPbPr &amp;=
&amp;<br>
&gt;&nbsp;&nbsp;&nbsp; 1869&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; *&nbsp; pACParameters-&gt;signal !=3D SignalType_Composite =
&amp;&amp;<br>
&gt;&nbsp;&nbsp;&nbsp; 1870&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; *&nbsp; pACParameters-&gt;signal !=3D SignalType_SVideo)<br=
>
&gt;&nbsp;&nbsp;&nbsp; 1871&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; */<br>
&gt;&nbsp;&nbsp;&nbsp; 1872&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp; 1873&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* HW will deduct=
 0.5 line from 2nd feild.<br>
&gt;&nbsp;&nbsp;&nbsp; 1874&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * i.e. for =
1080i, it is 2 lines for 1st field,<br>
&gt;&nbsp;&nbsp;&nbsp; 1875&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * 2.5 lines=
 for the 2nd feild. we need input as 5<br>
&gt;&nbsp;&nbsp;&nbsp; 1876&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * instead o=
f 4.<br>
&gt;&nbsp;&nbsp;&nbsp; 1877&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * but it is=
 4 either from Edid data (spec CEA 861)<br>
&gt;&nbsp;&nbsp;&nbsp; 1878&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * or CEA ti=
ming table.<br>
&gt;&nbsp;&nbsp;&nbsp; 1879&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt;&gt; 1880&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; le16_add_cpu(&amp;params.usV_SyncOffset, 1);<br>
&gt;&nbsp;&nbsp;&nbsp; 1881&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp; 1882&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp; 1883&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp; 1884&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (bp_params-&gt;flags.HORZ_COUNT_BY_=
TWO)<br>
&gt;&gt; 1885&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; params.susModeMiscInfo.usAccess =3D<br>
&gt;&nbsp;&nbsp;&nbsp; 1886&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cpu_to_le16(le16_to_cpu(params.susModeMiscIn=
fo.usAccess) | ATOM_DOUBLE_CLOCK_MODE);<br>
&gt;&nbsp;&nbsp;&nbsp; 1887&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp; 1888&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (EXEC_BIOS_CMD_TABLE(SetCRTC_UsingD=
TDTiming, params))<br>
&gt;&nbsp;&nbsp;&nbsp; 1889&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; result =3D BP_RESULT_OK;<br>
&gt;&nbsp;&nbsp;&nbsp; 1890&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp; 1891&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return result;<br>
&gt;&nbsp;&nbsp;&nbsp; 1892&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp; 1893&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt; <br>
&gt; ---<br>
&gt; 0-DAY CI Kernel Test Service, Intel Corporation<br>
&gt; <a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Flists.01.org%2Fhyperkitty%2Flist%2Fkbuild-all%40lists.01.org&amp;a=
mp;data=3D04%7C01%7Calexander.deucher%40amd.com%7Cc9a5d9273f464451b1f808d8a=
0d271fe%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637436173010754583%7CU=
nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC=
JXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DYyHY6sZPmHM14xXSHmp9tcYJpzeO842YlCqX1XI=
SOkw%3D&amp;amp;reserved=3D0">
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.0=
1.org%2Fhyperkitty%2Flist%2Fkbuild-all%40lists.01.org&amp;amp;data=3D04%7C0=
1%7Calexander.deucher%40amd.com%7Cc9a5d9273f464451b1f808d8a0d271fe%7C3dd896=
1fe4884e608e11a82d994e183d%7C0%7C0%7C637436173010754583%7CUnknown%7CTWFpbGZ=
sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1=
000&amp;amp;sdata=3DYyHY6sZPmHM14xXSHmp9tcYJpzeO842YlCqX1XISOkw%3D&amp;amp;=
reserved=3D0</a><br>
&gt; <br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_MN2PR12MB4488CBBF7050A105FD6F7BF4F7C60MN2PR12MB4488namp_--

--===============0149081893==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0149081893==--
