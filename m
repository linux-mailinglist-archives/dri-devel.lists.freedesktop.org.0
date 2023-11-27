Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 554897F9DFB
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 11:56:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA0510E22A;
	Mon, 27 Nov 2023 10:56:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m11879.qiye.163.com (mail-m11879.qiye.163.com
 [115.236.118.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F4CA10E22A
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 10:56:48 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=aGMR2PY+mSYyX/1vIrdWMX0LW8sTSp0P3+CZgC9XdQ3fqZSmAV0oC1tRPunzuqcwvjY36Tm58gPN4lORYIo0MRoFPMnhZ/OPug4K/1WebDKGqhinqrlPODvZmLxGYSPaJw/1p11eUeWflRtS7kFDumeEruiU7/33/Lqb0AW5heo=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
 bh=FIleyZnhRSVMVcC54bolVJpK4WGBI5iaNA1gPN/Le3M=;
 h=date:mime-version:subject:message-id:from;
Received: from [192.168.60.102] (unknown [103.29.142.67])
 by mail-m12762.qiye.163.com (Hmail) with ESMTPA id 7CEC75C02BA;
 Mon, 27 Nov 2023 18:56:38 +0800 (CST)
Content-Type: multipart/alternative;
 boundary="------------wb4NmNzTA0TwIvG6F355qkVg"
Message-ID: <ea24a638-d10f-4f58-9992-1c80bafdd6d4@rock-chips.com>
Date: Mon, 27 Nov 2023 18:56:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/12] drm/rockchip: vop2: Add debugfs support
To: Sascha Hauer <s.hauer@pengutronix.de>, Andy Yan <andyshrk@163.com>
References: <20231122125316.3454268-1-andyshrk@163.com>
 <20231122125601.3455031-1-andyshrk@163.com>
 <20231127101337.GU3359458@pengutronix.de>
Content-Language: en-US
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20231127101337.GU3359458@pengutronix.de>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZT0MdVklPQxkdGRhNHU9DTVUTARMWGhIXJBQOD1
 lXWRgSC1lBWUpLSFVJQlVKT0lVTUxZV1kWGg8SFR0UWUFZT0tIVUpNT0lMTlVKS0tVSkJLS1kG
X-HM-Tid: 0a8c106c93a2b229kuuu7cec75c02ba
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6KyI6Fyo*Ajw#QxkfSDgLSREs
 EzkaCQNVSlVKTEtKS0NJTUtKSUlIVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
 WUFZSktIVUlCVUpPSVVNTFlXWQgBWUFJTU1PTzcG
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
Cc: devicetree@vger.kernel.org, chris.obbard@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hjc@rock-chips.com, kever.yang@rock-chips.com,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, sebastian.reichel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------wb4NmNzTA0TwIvG6F355qkVg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Sascha:

thanks for you review.

On 11/27/23 18:13, Sascha Hauer wrote:
> On Wed, Nov 22, 2023 at 08:56:01PM +0800, Andy Yan wrote:
>> From: Andy Yan<andy.yan@rock-chips.com>
>>
>> /sys/kernel/debug/dri/vop2/summary:  dump vop display state
>> /sys/kernel/debug/dri/vop2/regs: dump whole vop registers
>> /sys/kernel/debug/dri/vop2/active_regs: only dump the registers of
>> activated modules
>>
>> Signed-off-by: Andy Yan<andy.yan@rock-chips.com>
>> ---
>>
>> (no changes since v1)
>>
>>   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 399 +++++++++++++++++++
>>   1 file changed, 399 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> index 9eecbe1f71f9..4a2342209c15 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> @@ -27,6 +27,7 @@
>>   #include <drm/drm_debugfs.h>
>>   #include <drm/drm_flip_work.h>
>>   #include <drm/drm_framebuffer.h>
>> +#include <drm/drm_gem_framebuffer_helper.h>
>>   #include <drm/drm_probe_helper.h>
>>   #include <drm/drm_vblank.h>
>>   
>> @@ -187,6 +188,7 @@ struct vop2 {
>>   	 */
>>   	u32 registered_num_wins;
>>   
>> +	struct resource *res;
>>   	void __iomem *regs;
>>   	struct regmap *map;
>>   
>> @@ -228,6 +230,44 @@ struct vop2 {
>>   #define vop2_output_if_is_lvds(x)	(x == ROCKCHIP_VOP2_EP_LVDS0 || x == ROCKCHIP_VOP2_EP_LVDS1)
>>   #define vop2_output_if_is_dpi(x)	(x == ROCKCHIP_VOP2_EP_RGB0)
>>   
>> +struct vop2_regs_dump {
>> +	const char *name;
>> +	u32 base;
>> +	u32 en_reg;
>> +	u32 en_val;
>> +	u32 en_mask;
>> +};
>> +
>> +/*
>> + * bus-format types.
>> + */
>> +struct drm_bus_format_enum_list {
>> +	int type;
>> +	const char *name;
>> +};
>> +
>> +static const struct drm_bus_format_enum_list drm_bus_format_enum_list[] = {
>> +	{ DRM_MODE_CONNECTOR_Unknown, "Unknown" },
>> +	{ MEDIA_BUS_FMT_RGB565_1X16, "RGB565_1X16" },
>> +	{ MEDIA_BUS_FMT_RGB666_1X18, "RGB666_1X18" },
>> +	{ MEDIA_BUS_FMT_RGB666_1X24_CPADHI, "RGB666_1X24_CPADHI" },
>> +	{ MEDIA_BUS_FMT_RGB666_1X7X3_SPWG, "RGB666_1X7X3_SPWG" },
>> +	{ MEDIA_BUS_FMT_YUV8_1X24, "YUV8_1X24" },
>> +	{ MEDIA_BUS_FMT_UYYVYY8_0_5X24, "UYYVYY8_0_5X24" },
>> +	{ MEDIA_BUS_FMT_YUV10_1X30, "YUV10_1X30" },
>> +	{ MEDIA_BUS_FMT_UYYVYY10_0_5X30, "UYYVYY10_0_5X30" },
>> +	{ MEDIA_BUS_FMT_RGB888_3X8, "RGB888_3X8" },
>> +	{ MEDIA_BUS_FMT_RGB888_1X24, "RGB888_1X24" },
>> +	{ MEDIA_BUS_FMT_RGB888_1X7X4_SPWG, "RGB888_1X7X4_SPWG" },
>> +	{ MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA, "RGB888_1X7X4_JEIDA" },
>> +	{ MEDIA_BUS_FMT_UYVY8_2X8, "UYVY8_2X8" },
>> +	{ MEDIA_BUS_FMT_YUYV8_1X16, "YUYV8_1X16" },
>> +	{ MEDIA_BUS_FMT_UYVY8_1X16, "UYVY8_1X16" },
>> +	{ MEDIA_BUS_FMT_RGB101010_1X30, "RGB101010_1X30" },
>> +	{ MEDIA_BUS_FMT_YUYV10_1X20, "YUYV10_1X20" },
>> +};
>> +static DRM_ENUM_NAME_FN(drm_get_bus_format_name, drm_bus_format_enum_list)
>> +
>>   static const struct regmap_config vop2_regmap_config;
>>   
>>   static struct vop2_video_port *to_vop2_video_port(struct drm_crtc *crtc)
>> @@ -2487,6 +2527,363 @@ static const struct drm_crtc_helper_funcs vop2_crtc_helper_funcs = {
>>   	.atomic_disable = vop2_crtc_atomic_disable,
>>   };
>>   
>> +static void vop2_dump_connector_on_crtc(struct drm_crtc *crtc, struct seq_file *s)
>> +{
>> +	struct drm_connector_list_iter conn_iter;
>> +	struct drm_connector *connector;
>> +
>> +	drm_connector_list_iter_begin(crtc->dev, &conn_iter);
>> +	drm_for_each_connector_iter(connector, &conn_iter) {
>> +		if (crtc->state->connector_mask & drm_connector_mask(connector))
>> +			seq_printf(s, "    Connector: %s\n", connector->name);
>> +
>> +	}
>> +	drm_connector_list_iter_end(&conn_iter);
>> +}
>> +
>> +static int vop2_plane_state_dump(struct seq_file *s, struct drm_plane *plane)
>> +{
>> +	struct vop2_win *win = to_vop2_win(plane);
>> +	struct drm_plane_state *pstate = plane->state;
>> +	struct drm_rect *src, *dst;
>> +	struct drm_framebuffer *fb;
>> +	struct drm_gem_object *obj;
>> +	struct rockchip_gem_object *rk_obj;
>> +	bool xmirror;
>> +	bool ymirror;
>> +	bool rotate_270;
>> +	bool rotate_90;
>> +	dma_addr_t fb_addr;
>> +	int i;
>> +
>> +	seq_printf(s, "    %s: %s\n", win->data->name, pstate->crtc ? "ACTIVE" : "DISABLED");
>> +	if (!pstate || !pstate->fb)
>> +		return 0;
>> +
>> +	fb = pstate->fb;
>> +	src = &pstate->src;
>> +	dst = &pstate->dst;
>> +	xmirror = pstate->rotation & DRM_MODE_REFLECT_X ? true : false;
>> +	ymirror = pstate->rotation & DRM_MODE_REFLECT_Y ? true : false;
>> +	rotate_270 = pstate->rotation & DRM_MODE_ROTATE_270;
>> +	rotate_90 = pstate->rotation & DRM_MODE_ROTATE_90;
>> +
>> +	seq_printf(s, "\twin_id: %d\n", win->win_id);
>> +
>> +	seq_printf(s, "\tformat: %p4cc%s glb_alpha[0x%x]\n",
>> +		   &fb->format->format,
>> +		   drm_is_afbc(fb->modifier) ? "[AFBC]" : "",
>> +		   pstate->alpha >> 8);
>> +	seq_printf(s, "\trotate: xmirror: %d ymirror: %d rotate_90: %d rotate_270: %d\n",
>> +		   xmirror, ymirror, rotate_90, rotate_270);
>> +	seq_printf(s, "\tzpos: %d\n", pstate->normalized_zpos);
>> +	seq_printf(s, "\tsrc: pos[%d, %d] rect[%d x %d]\n", src->x1 >> 16,
>> +		   src->y1 >> 16, drm_rect_width(src) >> 16,
>> +		   drm_rect_height(src) >> 16);
>> +	seq_printf(s, "\tdst: pos[%d, %d] rect[%d x %d]\n", dst->x1, dst->y1,
>> +		   drm_rect_width(dst), drm_rect_height(dst));
>> +
>> +	for (i = 0; i < fb->format->num_planes; i++) {
>> +		obj = fb->obj[0];
>> +		rk_obj = to_rockchip_obj(obj);
>> +		fb_addr = rk_obj->dma_addr + fb->offsets[0];
>> +
>> +		seq_printf(s, "\tbuf[%d]: addr: %pad pitch: %d offset: %d\n",
>> +			   i, &fb_addr, fb->pitches[i], fb->offsets[i]);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int vop2_crtc_state_dump(struct drm_crtc *crtc, struct seq_file *s)
>> +{
>> +	struct vop2_video_port *vp = to_vop2_video_port(crtc);
>> +	struct drm_crtc_state *cstate = crtc->state;
>> +	struct rockchip_crtc_state *vcstate;
>> +	struct drm_display_mode *mode;
>> +	struct drm_plane *plane;
>> +	bool interlaced;
>> +
>> +	seq_printf(s, "Video Port%d: %s\n", vp->id, !cstate ?
>> +		   "DISABLED" : cstate->active ? "ACTIVE" : "DISABLED");
>> +
>> +	if (!cstate || !cstate->active)
>> +		return 0;
>> +
>> +	mode = &crtc->state->adjusted_mode;
>> +	vcstate = to_rockchip_crtc_state(cstate);
>> +	interlaced = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
>> +
>> +	vop2_dump_connector_on_crtc(crtc, s);
>> +	seq_printf(s, "\tbus_format[%x]: %s\n", vcstate->bus_format,
>> +		    drm_get_bus_format_name(vcstate->bus_format));
>> +	seq_printf(s, "\toutput_mode[%x]", vcstate->output_mode);
>> +	seq_printf(s, " color_space[%d]\n", vcstate->color_space);
>> +	seq_printf(s, "    Display mode: %dx%d%s%d\n",
>> +		    mode->hdisplay, mode->vdisplay, interlaced ? "i" : "p",
>> +		    drm_mode_vrefresh(mode));
>> +	seq_printf(s, "\tclk[%d] real_clk[%d] type[%x] flag[%x]\n",
>> +		    mode->clock, mode->crtc_clock, mode->type, mode->flags);
>> +	seq_printf(s, "\tH: %d %d %d %d\n", mode->hdisplay, mode->hsync_start,
>> +		    mode->hsync_end, mode->htotal);
>> +	seq_printf(s, "\tV: %d %d %d %d\n", mode->vdisplay, mode->vsync_start,
>> +		    mode->vsync_end, mode->vtotal);
>> +
>> +	drm_atomic_crtc_for_each_plane(plane, crtc) {
>> +		vop2_plane_state_dump(s, plane);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int vop2_summary_show(struct seq_file *s, void *data)
>> +{
>> +	struct drm_info_node *node = s->private;
>> +	struct drm_minor *minor = node->minor;
>> +	struct drm_device *drm_dev = minor->dev;
>> +	struct drm_crtc *crtc;
>> +
>> +	drm_modeset_lock_all(drm_dev);
>> +	drm_for_each_crtc(crtc, drm_dev) {
>> +		vop2_crtc_state_dump(crtc, s);
>> +	}
>> +	drm_modeset_unlock_all(drm_dev);
>> +
>> +	return 0;
>> +}
>> +
>> +static void vop2_regs_print(struct vop2 *vop2, struct seq_file *s, struct vop2_regs_dump *dump)
>> +{
>> +	resource_size_t start;
>> +	const int reg_num = 0x110 / 4;
> If I'm not mistaken this prints a register space of 0x110 bytes.
> Shouldn't it be 0x100 bytes instead?
>
> Also, are all these register spaces really have the same size? Does it
> make sense to add the size to struct vop2_regs_dump?

In fact, most used registers of the most blocks are not more than 100, but for Cluster windows,

there is a CLUSTER_CTRL register sting at 0x100.

I think i should add the size to struct vop2_regs_dump.

>> +	u32 val;
>> +	int i;
>> +
>> +	if (dump->en_mask) {
>> +		val = vop2_readl(vop2, dump->base + dump->en_reg);
>> +		if ((val & dump->en_mask) != dump->en_val)
>> +			return;
>> +	}
>> +	seq_printf(s, "\n%s:\n", dump->name);
>> +
>> +	start = vop2->res->start + dump->base;
>> +	for (i = 0; i < reg_num;) {
>> +		seq_printf(s, "%08x:  %08x %08x %08x %08x\n", (u32)start + i * 4,
>> +			   vop2_readl(vop2, dump->base + (4 * i)),
>> +			   vop2_readl(vop2, dump->base + (4 * (i + 1))),
>> +			   vop2_readl(vop2, dump->base + (4 * (i + 2))),
>> +			   vop2_readl(vop2, dump->base + (4 * (i + 3))));
>> +		i += 4;
>> +	}
>> +
>> +}
>> +
>> +static int vop2_regs_show(struct seq_file *s, void *arg)
>> +{
>> +	struct drm_info_node *node = s->private;
>> +	struct vop2 *vop2 = (struct vop2 *)node->info_ent->data;
>> +	struct drm_minor *minor = node->minor;
>> +	struct drm_device *drm_dev = minor->dev;
>> +
>> +	struct vop2_regs_dump dump;
>> +
>> +	drm_modeset_lock_all(drm_dev);
>> +
>> +	if (vop2->enable_count) {
>> +		dump.en_mask = 0;
>> +
>> +		dump.name = "SYS";
>> +		dump.base = RK3568_REG_CFG_DONE;
>> +		vop2_regs_print(vop2, s, &dump);
> Can you create a statically initialized array of struct vop2_regs_dump
> and iterate over it?
> You would need an additional present_in_soc_xy flag in struct
> vop2_regs_dump, but other than that I don't see a problem and the result
> might look better.
>
> For the windows it might also be an option to iterate over
> vop2->data->win instead. This array already contains the register base
> addresses and window names.

In fact, we have a dump_regs  arrar in vop2_data per soc in our bsp kernel[0],

do you like something like that?

[0] https://github.com/armbian/linux-rockchip/blob/rk-5.10-rkr6/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c#L3684

>
>> +static int vop2_active_regs_show(struct seq_file *s, void *data)
>> +{
>> +	struct drm_info_node *node = s->private;
>> +	struct vop2 *vop2 = (struct vop2 *)node->info_ent->data;
>> +	struct drm_minor *minor = node->minor;
>> +	struct drm_device *drm_dev = minor->dev;
>> +
>> +	struct vop2_regs_dump dump;
>> +
>> +	drm_modeset_lock_all(drm_dev);
>> +	if (vop2->enable_count) {
>> +		dump.en_mask = 0;
>> +
>> +		dump.name = "SYS";
>> +		dump.base = RK3568_REG_CFG_DONE;
>> +		vop2_regs_print(vop2, s, &dump);
> Not sure if we really need an additional debugfs entry to print only the
> active entities, but if we do then we could avoid a bit of code
> duplication by adding creating a common register dump function called
> from vop2_regs_show() and vop2_active_regs_show() which takes an
> additional ignore_disabled argument.

As the whole vop2 registers block is very large, so some times only dump

active modules make we dig bugs easier.

It seems that if we  "initialized array of struct vop2_regs_dump" as you said befor, we can avoid

some duplication code here?

>
> Sascha
>
--------------wb4NmNzTA0TwIvG6F355qkVg
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Sascha:</p>
    <p>thanks for you review.<br>
    </p>
    <div class="moz-cite-prefix">On 11/27/23 18:13, Sascha Hauer wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20231127101337.GU3359458@pengutronix.de">
      <pre class="moz-quote-pre" wrap="">On Wed, Nov 22, 2023 at 08:56:01PM +0800, Andy Yan wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Andy Yan <a class="moz-txt-link-rfc2396E" href="mailto:andy.yan@rock-chips.com">&lt;andy.yan@rock-chips.com&gt;</a>

/sys/kernel/debug/dri/vop2/summary:  dump vop display state
/sys/kernel/debug/dri/vop2/regs: dump whole vop registers
/sys/kernel/debug/dri/vop2/active_regs: only dump the registers of
activated modules

Signed-off-by: Andy Yan <a class="moz-txt-link-rfc2396E" href="mailto:andy.yan@rock-chips.com">&lt;andy.yan@rock-chips.com&gt;</a>
---

(no changes since v1)

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 399 +++++++++++++++++++
 1 file changed, 399 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 9eecbe1f71f9..4a2342209c15 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -27,6 +27,7 @@
 #include &lt;drm/drm_debugfs.h&gt;
 #include &lt;drm/drm_flip_work.h&gt;
 #include &lt;drm/drm_framebuffer.h&gt;
+#include &lt;drm/drm_gem_framebuffer_helper.h&gt;
 #include &lt;drm/drm_probe_helper.h&gt;
 #include &lt;drm/drm_vblank.h&gt;
 
@@ -187,6 +188,7 @@ struct vop2 {
 	 */
 	u32 registered_num_wins;
 
+	struct resource *res;
 	void __iomem *regs;
 	struct regmap *map;
 
@@ -228,6 +230,44 @@ struct vop2 {
 #define vop2_output_if_is_lvds(x)	(x == ROCKCHIP_VOP2_EP_LVDS0 || x == ROCKCHIP_VOP2_EP_LVDS1)
 #define vop2_output_if_is_dpi(x)	(x == ROCKCHIP_VOP2_EP_RGB0)
 
+struct vop2_regs_dump {
+	const char *name;
+	u32 base;
+	u32 en_reg;
+	u32 en_val;
+	u32 en_mask;
+};
+
+/*
+ * bus-format types.
+ */
+struct drm_bus_format_enum_list {
+	int type;
+	const char *name;
+};
+
+static const struct drm_bus_format_enum_list drm_bus_format_enum_list[] = {
+	{ DRM_MODE_CONNECTOR_Unknown, "Unknown" },
+	{ MEDIA_BUS_FMT_RGB565_1X16, "RGB565_1X16" },
+	{ MEDIA_BUS_FMT_RGB666_1X18, "RGB666_1X18" },
+	{ MEDIA_BUS_FMT_RGB666_1X24_CPADHI, "RGB666_1X24_CPADHI" },
+	{ MEDIA_BUS_FMT_RGB666_1X7X3_SPWG, "RGB666_1X7X3_SPWG" },
+	{ MEDIA_BUS_FMT_YUV8_1X24, "YUV8_1X24" },
+	{ MEDIA_BUS_FMT_UYYVYY8_0_5X24, "UYYVYY8_0_5X24" },
+	{ MEDIA_BUS_FMT_YUV10_1X30, "YUV10_1X30" },
+	{ MEDIA_BUS_FMT_UYYVYY10_0_5X30, "UYYVYY10_0_5X30" },
+	{ MEDIA_BUS_FMT_RGB888_3X8, "RGB888_3X8" },
+	{ MEDIA_BUS_FMT_RGB888_1X24, "RGB888_1X24" },
+	{ MEDIA_BUS_FMT_RGB888_1X7X4_SPWG, "RGB888_1X7X4_SPWG" },
+	{ MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA, "RGB888_1X7X4_JEIDA" },
+	{ MEDIA_BUS_FMT_UYVY8_2X8, "UYVY8_2X8" },
+	{ MEDIA_BUS_FMT_YUYV8_1X16, "YUYV8_1X16" },
+	{ MEDIA_BUS_FMT_UYVY8_1X16, "UYVY8_1X16" },
+	{ MEDIA_BUS_FMT_RGB101010_1X30, "RGB101010_1X30" },
+	{ MEDIA_BUS_FMT_YUYV10_1X20, "YUYV10_1X20" },
+};
+static DRM_ENUM_NAME_FN(drm_get_bus_format_name, drm_bus_format_enum_list)
+
 static const struct regmap_config vop2_regmap_config;
 
 static struct vop2_video_port *to_vop2_video_port(struct drm_crtc *crtc)
@@ -2487,6 +2527,363 @@ static const struct drm_crtc_helper_funcs vop2_crtc_helper_funcs = {
 	.atomic_disable = vop2_crtc_atomic_disable,
 };
 
+static void vop2_dump_connector_on_crtc(struct drm_crtc *crtc, struct seq_file *s)
+{
+	struct drm_connector_list_iter conn_iter;
+	struct drm_connector *connector;
+
+	drm_connector_list_iter_begin(crtc-&gt;dev, &amp;conn_iter);
+	drm_for_each_connector_iter(connector, &amp;conn_iter) {
+		if (crtc-&gt;state-&gt;connector_mask &amp; drm_connector_mask(connector))
+			seq_printf(s, "    Connector: %s\n", connector-&gt;name);
+
+	}
+	drm_connector_list_iter_end(&amp;conn_iter);
+}
+
+static int vop2_plane_state_dump(struct seq_file *s, struct drm_plane *plane)
+{
+	struct vop2_win *win = to_vop2_win(plane);
+	struct drm_plane_state *pstate = plane-&gt;state;
+	struct drm_rect *src, *dst;
+	struct drm_framebuffer *fb;
+	struct drm_gem_object *obj;
+	struct rockchip_gem_object *rk_obj;
+	bool xmirror;
+	bool ymirror;
+	bool rotate_270;
+	bool rotate_90;
+	dma_addr_t fb_addr;
+	int i;
+
+	seq_printf(s, "    %s: %s\n", win-&gt;data-&gt;name, pstate-&gt;crtc ? "ACTIVE" : "DISABLED");
+	if (!pstate || !pstate-&gt;fb)
+		return 0;
+
+	fb = pstate-&gt;fb;
+	src = &amp;pstate-&gt;src;
+	dst = &amp;pstate-&gt;dst;
+	xmirror = pstate-&gt;rotation &amp; DRM_MODE_REFLECT_X ? true : false;
+	ymirror = pstate-&gt;rotation &amp; DRM_MODE_REFLECT_Y ? true : false;
+	rotate_270 = pstate-&gt;rotation &amp; DRM_MODE_ROTATE_270;
+	rotate_90 = pstate-&gt;rotation &amp; DRM_MODE_ROTATE_90;
+
+	seq_printf(s, "\twin_id: %d\n", win-&gt;win_id);
+
+	seq_printf(s, "\tformat: %p4cc%s glb_alpha[0x%x]\n",
+		   &amp;fb-&gt;format-&gt;format,
+		   drm_is_afbc(fb-&gt;modifier) ? "[AFBC]" : "",
+		   pstate-&gt;alpha &gt;&gt; 8);
+	seq_printf(s, "\trotate: xmirror: %d ymirror: %d rotate_90: %d rotate_270: %d\n",
+		   xmirror, ymirror, rotate_90, rotate_270);
+	seq_printf(s, "\tzpos: %d\n", pstate-&gt;normalized_zpos);
+	seq_printf(s, "\tsrc: pos[%d, %d] rect[%d x %d]\n", src-&gt;x1 &gt;&gt; 16,
+		   src-&gt;y1 &gt;&gt; 16, drm_rect_width(src) &gt;&gt; 16,
+		   drm_rect_height(src) &gt;&gt; 16);
+	seq_printf(s, "\tdst: pos[%d, %d] rect[%d x %d]\n", dst-&gt;x1, dst-&gt;y1,
+		   drm_rect_width(dst), drm_rect_height(dst));
+
+	for (i = 0; i &lt; fb-&gt;format-&gt;num_planes; i++) {
+		obj = fb-&gt;obj[0];
+		rk_obj = to_rockchip_obj(obj);
+		fb_addr = rk_obj-&gt;dma_addr + fb-&gt;offsets[0];
+
+		seq_printf(s, "\tbuf[%d]: addr: %pad pitch: %d offset: %d\n",
+			   i, &amp;fb_addr, fb-&gt;pitches[i], fb-&gt;offsets[i]);
+	}
+
+	return 0;
+}
+
+static int vop2_crtc_state_dump(struct drm_crtc *crtc, struct seq_file *s)
+{
+	struct vop2_video_port *vp = to_vop2_video_port(crtc);
+	struct drm_crtc_state *cstate = crtc-&gt;state;
+	struct rockchip_crtc_state *vcstate;
+	struct drm_display_mode *mode;
+	struct drm_plane *plane;
+	bool interlaced;
+
+	seq_printf(s, "Video Port%d: %s\n", vp-&gt;id, !cstate ?
+		   "DISABLED" : cstate-&gt;active ? "ACTIVE" : "DISABLED");
+
+	if (!cstate || !cstate-&gt;active)
+		return 0;
+
+	mode = &amp;crtc-&gt;state-&gt;adjusted_mode;
+	vcstate = to_rockchip_crtc_state(cstate);
+	interlaced = !!(mode-&gt;flags &amp; DRM_MODE_FLAG_INTERLACE);
+
+	vop2_dump_connector_on_crtc(crtc, s);
+	seq_printf(s, "\tbus_format[%x]: %s\n", vcstate-&gt;bus_format,
+		    drm_get_bus_format_name(vcstate-&gt;bus_format));
+	seq_printf(s, "\toutput_mode[%x]", vcstate-&gt;output_mode);
+	seq_printf(s, " color_space[%d]\n", vcstate-&gt;color_space);
+	seq_printf(s, "    Display mode: %dx%d%s%d\n",
+		    mode-&gt;hdisplay, mode-&gt;vdisplay, interlaced ? "i" : "p",
+		    drm_mode_vrefresh(mode));
+	seq_printf(s, "\tclk[%d] real_clk[%d] type[%x] flag[%x]\n",
+		    mode-&gt;clock, mode-&gt;crtc_clock, mode-&gt;type, mode-&gt;flags);
+	seq_printf(s, "\tH: %d %d %d %d\n", mode-&gt;hdisplay, mode-&gt;hsync_start,
+		    mode-&gt;hsync_end, mode-&gt;htotal);
+	seq_printf(s, "\tV: %d %d %d %d\n", mode-&gt;vdisplay, mode-&gt;vsync_start,
+		    mode-&gt;vsync_end, mode-&gt;vtotal);
+
+	drm_atomic_crtc_for_each_plane(plane, crtc) {
+		vop2_plane_state_dump(s, plane);
+	}
+
+	return 0;
+}
+
+static int vop2_summary_show(struct seq_file *s, void *data)
+{
+	struct drm_info_node *node = s-&gt;private;
+	struct drm_minor *minor = node-&gt;minor;
+	struct drm_device *drm_dev = minor-&gt;dev;
+	struct drm_crtc *crtc;
+
+	drm_modeset_lock_all(drm_dev);
+	drm_for_each_crtc(crtc, drm_dev) {
+		vop2_crtc_state_dump(crtc, s);
+	}
+	drm_modeset_unlock_all(drm_dev);
+
+	return 0;
+}
+
+static void vop2_regs_print(struct vop2 *vop2, struct seq_file *s, struct vop2_regs_dump *dump)
+{
+	resource_size_t start;
+	const int reg_num = 0x110 / 4;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
If I'm not mistaken this prints a register space of 0x110 bytes.
Shouldn't it be 0x100 bytes instead?

Also, are all these register spaces really have the same size? Does it
make sense to add the size to struct vop2_regs_dump?
</pre>
    </blockquote>
    <p>In fact, most used registers of the most blocks are not more than
      100, but for Cluster windows,</p>
    <p>there is a CLUSTER_CTRL register sting at 0x100.</p>
    <p>I think i should add the size to struct vop2_regs_dump.<br>
    </p>
    <blockquote type="cite"
      cite="mid:20231127101337.GU3359458@pengutronix.de">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+	u32 val;
+	int i;
+
+	if (dump-&gt;en_mask) {
+		val = vop2_readl(vop2, dump-&gt;base + dump-&gt;en_reg);
+		if ((val &amp; dump-&gt;en_mask) != dump-&gt;en_val)
+			return;
+	}
+	seq_printf(s, "\n%s:\n", dump-&gt;name);
+
+	start = vop2-&gt;res-&gt;start + dump-&gt;base;
+	for (i = 0; i &lt; reg_num;) {
+		seq_printf(s, "%08x:  %08x %08x %08x %08x\n", (u32)start + i * 4,
+			   vop2_readl(vop2, dump-&gt;base + (4 * i)),
+			   vop2_readl(vop2, dump-&gt;base + (4 * (i + 1))),
+			   vop2_readl(vop2, dump-&gt;base + (4 * (i + 2))),
+			   vop2_readl(vop2, dump-&gt;base + (4 * (i + 3))));
+		i += 4;
+	}
+
+}
+
+static int vop2_regs_show(struct seq_file *s, void *arg)
+{
+	struct drm_info_node *node = s-&gt;private;
+	struct vop2 *vop2 = (struct vop2 *)node-&gt;info_ent-&gt;data;
+	struct drm_minor *minor = node-&gt;minor;
+	struct drm_device *drm_dev = minor-&gt;dev;
+
+	struct vop2_regs_dump dump;
+
+	drm_modeset_lock_all(drm_dev);
+
+	if (vop2-&gt;enable_count) {
+		dump.en_mask = 0;
+
+		dump.name = "SYS";
+		dump.base = RK3568_REG_CFG_DONE;
+		vop2_regs_print(vop2, s, &amp;dump);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Can you create a statically initialized array of struct vop2_regs_dump
and iterate over it?
You would need an additional present_in_soc_xy flag in struct
vop2_regs_dump, but other than that I don't see a problem and the result
might look better.

For the windows it might also be an option to iterate over
vop2-&gt;data-&gt;win instead. This array already contains the register base
addresses and window names.</pre>
    </blockquote>
    <p>In fact, we have a dump_regs  arrar in vop2_data per soc in our
      bsp kernel[0],</p>
    <p>do you like something like that?</p>
    <p>[0]
<a class="moz-txt-link-freetext" href="https://github.com/armbian/linux-rockchip/blob/rk-5.10-rkr6/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c#L3684">https://github.com/armbian/linux-rockchip/blob/rk-5.10-rkr6/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c#L3684</a><br>
    </p>
    <blockquote type="cite"
      cite="mid:20231127101337.GU3359458@pengutronix.de">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+static int vop2_active_regs_show(struct seq_file *s, void *data)
+{
+	struct drm_info_node *node = s-&gt;private;
+	struct vop2 *vop2 = (struct vop2 *)node-&gt;info_ent-&gt;data;
+	struct drm_minor *minor = node-&gt;minor;
+	struct drm_device *drm_dev = minor-&gt;dev;
+
+	struct vop2_regs_dump dump;
+
+	drm_modeset_lock_all(drm_dev);
+	if (vop2-&gt;enable_count) {
+		dump.en_mask = 0;
+
+		dump.name = "SYS";
+		dump.base = RK3568_REG_CFG_DONE;
+		vop2_regs_print(vop2, s, &amp;dump);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Not sure if we really need an additional debugfs entry to print only the
active entities, but if we do then we could avoid a bit of code
duplication by adding creating a common register dump function called
from vop2_regs_show() and vop2_active_regs_show() which takes an
additional ignore_disabled argument.</pre>
    </blockquote>
    <p>As the whole vop2 registers block is very large, so some times
      only dump</p>
    <p>active modules make we dig bugs easier. <br>
    </p>
    <p>It seems that if we  "<span style="white-space: pre-wrap">initialized array of struct vop2_regs_dump" as you said befor, we can avoid</span></p>
    <p><span style="white-space: pre-wrap">some duplication code here?
</span></p>
    <blockquote type="cite"
      cite="mid:20231127101337.GU3359458@pengutronix.de">
      <pre class="moz-quote-pre" wrap="">

Sascha

</pre>
    </blockquote>
  </body>
</html>

--------------wb4NmNzTA0TwIvG6F355qkVg--
