Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C8EAC4C69
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 12:49:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0669410E473;
	Tue, 27 May 2025 10:49:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="uva1W8If";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A2910E473
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 10:49:35 +0000 (UTC)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54RAnIlc1727564;
 Tue, 27 May 2025 05:49:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1748342958;
 bh=7bl5VdywnS3i96TmdOmRzwUwd4apUGYUmvI14ouERyg=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=uva1W8Ifvj8YiVQELyYOB5r+FBMziJVPZFRq3QpMOReZA9VEvWB+dy94c59II2aPE
 mzYHHKxZnwGl0VCmdYT/jF7cixhnBQtehCQp2Gk2c9+/pJxMLw4E9nNvuX28ejDSm2
 EDOmAa93AfIDEsvAHC/xQGItCNSwzeEhbFQcYqjU=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54RAnIRP2774315
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Tue, 27 May 2025 05:49:18 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 May 2025 05:49:17 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 May 2025 05:49:17 -0500
Received: from [10.24.72.182] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com
 [10.24.72.182])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54RAnA73061377;
 Tue, 27 May 2025 05:49:11 -0500
Message-ID: <05948e1c-fa08-4aca-b705-b2e3a228f758@ti.com>
Date: Tue, 27 May 2025 16:19:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/3] drm/bridge: cadence: cdns-mhdp8546-core:
 Remove legacy support for connector initialisation in bridge
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <lumag@kernel.org>, <jani.nikula@intel.com>, <andy.yan@rock-chips.com>,
 <linux@treblig.org>, <viro@zeniv.linux.org.uk>, <yamonkar@cadence.com>,
 <sjakhade@cadence.com>, <linux-kernel@vger.kernel.org>,
 <devarsht@ti.com>, <dianders@chromium.org>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <dri-devel@lists.freedesktop.org>,
 <alexander.stein@ew.tq-group.com>
References: <20250521073237.366463-1-j-choudhary@ti.com>
 <20250521073237.366463-2-j-choudhary@ti.com>
 <ea92f925-7778-477b-aeab-604407260de8@ideasonboard.com>
 <dedc889f-ffa2-420b-8b23-c6fff11cdf30@ti.com>
 <c888a352-a243-4555-9ab5-99614974afdd@ideasonboard.com>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <c888a352-a243-4555-9ab5-99614974afdd@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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



On 27/05/25 14:47, Tomi Valkeinen wrote:
> Hi,
> 
> On 27/05/2025 11:41, Jayesh Choudhary wrote:
>> Hello Tomi,
>>
>> On 27/05/25 13:08, Tomi Valkeinen wrote:
>>> Hi,
>>>
>>> On 21/05/2025 10:32, Jayesh Choudhary wrote:
>>>> Now that we have DBANC framework, remove the connector initialisation
>>>> code
>>>> as that piece of code is not called if DRM_BRIDGE_ATTACH_NO_CONNECTOR
>>>> flag
>>>> is used. Only TI K3 platforms consume this driver and tidss (their
>>>> display
>>>> controller) has this flag set. So this legacy support can be dropped.
>>>>
>>>
>>> Why is the series RFC? Does it not work? Is there something here you're
>>> not comfortable with?
>>
>> These changes work without any issue.
>>
>> I was a little doubtful about the second patch so kept it as RFC.
> 
> You should explain why the series/patch is RFC, unless it's somehow
> obvious. In this series I didn't see any TODOs or open questions or
> anything.
> 

Oh okay. Got it. Will drop RFC prefix in v3.

>>>
>>>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>>>> ---
>>>>    .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 186 +++---------------
>>>>    1 file changed, 25 insertions(+), 161 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/
>>>> drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>>>> index b431e7efd1f0..66bd916c2fe9 100644
>>>> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>>>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>>>> @@ -1444,56 +1444,6 @@ static const struct drm_edid
>>>> *cdns_mhdp_edid_read(struct cdns_mhdp_device *mhdp,
>>>>        return drm_edid_read_custom(connector,
>>>> cdns_mhdp_get_edid_block, mhdp);
>>>>    }
>>>>    -static int cdns_mhdp_get_modes(struct drm_connector *connector)
>>>> -{
>>>> -    struct cdns_mhdp_device *mhdp = connector_to_mhdp(connector);
>>>> -    const struct drm_edid *drm_edid;
>>>> -    int num_modes;
>>>> -
>>>> -    if (!mhdp->plugged)
>>>> -        return 0;
>>>> -
>>>> -    drm_edid = cdns_mhdp_edid_read(mhdp, connector);
>>>> -
>>>> -    drm_edid_connector_update(connector, drm_edid);
>>>> -
>>>> -    if (!drm_edid) {
>>>> -        dev_err(mhdp->dev, "Failed to read EDID\n");
>>>> -        return 0;
>>>> -    }
>>>> -
>>>> -    num_modes = drm_edid_connector_add_modes(connector);
>>>> -    drm_edid_free(drm_edid);
>>>> -
>>>> -    /*
>>>> -     * HACK: Warn about unsupported display formats until we deal
>>>> -     *       with them correctly.
>>>> -     */
>>>> -    if (connector->display_info.color_formats &&
>>>> -        !(connector->display_info.color_formats &
>>>> -          mhdp->display_fmt.color_format))
>>>> -        dev_warn(mhdp->dev,
>>>> -             "%s: No supported color_format found (0x%08x)\n",
>>>> -            __func__, connector->display_info.color_formats);
>>>> -
>>>> -    if (connector->display_info.bpc &&
>>>> -        connector->display_info.bpc < mhdp->display_fmt.bpc)
>>>> -        dev_warn(mhdp->dev, "%s: Display bpc only %d < %d\n",
>>>> -             __func__, connector->display_info.bpc,
>>>> -             mhdp->display_fmt.bpc);
>>>> -
>>>> -    return num_modes;
>>>> -}
>>>> -
>>>> -static int cdns_mhdp_connector_detect(struct drm_connector *conn,
>>>> -                      struct drm_modeset_acquire_ctx *ctx,
>>>> -                      bool force)
>>>> -{
>>>> -    struct cdns_mhdp_device *mhdp = connector_to_mhdp(conn);
>>>> -
>>>> -    return cdns_mhdp_detect(mhdp);
>>>> -}
>>>> -
>>>>    static u32 cdns_mhdp_get_bpp(struct cdns_mhdp_display_fmt *fmt)
>>>>    {
>>>>        u32 bpp;
>>>> @@ -1547,114 +1497,6 @@ bool cdns_mhdp_bandwidth_ok(struct
>>>> cdns_mhdp_device *mhdp,
>>>>        return true;
>>>>    }
>>>>    -static
>>>> -enum drm_mode_status cdns_mhdp_mode_valid(struct drm_connector *conn,
>>>> -                      const struct drm_display_mode *mode)
>>>> -{
>>>> -    struct cdns_mhdp_device *mhdp = connector_to_mhdp(conn);
>>>> -
>>>> -    mutex_lock(&mhdp->link_mutex);
>>>> -
>>>> -    if (!cdns_mhdp_bandwidth_ok(mhdp, mode, mhdp->link.num_lanes,
>>>> -                    mhdp->link.rate)) {
>>>> -        mutex_unlock(&mhdp->link_mutex);
>>>> -        return MODE_CLOCK_HIGH;
>>>> -    }
>>>> -
>>>> -    mutex_unlock(&mhdp->link_mutex);
>>>> -    return MODE_OK;
>>>> -}
>>>> -
>>>> -static int cdns_mhdp_connector_atomic_check(struct drm_connector *conn,
>>>> -                        struct drm_atomic_state *state)
>>>> -{
>>>> -    struct cdns_mhdp_device *mhdp = connector_to_mhdp(conn);
>>>> -    struct drm_connector_state *old_state, *new_state;
>>>> -    struct drm_crtc_state *crtc_state;
>>>> -    u64 old_cp, new_cp;
>>>> -
>>>> -    if (!mhdp->hdcp_supported)
>>>> -        return 0;
>>>> -
>>>> -    old_state = drm_atomic_get_old_connector_state(state, conn);
>>>> -    new_state = drm_atomic_get_new_connector_state(state, conn);
>>>> -    old_cp = old_state->content_protection;
>>>> -    new_cp = new_state->content_protection;
>>>> -
>>>> -    if (old_state->hdcp_content_type != new_state->hdcp_content_type &&
>>>> -        new_cp != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
>>>> -        new_state->content_protection =
>>>> DRM_MODE_CONTENT_PROTECTION_DESIRED;
>>>> -        goto mode_changed;
>>>> -    }
>>>> -
>>>> -    if (!new_state->crtc) {
>>>> -        if (old_cp == DRM_MODE_CONTENT_PROTECTION_ENABLED)
>>>> -            new_state->content_protection =
>>>> DRM_MODE_CONTENT_PROTECTION_DESIRED;
>>>> -        return 0;
>>>> -    }
>>>> -
>>>> -    if (old_cp == new_cp ||
>>>> -        (old_cp == DRM_MODE_CONTENT_PROTECTION_DESIRED &&
>>>> -         new_cp == DRM_MODE_CONTENT_PROTECTION_ENABLED))
>>>> -        return 0;
>>>> -
>>>> -mode_changed:
>>>> -    crtc_state = drm_atomic_get_new_crtc_state(state, new_state->crtc);
>>>> -    crtc_state->mode_changed = true;
>>>> -
>>>> -    return 0;
>>>> -}
>>>> -
>>>> -static const struct drm_connector_helper_funcs
>>>> cdns_mhdp_conn_helper_funcs = {
>>>> -    .detect_ctx = cdns_mhdp_connector_detect,
>>>> -    .get_modes = cdns_mhdp_get_modes,
>>>> -    .mode_valid = cdns_mhdp_mode_valid,
>>>> -    .atomic_check = cdns_mhdp_connector_atomic_check,
>>>> -};
>>>> -
>>>> -static const struct drm_connector_funcs cdns_mhdp_conn_funcs = {
>>>> -    .fill_modes = drm_helper_probe_single_connector_modes,
>>>> -    .atomic_duplicate_state =
>>>> drm_atomic_helper_connector_duplicate_state,
>>>> -    .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>>>> -    .reset = drm_atomic_helper_connector_reset,
>>>> -    .destroy = drm_connector_cleanup,
>>>> -};
>>>> -
>>>> -static int cdns_mhdp_connector_init(struct cdns_mhdp_device *mhdp)
>>>> -{
>>>> -    u32 bus_format = MEDIA_BUS_FMT_RGB121212_1X36;
>>>> -    struct drm_connector *conn = &mhdp->connector;
>>>> -    struct drm_bridge *bridge = &mhdp->bridge;
>>>> -    int ret;
>>>> -
>>>> -    conn->polled = DRM_CONNECTOR_POLL_HPD;
>>>> -
>>>> -    ret = drm_connector_init(bridge->dev, conn, &cdns_mhdp_conn_funcs,
>>>> -                 DRM_MODE_CONNECTOR_DisplayPort);
>>>> -    if (ret) {
>>>> -        dev_err(mhdp->dev, "Failed to initialize connector with
>>>> drm\n");
>>>> -        return ret;
>>>> -    }
>>>> -
>>>> -    drm_connector_helper_add(conn, &cdns_mhdp_conn_helper_funcs);
>>>> -
>>>> -    ret = drm_display_info_set_bus_formats(&conn->display_info,
>>>> -                           &bus_format, 1);
>>>> -    if (ret)
>>>> -        return ret;
>>>> -
>>>> -    ret = drm_connector_attach_encoder(conn, bridge->encoder);
>>>> -    if (ret) {
>>>> -        dev_err(mhdp->dev, "Failed to attach connector to encoder\n");
>>>> -        return ret;
>>>> -    }
>>>> -
>>>> -    if (mhdp->hdcp_supported)
>>>> -        ret = drm_connector_attach_content_protection_property(conn,
>>>> true);
>>>> -
>>>> -    return ret;
>>>> -}
>>>> -
>>>>    static int cdns_mhdp_attach(struct drm_bridge *bridge,
>>>>                    struct drm_encoder *encoder,
>>>>                    enum drm_bridge_attach_flags flags)
>>>> @@ -1671,9 +1513,11 @@ static int cdns_mhdp_attach(struct drm_bridge
>>>> *bridge,
>>>>            return ret;
>>>>          if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
>>>> -        ret = cdns_mhdp_connector_init(mhdp);
>>>> -        if (ret)
>>>> -            goto aux_unregister;
>>>> +        ret = -EINVAL;
>>>> +        dev_err(mhdp->dev,
>>>> +            "Connector initialisation not supported in bridge_attach
>>>> %d\n",
>>>> +            ret);
>>>> +        goto aux_unregister;
>>>>        }
>>>>          spin_lock(&mhdp->start_lock);
>>>> @@ -2158,6 +2002,25 @@ static const struct drm_edid
>>>> *cdns_mhdp_bridge_edid_read(struct drm_bridge *brid
>>>>        return cdns_mhdp_edid_read(mhdp, connector);
>>>>    }
>>>>    +static enum drm_mode_status
>>>> +cdns_mhdp_bridge_mode_valid(struct drm_bridge *bridge,
>>>> +                const struct drm_display_info *info,
>>>> +                const struct drm_display_mode *mode)
>>>> +{
>>>> +    struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
>>>> +
>>>> +    mutex_lock(&mhdp->link_mutex);
>>>> +
>>>> +    if (!cdns_mhdp_bandwidth_ok(mhdp, mode, mhdp->link.num_lanes,
>>>> +                    mhdp->link.rate)) {
>>>> +        mutex_unlock(&mhdp->link_mutex);
>>>> +        return MODE_CLOCK_HIGH;
>>>> +    }
>>>> +
>>>> +    mutex_unlock(&mhdp->link_mutex);
>>>> +    return MODE_OK;
>>>> +}
>>>> +
>>>>    static const struct drm_bridge_funcs cdns_mhdp_bridge_funcs = {
>>>>        .atomic_enable = cdns_mhdp_atomic_enable,
>>>>        .atomic_disable = cdns_mhdp_atomic_disable,
>>>> @@ -2172,6 +2035,7 @@ static const struct drm_bridge_funcs
>>>> cdns_mhdp_bridge_funcs = {
>>>>        .edid_read = cdns_mhdp_bridge_edid_read,
>>>>        .hpd_enable = cdns_mhdp_bridge_hpd_enable,
>>>>        .hpd_disable = cdns_mhdp_bridge_hpd_disable,
>>>> +    .mode_valid = cdns_mhdp_bridge_mode_valid,
>>>>    };
>>>>      static bool cdns_mhdp_detect_hpd(struct cdns_mhdp_device *mhdp,
>>>> bool *hpd_pulse)
>>>
>>> Why do you need to add bridge mode_valid() when removing the legacy
>>> non-DRM_BRIDGE_ATTACH_NO_CONNECTOR code?
>>
>> Okay. Then I will add the bridge mode_valid as a separate patch.
> 
> Well, it was a question =). But indeed my thought was that it sounded
> like material for a separate patch. Is it more of a fix for the
> DRM_BRIDGE_ATTACH_NO_CONNECTOR case?
> 
>   Tomi
> 

Yes this is a fix for DBANC case.
Without mode_valid, I can see a lot of modes getting propagated which
are not even supported by display monitor.
Since mode_valid was added to connector_funcs in the initial commit, I
will use that commit for "Fixes:" tag

Warm Regards,
Jayesh
