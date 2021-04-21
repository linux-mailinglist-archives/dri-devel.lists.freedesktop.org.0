Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F0B366F04
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 17:22:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD63F6E529;
	Wed, 21 Apr 2021 15:22:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3EF96E084;
 Wed, 21 Apr 2021 15:22:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tj915H8hHQK6vmwsleJbSszMBfGGHq/aZzN6kFfmlxLznRtZYgKLwO1Ej8HIVIjlpedylLAuFOKtUA7kmsY9wRTUF506E8dP9bJhs806b0Cc0eajeiVmqzxxaHmfXkfJDgI38Hmx2JqUhg24bpVe10YjX2VCfndaz5KEik/LFoN9MID5cplP5fDDZi5DY3wzrwlKa3nmZISljMS7tQPjl9xGU+WjNu35zV3+euOJnqhWmb4cEX56SIN35e2r7WCCoc8MtJqihDUO42uRl88wy+Kmb11CHunmOyQHTLd2IPEoM7mRsnsUE/GNhzFy2d2XVw6g2yaqHo2JI7Z+R/XukQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvmqSADZCw+WfmyrueDdBLDYHEH8+uT8rvkCufQUOxk=;
 b=YwyqsTUpsxIMPq6hQcTIhaVSLv8lBFHJPfVjXKEzlGTu4x1IKEsvpVnQ15CclBZwdUUYDwNi9JHtYt8o5vh1JNhVY1VGNDTvLkfmZOAQIPldwgfBnH7o8s5QIPjTABJ61jQifp5d0UHXCUc3m0FTleDw120dZDah5WJ6xCIG5usZGMTYldQEdcjG2FC7PiCjb9wGcR+GlXeSeCXMkmvMsSpBgzyCixF12OFKeRPUB5shqX9cyRe+yrVyqHIz63G2RWvsvV00cQX+j64g3cGDttsno5h8wOhabPNnZ4KUyO/ZFdqSBygWVOcz9ONVk6vZIfyD4PpSu/LebEeORlUE2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvmqSADZCw+WfmyrueDdBLDYHEH8+uT8rvkCufQUOxk=;
 b=RNA+SfaOMTX54tL32y/Fi0hEreljdQN8//o5mtbYAbRQCISW0zd7NFldNVBnzD2r89pmL3l3skXy2yRvyHZkYtmNY9gc/7ut+IfUyXXpaZCQIZg/R7ILQRcWSWujRnSzxIJB5wMXBseHBvwdYrGP2s0AlAw9KB5lrBrKLsn1jjE=
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by MN2PR12MB4256.namprd12.prod.outlook.com (2603:10b6:208:1d2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Wed, 21 Apr
 2021 15:22:09 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::3d98:cefb:476c:c36e]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::3d98:cefb:476c:c36e%8]) with mapi id 15.20.4042.024; Wed, 21 Apr 2021
 15:22:09 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Lipski, Mikita" <Mikita.Lipski@amd.com>, Lyude Paul <lyude@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, Jani
 Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Thierry Reding
 <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 01/20] drm/amdgpu: Add error handling to
 amdgpu_dm_initialize_dp_connector()
Thread-Topic: [PATCH v3 01/20] drm/amdgpu: Add error handling to
 amdgpu_dm_initialize_dp_connector()
Thread-Index: AQHXNW8jJ17pElopOk+USNSV1q/AEKq/COmAgAAQTAY=
Date: Wed, 21 Apr 2021 15:22:09 +0000
Message-ID: <MN2PR12MB44881474AB2AC26A83C8E968F7479@MN2PR12MB4488.namprd12.prod.outlook.com>
References: <20210419225523.184856-1-lyude@redhat.com>
 <20210419225523.184856-2-lyude@redhat.com>,
 <bf4f9c16-f5d7-214c-dbb7-08cb58cf6d7c@amd.com>
In-Reply-To: <bf4f9c16-f5d7-214c-dbb7-08cb58cf6d7c@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-04-21T15:22:08.647Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Distribution
 Only; MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard; 
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [192.161.79.245]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f6c2240f-c38d-4bf5-fd7a-08d904d93aea
x-ms-traffictypediagnostic: MN2PR12MB4256:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB425617FD6404C18F822780C0F7479@MN2PR12MB4256.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DdUcGSxbDwqAhWDrblwISoSSOJu213cvPLLTJ/6RcnTWwMCTBLL+4EXUEIUmdo8OATBfTV/Aw+1wlaCHuWljUAkptShWckWBMQBJa8khBVakezAAnC8CWtUonJleYDsyn2N9kH995HhRjSTxe5ddC7hSH3TAIcsYWLhgwrdcymAnHb/vLodFV4A0wuZeppqFmrUuT9syE/bk7S/1SfxSS2+Yq8LW15mFCuf8cK1n06n06jhAO5S/nP/eIlilDm9OF5ebTUlgU7U2soYiBzNecTh9lM8lGT/a04wHY2mzc4Sh5Txm7Ge1BAYxJ9/hooiiXWoJeYnvR2W8ZMCDyOfoEBmcdu/4kJaGopeOUn3OilNrC3FG1qthJdowVq5t/Z3/yEmJE5j5gG9HNLWlP3+8U3eIDLFGTcmBF3V8jaiDWAd/9TU5x79YoQNO09BTQ4nszIYVrkAA9CAeOjN3DKRaj1VjlRoY732BP20u3UpFmQccjimDek+jThHBKCOQhO69qF1mKTBUG1ENO3O1VPqmepWUPl1L1FERn5msZ/pqA7ZX8F0O9bj7Dp4bbad9uvxTrFxayGZ0IEz04LRJCpb+TVM4AteSaCR+lZEKKUsLJwGuG/ACnamwoT0U4BG5feA/QSyMlcJCGED1qPm5PpIANw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(366004)(376002)(39860400002)(7696005)(86362001)(83380400001)(110136005)(26005)(186003)(8676002)(66476007)(4326008)(7416002)(5660300002)(66946007)(6506007)(52536014)(64756008)(8936002)(54906003)(55016002)(316002)(9686003)(921005)(33656002)(66574015)(71200400001)(19627405001)(122000001)(76116006)(53546011)(66556008)(2906002)(478600001)(66446008)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?EtLehJcXmGIRM+ttFkPx/ByHAK1x422mhGuUgKRWCpyzvqY2IO7wyic+9V?=
 =?iso-8859-1?Q?C69Ghjb+EuEU3MsQoCRnHY2/ghvD5jGDYgSIaVXTx2Hl8T+Bow+74Ve0rI?=
 =?iso-8859-1?Q?h4S808T5Ghje65aL7BXQgr0xdagki0ztBfxBgXXVD2JZ6Qcp/jIC4vvsDL?=
 =?iso-8859-1?Q?o6itWF0KsfH8N1QczQFo+t57Vt6Y/4kgTrjZA6fLAKIV08NxvwT8Y9l07d?=
 =?iso-8859-1?Q?FrrXX+OuFnwmjPxFC22ScmtUcsLdNq494tDQ2X1v5kHqNZ7kMq/bWJ733Z?=
 =?iso-8859-1?Q?yOf0yXDXvQFodDngC0gjZevzlgT6Q8lE7mL7I3nN/9HS0iX2sQgQ5IAJpi?=
 =?iso-8859-1?Q?19GlMgQuSNpmdyAchTtSAOKFJ2defmCUC9IFMFrfc3+OPYC75mlw/2P6ek?=
 =?iso-8859-1?Q?GNZga9E3Kj6IJKmQe3C6xZQGddbWV+3O0aEo61JVazo4or03dvOaN64tdw?=
 =?iso-8859-1?Q?tJ20HpTVCEc6B0ctUDLac8SmdfBdCq3bl3sBuiIvD3dhWtl1ww0SiPQwvY?=
 =?iso-8859-1?Q?AyFtF0lF8JyafMfzpANUiG2JeMWPc+3g86IKLvz1CvnGzOhdfhbEECtT9b?=
 =?iso-8859-1?Q?CIgguCzsYJk+Tx9VoT13cyszX2Lc033RrAPFIT5NPDa04JTbq3nNQ8mgqs?=
 =?iso-8859-1?Q?L0p/BbOymhHgvfL1o0YjIJ9joztCRIj1UGoWm83hNR/eOPOnodPOMvtISU?=
 =?iso-8859-1?Q?HtBygBdRwvpquSXKQqK227wdmu59l8ejZ/5Oe9YTXYJneG2vrL1cpGaWWs?=
 =?iso-8859-1?Q?SF7jxpoUxH/f5TjUJcEf1h0AnB8vN0HsysKaSZq9F67B7R7CTt0wRAzqEl?=
 =?iso-8859-1?Q?uui27RK3qvCuk39un4K+i0wsqmJiN7SxU8/VQ20jIAQHQI4rYZg9nH61CD?=
 =?iso-8859-1?Q?D5fFFm9sH8v1KvPH6MxIiLsXJIP8IuMN2Eyda39DMMyDWpfl5LDBpBwFRy?=
 =?iso-8859-1?Q?kolzsEkL+IChDHhg497aLaQqcFl//E3ZKRPRuT7fR7kRF9N7D4qR2xWbik?=
 =?iso-8859-1?Q?II1o78cA5GyeLHJAze01swrFtyBNT5wCBVz3o3nvuwOXBOd8aMwGSshN3D?=
 =?iso-8859-1?Q?qx76/sErxCswihyTcyV6jrNap68Frj92gE9r1cwSqpgKd/B2sQqZZrkjrH?=
 =?iso-8859-1?Q?/zNIyvDZlVBjbns+GqzVzAT6gqKjaXJ5GcWJeB5MMoeKQzd8QwFxtUwR2d?=
 =?iso-8859-1?Q?Xn7Fgdd/zuAEZFMRDOgB+0xAd/7sveAB9L+fCCHA+UZYNgRIVxSu5Z58cS?=
 =?iso-8859-1?Q?3A8hwJe4X+dZISrAxjxmGZTbeR2bApU285erAlmi8FT17Toa3n5mKrdm86?=
 =?iso-8859-1?Q?5BboO3pQ5WyutbHuSQlVCofM9YTshJ8UVTL01dgMuvhmnwYHHl9i1nus9x?=
 =?iso-8859-1?Q?h5B4EyNp1+?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6c2240f-c38d-4bf5-fd7a-08d904d93aea
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2021 15:22:09.1344 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XNkvu41fregHnXdeiiTjVrKzBwgulBfXm7VpPVTUTvt1cAEuTo/yhBaMtA1tpTjJwo6+C9VgOyYgPrAmF1ra/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4256
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
Cc: "Wang, Chao-kai \(Stylon\)" <Stylon.Wang@amd.com>, "Park,
 Chris" <Chris.Park@amd.com>, "Brol, Eryk" <Eryk.Brol@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Li,
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, open list <linux-kernel@vger.kernel.org>,
 "Cornij, Nikola" <Nikola.Cornij@amd.com>, "Somasundaram,
 Meenakshikumar" <Meenakshikumar.Somasundaram@amd.com>,
 David Airlie <airlied@linux.ie>, "Pillai,
 Aurabindo" <Aurabindo.Pillai@amd.com>, "Lin, 
 Wayne" <Wayne.Lin@amd.com>, "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>,
 "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
Content-Type: multipart/mixed; boundary="===============1414687998=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1414687998==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB44881474AB2AC26A83C8E968F7479MN2PR12MB4488namp_"

--_000_MN2PR12MB44881474AB2AC26A83C8E968F7479MN2PR12MB4488namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - Internal Distribution Only]

I'm fine with having these changes go through drm-misc.

Alex

________________________________
From: Lipski, Mikita <Mikita.Lipski@amd.com>
Sent: Wednesday, April 21, 2021 10:23 AM
To: Lyude Paul <lyude@redhat.com>; dri-devel@lists.freedesktop.org <dri-dev=
el@lists.freedesktop.org>; intel-gfx@lists.freedesktop.org <intel-gfx@lists=
.freedesktop.org>; nouveau@lists.freedesktop.org <nouveau@lists.freedesktop=
.org>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; Ville=
 Syrj=E4l=E4 <ville.syrjala@linux.intel.com>; Jani Nikula <jani.nikula@linu=
x.intel.com>; Rodrigo Vivi <rodrigo.vivi@intel.com>; Thomas Zimmermann <tzi=
mmermann@suse.de>; Thierry Reding <thierry.reding@gmail.com>
Cc: Wang, Chao-kai (Stylon) <Stylon.Wang@amd.com>; Lipski, Mikita <Mikita.L=
ipski@amd.com>; Park, Chris <Chris.Park@amd.com>; Brol, Eryk <Eryk.Brol@amd=
.com>; Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; Lakha, Bhawanpreet <Bhawanp=
reet.Lakha@amd.com>; Lin, Wayne <Wayne.Lin@amd.com>; Siqueira, Rodrigo <Rod=
rigo.Siqueira@amd.com>; open list <linux-kernel@vger.kernel.org>; Kazlauska=
s, Nicholas <Nicholas.Kazlauskas@amd.com>; Somasundaram, Meenakshikumar <Me=
enakshikumar.Somasundaram@amd.com>; David Airlie <airlied@linux.ie>; Pillai=
, Aurabindo <Aurabindo.Pillai@amd.com>; Daniel Vetter <daniel@ffwll.ch>; Ba=
s Nieuwenhuizen <bas@basnieuwenhuizen.nl>; Deucher, Alexander <Alexander.De=
ucher@amd.com>; Cornij, Nikola <Nikola.Cornij@amd.com>; Wentland, Harry <Ha=
rry.Wentland@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>
Subject: Re: [PATCH v3 01/20] drm/amdgpu: Add error handling to amdgpu_dm_i=
nitialize_dp_connector()

Thanks for the change!

Reviewed-by: Mikita Lipski <Mikita.Lipski@amd.com>

On 2021-04-19 6:55 p.m., Lyude Paul wrote:
> While working on moving i2c device registration into drm_dp_aux_init() - =
I
> realized that in order to do so we need to make sure that drivers calling
> drm_dp_aux_init() handle any errors it could possibly return. In the
> process of doing that, I noticed that the majority of AMD's code for DP
> connector creation doesn't attempt to do any real error handling.
>
> So, let's fix this and also cleanup amdgpu_dm_initialize_dp_connector()
> while we're at it. This way we can handle the error codes from
> drm_dp_aux_init().
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 29 +++++++-----
>   .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 44 +++++++++++--------
>   .../display/amdgpu_dm/amdgpu_dm_mst_types.h   |  6 +--
>   3 files changed, 45 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index a0c8c41e4e57..fc5d315bbb05 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -7608,10 +7608,9 @@ static int amdgpu_dm_connector_init(struct amdgpu_=
display_manager *dm,
>
>        aconnector->i2c =3D i2c;
>        res =3D i2c_add_adapter(&i2c->base);
> -
>        if (res) {
>                DRM_ERROR("Failed to register hw i2c %d\n", link->link_ind=
ex);
> -             goto out_free;
> +             goto fail_free;
>        }
>
>        connector_type =3D to_drm_connector_type(link->connector_signal);
> @@ -7625,8 +7624,7 @@ static int amdgpu_dm_connector_init(struct amdgpu_d=
isplay_manager *dm,
>
>        if (res) {
>                DRM_ERROR("connector_init failed\n");
> -             aconnector->connector_id =3D -1;
> -             goto out_free;
> +             goto fail_id;
>        }
>
>        drm_connector_helper_add(
> @@ -7643,15 +7641,22 @@ static int amdgpu_dm_connector_init(struct amdgpu=
_display_manager *dm,
>        drm_connector_attach_encoder(
>                &aconnector->base, &aencoder->base);
>
> -     if (connector_type =3D=3D DRM_MODE_CONNECTOR_DisplayPort
> -             || connector_type =3D=3D DRM_MODE_CONNECTOR_eDP)
> -             amdgpu_dm_initialize_dp_connector(dm, aconnector, link->lin=
k_index);
> -
> -out_free:
> -     if (res) {
> -             kfree(i2c);
> -             aconnector->i2c =3D NULL;
> +     if (connector_type =3D=3D DRM_MODE_CONNECTOR_DisplayPort ||
> +         connector_type =3D=3D DRM_MODE_CONNECTOR_eDP) {
> +             res =3D amdgpu_dm_initialize_dp_connector(dm, aconnector, l=
ink->link_index);
> +             if (res)
> +                     goto fail_cleanup;
>        }
> +
> +     return 0;
> +fail_cleanup:
> +     drm_connector_cleanup(&aconnector->base);
> +fail_id:
> +     aconnector->connector_id =3D -1;
> +fail_free:
> +     kfree(i2c);
> +     aconnector->i2c =3D NULL;
> +
>        return res;
>   }
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c =
b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 73cdb9fe981a..3dee9cce9c9e 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -425,33 +425,39 @@ static const struct drm_dp_mst_topology_cbs dm_mst_=
cbs =3D {
>        .add_connector =3D dm_dp_add_mst_connector,
>   };
>
> -void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm=
,
> -                                    struct amdgpu_dm_connector *aconnect=
or,
> -                                    int link_index)
> +int amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
> +                                   struct amdgpu_dm_connector *aconnecto=
r,
> +                                   int link_index)
>   {
> -     aconnector->dm_dp_aux.aux.name =3D
> -             kasprintf(GFP_KERNEL, "AMDGPU DM aux hw bus %d",
> -                       link_index);
> -     aconnector->dm_dp_aux.aux.transfer =3D dm_dp_aux_transfer;
> -     aconnector->dm_dp_aux.ddc_service =3D aconnector->dc_link->ddc;
> +     struct amdgpu_dm_dp_aux *dm_aux =3D &aconnector->dm_dp_aux;
> +     int ret;
>
> -     drm_dp_aux_init(&aconnector->dm_dp_aux.aux);
> -     drm_dp_cec_register_connector(&aconnector->dm_dp_aux.aux,
> -                                   &aconnector->base);
> +     dm_aux->aux.name =3D kasprintf(GFP_KERNEL, "AMDGPU DM aux hw bus %d=
", link_index);
> +     if (!dm_aux->aux.name)
> +             return -ENOMEM;
> +
> +     dm_aux->aux.transfer =3D dm_dp_aux_transfer;
> +     dm_aux->ddc_service =3D aconnector->dc_link->ddc;
> +
> +     drm_dp_aux_init(&dm_aux->aux);
> +     drm_dp_cec_register_connector(&dm_aux->aux, &aconnector->base);
>
>        if (aconnector->base.connector_type =3D=3D DRM_MODE_CONNECTOR_eDP)
> -             return;
> +             return 0;
>
>        aconnector->mst_mgr.cbs =3D &dm_mst_cbs;
> -     drm_dp_mst_topology_mgr_init(
> -             &aconnector->mst_mgr,
> -             adev_to_drm(dm->adev),
> -             &aconnector->dm_dp_aux.aux,
> -             16,
> -             4,
> -             aconnector->connector_id);
> +     ret =3D drm_dp_mst_topology_mgr_init(&aconnector->mst_mgr, adev_to_=
drm(dm->adev),
> +                                        &dm_aux->aux, 16, 4, aconnector-=
>connector_id);
> +     if (ret)
> +             goto unreg_cec;
>
>        drm_connector_attach_dp_subconnector_property(&aconnector->base);
> +
> +     return 0;
> +unreg_cec:
> +     drm_dp_cec_unregister_connector(&dm_aux->aux);
> +     kfree(dm_aux->aux.name);
> +     return ret;
>   }
>
>   int dm_mst_get_pbn_divider(struct dc_link *link)
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h =
b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
> index b38bd68121ce..cf771ff58bb3 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
> @@ -31,9 +31,9 @@ struct amdgpu_dm_connector;
>
>   int dm_mst_get_pbn_divider(struct dc_link *link);
>
> -void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm=
,
> -                                    struct amdgpu_dm_connector *aconnect=
or,
> -                                    int link_index);
> +int amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
> +                                   struct amdgpu_dm_connector *aconnecto=
r,
> +                                   int link_index);
>
>   void
>   dm_dp_create_fake_mst_encoders(struct amdgpu_device *adev);
>

--_000_MN2PR12MB44881474AB2AC26A83C8E968F7479MN2PR12MB4488namp_
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
<p style=3D"font-family:Arial;font-size:11pt;color:#0078D7;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only - Internal Distribution Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I'm fine with having these changes go through drm-misc.</div>
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
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Lipski, Mikita &lt;Mi=
kita.Lipski@amd.com&gt;<br>
<b>Sent:</b> Wednesday, April 21, 2021 10:23 AM<br>
<b>To:</b> Lyude Paul &lt;lyude@redhat.com&gt;; dri-devel@lists.freedesktop=
.org &lt;dri-devel@lists.freedesktop.org&gt;; intel-gfx@lists.freedesktop.o=
rg &lt;intel-gfx@lists.freedesktop.org&gt;; nouveau@lists.freedesktop.org &=
lt;nouveau@lists.freedesktop.org&gt;; amd-gfx@lists.freedesktop.org
 &lt;amd-gfx@lists.freedesktop.org&gt;; Ville Syrj=E4l=E4 &lt;ville.syrjala=
@linux.intel.com&gt;; Jani Nikula &lt;jani.nikula@linux.intel.com&gt;; Rodr=
igo Vivi &lt;rodrigo.vivi@intel.com&gt;; Thomas Zimmermann &lt;tzimmermann@=
suse.de&gt;; Thierry Reding &lt;thierry.reding@gmail.com&gt;<br>
<b>Cc:</b> Wang, Chao-kai (Stylon) &lt;Stylon.Wang@amd.com&gt;; Lipski, Mik=
ita &lt;Mikita.Lipski@amd.com&gt;; Park, Chris &lt;Chris.Park@amd.com&gt;; =
Brol, Eryk &lt;Eryk.Brol@amd.com&gt;; Li, Sun peng (Leo) &lt;Sunpeng.Li@amd=
.com&gt;; Lakha, Bhawanpreet &lt;Bhawanpreet.Lakha@amd.com&gt;; Lin,
 Wayne &lt;Wayne.Lin@amd.com&gt;; Siqueira, Rodrigo &lt;Rodrigo.Siqueira@am=
d.com&gt;; open list &lt;linux-kernel@vger.kernel.org&gt;; Kazlauskas, Nich=
olas &lt;Nicholas.Kazlauskas@amd.com&gt;; Somasundaram, Meenakshikumar &lt;=
Meenakshikumar.Somasundaram@amd.com&gt;; David Airlie &lt;airlied@linux.ie&=
gt;;
 Pillai, Aurabindo &lt;Aurabindo.Pillai@amd.com&gt;; Daniel Vetter &lt;dani=
el@ffwll.ch&gt;; Bas Nieuwenhuizen &lt;bas@basnieuwenhuizen.nl&gt;; Deucher=
, Alexander &lt;Alexander.Deucher@amd.com&gt;; Cornij, Nikola &lt;Nikola.Co=
rnij@amd.com&gt;; Wentland, Harry &lt;Harry.Wentland@amd.com&gt;; Koenig,
 Christian &lt;Christian.Koenig@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH v3 01/20] drm/amdgpu: Add error handling to amdg=
pu_dm_initialize_dp_connector()</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Thanks for the change!<br>
<br>
Reviewed-by: Mikita Lipski &lt;Mikita.Lipski@amd.com&gt;<br>
<br>
On 2021-04-19 6:55 p.m., Lyude Paul wrote:<br>
&gt; While working on moving i2c device registration into drm_dp_aux_init()=
 - I<br>
&gt; realized that in order to do so we need to make sure that drivers call=
ing<br>
&gt; drm_dp_aux_init() handle any errors it could possibly return. In the<b=
r>
&gt; process of doing that, I noticed that the majority of AMD's code for D=
P<br>
&gt; connector creation doesn't attempt to do any real error handling.<br>
&gt; <br>
&gt; So, let's fix this and also cleanup amdgpu_dm_initialize_dp_connector(=
)<br>
&gt; while we're at it. This way we can handle the error codes from<br>
&gt; drm_dp_aux_init().<br>
&gt; <br>
&gt; Signed-off-by: Lyude Paul &lt;lyude@redhat.com&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 29 +++++++=
-----<br>
&gt;&nbsp;&nbsp; .../display/amdgpu_dm/amdgpu_dm_mst_types.c&nbsp;&nbsp; | =
44 +++++++++++--------<br>
&gt;&nbsp;&nbsp; .../display/amdgpu_dm/amdgpu_dm_mst_types.h&nbsp;&nbsp; |&=
nbsp; 6 +--<br>
&gt;&nbsp;&nbsp; 3 files changed, 45 insertions(+), 34 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drive=
rs/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
&gt; index a0c8c41e4e57..fc5d315bbb05 100644<br>
&gt; --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
&gt; +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
&gt; @@ -7608,10 +7608,9 @@ static int amdgpu_dm_connector_init(struct amdg=
pu_display_manager *dm,<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; aconnector-&gt;i2c =3D i2c;<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; res =3D i2c_add_adapter(&amp=
;i2c-&gt;base);<br>
&gt; -<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (res) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; DRM_ERROR(&quot;Failed to register hw i2c %d\n&quot;, l=
ink-&gt;link_index);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; goto out_free;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; goto fail_free;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; connector_type =3D to_drm_co=
nnector_type(link-&gt;connector_signal);<br>
&gt; @@ -7625,8 +7624,7 @@ static int amdgpu_dm_connector_init(struct amdgp=
u_display_manager *dm,<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (res) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; DRM_ERROR(&quot;connector_init failed\n&quot;);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; aconnector-&gt;connector_id =3D -1;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; goto out_free;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; goto fail_id;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_connector_helper_add(<br=
>
&gt; @@ -7643,15 +7641,22 @@ static int amdgpu_dm_connector_init(struct amd=
gpu_display_manager *dm,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_connector_attach_encoder=
(<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; &amp;aconnector-&gt;base, &amp;aencoder-&gt;base);<br>
&gt;&nbsp;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (connector_type =3D=3D DRM_MODE_CONNECTOR=
_DisplayPort<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; || connector_type =3D=3D DRM_MODE_CONNECTOR_eDP)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; amdgpu_dm_initialize_dp_connector(dm, aconnector, link-&gt;link_index);=
<br>
&gt; -<br>
&gt; -out_free:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (res) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; kfree(i2c);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; aconnector-&gt;i2c =3D NULL;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (connector_type =3D=3D DRM_MODE_CONNECTOR=
_DisplayPort ||<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; connector_type =3D=
=3D DRM_MODE_CONNECTOR_eDP) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; res =3D amdgpu_dm_initialize_dp_connector(dm, aconnector, link-&gt;link=
_index);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (res)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto fail_cleanup;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; +fail_cleanup:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; drm_connector_cleanup(&amp;aconnector-&gt;ba=
se);<br>
&gt; +fail_id:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; aconnector-&gt;connector_id =3D -1;<br>
&gt; +fail_free:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; kfree(i2c);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; aconnector-&gt;i2c =3D NULL;<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return res;<br>
&gt;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt; diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types=
.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c<br>
&gt; index 73cdb9fe981a..3dee9cce9c9e 100644<br>
&gt; --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c<br>
&gt; +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c<br>
&gt; @@ -425,33 +425,39 @@ static const struct drm_dp_mst_topology_cbs dm_m=
st_cbs =3D {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .add_connector =3D dm_dp_add=
_mst_connector,<br>
&gt;&nbsp;&nbsp; };<br>
&gt;&nbsp;&nbsp; <br>
&gt; -void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager =
*dm,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct a=
mdgpu_dm_connector *aconnector,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int link=
_index)<br>
&gt; +int amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *=
dm,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_=
dm_connector *aconnector,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int link_index=
)<br>
&gt;&nbsp;&nbsp; {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; aconnector-&gt;dm_dp_aux.aux.name =3D<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; kasprintf(GFP_KERNEL, &quot;AMDGPU DM aux hw bus %d&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; link_index)=
;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; aconnector-&gt;dm_dp_aux.aux.transfer =3D dm=
_dp_aux_transfer;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; aconnector-&gt;dm_dp_aux.ddc_service =3D aco=
nnector-&gt;dc_link-&gt;ddc;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_dm_dp_aux *dm_aux =3D &amp;aco=
nnector-&gt;dm_dp_aux;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&gt;&nbsp;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; drm_dp_aux_init(&amp;aconnector-&gt;dm_dp_au=
x.aux);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; drm_dp_cec_register_connector(&amp;aconnecto=
r-&gt;dm_dp_aux.aux,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;aconnecto=
r-&gt;base);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; dm_aux-&gt;aux.name =3D kasprintf(GFP_KERNEL=
, &quot;AMDGPU DM aux hw bus %d&quot;, link_index);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!dm_aux-&gt;aux.name)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return -ENOMEM;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; dm_aux-&gt;aux.transfer =3D dm_dp_aux_transf=
er;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; dm_aux-&gt;ddc_service =3D aconnector-&gt;dc=
_link-&gt;ddc;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; drm_dp_aux_init(&amp;dm_aux-&gt;aux);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; drm_dp_cec_register_connector(&amp;dm_aux-&g=
t;aux, &amp;aconnector-&gt;base);<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (aconnector-&gt;base.conn=
ector_type =3D=3D DRM_MODE_CONNECTOR_eDP)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return 0;<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; aconnector-&gt;mst_mgr.cbs =
=3D &amp;dm_mst_cbs;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; drm_dp_mst_topology_mgr_init(<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; &amp;aconnector-&gt;mst_mgr,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; adev_to_drm(dm-&gt;adev),<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; &amp;aconnector-&gt;dm_dp_aux.aux,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; 16,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; 4,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; aconnector-&gt;connector_id);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drm_dp_mst_topology_mgr_init(&amp;ac=
onnector-&gt;mst_mgr, adev_to_drm(dm-&gt;adev),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; &amp;dm_aux-&gt;aux, 16, 4, aconnector-&gt;connector_id);<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; goto unreg_cec;<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_connector_attach_dp_subc=
onnector_property(&amp;aconnector-&gt;base);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; +unreg_cec:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; drm_dp_cec_unregister_connector(&amp;dm_aux-=
&gt;aux);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; kfree(dm_aux-&gt;aux.name);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; int dm_mst_get_pbn_divider(struct dc_link *link)<br>
&gt; diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types=
.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h<br>
&gt; index b38bd68121ce..cf771ff58bb3 100644<br>
&gt; --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h<br>
&gt; +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h<br>
&gt; @@ -31,9 +31,9 @@ struct amdgpu_dm_connector;<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; int dm_mst_get_pbn_divider(struct dc_link *link);<br>
&gt;&nbsp;&nbsp; <br>
&gt; -void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager =
*dm,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct a=
mdgpu_dm_connector *aconnector,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int link=
_index);<br>
&gt; +int amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *=
dm,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_=
dm_connector *aconnector,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int link_index=
);<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; void<br>
&gt;&nbsp;&nbsp; dm_dp_create_fake_mst_encoders(struct amdgpu_device *adev)=
;<br>
&gt; <br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_MN2PR12MB44881474AB2AC26A83C8E968F7479MN2PR12MB4488namp_--

--===============1414687998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1414687998==--
