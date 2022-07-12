Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7ED3572530
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 21:15:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F9C99616C;
	Tue, 12 Jul 2022 19:15:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D31C89616A;
 Tue, 12 Jul 2022 19:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657653343; x=1689189343;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/sdK0FEkpiOoXjraCXPiLyEFkAlMl978MVFjBouFObM=;
 b=YuaoiBbIfJfyNaBYvVGHBNVE3Fgp7fjpAPRTbtpll72B3WkXNj28i/dr
 urZEh/0VTFdB4bONLg6MYXfJ1yvBM9mrAVG2DUJXd6zQOoiCCGTnwtDxP
 DzsXynhg12cMnhh4viT1h6FOL0fBKIcy0Zyor1j6d/y5D1X16Q9AFlUvx I=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 12 Jul 2022 12:15:43 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 12:15:43 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 12 Jul 2022 12:15:22 -0700
Received: from [10.38.240.216] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 12 Jul
 2022 12:15:19 -0700
Message-ID: <198b7ed9-2058-05b5-7845-74dd7f1b2ed0@quicinc.com>
Date: Tue, 12 Jul 2022 12:15:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH v2 4/4] drm/msm/dsi: switch to DRM_PANEL_BRIDGE
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220711094320.368062-1-dmitry.baryshkov@linaro.org>
 <20220711094320.368062-5-dmitry.baryshkov@linaro.org>
 <0abf1924-485b-8f1c-c8c8-d14dcccc3a27@quicinc.com>
 <CAA8EJpoMk809zFUTg52qXQf+RpZdCWamx42GKxJ=3MqTt5b9zQ@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpoMk809zFUTg52qXQf+RpZdCWamx42GKxJ=3MqTt5b9zQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Thierry
 Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/12/2022 3:00 AM, Dmitry Baryshkov wrote:
> On Tue, 12 Jul 2022 at 01:39, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 7/11/2022 2:43 AM, Dmitry Baryshkov wrote:
>>> Currently the DSI driver has two separate paths: one if the next device
>>> in a chain is a bridge and another one if the panel is connected
>>> directly to the DSI host. Simplify the code path by using panel-bridge
>>> driver (already selected in Kconfig) and dropping support for
>>> handling the panel directly.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/dsi/dsi.c         |  38 +---
>>>    drivers/gpu/drm/msm/dsi/dsi.h         |  14 +-
>>>    drivers/gpu/drm/msm/dsi/dsi_host.c    |  25 ---
>>>    drivers/gpu/drm/msm/dsi/dsi_manager.c | 264 ++------------------------
>>>    4 files changed, 26 insertions(+), 315 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
>>> index 1625328fa430..3c53e28092db 100644
>>> --- a/drivers/gpu/drm/msm/dsi/dsi.c
>>> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
>>> @@ -6,14 +6,6 @@
>>>    #include "dsi.h"
>>>    #include "dsi_cfg.h"
>>>
>>> -struct drm_encoder *msm_dsi_get_encoder(struct msm_dsi *msm_dsi)
>>> -{
>>> -     if (!msm_dsi || !msm_dsi_device_connected(msm_dsi))
>>> -             return NULL;
>>> -
>>> -     return msm_dsi->encoder;
>>> -}
>>
>> panel_bridge doesnt have the best_encoder method today.
>> Today, this does not break anything for us.
>> But, for future if we do need it, panel_bridge needs to be expanded to
>> add that method?
> 
> We have a 1:1 between encoder and connector, so
> drm_connector_get_single_encoder() works well in our case.
> 
like I said before, today this should be fine.
If we do come up with a use-case in future to have the best_encoder() 
panel_bridge will need to be expanded. So this is more of a comment to 
keep in mind but no change needed for this.

>>
>>> -
>>>    bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi)
>>>    {
>>>        unsigned long host_flags = msm_dsi_host_get_mode_flags(msm_dsi->host);
>>> @@ -220,7 +212,7 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
>>>                         struct drm_encoder *encoder)
>>>    {
>>>        struct msm_drm_private *priv;
>>> -     struct drm_bridge *ext_bridge;
>>> +     struct drm_connector *connector;
>>>        int ret;
>>>
>>>        if (WARN_ON(!encoder) || WARN_ON(!msm_dsi) || WARN_ON(!dev))
>>> @@ -254,26 +246,12 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
>>>                goto fail;
>>>        }
>>>
>>> -     /*
>>> -      * check if the dsi encoder output is connected to a panel or an
>>> -      * external bridge. We create a connector only if we're connected to a
>>> -      * drm_panel device. When we're connected to an external bridge, we
>>> -      * assume that the drm_bridge driver will create the connector itself.
>>> -      */
>>> -     ext_bridge = msm_dsi_host_get_bridge(msm_dsi->host);
>>> -
>>> -     if (ext_bridge)
>>> -             msm_dsi->connector =
>>> -                     msm_dsi_manager_ext_bridge_init(msm_dsi->id);
>>> -     else
>>> -             msm_dsi->connector =
>>> -                     msm_dsi_manager_connector_init(msm_dsi->id);
>>> -
>>> -     if (IS_ERR(msm_dsi->connector)) {
>>> -             ret = PTR_ERR(msm_dsi->connector);
>>> +     connector = msm_dsi_manager_ext_bridge_init(msm_dsi->id);
>>> +
>>> +     if (IS_ERR(connector)) {
>>> +             ret = PTR_ERR(connector);
>>>                DRM_DEV_ERROR(dev->dev,
>>>                        "failed to create dsi connector: %d\n", ret);
>>> -             msm_dsi->connector = NULL;
>>>                goto fail;
>>>        }
>>>
>>> @@ -287,12 +265,6 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
>>>                msm_dsi->bridge = NULL;
>>>        }
>>>
>>> -     /* don't destroy connector if we didn't make it */
>>> -     if (msm_dsi->connector && !msm_dsi->external_bridge)
>>> -             msm_dsi->connector->funcs->destroy(msm_dsi->connector);
>>> -
>>> -     msm_dsi->connector = NULL;
>>> -
>>>        return ret;
>>>    }
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
>>> index 580a1e6358bf..41630b8f5358 100644
>>> --- a/drivers/gpu/drm/msm/dsi/dsi.h
>>> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
>>> @@ -12,7 +12,6 @@
>>>    #include <drm/drm_bridge.h>
>>>    #include <drm/drm_crtc.h>
>>>    #include <drm/drm_mipi_dsi.h>
>>> -#include <drm/drm_panel.h>
>>>
>>>    #include "msm_drv.h"
>>>    #include "disp/msm_disp_snapshot.h"
>>> @@ -49,8 +48,6 @@ struct msm_dsi {
>>>        struct drm_device *dev;
>>>        struct platform_device *pdev;
>>>
>>> -     /* connector managed by us when we're connected to a drm_panel */
>>> -     struct drm_connector *connector;
>>>        /* internal dsi bridge attached to MDP interface */
>>>        struct drm_bridge *bridge;
>>>
>>> @@ -58,10 +55,8 @@ struct msm_dsi {
>>>        struct msm_dsi_phy *phy;
>>>
>>>        /*
>>> -      * panel/external_bridge connected to dsi bridge output, only one of the
>>> -      * two can be valid at a time
>>> +      * external_bridge connected to dsi bridge output
>>>         */
>>> -     struct drm_panel *panel;
>>>        struct drm_bridge *external_bridge;
>>>
>>>        struct device *phy_dev;
>>> @@ -76,7 +71,6 @@ struct msm_dsi {
>>>    /* dsi manager */
>>>    struct drm_bridge *msm_dsi_manager_bridge_init(u8 id);
>>>    void msm_dsi_manager_bridge_destroy(struct drm_bridge *bridge);
>>> -struct drm_connector *msm_dsi_manager_connector_init(u8 id);
>>>    struct drm_connector *msm_dsi_manager_ext_bridge_init(u8 id);
>>>    int msm_dsi_manager_cmd_xfer(int id, const struct mipi_dsi_msg *msg);
>>>    bool msm_dsi_manager_cmd_xfer_trigger(int id, u32 dma_base, u32 len);
>>> @@ -87,11 +81,9 @@ void msm_dsi_manager_tpg_enable(void);
>>>    /* msm dsi */
>>>    static inline bool msm_dsi_device_connected(struct msm_dsi *msm_dsi)
>>>    {
>>> -     return msm_dsi->panel || msm_dsi->external_bridge;
>>> +     return msm_dsi->external_bridge;
>>>    }
>>>
>>> -struct drm_encoder *msm_dsi_get_encoder(struct msm_dsi *msm_dsi);
>>> -
>>>    /* dsi host */
>>>    struct msm_dsi_host;
>>>    int msm_dsi_host_xfer_prepare(struct mipi_dsi_host *host,
>>> @@ -116,9 +108,7 @@ int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
>>>                                  const struct drm_display_mode *mode);
>>>    enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
>>>                                            const struct drm_display_mode *mode);
>>> -struct drm_panel *msm_dsi_host_get_panel(struct mipi_dsi_host *host);
>>>    unsigned long msm_dsi_host_get_mode_flags(struct mipi_dsi_host *host);
>>> -struct drm_bridge *msm_dsi_host_get_bridge(struct mipi_dsi_host *host);
>>>    int msm_dsi_host_register(struct mipi_dsi_host *host);
>>>    void msm_dsi_host_unregister(struct mipi_dsi_host *host);
>>>    void msm_dsi_host_set_phy_mode(struct mipi_dsi_host *host,
>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> index fb5ab6c718c8..5a18aa710d00 100644
>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> @@ -164,7 +164,6 @@ struct msm_dsi_host {
>>>        struct msm_display_dsc_config *dsc;
>>>
>>>        /* connected device info */
>>> -     struct device_node *device_node;
>>>        unsigned int channel;
>>>        unsigned int lanes;
>>>        enum mipi_dsi_pixel_format format;
>>> @@ -1721,8 +1720,6 @@ static int dsi_host_detach(struct mipi_dsi_host *host,
>>>
>>>        dsi_dev_detach(msm_host->pdev);
>>>
>>> -     msm_host->device_node = NULL;
>>> -
>>>        DBG("id=%d", msm_host->id);
>>>        if (msm_host->dev)
>>>                queue_work(msm_host->workqueue, &msm_host->hpd_work);
>>> @@ -1988,16 +1985,6 @@ static int dsi_host_parse_dt(struct msm_dsi_host *msm_host)
>>>                goto err;
>>>        }
>>>
>>> -     /* Get panel node from the output port's endpoint data */
>>> -     device_node = of_graph_get_remote_node(np, 1, 0);
>>> -     if (!device_node) {
>>> -             DRM_DEV_DEBUG(dev, "%s: no valid device\n", __func__);
>>> -             ret = -ENODEV;
>>> -             goto err;
>>> -     }
>>> -
>>> -     msm_host->device_node = device_node;
>>> -
>>>        if (of_property_read_bool(np, "syscon-sfpb")) {
>>>                msm_host->sfpb = syscon_regmap_lookup_by_phandle(np,
>>>                                        "syscon-sfpb");
>>> @@ -2678,23 +2665,11 @@ enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
>>>        return MODE_OK;
>>>    }
>>>
>>> -struct drm_panel *msm_dsi_host_get_panel(struct mipi_dsi_host *host)
>>> -{
>>> -     return of_drm_find_panel(to_msm_dsi_host(host)->device_node);
>>> -}
>>> -
>>>    unsigned long msm_dsi_host_get_mode_flags(struct mipi_dsi_host *host)
>>>    {
>>>        return to_msm_dsi_host(host)->mode_flags;
>>>    }
>>>
>>> -struct drm_bridge *msm_dsi_host_get_bridge(struct mipi_dsi_host *host)
>>> -{
>>> -     struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>>> -
>>> -     return of_drm_find_bridge(msm_host->device_node);
>>> -}
>>> -
>>>    void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct mipi_dsi_host *host)
>>>    {
>>>        struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>> index cb84d185d73a..3970368e07d5 100644
>>> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>> @@ -214,39 +214,26 @@ static void dsi_mgr_phy_disable(int id)
>>>        }
>>>    }
>>>
>>> -struct dsi_connector {
>>> -     struct drm_connector base;
>>> -     int id;
>>> -};
>>> -
>>>    struct dsi_bridge {
>>>        struct drm_bridge base;
>>>        int id;
>>>    };
>>>
>>> -#define to_dsi_connector(x) container_of(x, struct dsi_connector, base)
>>>    #define to_dsi_bridge(x) container_of(x, struct dsi_bridge, base)
>>>
>>> -static inline int dsi_mgr_connector_get_id(struct drm_connector *connector)
>>> -{
>>> -     struct dsi_connector *dsi_connector = to_dsi_connector(connector);
>>> -     return dsi_connector->id;
>>> -}
>>> -
>>>    static int dsi_mgr_bridge_get_id(struct drm_bridge *bridge)
>>>    {
>>>        struct dsi_bridge *dsi_bridge = to_dsi_bridge(bridge);
>>>        return dsi_bridge->id;
>>>    }
>>>
>>> -static int msm_dsi_manager_panel_init(struct drm_connector *conn, u8 id)
>>> +static void msm_dsi_manager_set_split_display(u8 id)
>>>    {
>>> -     struct msm_drm_private *priv = conn->dev->dev_private;
>>> -     struct msm_kms *kms = priv->kms;
>>>        struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>>>        struct msm_dsi *other_dsi = dsi_mgr_get_other_dsi(id);
>>> +     struct msm_drm_private *priv = msm_dsi->dev->dev_private;
>>> +     struct msm_kms *kms = priv->kms;
>>>        struct msm_dsi *master_dsi, *slave_dsi;
>>> -     struct drm_panel *panel;
>>>
>>>        if (IS_BONDED_DSI() && !IS_MASTER_DSI_LINK(id)) {
>>>                master_dsi = other_dsi;
>>> @@ -256,89 +243,18 @@ static int msm_dsi_manager_panel_init(struct drm_connector *conn, u8 id)
>>>                slave_dsi = other_dsi;
>>>        }
>>>
>>> -     /*
>>> -      * There is only 1 panel in the global panel list for bonded DSI mode.
>>> -      * Therefore slave dsi should get the drm_panel instance from master
>>> -      * dsi.
>>> -      */
>>> -     panel = msm_dsi_host_get_panel(master_dsi->host);
>>> -     if (IS_ERR(panel)) {
>>> -             DRM_ERROR("Could not find panel for %u (%ld)\n", msm_dsi->id,
>>> -                       PTR_ERR(panel));
>>> -             return PTR_ERR(panel);
>>> -     }
>>> -
>>> -     if (!panel || !IS_BONDED_DSI())
>>> -             goto out;
>>> -
>>> -     drm_object_attach_property(&conn->base,
>>> -                                conn->dev->mode_config.tile_property, 0);
>>> +     if (!msm_dsi->external_bridge || !IS_BONDED_DSI())
>>> +             return;
>>>
>>>        /*
>>>         * Set split display info to kms once bonded DSI panel is connected to
>>>         * both hosts.
>>>         */
>>> -     if (other_dsi && other_dsi->panel && kms->funcs->set_split_display) {
>>> +     if (other_dsi && other_dsi->external_bridge && kms->funcs->set_split_display) {
>>>                kms->funcs->set_split_display(kms, master_dsi->encoder,
>>>                                              slave_dsi->encoder,
>>>                                              msm_dsi_is_cmd_mode(msm_dsi));
>>>        }
>>> -
>>> -out:
>>> -     msm_dsi->panel = panel;
>>> -     return 0;
>>> -}
>>> -
>>> -static enum drm_connector_status dsi_mgr_connector_detect(
>>> -             struct drm_connector *connector, bool force)
>>> -{
>>> -     int id = dsi_mgr_connector_get_id(connector);
>>> -     struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>>> -
>>> -     return msm_dsi->panel ? connector_status_connected :
>>> -             connector_status_disconnected;
>>> -}
>>> -
>>> -static void dsi_mgr_connector_destroy(struct drm_connector *connector)
>>> -{
>>> -     struct dsi_connector *dsi_connector = to_dsi_connector(connector);
>>> -
>>> -     DBG("");
>>> -
>>> -     drm_connector_cleanup(connector);
>>> -
>>> -     kfree(dsi_connector);
>>> -}
>>> -
>>> -static int dsi_mgr_connector_get_modes(struct drm_connector *connector)
>>> -{
>>> -     int id = dsi_mgr_connector_get_id(connector);
>>> -     struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>>> -     struct drm_panel *panel = msm_dsi->panel;
>>> -     int num;
>>> -
>>> -     if (!panel)
>>> -             return 0;
>>> -
>>> -     /*
>>> -      * In bonded DSI mode, we have one connector that can be
>>> -      * attached to the drm_panel.
>>> -      */
>>> -     num = drm_panel_get_modes(panel, connector);
>>> -     if (!num)
>>> -             return 0;
>>> -
>>> -     return num;
>>> -}
>>> -
>>> -static struct drm_encoder *
>>> -dsi_mgr_connector_best_encoder(struct drm_connector *connector)
>>> -{
>>> -     int id = dsi_mgr_connector_get_id(connector);
>>> -     struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>>> -
>>> -     DBG("");
>>> -     return msm_dsi_get_encoder(msm_dsi);
>>>    }
>>>
>>>    static void dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
>>> @@ -403,7 +319,6 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
>>>        struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>>>        struct msm_dsi *msm_dsi1 = dsi_mgr_get_dsi(DSI_1);
>>>        struct mipi_dsi_host *host = msm_dsi->host;
>>> -     struct drm_panel *panel = msm_dsi->panel;
>>>        bool is_bonded_dsi = IS_BONDED_DSI();
>>>        int ret;
>>>
>>> @@ -418,18 +333,6 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
>>>        if (!dsi_mgr_power_on_early(bridge))
>>>                dsi_mgr_bridge_power_on(bridge);
>>>
>>> -     /* Always call panel functions once, because even for dual panels,
>>> -      * there is only one drm_panel instance.
>>> -      */
>>> -     if (panel) {
>>> -             ret = drm_panel_prepare(panel);
>>> -             if (ret) {
>>> -                     pr_err("%s: prepare panel %d failed, %d\n", __func__,
>>> -                                                             id, ret);
>>> -                     goto panel_prep_fail;
>>> -             }
>>> -     }
>>> -
>>>        ret = msm_dsi_host_enable(host);
>>>        if (ret) {
>>>                pr_err("%s: enable host %d failed, %d\n", __func__, id, ret);
>>> @@ -449,9 +352,6 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
>>>    host1_en_fail:
>>>        msm_dsi_host_disable(host);
>>>    host_en_fail:
>>> -     if (panel)
>>> -             drm_panel_unprepare(panel);
>>> -panel_prep_fail:
>>>
>>>        return;
>>>    }
>>> @@ -469,62 +369,12 @@ void msm_dsi_manager_tpg_enable(void)
>>>        }
>>>    }
>>>
>>> -static void dsi_mgr_bridge_enable(struct drm_bridge *bridge)
>>> -{
>>> -     int id = dsi_mgr_bridge_get_id(bridge);
>>> -     struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>>> -     struct drm_panel *panel = msm_dsi->panel;
>>> -     bool is_bonded_dsi = IS_BONDED_DSI();
>>> -     int ret;
>>> -
>>> -     DBG("id=%d", id);
>>> -     if (!msm_dsi_device_connected(msm_dsi))
>>> -             return;
>>> -
>>> -     /* Do nothing with the host if it is slave-DSI in case of bonded DSI */
>>> -     if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
>>> -             return;
>>> -
>>> -     if (panel) {
>>> -             ret = drm_panel_enable(panel);
>>> -             if (ret) {
>>> -                     pr_err("%s: enable panel %d failed, %d\n", __func__, id,
>>> -                                                                     ret);
>>> -             }
>>> -     }
>>> -}
>>> -
>>> -static void dsi_mgr_bridge_disable(struct drm_bridge *bridge)
>>> -{
>>> -     int id = dsi_mgr_bridge_get_id(bridge);
>>> -     struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>>> -     struct drm_panel *panel = msm_dsi->panel;
>>> -     bool is_bonded_dsi = IS_BONDED_DSI();
>>> -     int ret;
>>> -
>>> -     DBG("id=%d", id);
>>> -     if (!msm_dsi_device_connected(msm_dsi))
>>> -             return;
>>> -
>>> -     /* Do nothing with the host if it is slave-DSI in case of bonded DSI */
>>> -     if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
>>> -             return;
>>> -
>>> -     if (panel) {
>>> -             ret = drm_panel_disable(panel);
>>> -             if (ret)
>>> -                     pr_err("%s: Panel %d OFF failed, %d\n", __func__, id,
>>> -                                                                     ret);
>>> -     }
>>> -}
>>> -
>>>    static void dsi_mgr_bridge_post_disable(struct drm_bridge *bridge)
>>>    {
>>>        int id = dsi_mgr_bridge_get_id(bridge);
>>>        struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>>>        struct msm_dsi *msm_dsi1 = dsi_mgr_get_dsi(DSI_1);
>>>        struct mipi_dsi_host *host = msm_dsi->host;
>>> -     struct drm_panel *panel = msm_dsi->panel;
>>>        bool is_bonded_dsi = IS_BONDED_DSI();
>>>        int ret;
>>>
>>> @@ -551,13 +401,6 @@ static void dsi_mgr_bridge_post_disable(struct drm_bridge *bridge)
>>>                        pr_err("%s: host1 disable failed, %d\n", __func__, ret);
>>>        }
>>>
>>> -     if (panel) {
>>> -             ret = drm_panel_unprepare(panel);
>>> -             if (ret)
>>> -                     pr_err("%s: Panel %d unprepare failed,%d\n", __func__,
>>> -                                                             id, ret);
>>> -     }
>>> -
>>>        msm_dsi_host_disable_irq(host);
>>>        if (is_bonded_dsi && msm_dsi1)
>>>                msm_dsi_host_disable_irq(msm_dsi1->host);
>>> @@ -614,76 +457,13 @@ static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
>>>        return msm_dsi_host_check_dsc(host, mode);
>>>    }
>>>
>>> -static const struct drm_connector_funcs dsi_mgr_connector_funcs = {
>>> -     .detect = dsi_mgr_connector_detect,
>>> -     .fill_modes = drm_helper_probe_single_connector_modes,
>>> -     .destroy = dsi_mgr_connector_destroy,
>>> -     .reset = drm_atomic_helper_connector_reset,
>>> -     .atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
>>> -     .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>>> -};
>>> -
>>> -static const struct drm_connector_helper_funcs dsi_mgr_conn_helper_funcs = {
>>> -     .get_modes = dsi_mgr_connector_get_modes,
>>> -     .best_encoder = dsi_mgr_connector_best_encoder,
>>> -};
>>> -
>>>    static const struct drm_bridge_funcs dsi_mgr_bridge_funcs = {
>>>        .pre_enable = dsi_mgr_bridge_pre_enable,
>>> -     .enable = dsi_mgr_bridge_enable,
>>> -     .disable = dsi_mgr_bridge_disable,
>>>        .post_disable = dsi_mgr_bridge_post_disable,
>>>        .mode_set = dsi_mgr_bridge_mode_set,
>>>        .mode_valid = dsi_mgr_bridge_mode_valid,
>>>    };
>>>
>>> -/* initialize connector when we're connected to a drm_panel */
>>> -struct drm_connector *msm_dsi_manager_connector_init(u8 id)
>>> -{
>>> -     struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>>> -     struct drm_connector *connector = NULL;
>>> -     struct dsi_connector *dsi_connector;
>>> -     int ret;
>>> -
>>> -     dsi_connector = kzalloc(sizeof(*dsi_connector), GFP_KERNEL);
>>> -     if (!dsi_connector)
>>> -             return ERR_PTR(-ENOMEM);
>>> -
>>> -     dsi_connector->id = id;
>>> -
>>> -     connector = &dsi_connector->base;
>>> -
>>> -     ret = drm_connector_init(msm_dsi->dev, connector,
>>> -                     &dsi_mgr_connector_funcs, DRM_MODE_CONNECTOR_DSI);
>>> -     if (ret)
>>> -             return ERR_PTR(ret);
>>> -
>>> -     drm_connector_helper_add(connector, &dsi_mgr_conn_helper_funcs);
>>> -
>>> -     /* Enable HPD to let hpd event is handled
>>> -      * when panel is attached to the host.
>>> -      */
>>> -     connector->polled = DRM_CONNECTOR_POLL_HPD;
>>
>> I see that this part gets removed with this migration.
>>
>> For fixed/built-in displays, it should not matter i think but i am not
>> sure if some usermodes might expect this even for DSI?
>>
>> So, once again does panel_bridge needs to account for this?
> 
> Panel bridge sets only DRM_BRIDGE_OP_MODES. If you check the existing
> code, the dsi_mgr_connector also does not provide HPD support. It only
> can return panel status depending on whether the drm_panel was fetched
> or not. No events are generated ever.
> Thus said I think we should stop hijacking the usual mechanisms. If we
> do not do the HPD, let's not declare it. If there is a case of panel
> being hotplugged or switched, it will be handled by the next bridge in
> the chain, not by the MSM DSI code.
> 
hot plug events are sent today.


static void dsi_hpd_worker(struct work_struct *work)
{
     struct msm_dsi_host *msm_host =
         container_of(work, struct msm_dsi_host, hpd_work);

     drm_helper_hpd_irq_event(msm_host->dev);
}

If you are planning to drop DRM_CONNECTOR_POLL_HPD, then you should 
remove all this code as well because its just dead code otherwise.

I agree, the hot plug handling can be done by the next bridge in the chain.

Then lets cleanup this code too.

>>
>>
>>> -
>>> -     /* Display driver doesn't support interlace now. */
>>> -     connector->interlace_allowed = 0;
>>> -     connector->doublescan_allowed = 0;
>>> -
>>> -     drm_connector_attach_encoder(connector, msm_dsi->encoder);
>>> -
>>> -     ret = msm_dsi_manager_panel_init(connector, id);
>>> -     if (ret) {
>>> -             DRM_DEV_ERROR(msm_dsi->dev->dev, "init panel failed %d\n", ret);
>>> -             goto fail;
>>> -     }
>>> -
>>> -     return connector;
>>> -
>>> -fail:
>>> -     connector->funcs->destroy(connector);
>>> -     return ERR_PTR(ret);
>>> -}
>>> -
>>>    /* initialize bridge */
>>>    struct drm_bridge *msm_dsi_manager_bridge_init(u8 id)
>>>    {
>>> @@ -732,8 +512,11 @@ struct drm_connector *msm_dsi_manager_ext_bridge_init(u8 id)
>>>        int ret;
>>>
>>>        int_bridge = msm_dsi->bridge;
>>> -     ext_bridge = msm_dsi->external_bridge =
>>> -                     msm_dsi_host_get_bridge(msm_dsi->host);
>>> +     ext_bridge = devm_drm_of_get_bridge(&msm_dsi->pdev->dev, msm_dsi->pdev->dev.of_node, 1, 0);
>>> +     if (IS_ERR(ext_bridge))
>>> +             return ERR_CAST(ext_bridge);
>>> +
>>> +     msm_dsi->external_bridge = ext_bridge;
>>>
>>>        encoder = msm_dsi->encoder;
>>>
>>> @@ -745,25 +528,12 @@ struct drm_connector *msm_dsi_manager_ext_bridge_init(u8 id)
>>>        ret = drm_bridge_attach(encoder, ext_bridge, int_bridge,
>>>                        DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>>        if (ret == -EINVAL) {
>>> -             struct drm_connector *connector;
>>> -             struct list_head *connector_list;
>>> -
>>>                /* link the internal dsi bridge to the external bridge */
>>> -             drm_bridge_attach(encoder, ext_bridge, int_bridge, 0);
>>> +             ret = drm_bridge_attach(encoder, ext_bridge, int_bridge, 0);
>>> +             if (ret < 0)
>>> +                     return ERR_PTR(ret);
>>>
>>> -             /*
>>> -              * we need the drm_connector created by the external bridge
>>> -              * driver (or someone else) to feed it to our driver's
>>> -              * priv->connector[] list, mainly for msm_fbdev_init()
>>> -              */
>>> -             connector_list = &dev->mode_config.connector_list;
>>> -
>>> -             list_for_each_entry(connector, connector_list, head) {
>>> -                     if (drm_connector_has_possible_encoder(connector, encoder))
>>> -                             return connector;
>>> -             }
>>> -
>>> -             return ERR_PTR(-ENODEV);
>>> +             goto out;
>>>        }
>>>
>>>        connector = drm_bridge_connector_init(dev, encoder);
>>> @@ -774,6 +544,10 @@ struct drm_connector *msm_dsi_manager_ext_bridge_init(u8 id)
>>>
>>>        drm_connector_attach_encoder(connector, encoder);
>>>
>>> +out:
>>> +     /* The pipeline is ready, ping encoders if necessary */
>>> +     msm_dsi_manager_set_split_display(id);
>> Do you still want to execute msm_dsi_manager_set_split_display even for
>> the error case? Like in the above lines you have replaced the return
>> ERR_PTR() with the goto out. But do you want to then move the
>> set_split_display() call above the out label?
> 
> You see, the return ERR_PTR was the error case, where we could not
> find the connector corresponding to the encoder.
> We just don't need it anymore. Let's change the function to return int
> rather than the unused connector.
> 
>>
>> Also, now for the cases where there was an error where the connector was
>> not found, we will return a NULL ptr instead of the ERR_PTR(-ENODEV).
>> Is that expected?
> 
> Yes. We just do not care anymore about this connector.
> 

My question was do you want to skip even 
msm_dsi_manager_set_split_display(id) by moving it above the out label.

>>
>>> +
>>>        return connector;
>>>    }
>>>
> 
> 
> 
