Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6BB2DC3ED
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 17:21:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B23389D53;
	Wed, 16 Dec 2020 16:21:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2087.outbound.protection.outlook.com [40.107.243.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2713B89D4B
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 16:21:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Su0mB/GuAhC2/D8qDerONrhQJIY/gvE2kkp+7FSGxnZjcgGnkD5o5P8plGE4mWgEx9ceDQmVwqf94MxUwn3iaPd3PMEs0ZZ7WzP+dxDLGzYJRb6q2evkXAM+cioFHfafPFCIwk5ib5ukzT59vctNhndRh3bIxyhea0HYMFFjok4EXFyM8eOdwevjMXItSijo810124NxoC1ciX6os3BZvrTSJcr61q1cMXLY5izkJhr+4KitOUzShOsMBVkK8Mg5wNeuGdUa0alHi+wE3ilg/yXFcSZ3m8Vdp1dfoVpq/RywcZrlPB0qAoPh0AkP3LCfQs6w9Hi+70ReCflKmsKqfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBzLTNaDtrbuHOEvY4k3nPOncruXze1Q8ywZ0GAoMyY=;
 b=A7A8OLeHdJlHUAHaJDmhNWvuOKSmt0TkGl3DyAi9RlIVX/yM2TkIbGthyWOCR/1P8srvkZ8lWYKUA81gZ6XI2oDWN/YrTENRNl9af1pZqmEZe7+CYbMA+qH1nNRZ3QJS136Mjne9mGCdM0DtQEpK0ibw6js/NbLTUFtaY0lWX7doJkIiXBCMgTdQSPYeDMkwMOWErcjiyL96bnS7lae5pfMfIIP1oJiFf2knk2RIxdZABfD7pmm4xEwN9hKTeKYNqqWlM4kMGiz4+IxvOhnRAyui313Qn7xgJI6QrOdjEVo9olnMoVhtYYdENrGFl1bO0/hL3TEy6+LxxGbLrMK1Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBzLTNaDtrbuHOEvY4k3nPOncruXze1Q8ywZ0GAoMyY=;
 b=OFQM0gghhMAtpkiZCpMDkxxqEk3IXzJ8znXYtpWXdcUroc6xouzxiFYYxGF1OnO6xCZ5o8+8XoAOHcZ4dY2t2OG9aLMqoRr0+HYZyDkmj0toMf/5KTOE5gKw+1Vtim5mh4vJADjEQutxHWSkjM0rlH8m1JAVRz2L/NC2Pk10feY=
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by BL0PR12MB2403.namprd12.prod.outlook.com (2603:10b6:207:40::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.20; Wed, 16 Dec
 2020 16:20:58 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::fca3:155c:bf43:94af]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::fca3:155c:bf43:94af%4]) with mapi id 15.20.3654.024; Wed, 16 Dec 2020
 16:20:58 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Rong Chen <rong.a.chen@intel.com>, Qinglang Miao
 <miaoqinglang@huawei.com>, kernel test robot <lkp@intel.com>
Subject: Re: [kbuild-all] Re: [radeon-alex:amd-20.45 2127/2427]
 drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1880:39:
 sparse: sparse: incorrect type in argument 1 (different base types)
Thread-Topic: [kbuild-all] Re: [radeon-alex:amd-20.45 2127/2427]
 drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1880:39:
 sparse: sparse: incorrect type in argument 1 (different base types)
Thread-Index: AQHW0q5+fKCSU4ueR0WpsaoBe8LwF6n30TUAgABlGkiAATTTgIAAff3m
Date: Wed, 16 Dec 2020 16:20:58 +0000
Message-ID: <MN2PR12MB44882A2C124F33072EB9F179F7C50@MN2PR12MB4488.namprd12.prod.outlook.com>
References: <202012151443.Z9Fd7yNQ-lkp@intel.com>
 <4eb73b60-2290-f3e2-d088-9361f8d8c7f3@huawei.com>
 <MN2PR12MB4488CBBF7050A105FD6F7BF4F7C60@MN2PR12MB4488.namprd12.prod.outlook.com>,
 <2e8a4f96-441f-2204-3deb-f2cbe67dbda9@intel.com>
In-Reply-To: <2e8a4f96-441f-2204-3deb-f2cbe67dbda9@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-12-16T16:20:57.691Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Distribution
 Only; MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard; 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [71.219.66.138]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 87651090-a410-4a5e-07c4-08d8a1de9274
x-ms-traffictypediagnostic: BL0PR12MB2403:
x-microsoft-antispam-prvs: <BL0PR12MB2403EF9050C9C55A834486BCF7C50@BL0PR12MB2403.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:95;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zH7IjwpkXpI8OzTShhJP5/jaXKsSfgkfcUFuitqTbiHqC/Ye2EYQx7lDonJM9+9N1F7S/cZFiwqzsZnYjntzQuJzII5nPnnfqocKSde7LzpWMIU2QWyPGByjgAwp2/0PaAe7KMAx9RCKpwTTHRtr+AuSSjEvN/PNOzZrjK/URBYLGcBCaLMLlDICJzWpG1aU85W7hju99YqJ05jDUuo4DQeChN0W108AmKl88zIa7S5huftN2xnqSvF1lpC4xeFf2zTw5nynTTuT27vK5n4zZbnrBf3Jl7kzg/4AKJExY2OdBFCF4ZtZ8o/lG9vxeLxKXvf4eZ2XJuY2fnWQAuRcZW92DFz4jYU7FTzsXRz4g8Vu7fSlQpajQQzNtuHqDEgLm5/SMThv1Vpo2Yfq5o6pxQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(6506007)(45080400002)(7696005)(66556008)(52536014)(71200400001)(19627405001)(33656002)(186003)(83380400001)(8676002)(166002)(53546011)(26005)(9686003)(8936002)(110136005)(54906003)(55016002)(316002)(66476007)(966005)(4326008)(76116006)(478600001)(66946007)(66446008)(86362001)(64756008)(30864003)(5660300002)(2906002)(579004)(559001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-2022-jp?B?ZEIrbVg3NC9yaE1UbWFSY3N4YWR4RnBrOEJxbkJ5N3U1N21WallqNUg2?=
 =?iso-2022-jp?B?MHZrT3ovekxhWnVPSkJCRFZGOVl5RXpWNThiN08yRnBSZTdRRG1lTFdN?=
 =?iso-2022-jp?B?dVRxYWFVMC9LTnlmWklxUGVQSnQ3dmV6ZzNrbjNDRkdQMnplY3JKMXBX?=
 =?iso-2022-jp?B?S0ZicDhSbTNGa3ZMSnliU3F2cXp1amxYMkRlVDNScE1CTGpCSi9yajlZ?=
 =?iso-2022-jp?B?d3hESWhXaU9kbGY3VDRDdVlnUzlvTWxmejljUm1GbUZzS0w4TEtYdTcx?=
 =?iso-2022-jp?B?V0U4UUZGME5sbHBPbjRNRVpJSlQyTjFNeFJqM3ZyUnlFcVdWVDkzTzA2?=
 =?iso-2022-jp?B?NE1Ea2xwTnI2a2FEV0FGOGRXTS9MUlRxc1BkSW1iajBxcjBUamxkWE9Z?=
 =?iso-2022-jp?B?aGpiTVNkcW1UcDZCWVczdlBJemxRSGlSN0trVUFMVW5KV1l5bi9JeWVR?=
 =?iso-2022-jp?B?UjJKUVpQNTRaeDNkdjZHR3owcGNVSG1KVmlOS1F6VnJpQ1Z3NTNvaEht?=
 =?iso-2022-jp?B?WHBQUlZZZUNyeHE1Y2RIOXIwMTQyWWg2djVLZU5rUG1DemhJaGlaV1I5?=
 =?iso-2022-jp?B?SUc1SEpXMWNwMEFxV0JlMmJyOXZ0M1hWMm94TkhpQTgybnhMZVZNdGk3?=
 =?iso-2022-jp?B?RHZ5c2JmTmxSdTR5NUpVMi92ZzZDTExYQXJ3STBlQlVrMnBveWpUd3gy?=
 =?iso-2022-jp?B?QnEwZHdwZEdOOWt6NjRpRHZTRnpEQjBvVWJkVzdWK0ZQdkFyRkgzdEtx?=
 =?iso-2022-jp?B?bitHMGt5aVd6SUVxVWNOaEdFN2V2NUFKYmsvWGVkK3FRTUJya0VPcTNK?=
 =?iso-2022-jp?B?MjlaaXI5Ykg2NUNyVWU2UEtJaVQwcUp5VmNmVFptZmpKNHY0aHh3OXRT?=
 =?iso-2022-jp?B?Uzk3VGtWRnBuNHcvVU9FYi9WTGVlQ0w2cFFJVk5sMlc2VVdZazhHdnJp?=
 =?iso-2022-jp?B?NS9DTzI4d3NLSWJDR2tsOUNrbjZTMGNKTm5iTDA0Rmt5S3FaRDVMQWNE?=
 =?iso-2022-jp?B?bk5sb3FDclpvQklKSWVvTmp5L2RmNE1oVW44SmlwZmVJSXlWVkVOUXg5?=
 =?iso-2022-jp?B?TjV5cXYvVXd5NktyVnovSGdOOUZTSTVCcUdKRy9NanRuaDB5N2x2aW1u?=
 =?iso-2022-jp?B?djNLRlZuaEhpZHdZdDJMaUlwRnc3clgzVEpiWXY3SzRDd1gyUHJ5UlA3?=
 =?iso-2022-jp?B?SUFlYlo0aTRoNVFXaStUZ0R2Smp1VUxibm13cHB3YTUybTZ0OTBWSGxa?=
 =?iso-2022-jp?B?TVlsQmdPT2V5SzFscWhISkFTRCtWMFM5cVY2Tk5mc3dDU3ZmYVhHREda?=
 =?iso-2022-jp?B?bnp4bzJ2RUtQNm9ZSldxZDVDUjFDdkZTMGVjVEdIWVRKT3NnRWlBUlRj?=
 =?iso-2022-jp?B?NFlGN0hUTDhSWHA5d0tBZ0lRN05vWDZWMmd1am0wcUU4R09JYz0=?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87651090-a410-4a5e-07c4-08d8a1de9274
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2020 16:20:58.3042 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LC932r2C7IhOLBBVCm+7KdfLBPAbMdC54FKr1bn32vjZNweAYa+n1hKeUOc3XyIiQ2NkzEoDIiFLksEfZEj1dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2403
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
Cc: Felix <"Xiong, "@ml01.01.org>,
 "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0859490103=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0859490103==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB44882A2C124F33072EB9F179F7C50MN2PR12MB4488namp_"

--_000_MN2PR12MB44882A2C124F33072EB9F179F7C50MN2PR12MB4488namp_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - Internal Distribution Only]

You can add amd-21.xx as well, since they will coming up next year.  Maybe =
amd-2*?

Alex

________________________________
From: Rong Chen <rong.a.chen@intel.com>
Sent: Wednesday, December 16, 2020 3:48 AM
To: Deucher, Alexander <Alexander.Deucher@amd.com>; Qinglang Miao <miaoqing=
lang@huawei.com>; kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org <kbuild-all@lists.01.org>; dri-devel@lists.free=
desktop.org <dri-devel@lists.freedesktop.org>; Felix <"Xiong, "@ml01.01.org=
>
Subject: Re: [kbuild-all] Re: [radeon-alex:amd-20.45 2127/2427] drivers/gpu=
/drm/amd/amdgpu/../display/dc/bios/command_table.c:1880:39: sparse: sparse:=
 incorrect type in argument 1 (different base types)

Hi Alex,

We have ignored the amd-20.xx branches:
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2Fintel%2Flkp-tests%2Fcommit%2Facb8d1f213ec6841900e0d7e9737f8ea0960e4d3=
&amp;data=3D04%7C01%7CAlexander.Deucher%40amd.com%7C2f283fc47a6641db05cd08d=
8a19f7d80%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637437053682479635%7=
CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwi=
LCJXVCI6Mn0%3D%7C1000&amp;sdata=3DU2aA%2B31wbSToDkIHiUrJWriNOPNNJ162W3F1HjY=
G6mc%3D&amp;reserved=3D0

Best Regards,
Rong Chen

On 12/15/20 10:24 PM, Deucher, Alexander wrote:
>
> [AMD Public Use]
>
>
> The test robot should probably not be testing the amd-20.xx branches
> in the first place.  They are just mirrors of our packaged drivers so
> they contain a bunch of stuff that will never go upstream like kernel
> compatibility layers and dkms support.
>
> Alex
>
> ------------------------------------------------------------------------
> *From:* Qinglang Miao <miaoqinglang@huawei.com>
> *Sent:* Tuesday, December 15, 2020 3:21 AM
> *To:* kernel test robot <lkp@intel.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>
> *Cc:* kbuild-all@lists.01.org <kbuild-all@lists.01.org>;
> dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>;
> Xiong, Yang (Felix) <Yang.Xiong@amd.com>
> *Subject:* Re: [radeon-alex:amd-20.45 2127/2427]
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1880:39:
> sparse: sparse: incorrect type in argument 1 (different base types)
> Hi Alex,
>
> I think it's not a valid report from kernel test robot, for __le16 ought
> to be the right type for cpu_to_le16. The sparse warnings seems not
> right so I did't try effort to reproduce it.
>
> otherwise, when I take a carful look at this patch, an unconditional
> braces exists and I'm not sure about its benefit.
>
> if (bp_params->flags.INTERLACE) {
>                 params.susModeMiscInfo.usAccess =3D
> cpu_to_le16(le16_to_cpu(params.susModeMiscInfo.usAccess) |
> ATOM_INTERLACE);
>                 {
> le16_add_cpu(&params.usV_SyncOffset, 1);
>                 }
> }
>
> patch link:
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.=
kernel.org%2Flkml%2FCADnq5_PunHA1VHHj7VtEHG6o2Z_Z1WS325y_R9xO%2BgsV_JCOXw%4=
0mail.gmail.com%2F&amp;data=3D04%7C01%7CAlexander.Deucher%40amd.com%7C2f283=
fc47a6641db05cd08d8a19f7d80%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63=
7437053682489591%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMz=
IiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DloDpCZcwzSthBMwesVesMIE=
wtgf%2BGZoycOyTwBpqkfI%3D&amp;reserved=3D0
>
> How do you think?
>
> =1B$B:_=1B(B 2020/12/15 14:44, kernel test robot =1B$B<LF;=1B(B:
> > tree: git://people.freedesktop.org/~agd5f/linux.git amd-20.45
> > head:   a3950d94b046fb206e58fd3ec717f071c0203ba3
> > commit: c82b6c9ed412fb7009b02dd82e50ee24f451e9a8 [2127/2427]
> drm/amd/display: convert to use le16_add_cpu()
> > config: arc-randconfig-s031-20201214 (attached as .config)
> > compiler: arc-elf-gcc (GCC) 9.3.0
> > reproduce:
> >          wget
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fraw.g=
ithubusercontent.com%2Fintel%2Flkp-tests%2Fmaster%2Fsbin%2Fmake.cross&amp;d=
ata=3D04%7C01%7CAlexander.Deucher%40amd.com%7C2f283fc47a6641db05cd08d8a19f7=
d80%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637437053682489591%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;sdata=3Da6yKdL%2BoYm1zc5fYftUrWwmas%2BOfrTjqpivV14xci1Y=
%3D&amp;reserved=3D0
> -O ~/bin/make.cross
> >          chmod +x ~/bin/make.cross
> >          # apt-get install sparse
> >          # sparse version: v0.6.3-184-g1b896707-dirty
> >          git remote add radeon-alex
> git://people.freedesktop.org/~agd5f/linux.git
> >          git fetch --no-tags radeon-alex amd-20.45
> >          git checkout c82b6c9ed412fb7009b02dd82e50ee24f451e9a8
> >          # save the attached .config to linux build tree
> >          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0
> make.cross C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Darc
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> >
> > "sparse warnings: (new ones prefixed by >>)"
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:879:43:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned int [addressable] [assigned] [usertype]
> ulSymClock @@     got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:879:43:
> sparse:     expected unsigned int [addressable] [assigned] [usertype]
> ulSymClock
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:879:43:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:956:40:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [addressable] [assigned] [usertype]
> usRefDiv @@     got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:956:40:
> sparse:     expected unsigned short [addressable] [assigned]
> [usertype] usRefDiv
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:956:40:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:958:39:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [addressable] [assigned] [usertype]
> usFbDiv @@     got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:958:39:
> sparse:     expected unsigned short [addressable] [assigned]
> [usertype] usFbDiv
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:958:39:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:966:44:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [addressable] [assigned] [usertype]
> usPixelClock @@     got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:966:44:
> sparse:     expected unsigned short [addressable] [assigned]
> [usertype] usPixelClock
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:966:44:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1029:40:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [addressable] [assigned] [usertype]
> usFbDiv @@     got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1029:40:
> sparse:     expected unsigned short [addressable] [assigned]
> [usertype] usFbDiv
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1029:40:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1031:47:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned int [addressable] [assigned] [usertype]
> ulFbDivDecFrac @@     got restricted __le32 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1031:47:
> sparse:     expected unsigned int [addressable] [assigned] [usertype]
> ulFbDivDecFrac
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1031:47:
> sparse:     got restricted __le32 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1044:45:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [addressable] [assigned] [usertype]
> usPixelClock @@     got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1044:45:
> sparse:     expected unsigned short [addressable] [assigned]
> [usertype] usPixelClock
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1044:45:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1105:40:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [addressable] [assigned] [usertype]
> usFbDiv @@     got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1105:40:
> sparse:     expected unsigned short [addressable] [assigned]
> [usertype] usFbDiv
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1105:40:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1107:47:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned int [addressable] [assigned] [usertype]
> ulFbDivDecFrac @@     got restricted __le32 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1107:47:
> sparse:     expected unsigned int [addressable] [assigned] [usertype]
> ulFbDivDecFrac
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1107:47:
> sparse:     got restricted __le32 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1120:60:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned int [addressable] [assigned] [usertype]
> ulPixelClock:24 @@     got restricted __le32 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1120:60:
> sparse:     expected unsigned int [addressable] [assigned] [usertype]
> ulPixelClock:24
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1120:60:
> sparse:     got restricted __le32 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1183:34:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned int [addressable] [assigned] [usertype]
> ulPixelClock @@     got restricted __le32 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1183:34:
> sparse:     expected unsigned int [addressable] [assigned] [usertype]
> ulPixelClock
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1183:34:
> sparse:     got restricted __le32 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1272:43:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [addressable] [assigned] [usertype]
> usSpreadSpectrumPercentage @@ got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1272:43:
> sparse:     expected unsigned short [addressable] [assigned]
> [usertype] usSpreadSpectrumPercentage
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1272:43:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1321:51:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [addressable] [assigned] [usertype]
> usSpreadSpectrumPercentage @@ got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1321:51:
> sparse:     expected unsigned short [addressable] [assigned]
> [usertype] usSpreadSpectrumPercentage
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1321:51:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1323:45:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [addressable] [assigned] [usertype]
> usSpreadSpectrumStep @@     got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1323:45:
> sparse:     expected unsigned short [addressable] [assigned]
> [usertype] usSpreadSpectrumStep
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1323:45:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1337:47:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [addressable] [assigned] [usertype]
> usSpreadSpectrumAmount @@     got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1337:47:
> sparse:     expected unsigned short [addressable] [assigned]
> [usertype] usSpreadSpectrumAmount
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1337:47:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1391:51:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [addressable] [assigned] [usertype]
> usSpreadSpectrumAmountFrac @@ got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1391:51:
> sparse:     expected unsigned short [addressable] [assigned]
> [usertype] usSpreadSpectrumAmountFrac
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1391:51:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1393:45:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [addressable] [assigned] [usertype]
> usSpreadSpectrumStep @@     got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1393:45:
> sparse:     expected unsigned short [addressable] [assigned]
> [usertype] usSpreadSpectrumStep
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1393:45:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1406:47:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [addressable] [assigned] [usertype]
> usSpreadSpectrumAmount @@     got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1406:47:
> sparse:     expected unsigned short [addressable] [assigned]
> [usertype] usSpreadSpectrumAmount
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1406:47:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1465:29:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [usertype] usPixelClock @@     got
> restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1465:29:
> sparse:     expected unsigned short [usertype] usPixelClock
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1465:29:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1488:36:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [addressable] [usertype] usPixelClock
> @@     got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1488:36:
> sparse:     expected unsigned short [addressable] [usertype] usPixelClock
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1488:36:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1508:43:
> sparse: sparse: cast to restricted __le32
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1583:30:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [usertype] usPixelClock @@     got
> restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1583:30:
> sparse:     expected unsigned short [usertype] usPixelClock
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1583:30:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1826:25:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [assigned] [usertype] usH_Size @@
> got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1826:25:
> sparse:     expected unsigned short [assigned] [usertype] usH_Size
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1826:25:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1828:34:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [assigned] [usertype] usH_Blanking_Time
> @@     got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1828:34:
> sparse:     expected unsigned short [assigned] [usertype]
> usH_Blanking_Time
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1828:34:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1831:25:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [assigned] [usertype] usV_Size @@
> got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1831:25:
> sparse:     expected unsigned short [assigned] [usertype] usV_Size
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1831:25:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1833:34:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [assigned] [usertype] usV_Blanking_Time
> @@     got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1833:34:
> sparse:     expected unsigned short [assigned] [usertype]
> usV_Blanking_Time
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1833:34:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1838:31:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [assigned] [usertype] usH_SyncOffset
> @@     got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1838:31:
> sparse:     expected unsigned short [assigned] [usertype] usH_SyncOffset
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1838:31:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1840:30:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [assigned] [usertype] usH_SyncWidth
> @@     got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1840:30:
> sparse:     expected unsigned short [assigned] [usertype] usH_SyncWidth
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1840:30:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1844:31:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [assigned] [usertype] usV_SyncOffset
> @@     got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1844:31:
> sparse:     expected unsigned short [assigned] [usertype] usV_SyncOffset
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1844:31:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1846:30:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [assigned] [usertype] usV_SyncWidth
> @@     got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1846:30:
> sparse:     expected unsigned short [assigned] [usertype] usV_SyncWidth
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1846:30:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1855:33:
> sparse: sparse: cast to restricted __le16
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1854:49:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [assigned] [usertype] usAccess @@
> got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1854:49:
> sparse:     expected unsigned short [assigned] [usertype] usAccess
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1854:49:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1859:33:
> sparse: sparse: cast to restricted __le16
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1858:49:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [assigned] [usertype] usAccess @@
> got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1858:49:
> sparse:     expected unsigned short [assigned] [usertype] usAccess
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1858:49:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1863:33:
> sparse: sparse: cast to restricted __le16
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1862:49:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [assigned] [usertype] usAccess @@
> got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1862:49:
> sparse:     expected unsigned short [assigned] [usertype] usAccess
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1862:49:
> sparse:     got restricted __le16 [usertype]
> >>>
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1880:39:
> sparse: sparse: incorrect type in argument 1 (different base types)
> @@     expected restricted __le16 [usertype] *var @@     got unsigned
> short * @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1880:39:
> sparse:     expected restricted __le16 [usertype] *var
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1880:39:
> sparse:     got unsigned short *
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1886:33:
> sparse: sparse: cast to restricted __le16
> >>>
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1885:49:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [addressable] [assigned] [usertype]
> usAccess @@     got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1885:49:
> sparse:     expected unsigned short [addressable] [assigned]
> [usertype] usAccess
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1885:49:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1752:26:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [assigned] [usertype] usH_Total @@
> got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1752:26:
> sparse:     expected unsigned short [assigned] [usertype] usH_Total
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1752:26:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1753:25:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [assigned] [usertype] usH_Disp @@
> got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1753:25:
> sparse:     expected unsigned short [assigned] [usertype] usH_Disp
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1753:25:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1754:30:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [assigned] [usertype] usH_SyncStart
> @@     got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1754:30:
> sparse:     expected unsigned short [assigned] [usertype] usH_SyncStart
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1754:30:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1755:30:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [assigned] [usertype] usH_SyncWidth
> @@     got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1755:30:
> sparse:     expected unsigned short [assigned] [usertype] usH_SyncWidth
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1755:30:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1756:26:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [assigned] [usertype] usV_Total @@
> got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1756:26:
> sparse:     expected unsigned short [assigned] [usertype] usV_Total
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1756:26:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1757:25:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [assigned] [usertype] usV_Disp @@
> got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1757:25:
> sparse:     expected unsigned short [assigned] [usertype] usV_Disp
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1757:25:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1758:30:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [assigned] [usertype] usV_SyncStart
> @@     got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1758:30:
> sparse:     expected unsigned short [assigned] [usertype] usV_SyncStart
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1758:30:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1760:30:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [assigned] [usertype] usV_SyncWidth
> @@     got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1760:30:
> sparse:     expected unsigned short [assigned] [usertype] usV_SyncWidth
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1760:30:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1776:33:
> sparse: sparse: cast to restricted __le16
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1775:49:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [assigned] [usertype] usAccess @@
> got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1775:49:
> sparse:     expected unsigned short [assigned] [usertype] usAccess
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1775:49:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1780:33:
> sparse: sparse: cast to restricted __le16
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1779:49:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [assigned] [usertype] usAccess @@
> got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1779:49:
> sparse:     expected unsigned short [assigned] [usertype] usAccess
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1779:49:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1784:33:
> sparse: sparse: cast to restricted __le16
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1783:49:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [assigned] [usertype] usAccess @@
> got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1783:49:
> sparse:     expected unsigned short [assigned] [usertype] usAccess
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1783:49:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1799:38:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [assigned] [usertype] usV_SyncStart
> @@     got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1799:38:
> sparse:     expected unsigned short [assigned] [usertype] usV_SyncStart
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1799:38:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1805:33:
> sparse: sparse: cast to restricted __le16
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1804:49:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [assigned] [usertype] usAccess @@
> got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1804:49:
> sparse:     expected unsigned short [assigned] [usertype] usAccess
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1804:49:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2047:40:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [addressable] [assigned] [usertype]
> usPixelClock @@     got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2047:40:
> sparse:     expected unsigned short [addressable] [assigned]
> [usertype] usPixelClock
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2047:40:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2079:44:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned int [addressable] [assigned] [usertype]
> ulDispEngClkFreq @@     got restricted __le32 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2079:44:
> sparse:     expected unsigned int [addressable] [assigned] [usertype]
> ulDispEngClkFreq
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2079:44:
> sparse:     got restricted __le32 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2092:44:
> sparse: sparse: cast to restricted __le32
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2174:44:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [usertype] usConnectorId @@     got
> restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2174:44:
> sparse:     expected unsigned short [usertype] usConnectorId
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2174:44:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2183:43:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [usertype] usPixelClock @@     got
> restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2183:43:
> sparse:     expected unsigned short [usertype] usPixelClock
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2183:43:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2207:43:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [usertype] usPixelClock @@     got
> restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2207:43:
> sparse:     expected unsigned short [usertype] usPixelClock
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2207:43:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2340:45:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned int [addressable] [assigned] [usertype]
> ulDCEClkFreq @@     got restricted __le32 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2340:45:
> sparse:     expected unsigned int [addressable] [assigned] [usertype]
> ulDCEClkFreq
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2340:45:
> sparse:     got restricted __le32 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2344:53:
> sparse: sparse: cast to restricted __le32
> > --
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:413:34:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned int [addressable] [assigned] [usertype]
> pixclk_100hz @@     got restricted __le32 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:413:34:
> sparse:     expected unsigned int [addressable] [assigned] [usertype]
> pixclk_100hz
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:413:34:
> sparse:     got restricted __le32 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:509:23:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [assigned] [usertype] h_size @@     got
> restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:509:23:
> sparse:     expected unsigned short [assigned] [usertype] h_size
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:509:23:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:511:32:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [assigned] [usertype] h_blanking_time
> @@     got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:511:32:
> sparse:     expected unsigned short [assigned] [usertype] h_blanking_time
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:511:32:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:515:23:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [assigned] [usertype] v_size @@     got
> restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:515:23:
> sparse:     expected unsigned short [assigned] [usertype] v_size
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:515:23:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:517:32:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [assigned] [usertype] v_blanking_time
> @@     got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:517:32:
> sparse:     expected unsigned short [assigned] [usertype] v_blanking_time
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:517:32:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:524:29:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [assigned] [usertype] h_syncoffset
> @@     got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:524:29:
> sparse:     expected unsigned short [assigned] [usertype] h_syncoffset
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:524:29:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:527:28:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [assigned] [usertype] h_syncwidth
> @@     got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:527:28:
> sparse:     expected unsigned short [assigned] [usertype] h_syncwidth
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:527:28:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:532:29:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [assigned] [usertype] v_syncoffset
> @@     got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:532:29:
> sparse:     expected unsigned short [assigned] [usertype] v_syncoffset
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:532:29:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:535:28:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [assigned] [usertype] v_syncwidth
> @@     got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:535:28:
> sparse:     expected unsigned short [assigned] [usertype] v_syncwidth
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:535:28:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:544:33:
> sparse: sparse: cast to restricted __le16
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:543:37:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [assigned] [usertype] modemiscinfo
> @@     got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:543:37:
> sparse:     expected unsigned short [assigned] [usertype] modemiscinfo
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:543:37:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:549:33:
> sparse: sparse: cast to restricted __le16
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:548:37:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [assigned] [usertype] modemiscinfo
> @@     got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:548:37:
> sparse:     expected unsigned short [assigned] [usertype] modemiscinfo
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:548:37:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:554:33:
> sparse: sparse: cast to restricted __le16
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:553:37:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [assigned] [usertype] modemiscinfo
> @@     got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:553:37:
> sparse:     expected unsigned short [assigned] [usertype] modemiscinfo
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:553:37:
> sparse:     got restricted __le16 [usertype]
> >>>
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:572:39:
> sparse: sparse: incorrect type in argument 1 (different base types)
> @@     expected restricted __le16 [usertype] *var @@     got unsigned
> short * @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:572:39:
> sparse:     expected restricted __le16 [usertype] *var
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:572:39:
> sparse:     got unsigned short *
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:578:25:
> sparse: sparse: cast to restricted __le16
> >>>
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:577:37:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned short [addressable] [assigned] [usertype]
> modemiscinfo @@     got restricted __le16 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:577:37:
> sparse:     expected unsigned short [addressable] [assigned]
> [usertype] modemiscinfo
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:577:37:
> sparse:     got restricted __le16 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:851:43:
> sparse: sparse: incorrect type in assignment (different base types)
> @@     expected unsigned int [addressable] [assigned] [usertype]
> dceclk_10khz @@     got restricted __le32 [usertype] @@
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:851:43:
> sparse:     expected unsigned int [addressable] [assigned] [usertype]
> dceclk_10khz
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:851:43:
> sparse:     got restricted __le32 [usertype]
> >
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:860:53:
> sparse: sparse: cast to restricted __le32
> >
> > vim +1880 drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c
> >
> >    1812
> >    1813       static enum bp_result set_crtc_using_dtd_timing_v3(
> >    1814               struct bios_parser *bp,
> >    1815               struct bp_hw_crtc_timing_parameters *bp_params)
> >    1816       {
> >    1817               enum bp_result result =3D BP_RESULT_FAILURE;
> >    1818 SET_CRTC_USING_DTD_TIMING_PARAMETERS params =3D {0};
> >    1819               uint8_t atom_controller_id;
> >    1820
> >    1821               if (bp->cmd_helper->controller_id_to_atom(
> >    1822 bp_params->controller_id, &atom_controller_id))
> >    1823                       params.ucCRTC =3D atom_controller_id;
> >    1824
> >    1825               /* bios usH_Size wants h addressable size */
> >    1826               params.usH_Size =3D
> cpu_to_le16((uint16_t)bp_params->h_addressable);
> >    1827               /* bios usH_Blanking_Time wants borders
> included in blanking */
> >    1828               params.usH_Blanking_Time =3D
> >    1829 cpu_to_le16((uint16_t)(bp_params->h_total -
> bp_params->h_addressable));
> >    1830               /* bios usV_Size wants v addressable size */
> >    1831               params.usV_Size =3D
> cpu_to_le16((uint16_t)bp_params->v_addressable);
> >    1832               /* bios usV_Blanking_Time wants borders
> included in blanking */
> >    1833               params.usV_Blanking_Time =3D
> >    1834 cpu_to_le16((uint16_t)(bp_params->v_total -
> bp_params->v_addressable));
> >    1835               /* bios usHSyncOffset is the offset from the
> end of h addressable,
> >    1836                * our horizontalSyncStart is the offset from
> the beginning
> >    1837                * of h addressable */
> >    1838               params.usH_SyncOffset =3D
> >    1839 cpu_to_le16((uint16_t)(bp_params->h_sync_start -
> bp_params->h_addressable));
> >    1840               params.usH_SyncWidth =3D
> cpu_to_le16((uint16_t)bp_params->h_sync_width);
> >    1841               /* bios usHSyncOffset is the offset from the
> end of v addressable,
> >    1842                * our verticalSyncStart is the offset from
> the beginning of
> >    1843                * v addressable */
> >    1844               params.usV_SyncOffset =3D
> >    1845 cpu_to_le16((uint16_t)(bp_params->v_sync_start -
> bp_params->v_addressable));
> >    1846               params.usV_SyncWidth =3D
> cpu_to_le16((uint16_t)bp_params->v_sync_width);
> >    1847
> >    1848               /* we assume that overscan from original
> timing does not get bigger
> >    1849                * than 255
> >    1850                * we will program all the borders in the Set
> CRTC Overscan call below
> >    1851                */
> >    1852
> >    1853               if (0 =3D=3D bp_params->flags.HSYNC_POSITIVE_POLA=
RITY)
> >    1854 params.susModeMiscInfo.usAccess =3D
> >    1855 cpu_to_le16(le16_to_cpu(params.susModeMiscInfo.usAccess) |
> ATOM_HSYNC_POLARITY);
> >    1856
> >    1857               if (0 =3D=3D bp_params->flags.VSYNC_POSITIVE_POLA=
RITY)
> >    1858 params.susModeMiscInfo.usAccess =3D
> >    1859 cpu_to_le16(le16_to_cpu(params.susModeMiscInfo.usAccess) |
> ATOM_VSYNC_POLARITY);
> >    1860
> >    1861               if (bp_params->flags.INTERLACE) {
> >    1862 params.susModeMiscInfo.usAccess =3D
> >    1863 cpu_to_le16(le16_to_cpu(params.susModeMiscInfo.usAccess) |
> ATOM_INTERLACE);
> >    1864
> >    1865                       /* original DAL code has this
> condition to apply this
> >    1866                        * for non-TV/CV only
> >    1867                        * due to complex MV testing for
> possible impact
> >    1868                        * if ( pACParameters->signal !=3D
> SignalType_YPbPr &&
> >    1869                        * pACParameters->signal !=3D
> SignalType_Composite &&
> >    1870                        * pACParameters->signal !=3D
> SignalType_SVideo)
> >    1871                        */
> >    1872                       {
> >    1873                               /* HW will deduct 0.5 line
> from 2nd feild.
> >    1874                                * i.e. for 1080i, it is 2
> lines for 1st field,
> >    1875                                * 2.5 lines for the 2nd
> feild. we need input as 5
> >    1876                                * instead of 4.
> >    1877                                * but it is 4 either from
> Edid data (spec CEA 861)
> >    1878                                * or CEA timing table.
> >    1879                                */
> >> 1880 le16_add_cpu(&params.usV_SyncOffset, 1);
> >    1881                       }
> >    1882               }
> >    1883
> >    1884               if (bp_params->flags.HORZ_COUNT_BY_TWO)
> >> 1885 params.susModeMiscInfo.usAccess =3D
> >    1886 cpu_to_le16(le16_to_cpu(params.susModeMiscInfo.usAccess) |
> ATOM_DOUBLE_CLOCK_MODE);
> >    1887
> >    1888               if
> (EXEC_BIOS_CMD_TABLE(SetCRTC_UsingDTDTiming, params))
> >    1889                       result =3D BP_RESULT_OK;
> >    1890
> >    1891               return result;
> >    1892       }
> >    1893
> >
> > ---
> > 0-DAY CI Kernel Test Service, Intel Corporation
> >
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
.01.org%2Fhyperkitty%2Flist%2Fkbuild-all%40lists.01.org&amp;data=3D04%7C01%=
7CAlexander.Deucher%40amd.com%7C2f283fc47a6641db05cd08d8a19f7d80%7C3dd8961f=
e4884e608e11a82d994e183d%7C0%7C0%7C637437053682489591%7CUnknown%7CTWFpbGZsb=
3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C100=
0&amp;sdata=3D77wRGSBVZ6dkVMjAcmnry563ubX0PkhoC%2BIF3Mw7a%2Bc%3D&amp;reserv=
ed=3D0
> >
>
> _______________________________________________
> kbuild-all mailing list -- kbuild-all@lists.01.org
> To unsubscribe send an email to kbuild-all-leave@lists.01.org


--_000_MN2PR12MB44882A2C124F33072EB9F179F7C50MN2PR12MB4488namp_
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
<p style=3D"font-family:Arial;font-size:11pt;color:#0078D7;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only - Internal Distribution Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
You can add amd-21.xx as well, since they will coming up next year.&nbsp; M=
aybe amd-2*?<br>
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
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Rong Chen &lt;rong.a.=
chen@intel.com&gt;<br>
<b>Sent:</b> Wednesday, December 16, 2020 3:48 AM<br>
<b>To:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Qinglang M=
iao &lt;miaoqinglang@huawei.com&gt;; kernel test robot &lt;lkp@intel.com&gt=
;<br>
<b>Cc:</b> kbuild-all@lists.01.org &lt;kbuild-all@lists.01.org&gt;; dri-dev=
el@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt;; Felix &lt=
;&quot;Xiong, &quot;@ml01.01.org&gt;<br>
<b>Subject:</b> Re: [kbuild-all] Re: [radeon-alex:amd-20.45 2127/2427] driv=
ers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1880:39: sparse: =
sparse: incorrect type in argument 1 (different base types)</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi Alex,<br>
<br>
We have ignored the amd-20.xx branches:<br>
<a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fgithub.com%2Fintel%2Flkp-tests%2Fcommit%2Facb8d1f213ec6841900e0d7e9737f=
8ea0960e4d3&amp;amp;data=3D04%7C01%7CAlexander.Deucher%40amd.com%7C2f283fc4=
7a6641db05cd08d8a19f7d80%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63743=
7053682479635%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL=
CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DU2aA%2B31wbSToDkIHiUrJ=
WriNOPNNJ162W3F1HjYG6mc%3D&amp;amp;reserved=3D0">https://nam11.safelinks.pr=
otection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fintel%2Flkp-tests%2F=
commit%2Facb8d1f213ec6841900e0d7e9737f8ea0960e4d3&amp;amp;data=3D04%7C01%7C=
Alexander.Deucher%40amd.com%7C2f283fc47a6641db05cd08d8a19f7d80%7C3dd8961fe4=
884e608e11a82d994e183d%7C0%7C0%7C637437053682479635%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;amp;sdata=3DU2aA%2B31wbSToDkIHiUrJWriNOPNNJ162W3F1HjYG6mc%3D&amp;amp;re=
served=3D0</a><br>
<br>
Best Regards,<br>
Rong Chen<br>
<br>
On 12/15/20 10:24 PM, Deucher, Alexander wrote:<br>
&gt;<br>
&gt; [AMD Public Use]<br>
&gt;<br>
&gt;<br>
&gt; The test robot should probably not be testing the amd-20.xx branches <=
br>
&gt; in the first place.&nbsp; They are just mirrors of our packaged driver=
s so <br>
&gt; they contain a bunch of stuff that will never go upstream like kernel =
<br>
&gt; compatibility layers and dkms support.<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; ----------------------------------------------------------------------=
--<br>
&gt; *From:* Qinglang Miao &lt;miaoqinglang@huawei.com&gt;<br>
&gt; *Sent:* Tuesday, December 15, 2020 3:21 AM<br>
&gt; *To:* kernel test robot &lt;lkp@intel.com&gt;; Deucher, Alexander <br>
&gt; &lt;Alexander.Deucher@amd.com&gt;<br>
&gt; *Cc:* kbuild-all@lists.01.org &lt;kbuild-all@lists.01.org&gt;; <br>
&gt; dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt=
;; <br>
&gt; Xiong, Yang (Felix) &lt;Yang.Xiong@amd.com&gt;<br>
&gt; *Subject:* Re: [radeon-alex:amd-20.45 2127/2427] <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1880:39:=
 <br>
&gt; sparse: sparse: incorrect type in argument 1 (different base types)<br=
>
&gt; Hi Alex,<br>
&gt;<br>
&gt; I think it's not a valid report from kernel test robot, for __le16 oug=
ht<br>
&gt; to be the right type for cpu_to_le16. The sparse warnings seems not<br=
>
&gt; right so I did't try effort to reproduce it.<br>
&gt;<br>
&gt; otherwise, when I take a carful look at this patch, an unconditional<b=
r>
&gt; braces exists and I'm not sure about its benefit.<br>
&gt;<br>
&gt; if (bp_params-&gt;flags.INTERLACE) {<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; params.susModeMiscInfo.usAccess =3D<br>
&gt; cpu_to_le16(le16_to_cpu(params.susModeMiscInfo.usAccess) |<br>
&gt; ATOM_INTERLACE);<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; {<br>
&gt; le16_add_cpu(&amp;params.usV_SyncOffset, 1);<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; }<br>
&gt; }<br>
&gt;<br>
&gt; patch link:<br>
&gt; <a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Flore.kernel.org%2Flkml%2FCADnq5_PunHA1VHHj7VtEHG6o2Z_Z1WS325y_R9xO=
%2BgsV_JCOXw%40mail.gmail.com%2F&amp;amp;data=3D04%7C01%7CAlexander.Deucher=
%40amd.com%7C2f283fc47a6641db05cd08d8a19f7d80%7C3dd8961fe4884e608e11a82d994=
e183d%7C0%7C0%7C637437053682489591%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw=
MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3Dl=
oDpCZcwzSthBMwesVesMIEwtgf%2BGZoycOyTwBpqkfI%3D&amp;amp;reserved=3D0">
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.ke=
rnel.org%2Flkml%2FCADnq5_PunHA1VHHj7VtEHG6o2Z_Z1WS325y_R9xO%2BgsV_JCOXw%40m=
ail.gmail.com%2F&amp;amp;data=3D04%7C01%7CAlexander.Deucher%40amd.com%7C2f2=
83fc47a6641db05cd08d8a19f7d80%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C=
637437053682489591%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2lu=
MzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DloDpCZcwzSthBMwes=
VesMIEwtgf%2BGZoycOyTwBpqkfI%3D&amp;amp;reserved=3D0</a><br>
&gt;<br>
&gt; How do you think?<br>
&gt;<br>
&gt; =1B$B:_=1B(B 2020/12/15 14:44, kernel test robot =1B$B<LF;=1B(B:<br>
&gt; &gt; tree: git://people.freedesktop.org/~agd5f/linux.git amd-20.45<br>
&gt; &gt; head:&nbsp;&nbsp; a3950d94b046fb206e58fd3ec717f071c0203ba3<br>
&gt; &gt; commit: c82b6c9ed412fb7009b02dd82e50ee24f451e9a8 [2127/2427] <br>
&gt; drm/amd/display: convert to use le16_add_cpu()<br>
&gt; &gt; config: arc-randconfig-s031-20201214 (attached as .config)<br>
&gt; &gt; compiler: arc-elf-gcc (GCC) 9.3.0<br>
&gt; &gt; reproduce:<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wget <br>
&gt; <a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fraw.githubusercontent.com%2Fintel%2Flkp-tests%2Fmaster%2Fsbin%2Fma=
ke.cross&amp;amp;data=3D04%7C01%7CAlexander.Deucher%40amd.com%7C2f283fc47a6=
641db05cd08d8a19f7d80%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63743705=
3682489591%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJB=
TiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3Da6yKdL%2BoYm1zc5fYftUrWwm=
as%2BOfrTjqpivV14xci1Y%3D&amp;amp;reserved=3D0">
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fraw.git=
hubusercontent.com%2Fintel%2Flkp-tests%2Fmaster%2Fsbin%2Fmake.cross&amp;amp=
;data=3D04%7C01%7CAlexander.Deucher%40amd.com%7C2f283fc47a6641db05cd08d8a19=
f7d80%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637437053682489591%7CUnk=
nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
VCI6Mn0%3D%7C1000&amp;amp;sdata=3Da6yKdL%2BoYm1zc5fYftUrWwmas%2BOfrTjqpivV1=
4xci1Y%3D&amp;amp;reserved=3D0</a>
<br>
&gt; -O ~/bin/make.cross<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; chmod +x ~/=
bin/make.cross<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # apt-get i=
nstall sparse<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # sparse ve=
rsion: v0.6.3-184-g1b896707-dirty<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; git remote =
add radeon-alex <br>
&gt; git://people.freedesktop.org/~agd5f/linux.git<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; git fetch -=
-no-tags radeon-alex amd-20.45<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; git checkou=
t c82b6c9ed412fb7009b02dd82e50ee24f451e9a8<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # save the =
attached .config to linux build tree<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; COMPILER_IN=
STALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 <br>
&gt; make.cross C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3D=
arc<br>
&gt; &gt;<br>
&gt; &gt; If you fix the issue, kindly add following tag as appropriate<br>
&gt; &gt; Reported-by: kernel test robot &lt;lkp@intel.com&gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &quot;sparse warnings: (new ones prefixed by &gt;&gt;)&quot;<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:879:43: =
<br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned int [addressable] [assign=
ed] [usertype] <br>
&gt; ulSymClock @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]=
 @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:879:43: =
<br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned int [addressable] [a=
ssigned] [usertype] <br>
&gt; ulSymClock<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:879:43: =
<br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:956:40: =
<br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addressable] [assi=
gned] [usertype] <br>
&gt; usRefDiv @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype] @=
@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:956:40: =
<br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addressable] =
[assigned] <br>
&gt; [usertype] usRefDiv<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:956:40: =
<br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:958:39: =
<br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addressable] [assi=
gned] [usertype] <br>
&gt; usFbDiv @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype] @@=
<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:958:39: =
<br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addressable] =
[assigned] <br>
&gt; [usertype] usFbDiv<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:958:39: =
<br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:966:44: =
<br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addressable] [assi=
gned] [usertype] <br>
&gt; usPixelClock @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertyp=
e] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:966:44: =
<br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addressable] =
[assigned] <br>
&gt; [usertype] usPixelClock<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:966:44: =
<br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1029:40:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addressable] [assi=
gned] [usertype] <br>
&gt; usFbDiv @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype] @@=
<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1029:40:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addressable] =
[assigned] <br>
&gt; [usertype] usFbDiv<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1029:40:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1031:47:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned int [addressable] [assign=
ed] [usertype] <br>
&gt; ulFbDivDecFrac @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le32 [usert=
ype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1031:47:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned int [addressable] [a=
ssigned] [usertype] <br>
&gt; ulFbDivDecFrac<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1031:47:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le32 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1044:45:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addressable] [assi=
gned] [usertype] <br>
&gt; usPixelClock @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertyp=
e] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1044:45:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addressable] =
[assigned] <br>
&gt; [usertype] usPixelClock<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1044:45:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1105:40:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addressable] [assi=
gned] [usertype] <br>
&gt; usFbDiv @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype] @@=
<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1105:40:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addressable] =
[assigned] <br>
&gt; [usertype] usFbDiv<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1105:40:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1107:47:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned int [addressable] [assign=
ed] [usertype] <br>
&gt; ulFbDivDecFrac @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le32 [usert=
ype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1107:47:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned int [addressable] [a=
ssigned] [usertype] <br>
&gt; ulFbDivDecFrac<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1107:47:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le32 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1120:60:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned int [addressable] [assign=
ed] [usertype] <br>
&gt; ulPixelClock:24 @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le32 [user=
type] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1120:60:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned int [addressable] [a=
ssigned] [usertype] <br>
&gt; ulPixelClock:24<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1120:60:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le32 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1183:34:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned int [addressable] [assign=
ed] [usertype] <br>
&gt; ulPixelClock @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le32 [usertyp=
e] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1183:34:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned int [addressable] [a=
ssigned] [usertype] <br>
&gt; ulPixelClock<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1183:34:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le32 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1272:43:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addressable] [assi=
gned] [usertype] <br>
&gt; usSpreadSpectrumPercentage @@ got restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1272:43:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addressable] =
[assigned] <br>
&gt; [usertype] usSpreadSpectrumPercentage<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1272:43:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1321:51:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addressable] [assi=
gned] [usertype] <br>
&gt; usSpreadSpectrumPercentage @@ got restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1321:51:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addressable] =
[assigned] <br>
&gt; [usertype] usSpreadSpectrumPercentage<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1321:51:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1323:45:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addressable] [assi=
gned] [usertype] <br>
&gt; usSpreadSpectrumStep @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 =
[usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1323:45:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addressable] =
[assigned] <br>
&gt; [usertype] usSpreadSpectrumStep<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1323:45:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1337:47:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addressable] [assi=
gned] [usertype] <br>
&gt; usSpreadSpectrumAmount @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le1=
6 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1337:47:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addressable] =
[assigned] <br>
&gt; [usertype] usSpreadSpectrumAmount<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1337:47:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1391:51:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addressable] [assi=
gned] [usertype] <br>
&gt; usSpreadSpectrumAmountFrac @@ got restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1391:51:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addressable] =
[assigned] <br>
&gt; [usertype] usSpreadSpectrumAmountFrac<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1391:51:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1393:45:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addressable] [assi=
gned] [usertype] <br>
&gt; usSpreadSpectrumStep @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 =
[usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1393:45:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addressable] =
[assigned] <br>
&gt; [usertype] usSpreadSpectrumStep<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1393:45:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1406:47:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addressable] [assi=
gned] [usertype] <br>
&gt; usSpreadSpectrumAmount @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le1=
6 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1406:47:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addressable] =
[assigned] <br>
&gt; [usertype] usSpreadSpectrumAmount<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1406:47:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1465:29:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [usertype] usPixelC=
lock @@&nbsp;&nbsp;&nbsp;&nbsp; got <br>
&gt; restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1465:29:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [usertype] usP=
ixelClock<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1465:29:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1488:36:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addressable] [user=
type] usPixelClock <br>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1488:36:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addressable] =
[usertype] usPixelClock<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1488:36:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1508:43:=
 <br>
&gt; sparse: sparse: cast to restricted __le32<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1583:30:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [usertype] usPixelC=
lock @@&nbsp;&nbsp;&nbsp;&nbsp; got <br>
&gt; restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1583:30:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [usertype] usP=
ixelClock<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1583:30:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1826:25:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [usertyp=
e] usH_Size @@&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt; got restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1826:25:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [us=
ertype] usH_Size<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1826:25:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1828:34:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [usertyp=
e] usH_Blanking_Time <br>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1828:34:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [us=
ertype] <br>
&gt; usH_Blanking_Time<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1828:34:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1831:25:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [usertyp=
e] usV_Size @@&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt; got restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1831:25:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [us=
ertype] usV_Size<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1831:25:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1833:34:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [usertyp=
e] usV_Blanking_Time <br>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1833:34:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [us=
ertype] <br>
&gt; usV_Blanking_Time<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1833:34:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1838:31:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [usertyp=
e] usH_SyncOffset <br>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1838:31:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [us=
ertype] usH_SyncOffset<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1838:31:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1840:30:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [usertyp=
e] usH_SyncWidth <br>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1840:30:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [us=
ertype] usH_SyncWidth<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1840:30:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1844:31:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [usertyp=
e] usV_SyncOffset <br>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1844:31:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [us=
ertype] usV_SyncOffset<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1844:31:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1846:30:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [usertyp=
e] usV_SyncWidth <br>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1846:30:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [us=
ertype] usV_SyncWidth<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1846:30:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1855:33:=
 <br>
&gt; sparse: sparse: cast to restricted __le16<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1854:49:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [usertyp=
e] usAccess @@&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt; got restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1854:49:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [us=
ertype] usAccess<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1854:49:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1859:33:=
 <br>
&gt; sparse: sparse: cast to restricted __le16<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1858:49:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [usertyp=
e] usAccess @@&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt; got restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1858:49:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [us=
ertype] usAccess<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1858:49:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1863:33:=
 <br>
&gt; sparse: sparse: cast to restricted __le16<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1862:49:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [usertyp=
e] usAccess @@&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt; got restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1862:49:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [us=
ertype] usAccess<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1862:49:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt;&gt;&gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1880:39:=
 <br>
&gt; sparse: sparse: incorrect type in argument 1 (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected restricted __le16 [usertype] *var =
@@&nbsp;&nbsp;&nbsp;&nbsp; got unsigned <br>
&gt; short * @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1880:39:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected restricted __le16 [usertype] =
*var<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1880:39:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got unsigned short *<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1886:33:=
 <br>
&gt; sparse: sparse: cast to restricted __le16<br>
&gt; &gt;&gt;&gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1885:49:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addressable] [assi=
gned] [usertype] <br>
&gt; usAccess @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype] @=
@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1885:49:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addressable] =
[assigned] <br>
&gt; [usertype] usAccess<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1885:49:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1752:26:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [usertyp=
e] usH_Total @@&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt; got restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1752:26:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [us=
ertype] usH_Total<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1752:26:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1753:25:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [usertyp=
e] usH_Disp @@&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt; got restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1753:25:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [us=
ertype] usH_Disp<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1753:25:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1754:30:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [usertyp=
e] usH_SyncStart <br>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1754:30:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [us=
ertype] usH_SyncStart<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1754:30:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1755:30:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [usertyp=
e] usH_SyncWidth <br>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1755:30:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [us=
ertype] usH_SyncWidth<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1755:30:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1756:26:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [usertyp=
e] usV_Total @@&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt; got restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1756:26:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [us=
ertype] usV_Total<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1756:26:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1757:25:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [usertyp=
e] usV_Disp @@&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt; got restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1757:25:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [us=
ertype] usV_Disp<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1757:25:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1758:30:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [usertyp=
e] usV_SyncStart <br>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1758:30:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [us=
ertype] usV_SyncStart<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1758:30:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1760:30:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [usertyp=
e] usV_SyncWidth <br>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1760:30:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [us=
ertype] usV_SyncWidth<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1760:30:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1776:33:=
 <br>
&gt; sparse: sparse: cast to restricted __le16<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1775:49:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [usertyp=
e] usAccess @@&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt; got restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1775:49:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [us=
ertype] usAccess<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1775:49:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1780:33:=
 <br>
&gt; sparse: sparse: cast to restricted __le16<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1779:49:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [usertyp=
e] usAccess @@&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt; got restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1779:49:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [us=
ertype] usAccess<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1779:49:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1784:33:=
 <br>
&gt; sparse: sparse: cast to restricted __le16<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1783:49:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [usertyp=
e] usAccess @@&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt; got restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1783:49:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [us=
ertype] usAccess<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1783:49:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1799:38:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [usertyp=
e] usV_SyncStart <br>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1799:38:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [us=
ertype] usV_SyncStart<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1799:38:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1805:33:=
 <br>
&gt; sparse: sparse: cast to restricted __le16<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1804:49:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [usertyp=
e] usAccess @@&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt; got restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1804:49:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [us=
ertype] usAccess<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1804:49:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2047:40:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addressable] [assi=
gned] [usertype] <br>
&gt; usPixelClock @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertyp=
e] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2047:40:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addressable] =
[assigned] <br>
&gt; [usertype] usPixelClock<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2047:40:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2079:44:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned int [addressable] [assign=
ed] [usertype] <br>
&gt; ulDispEngClkFreq @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le32 [use=
rtype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2079:44:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned int [addressable] [a=
ssigned] [usertype] <br>
&gt; ulDispEngClkFreq<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2079:44:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le32 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2092:44:=
 <br>
&gt; sparse: sparse: cast to restricted __le32<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2174:44:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [usertype] usConnec=
torId @@&nbsp;&nbsp;&nbsp;&nbsp; got <br>
&gt; restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2174:44:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [usertype] usC=
onnectorId<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2174:44:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2183:43:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [usertype] usPixelC=
lock @@&nbsp;&nbsp;&nbsp;&nbsp; got <br>
&gt; restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2183:43:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [usertype] usP=
ixelClock<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2183:43:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2207:43:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [usertype] usPixelC=
lock @@&nbsp;&nbsp;&nbsp;&nbsp; got <br>
&gt; restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2207:43:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [usertype] usP=
ixelClock<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2207:43:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2340:45:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned int [addressable] [assign=
ed] [usertype] <br>
&gt; ulDCEClkFreq @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le32 [usertyp=
e] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2340:45:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned int [addressable] [a=
ssigned] [usertype] <br>
&gt; ulDCEClkFreq<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2340:45:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le32 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2344:53:=
 <br>
&gt; sparse: sparse: cast to restricted __le32<br>
&gt; &gt; --<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:413:34:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned int [addressable] [assign=
ed] [usertype] <br>
&gt; pixclk_100hz @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le32 [usertyp=
e] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:413:34:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned int [addressable] [a=
ssigned] [usertype] <br>
&gt; pixclk_100hz<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:413:34:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le32 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:509:23:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [usertyp=
e] h_size @@&nbsp;&nbsp;&nbsp;&nbsp; got <br>
&gt; restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:509:23:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [us=
ertype] h_size<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:509:23:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:511:32:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [usertyp=
e] h_blanking_time <br>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:511:32:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [us=
ertype] h_blanking_time<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:511:32:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:515:23:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [usertyp=
e] v_size @@&nbsp;&nbsp;&nbsp;&nbsp; got <br>
&gt; restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:515:23:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [us=
ertype] v_size<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:515:23:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:517:32:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [usertyp=
e] v_blanking_time <br>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:517:32:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [us=
ertype] v_blanking_time<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:517:32:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:524:29:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [usertyp=
e] h_syncoffset <br>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:524:29:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [us=
ertype] h_syncoffset<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:524:29:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:527:28:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [usertyp=
e] h_syncwidth <br>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:527:28:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [us=
ertype] h_syncwidth<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:527:28:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:532:29:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [usertyp=
e] v_syncoffset <br>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:532:29:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [us=
ertype] v_syncoffset<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:532:29:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:535:28:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [usertyp=
e] v_syncwidth <br>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:535:28:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [us=
ertype] v_syncwidth<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:535:28:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:544:33:=
 <br>
&gt; sparse: sparse: cast to restricted __le16<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:543:37:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [usertyp=
e] modemiscinfo <br>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:543:37:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [us=
ertype] modemiscinfo<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:543:37:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:549:33:=
 <br>
&gt; sparse: sparse: cast to restricted __le16<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:548:37:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [usertyp=
e] modemiscinfo <br>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:548:37:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [us=
ertype] modemiscinfo<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:548:37:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:554:33:=
 <br>
&gt; sparse: sparse: cast to restricted __le16<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:553:37:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [usertyp=
e] modemiscinfo <br>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:553:37:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [assigned] [us=
ertype] modemiscinfo<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:553:37:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt;&gt;&gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:572:39:=
 <br>
&gt; sparse: sparse: incorrect type in argument 1 (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected restricted __le16 [usertype] *var =
@@&nbsp;&nbsp;&nbsp;&nbsp; got unsigned <br>
&gt; short * @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:572:39:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected restricted __le16 [usertype] =
*var<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:572:39:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got unsigned short *<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:578:25:=
 <br>
&gt; sparse: sparse: cast to restricted __le16<br>
&gt; &gt;&gt;&gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:577:37:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addressable] [assi=
gned] [usertype] <br>
&gt; modemiscinfo @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertyp=
e] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:577:37:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned short [addressable] =
[assigned] <br>
&gt; [usertype] modemiscinfo<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:577:37:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le16 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:851:43:=
 <br>
&gt; sparse: sparse: incorrect type in assignment (different base types) <b=
r>
&gt; @@&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned int [addressable] [assign=
ed] [usertype] <br>
&gt; dceclk_10khz @@&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le32 [usertyp=
e] @@<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:851:43:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; expected unsigned int [addressable] [a=
ssigned] [usertype] <br>
&gt; dceclk_10khz<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:851:43:=
 <br>
&gt; sparse:&nbsp;&nbsp;&nbsp;&nbsp; got restricted __le32 [usertype]<br>
&gt; &gt; <br>
&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:860:53:=
 <br>
&gt; sparse: sparse: cast to restricted __le32<br>
&gt; &gt;<br>
&gt; &gt; vim +1880 drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_t=
able.c<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1812<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1813&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static=
 enum bp_result set_crtc_using_dtd_timing_v3(<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1814&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct bios_parser *bp,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1815&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct bp_hw_crtc_timing_paramete=
rs *bp_params)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1816&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1817&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum bp_result result =3D BP_RESU=
LT_FAILURE;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1818 SET_CRTC_USING_DTD_TIMING_PARAMETERS param=
s =3D {0};<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1819&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint8_t atom_controller_id;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1820<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1821&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (bp-&gt;cmd_helper-&gt;control=
ler_id_to_atom(<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1822 bp_params-&gt;controller_id, &amp;atom_con=
troller_id))<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1823&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; params.ucCRTC =3D atom_controller_id;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1824<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1825&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* bios usH_Size wants h addressa=
ble size */<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1826&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; params.usH_Size =3D <br>
&gt; cpu_to_le16((uint16_t)bp_params-&gt;h_addressable);<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1827&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* bios usH_Blanking_Time wants b=
orders <br>
&gt; included in blanking */<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1828&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; params.usH_Blanking_Time =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1829 cpu_to_le16((uint16_t)(bp_params-&gt;h_tot=
al - <br>
&gt; bp_params-&gt;h_addressable));<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1830&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* bios usV_Size wants v addressa=
ble size */<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1831&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; params.usV_Size =3D <br>
&gt; cpu_to_le16((uint16_t)bp_params-&gt;v_addressable);<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1832&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* bios usV_Blanking_Time wants b=
orders <br>
&gt; included in blanking */<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1833&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; params.usV_Blanking_Time =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1834 cpu_to_le16((uint16_t)(bp_params-&gt;v_tot=
al - <br>
&gt; bp_params-&gt;v_addressable));<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1835&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* bios usHSyncOffset is the offs=
et from the <br>
&gt; end of h addressable,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1836&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * our horizontalSyncStart i=
s the offset from <br>
&gt; the beginning<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1837&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * of h addressable */<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1838&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; params.usH_SyncOffset =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1839 cpu_to_le16((uint16_t)(bp_params-&gt;h_syn=
c_start - <br>
&gt; bp_params-&gt;h_addressable));<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1840&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; params.usH_SyncWidth =3D <br>
&gt; cpu_to_le16((uint16_t)bp_params-&gt;h_sync_width);<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1841&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* bios usHSyncOffset is the offs=
et from the <br>
&gt; end of v addressable,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1842&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * our verticalSyncStart is =
the offset from <br>
&gt; the beginning of<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1843&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * v addressable */<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1844&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; params.usV_SyncOffset =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1845 cpu_to_le16((uint16_t)(bp_params-&gt;v_syn=
c_start - <br>
&gt; bp_params-&gt;v_addressable));<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1846&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; params.usV_SyncWidth =3D <br>
&gt; cpu_to_le16((uint16_t)bp_params-&gt;v_sync_width);<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1847<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1848&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* we assume that overscan from o=
riginal <br>
&gt; timing does not get bigger<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1849&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * than 255<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1850&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * we will program all the b=
orders in the Set <br>
&gt; CRTC Overscan call below<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1851&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1852<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1853&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (0 =3D=3D bp_params-&gt;flags.=
HSYNC_POSITIVE_POLARITY)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1854 params.susModeMiscInfo.usAccess =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1855 cpu_to_le16(le16_to_cpu(params.susModeMisc=
Info.usAccess) | <br>
&gt; ATOM_HSYNC_POLARITY);<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1856<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1857&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (0 =3D=3D bp_params-&gt;flags.=
VSYNC_POSITIVE_POLARITY)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1858 params.susModeMiscInfo.usAccess =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1859 cpu_to_le16(le16_to_cpu(params.susModeMisc=
Info.usAccess) | <br>
&gt; ATOM_VSYNC_POLARITY);<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1860<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1861&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (bp_params-&gt;flags.INTERLACE=
) {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1862 params.susModeMiscInfo.usAccess =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1863 cpu_to_le16(le16_to_cpu(params.susModeMisc=
Info.usAccess) | <br>
&gt; ATOM_INTERLACE);<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1864<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1865&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; /* original DAL code has this <br>
&gt; condition to apply this<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1866&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; * for non-TV/CV only<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1867&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; * due to complex MV testing for <br>
&gt; possible impact<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1868&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; * if ( pACParameters-&gt;signal !=3D <br>
&gt; SignalType_YPbPr &amp;&amp;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1869&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; * pACParameters-&gt;signal !=3D <br>
&gt; SignalType_Composite &amp;&amp;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1870&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; * pACParameters-&gt;signal !=3D <br>
&gt; SignalType_SVideo)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1871&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; */<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1872&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1873&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* HW will d=
educt 0.5 line <br>
&gt; from 2nd feild.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1874&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * i.e.=
 for 1080i, it is 2 <br>
&gt; lines for 1st field,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1875&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * 2.5 =
lines for the 2nd <br>
&gt; feild. we need input as 5<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1876&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * inst=
ead of 4.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1877&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * but =
it is 4 either from <br>
&gt; Edid data (spec CEA 861)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1878&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * or C=
EA timing table.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1879&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; &gt;&gt; 1880 le16_add_cpu(&amp;params.usV_SyncOffset, 1);<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1881&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; }<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1882&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1883<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1884&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (bp_params-&gt;flags.HORZ_COUN=
T_BY_TWO)<br>
&gt; &gt;&gt; 1885 params.susModeMiscInfo.usAccess =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1886 cpu_to_le16(le16_to_cpu(params.susModeMisc=
Info.usAccess) | <br>
&gt; ATOM_DOUBLE_CLOCK_MODE);<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1887<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1888&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if <br>
&gt; (EXEC_BIOS_CMD_TABLE(SetCRTC_UsingDTDTiming, params))<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1889&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; result =3D BP_RESULT_OK;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1890<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1891&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return result;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1892&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1893<br>
&gt; &gt;<br>
&gt; &gt; ---<br>
&gt; &gt; 0-DAY CI Kernel Test Service, Intel Corporation<br>
&gt; &gt; <br>
&gt; <a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Flists.01.org%2Fhyperkitty%2Flist%2Fkbuild-all%40lists.01.org&amp;a=
mp;data=3D04%7C01%7CAlexander.Deucher%40amd.com%7C2f283fc47a6641db05cd08d8a=
19f7d80%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637437053682489591%7CU=
nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC=
JXVCI6Mn0%3D%7C1000&amp;amp;sdata=3D77wRGSBVZ6dkVMjAcmnry563ubX0PkhoC%2BIF3=
Mw7a%2Bc%3D&amp;amp;reserved=3D0">
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.0=
1.org%2Fhyperkitty%2Flist%2Fkbuild-all%40lists.01.org&amp;amp;data=3D04%7C0=
1%7CAlexander.Deucher%40amd.com%7C2f283fc47a6641db05cd08d8a19f7d80%7C3dd896=
1fe4884e608e11a82d994e183d%7C0%7C0%7C637437053682489591%7CUnknown%7CTWFpbGZ=
sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1=
000&amp;amp;sdata=3D77wRGSBVZ6dkVMjAcmnry563ubX0PkhoC%2BIF3Mw7a%2Bc%3D&amp;=
amp;reserved=3D0</a><br>
&gt; &gt;<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; kbuild-all mailing list -- kbuild-all@lists.01.org<br>
&gt; To unsubscribe send an email to kbuild-all-leave@lists.01.org<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_MN2PR12MB44882A2C124F33072EB9F179F7C50MN2PR12MB4488namp_--

--===============0859490103==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0859490103==--
