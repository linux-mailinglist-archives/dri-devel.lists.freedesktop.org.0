Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2424C6C2404
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 22:42:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A49D10E00E;
	Mon, 20 Mar 2023 21:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2046.outbound.protection.outlook.com [40.107.92.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2069C10E00E;
 Mon, 20 Mar 2023 21:42:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FqQMH0Lv84EuFh6XLtmuYodQmIxJNRa08XTMqcq9OG67bKUZhpAa9j7hgpPaWerRQXHofChPKwXq/JRtwXjIOS7XSpB1woqtzq5H35Puxzq2aFHYZ5f0z9iq8Bm6jHtYU+fvEXc0HhU614NsYA84x1JNzmBc3g7Bew8gv+rtSlERAk3QMc9OJ/8k2Szbvshr1jq3xEeU1xCP/ulSV9aDVw4w7us7LrRQ5shA3qi7Jd3mF7B1UAL/cQFXn3Z+TWKkgnjfsvTuCRo/eZGGwTIkyhEaa9/EpnHRzu/rSAOHuyjW3p49f1LvyqfgTGGGuAjKRD+BDm3qN9ByVW/vcKOSog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4FKwuk7iswStsysni1tFAVs8dKSEqt2NxPorL00Quk=;
 b=EwaDnRwWYbVABVW6vW0jOu8SEvitMD0ykBPSVR4BWlAPYESCokc5avac20DzwQdnlpuBCF515QSFUC8EL7vsX3myOOQbctjbO01JapfE/dn7tQEl7woRgtLBZsJq3jRkBHd2pdWQeoI+qlupvMPUnhS43UyaZXLx0Z8PFUf6SWdt/w2v1M1QPejQyizI0aSeDdDD8IG3S4ZFM/tWorfq4MXz64SW6jL9l3tq5ncgwYbAhI3FrN4Uxv0keNS4ZWeMaMt41Ne2h77Jp6xT9XZC7/VLygg6hFfvnJd9aNpqU0lzfAK8+8Hkw7Z3qCkhJqNzwjL8DhRIcubi9yismRfj/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4FKwuk7iswStsysni1tFAVs8dKSEqt2NxPorL00Quk=;
 b=P6gT6FdrTu/hoQ7DROfo+ecDQAdwX6g6EYkNA2GCD/WxJGrfmC2oG2X/2TNY5YjP1zq9BErKg+M7jPR8VrAaqskw6584pEDQLwPLaXZ60v1MdfjvnkhxEw1N+FWMRan9MO5qePHjUFW5tWMmHEY6zfBaJk949Q8bcdHmnaOjpyc=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by BL1PR12MB5876.namprd12.prod.outlook.com (2603:10b6:208:398::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 21:42:37 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a4e:62dd:d463:5614]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a4e:62dd:d463:5614%9]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 21:42:37 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>
Subject: RE: [PATCH v2] drm/amdgpu/nv: Apply ASPM quirk on Intel ADL + AMD Navi
Thread-Topic: [PATCH v2] drm/amdgpu/nv: Apply ASPM quirk on Intel ADL + AMD
 Navi
Thread-Index: AQHZVzck/ItsispBG0ifZfMyjJp9ZK8EO0Iw
Date: Mon, 20 Mar 2023 21:42:36 +0000
Message-ID: <MN0PR12MB6101AC459C9DBBCC4837B7B3E2809@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <20230315120726.427486-1-kai.heng.feng@canonical.com>
In-Reply-To: <20230315120726.427486-1-kai.heng.feng@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-03-20T21:42:34Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=e371d595-2451-4702-9443-fd2d8c371eef;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2023-03-20T21:42:34Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 8e16cb42-0283-4b72-96f6-0fa088e91082
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|BL1PR12MB5876:EE_
x-ms-office365-filtering-correlation-id: ab5d5fbf-1f5c-46fe-3322-08db298c0582
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +qr4Js+d4XYiImtBqbOCIQmZW0H4pwtvGRyUW/VKk6WaF+i04/5OgUC2ubbFQ/kJ9TjDsuNRdqky9xjqDM9OfXoHyiFUGk/FdobODSTg/RljDA953GBTOhUCkCE6Rl1lLI1hdPrwztwf4n0RWGiAg7kH1iQzD/6hSsv8L0Ld0ouHcmsfkg1T4ZYRBAGIUzoONJ8dWLrTUsdUCkfBx0yejK7ULwaAEfzvUSXuqWFXwi7XNrIajqZfOKoyvEu+O0rLyzWe5rNFlwT5yh4fY8Bl9YjwcqwoPrWgHEcoVinNm9TUtdhmsIYSyzdCqki5KS5lpe3E+AmLJF1Q5QmPzvhBpiw17THDUuhc7KAW1gSlbys6IaeZakrq9mkOok57pbFG5bVdwgJQhGqn7ZL7mpai93v5bKJvKFDJBUoBEGsPXJnxM2dEO/IlDSPGTDlSfCtvwA/RZwsXvdtC3ZjoitzhA9oC6O0oF1bGPtzxrGNssDckLz8HIxE5YORYwuS9WW0q3q1e3T813+oTgnnRtPMr4VSPMmLbqd88DnJpdOA+0VEDJcz3/q+HmKgJaHnbYB8LjxVbPfF9AK09kQsakqMtEskbw+8dsrZknCWK4+ZyPOPRQHlQVq1lOQq71IITlW/TuAEmLG/2zt2k1hx35zrGRA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(366004)(346002)(39860400002)(376002)(396003)(451199018)(966005)(7696005)(33656002)(26005)(5660300002)(86362001)(6506007)(71200400001)(53546011)(478600001)(316002)(6636002)(186003)(9686003)(110136005)(83380400001)(54906003)(76116006)(64756008)(66446008)(66476007)(66556008)(38070700005)(4326008)(8676002)(41300700001)(52536014)(8936002)(38100700002)(66946007)(2906002)(122000001)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1Q3m4JYyrQLrr/+LRS2mNZD0dKfrhEVBSh7zeDQmscpPUnwDMofH4/1oKpmp?=
 =?us-ascii?Q?g77d3weAjtwkpHjrA5vvofK9/Sf1+N4t0hQAZIysIUTDj5n/0NkpSahCoiqK?=
 =?us-ascii?Q?7rn19NDX8BfHmuZKAaez2tVs5XucIH2deqgSray3sZj9V2VoY0TQAK9o3tnL?=
 =?us-ascii?Q?8Jl8ewDFPt/TP9xdtsY1yP0AUPJs++/JBm+55y+0a0/VP59rDJKCNrvZMEyr?=
 =?us-ascii?Q?ExQzCPQh7Wg5lJGky4jYX06zg6e3XKC0okLN00y6D9P6zcF9PyudGac9gbMG?=
 =?us-ascii?Q?tUkxc7faQ5ixX8VIWBmASxBVPEF6xk4P1gJjCB1rSZDYZPWpcYOHLpZbJE4E?=
 =?us-ascii?Q?BdQiBu9cRiW1HsZSZUgkEHRFsA7QDThxIDOzMCgFe3jF9A9m8BHwBd6ZtTAf?=
 =?us-ascii?Q?qkmq+oT7fRhkG/09bW2m1IWMuNJjSPfu9N6JX6JRNbhOEmm3fjA14UfC4b2k?=
 =?us-ascii?Q?UkHbNtWBS6E9H3EQWhrwnHERNgvy4L1UOYZ+HS3s8m8boZiqZZFhTmVn7FY4?=
 =?us-ascii?Q?7ayOVbQwakHDeEnTlbgkmt83vjfP8zZLuZfvytIictJ0cNMkkwJDh1CBS5Ih?=
 =?us-ascii?Q?Rw2a92EMxNIWQn/8b0EcfwjR/dg/BKwNWr1UzV8YR2LFKThgMah8CbJPg5K6?=
 =?us-ascii?Q?oiUDMDQDEQRTLMp3UBbDva/XYkEORYnWPE1JupWv3p/TPpx0gs5CJz8wOC3c?=
 =?us-ascii?Q?JjYPZJHkBvb44vK9xgUXjWstlwEeyR+Q4vxlS3DeKEG9Z9B0xFEb1qpBxEX3?=
 =?us-ascii?Q?8eLSzmgu9RVQ+vJrRBd+seFDbjzDfbbN03hK+EM0qKX//Fh3yX4FWuKDrnuY?=
 =?us-ascii?Q?cN0o3mf8U5DMzVkj/1b1S8T5de1CZfZ2GAa4pf/kp3OTUiNKakdGrN5yD6Ga?=
 =?us-ascii?Q?8GJZ2Q212MWTR69ixnsh3zqL9LWko+9KJJu9cxkPfAhxUDx4mkSzI0JKGFnX?=
 =?us-ascii?Q?LC/fMCh7gz/59pjo7DbeG9o6o1GN99TWKa0RNf4E6gcTRkbkrtTGo+Dki/il?=
 =?us-ascii?Q?+AA0e46P6I0tavDFAvidXPhj/MYyUXgDPkxAIy45jkRjQV6I5d0SwYRt86A/?=
 =?us-ascii?Q?zX02Z9ypRDU8zX81zDyzZRDuHpuGvK3kqeBrcqJ8ErVBQaa8Ffhbg44Qg73u?=
 =?us-ascii?Q?Iq65gww1o99LAIkUIR68QKoc0aTM9Va2GJKBWPCefWRGC4YjD1rIhNd3uXOy?=
 =?us-ascii?Q?tIlEbCB6mb8fLBPbI+8jIOmwJY0GkWcV1Zc90whbEvSBnDXKr1imhJ+L06P+?=
 =?us-ascii?Q?WvpYg24JFy0waYLqasJgkGFNKCU/y0rsqLLwzK653ogdGPJFX1oks4gqxabp?=
 =?us-ascii?Q?w7fNDiY8lyE+JdTMdcyRqmQDriGdWoIAMZc6JAfGcvTdx189z12VU9iXal9L?=
 =?us-ascii?Q?8lVhgmo6VKuLYebmwJi/YLTdG3exhU/pXtzlnbvnZuKoMO3ITdEkCjy1onh3?=
 =?us-ascii?Q?mciKDEH2Bzm6p4mnNbzDOjVMI2kXdNjAwJE3s5KOutNdfJ6hgZ9sewILk17v?=
 =?us-ascii?Q?dSNwQ7b34jFRALYpPiAWnAW3q4siwIaI8fz/ZQvKsR/5aPR5kcw/E2uKVfZ0?=
 =?us-ascii?Q?6Rr7eb9K0646G3MYCVk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab5d5fbf-1f5c-46fe-3322-08db298c0582
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2023 21:42:36.7010 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z604kJ9SLs5sM8EB8FMEW3mw2aCCd/27Id9rhI/FM5ejVrPI8U6aIGxU7gNLLGczy3ShD+4/Hc6CPDwS6dXA8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5876
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
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>, "Xiao,
 Jack" <Jack.Xiao@amd.com>, "Lazar, Lijo" <Lijo.Lazar@amd.com>, "Liu,
 Leo" <Leo.Liu@amd.com>, "Somalapuram,
 Amaranath" <Amaranath.Somalapuram@amd.com>, "Gong,
 Richard" <Richard.Gong@amd.com>, "Zhang, Bokun" <Bokun.Zhang@amd.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Zhao,
 Victor" <Victor.Zhao@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Chai,
 Thomas" <YiPeng.Chai@amd.com>, Jiansong Chen <Jiansong.Chen@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Gopalakrishnan, 
 Veerabadhran \(Veera\)" <Veerabadhran.Gopalakrishnan@amd.com>, "Gao,
 Likun" <Likun.Gao@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>, "Feng,
 Kenneth" <Kenneth.Feng@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]



> -----Original Message-----
> From: Kai-Heng Feng <kai.heng.feng@canonical.com>
> Sent: Wednesday, March 15, 2023 07:07
> To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>
> Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>; David Airlie
> <airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>; Zhang, Hawking
> <Hawking.Zhang@amd.com>; Gao, Likun <Likun.Gao@amd.com>; Kuehling,
> Felix <Felix.Kuehling@amd.com>; Zhao, Victor <Victor.Zhao@amd.com>;
> Xiao, Jack <Jack.Xiao@amd.com>; Quan, Evan <Evan.Quan@amd.com>;
> Limonciello, Mario <Mario.Limonciello@amd.com>; Lazar, Lijo
> <Lijo.Lazar@amd.com>; Chai, Thomas <YiPeng.Chai@amd.com>; Andrey
> Grodzovsky <andrey.grodzovsky@amd.com>; Somalapuram, Amaranath
> <Amaranath.Somalapuram@amd.com>; Zhang, Bokun
> <Bokun.Zhang@amd.com>; Liu, Leo <Leo.Liu@amd.com>; Gopalakrishnan,
> Veerabadhran (Veera) <Veerabadhran.Gopalakrishnan@amd.com>; Gong,
> Richard <Richard.Gong@amd.com>; Feng, Kenneth
> <Kenneth.Feng@amd.com>; Jiansong Chen <Jiansong.Chen@amd.com>;
> amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-
> kernel@vger.kernel.org
> Subject: [PATCH v2] drm/amdgpu/nv: Apply ASPM quirk on Intel ADL + AMD
> Navi
>=20
> S2idle resume freeze can be observed on Intel ADL + AMD WX5500. This is
> caused by commit 0064b0ce85bb ("drm/amd/pm: enable ASPM by default").
>=20
> The root cause is still not clear for now.
>=20
> So extend and apply the ASPM quirk from commit e02fe3bc7aba
> ("drm/amdgpu: vi: disable ASPM on Intel Alder Lake based systems"), to
> workaround the issue on Navi cards too.
>=20
> Fixes: 0064b0ce85bb ("drm/amd/pm: enable ASPM by default")
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2458
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

I've applied to this to amd-staging-drm-next, thanks!

> ---
> v2:
>  - Rename the quirk function.
>=20
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 15 +++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/nv.c            |  2 +-
>  drivers/gpu/drm/amd/amdgpu/vi.c            | 17 +----------------
>  4 files changed, 18 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 164141bc8b4a..5f3b139c1f99 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1272,6 +1272,7 @@ void amdgpu_device_pci_config_reset(struct
> amdgpu_device *adev);
>  int amdgpu_device_pci_reset(struct amdgpu_device *adev);
>  bool amdgpu_device_need_post(struct amdgpu_device *adev);
>  bool amdgpu_device_should_use_aspm(struct amdgpu_device *adev);
> +bool amdgpu_device_aspm_support_quirk(void);
>=20
>  void amdgpu_cs_report_moved_bytes(struct amdgpu_device *adev, u64
> num_bytes,
>  				  u64 num_vis_bytes);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index c4a4e2fe6681..05a34ff79e78 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -80,6 +80,10 @@
>=20
>  #include <drm/drm_drv.h>
>=20
> +#if IS_ENABLED(CONFIG_X86)
> +#include <asm/intel-family.h>
> +#endif
> +
>  MODULE_FIRMWARE("amdgpu/vega10_gpu_info.bin");
>  MODULE_FIRMWARE("amdgpu/vega12_gpu_info.bin");
>  MODULE_FIRMWARE("amdgpu/raven_gpu_info.bin");
> @@ -1356,6 +1360,17 @@ bool amdgpu_device_should_use_aspm(struct
> amdgpu_device *adev)
>  	return pcie_aspm_enabled(adev->pdev);
>  }
>=20
> +bool amdgpu_device_aspm_support_quirk(void)
> +{
> +#if IS_ENABLED(CONFIG_X86)
> +	struct cpuinfo_x86 *c =3D &cpu_data(0);
> +
> +	return !(c->x86 =3D=3D 6 && c->x86_model =3D=3D INTEL_FAM6_ALDERLAKE);
> +#else
> +	return true;
> +#endif
> +}
> +
>  /* if we get transitioned to only one device, take VGA back */
>  /**
>   * amdgpu_device_vga_set_decode - enable/disable vga decode
> diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c
> b/drivers/gpu/drm/amd/amdgpu/nv.c
> index 855d390c41de..26733263913e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/nv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/nv.c
> @@ -578,7 +578,7 @@ static void nv_pcie_gen3_enable(struct
> amdgpu_device *adev)
>=20
>  static void nv_program_aspm(struct amdgpu_device *adev)
>  {
> -	if (!amdgpu_device_should_use_aspm(adev))
> +	if (!amdgpu_device_should_use_aspm(adev) ||
> !amdgpu_device_aspm_support_quirk())
>  		return;
>=20
>  	if (!(adev->flags & AMD_IS_APU) &&
> diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c
> b/drivers/gpu/drm/amd/amdgpu/vi.c
> index 12ef782eb478..ceab8783575c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vi.c
> @@ -81,10 +81,6 @@
>  #include "mxgpu_vi.h"
>  #include "amdgpu_dm.h"
>=20
> -#if IS_ENABLED(CONFIG_X86)
> -#include <asm/intel-family.h>
> -#endif
> -
>  #define ixPCIE_LC_L1_PM_SUBSTATE	0x100100C6
>  #define
> PCIE_LC_L1_PM_SUBSTATE__LC_L1_SUBSTATES_OVERRIDE_EN_MASK
> 	0x00000001L
>  #define PCIE_LC_L1_PM_SUBSTATE__LC_PCI_PM_L1_2_OVERRIDE_MASK
> 	0x00000002L
> @@ -1138,24 +1134,13 @@ static void vi_enable_aspm(struct
> amdgpu_device *adev)
>  		WREG32_PCIE(ixPCIE_LC_CNTL, data);
>  }
>=20
> -static bool aspm_support_quirk_check(void)
> -{
> -#if IS_ENABLED(CONFIG_X86)
> -	struct cpuinfo_x86 *c =3D &cpu_data(0);
> -
> -	return !(c->x86 =3D=3D 6 && c->x86_model =3D=3D INTEL_FAM6_ALDERLAKE);
> -#else
> -	return true;
> -#endif
> -}
> -
>  static void vi_program_aspm(struct amdgpu_device *adev)
>  {
>  	u32 data, data1, orig;
>  	bool bL1SS =3D false;
>  	bool bClkReqSupport =3D true;
>=20
> -	if (!amdgpu_device_should_use_aspm(adev) ||
> !aspm_support_quirk_check())
> +	if (!amdgpu_device_should_use_aspm(adev) ||
> !amdgpu_device_aspm_support_quirk())
>  		return;
>=20
>  	if (adev->flags & AMD_IS_APU ||
> --
> 2.34.1
