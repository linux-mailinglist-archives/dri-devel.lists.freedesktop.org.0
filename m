Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D450F4B6158
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 04:07:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1DE110E2D0;
	Tue, 15 Feb 2022 03:07:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE5710E152;
 Tue, 15 Feb 2022 03:07:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P+es9lVP9vXZiAh0Jn5onaWEHf5JJT3lrowL+JMUc/LbHZx8whzXxbArdjgl3dwbxKGRnwFSBXyp6YQVq6yWOI8Yh1KUko/zRNM2/OQu06iA9B/++Q6w24OCaWNEzkPEMYs3Qz4Zt+jpTlPXDQq1+RKH4W5fUuNrxB+OOBNwbx627VeaRB0+rHu9I8Z7PKXovHvANiRZTw1hizzJFP+ixGtMsJSnjPYcqSv3v/O2VRnyTJgSD1Yrcs+Lcjhf4pFWQImMPpMxJjF6XSm483/lzjcZWJL5OV0XzPDO76+XGgFrAd6Rsjk8krqP69N96IYw4jdBBnsbqLzcJQL+HQWYlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JO+plKKAuvINA+HexV1aYvTEEVDGHY7mItD1qD66crs=;
 b=Z7+R7JDdx8AwIUNM1LqsjUxgOBeQRp5RQRtpzaqb3HFYAGrTAHhn8ZVlywvfkPXWhQ4uZTOaeLuqO3xu13fCMzRIC1O1XvIaDocnXLiGL57oNe6UGZIQHLZd7po3xJUjg0B98GfmdE8Md8qX7u36EyOxrprk6uvBwXgERNe1YPJWaGQ/i8LDmLjVBZWBeMpAjSbWXmqoIfRnpX1G/WGKtTrJExQRksW0O69+O0tzeP+beqbr7T2XQ7E4x68QmFxNtl5v7UucScxsvDKXTqiOVG6C29isZRxAi1mKIwFOVsgmjM1A91UI/yarN1P7NPgMftR6HMucP4PbLl9vxoNtXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JO+plKKAuvINA+HexV1aYvTEEVDGHY7mItD1qD66crs=;
 b=kWTxMzQ8XuLIiynmz/8ksyzDvf6dfPzjTNBtp90w0c8XXQThAJ3brwvUbQlQdoOTTQ1YAK/77Woz3ee/yVr4wOhE2YH154LEKoJaW1xPcTJTXDH2dlnyGwo8F18INuxqqoVm3ZHcJtinDq7K1nle7sITQh02kZczAlKM01i7O/s=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 CY4PR12MB1669.namprd12.prod.outlook.com (2603:10b6:910:3::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.15; Tue, 15 Feb 2022 03:07:12 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::7d61:f517:f3f8:9ea]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::7d61:f517:f3f8:9ea%5]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 03:07:12 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Salvatore Bonaccorso <carnil@debian.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: RE: Regression from 3c196f056666 ("drm/amdgpu: always reset the asic
 in suspend (v2)") on suspend?
Thread-Topic: Regression from 3c196f056666 ("drm/amdgpu: always reset the asic
 in suspend (v2)") on suspend?
Thread-Index: AQHYID3PyV9OUcvk5kC3ntmnBjx1BayT7zAQ
Date: Tue, 15 Feb 2022 03:07:12 +0000
Message-ID: <DM6PR12MB261963959BB02323CF27C0ACE4349@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <Ygf7KuWyc0d4HIFu@eldamar.lan>
In-Reply-To: <Ygf7KuWyc0d4HIFu@eldamar.lan>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2022-02-15T03:07:09Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=1e9a53ad-e0d2-42e8-8ac2-bf0e9748fb06;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dcba85ed-5053-4a7f-6b6b-08d9f030434f
x-ms-traffictypediagnostic: CY4PR12MB1669:EE_
x-microsoft-antispam-prvs: <CY4PR12MB16696BF52699C6D8092AA9F8E4349@CY4PR12MB1669.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1060;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5SH6Y6HsiPla9RD22DuppDU8zKAV+taJLH/j8KkkCnfhbyXU68S0b189evAyvU4Ksq/mtW/4MIy56lXEuH6jZ2sLtKhOnhfUNeeHwXU8D2efYxp0qDpRAj1LIg9V4g3iqpQvipriZAe1guYm6WmF6R8r9mTtV/bBkLLwnyxlFI0YkzSXs+8n4xZqowSPHyOwmsEpJ40yKJbkuVwC51DM2qYEDbkN0K+ot3kjLVRDw5zUHAXxhsvJsL3TdDzZuZQ67P/RWER6m1HLFTUl6TxyN8ddeGfI6Yd57t0fu3Xk+cZjK/mLca51qYLEfUrYsjuYZcPcOr/oz6bsJuswjn8ocrLnn3sBEtxaOID8iGaF1g/Y0UgcQ0Rp5yUFdKBCp413jTx+FArUJJKiaqoW45QpKw/s2XVFeUxNUwLPJiK7OVfHDCRukOLt9ochpm1yYtWJ4HSx9nS+p3pAGM5VSUmzikhozRAkRPDO1Rr9ZJePvSKOzfPcTrMc5nEPdIVAt5aUqO1Tm14TjLgjhesuJL04hUsfGGS2kIMyYhRKr8MYECOoMJTEPglVjAj3YqysEb9kIfdPACkD5Jm3xLTs/7aC/l49TYXSlXn8KL+PcLtyIX57G9VCumf4CJG5d/ostV+iJjCaDQNkYymuaNI4uj1fbmPOuWr40L56JHumv1LPHJL8+PKBXAm6vADsIj/hdeBNejxFqS7MCXH2TmID6p3ebOyFVxynut98hVPRV5hOOKT3GzE27bHgYGfjEm3XLl9BSTbzzFEhI6EUIJvuOdy1pZfJDofHY5qPzODFdbhu34w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(122000001)(55016003)(38100700002)(71200400001)(38070700005)(52536014)(45080400002)(8936002)(7696005)(15650500001)(53546011)(110136005)(83380400001)(316002)(66946007)(6636002)(76116006)(66556008)(33656002)(66476007)(64756008)(8676002)(66446008)(508600001)(4326008)(186003)(6506007)(966005)(26005)(86362001)(2906002)(54906003)(5660300002)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JELQCaX+lYULU/XL3LYlnza+eOrll/wcAy3Lk/A3g9lOWujcEv46x3ydbyU0?=
 =?us-ascii?Q?ltqbPO+eZ3y8R1ZSxsCGscWI+QAmSKICHPmCO6TAwnlIUbEPzj3LPdGWctIM?=
 =?us-ascii?Q?4VFAqGJSI+2PkNu97zKrrYbTZzwRGfetZziLUoSc8j+5P4a5tXfRXZveps0p?=
 =?us-ascii?Q?Ba+jXPWMIkWvUyUTcj4SALAdtOI0oV5GFNnprypIdc8b0/7lT4PW9xuZErNx?=
 =?us-ascii?Q?rmT/SveBP+7wPhDH3ADk5gc0ihWYe6VGdz6cJ7LANMHDSiWxirCLuFwJ9Dmo?=
 =?us-ascii?Q?LG736erT7ffLsAMm8wq3OFx8z+9RnreeWoP++oT9x5NRLcpOZ3x4Ig2SaDi2?=
 =?us-ascii?Q?4GCfsCq7N88725fKXV3ir40kqFUUmrklScb0iE4NPUt7qOWM83L23fhK2N42?=
 =?us-ascii?Q?VOdpOvk50zthsT+2RkI6bUrbKJE9j2BlxPjB04PsTBv7NyyLNjG1fmRxYBVD?=
 =?us-ascii?Q?i0qjOgeXoKrvsxDveSDbLpxrcWk74SVqcB3y36VFuXSwbHT0bG5PYZqGZF/Q?=
 =?us-ascii?Q?0g+Rq5GmDvxlA+8sNcVvncHxkvDULD/i9LPelJ/IIiBbL6xSQTiMJotIsIXD?=
 =?us-ascii?Q?XxnBfgCxLaGaxqts35ZawAEbsIIv81czzcK6J71sd7u80K0s4u6Zf4cy8cnG?=
 =?us-ascii?Q?zYTNIvGjB6vsY7WBXbG30zpJ5pn1UL83oKcMFQfR/1GhY8uNZOMaDv4mfdiw?=
 =?us-ascii?Q?BuJvwLn2xj0hNyLM9rRz6wgo0DR/B+FpkPkvi0XnXVsiH2FcDgZbDXFpVin3?=
 =?us-ascii?Q?S4Bm2bfi1KSWCHdbplrbvehy0jg5WEwDgcK6UY8rPlBLKJmpFsh8eOlPlhL5?=
 =?us-ascii?Q?7V4Z8k3rAGDroX0VTJ8c+tKzk5WlX0S9i64rinSUF1RN+9veeb2dzILD+EOl?=
 =?us-ascii?Q?rP7gE8nW52s7s8D8saxpmss1Q3GEkS9GmVr4MXnn51g+qlO8v4xfjJ/2mT47?=
 =?us-ascii?Q?Hjf7YBkCg5uOx4TMy6JI03H18f94sh6zEhb0A0B/GFoQnZ2McO7qVr4w+ylq?=
 =?us-ascii?Q?O98ez1fCktAbjzUQLuz1xGDn1yOzZR0jWl9y8BDhQ75e4id7nHbhFOv/SKSG?=
 =?us-ascii?Q?j/kmICwqqaon5gn1xtG9ycF+LVUzcyF93rNXTH84ca79nBkqE5FOTo1e8rx1?=
 =?us-ascii?Q?blWbxdT1ut5ikCtVVQhHdtx8CNz86nJCwzv4Kis9xT0Kc7elmOU4g807SF78?=
 =?us-ascii?Q?xmbU0RyTVFjD7Ub8PnpToXKQbZxXEWEGdmiaq6cMn/JnGnEXQ+/J8/dodd7X?=
 =?us-ascii?Q?22xAVkRHkVH+QHN5uex7UX0VfRQD4disucK3AxUux/glwHYDqzquE+yS07n/?=
 =?us-ascii?Q?MHsjszxhuFbaegNb6O4QI1i94xGHzcIwZy/Nxduq5CfPmmKQK/yRfLPJGNyK?=
 =?us-ascii?Q?XtvD2qBfyULjyaGkjMhfDkE6p6n/o+UbA2qg59u3sf9Vs5nIbVragDuKaXhD?=
 =?us-ascii?Q?lgcuS3JZg+7LmHI8dT1+Cjmy2ZmL1fEASLyfdQIvqO1OihNkaYh/qM3N40w8?=
 =?us-ascii?Q?w9FBv/knWNldmozE1yEb9N4ntM8IPopoXi2VhAGn66Qd8dpV7VuyhMRe3BQm?=
 =?us-ascii?Q?+coWj6VG0ID5B0G/QdE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcba85ed-5053-4a7f-6b6b-08d9f030434f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 03:07:12.7541 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rsMjT+NKVafF6wj0eSmSkxP2qns9FjNxDlk7+jd3zB2NtdGpPjkFSJ78g+L0IZAv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1669
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
Cc: Sasha Levin <sashal@kernel.org>, David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "1005005@bugs.debian.org" <1005005@bugs.debian.org>, "Tuikov,
 Luben" <Luben.Tuikov@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, Dominique Dumont <dod@debian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only]



> -----Original Message-----
> From: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com> On Behalf
> Of Salvatore Bonaccorso
> Sent: Sunday, February 13, 2022 2:24 AM
> To: Deucher, Alexander <Alexander.Deucher@amd.com>
> Cc: Dominique Dumont <dod@debian.org>; 1005005@bugs.debian.org;
> Tuikov, Luben <Luben.Tuikov@amd.com>; Quan, Evan
> <Evan.Quan@amd.com>; Sasha Levin <sashal@kernel.org>; Koenig, Christian
> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David
> Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; amd-
> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-
> kernel@vger.kernel.org
> Subject: Regression from 3c196f056666 ("drm/amdgpu: always reset the asic
> in suspend (v2)") on suspend?
>=20
> Hi Alex, hi all
>=20
> In Debian we got a regression report from Dominique Dumont, CC'ed in
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugs
> .debian.org%2F1005005&amp;data=3D04%7C01%7Cevan.quan%40amd.com%7
> C735917b6e3f44fc8fda808d9ee54cbc0%7C3dd8961fe4884e608e11a82d994e1
> 83d%7C0%7C0%7C637802870862664095%7CUnknown%7CTWFpbGZsb3d8eyJ
> WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%
> 7C3000&amp;sdata=3D6xECB3MmvNYuOn41ZOEDPyWUjklY%2Bfxumz7lf8fijwA
> %3D&amp;reserved=3D0 that afer an update to 5.15.15 based kernel, his
> machine noe longer suspends correctly, after screen going black as usual =
it
> comes back. The Debian bug above contians a trace.
>=20
> Dominique confirmed that this issue persisted after updating to 5.16.7
> furthermore he bisected the issue and found
>=20
> 	3c196f05666610912645c7c5d9107706003f67c3 is the first bad commit
> 	commit 3c196f05666610912645c7c5d9107706003f67c3
> 	Author: Alex Deucher <alexander.deucher@amd.com>
> 	Date:   Fri Nov 12 11:25:30 2021 -0500
>=20
> 	    drm/amdgpu: always reset the asic in suspend (v2)
>=20
> 	    [ Upstream commit daf8de0874ab5b74b38a38726fdd3d07ef98a7ee ]
>=20
> 	    If the platform suspend happens to fail and the power rail
> 	    is not turned off, the GPU will be in an unknown state on
> 	    resume, so reset the asic so that it will be in a known
> 	    good state on resume even if the platform suspend failed.
>=20
> 	    v2: handle s0ix
>=20
> 	    Acked-by: Luben Tuikov <luben.tuikov@amd.com>
> 	    Acked-by: Evan Quan <evan.quan@amd.com>
> 	    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> 	    Signed-off-by: Sasha Levin <sashal@kernel.org>
>=20
> 	 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 5 ++++-
> 	 1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> to be the first bad commit, see
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugs
> .debian.org%2F1005005%2334&amp;data=3D04%7C01%7Cevan.quan%40amd.c
> om%7C735917b6e3f44fc8fda808d9ee54cbc0%7C3dd8961fe4884e608e11a82d
> 994e183d%7C0%7C0%7C637802870862664095%7CUnknown%7CTWFpbGZsb3
> d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0
> %3D%7C3000&amp;sdata=3DCV%2FKmpYT8WOVJnrTiU91godaFDJMpjih%2FAV
> NAcw5qaI%3D&amp;reserved=3D0 .
I checked the back trace posted there(below). It seems the error occurred d=
uring amdgpu_device_suspend().=20
That means Alex's patch should not be related(as it affected only those log=
ic after amdgpu_device_suspend()).=20
So we might got a wrong regression point here.
[  257.842851]  ? vi_common_set_clockgating_state+0x229/0x2f0 [amdgpu]
[  257.843356]  amdgpu_device_ip_suspend_phase1+0x5e/0xc0 [amdgpu]
[  257.843771]  amdgpu_device_suspend+0x62/0xc0 [amdgpu]
[  257.844184]  amdgpu_pmops_suspend+0x36/0x70 [amdgpu]
[  257.844631]  pci_pm_suspend+0x71/0x160
[  257.844643]  ? pci_pm_freeze+0xb0/0xb0

BR
Evan
>=20
> Does this ring any bell? Any idea on the problem?
>=20
> Regards,
> Salvatore
