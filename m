Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C40551649D3
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 17:18:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CEF289B20;
	Wed, 19 Feb 2020 16:18:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2048.outbound.protection.outlook.com [40.107.22.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 944A06E5BE;
 Wed, 19 Feb 2020 12:03:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M5dok2ALRM+7CGL2wXr0eBfM5AxNC/emkghPavjyXy3v5dSV0hf+PARDYJrbFa7DIs5x0mqGqQX4tuQlSZT5w7T5SynX/mE98u5hWI6678WHO1cC4GLQI1lNB5q2sFFBge1NLoQXZvRD7CDP70jmQqeKw5REt1NNxB2GgYZMl1TP+oAHiX/mnxaK7/L6a7bNLF0dHj0F5gZHTmRa5Xf8paEGrA9x5gyxAXCwSSPdVTfFQ1rhzVXGlDBOBnDIadpgViiwn3UZeNK3okvuv0JY26WC5IqQTLVx/e856L8Oo3go9V96RLO2Lqs+aV/nfiZUCkBadBW/OLWpYBQDlbzxFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAaJif/uA5V/if8azbw0a6CGDjdkCXq7ZGxeEYA9r58=;
 b=OdRYuFCSmJnRjjs42/3C/TVsKJ0ggpidAwfkrSITdujLtLfLR54b/87gP93iP/53Cb3TaqfQToZ7KOOXzoBJwt8JpmTdLkvmK24ls6+FuP76qj2CPVgXwrgj4AdIZt8vcZS4ksyY0Bj10++0GO1rrGcrIfbJalz4MwqjasYjAsUJm/GWifNTFmgCtltIQm0VsHhMVU0L1mBXQx0gY9zMF0zM/z1gIyI8YSgKMl2EKMZrOdBYQIAK7cP+FVOyNYlDJoAFAHOKuLgIovJTf0W6/AYoRfD6bjZiL5lSyK1WTRzNBRxQcMCxVJrf/EoO7mHAOXk4WXiV4SZT4jq1M8z/lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAaJif/uA5V/if8azbw0a6CGDjdkCXq7ZGxeEYA9r58=;
 b=H7RxP2kYeaAP/CVGMGdqbHc9w5x9dUMpaWktF8BfhQ8vQ1BMWiWXuj+ycjES4IHtbiokvkqc2xY7uzTCE28p4JsG1v3NVoVwaYWEJEEL2xAnh+pZGUJ/hJEh/Kt7aGE9lleI4B4Bq4QUleiQz93bSm21fp4hy2sn/TWF7JnmiZ8=
Received: from AM6PR03MB4517.eurprd03.prod.outlook.com (20.177.35.27) by
 AM6PR03MB5267.eurprd03.prod.outlook.com (10.255.98.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Wed, 19 Feb 2020 12:03:32 +0000
Received: from AM6PR03MB4517.eurprd03.prod.outlook.com
 ([fe80::f:4dc2:f41f:997b]) by AM6PR03MB4517.eurprd03.prod.outlook.com
 ([fe80::f:4dc2:f41f:997b%5]) with mapi id 15.20.2729.032; Wed, 19 Feb 2020
 12:03:32 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 04/52] drm: Set final_kfree in drm_dev_alloc
Thread-Topic: [PATCH 04/52] drm: Set final_kfree in drm_dev_alloc
Thread-Index: AQHV5w5groS5vlmjMU293YOjHXqBFKgiaxYA
Date: Wed, 19 Feb 2020 12:03:32 +0000
Message-ID: <99c1dcd2-a9ab-165a-8c76-587808e59ce4@epam.com>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-5-daniel.vetter@ffwll.ch>
In-Reply-To: <20200219102122.1607365-5-daniel.vetter@ffwll.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Oleksandr_Andrushchenko@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f5f3c039-88a1-4c54-0d08-08d7b533bdab
x-ms-traffictypediagnostic: AM6PR03MB5267:
x-microsoft-antispam-prvs: <AM6PR03MB5267A15086B8E2BAA305A6C9E7100@AM6PR03MB5267.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 0318501FAE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(199004)(189003)(66946007)(8936002)(66446008)(8676002)(2616005)(66556008)(91956017)(110136005)(4326008)(76116006)(7416002)(64756008)(81166006)(5660300002)(66476007)(36756003)(81156014)(71200400001)(316002)(54906003)(31686004)(2906002)(6512007)(31696002)(86362001)(6506007)(26005)(53546011)(186003)(478600001)(6486002)(55236004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR03MB5267;
 H:AM6PR03MB4517.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rs1cCTriV9FSOsUEyVaM0gv3OOcQXfrQ6Mb+6e6xxp6d3xJsUbwwxqTGkNEd2r6WFvCZ1YZYrt1yWSI4yc1XQ29aUa2JzEnoCXULmOuhVQvKSeJwqY2tI4ZmShu/YRMjEe65g8Ow7kQsG4fTrc8xjIilMUtOwpiv+2dJikiwDEdtgVsSxXk7frBjJeto6Spdq+zY+ThYv6utM1KgceQoNVbDCMb+w5/z11aUIuACatYB4CCeueXmTiJkPgUIbT0xyXwtVeAVZP69c8PYInLszFKrN6bJGnH/Sm9aqGySAszTSE1UO5WqsIg13GHdF6gaVJg2bvrIfMu/L8jaR7+7Z9eYV06TPL4jzj/RXI88WfBxqEWEM8QgMof+Mu8GjWUHYv2eWPM1xRRDfgplVwAIn8OHwOztewMW6jHpRmMh5FZhtiPWVutV+EOAnqqHk7Jf
x-ms-exchange-antispam-messagedata: uU/sa5NlWUaVNrDlL+cBWkYA+j7/l1aasFYNS9d+/BSyfbuhNSGkpenamYhJqB2BBqG6Gbkh73Tpcsj3LZ1rposGx97N3HlWiJYbD/VV3E5MeXsGXvVBuz0D2r4e2S2/RFt/FujDO5MqjYkG6z10fA==
x-ms-exchange-transport-forked: True
Content-ID: <E340FB019A314B4FA61490EBF09C7858@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5f3c039-88a1-4c54-0d08-08d7b533bdab
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2020 12:03:32.5258 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R5LqzW1Pc5Q5F7sJ/Fli9XpnupYoBfgos0JqUKkxK5/4uf4ms2iBH19OypzuyPF/NmFayTagFUkQq7b9jkkA7ub8WhGnhuhRBXY1V5GY6DlBD/gTu+kL2pDr2gpKVoEZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB5267
X-Mailman-Approved-At: Wed, 19 Feb 2020 16:18:11 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/19/20 12:20 PM, Daniel Vetter wrote:
> I also did a full review of all callers, and only the xen driver
> forgot to call drm_dev_put in the failure path. Fix that up too.
>
> v2: I noticed that xen has a drm_driver.release hook, and uses
> drm_dev_alloc(). We need to remove the kfree from
> xen_drm_drv_release().
>
> bochs also has a release hook, but leaked the drm_device ever since
>
> commit 0a6659bdc5e8221da99eebb176fd9591435e38de
> Author: Gerd Hoffmann <kraxel@redhat.com>
> Date:   Tue Dec 17 18:04:46 2013 +0100
>
>      drm/bochs: new driver
>
> This patch here fixes that leak.
>
> Same for virtio, started leaking with
>
> commit b1df3a2b24a917f8853d43fe9683c0e360d2c33a
> Author: Gerd Hoffmann <kraxel@redhat.com>
> Date:   Tue Feb 11 14:58:04 2020 +0100
>
>      drm/virtio: add drm_driver.release callback.
>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Cc: xen-devel@lists.xenproject.org
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Thank you,
Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Cc: xen-devel@lists.xenproject.org
> ---
>   drivers/gpu/drm/drm_drv.c           | 3 +++
>   drivers/gpu/drm/xen/xen_drm_front.c | 2 +-
>   2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 3e5627d6eba6..9e62e28bbc62 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -39,6 +39,7 @@
>   #include <drm/drm_color_mgmt.h>
>   #include <drm/drm_drv.h>
>   #include <drm/drm_file.h>
> +#include <drm/drm_managed.h>
>   #include <drm/drm_mode_object.h>
>   #include <drm/drm_print.h>
>   
> @@ -819,6 +820,8 @@ struct drm_device *drm_dev_alloc(struct drm_driver *driver,
>   		return ERR_PTR(ret);
>   	}
>   
> +	drmm_add_final_kfree(dev, dev);
> +
>   	return dev;
>   }
>   EXPORT_SYMBOL(drm_dev_alloc);
> diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
> index 4be49c1aef51..d22b5da38935 100644
> --- a/drivers/gpu/drm/xen/xen_drm_front.c
> +++ b/drivers/gpu/drm/xen/xen_drm_front.c
> @@ -461,7 +461,6 @@ static void xen_drm_drv_release(struct drm_device *dev)
>   	drm_mode_config_cleanup(dev);
>   
>   	drm_dev_fini(dev);
> -	kfree(dev);
>   
>   	if (front_info->cfg.be_alloc)
>   		xenbus_switch_state(front_info->xb_dev,
> @@ -561,6 +560,7 @@ static int xen_drm_drv_init(struct xen_drm_front_info *front_info)
>   fail_modeset:
>   	drm_kms_helper_poll_fini(drm_dev);
>   	drm_mode_config_cleanup(drm_dev);
> +	drm_dev_put(drm_dev);
>   fail:
>   	kfree(drm_info);
>   	return ret;
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
