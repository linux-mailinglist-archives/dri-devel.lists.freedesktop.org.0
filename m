Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9722F6024E2
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 09:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326DE10E1E5;
	Tue, 18 Oct 2022 07:00:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E448A10E1E5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 07:00:49 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29I70RGt016220;
 Tue, 18 Oct 2022 02:00:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1666076427;
 bh=rlotxECe5194+Cjcu7Qtp1ZTXtwp5x44Eg6U6HO4Dd8=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=yGNFKc+vkKiULvp+SdpMFat6aWWKtLBnvFwfdcbqjXYCXjf2FQs+wDjEZXRCwVCTs
 HDJ3UN6iSqDghiAOQuZrqyltq7tuy/FQtEuap9Ax9Zd7QMgtXetyJXDTlgEAoHz5qb
 P7C0cOFfQIquBp/7wivnRUDNMdnFKxE8Xp9W6wYE=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29I70R6o061772
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 18 Oct 2022 02:00:27 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 18
 Oct 2022 02:00:27 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 18 Oct 2022 02:00:26 -0500
Received: from [10.250.234.73] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29I70L8E048951;
 Tue, 18 Oct 2022 02:00:22 -0500
Message-ID: <d6f8b40b-3e2d-e777-28c9-ff67065e2c8b@ti.com>
Date: Tue, 18 Oct 2022 12:30:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [RFC PATCH v5 4/6] drm/tidss: Add support to configure OLDI mode
 for am625-dss.
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jyri Sarha
 <jyri.sarha@iki.fi>, Rob Herring <robh+dt@kernel.org>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>
References: <20220928175223.15225-1-a-bhatia1@ti.com>
 <20220928175223.15225-5-a-bhatia1@ti.com>
 <88220e6f-1bcc-7746-4281-e74f9e832e97@ideasonboard.com>
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <88220e6f-1bcc-7746-4281-e74f9e832e97@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Rahul T R <r-ravikumar@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi

Thank you for the comprehensive feedback across all the patches. I am
working on them.

I do have some concerns which I have talked about, below.

On 12-Oct-22 17:53, Tomi Valkeinen wrote:
> On 28/09/2022 20:52, Aradhya Bhatia wrote:
>> The newer version of DSS (AM625-DSS) has 2 OLDI TXes at its disposal.
>> These can be configured to support the following modes:
>>
>> 1. OLDI_SINGLE_LINK_SINGLE_MODE
>> Single Output over OLDI 0.
>> +------+        +---------+      +-------+
>> |      |        |         |      |       |
>> | CRTC +------->+ ENCODER +----->| PANEL |
>> |      |        |         |      |       |
>> +------+        +---------+      +-------+
> 
> Can you have single link on OLDI 1 (OLDI 0 off)? I don't know if that 
> make sense on this platform, but if the pins for OLDI 0 and 1 are 
> different, there might be a reason on some cases for that.

HW does not support a case where single link is enabled over OLDI 1 with
OLDI 0 off, even though the pins are different.

One could still put 2 panel nodes in DT to set OLDI in a Clone Mode and
simply not use OLDI 0 pins, but I dont think that is a valid case that
should be supported.

> 
>> 2. OLDI_SINGLE_LINK_CLONE_MODE
>> Duplicate Output over OLDI 0 and 1.
>> +------+        +---------+      +-------+
>> |      |        |         |      |       |
>> | CRTC +---+--->| ENCODER +----->| PANEL |
>> |      |   |    |         |      |       |
>> +------+   |    +---------+      +-------+
>>        |
> 
> I think you've got a tab in the line above, but otherwise use spaces.
> 
>>             |    +---------+      +-------+
>>             |    |         |      |       |
>>             +--->| ENCODER +----->| PANEL |
>>                  |         |      |       |
>>                  +---------+      +-------+
>>
>> 3. OLDI_DUAL_LINK_MODE
>> Combined Output over OLDI 0 and 1.
>> +------+        +---------+      +-------+
>> |      |        |         +----->|       |
>> | CRTC +------->+ ENCODER |      | PANEL |
>> |      |        |         +----->|       |
>> +------+        +---------+      +-------+
>>
>> Following the above pathways for different modes, 2 encoder/panel-bridge
>> pipes get created for clone mode, and 1 pipe in cases of single link and
>> dual link mode.
>>
>> Add support for confgure the OLDI modes using of and lvds DRM helper
> 
> "configuring"
> 
>> functions.
>>
>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>> ---
>>   drivers/gpu/drm/tidss/tidss_dispc.c |  11 +++
>>   drivers/gpu/drm/tidss/tidss_dispc.h |   8 ++
>>   drivers/gpu/drm/tidss/tidss_drv.h   |   3 +
>>   drivers/gpu/drm/tidss/tidss_kms.c   | 146 +++++++++++++++++++++++-----
>>   4 files changed, 145 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c 
>> b/drivers/gpu/drm/tidss/tidss_dispc.c
>> index 34f0da4bb3e3..88008ad39b55 100644
>> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
>> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
>> @@ -354,6 +354,8 @@ struct dispc_device {
>>       bool is_enabled;
>> +    enum dispc_oldi_modes oldi_mode;
>> +
>>       struct dss_vp_data vp_data[TIDSS_MAX_PORTS];
>>       u32 *fourccs;
>> @@ -1958,6 +1960,15 @@ const u32 *dispc_plane_formats(struct 
>> dispc_device *dispc, unsigned int *len)
>>       return dispc->fourccs;
>>   }
>> +int dispc_configure_oldi_mode(struct dispc_device *dispc,
>> +                  enum dispc_oldi_modes oldi_mode)
>> +{
>> +    WARN_ON(!dispc);
>> +
>> +    dispc->oldi_mode = oldi_mode;
>> +    return 0;
>> +}
> 
> I think "configure" means more than just storing the value. Maybe 
> dispc_set_oldi_mode(). And an empty line above the return.
> 
>> +
>>   static s32 pixinc(int pixels, u8 ps)
>>   {
>>       if (pixels == 1)
>> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h 
>> b/drivers/gpu/drm/tidss/tidss_dispc.h
>> index b66418e583ee..45cce1054832 100644
>> --- a/drivers/gpu/drm/tidss/tidss_dispc.h
>> +++ b/drivers/gpu/drm/tidss/tidss_dispc.h
>> @@ -64,6 +64,13 @@ enum dispc_dss_subrevision {
>>       DISPC_AM625,
>>   };
>> +enum dispc_oldi_modes {
>> +    OLDI_MODE_OFF,                /* OLDI turned off / tied off in 
>> IP. */
>> +    OLDI_SINGLE_LINK_SINGLE_MODE,        /* Single Output over OLDI 
>> 0. */
>> +    OLDI_SINGLE_LINK_CLONE_MODE,        /* Duplicate Output over OLDI 
>> 0 and 1. */
>> +    OLDI_DUAL_LINK_MODE,            /* Combined Output over OLDI 0 
>> and 1. */
>> +};
>> +
>>   struct dispc_features {
>>       int min_pclk_khz;
>>       int max_pclk_khz[DISPC_VP_MAX_BUS_TYPE];
>> @@ -131,6 +138,7 @@ int dispc_plane_setup(struct dispc_device *dispc, 
>> u32 hw_plane,
>>                 u32 hw_videoport);
>>   int dispc_plane_enable(struct dispc_device *dispc, u32 hw_plane, 
>> bool enable);
>>   const u32 *dispc_plane_formats(struct dispc_device *dispc, unsigned 
>> int *len);
>> +int dispc_configure_oldi_mode(struct dispc_device *dispc, enum 
>> dispc_oldi_modes oldi_mode);
>>   int dispc_init(struct tidss_device *tidss);
>>   void dispc_remove(struct tidss_device *tidss);
>> diff --git a/drivers/gpu/drm/tidss/tidss_drv.h 
>> b/drivers/gpu/drm/tidss/tidss_drv.h
>> index d7f27b0b0315..2252ba0222ca 100644
>> --- a/drivers/gpu/drm/tidss/tidss_drv.h
>> +++ b/drivers/gpu/drm/tidss/tidss_drv.h
>> @@ -12,6 +12,9 @@
>>   #define TIDSS_MAX_PORTS 4
>>   #define TIDSS_MAX_PLANES 4
>> +/* For AM625-DSS with 2 OLDI TXes */
>> +#define TIDSS_MAX_BRIDGE_PER_PIPE    2
> 
> "BRIDGES"?
> 
>> +
>>   typedef u32 dispc_irq_t;
>>   struct tidss_device {
>> diff --git a/drivers/gpu/drm/tidss/tidss_kms.c 
>> b/drivers/gpu/drm/tidss/tidss_kms.c
>> index 666e527a0acf..73afe390f36d 100644
>> --- a/drivers/gpu/drm/tidss/tidss_kms.c
>> +++ b/drivers/gpu/drm/tidss/tidss_kms.c
>> @@ -107,32 +107,84 @@ static const struct drm_mode_config_funcs 
>> mode_config_funcs = {
>>       .atomic_commit = drm_atomic_helper_commit,
>>   };
>> +static int tidss_get_oldi_mode(struct tidss_device *tidss)
> 
> Return enum dispc_oldi_modes, not int.
> 
>> +{
>> +    int pixel_order;
>> +    struct device_node *dss_ports, *oldi0_port, *oldi1_port;
>> +
>> +    dss_ports = of_get_next_child(tidss->dev->of_node, NULL);
> 
> Hmm you get the next child and hope that it's the ports node?
> 
> In any case, I think you can call of_graph_get_port_by_id() with the 
> tidss->dev->of_node and it'll do the right thing.
I think this will only work if the child of dss node is just "ports",
but we've been using "dss_ports" as the child.

However, you are right. I shouldn't expect the first child to be
dss_ports. I will use the "of_get_child_by_name" helper to get the
dss_ports node.

> 
>> +    oldi0_port = of_graph_get_port_by_id(dss_ports, 0);
>> +    oldi1_port = of_graph_get_port_by_id(dss_ports, 2);
> 
> I think you need to of_put these at some point.
> 
>> +    if (!(oldi0_port && oldi1_port))
>> +        return OLDI_SINGLE_LINK_SINGLE_MODE;
> 
> This one matches also for !oldi0 && oldi1. If oldi1 cannot be used in 
> single-link mode, the above should take it into account.

Right. I will print a warning if somebody's trying to use (!oldi0 &&
oldi1) but since its a single link requirement, I will still set the
OLDI for single link single mode.

> 
>> +
>> +    /*
>> +     * OLDI Ports found for both the OLDI TXes. The DSS is to be 
>> configured
>> +     * in either Dual Link or Clone Mode.
>> +     */
>> +    pixel_order = drm_of_lvds_get_dual_link_pixel_order(oldi0_port,
>> +                                oldi1_port);
>> +    switch (pixel_order) {
>> +    case -EINVAL:
>> +        /*
>> +         * The dual link properties were not found in at least one of
>> +         * the sink nodes. Since 2 OLDI ports are present in the DT, it
>> +         * can be safely assumed that the required configuration is
>> +         * Clone Mode.
>> +         */
>> +        return OLDI_SINGLE_LINK_CLONE_MODE;
>> +
>> +    case DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS:
>> +    case DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS:
>> +        /*
>> +         * Note that the OLDI TX 0 transmits the odd set of pixels while
>> +         * the OLDI TX 1 transmits the even set. This is a fixed
>> +         * configuration in the IP and an cannot be change vis SW. These
>> +         * properties have been used to merely identify if a Dual Link
>> +         * configuration is required. Swapping this property in the 
>> panel
>> +         * port DT nodes will not make any difference.
>> +         */
> 
> But if they are in the wrong order, shouldn't we fail or at least give a 
> warning?
>  >> +        return OLDI_DUAL_LINK_MODE;
>> +
>> +    default:
>> +        return OLDI_MODE_OFF;
>> +    }
>> +}
>> +
>>   static int tidss_dispc_modeset_init(struct tidss_device *tidss)
>>   {
>>       struct device *dev = tidss->dev;
>>       unsigned int fourccs_len;
>>       const u32 *fourccs = dispc_plane_formats(tidss->dispc, 
>> &fourccs_len);
>> -    unsigned int i;
>> +    unsigned int i, j;
>>       struct pipe {
>>           u32 hw_videoport;
>> -        struct drm_bridge *bridge;
>> +        struct drm_bridge *bridge[TIDSS_MAX_BRIDGE_PER_PIPE];
>>           u32 enc_type;
>> +        u32 num_bridges;
>>       };
>>       const struct dispc_features *feat = tidss->feat;
>> -    u32 max_vps = feat->num_vps;
>> +    u32 max_ports = feat->num_max_ports;
>>       u32 max_planes = feat->num_planes;
>>       struct pipe pipes[TIDSS_MAX_PORTS];
>>       u32 num_pipes = 0;
>> +    u32 pipe_number = 0;
>>       u32 crtc_mask;
>> +    u32 num_oldi = 0;
>> +    u32 oldi0_port = 0;
>> +    u32 hw_vp = 0;
>> +    enum dispc_oldi_modes oldi_mode;
>>       /* first find all the connected panels & bridges */
>> -    for (i = 0; i < max_vps; i++) {
>> +    for (i = 0; i < max_ports; i++) {
>>           struct drm_panel *panel;
>>           struct drm_bridge *bridge;
>> +        bool bridge_req = true;
>>           u32 enc_type = DRM_MODE_ENCODER_NONE;
>>           int ret;
>> @@ -146,6 +198,11 @@ static int tidss_dispc_modeset_init(struct 
>> tidss_device *tidss)
>>               return ret;
>>           }
>> +        /* default number of bridges required for a panel/bridge*/
>> +        pipe_number = num_pipes;
>> +        pipes[pipe_number].num_bridges = 1;
>> +        hw_vp = i;
>> +
>>           if (panel) {
>>               u32 conn_type;
>> @@ -155,7 +212,43 @@ static int tidss_dispc_modeset_init(struct 
>> tidss_device *tidss)
>>               case DISPC_VP_OLDI:
>>                   enc_type = DRM_MODE_ENCODER_LVDS;
>>                   conn_type = DRM_MODE_CONNECTOR_LVDS;
>> +
>> +                /*
>> +                 * A single DSS controller cannot support 2
>> +                 * independent displays. If 2nd node is detected,
>> +                 * it is for Dual Link Mode or Clone Mode.
>> +                 *
>> +                 * A new pipe instance is not required.
>> +                 */
>> +                if (++num_oldi == 2) {
>> +                    pipe_number = oldi0_port;
>> +                    hw_vp = i;
>> +
>> +                    /* 2nd OLDI DT node detected. Get its mode */
>> +                    oldi_mode = tidss_get_oldi_mode(tidss);
>> +                    bridge_req = false;
>> +
>> +                    /*
>> +                     * A separate panel bridge will only be
>> +                     * required if 2 panels are connected for
>> +                     * the OLDI Clone Mode.
>> +                     */
>> +                    if (oldi_mode == OLDI_SINGLE_LINK_CLONE_MODE) {
>> +                        bridge_req = true;
>> +                        (pipes[pipe_number].num_bridges)++;
>> +                    }
>> +                } else {
>> +                    /*
>> +                     * First OLDI DT node detected. Save it
>> +                     * in case there is another node for Dual
>> +                     * Link Mode or Clone Mode.
>> +                     */
>> +                    oldi0_port = i;
>> +                    oldi_mode = OLDI_SINGLE_LINK_SINGLE_MODE;
>> +                }
>> +                dispc_configure_oldi_mode(tidss->dispc, oldi_mode);
>>                   break;
>> +
>>               case DISPC_VP_DPI:
>>                   enc_type = DRM_MODE_ENCODER_DPI;
>>                   conn_type = DRM_MODE_CONNECTOR_DPI;
>> @@ -173,19 +266,23 @@ static int tidss_dispc_modeset_init(struct 
>> tidss_device *tidss)
>>                   return -EINVAL;
>>               }
>> -            bridge = devm_drm_panel_bridge_add(dev, panel);
>> -            if (IS_ERR(bridge)) {
>> -                dev_err(dev,
>> -                    "failed to set up panel bridge for port %d\n",
>> -                    i);
>> -                return PTR_ERR(bridge);
>> +            if (bridge_req) {
>> +                bridge = devm_drm_panel_bridge_add(dev, panel);
>> +                if (IS_ERR(bridge)) {
>> +                    dev_err(dev,
>> +                        "failed to set up panel bridge for port %d\n",
>> +                        i);
>> +                    return PTR_ERR(bridge);
>> +                }
>>               }
>>           }
>> -        pipes[num_pipes].hw_videoport = i;
>> -        pipes[num_pipes].bridge = bridge;
>> -        pipes[num_pipes].enc_type = enc_type;
>> -        num_pipes++;
>> +        if (bridge_req) {
>> +            pipes[pipe_number].hw_videoport = hw_vp;
>> +            pipes[pipe_number].bridge[pipes[pipe_number].num_bridges 
>> - 1] = bridge;
>> +            pipes[pipe_number].enc_type = enc_type;
>> +            num_pipes++;
>> +        }
> 
> I need to look at this with better time. But I started to wonder, would 
> it be clearer to first figure out the oldi setup before the loop, rather 
> than figuring it out inside the loop. I'm not sure if it would help 
> much, though.
> 
I had not thought about taking this approach, but it might actually be
better.

These patches, at the moment, do not support a case where a clone mode
or dual link mode is used on a bridge instead of a panel. My edits
inside the loop are panel dependent. If we do have oldi setup
information prior to the beginning of the loop, the panel dependency can
be removed and some commond code can be written to support an additional
encoder - bridge connection should it be required.

Let me know what you think!

If this apparch is better indeed, I will make these changes before
sending out the next revision.


Regards
Aradhya
