Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF32868C4F8
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 18:38:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 788B110E03E;
	Mon,  6 Feb 2023 17:38:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C22D10E03E
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 17:38:34 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 316HcFbn048063;
 Mon, 6 Feb 2023 11:38:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1675705096;
 bh=bxAtoogAiEmUXbej3UgOSQ2VPzfHys0C+/HOs3EaAgs=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=BCboW4BCdFXDfA4DSkgSD9S1gBRr+ZRe5PiTKVy1oyOm4m71UDUkDZI3Ih/Da8+iJ
 klm9WEKZ1ya26WjYEs15XC4a3s/Qol8tDAlP4z0lMdk3NFdkA8WZOl0EVRFkZoZyYV
 NR68aWrhlQMT7qcNLkbR2bU4F888jxqeiTchGurU=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 316HcFFe088933
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 6 Feb 2023 11:38:15 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 6
 Feb 2023 11:38:15 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 6 Feb 2023 11:38:15 -0600
Received: from [10.250.235.106] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 316Hc9vW083370;
 Mon, 6 Feb 2023 11:38:09 -0600
Message-ID: <2d4d66b6-dd1c-0c9e-2fee-ee20c8b79713@ti.com>
Date: Mon, 6 Feb 2023 23:08:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v7 4/6] drm/tidss: Add support to configure OLDI mode for
 am625-dss
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Jyri Sarha <jyri.sarha@iki.fi>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230125113529.13952-1-a-bhatia1@ti.com>
 <20230125113529.13952-5-a-bhatia1@ti.com>
 <d852f997-aa40-390d-bca1-ec9bb330049d@ideasonboard.com>
 <bd67f304-76c0-b098-8c41-5380f2996be8@ti.com>
 <2b9cdc0b-ddda-0c58-b726-4c7270813543@ideasonboard.com>
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <2b9cdc0b-ddda-0c58-b726-4c7270813543@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
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
 Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>,
 Rahul T R <r-ravikumar@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 06-Feb-23 19:12, Tomi Valkeinen wrote:
> On 05/02/2023 15:42, Aradhya Bhatia wrote:
>> Hi Tomi,
>>
>> On 03-Feb-23 20:42, Tomi Valkeinen wrote:
>>> On 25/01/2023 13:35, Aradhya Bhatia wrote:
>>>> The newer version of DSS (AM625-DSS) has 2 OLDI TXes at its disposal.
>>>> These can be configured to support the following modes:
>>>>
>>>> 1. OLDI_SINGLE_LINK_SINGLE_MODE
>>>> Single Output over OLDI 0.
>>>> +------+        +---------+      +-------+
>>>> |      |        |         |      |       |
>>>> | CRTC +------->+ ENCODER +----->| PANEL |
>>>> |      |        |         |      |       |
>>>> +------+        +---------+      +-------+
>>>>
>>>> 2. OLDI_SINGLE_LINK_CLONE_MODE
>>>> Duplicate Output over OLDI 0 and 1.
>>>> +------+        +---------+      +-------+
>>>> |      |        |         |      |       |
>>>> | CRTC +---+--->| ENCODER +----->| PANEL |
>>>> |      |   |    |         |      |       |
>>>> +------+   |    +---------+      +-------+
>>>>              |
>>>>              |    +---------+      +-------+
>>>>              |    |         |      |       |
>>>>              +--->| ENCODER +----->| PANEL |
>>>>                   |         |      |       |
>>>>                   +---------+      +-------+
>>>>
>>>> 3. OLDI_DUAL_LINK_MODE
>>>> Combined Output over OLDI 0 and 1.
>>>> +------+        +---------+      +-------+
>>>> |      |        |         +----->|       |
>>>> | CRTC +------->+ ENCODER |      | PANEL |
>>>> |      |        |         +----->|       |
>>>> +------+        +---------+      +-------+
>>>>
>>>> Following the above pathways for different modes, 2 encoder/panel-bridge
>>>> pipes get created for clone mode, and 1 pipe in cases of single link and
>>>> dual link mode.
>>>>
>>>> Add support for confguring the OLDI modes using OF and LVDS DRM helper
>>>> functions.
>>>>
>>>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>>>> ---
>>>>    drivers/gpu/drm/tidss/tidss_dispc.c   |  24 ++-
>>>>    drivers/gpu/drm/tidss/tidss_dispc.h   |  12 ++
>>>>    drivers/gpu/drm/tidss/tidss_drv.h     |   3 +
>>>>    drivers/gpu/drm/tidss/tidss_encoder.c |   4 +-
>>>>    drivers/gpu/drm/tidss/tidss_encoder.h |   3 +-
>>>>    drivers/gpu/drm/tidss/tidss_kms.c     | 221 ++++++++++++++++++++++++--
>>>>    6 files changed, 245 insertions(+), 22 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
>>>> index b55ccbcaa67f..37a73e309330 100644
>>>> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
>>>> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
>>>> @@ -88,6 +88,8 @@ const struct dispc_features dispc_k2g_feats = {
>>>>          .subrev = DISPC_K2G,
>>>>    +    .has_oldi = false,
>>>> +
>>>>        .common = "common",
>>>>          .common_regs = tidss_k2g_common_regs,
>>>> @@ -166,6 +168,8 @@ const struct dispc_features dispc_am625_feats = {
>>>>          .subrev = DISPC_AM625,
>>>>    +    .has_oldi = true,
>>>> +
>>>>        .common = "common",
>>>>        .common_regs = tidss_am65x_common_regs,
>>>>    @@ -218,6 +222,8 @@ const struct dispc_features dispc_am65x_feats = {
>>>>          .subrev = DISPC_AM65X,
>>>>    +    .has_oldi = true,
>>>> +
>>>>        .common = "common",
>>>>        .common_regs = tidss_am65x_common_regs,
>>>>    @@ -309,6 +315,8 @@ const struct dispc_features dispc_j721e_feats = {
>>>>          .subrev = DISPC_J721E,
>>>>    +    .has_oldi = false,
>>>> +
>>>>        .common = "common_m",
>>>>        .common_regs = tidss_j721e_common_regs,
>>>>    @@ -361,6 +369,8 @@ struct dispc_device {
>>>>          struct dss_vp_data vp_data[TIDSS_MAX_VPS];
>>>>    +    enum dispc_oldi_modes oldi_mode;
>>>> +
>>>>        u32 *fourccs;
>>>>        u32 num_fourccs;
>>>>    @@ -1963,6 +1973,12 @@ const u32 *dispc_plane_formats(struct dispc_device *dispc, unsigned int *len)
>>>>        return dispc->fourccs;
>>>>    }
>>>>    +void dispc_set_oldi_mode(struct dispc_device *dispc,
>>>> +             enum dispc_oldi_modes oldi_mode)
>>>> +{
>>>> +    dispc->oldi_mode = oldi_mode;
>>>> +}
>>>> +
>>>>    static s32 pixinc(int pixels, u8 ps)
>>>>    {
>>>>        if (pixels == 1)
>>>> @@ -2647,7 +2663,7 @@ int dispc_runtime_resume(struct dispc_device *dispc)
>>>>            REG_GET(dispc, DSS_SYSSTATUS, 2, 2),
>>>>            REG_GET(dispc, DSS_SYSSTATUS, 3, 3));
>>>>    -    if (dispc->feat->subrev == DISPC_AM65X)
>>>> +    if (dispc->feat->has_oldi)
>>>>            dev_dbg(dispc->dev, "OLDI RESETDONE %d,%d,%d\n",
>>>>                REG_GET(dispc, DSS_SYSSTATUS, 5, 5),
>>>>                REG_GET(dispc, DSS_SYSSTATUS, 6, 6),
>>>> @@ -2688,7 +2704,7 @@ static int dispc_iomap_resource(struct platform_device *pdev, const char *name,
>>>>        return 0;
>>>>    }
>>>>    -static int dispc_init_am65x_oldi_io_ctrl(struct device *dev,
>>>> +static int dispc_init_am6xx_oldi_io_ctrl(struct device *dev,
>>>>                         struct dispc_device *dispc)
>>>>    {
>>>>        dispc->oldi_io_ctrl =
>>>> @@ -2827,8 +2843,8 @@ int dispc_init(struct tidss_device *tidss)
>>>>            dispc->vp_data[i].gamma_table = gamma_table;
>>>>        }
>>>>    -    if (feat->subrev == DISPC_AM65X) {
>>>> -        r = dispc_init_am65x_oldi_io_ctrl(dev, dispc);
>>>> +    if (feat->has_oldi) {
>>>> +        r = dispc_init_am6xx_oldi_io_ctrl(dev, dispc);
>>>>            if (r)
>>>>                return r;
>>>>        }
>>>> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
>>>> index 971f2856f015..880bc7de68b3 100644
>>>> --- a/drivers/gpu/drm/tidss/tidss_dispc.h
>>>> +++ b/drivers/gpu/drm/tidss/tidss_dispc.h
>>>> @@ -64,6 +64,15 @@ enum dispc_dss_subrevision {
>>>>        DISPC_J721E,
>>>>    };
>>>>    +enum dispc_oldi_modes {
>>>> +    OLDI_MODE_SINGLE_LINK,        /* Single output over OLDI 0. */
>>>> +    OLDI_MODE_CLONE_SINGLE_LINK,    /* Cloned output over OLDI 0 and 1. */
>>>> +    OLDI_MODE_DUAL_LINK,        /* Combined output over OLDI 0 and 1. */
>>>> +    OLDI_MODE_OFF,            /* OLDI TXes not connected in OF. */
>>>> +    OLDI_MODE_UNSUPPORTED,        /* Unsupported OLDI configuration in OF. */
>>>> +    OLDI_MODE_UNAVAILABLE,        /* OLDI TXes not available in SoC. */
>>>> +};
>>>> +
>>>>    struct dispc_features {
>>>>        int min_pclk_khz;
>>>>        int max_pclk_khz[DISPC_PORT_MAX_BUS_TYPE];
>>>> @@ -72,6 +81,8 @@ struct dispc_features {
>>>>          enum dispc_dss_subrevision subrev;
>>>>    +    bool has_oldi;
>>>> +
>>>>        const char *common;
>>>>        const u16 *common_regs;
>>>>        u32 num_vps;
>>>> @@ -131,6 +142,7 @@ int dispc_plane_setup(struct dispc_device *dispc, u32 hw_plane,
>>>>                  u32 hw_videoport);
>>>>    int dispc_plane_enable(struct dispc_device *dispc, u32 hw_plane, bool enable);
>>>>    const u32 *dispc_plane_formats(struct dispc_device *dispc, unsigned int *len);
>>>> +void dispc_set_oldi_mode(struct dispc_device *dispc, enum dispc_oldi_modes oldi_mode);
>>>>      int dispc_init(struct tidss_device *tidss);
>>>>    void dispc_remove(struct tidss_device *tidss);
>>>> diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
>>>> index 0ce7ee5ccd5b..58892f065c16 100644
>>>> --- a/drivers/gpu/drm/tidss/tidss_drv.h
>>>> +++ b/drivers/gpu/drm/tidss/tidss_drv.h
>>>> @@ -13,6 +13,9 @@
>>>>    #define TIDSS_MAX_PLANES 4
>>>>    #define TIDSS_MAX_OUTPUT_PORTS 4
>>>>    +/* For AM625-DSS with 2 OLDI TXes */
>>>> +#define TIDSS_MAX_BRIDGES_PER_PIPE    2
>>>> +
>>>>    typedef u32 dispc_irq_t;
>>>>      struct tidss_device {
>>>> diff --git a/drivers/gpu/drm/tidss/tidss_encoder.c b/drivers/gpu/drm/tidss/tidss_encoder.c
>>>> index 0d4865e9c03d..bd2a7358d7b0 100644
>>>> --- a/drivers/gpu/drm/tidss/tidss_encoder.c
>>>> +++ b/drivers/gpu/drm/tidss/tidss_encoder.c
>>>> @@ -70,7 +70,8 @@ static const struct drm_encoder_funcs encoder_funcs = {
>>>>    };
>>>>      struct drm_encoder *tidss_encoder_create(struct tidss_device *tidss,
>>>> -                     u32 encoder_type, u32 possible_crtcs)
>>>> +                     u32 encoder_type, u32 possible_crtcs,
>>>> +                     u32 possible_clones)
>>>>    {
>>>>        struct drm_encoder *enc;
>>>>        int ret;
>>>> @@ -80,6 +81,7 @@ struct drm_encoder *tidss_encoder_create(struct tidss_device *tidss,
>>>>            return ERR_PTR(-ENOMEM);
>>>>          enc->possible_crtcs = possible_crtcs;
>>>> +    enc->possible_clones = possible_clones;
>>>>          ret = drm_encoder_init(&tidss->ddev, enc, &encoder_funcs,
>>>>                       encoder_type, NULL);
>>>> diff --git a/drivers/gpu/drm/tidss/tidss_encoder.h b/drivers/gpu/drm/tidss/tidss_encoder.h
>>>> index ace877c0e0fd..01c62ba3ef16 100644
>>>> --- a/drivers/gpu/drm/tidss/tidss_encoder.h
>>>> +++ b/drivers/gpu/drm/tidss/tidss_encoder.h
>>>> @@ -12,6 +12,7 @@
>>>>    struct tidss_device;
>>>>      struct drm_encoder *tidss_encoder_create(struct tidss_device *tidss,
>>>> -                     u32 encoder_type, u32 possible_crtcs);
>>>> +                     u32 encoder_type, u32 possible_crtcs,
>>>> +                     u32 possible_clones);
>>>>      #endif
>>>> diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
>>>> index d449131935d2..8322ee6310bf 100644
>>>> --- a/drivers/gpu/drm/tidss/tidss_kms.c
>>>> +++ b/drivers/gpu/drm/tidss/tidss_kms.c
>>>> @@ -13,6 +13,7 @@
>>>>    #include <drm/drm_of.h>
>>>>    #include <drm/drm_panel.h>
>>>>    #include <drm/drm_vblank.h>
>>>> +#include <linux/of.h>
>>>>      #include "tidss_crtc.h"
>>>>    #include "tidss_dispc.h"
>>>> @@ -104,26 +105,129 @@ static const struct drm_mode_config_funcs mode_config_funcs = {
>>>>        .atomic_commit = drm_atomic_helper_commit,
>>>>    };
>>>>    +static enum dispc_oldi_modes tidss_get_oldi_mode(struct tidss_device *tidss)
>>>> +{
>>>> +    int pixel_order;
>>>> +    enum dispc_oldi_modes oldi_mode;
>>>> +    struct device_node *oldi0_port, *oldi1_port;
>>>> +
>>>> +    /*
>>>> +     * For am625-dss, the OLDI ports are expected at port reg = 0 and 2,
>>>> +     * and for am65x-dss, the OLDI port is expected only at port reg = 0.
>>>> +     */
>>>> +    const u32 portnum_oldi0 = 0, portnum_oldi1 = 2;
>>>> +
>>>> +    oldi0_port = of_graph_get_port_by_id(tidss->dev->of_node, portnum_oldi0);
>>>> +    oldi1_port = of_graph_get_port_by_id(tidss->dev->of_node, portnum_oldi1);
>>>> +
>>>> +    if (!(oldi0_port || oldi1_port)) {
>>>> +        /* Keep OLDI TXes OFF if neither OLDI port is present. */
>>>> +        oldi_mode = OLDI_MODE_OFF;
>>>> +    } else if (oldi0_port && !oldi1_port) {
>>>> +        /*
>>>> +         * OLDI0 port found, but not OLDI1 port. Setting single
>>>> +         * link output mode.
>>>> +         */
>>>> +        oldi_mode = OLDI_MODE_SINGLE_LINK;
>>>> +    } else if (!oldi0_port && oldi1_port) {
>>>> +        /*
>>>> +         * The 2nd OLDI TX cannot be operated alone. This use case is
>>>> +         * not supported in the HW. Since the pins for OLDIs 0 and 1 are
>>>> +         * separate, one could theoretically set a clone mode over OLDIs
>>>> +         * 0 and 1 and just simply not use the OLDI 0. This is a hacky
>>>> +         * way to enable only OLDI TX 1 and hence is not officially
>>>> +         * supported.
>>>> +         */
>>>> +        dev_warn(tidss->dev,
>>>> +             "Single Mode over OLDI 1 is not supported in HW.\n");
>>>> +        oldi_mode = OLDI_MODE_UNSUPPORTED;
>>>> +    } else {
>>>> +        /*
>>>> +         * OLDI Ports found for both the OLDI TXes. The DSS is to be
>>>> +         * configured in either Dual Link or Clone Mode.
>>>> +         */
>>>> +        pixel_order = drm_of_lvds_get_dual_link_pixel_order(oldi0_port,
>>>> +                                    oldi1_port);
>>>> +        switch (pixel_order) {
>>>> +        case -EINVAL:
>>>> +            /*
>>>> +             * The dual link properties were not found in at least
>>>> +             * one of the sink nodes. Since 2 OLDI ports are present
>>>> +             * in the DT, it can be safely assumed that the required
>>>> +             * configuration is Clone Mode.
>>>> +             */
>>>> +            oldi_mode = OLDI_MODE_CLONE_SINGLE_LINK;
>>>> +            break;
>>>> +
>>>> +        case DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS:
>>>> +            /*
>>>> +             * Note that the OLDI TX 0 transmits the odd set of
>>>> +             * pixels while the OLDI TX 1 transmits the even set.
>>>> +             * This is a fixed configuration in the HW and an cannot
>>>> +             * be change via SW.
>>>> +             */
>>>> +            dev_warn(tidss->dev,
>>>> +                 "EVEN-ODD Dual-Link Mode is not supported in HW.\n");
>>>> +            oldi_mode = OLDI_MODE_UNSUPPORTED;
>>>> +            break;
>>>> +
>>>> +        case DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS:
>>>> +            oldi_mode = OLDI_MODE_DUAL_LINK;
>>>> +            break;
>>>> +
>>>> +        default:
>>>> +            oldi_mode = OLDI_MODE_UNSUPPORTED;
>>>> +            break;
>>>> +        }
>>>> +    }
>>>> +
>>>> +    of_node_put(oldi0_port);
>>>> +    of_node_put(oldi1_port);
>>>> +
>>>> +    return oldi_mode;
>>>> +}
>>>> +
>>>>    static int tidss_dispc_modeset_init(struct tidss_device *tidss)
>>>>    {
>>>>        struct device *dev = tidss->dev;
>>>>        unsigned int fourccs_len;
>>>>        const u32 *fourccs = dispc_plane_formats(tidss->dispc, &fourccs_len);
>>>> -    unsigned int i;
>>>> +    unsigned int i, j;
>>>>          struct pipe {
>>>>            u32 hw_videoport;
>>>> -        struct drm_bridge *bridge;
>>>> +        struct drm_bridge *bridge[TIDSS_MAX_BRIDGES_PER_PIPE];
>>>>            u32 enc_type;
>>>> +        u32 num_bridges;
>>>>        };
>>>>          const struct dispc_features *feat = tidss->feat;
>>>>        u32 output_ports = feat->num_output_ports;
>>>>        u32 max_planes = feat->num_planes;
>>>>    -    struct pipe pipes[TIDSS_MAX_VPS];
>>>> +    struct pipe pipes[TIDSS_MAX_VPS] = {0};
>>>> +
>>>>        u32 num_pipes = 0;
>>>>        u32 crtc_mask;
>>>> +    enum dispc_oldi_modes oldi_mode = OLDI_MODE_UNAVAILABLE;
>>>> +    u32 num_oldi = 0;
>>>> +    u32 num_encoders = 0;
>>>> +    u32 oldi_pipe_index = 0;
>>>> +
>>>> +    if (feat->has_oldi) {
>>>> +        oldi_mode = tidss_get_oldi_mode(tidss);
>>>> +
>>>> +        if ((oldi_mode == OLDI_MODE_DUAL_LINK ||
>>>> +             oldi_mode == OLDI_MODE_CLONE_SINGLE_LINK) &&
>>>> +            feat->subrev == DISPC_AM65X) {
>>>> +            dev_warn(tidss->dev,
>>>> +                 "am65x-dss does not support this OLDI mode.\n");
>>>> +
>>>> +            oldi_mode = OLDI_MODE_UNSUPPORTED;
>>>> +        }
>>>
>>> Shouldn't OLDI_MODE_UNSUPPORTED be handled as an error? It means the DT
>>> is faulty, doesn't it? Maybe it could even be renamed to
>>> OLDI_MODE_ERROR. Or tidss_get_oldi_mode() could return a negative error
>>> code.
>>>
>>
>> The idea was to let the framework continue configuring the 2nd videoport
>> for DPI, even if the OLDI DT is wrong. But I have come across more
>> examples recently where that is not the case. DT error for one pipe has
>> resulted in returning of an error code.
>>
>> Will make the change.
> 
> My opinion is that the DT has to be correct. If it isn't, just fail and
> exit as soon as possible. There shouldn't be any reasons for the drivers
> to be trying to cope with a broken DT.

Understood! Will error out in those cases!

> 
>>>> +
>>>> +        dispc_set_oldi_mode(tidss->dispc, oldi_mode);
>>>> +    }
>>>
>>> Would it be better to move the above dispc_set_oldi_mode() to be outside
>>> the if block? Then oldi mode would be set to OLDI_MODE_UNAVAILABLE on
>>> SoCs that don't have OLDI.
>>
>> Ahh, yes! Will make the change.
>>
>>>
>>> tidss_get_oldi_mode and dispc_set_oldi_mode sound like opposites, but
>>> they're totally different things. Maybe tidss_get_oldi_mode should
>>> rather be something about parsing oldi dt properties or such.
>>
>> Okay! Is 'tidss_parse_oldi_properties' acceptable? This is just
>> something I came up with now. I can think of more if this is not good.
> 
> Sounds fine.
>

Okay!
 

Regards
Aradhya
