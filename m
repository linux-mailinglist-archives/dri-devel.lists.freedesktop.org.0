Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5901807041
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 13:53:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E914710E10E;
	Wed,  6 Dec 2023 12:53:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com
 [61.152.239.71])
 by gabe.freedesktop.org (Postfix) with ESMTP id AB27410E10E
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 12:53:17 +0000 (UTC)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
 by fd01.gateway.ufhost.com (Postfix) with ESMTP id F1B7080C5;
 Wed,  6 Dec 2023 20:53:13 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 6 Dec
 2023 20:53:13 +0800
Received: from [192.168.1.115] (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 6 Dec
 2023 20:53:13 +0800
Message-ID: <ed66711a-4c24-40d1-8361-40325ae915f5@starfivetech.com>
Date: Wed, 6 Dec 2023 20:53:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 4/6] drm/vs: Add KMS crtc&plane
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>
References: <20231204123315.28456-1-keith.zhao@starfivetech.com>
 <20231204123315.28456-5-keith.zhao@starfivetech.com>
 <o4ica2jg2rqfx6znir6j7mkoojoqzejjuqvlwcnehanw5mvop6@a3t6vi7c55tz>
From: Keith Zhao <keith.zhao@starfivetech.com>
In-Reply-To: <o4ica2jg2rqfx6znir6j7mkoojoqzejjuqvlwcnehanw5mvop6@a3t6vi7c55tz>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "suijingfeng@loongson.cn" <suijingfeng@loongson.cn>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Xingyu Wu <xingyu.wu@starfivetech.com>, Jack Zhu <jack.zhu@starfivetech.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 William Qiu <william.qiu@starfivetech.com>,
 Shengyang Chen <shengyang.chen@starfivetech.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Changhuang Liang <changhuang.liang@starfivetech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023/12/6 16:55, Maxime Ripard wrote:
> On Mon, Dec 04, 2023 at 08:33:13PM +0800, Keith Zhao wrote:
>> +static const struct vs_plane_info dc_hw_planes_rev0[PLANE_NUM] =3D {
>> +	{
>> +		.name			=3D "Primary",
>> +		.id			=3D PRIMARY_PLANE_0,
>> +		.type			=3D DRM_PLANE_TYPE_PRIMARY,
>> +		.num_formats		=3D ARRAY_SIZE(primary_overlay_format0),
>> +		.formats		=3D primary_overlay_format0,
>> +		.num_modifiers		=3D ARRAY_SIZE(format_modifier0),
>> +		.modifiers		=3D format_modifier0,
>> +		.min_width		=3D 0,
>> +		.min_height		=3D 0,
>> +		.max_width		=3D 4096,
>> +		.max_height		=3D 4096,
>> +		.rotation		=3D DRM_MODE_ROTATE_0 |
>> +					  DRM_MODE_ROTATE_90 |
>> +					  DRM_MODE_ROTATE_180 |
>> +					  DRM_MODE_ROTATE_270 |
>> +					  DRM_MODE_REFLECT_X |
>> +					  DRM_MODE_REFLECT_Y,
>> +		.blend_mode		=3D BIT(DRM_MODE_BLEND_PIXEL_NONE) |
>> +					  BIT(DRM_MODE_BLEND_PREMULTI) |
>> +					  BIT(DRM_MODE_BLEND_COVERAGE),
>> +		.color_encoding		=3D BIT(DRM_COLOR_YCBCR_BT709) |
>> +					  BIT(DRM_COLOR_YCBCR_BT2020),
>> +		.degamma_size		=3D DEGAMMA_SIZE,
>> +		.min_scale		=3D FRAC_16_16(1, 3),
>> +		.max_scale		=3D FRAC_16_16(10, 1),
>> +		.zpos			=3D 0,
>> +		.watermark		=3D true,
>> +		.color_mgmt		=3D true,
>> +		.roi			=3D true,
>> +	},
>> +	{
>> +		.name			=3D "Overlay",
>> +		.id			=3D OVERLAY_PLANE_0,
>> +		.type			=3D DRM_PLANE_TYPE_OVERLAY,
>> +		.num_formats		=3D ARRAY_SIZE(primary_overlay_format0),
>> +		.formats		=3D primary_overlay_format0,
>> +		.num_modifiers		=3D ARRAY_SIZE(format_modifier0),
>> +		.modifiers		=3D format_modifier0,
>> +		.min_width		=3D 0,
>> +		.min_height		=3D 0,
>> +		.max_width		=3D 4096,
>> +		.max_height		=3D 4096,
>> +		.rotation		=3D DRM_MODE_ROTATE_0 |
>> +					  DRM_MODE_ROTATE_90 |
>> +					  DRM_MODE_ROTATE_180 |
>> +					  DRM_MODE_ROTATE_270 |
>> +					  DRM_MODE_REFLECT_X |
>> +					  DRM_MODE_REFLECT_Y,
>> +		.blend_mode		=3D BIT(DRM_MODE_BLEND_PIXEL_NONE) |
>> +					  BIT(DRM_MODE_BLEND_PREMULTI) |
>> +					  BIT(DRM_MODE_BLEND_COVERAGE),
>> +		.color_encoding		=3D BIT(DRM_COLOR_YCBCR_BT709) |
>> +					  BIT(DRM_COLOR_YCBCR_BT2020),
>> +		.degamma_size		=3D DEGAMMA_SIZE,
>> +		.min_scale		=3D FRAC_16_16(1, 3),
>> +		.max_scale		=3D FRAC_16_16(10, 1),
>> +		.zpos			=3D 1,
>> +		.watermark		=3D true,
>> +		.color_mgmt		=3D true,
>> +		.roi			=3D true,
>> +	},
>> +	{
>> +		.name			=3D "Overlay_1",
>> +		.id			=3D OVERLAY_PLANE_1,
>> +		.type			=3D DRM_PLANE_TYPE_OVERLAY,
>> +		.num_formats		=3D ARRAY_SIZE(primary_overlay_format0),
>> +		.formats		=3D primary_overlay_format0,
>> +		.num_modifiers		=3D ARRAY_SIZE(secondary_format_modifiers),
>> +		.modifiers		=3D secondary_format_modifiers,
>> +		.min_width		=3D 0,
>> +		.min_height		=3D 0,
>> +		.max_width		=3D 4096,
>> +		.max_height		=3D 4096,
>> +		.rotation		=3D 0,
>> +		.blend_mode		=3D BIT(DRM_MODE_BLEND_PIXEL_NONE) |
>> +					  BIT(DRM_MODE_BLEND_PREMULTI) |
>> +					  BIT(DRM_MODE_BLEND_COVERAGE),
>> +		.color_encoding		=3D BIT(DRM_COLOR_YCBCR_BT709) |
>> +					  BIT(DRM_COLOR_YCBCR_BT2020),
>> +		.degamma_size		=3D DEGAMMA_SIZE,
>> +		.min_scale		=3D DRM_PLANE_NO_SCALING,
>> +		.max_scale		=3D DRM_PLANE_NO_SCALING,
>> +		.zpos			=3D 2,
>> +		.watermark		=3D true,
>> +		.color_mgmt		=3D true,
>> +		.roi			=3D true,
>> +	},
>> +	{
>> +		.name			=3D "Primary_1",
>> +		.id			=3D PRIMARY_PLANE_1,
>> +		.type			=3D DRM_PLANE_TYPE_PRIMARY,
>> +		.num_formats		=3D ARRAY_SIZE(primary_overlay_format0),
>> +		.formats		=3D primary_overlay_format0,
>> +		.num_modifiers		=3D ARRAY_SIZE(format_modifier0),
>> +		.modifiers		=3D format_modifier0,
>> +		.min_width		=3D 0,
>> +		.min_height		=3D 0,
>> +		.max_width		=3D 4096,
>> +		.max_height		=3D 4096,
>> +		.rotation		=3D DRM_MODE_ROTATE_0 |
>> +					  DRM_MODE_ROTATE_90 |
>> +					  DRM_MODE_ROTATE_180 |
>> +					  DRM_MODE_ROTATE_270 |
>> +					  DRM_MODE_REFLECT_X |
>> +					  DRM_MODE_REFLECT_Y,
>> +		.blend_mode		=3D BIT(DRM_MODE_BLEND_PIXEL_NONE) |
>> +					  BIT(DRM_MODE_BLEND_PREMULTI) |
>> +					  BIT(DRM_MODE_BLEND_COVERAGE),
>> +		.color_encoding		=3D BIT(DRM_COLOR_YCBCR_BT709) |
>> +					  BIT(DRM_COLOR_YCBCR_BT2020),
>> +		.degamma_size		=3D DEGAMMA_SIZE,
>> +		.min_scale		=3D FRAC_16_16(1, 3),
>> +		.max_scale		=3D FRAC_16_16(10, 1),
>> +		.zpos			=3D 3,
>> +		.watermark		=3D true,
>> +		.color_mgmt		=3D true,
>> +		.roi			=3D true,
>> +	},
>> +	{
>> +		.name			=3D "Overlay_2",
>> +		.id			=3D OVERLAY_PLANE_2,
>> +		.type			=3D DRM_PLANE_TYPE_OVERLAY,
>> +		.num_formats		=3D ARRAY_SIZE(primary_overlay_format0),
>> +		.formats		=3D primary_overlay_format0,
>> +		.num_modifiers		=3D ARRAY_SIZE(format_modifier0),
>> +		.modifiers		=3D format_modifier0,
>> +		.min_width		=3D 0,
>> +		.min_height		=3D 0,
>> +		.max_width		=3D 4096,
>> +		.max_height		=3D 4096,
>> +		.rotation		=3D DRM_MODE_ROTATE_0 |
>> +					  DRM_MODE_ROTATE_90 |
>> +					  DRM_MODE_ROTATE_180 |
>> +					  DRM_MODE_ROTATE_270 |
>> +					  DRM_MODE_REFLECT_X |
>> +					  DRM_MODE_REFLECT_Y,
>> +		.blend_mode		=3D BIT(DRM_MODE_BLEND_PIXEL_NONE) |
>> +					  BIT(DRM_MODE_BLEND_PREMULTI) |
>> +					  BIT(DRM_MODE_BLEND_COVERAGE),
>> +		.color_encoding		=3D BIT(DRM_COLOR_YCBCR_BT709) |
>> +					  BIT(DRM_COLOR_YCBCR_BT2020),
>> +		.degamma_size		=3D DEGAMMA_SIZE,
>> +		.min_scale		=3D FRAC_16_16(1, 3),
>> +		.max_scale		=3D FRAC_16_16(10, 1),
>> +		.zpos			=3D 4,
>> +		.watermark		=3D true,
>> +		.color_mgmt		=3D true,
>> +		.roi			=3D true,
>> +	},
>> +	{
>> +		.name			=3D "Overlay_3",
>> +		.id			=3D OVERLAY_PLANE_3,
>> +		.type			=3D DRM_PLANE_TYPE_OVERLAY,
>> +		.num_formats		=3D ARRAY_SIZE(primary_overlay_format0),
>> +		.formats		=3D primary_overlay_format0,
>> +		.num_modifiers		=3D ARRAY_SIZE(secondary_format_modifiers),
>> +		.modifiers		=3D secondary_format_modifiers,
>> +		.min_width		=3D 0,
>> +		.min_height		=3D 0,
>> +		.max_width		=3D 4096,
>> +		.max_height		=3D 4096,
>> +		.rotation		=3D 0,
>> +		.blend_mode		=3D BIT(DRM_MODE_BLEND_PIXEL_NONE) |
>> +					  BIT(DRM_MODE_BLEND_PREMULTI) |
>> +					  BIT(DRM_MODE_BLEND_COVERAGE),
>> +		.color_encoding		=3D BIT(DRM_COLOR_YCBCR_BT709) |
>> +					  BIT(DRM_COLOR_YCBCR_BT2020),
>> +		.degamma_size		=3D DEGAMMA_SIZE,
>> +		.min_scale		=3D DRM_PLANE_NO_SCALING,
>> +		.max_scale		=3D DRM_PLANE_NO_SCALING,
>> +		.zpos			=3D 5,
>> +		.watermark		=3D true,
>> +		.color_mgmt		=3D true,
>> +		.roi			=3D true,
>> +	},
>> +	{
>> +		.name			=3D "Cursor",
>> +		.id			=3D CURSOR_PLANE_0,
>> +		.type			=3D DRM_PLANE_TYPE_CURSOR,
>> +		.num_formats		=3D ARRAY_SIZE(cursor_formats),
>> +		.formats		=3D cursor_formats,
>> +		.num_modifiers		=3D 0,
>> +		.modifiers		=3D NULL,
>> +		.min_width		=3D 32,
>> +		.min_height		=3D 32,
>> +		.max_width		=3D 64,
>> +		.max_height		=3D 64,
>> +		.rotation		=3D 0,
>> +		.degamma_size		=3D 0,
>> +		.min_scale		=3D DRM_PLANE_NO_SCALING,
>> +		.max_scale		=3D DRM_PLANE_NO_SCALING,
>> +		.zpos			=3D 255,
>> +		.watermark		=3D false,
>> +		.color_mgmt		=3D false,
>> +		.roi			=3D false,
>> +	},
>> +	{
>> +		.name			=3D "Cursor_1",
>> +		.id			=3D CURSOR_PLANE_1,
>> +		.type			=3D DRM_PLANE_TYPE_CURSOR,
>> +		.num_formats		=3D ARRAY_SIZE(cursor_formats),
>> +		.formats		=3D cursor_formats,
>> +		.num_modifiers		=3D 0,
>> +		.modifiers		=3D NULL,
>> +		.min_width		=3D 32,
>> +		.min_height		=3D 32,
>> +		.max_width		=3D 64,
>> +		.max_height		=3D 64,
>> +		.rotation		=3D 0,
>> +		.degamma_size		=3D 0,
>> +		.min_scale		=3D DRM_PLANE_NO_SCALING,
>> +		.max_scale		=3D DRM_PLANE_NO_SCALING,
>> +		.zpos			=3D 255,
>> +		.watermark		=3D false,
>> +		.color_mgmt		=3D false,
>> +		.roi			=3D false,
>> +	},
>> +};
>> +
>> +static const struct vs_dc_info dc8200_info =3D {
>> +	.name			=3D "DC8200",
>> +	.panel_num		=3D 2,
>> +	.plane_num		=3D 8,
>> +	.planes			=3D dc_hw_planes_rev0,
>> +	.layer_num		=3D 6,
>> +	.max_bpc		=3D 10,
>> +	.color_formats		=3D DRM_COLOR_FORMAT_RGB444 |
>> +				  DRM_COLOR_FORMAT_YCBCR444 |
>> +				  DRM_COLOR_FORMAT_YCBCR422 |
>> +				  DRM_COLOR_FORMAT_YCBCR420,
>> +	.gamma_size		=3D GAMMA_EX_SIZE,
>> +	.gamma_bits		=3D 12,
>> +	.pitch_alignment	=3D 128,
>> +	.pipe_sync		=3D false,
>> +	.background		=3D true,
>> +	.panel_sync		=3D true,
>> +	.cap_dec		=3D true,
>> +};
>=20
> I really think that entire thing is to workaround a suboptimal device
> tree binding. You should have two CRTCs in the device tree, you'll prob=
e
> twice, and you won't get to do that whole dance.
>=20

i got you means =E2=80=9Ctwo CRTCs in the device tree=EF=BC=8Cprobe twice=
"
maybe also I can split the common ctrc helper fun into 2 ,=20

current the driver probe once and map 2 port as ctrc node ,

>=20
>> +struct dc_hw_plane_reg {
>> +	u32 y_address;
>> +	u32 u_address;
>> +	u32 v_address;
>> +	u32 y_stride;
>> +	u32 u_stride;
>> +	u32 v_stride;
>> +	u32 size;
>> +	u32 top_left;
>> +	u32 bottom_right;
>> +	u32 scale_factor_x;
>> +	u32 scale_factor_y;
>> +	u32 h_filter_coef_index;
>> +	u32 h_filter_coef_data;
>> +	u32 v_filter_coef_index;
>> +	u32 v_filter_coef_data;
>> +	u32 init_offset;
>> +	u32 color_key;
>> +	u32 color_key_high;
>> +	u32 clear_value;
>> +	u32 color_table_index;
>> +	u32 color_table_data;
>> +	u32 scale_config;
>> +	u32 water_mark;
>> +	u32 degamma_index;
>> +	u32 degamma_data;
>> +	u32 degamma_ex_data;
>> +	u32 src_global_color;
>> +	u32 dst_global_color;
>> +	u32 blend_config;
>> +	u32 roi_origin;
>> +	u32 roi_size;
>> +	u32 yuv_to_rgb_coef0;
>> +	u32 yuv_to_rgb_coef1;
>> +	u32 yuv_to_rgb_coef2;
>> +	u32 yuv_to_rgb_coef3;
>> +	u32 yuv_to_rgb_coef4;
>> +	u32 yuv_to_rgb_coefd0;
>> +	u32 yuv_to_rgb_coefd1;
>> +	u32 yuv_to_rgb_coefd2;
>> +	u32 y_clamp_bound;
>> +	u32 uv_clamp_bound;
>> +	u32 rgb_to_rgb_coef0;
>> +	u32 rgb_to_rgb_coef1;
>> +	u32 rgb_to_rgb_coef2;
>> +	u32 rgb_to_rgb_coef3;
>> +	u32 rgb_to_rgb_coef4;
>> +};
>=20
> That's your plane state.
>=20
>> +struct dc_hw_fb {
>> +	u32 y_address;
>> +	u32 u_address;
>> +	u32 v_address;
>> +	u32 clear_value;
>> +	u32 water_mark;
>> +	u16 y_stride;
>> +	u16 u_stride;
>> +	u16 v_stride;
>> +	u16 width;
>> +	u16 height;
>> +	u8	format;
>> +	u8	tile_mode;
>> +	u8	rotation;
>> +	u8	yuv_color_space;
>> +	u8	swizzle;
>> +	u8	uv_swizzle;
>> +	u8	zpos;
>> +	u8	display_id;
>> +	bool	clear_enable;
>> +	bool	dec_enable;
>> +	bool	enable;
>> +	bool	dirty;
>> +};
>=20
> Your framebuffer
>=20
>> +struct dc_hw_scale {
>> +	u32 scale_factor_x;
>> +	u32 scale_factor_y;
>> +	bool	enable;
>> +	bool	dirty;
>> +};
>> +
>> +struct dc_hw_position {
>> +	u16 start_x;
>> +	u16 start_y;
>> +	u16 end_x;
>> +	u16 end_y;
>> +	bool	dirty;
>> +};
>> +
>> +struct dc_hw_blend {
>> +	u8	alpha;
>> +	u8	blend_mode;
>> +	bool	dirty;
>> +};
>> +
>> +struct dc_hw_colorkey {
>> +	u32 colorkey;
>> +	u32 colorkey_high;
>> +	u8	transparency;
>> +	bool dirty;
>> +};
>=20
> Your CRTC state.
>=20
>> +struct dc_hw_roi {
>> +	u16 x;
>> +	u16 y;
>> +	u16 width;
>> +	u16 height;
>> +	bool enable;
>> +	bool dirty;
>> +};
>> +
>> +struct dc_hw_cursor {
>> +	u32 address;
>> +	u16 x;
>> +	u16 y;
>> +	u16 hot_x;
>> +	u16 hot_y;
>> +	u8	size;
>> +	u8	display_id;
>> +	bool	enable;
>> +	bool	dirty;
>> +};
>> +
>> +struct dc_hw_display {
>> +	u32 bus_format;
>> +	u16 h_active;
>> +	u16 h_total;
>> +	u16 h_sync_start;
>> +	u16 h_sync_end;
>> +	u16 v_active;
>> +	u16 v_total;
>> +	u16 v_sync_start;
>> +	u16 v_sync_end;
>> +	u8	id;
>> +	bool	h_sync_polarity;
>> +	bool	v_sync_polarity;
>> +	bool	enable;
>> +};
>=20
> Your display mode.
>=20
> Really, you have the huge majority of those informations already
> available, there's no need to duplicate it. And chances are you'll
> create bugs in the process.
> Maxime
ok let me try it,=20
This will be another relatively big change.

