Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 294B160EF95
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 07:42:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 564AE10E42F;
	Thu, 27 Oct 2022 05:42:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2068.outbound.protection.outlook.com [40.107.244.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0103110E405;
 Thu, 27 Oct 2022 05:42:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cU+87qQTNdOTLaRrEoyoocpSP0MdQJT32KG/VcmIieQW9ofhZOHBY8Mg30qEY2a76hBRUHxJJ/QwPnqJgL4iUn3BSM6E+QgtPho5rFCUnT7m/QD1FccjBLkSnUVhiItwhQeRqLBCjoJJc8w/8sIPZCARa0HwoMG1MYuDlJzYJ9VAjP1+M1g90dAFOaJyNDbC1boIP4nr0ozXo7HtMwzk1T+IedP+t7BHe/LqnnF8SD28WrKOJbse2IcG1t1pOB6Ft70SLrKUl9DfBJAsYlNVJDuXcj2AY6X2aCgpSli8LSmXNFLxrnIluPbWVfX4vbgR8Io93PO7yVgfd2hvQfihPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Zt7g++kcTqcALF3+eVUwx55eLPsTtcvlknrcd3ufMg=;
 b=ZTe26balyUBDsK0GWS922QWzqZ+WLR/3BLQitkU4MvLnJ6FAlIM+t9sEj66mz2OhSd9phY9z2xlb23ByXGb2zJxVUjhN9+ZNNqAMLZQmjxM5D8X5okzstUbR9lbOKu5xHCQ6Vb+nMiHTfmqiRSSDoqn+PKObW9glrYO0ISKf/WET20zAN8p8egMqnzljzhWQeOOV0jy/njWuvAxyiJo07G2f62y/rNFUXJ9xPPZFIFycp/bq0uM+olUEJk9TEcvxBIyywO88Od6dp0cdS6S0IszOQT5RVKp9crvpZjeehg6O/DKiA5nCfgbWqL7/4Oj38AMV3T5AUf6zU8YWbxOYLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Zt7g++kcTqcALF3+eVUwx55eLPsTtcvlknrcd3ufMg=;
 b=WXEiMBgIG7moY0e+sTZe9F5A8d9rPAzRYeNxqqTia9mlo81LG2dHkXzhZEum9BaXFHPAz0vduLLCxFQ7/Ar+m1OPlopdz4/b35upfqWawG3HFiYQ2JS4J79MTT49uR6XvIGepk/l2/mxdGGe5ruLDl0V1eBUS/b+9v8vLCKervA=
Received: from DM5PR12MB2469.namprd12.prod.outlook.com (2603:10b6:4:af::38) by
 BL1PR12MB5899.namprd12.prod.outlook.com (2603:10b6:208:397::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Thu, 27 Oct
 2022 05:42:14 +0000
Received: from DM5PR12MB2469.namprd12.prod.outlook.com
 ([fe80::aa23:a85e:de27:6520]) by DM5PR12MB2469.namprd12.prod.outlook.com
 ([fe80::aa23:a85e:de27:6520%4]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 05:42:14 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel.vetter@ffwll.ch"
 <daniel.vetter@ffwll.ch>
Subject: RE: [pull] amdgpu, amdkfd drm-fixes-6.1
Thread-Topic: [pull] amdgpu, amdkfd drm-fixes-6.1
Thread-Index: AQHY6a2nheLEr6b37kOIn32ly+mZcK4huYYg
Date: Thu, 27 Oct 2022 05:42:14 +0000
Message-ID: <DM5PR12MB24693E14F89BD4116EBB51ADF1339@DM5PR12MB2469.namprd12.prod.outlook.com>
References: <20221027024101.6881-1-alexander.deucher@amd.com>
In-Reply-To: <20221027024101.6881-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM5PR12MB2469:EE_|BL1PR12MB5899:EE_
x-ms-office365-filtering-correlation-id: 54330e3a-1c12-4c3b-6c19-08dab7de0095
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 56H9umEd1znVJJaoi2qHM4KqvzpJEBJGNgo68NmNxlHrQiJOogbeSxKzoybVsYenWEtRvDLShkojHvYJIFsyNMx08d9t2UAU81L7xjsP+e2i6HTBWlALzU0STdPCzFc7rdFkV0U2gzA2ELpsQu0ggAxoSKFo+PSrAd2YvunADp/Ez5+gDQ24HvrOUmSzinfwp4D9Nv7rbJqapVZJYxC1C0mE3vPvowaMLA8dtvP12X19vT1m5RKE3DvysH3EheJrqAsiaE7+8fPixBbQQeDf62Oe8yRsKe1HoBlfyCGULR0aR07OOZiAfOdvPVpLEN8qN/b6/k9PVT5Jv9ZznUuBT6wbcyOGiRV6SrowSnUscEH4SUoFtPg5+25D4QB9mRM2OTqRnngopNj37PpQrAZ8P4iSqUHHukdw5t77/LYmmFGR9+0y0VrCdR60ZZpfCkodn4V2kQ8ooU5i6DxnDMKiUXJUoSfCgFXbY3LauFakdrpADlY6TZZOxZeOBwmkyeWMaztp+jtk+L+HA4NN2BFYZKdvDfp6SetQ53w+VYzBTyBM8u+wsrFvYOSCqTy4nPNamrfO93jl3b0ZqsW24uPPao27Xp8gXQwYrxI2T3YqIIGxKOo8jRICwDP3aQ1ieDyumGOCIkBNZHw6zSq0BFZ+HM2FEQNNQwqCG4P0RaH4HYde9fcUa/GtLJ95yIfHAlA2nbAbxXBJaYZ+XCBb2AnMGA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2469.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199015)(5660300002)(26005)(8936002)(41300700001)(4326008)(110136005)(64756008)(66946007)(66556008)(52536014)(66446008)(53546011)(8676002)(6506007)(7696005)(316002)(9686003)(76116006)(33656002)(38070700005)(122000001)(66574015)(38100700002)(66476007)(55016003)(4001150100001)(186003)(2906002)(45080400002)(966005)(478600001)(83380400001)(86362001)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?bXM+2m3eJPsbsbN8357rc1lT+/TlbDhC3UkxVmrbvrR7sFsqyiSzA9lT1B?=
 =?iso-8859-1?Q?k5+301o8KzwtiLvknb62hf1rNoFl/DG/7VBCH4LuBdx1cDAe14mVkLGfqp?=
 =?iso-8859-1?Q?74+3Ni9QqjF4blHfr0AMus2rojnASddpDCRO7wL0maigudpYSR6/CK69fF?=
 =?iso-8859-1?Q?RlBUE6oCepYt1EC42B0xV8/NkVQi5Is0dhTLuZ1S9KKKpmzlEQctoGwP4w?=
 =?iso-8859-1?Q?d2pAHKztZH6CmcXlymeT+AepKwzl8xeP6Eqsn6qyGSWoa9TaxZNyeg8bGc?=
 =?iso-8859-1?Q?yh7dDShI+K/aILdywBCE/Z+OqdEMo4D6QIFJXmb1sFs5ETrFhMigcMLxyi?=
 =?iso-8859-1?Q?iwm69KnbrysLzhhMHTga79ZB0cpIJfUkacle24lSXZ55ES5vbyAkR8ER/l?=
 =?iso-8859-1?Q?Suei1OeXDn0RWR5uAvqQrTxWIxMaQNrYVxTjcUzw+M5wlZ8KtiAxf6P2FZ?=
 =?iso-8859-1?Q?6r32l4beCXfJKT/JSL1UuTCiw74oCeRXDUnfQaj+iXXjZjITzm+b3yI1FL?=
 =?iso-8859-1?Q?37YmYWxydx+hdFZqtcgLPyIY6+vZv2x5F6PpMJu194x41c08AA1vfta0Wh?=
 =?iso-8859-1?Q?2xPytdwCJYkaGSOQuMWshK4HvieRAx48oUsvVlJ+ftwXJMqE87MPm4E2P0?=
 =?iso-8859-1?Q?k6dzVvOGIyAmgQxXw+C7Zb84FiUSd/X8Z0MNi06jDsi6CojutfQ2oJI+CN?=
 =?iso-8859-1?Q?Zh7vAezVtFmgvndAV5aAM/Rtt+dXS+5BnnyKpKDWJbmiki26HHYCUIduRs?=
 =?iso-8859-1?Q?Dx1xvlGHruhQrio9LeQ3W8XMyGIygSNqVJPD4EoN+YAZ4nJ2phtZ/ykMhc?=
 =?iso-8859-1?Q?BwQVEwj/sEz/0VG229B4u+cFiHi+vmKKVBRUE2qr22WyruUvaW98upZhL5?=
 =?iso-8859-1?Q?agbxJo4IynarqZrfvc/IXZGzPxOuBO2sq9n8vlT6Cy/QvWZv9pW7olyJXl?=
 =?iso-8859-1?Q?28J6+gSNt5IARmV3obnBDB/gsCTtpuMlIDN3GMgeybi4iZMCbs0c6MO/t1?=
 =?iso-8859-1?Q?9dYJc4mRVGVdZq47O10QWscEu3SlfzXPr8nilmW9Ip4IN1NRceG74aSIF7?=
 =?iso-8859-1?Q?WQg7JcHwJU/mwThFZM0A9mZ2+VtkUriXwdGM44PrFZlwROL18wo+mcDSFc?=
 =?iso-8859-1?Q?Vsij3mOWTsUg8UkuZiOTKIASybHIVBI5Pp2mABm0JcyPJ18FBSQ7BiRuez?=
 =?iso-8859-1?Q?8+auXbDD1g0MQeWEX8iZ8wQ94f/SO8jjIiXWZ/WaSHQEILWAdT6SFKh1NW?=
 =?iso-8859-1?Q?iEoMHO+Xg+zESQzpFDbmZ5YDt9tPWGyalwcGAwZMfi10Zq8COB7Q8VeTUV?=
 =?iso-8859-1?Q?eG2uxZ7JIgyd/8NDeIUlrx1dhegwubvAe5V6SG7PpgUCknAEqBwmdqXKK+?=
 =?iso-8859-1?Q?06k1+Kr1T/gPeoeq6KMIYr48tR5c1rITyWsJ9Bhm9X+w/RkCXXmCxN7wqr?=
 =?iso-8859-1?Q?QD5JXkvb9LgU+ZX43hcq2zHIoUXPd45WOyLGdo0MSJx1xB4Ccn0+VUM0+G?=
 =?iso-8859-1?Q?g5u0EEmwkHnMP8cWEVJYFRFeuJ0dY0biCw0+d8NYI/8LTzmsK4zHnJWswC?=
 =?iso-8859-1?Q?fCdNVvhOx6QY6foTviea0VdSjBeMlsroFfdZxs4HHyd0SONTLsWYVKEt+M?=
 =?iso-8859-1?Q?w9AMTJ1ajK2QPKXBbuXMnrm2QWwv8/R9Z2?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2469.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54330e3a-1c12-4c3b-6c19-08dab7de0095
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2022 05:42:14.6605 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MdSPyNkgVPbuJSSLquTfNvwwHN5cKAz9nnxhdoWTOjlG0dnk+IEWotd3ED8fdbTeLjvYaYB5pEQlDb+9rwWB7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5899
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Alex,

Regarding below patch, I guess we need to pick "8eb402f16d5b drm/amdgpu: Fi=
x uninitialized warning in mmhub_v2_0_get_clockgating()" together, otherwis=
e, build will possibly fail. Is it true?

 " Lijo Lazar (1):=20
      drm/amdgpu: Remove ATC L2 access for MMHUB 2.1.x"

Regards,
Guchun

-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Alex Deu=
cher
Sent: Thursday, October 27, 2022 10:41 AM
To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; airlied=
@gmail.com; daniel.vetter@ffwll.ch
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.1

Hi Dave, Daniel,

Fixes for 6.1.  Fixes for new IPs and misc other fixes.

The following changes since commit cbc543c59e8e7c8bc8604d6ac3e18a029e3d5118=
:

  Merge tag 'drm-misc-fixes-2022-10-20' of git://anongit.freedesktop.org/dr=
m/drm-misc into drm-fixes (2022-10-21 09:56:14 +1000)

are available in the Git repository at:

  https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitla=
b.freedesktop.org%2Fagd5f%2Flinux.git&amp;data=3D05%7C01%7Cguchun.chen%40am=
d.com%7C6bbe7e42eb3d43bf622208dab7c4c906%7C3dd8961fe4884e608e11a82d994e183d=
%7C0%7C0%7C638024353059986195%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL=
CJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DY=
%2BU1OrPyhCaS44nGQMTrtqBpdkcJwFdFJEAaqWGiaqo%3D&amp;reserved=3D0 tags/amd-d=
rm-fixes-6.1-2022-10-26-1

for you to fetch changes up to d61e1d1d5225a9baeb995bcbdb904f66f70ed87e:

  drm/amdgpu: disallow gfxoff until GC IP blocks complete s2idle resume (20=
22-10-26 17:48:43 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.1-2022-10-26-1:

amdgpu:
- Stable pstate fix
- SMU 13.x updates
- SR-IOV fixes
- PCI AER fix
- GC 11.x fixes
- Display fixes
- Expose IMU firmware version for debugging
- Plane modifier fix
- S0i3 fix

amdkfd:
- Fix possible memory leak
- Fix GC 10.x cache info reporting

UAPI:
- Expose IMU firmware version via existing INFO firmware query

----------------------------------------------------------------
Alvin Lee (1):
      drm/amd/display: Don't return false if no stream

Chengming Gui (1):
      drm/amdgpu: fix pstate setting issue

David Francis (1):
      drm/amd: Add IMU fw version to fw version queries

Jesse Zhang (1):
      drm/amdkfd: correct the cache info for gfx1036

Joaqu=EDn Ignacio Aramend=EDa (1):
      drm/amd/display: Revert logic for plane modifiers

Kenneth Feng (2):
      drm/amd/pm: update driver-if header for smu_v13_0_10
      drm/amd/pm: allow gfxoff on gc_11_0_3

Lijo Lazar (1):
      drm/amdgpu: Remove ATC L2 access for MMHUB 2.1.x

Prike Liang (2):
      drm/amdkfd: update gfx1037 Lx cache setting
      drm/amdgpu: disallow gfxoff until GC IP blocks complete s2idle resume

Rafael Mendonca (1):
      drm/amdkfd: Fix memory leak in kfd_mem_dmamap_userptr()

Rodrigo Siqueira (1):
      drm/amd/display: Remove wrong pipe control lock

Yiqing Yao (1):
      drm/amdgpu: Adjust MES polling timeout for sriov

YuBiao Wang (1):
      drm/amdgpu: skip mes self test for gc 11.0.3 in recover

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  18 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  13 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        |   1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   1 +
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |   9 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c            |  28 ++----
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              | 106 +++++++++++++++++=
++-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |  50 ++--------
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  12 +--
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |   2 +-
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h | 111 +++++++++++++++--=
----
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   7 +-
 include/uapi/drm/amdgpu_drm.h                      |   2 +
 18 files changed, 259 insertions(+), 119 deletions(-)
