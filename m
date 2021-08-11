Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D0A3E9A24
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 23:01:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 856316E1BA;
	Wed, 11 Aug 2021 21:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2052.outbound.protection.outlook.com [40.107.94.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83DAA6E1BA;
 Wed, 11 Aug 2021 21:01:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SmWKif3e2bWwfARnjAJUx5QwNWbwU//fwkcAvFDBB/0lnhoIAwiNT8SERmhIFR/WeuF+vrLrrSPZniDXL0Zj5Lcya47MWlqYjpPGVZDmkI6CPv2wlONYfh4YIGVgn9SWFgLBYF4XOdbr6yo8mCv1puzFoaPj5VpBImfeA5grujekmP5dUZum3J9geeq4+xOfo2foZCbQW2NHL2jHDtPwCZtXU880oUei9rFqlukVc2pvbIpzY4qdgVB5f4zjzSJQzKmD+PthMcfpVekSnIAwyQHDKgsMn01hMuCg+vw3edymqJ+1FT8zd/UQdvJRyESNSHUtWw/zmQzygstp1bADHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W71UdpShmeVVAcTJUwt9mRQpUaDE2XRg6meRBoAqCRw=;
 b=FEAXvc3F5aivxzcVoQHJNjKtCoxvOaPhsnl2kDEb7Mmw7pxQMDLXOmXgTDinxv1kD6W/qTVIBToBsgR/DzMEeDMzR7Orv4kkoFAsoE3RkBXO/4xr3BeX0XssAJMWa8kN+e3rVOptblobe3PS3/eqR0E1QivJ5HmeNLqaOGxI+zQgVWaA10MfkitDq81oR0RyFH01Cab8OzpQgiUyUVllKafgDDszkyg6rPpxTbakr17rOvdGVDspKPh/4jnSNfZGqVOzbXSldzVlinXxZa11xwRW51Xz5OkKr7xEwWRppMgxyUxUlCVwZZLawtfmJmyZM2tBzga3kGbdBbWb67X2oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W71UdpShmeVVAcTJUwt9mRQpUaDE2XRg6meRBoAqCRw=;
 b=hukcKA7cOHjptp2Ca+W4YJKtY9XwDPxhHuS3Jvngj3tLHyeH9jIi7Y11Oo5vNY9NzWrga3QfctK2f7BBJ3waSOvL18tzHyJysN3NkY2/CN2DDNMbiM/lVNgDoTVoZFS6jqQ481dsASetf47aOSwvgW2aU/sRkToU9z7d2zjY0SI=
Received: from DM5PR12MB2517.namprd12.prod.outlook.com (2603:10b6:4:bb::13) by
 DM5PR1201MB0089.namprd12.prod.outlook.com (2603:10b6:4:50::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.16; Wed, 11 Aug 2021 21:00:59 +0000
Received: from DM5PR12MB2517.namprd12.prod.outlook.com
 ([fe80::2560:34ab:f08a:3248]) by DM5PR12MB2517.namprd12.prod.outlook.com
 ([fe80::2560:34ab:f08a:3248%3]) with mapi id 15.20.4394.023; Wed, 11 Aug 2021
 21:00:59 +0000
From: "Zhu, James" <James.Zhu@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, =?iso-8859-1?Q?Michel_D=E4nzer?=
 <michel@daenzer.net>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Liu, Leo" <Leo.Liu@amd.com>, amd-gfx list
 <amd-gfx@lists.freedesktop.org>, Maling list - DRI developers
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amdgpu: Use mod_delayed_work in JPEG/UVD/VCE/VCN
 ring_end_use hooks
Thread-Topic: [PATCH 2/2] drm/amdgpu: Use mod_delayed_work in JPEG/UVD/VCE/VCN
 ring_end_use hooks
Thread-Index: AQHXjtE+3YKNVwRF7EO/RHavM7ObqatuwtSAgAAHOlY=
Date: Wed, 11 Aug 2021 21:00:59 +0000
Message-ID: <DM5PR12MB25172575812C5914F2A640F1E4F89@DM5PR12MB2517.namprd12.prod.outlook.com>
References: <20210811165211.6811-1-michel@daenzer.net>
 <20210811165211.6811-2-michel@daenzer.net>,
 <CADnq5_OhcTdPNnHU_9iY73H-dxhnjq6igy7NvHw1AeknEXkeYg@mail.gmail.com>
In-Reply-To: <CADnq5_OhcTdPNnHU_9iY73H-dxhnjq6igy7NvHw1AeknEXkeYg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=True;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-08-11T21:00:58.561Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use
 Only; MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard; 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c41455e9-15f0-4559-1aba-08d95d0b1ed0
x-ms-traffictypediagnostic: DM5PR1201MB0089:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1201MB00892F2C6D40584FBB0F9B61E4F89@DM5PR1201MB0089.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VEPsJ8zX88MS51rxLV7BpBQe7ReDLjF9sWHF5clDYOY56WjIm5FSHk/fwXecqE1+s2lOHp1uIp5RdqKqa3L50bawCRT7mQxWwFbDdC33pkpOwxzgDbZMHWglXmNXkK9h0SZ3R0EcpoaelQIdBnBwaLU6R6FKTUgoM9bbaAZJvFc7C8byQZ0QUwVhLdNOCDacwAHGAzcvkJztJpnz+/pxQ8g1LvlLsVjou/W+D55zoj9nc6OMre3G+iyttetlbAQEx8n8z8cIJHFm/L432mlUMN+3GD7iqQ4X3T1oMrbOsQjZ3o+B3XFIV8v/RWCn8XjuVltcSXmrMfgaKNzzsLp5uk+xMlYl5QiDSLmYVbR75fBU3mDtoqohOHF8CZ+MSQw3vRsEb41rx35JguJsOugwIn+d90iIJV7aD3XkDukwtsCJoT1X4AzEA28cTqJ3GVujsNAwZPopWdkvi4FkaAr21zuuBGAXWp2YfHclDKbZSJ/NUZuRPPQGnGmm7jdINXZW+9TQjPMw9l6/UQif1p+t3weM3xwRbNZmWvhzqG8HeqezuZMrU6bkP8Q/ByoITLO9XfdxPcmC66GdH87IHZx2xRnUZyrhdF6b/U0ThqXHG0X1hIeQrtLoJpqTTSKaKDAATZ7riSJOkinyW+87G7tSwFMd43NEH7fhJ/DdMmhA6jlCIqin/ryvhgdg4ns4Xpi5EbClvaldpxEKTOelbsEPHA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2517.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(5660300002)(33656002)(316002)(38070700005)(71200400001)(64756008)(66476007)(66446008)(66556008)(66946007)(19627405001)(52536014)(54906003)(38100700002)(122000001)(86362001)(110136005)(7696005)(76116006)(55016002)(8936002)(8676002)(91956017)(6506007)(53546011)(508600001)(4326008)(186003)(26005)(9686003)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?/5+96f7QdeQqmfjxGWiyvUU18EHBJNrmCprteCoR4TDE8xuUvVvhFi4NtF?=
 =?iso-8859-1?Q?KJx3MfY/ic1LLslxCJR3AontnHChhXtdpsbXmPdnZLMKg2v2cS7aWTEgIX?=
 =?iso-8859-1?Q?L+5KUKYABFLQPttrHU5ugr+VDp97P3wmrtUOBfXrXJaY5xRg2S5wK6KCTI?=
 =?iso-8859-1?Q?VbdLlPWt/FLlCHSVtUTmp0RuGfQBzB2RcJqWBa6jX0iTu4/zlnRXT/Jxvz?=
 =?iso-8859-1?Q?xXeFGJMGxKogAYjbSBHoqJQV2YnNhhyRBG3+9mlVTqquR4EbLVd2/xdaV+?=
 =?iso-8859-1?Q?7TbkvBBFhTnkBUVlApXw6NIke79idI8G/JC19DS9TQeKtVTVLyU7i4z2cp?=
 =?iso-8859-1?Q?rZY/msP0pAEyl3m9ierCq/0iyQwRvZ3ifjENDf9mcbT3E2iW/E5IrjWONJ?=
 =?iso-8859-1?Q?Qmdmjri4nDM2vshQCMhKf8KpVu+HR++/QeRfpe7b0nAILGYctWTJw5XpSH?=
 =?iso-8859-1?Q?xgEYxbjy/LvhcnjlAyygDJau93soYQYd/+pOw5V832fReNJPhqiPGIPvUh?=
 =?iso-8859-1?Q?jljBXE9XlbWG3TDWAMMjniZAGmMuzKS9ek4q+i64QLrtPbsqDVHWhlfaeo?=
 =?iso-8859-1?Q?9GtfaJtnWgnWxgsqDltK52N68TZ2o8UCavS4ydv+OGKqmPATTDszcyxomb?=
 =?iso-8859-1?Q?wY9qwfAwCeP16VgOXUqB4KVs3RQjZeVPhTs1XsurjoOMSSuTe1HmfJOaAW?=
 =?iso-8859-1?Q?39XXPQX4r5UqBvFE7fqm3y/YMynVTr+KJDpT6s+x6TAZsUGh+EY839aZxX?=
 =?iso-8859-1?Q?ESzR7WSBKBuxWp4uCaaxrdOv8NO78zAf1UE2bO144y3bjOw7e4Rxj4Q71J?=
 =?iso-8859-1?Q?GxXPqcnVWVOpqy7EhBSbsrln25yENb2kxQxVaV9MU4V7Iqsv57OcJW+FMa?=
 =?iso-8859-1?Q?rkcC+ViPhFOALZHOKlcXd0UiHM/GyKHNsauy0YPbUdw8D9dCeZOAovlj9V?=
 =?iso-8859-1?Q?Pz6BUB8pL+p8HQHMMv9GpquH4aAdbPhsQY6/C5mgXLqT/6xLJTTnAl2b0i?=
 =?iso-8859-1?Q?77G29UURfNY89jnyo5SdEOFMT+2tiIeTWEjISWm5ZBYcfcXLwCRJRh1mFe?=
 =?iso-8859-1?Q?2dGyNfd26cnMnWn/rtFaZGehqmzOfsxV4AiOeh0GdyLfDx2CecZ+GewGX6?=
 =?iso-8859-1?Q?V+zznxfk7VyQqwhlFqshpmLgQbQZf0a+KZ3XRhlt2Irx7/trXTeFCsoaOa?=
 =?iso-8859-1?Q?IE83qAGQUMxAs+x1UYIVaoAjpWK7Xf9Eop1ZBnpo8aoZpKg3YagFFUMJd7?=
 =?iso-8859-1?Q?it9OkaytXCIcewQj/6hyAwmYQ262q5hv/47p9P2FQlK3VFPqvDKb7nLGVF?=
 =?iso-8859-1?Q?ZBAHnwI3GYA5aOpESmlZHljPLnaQaUQWrGEF59cRFaf/6oCOxuTWpxWsNe?=
 =?iso-8859-1?Q?LHMhHa6E29?=
Content-Type: multipart/alternative;
 boundary="_000_DM5PR12MB25172575812C5914F2A640F1E4F89DM5PR12MB2517namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2517.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c41455e9-15f0-4559-1aba-08d95d0b1ed0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2021 21:00:59.1044 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZsIxHFoul/bMmvRXJfJg/XCx9Dm0VII27hUD4KNZ84IhcOQW4x4XZBXGqqVwy/tX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0089
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_DM5PR12MB25172575812C5914F2A640F1E4F89DM5PR12MB2517namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]

This patch is Reviewed-by: James Zhu <James.Zhu@amd.com>


Thanks & Best Regards!


James Zhu

________________________________
From: Alex Deucher <alexdeucher@gmail.com>
Sent: Wednesday, August 11, 2021 4:34 PM
To: Michel D=E4nzer <michel@daenzer.net>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Chri=
stian.Koenig@amd.com>; Liu, Leo <Leo.Liu@amd.com>; Zhu, James <James.Zhu@am=
d.com>; amd-gfx list <amd-gfx@lists.freedesktop.org>; Maling list - DRI dev=
elopers <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amdgpu: Use mod_delayed_work in JPEG/UVD/VCE/V=
CN ring_end_use hooks

On Wed, Aug 11, 2021 at 12:52 PM Michel D=E4nzer <michel@daenzer.net> wrote=
:
>
> From: Michel D=E4nzer <mdaenzer@redhat.com>
>
> In contrast to schedule_delayed_work, this pushes back the work if it
> was already scheduled before. Specific behaviour change:
>
> Before:
>
> The scheduled work ran ~1 second after the first time ring_end_use was
> called, even if the ring was used again during that second.
>
> After:
>
> The scheduled work runs ~1 second after the last time ring_end_use is
> called.
>
> Inspired by the corresponding change in amdgpu_gfx_off_ctrl. While I
> haven't run into specific issues in this case, the new behaviour makes
> more sense to me.
>
> Signed-off-by: Michel D=E4nzer <mdaenzer@redhat.com>

Makes sense to me.  Applied the series.

Thanks!

Alex


> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c  | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c  | 2 +-
>  drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c    | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_jpeg.c
> index 8996cb4ed57a..2c0040153f6c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> @@ -110,7 +110,7 @@ void amdgpu_jpeg_ring_begin_use(struct amdgpu_ring *r=
ing)
>  void amdgpu_jpeg_ring_end_use(struct amdgpu_ring *ring)
>  {
>         atomic_dec(&ring->adev->jpeg.total_submission_cnt);
> -       schedule_delayed_work(&ring->adev->jpeg.idle_work, JPEG_IDLE_TIME=
OUT);
> +       mod_delayed_work(system_wq, &ring->adev->jpeg.idle_work, JPEG_IDL=
E_TIMEOUT);
>  }
>
>  int amdgpu_jpeg_dec_ring_test_ring(struct amdgpu_ring *ring)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_uvd.c
> index 0f576f294d8a..b6b1d7eeb8e5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> @@ -1283,7 +1283,7 @@ void amdgpu_uvd_ring_begin_use(struct amdgpu_ring *=
ring)
>  void amdgpu_uvd_ring_end_use(struct amdgpu_ring *ring)
>  {
>         if (!amdgpu_sriov_vf(ring->adev))
> -               schedule_delayed_work(&ring->adev->uvd.idle_work, UVD_IDL=
E_TIMEOUT);
> +               mod_delayed_work(system_wq, &ring->adev->uvd.idle_work, U=
VD_IDLE_TIMEOUT);
>  }
>
>  /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_vce.c
> index 1ae7f824adc7..2253c18a6688 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> @@ -401,7 +401,7 @@ void amdgpu_vce_ring_begin_use(struct amdgpu_ring *ri=
ng)
>  void amdgpu_vce_ring_end_use(struct amdgpu_ring *ring)
>  {
>         if (!amdgpu_sriov_vf(ring->adev))
> -               schedule_delayed_work(&ring->adev->vce.idle_work, VCE_IDL=
E_TIMEOUT);
> +               mod_delayed_work(system_wq, &ring->adev->vce.idle_work, V=
CE_IDLE_TIMEOUT);
>  }
>
>  /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c b/drivers/gpu/drm/amd/=
amdgpu/vcn_v1_0.c
> index 284bb42d6c86..d5937ab5ac80 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
> @@ -1874,7 +1874,7 @@ void vcn_v1_0_set_pg_for_begin_use(struct amdgpu_ri=
ng *ring, bool set_clocks)
>
>  void vcn_v1_0_ring_end_use(struct amdgpu_ring *ring)
>  {
> -       schedule_delayed_work(&ring->adev->vcn.idle_work, VCN_IDLE_TIMEOU=
T);
> +       mod_delayed_work(system_wq, &ring->adev->vcn.idle_work, VCN_IDLE_=
TIMEOUT);
>         mutex_unlock(&ring->adev->vcn.vcn1_jpeg1_workaround);
>  }
>
> --
> 2.32.0
>

--_000_DM5PR12MB25172575812C5914F2A640F1E4F89DM5PR12MB2517namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
This<span style=3D"color:#c0c0c0"> </span>patch<span style=3D"color:#c0c0c0=
"> </span>
is<span style=3D"color:#c0c0c0"> </span>Reviewed-by:<span style=3D"color:#c=
0c0c0"> </span>
James<span style=3D"color:#c0c0c0"> </span>Zhu<span style=3D"color:#c0c0c0"=
> </span>&lt;James.Zhu@amd.com&gt;<br>
</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; color=
:#000000; font-family:Calibri,Arial,Helvetica,sans-serif">
<p style=3D"margin-top: 0px; margin-bottom: 0px;">Thanks &amp; Best Regards=
!</p>
<p style=3D"margin-top: 0px; margin-bottom: 0px;"><br>
</p>
<p style=3D"margin-top: 0px; margin-bottom: 0px;">James Zhu<br>
</p>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alex Deucher &lt;alex=
deucher@gmail.com&gt;<br>
<b>Sent:</b> Wednesday, August 11, 2021 4:34 PM<br>
<b>To:</b> Michel D=E4nzer &lt;michel@daenzer.net&gt;<br>
<b>Cc:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Koenig, Ch=
ristian &lt;Christian.Koenig@amd.com&gt;; Liu, Leo &lt;Leo.Liu@amd.com&gt;;=
 Zhu, James &lt;James.Zhu@amd.com&gt;; amd-gfx list &lt;amd-gfx@lists.freed=
esktop.org&gt;; Maling list - DRI developers &lt;dri-devel@lists.freedeskto=
p.org&gt;<br>
<b>Subject:</b> Re: [PATCH 2/2] drm/amdgpu: Use mod_delayed_work in JPEG/UV=
D/VCE/VCN ring_end_use hooks</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Wed, Aug 11, 2021 at 12:52 PM Michel D=E4nzer &=
lt;michel@daenzer.net&gt; wrote:<br>
&gt;<br>
&gt; From: Michel D=E4nzer &lt;mdaenzer@redhat.com&gt;<br>
&gt;<br>
&gt; In contrast to schedule_delayed_work, this pushes back the work if it<=
br>
&gt; was already scheduled before. Specific behaviour change:<br>
&gt;<br>
&gt; Before:<br>
&gt;<br>
&gt; The scheduled work ran ~1 second after the first time ring_end_use was=
<br>
&gt; called, even if the ring was used again during that second.<br>
&gt;<br>
&gt; After:<br>
&gt;<br>
&gt; The scheduled work runs ~1 second after the last time ring_end_use is<=
br>
&gt; called.<br>
&gt;<br>
&gt; Inspired by the corresponding change in amdgpu_gfx_off_ctrl. While I<b=
r>
&gt; haven't run into specific issues in this case, the new behaviour makes=
<br>
&gt; more sense to me.<br>
&gt;<br>
&gt; Signed-off-by: Michel D=E4nzer &lt;mdaenzer@redhat.com&gt;<br>
<br>
Makes sense to me.&nbsp; Applied the series.<br>
<br>
Thanks!<br>
<br>
Alex<br>
<br>
<br>
&gt; ---<br>
&gt;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c | 2 +-<br>
&gt;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c&nbsp; | 2 +-<br>
&gt;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c&nbsp; | 2 +-<br>
&gt;&nbsp; drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c&nbsp;&nbsp;&nbsp; | 2 +-<b=
r>
&gt;&nbsp; 4 files changed, 4 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_jpeg.c<br>
&gt; index 8996cb4ed57a..2c0040153f6c 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c<br>
&gt; @@ -110,7 +110,7 @@ void amdgpu_jpeg_ring_begin_use(struct amdgpu_ring=
 *ring)<br>
&gt;&nbsp; void amdgpu_jpeg_ring_end_use(struct amdgpu_ring *ring)<br>
&gt;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; atomic_dec(&amp;ring-&=
gt;adev-&gt;jpeg.total_submission_cnt);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; schedule_delayed_work(&amp;ring-=
&gt;adev-&gt;jpeg.idle_work, JPEG_IDLE_TIMEOUT);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mod_delayed_work(system_wq, &amp=
;ring-&gt;adev-&gt;jpeg.idle_work, JPEG_IDLE_TIMEOUT);<br>
&gt;&nbsp; }<br>
&gt;<br>
&gt;&nbsp; int amdgpu_jpeg_dec_ring_test_ring(struct amdgpu_ring *ring)<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_uvd.c<br>
&gt; index 0f576f294d8a..b6b1d7eeb8e5 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c<br>
&gt; @@ -1283,7 +1283,7 @@ void amdgpu_uvd_ring_begin_use(struct amdgpu_rin=
g *ring)<br>
&gt;&nbsp; void amdgpu_uvd_ring_end_use(struct amdgpu_ring *ring)<br>
&gt;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!amdgpu_sriov_vf(r=
ing-&gt;adev))<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; schedule_delayed_work(&amp;ring-&gt;adev-&gt;uvd.idle_work,=
 UVD_IDLE_TIMEOUT);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; mod_delayed_work(system_wq, &amp;ring-&gt;adev-&gt;uvd.idle=
_work, UVD_IDLE_TIMEOUT);<br>
&gt;&nbsp; }<br>
&gt;<br>
&gt;&nbsp; /**<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_vce.c<br>
&gt; index 1ae7f824adc7..2253c18a6688 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c<br>
&gt; @@ -401,7 +401,7 @@ void amdgpu_vce_ring_begin_use(struct amdgpu_ring =
*ring)<br>
&gt;&nbsp; void amdgpu_vce_ring_end_use(struct amdgpu_ring *ring)<br>
&gt;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!amdgpu_sriov_vf(r=
ing-&gt;adev))<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; schedule_delayed_work(&amp;ring-&gt;adev-&gt;vce.idle_work,=
 VCE_IDLE_TIMEOUT);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; mod_delayed_work(system_wq, &amp;ring-&gt;adev-&gt;vce.idle=
_work, VCE_IDLE_TIMEOUT);<br>
&gt;&nbsp; }<br>
&gt;<br>
&gt;&nbsp; /**<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c b/drivers/gpu/drm/a=
md/amdgpu/vcn_v1_0.c<br>
&gt; index 284bb42d6c86..d5937ab5ac80 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c<br>
&gt; @@ -1874,7 +1874,7 @@ void vcn_v1_0_set_pg_for_begin_use(struct amdgpu=
_ring *ring, bool set_clocks)<br>
&gt;<br>
&gt;&nbsp; void vcn_v1_0_ring_end_use(struct amdgpu_ring *ring)<br>
&gt;&nbsp; {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; schedule_delayed_work(&amp;ring-=
&gt;adev-&gt;vcn.idle_work, VCN_IDLE_TIMEOUT);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mod_delayed_work(system_wq, &amp=
;ring-&gt;adev-&gt;vcn.idle_work, VCN_IDLE_TIMEOUT);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;ring=
-&gt;adev-&gt;vcn.vcn1_jpeg1_workaround);<br>
&gt;&nbsp; }<br>
&gt;<br>
&gt; --<br>
&gt; 2.32.0<br>
&gt;<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_DM5PR12MB25172575812C5914F2A640F1E4F89DM5PR12MB2517namp_--
