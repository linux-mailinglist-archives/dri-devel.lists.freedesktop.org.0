Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D35A899400
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 14:40:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1706EB16;
	Thu, 22 Aug 2019 12:40:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730082.outbound.protection.outlook.com [40.107.73.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DCD96EB12;
 Thu, 22 Aug 2019 12:40:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMUvTmVkvD2mApIM5V8O/Ckf69cJ/ezIfzKP8WgwykwmCbeNl5Gba7Fu7tjB9IqgI4ftP4aPFzD4G816b6WebxfcL2ODTz9Ujhq7vBmvEaHYiNYyHUvjTv5WGDfS+wk6iyTdUkOEsp2CfLAFkf3gVGVRV1z784AJmZzEhTeBwfPkTVeZKZ2yxaCcZXYSP9oHuSrsHUYQfFEIbj53SSK75r4gYeXMqCjSfM8dOUaOHnoHcfOpOPXy+lQxdYbXDploJZrJHJRrFd5PTzPMmNCrSGzYl2nSIu+9bfKyTF+eQurFXBdoOF3onNjyWy18H3ezaEp1cKXLzCsuPuHQTUyT1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WpiPCoV1+xDiyT8Bhb2X73UqojcK9sxIKvY7P0FCeTc=;
 b=bKdHLmDzMVm4af+Sb4sylb5STadgNQDxlIbhxHYNkRyMnwCRlbhPxbhtt0SwKPghtLWybWhtTL7PsnSJ6GqdZC85lPjf+PBN4tLWansRJfh5nRm2+BYPmD/FKaHTTzv4W+6W5w0otpX/r/RMC/qsHoGt6F6cPNS2POfJm0nzHr05d+dpmqsDKTmJW9tgvwEiGzdOsaZn+7DWNHBgdLfnhNX3AmW0TtC80TIOXFsv6xkqZiydSsQAELUjuDbS10lgp50eeAAihuANkFCG7XgNVRhUzRc+T5TVX5vNKSCyJq81EaUEJ13b2lLGwfx6EYVx+SKGaJzt1PXz0xaTUEuXGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1139.namprd12.prod.outlook.com (10.168.227.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Thu, 22 Aug 2019 12:40:47 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::8542:935:262c:53d1]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::8542:935:262c:53d1%10]) with mapi id 15.20.2178.020; Thu, 22 Aug 2019
 12:40:47 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Dariusz Marcinkiewicz
 <darekm@google.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>
Subject: Re: [PATCH v7 1/9] drm_dp_cec: add connector info support.
Thread-Topic: [PATCH v7 1/9] drm_dp_cec: add connector info support.
Thread-Index: AQHVUo1tGZonfbpra0y5AIvt63jjfKcG3HyAgABL/oc=
Date: Thu, 22 Aug 2019 12:40:47 +0000
Message-ID: <BN6PR12MB1809F2FD206B4E969ECBE24DF7A50@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190814104520.6001-1-darekm@google.com>
 <20190814104520.6001-2-darekm@google.com>,
 <38cda4f5-3299-2bd4-65f5-9a0f948902c6@xs4all.nl>
In-Reply-To: <38cda4f5-3299-2bd4-65f5-9a0f948902c6@xs4all.nl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.73.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08ac1f4d-94ae-4e3f-859d-08d726fdf50c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN6PR12MB1139; 
x-ms-traffictypediagnostic: BN6PR12MB1139:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB11396E9F12015D9E5C0AF786F7A50@BN6PR12MB1139.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01371B902F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(376002)(39860400002)(136003)(346002)(199004)(189003)(256004)(53546011)(6506007)(7736002)(6116002)(3846002)(316002)(110136005)(54906003)(102836004)(54896002)(8936002)(6436002)(8676002)(186003)(26005)(9686003)(81166006)(86362001)(2501003)(99286004)(105004)(81156014)(6246003)(25786009)(19627405001)(55016002)(478600001)(66574012)(71200400001)(66946007)(14444005)(66476007)(33656002)(14454004)(66446008)(52536014)(11346002)(446003)(7416002)(64756008)(66556008)(4326008)(71190400001)(74316002)(66066001)(76176011)(5660300002)(7696005)(486006)(2201001)(229853002)(53936002)(76116006)(2906002)(5024004)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1139;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lFcWQy6pSRXsVbx+yKgQAc8RtUGWmAvX3qfnRJY6tTIMi6OuASZOTDCJEenYHoFNkbVrb6czrn3Sz9gpHfXzwbK/DUa68ZSRHmStIAZ9OQ1w4uktGru2VjTnm3yJh2ayZdIz6OEW/jBEuHImLa2VWiBbkrBFPJ9e/PUoLmoEFApSPXaL/9AinZjaOKzbC5hN8FL09NKSp9RGkfeVwmuu39Dzx3lzXYNl3kvWwurjI7us4GE8pKjhuFoBsfpZQv6du8INhQNzMnSOX7VGsuQGVl99f7s9k1//IABEdJQj8J4sg8cX6eOHMG/UGV1a16r7YV13PYGcFaCJsIzNCzDCawYwxXoZ5ZZjt2d+ffWTn+4YJg/mQZUIZEgkg72LQ6ND886FXHi77dkoXyvzifieWnrosz7tQtzSooQISfBqJ4M=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ac1f4d-94ae-4e3f-859d-08d726fdf50c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2019 12:40:47.5314 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sryni+RHk+krRR5/K9OTmWm991XHq5kdU5Kx2BF83SiUT1LuvIG+T4ryGPgvdpQV7ES79In4OInb3LI85i7jmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1139
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WpiPCoV1+xDiyT8Bhb2X73UqojcK9sxIKvY7P0FCeTc=;
 b=etT9c0FwBPGqTnLRz5zl1G95iKv0BLB5k3QbqHXv1fCbN3x+dc9edWyWswgmeTF/bAMMd8WhX5aCWED+Qc4nxyoyg94iNKYuod0e+ZipUxgEHMQJldQXKG5UnBqsOBJmw8cNPgdq2Hb3w1G90UNquRLlKJ/MXRrO+dn6USYkkoY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Alexander.Deucher@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Maxime Ripard <mripard@kernel.org>, Thomas Lim <Thomas.Lim@amd.com>,
 David Airlie <airlied@linux.ie>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "Francis,
 David" <David.Francis@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 Manasi Navare <manasi.d.navare@intel.com>, "Li,
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Zuo, Jerry" <Jerry.Zuo@amd.com>,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>, "Koo,
 Anthony" <Anthony.Koo@amd.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: multipart/mixed; boundary="===============1698801836=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1698801836==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809F2FD206B4E969ECBE24DF7A50BN6PR12MB1809namp_"

--_000_BN6PR12MB1809F2FD206B4E969ECBE24DF7A50BN6PR12MB1809namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Acked-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Sent: Thursday, August 22, 2019 4:08 AM
To: Dariusz Marcinkiewicz <darekm@google.com>; dri-devel@lists.freedesktop.=
org <dri-devel@lists.freedesktop.org>; linux-media@vger.kernel.org <linux-m=
edia@vger.kernel.org>
Cc: David Airlie <airlied@linux.ie>; nouveau@lists.freedesktop.org <nouveau=
@lists.freedesktop.org>; Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com=
>; Koo, Anthony <Anthony.Koo@amd.com>; Francis, David <David.Francis@amd.co=
m>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; Zuo, Jer=
ry <Jerry.Zuo@amd.com>; Ben Skeggs <bskeggs@redhat.com>; Li, Sun peng (Leo)=
 <Sunpeng.Li@amd.com>; intel-gfx@lists.freedesktop.org <intel-gfx@lists.fre=
edesktop.org>; Maxime Ripard <mripard@kernel.org>; Rodrigo Vivi <rodrigo.vi=
vi@intel.com>; Sean Paul <sean@poorly.run>; Thomas Lim <Thomas.Lim@amd.com>=
; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; Manasi Navar=
e <manasi.d.navare@intel.com>; Deucher, Alexander <Alexander.Deucher@amd.co=
m>; Koenig, Christian <Christian.Koenig@amd.com>; Ville Syrj=E4l=E4 <ville.=
syrjala@linux.intel.com>
Subject: Re: [PATCH v7 1/9] drm_dp_cec: add connector info support.

Alex, Ville/Rodrigo, Ben,

Can you (hopefully) Ack this patch so that I can merge it?

Thank you!

        Hans

On 8/14/19 12:44 PM, Dariusz Marcinkiewicz wrote:
> Pass the connector info to the CEC adapter. This makes it possible
> to associate the CEC adapter with the corresponding drm connector.
>
> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  2 +-
>  drivers/gpu/drm/drm_dp_cec.c                  | 25 ++++++++++++-------
>  drivers/gpu/drm/i915/display/intel_dp.c       |  4 +--
>  drivers/gpu/drm/nouveau/nouveau_connector.c   |  3 +--
>  include/drm/drm_dp_helper.h                   | 17 ++++++-------
>  5 files changed, 27 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c =
b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 16218a202b591..5ec14efd4d8cb 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -416,7 +416,7 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_=
display_manager *dm,
>
>        drm_dp_aux_register(&aconnector->dm_dp_aux.aux);
>        drm_dp_cec_register_connector(&aconnector->dm_dp_aux.aux,
> -                                   aconnector->base.name, dm->adev->dev)=
;
> +                                   &aconnector->base);
>        aconnector->mst_mgr.cbs =3D &dm_mst_cbs;
>        drm_dp_mst_topology_mgr_init(
>                &aconnector->mst_mgr,
> diff --git a/drivers/gpu/drm/drm_dp_cec.c b/drivers/gpu/drm/drm_dp_cec.c
> index b15cee85b702b..b457c16c3a8bb 100644
> --- a/drivers/gpu/drm/drm_dp_cec.c
> +++ b/drivers/gpu/drm/drm_dp_cec.c
> @@ -8,7 +8,9 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/slab.h>
> +#include <drm/drm_connector.h>
>  #include <drm/drm_dp_helper.h>
> +#include <drm/drmP.h>
>  #include <media/cec.h>
>
>  /*
> @@ -295,7 +297,10 @@ static void drm_dp_cec_unregister_work(struct work_s=
truct *work)
>   */
>  void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid=
)
>  {
> -     u32 cec_caps =3D CEC_CAP_DEFAULTS | CEC_CAP_NEEDS_HPD;
> +     struct drm_connector *connector =3D aux->cec.connector;
> +     u32 cec_caps =3D CEC_CAP_DEFAULTS | CEC_CAP_NEEDS_HPD |
> +                    CEC_CAP_CONNECTOR_INFO;
> +     struct cec_connector_info conn_info;
>        unsigned int num_las =3D 1;
>        u8 cap;
>
> @@ -344,13 +349,17 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, co=
nst struct edid *edid)
>
>        /* Create a new adapter */
>        aux->cec.adap =3D cec_allocate_adapter(&drm_dp_cec_adap_ops,
> -                                          aux, aux->cec.name, cec_caps,
> +                                          aux, connector->name, cec_caps=
,
>                                             num_las);
>        if (IS_ERR(aux->cec.adap)) {
>                aux->cec.adap =3D NULL;
>                goto unlock;
>        }
> -     if (cec_register_adapter(aux->cec.adap, aux->cec.parent)) {
> +
> +     cec_fill_conn_info_from_drm(&conn_info, connector);
> +     cec_s_conn_info(aux->cec.adap, &conn_info);
> +
> +     if (cec_register_adapter(aux->cec.adap, connector->dev->dev)) {
>                cec_delete_adapter(aux->cec.adap);
>                aux->cec.adap =3D NULL;
>        } else {
> @@ -406,22 +415,20 @@ EXPORT_SYMBOL(drm_dp_cec_unset_edid);
>  /**
>   * drm_dp_cec_register_connector() - register a new connector
>   * @aux: DisplayPort AUX channel
> - * @name: name of the CEC device
> - * @parent: parent device
> + * @connector: drm connector
>   *
>   * A new connector was registered with associated CEC adapter name and
>   * CEC adapter parent device. After registering the name and parent
>   * drm_dp_cec_set_edid() is called to check if the connector supports
>   * CEC and to register a CEC adapter if that is the case.
>   */
> -void drm_dp_cec_register_connector(struct drm_dp_aux *aux, const char *n=
ame,
> -                                struct device *parent)
> +void drm_dp_cec_register_connector(struct drm_dp_aux *aux,
> +                                struct drm_connector *connector)
>  {
>        WARN_ON(aux->cec.adap);
>        if (WARN_ON(!aux->transfer))
>                return;
> -     aux->cec.name =3D name;
> -     aux->cec.parent =3D parent;
> +     aux->cec.connector =3D connector;
>        INIT_DELAYED_WORK(&aux->cec.unregister_work,
>                          drm_dp_cec_unregister_work);
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 1092499115760..de2486fe7bf2d 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -5497,7 +5497,6 @@ static int
>  intel_dp_connector_register(struct drm_connector *connector)
>  {
>        struct intel_dp *intel_dp =3D intel_attached_dp(connector);
> -     struct drm_device *dev =3D connector->dev;
>        int ret;
>
>        ret =3D intel_connector_register(connector);
> @@ -5512,8 +5511,7 @@ intel_dp_connector_register(struct drm_connector *c=
onnector)
>        intel_dp->aux.dev =3D connector->kdev;
>        ret =3D drm_dp_aux_register(&intel_dp->aux);
>        if (!ret)
> -             drm_dp_cec_register_connector(&intel_dp->aux,
> -                                           connector->name, dev->dev);
> +             drm_dp_cec_register_connector(&intel_dp->aux, connector);
>        return ret;
>  }
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/dr=
m/nouveau/nouveau_connector.c
> index 330d7d29a6e34..8aa703347eb54 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -1416,8 +1416,7 @@ nouveau_connector_create(struct drm_device *dev,
>        switch (type) {
>        case DRM_MODE_CONNECTOR_DisplayPort:
>        case DRM_MODE_CONNECTOR_eDP:
> -             drm_dp_cec_register_connector(&nv_connector->aux,
> -                                           connector->name, dev->dev);
> +             drm_dp_cec_register_connector(&nv_connector->aux, connector=
);
>                break;
>        }
>
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index 8364502f92cfe..7972b925a952b 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1230,20 +1230,19 @@ struct drm_dp_aux_msg {
>
>  struct cec_adapter;
>  struct edid;
> +struct drm_connector;
>
>  /**
>   * struct drm_dp_aux_cec - DisplayPort CEC-Tunneling-over-AUX
>   * @lock: mutex protecting this struct
>   * @adap: the CEC adapter for CEC-Tunneling-over-AUX support.
> - * @name: name of the CEC adapter
> - * @parent: parent device of the CEC adapter
> + * @connector: the connector this CEC adapter is associated with
>   * @unregister_work: unregister the CEC adapter
>   */
>  struct drm_dp_aux_cec {
>        struct mutex lock;
>        struct cec_adapter *adap;
> -     const char *name;
> -     struct device *parent;
> +     struct drm_connector *connector;
>        struct delayed_work unregister_work;
>  };
>
> @@ -1451,8 +1450,8 @@ drm_dp_has_quirk(const struct drm_dp_desc *desc, en=
um drm_dp_quirk quirk)
>
>  #ifdef CONFIG_DRM_DP_CEC
>  void drm_dp_cec_irq(struct drm_dp_aux *aux);
> -void drm_dp_cec_register_connector(struct drm_dp_aux *aux, const char *n=
ame,
> -                                struct device *parent);
> +void drm_dp_cec_register_connector(struct drm_dp_aux *aux,
> +                                struct drm_connector *connector);
>  void drm_dp_cec_unregister_connector(struct drm_dp_aux *aux);
>  void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid=
);
>  void drm_dp_cec_unset_edid(struct drm_dp_aux *aux);
> @@ -1461,9 +1460,9 @@ static inline void drm_dp_cec_irq(struct drm_dp_aux=
 *aux)
>  {
>  }
>
> -static inline void drm_dp_cec_register_connector(struct drm_dp_aux *aux,
> -                                              const char *name,
> -                                              struct device *parent)
> +static inline void
> +drm_dp_cec_register_connector(struct drm_dp_aux *aux,
> +                           struct drm_connector *connector)
>  {
>  }
>
>


--_000_BN6PR12MB1809F2FD206B4E969ECBE24DF7A50BN6PR12MB1809namp_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Acked-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Hans Verkuil &lt;hver=
kuil-cisco@xs4all.nl&gt;<br>
<b>Sent:</b> Thursday, August 22, 2019 4:08 AM<br>
<b>To:</b> Dariusz Marcinkiewicz &lt;darekm@google.com&gt;; dri-devel@lists=
.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt;; linux-media@vger.=
kernel.org &lt;linux-media@vger.kernel.org&gt;<br>
<b>Cc:</b> David Airlie &lt;airlied@linux.ie&gt;; nouveau@lists.freedesktop=
.org &lt;nouveau@lists.freedesktop.org&gt;; Dhinakaran Pandiyan &lt;dhinaka=
ran.pandiyan@intel.com&gt;; Koo, Anthony &lt;Anthony.Koo@amd.com&gt;; Franc=
is, David &lt;David.Francis@amd.com&gt;; amd-gfx@lists.freedesktop.org
 &lt;amd-gfx@lists.freedesktop.org&gt;; Zuo, Jerry &lt;Jerry.Zuo@amd.com&gt=
;; Ben Skeggs &lt;bskeggs@redhat.com&gt;; Li, Sun peng (Leo) &lt;Sunpeng.Li=
@amd.com&gt;; intel-gfx@lists.freedesktop.org &lt;intel-gfx@lists.freedeskt=
op.org&gt;; Maxime Ripard &lt;mripard@kernel.org&gt;; Rodrigo Vivi &lt;rodr=
igo.vivi@intel.com&gt;;
 Sean Paul &lt;sean@poorly.run&gt;; Thomas Lim &lt;Thomas.Lim@amd.com&gt;; =
linux-kernel@vger.kernel.org &lt;linux-kernel@vger.kernel.org&gt;; Manasi N=
avare &lt;manasi.d.navare@intel.com&gt;; Deucher, Alexander &lt;Alexander.D=
eucher@amd.com&gt;; Koenig, Christian &lt;Christian.Koenig@amd.com&gt;;
 Ville Syrj=E4l=E4 &lt;ville.syrjala@linux.intel.com&gt;<br>
<b>Subject:</b> Re: [PATCH v7 1/9] drm_dp_cec: add connector info support.<=
/font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Alex, Ville/Rodrigo, Ben,<br>
<br>
Can you (hopefully) Ack this patch so that I can merge it?<br>
<br>
Thank you!<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Hans<br>
<br>
On 8/14/19 12:44 PM, Dariusz Marcinkiewicz wrote:<br>
&gt; Pass the connector info to the CEC adapter. This makes it possible<br>
&gt; to associate the CEC adapter with the corresponding drm connector.<br>
&gt; <br>
&gt; Signed-off-by: Dariusz Marcinkiewicz &lt;darekm@google.com&gt;<br>
&gt; Signed-off-by: Hans Verkuil &lt;hverkuil-cisco@xs4all.nl&gt;<br>
&gt; Tested-by: Hans Verkuil &lt;hverkuil-cisco@xs4all.nl&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../display/amdgpu_dm/amdgpu_dm_mst_types.c&nbsp;&nbsp; |&nbsp; =
2 &#43;-<br>
&gt;&nbsp; drivers/gpu/drm/drm_dp_cec.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 25 &#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-------<br>
&gt;&nbsp; drivers/gpu/drm/i915/display/intel_dp.c&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp; 4 &#43;--<br>
&gt;&nbsp; drivers/gpu/drm/nouveau/nouveau_connector.c&nbsp;&nbsp; |&nbsp; =
3 &#43;--<br>
&gt;&nbsp; include/drm/drm_dp_helper.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1=
7 &#43;&#43;&#43;&#43;&#43;&#43;-------<br>
&gt;&nbsp; 5 files changed, 27 insertions(&#43;), 24 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types=
.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c<br>
&gt; index 16218a202b591..5ec14efd4d8cb 100644<br>
&gt; --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_=
types.c<br>
&gt; @@ -416,7 &#43;416,7 @@ void amdgpu_dm_initialize_dp_connector(struct =
amdgpu_display_manager *dm,<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_dp_aux_register(&amp;aco=
nnector-&gt;dm_dp_aux.aux);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_dp_cec_register_connecto=
r(&amp;aconnector-&gt;dm_dp_aux.aux,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; aconnector-&gt=
;base.name, dm-&gt;adev-&gt;dev);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;aconn=
ector-&gt;base);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; aconnector-&gt;mst_mgr.cbs =
=3D &amp;dm_mst_cbs;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_dp_mst_topology_mgr_init=
(<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; &amp;aconnector-&gt;mst_mgr,<br>
&gt; diff --git a/drivers/gpu/drm/drm_dp_cec.c b/drivers/gpu/drm/drm_dp_cec=
.c<br>
&gt; index b15cee85b702b..b457c16c3a8bb 100644<br>
&gt; --- a/drivers/gpu/drm/drm_dp_cec.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/drm_dp_cec.c<br>
&gt; @@ -8,7 &#43;8,9 @@<br>
&gt;&nbsp; #include &lt;linux/kernel.h&gt;<br>
&gt;&nbsp; #include &lt;linux/module.h&gt;<br>
&gt;&nbsp; #include &lt;linux/slab.h&gt;<br>
&gt; &#43;#include &lt;drm/drm_connector.h&gt;<br>
&gt;&nbsp; #include &lt;drm/drm_dp_helper.h&gt;<br>
&gt; &#43;#include &lt;drm/drmP.h&gt;<br>
&gt;&nbsp; #include &lt;media/cec.h&gt;<br>
&gt;&nbsp; <br>
&gt;&nbsp; /*<br>
&gt; @@ -295,7 &#43;297,10 @@ static void drm_dp_cec_unregister_work(struct=
 work_struct *work)<br>
&gt;&nbsp;&nbsp; */<br>
&gt;&nbsp; void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct ed=
id *edid)<br>
&gt;&nbsp; {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; u32 cec_caps =3D CEC_CAP_DEFAULTS | CEC_CAP_=
NEEDS_HPD;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_connector *connector =3D aux-=
&gt;cec.connector;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; u32 cec_caps =3D CEC_CAP_DEFAULTS | CEC_=
CAP_NEEDS_HPD |<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CEC_CAP_CONNECTOR_INFO;<b=
r>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct cec_connector_info conn_info;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int num_las =3D 1;<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u8 cap;<br>
&gt;&nbsp; <br>
&gt; @@ -344,13 &#43;349,17 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *=
aux, const struct edid *edid)<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Create a new adapter */<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; aux-&gt;cec.adap =3D cec_all=
ocate_adapter(&amp;drm_dp_cec_adap_ops,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; aux, aux-&gt;cec.name, cec_caps,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; aux, connector-&gt;name, cec_caps,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; num_las);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (IS_ERR(aux-&gt;cec.adap)=
) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; aux-&gt;cec.adap =3D NULL;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; goto unlock;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (cec_register_adapter(aux-&gt;cec.adap, a=
ux-&gt;cec.parent)) {<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; cec_fill_conn_info_from_drm(&amp;conn_in=
fo, connector);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; cec_s_conn_info(aux-&gt;cec.adap, &amp;c=
onn_info);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (cec_register_adapter(aux-&gt;cec.ada=
p, connector-&gt;dev-&gt;dev)) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; cec_delete_adapter(aux-&gt;cec.adap);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; aux-&gt;cec.adap =3D NULL;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; @@ -406,22 &#43;415,20 @@ EXPORT_SYMBOL(drm_dp_cec_unset_edid);<br>
&gt;&nbsp; /**<br>
&gt;&nbsp;&nbsp; * drm_dp_cec_register_connector() - register a new connect=
or<br>
&gt;&nbsp;&nbsp; * @aux: DisplayPort AUX channel<br>
&gt; - * @name: name of the CEC device<br>
&gt; - * @parent: parent device<br>
&gt; &#43; * @connector: drm connector<br>
&gt;&nbsp;&nbsp; *<br>
&gt;&nbsp;&nbsp; * A new connector was registered with associated CEC adapt=
er name and<br>
&gt;&nbsp;&nbsp; * CEC adapter parent device. After registering the name an=
d parent<br>
&gt;&nbsp;&nbsp; * drm_dp_cec_set_edid() is called to check if the connecto=
r supports<br>
&gt;&nbsp;&nbsp; * CEC and to register a CEC adapter if that is the case.<b=
r>
&gt;&nbsp;&nbsp; */<br>
&gt; -void drm_dp_cec_register_connector(struct drm_dp_aux *aux, const char=
 *name,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct device *parent)<br>
&gt; &#43;void drm_dp_cec_register_connector(struct drm_dp_aux *aux,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_connector *connec=
tor)<br>
&gt;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WARN_ON(aux-&gt;cec.adap);<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (WARN_ON(!aux-&gt;transfe=
r))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; aux-&gt;cec.name =3D name;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; aux-&gt;cec.parent =3D parent;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; aux-&gt;cec.connector =3D connector;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INIT_DELAYED_WORK(&amp;aux-&=
gt;cec.unregister_work,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; drm_dp_cec_unregister_work);<br>
&gt;&nbsp; }<br>
&gt; diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm=
/i915/display/intel_dp.c<br>
&gt; index 1092499115760..de2486fe7bf2d 100644<br>
&gt; --- a/drivers/gpu/drm/i915/display/intel_dp.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/i915/display/intel_dp.c<br>
&gt; @@ -5497,7 &#43;5497,6 @@ static int<br>
&gt;&nbsp; intel_dp_connector_register(struct drm_connector *connector)<br>
&gt;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct intel_dp *intel_dp =
=3D intel_attached_dp(connector);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; struct drm_device *dev =3D connector-&gt;dev=
;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D intel_connector_regi=
ster(connector);<br>
&gt; @@ -5512,8 &#43;5511,7 @@ intel_dp_connector_register(struct drm_conne=
ctor *connector)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; intel_dp-&gt;aux.dev =3D con=
nector-&gt;kdev;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drm_dp_aux_register(=
&amp;intel_dp-&gt;aux);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ret)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; drm_dp_cec_register_connector(&amp;intel_dp-&gt;aux,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; connector-&gt;name, dev-&gt;dev);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; drm_dp_cec_register_connector(&amp;intel_dp-&gt;aux, connector);<br=
>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt;&nbsp; }<br>
&gt;&nbsp; <br>
&gt; diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu=
/drm/nouveau/nouveau_connector.c<br>
&gt; index 330d7d29a6e34..8aa703347eb54 100644<br>
&gt; --- a/drivers/gpu/drm/nouveau/nouveau_connector.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/nouveau/nouveau_connector.c<br>
&gt; @@ -1416,8 &#43;1416,7 @@ nouveau_connector_create(struct drm_device *=
dev,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (type) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case DRM_MODE_CONNECTOR_Disp=
layPort:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case DRM_MODE_CONNECTOR_eDP:=
<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; drm_dp_cec_register_connector(&amp;nv_connector-&gt;aux,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; connector-&gt;name, dev-&gt;dev);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; drm_dp_cec_register_connector(&amp;nv_connector-&gt;aux, connector)=
;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; break;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt; diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h=
<br>
&gt; index 8364502f92cfe..7972b925a952b 100644<br>
&gt; --- a/include/drm/drm_dp_helper.h<br>
&gt; &#43;&#43;&#43; b/include/drm/drm_dp_helper.h<br>
&gt; @@ -1230,20 &#43;1230,19 @@ struct drm_dp_aux_msg {<br>
&gt;&nbsp; <br>
&gt;&nbsp; struct cec_adapter;<br>
&gt;&nbsp; struct edid;<br>
&gt; &#43;struct drm_connector;<br>
&gt;&nbsp; <br>
&gt;&nbsp; /**<br>
&gt;&nbsp;&nbsp; * struct drm_dp_aux_cec - DisplayPort CEC-Tunneling-over-A=
UX<br>
&gt;&nbsp;&nbsp; * @lock: mutex protecting this struct<br>
&gt;&nbsp;&nbsp; * @adap: the CEC adapter for CEC-Tunneling-over-AUX suppor=
t.<br>
&gt; - * @name: name of the CEC adapter<br>
&gt; - * @parent: parent device of the CEC adapter<br>
&gt; &#43; * @connector: the connector this CEC adapter is associated with<=
br>
&gt;&nbsp;&nbsp; * @unregister_work: unregister the CEC adapter<br>
&gt;&nbsp;&nbsp; */<br>
&gt;&nbsp; struct drm_dp_aux_cec {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mutex lock;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct cec_adapter *adap;<br=
>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; const char *name;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; struct device *parent;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_connector *connector;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct delayed_work unregist=
er_work;<br>
&gt;&nbsp; };<br>
&gt;&nbsp; <br>
&gt; @@ -1451,8 &#43;1450,8 @@ drm_dp_has_quirk(const struct drm_dp_desc *d=
esc, enum drm_dp_quirk quirk)<br>
&gt;&nbsp; <br>
&gt;&nbsp; #ifdef CONFIG_DRM_DP_CEC<br>
&gt;&nbsp; void drm_dp_cec_irq(struct drm_dp_aux *aux);<br>
&gt; -void drm_dp_cec_register_connector(struct drm_dp_aux *aux, const char=
 *name,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct device *parent);<br>
&gt; &#43;void drm_dp_cec_register_connector(struct drm_dp_aux *aux,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_connector *connec=
tor);<br>
&gt;&nbsp; void drm_dp_cec_unregister_connector(struct drm_dp_aux *aux);<br=
>
&gt;&nbsp; void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct ed=
id *edid);<br>
&gt;&nbsp; void drm_dp_cec_unset_edid(struct drm_dp_aux *aux);<br>
&gt; @@ -1461,9 &#43;1460,9 @@ static inline void drm_dp_cec_irq(struct drm=
_dp_aux *aux)<br>
&gt;&nbsp; {<br>
&gt;&nbsp; }<br>
&gt;&nbsp; <br>
&gt; -static inline void drm_dp_cec_register_connector(struct drm_dp_aux *a=
ux,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *name,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct device *parent)<=
br>
&gt; &#43;static inline void<br>
&gt; &#43;drm_dp_cec_register_connector(struct drm_dp_aux *aux,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; struct drm_connector *connector)<br>
&gt;&nbsp; {<br>
&gt;&nbsp; }<br>
&gt;&nbsp; <br>
&gt; <br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB1809F2FD206B4E969ECBE24DF7A50BN6PR12MB1809namp_--

--===============1698801836==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1698801836==--
