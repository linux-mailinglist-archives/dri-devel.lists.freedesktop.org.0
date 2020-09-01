Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A56252588F0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 09:24:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E816E5A1;
	Tue,  1 Sep 2020 07:24:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03D96E5A1;
 Tue,  1 Sep 2020 07:24:04 +0000 (UTC)
IronPort-SDR: 1aUhd0/pAnICW74Z22V/LW+aB3XtBT1Ogge5bTbZ3t4c72gzvgWDOC/LOKgBwepIizmEnPcUtD
 D30xtjc0TSfg==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="241933104"
X-IronPort-AV: E=Sophos;i="5.76,378,1592895600"; d="scan'208";a="241933104"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 00:24:04 -0700
IronPort-SDR: aWhZmg6OP5DahhOjE2IomRafNii35pBqe3o8jA0d8hk9kWmGYJ1jcQfwU/H5xBKIcIIKI1edS8
 GEc6C2hw998Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,378,1592895600"; d="scan'208";a="325242108"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 01 Sep 2020 00:24:04 -0700
Received: from bgsmsx601.gar.corp.intel.com (10.109.78.80) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 1 Sep 2020 00:23:21 -0700
Received: from kmsmsx601.gar.corp.intel.com (172.21.219.141) by
 BGSMSX601.gar.corp.intel.com (10.109.78.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 1 Sep 2020 12:53:18 +0530
Received: from kmsmsx601.gar.corp.intel.com ([172.21.219.141]) by
 kmsmsx601.gar.corp.intel.com ([172.21.219.141]) with mapi id 15.01.1713.004;
 Tue, 1 Sep 2020 15:23:18 +0800
From: "B, Jeevan" <jeevan.b@intel.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [v3] drm/nouveau: utilize subconnector property for DP
Thread-Topic: [v3] drm/nouveau: utilize subconnector property for DP
Thread-Index: AQHWc5m07vIwWA6ZzUWq9Zq07STQmalTc/1Q
Date: Tue, 1 Sep 2020 07:23:18 +0000
Message-ID: <9054960bbd2e45129204acf5f55ed79c@intel.com>
References: <1587732655-17544-3-git-send-email-jeevan.b@intel.com>
 <1597560705-13897-1-git-send-email-jeevan.b@intel.com>
In-Reply-To: <1597560705-13897-1-git-send-email-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
x-originating-ip: [10.223.10.1]
MIME-Version: 1.0
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 Oleg Vasilev <oleg.vasilev@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>,
 "bskeggs@redhat.com" <bskeggs@redhat.com>,
 "airlied@redhat.com" <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ben Skeggs,

Gentle Reminder, Can you please take a look at the patch and provide your ack.  

Thanks 
Jeevan B 

>-----Original Message-----
>From: B, Jeevan <jeevan.b@intel.com>
>Sent: Sunday, August 16, 2020 12:22 PM
>To: nouveau@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; dri-
>devel@lists.freedesktop.org
>Cc: bskeggs@redhat.com; airlied@redhat.com;
>maarten.lankhorst@linux.intel.com; Nikula, Jani <jani.nikula@intel.com>;
>Shankar, Uma <uma.shankar@intel.com>; Oleg Vasilev
><oleg.vasilev@intel.com>; B, Jeevan <jeevan.b@intel.com>
>Subject: [v3] drm/nouveau: utilize subconnector property for DP
>
>From: Oleg Vasilev <oleg.vasilev@intel.com>
>
>Since DP-specific information is stored in driver's structures, every driver
>needs to implement subconnector property by itself.
>
>v2: rebase
>
>v3: renamed a function call
>
>Cc: Ben Skeggs <bskeggs@redhat.com>
>Cc: nouveau@lists.freedesktop.org
>Signed-off-by: Jeevan B <jeevan.b@intel.com>
>Signed-off-by: Oleg Vasilev <oleg.vasilev@intel.com>
>Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
>---
> drivers/gpu/drm/nouveau/nouveau_connector.c | 13 +++++++++++++
> drivers/gpu/drm/nouveau/nouveau_dp.c        |  9 +++++++++
> drivers/gpu/drm/nouveau/nouveau_encoder.h   |  1 +
> 3 files changed, 23 insertions(+)
>
>diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c
>b/drivers/gpu/drm/nouveau/nouveau_connector.c
>index 7674025..955afed 100644
>--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
>+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
>@@ -654,6 +654,17 @@ nouveau_connector_detect(struct drm_connector
>*connector, bool force)
> 	pm_runtime_mark_last_busy(dev->dev);
> 	pm_runtime_put_autosuspend(dev->dev);
>
>+	if (connector->connector_type ==
>DRM_MODE_CONNECTOR_DisplayPort ||
>+	    connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
>+		enum drm_mode_subconnector subconnector =
>+DRM_MODE_SUBCONNECTOR_Unknown;
>+
>+		if (conn_status == connector_status_connected &&
>nv_encoder)
>+			subconnector = nv_encoder->dp.subconnector;
>+		drm_object_property_set_value(&connector->base,
>+			connector->dev-
>>mode_config.dp_subconnector_property,
>+			subconnector);
>+	}
>+
> 	return conn_status;
> }
>
>@@ -1390,6 +1401,8 @@ nouveau_connector_create(struct drm_device *dev,
> 			kfree(nv_connector);
> 			return ERR_PTR(ret);
> 		}
>+
>+
>	drm_connector_attach_dp_subconnector_property(connector);
> 		funcs = &nouveau_connector_funcs;
> 		break;
> 	default:
>diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c
>b/drivers/gpu/drm/nouveau/nouveau_dp.c
>index 8a0f799..3eff884 100644
>--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
>+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
>@@ -62,6 +62,7 @@ nouveau_dp_detect(struct nouveau_encoder
>*nv_encoder)
> 	struct nouveau_drm *drm = nouveau_drm(dev);
> 	struct nvkm_i2c_aux *aux;
> 	u8 dpcd[8];
>+	u8 port_cap[DP_MAX_DOWNSTREAM_PORTS] = {};
> 	int ret;
>
> 	aux = nv_encoder->aux;
>@@ -72,6 +73,14 @@ nouveau_dp_detect(struct nouveau_encoder
>*nv_encoder)
> 	if (ret)
> 		return ret;
>
>+	if (dpcd[DP_DPCD_REV] > 0x10) {
>+		ret = nvkm_rdaux(aux, DP_DOWNSTREAM_PORT_0,
>+				 port_cap, DP_MAX_DOWNSTREAM_PORTS);
>+		if (ret)
>+			memset(port_cap, 0,
>DP_MAX_DOWNSTREAM_PORTS);
>+	}
>+	nv_encoder->dp.subconnector = drm_dp_subconnector_type(dpcd,
>+port_cap);
>+
> 	nv_encoder->dp.link_bw = 27000 * dpcd[1];
> 	nv_encoder->dp.link_nr = dpcd[2] & DP_MAX_LANE_COUNT_MASK;
>
>diff --git a/drivers/gpu/drm/nouveau/nouveau_encoder.h
>b/drivers/gpu/drm/nouveau/nouveau_encoder.h
>index a72c412..49b5c10 100644
>--- a/drivers/gpu/drm/nouveau/nouveau_encoder.h
>+++ b/drivers/gpu/drm/nouveau/nouveau_encoder.h
>@@ -64,6 +64,7 @@ struct nouveau_encoder {
> 			struct nv50_mstm *mstm;
> 			int link_nr;
> 			int link_bw;
>+			enum drm_mode_subconnector subconnector;
> 		} dp;
> 	};
>
>--
>2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
