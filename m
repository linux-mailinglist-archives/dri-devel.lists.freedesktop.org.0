Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2F8A263FF
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 20:48:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56BE110E55F;
	Mon,  3 Feb 2025 19:47:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="W0cB5BDL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36D8E10E55B
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 19:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1738612076; x=1739216876; i=deller@gmx.de;
 bh=X0mdUjaJ3AVyB/edvw4KTRrcP5HXMb6Gr1iKCbCozVA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=W0cB5BDL6nFNkwfs+hDbLN6JdZl2BytxedG5FO5zZvpiNnQjl+Sm45GyuNJixpI+
 QjpTBx1W4M86WhVZDJZNZke+aUbZfQS8joUczS4m7MpeycyCVREHFoOkr248wmd/D
 borS6qYi4kPR0elSUFd0zpZToeOp/CXhilpKAKk9L0NH+vT7d2yj+YCv0j0xcb9Bf
 /K4byE3xSb4Kmid5cTRroEZGInH3bnIzKWde1VLICHGMW2sSGZpR23/NxZjccX/Cc
 2fdhfu9W7I/WfY+61baDqlc2WAKi1K89V/4v5RqY7BycIvPPixeAPe/a02SkMKE6I
 tbIc6qCQikNHQeQSew==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.6]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MDQeK-1tXv3l3hR8-001TBZ; Mon, 03
 Feb 2025 20:42:43 +0100
Message-ID: <a7275081-1e55-4905-9743-c7215c3174c8@gmx.de>
Date: Mon, 3 Feb 2025 20:42:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Use correct erase colour for clearing in fbcon
To: =?UTF-8?Q?Kajt=C3=A1r_Zsolt?= <soci@c64.rulez.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <0abefa4d-be0c-4e2b-1c8d-e3e448151389@c64.rulez.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <0abefa4d-be0c-4e2b-1c8d-e3e448151389@c64.rulez.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/J7ihNUaIESm/iW/PneBv/mqfIbu+MH45D+Wbx7W+Rp5+oYBobi
 Cvbf7JqKkrau8AS05mIQreEuTVlqUnGETJudEkC5OvSmhux2CeNKXoGgUFUTktl9lhLdtwk
 mqXfiOpmBGfbZI6qTzznIKPdXqO5LoevH63bZ4RyKQKQeiJkZhYZxEwD34HpZDxfW/e/pue
 N6mjSZMG0uRLDb16GyezQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cxsd68ssl/c=;+2vcwpcGip10Zs/X5TK/pxVJac+
 8VcKTfQO4+a7ZMcqdi497Wtf25lxjC1vXA5SsominMlUpaPATn0ihE7NhM+UzX1V32aop92qD
 nvZz3scweRbhRjL8af6o4EF1ANsmKEa1NKOm0moZZqeoBB1paAEg8vy4Rjf6dBRJmE5wx4JcX
 PgkvaIRqijwQVr9lVpg++wBpT0ocJRj90KemZbTj3VupOg/xcEa4R6GjS317j7DHhoynSCn/9
 0X66knruUuk9THUKgiWkVUoQ8Kv2WMAuPTsM/LU3koo09fy2nG0gAdElOT7a3X316BNiwTBbZ
 4b1mLTRXLiDgeOJ213AGuE8mKkxiIO/Qj1fsIeWrOhAnrP0BHZg3csEYh7/Ktkl9PA3LJ/r+y
 G6JioQ9ZUfArKBgEaOzLPm4eDK37V8+sHNjAOOEqRqdTjI+n4LExypt8JGJOJwgI63ckP11eq
 bNDRhefE1zLFd+GYiZgCBMMdiKdqs3FciL6wo5zRzKOBdJXDsMxLMDpz1ZnTmxw2UsPoMD+5d
 a8P5ZD245jqQqoM3vaeBIO2sn+ka2APobtFQgFphKlHW0glFTthGPZhhsCHAGqxqPbY0Z8JHs
 4lIF+KVP+aBry3DI1LVgr78Myno/GjumYXUoHRp4eJxUMPTquXVdkrEPxROT/mWbR1KWj6prt
 K4u/3FLbqwpsfHhWaLTtFLNNdfpE6zBXtT7m6Z6yjN2y7pdPmDtdjFn8BIzikXBbUgP5mgiqV
 14YHq6C6IyIs+2wQXfIRgDK22l3qJzxIUt+lRkXM1hB2wnfIPQDlE5YepW+L2uFkRqEsj1Xvm
 L7EsCqinCRgKcRPeHYOR0QlFkZ99uhgd8tPzCke4N9/FWOZHvAud9mRnKX1cYlBPK1lmIc6mb
 Kda4Gn0oJmb+aYz3ql883otThrtp+6I36riKJxqpLRzko9z3r48KNzpGj2Fpbise7mZuxcFOh
 52UWebJEzt8pO1LxJ8zqUy8blPzBTVYSEkhM8/bMA7IxPFMRb1Dbz231DSRWV15KqwhFkTza1
 W/uPnjU+1VMvGDoAL8GMxN4tHga/Obc+djRECtq7YmnqAsdwVnAMm5HSw+hlqwI4OXIytLRWV
 W3JhqlSmR1WcFPg+1+6bjWfd9pyGjrqb7G0KMHAsSqhNLgGyqm6ykjEpV8Oc6iHOD0j63PgL1
 cuorcMd+hhUI1/0ve3R4d1BP7kIKAgZPxYg39+uN50wm0E9zU+ocN0J2XCly7ugmQukwt63uU
 OrNmBHTw8EnfB7fGWX/Dl/WwbCWE3V5BlmvExCD2+8RIUu8Kw980o7+JBY68iHIuEqtOIM7AS
 OUQLDdP1kfF9QPX7Cda63DnIxx2Q81MQAypKMGdsplYpA0=
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

On 2/2/25 21:33, Kajt=C3=A1r Zsolt wrote:
> The erase colour calculation for fbcon clearing should use get_color ins=
tead
> of attr_col_ec, like everything else. The latter is similar but is not c=
orrect.
> For example it's missing the depth dependent remapping and doesn't care =
about
> blanking.
>
> The problem can be reproduced by setting up the background colour to gre=
y
> (vt.color=3D0x70) and having an fbcon console set to 2bpp (4 shades of g=
ray).
> Now the background attribute should be 1 (dark gray) on the console.
>
> If the screen is scrolled when pressing enter in a shell prompt at the b=
ottom
> line then the new line is cleared using colour 7 instead of 1. That's no=
t
> something fillrect likes (at 2bbp it expect 0-3) so the result is intere=
sting.
>
> This patch switches to get_color with vc_video_erase_char to determine t=
he
> erase colour from attr_col_ec. That makes the latter function redundant =
as
> no other users were left.
>
> Use correct erase colour for clearing in fbcon
>
> Signed-off-by: Zsolt Kajtar <soci@c64.rulez.org>


applied for further testing to fbdev git tree.

Helge

> ---
>   drivers/video/fbdev/core/bitblit.c   |  5 ++--
>   drivers/video/fbdev/core/fbcon.c     | 10 +++++---
>   drivers/video/fbdev/core/fbcon.h     | 38 +---------------------------
>   drivers/video/fbdev/core/fbcon_ccw.c |  5 ++--
>   drivers/video/fbdev/core/fbcon_cw.c  |  5 ++--
>   drivers/video/fbdev/core/fbcon_ud.c  |  5 ++--
>   drivers/video/fbdev/core/tileblit.c  |  8 +++---
>   7 files changed, 18 insertions(+), 58 deletions(-)
>
> diff --git a/drivers/video/fbdev/core/bitblit.c b/drivers/video/fbdev/co=
re/bitblit.c
> index 3ff1b2a86..f9475c14f 100644
> --- a/drivers/video/fbdev/core/bitblit.c
> +++ b/drivers/video/fbdev/core/bitblit.c
> @@ -59,12 +59,11 @@ static void bit_bmove(struct vc_data *vc, struct fb_=
info *info, int sy,
>   }
>
>   static void bit_clear(struct vc_data *vc, struct fb_info *info, int sy=
,
> -		      int sx, int height, int width)
> +		      int sx, int height, int width, int fg, int bg)
>   {
> -	int bgshift =3D (vc->vc_hi_font_mask) ? 13 : 12;
>   	struct fb_fillrect region;
>
> -	region.color =3D attr_bgcol_ec(bgshift, vc, info);
> +	region.color =3D bg;
>   	region.dx =3D sx * vc->vc_font.width;
>   	region.dy =3D sy * vc->vc_font.height;
>   	region.width =3D width * vc->vc_font.width;
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core=
/fbcon.c
> index e8b4e8c11..07d127110 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -1258,7 +1258,7 @@ static void __fbcon_clear(struct vc_data *vc, unsi=
gned int sy, unsigned int sx,
>   {
>   	struct fb_info *info =3D fbcon_info_from_console(vc->vc_num);
>   	struct fbcon_ops *ops =3D info->fbcon_par;
> -
> +	int fg, bg;
>   	struct fbcon_display *p =3D &fb_display[vc->vc_num];
>   	u_int y_break;
>
> @@ -1279,16 +1279,18 @@ static void __fbcon_clear(struct vc_data *vc, un=
signed int sy, unsigned int sx,
>   		fbcon_clear_margins(vc, 0);
>   	}
>
> +	fg =3D get_color(vc, info, vc->vc_video_erase_char, 1);
> +	bg =3D get_color(vc, info, vc->vc_video_erase_char, 0);
>   	/* Split blits that cross physical y_wrap boundary */
>
>   	y_break =3D p->vrows - p->yscroll;
>   	if (sy < y_break && sy + height - 1 >=3D y_break) {
>   		u_int b =3D y_break - sy;
> -		ops->clear(vc, info, real_y(p, sy), sx, b, width);
> +		ops->clear(vc, info, real_y(p, sy), sx, b, width, fg, bg);
>   		ops->clear(vc, info, real_y(p, sy + b), sx, height - b,
> -				 width);
> +				 width, fg, bg);
>   	} else
> -		ops->clear(vc, info, real_y(p, sy), sx, height, width);
> +		ops->clear(vc, info, real_y(p, sy), sx, height, width, fg, bg);
>   }
>
>   static void fbcon_clear(struct vc_data *vc, unsigned int sy, unsigned =
int sx,
> diff --git a/drivers/video/fbdev/core/fbcon.h b/drivers/video/fbdev/core=
/fbcon.h
> index df70ea5ec..4d97e6d8a 100644
> --- a/drivers/video/fbdev/core/fbcon.h
> +++ b/drivers/video/fbdev/core/fbcon.h
> @@ -55,7 +55,7 @@ struct fbcon_ops {
>   	void (*bmove)(struct vc_data *vc, struct fb_info *info, int sy,
>   		      int sx, int dy, int dx, int height, int width);
>   	void (*clear)(struct vc_data *vc, struct fb_info *info, int sy,
> -		      int sx, int height, int width);
> +		      int sx, int height, int width, int fb, int bg);
>   	void (*putcs)(struct vc_data *vc, struct fb_info *info,
>   		      const unsigned short *s, int count, int yy, int xx,
>   		      int fg, int bg);
> @@ -116,42 +116,6 @@ static inline int mono_col(const struct fb_info *in=
fo)
>   	return (~(0xfff << max_len)) & 0xff;
>   }
>
> -static inline int attr_col_ec(int shift, struct vc_data *vc,
> -			      struct fb_info *info, int is_fg)
> -{
> -	int is_mono01;
> -	int col;
> -	int fg;
> -	int bg;
> -
> -	if (!vc)
> -		return 0;
> -
> -	if (vc->vc_can_do_color)
> -		return is_fg ? attr_fgcol(shift,vc->vc_video_erase_char)
> -			: attr_bgcol(shift,vc->vc_video_erase_char);
> -
> -	if (!info)
> -		return 0;
> -
> -	col =3D mono_col(info);
> -	is_mono01 =3D info->fix.visual =3D=3D FB_VISUAL_MONO01;
> -
> -	if (attr_reverse(vc->vc_video_erase_char)) {
> -		fg =3D is_mono01 ? col : 0;
> -		bg =3D is_mono01 ? 0 : col;
> -	}
> -	else {
> -		fg =3D is_mono01 ? 0 : col;
> -		bg =3D is_mono01 ? col : 0;
> -	}
> -
> -	return is_fg ? fg : bg;
> -}
> -
> -#define attr_bgcol_ec(bgshift, vc, info) attr_col_ec(bgshift, vc, info,=
 0)
> -#define attr_fgcol_ec(fgshift, vc, info) attr_col_ec(fgshift, vc, info,=
 1)
> -
>       /*
>        *  Scroll Method
>        */
> diff --git a/drivers/video/fbdev/core/fbcon_ccw.c b/drivers/video/fbdev/=
core/fbcon_ccw.c
> index f9b794ff7..89ef4ba7e 100644
> --- a/drivers/video/fbdev/core/fbcon_ccw.c
> +++ b/drivers/video/fbdev/core/fbcon_ccw.c
> @@ -78,14 +78,13 @@ static void ccw_bmove(struct vc_data *vc, struct fb_=
info *info, int sy,
>   }
>
>   static void ccw_clear(struct vc_data *vc, struct fb_info *info, int sy=
,
> -		     int sx, int height, int width)
> +		     int sx, int height, int width, int fg, int bg)
>   {
>   	struct fbcon_ops *ops =3D info->fbcon_par;
>   	struct fb_fillrect region;
> -	int bgshift =3D (vc->vc_hi_font_mask) ? 13 : 12;
>   	u32 vyres =3D GETVYRES(ops->p, info);
>
> -	region.color =3D attr_bgcol_ec(bgshift,vc,info);
> +	region.color =3D bg;
>   	region.dx =3D sy * vc->vc_font.height;
>   	region.dy =3D vyres - ((sx + width) * vc->vc_font.width);
>   	region.height =3D width * vc->vc_font.width;
> diff --git a/drivers/video/fbdev/core/fbcon_cw.c b/drivers/video/fbdev/c=
ore/fbcon_cw.c
> index 903f6fc17..b9dac7940 100644
> --- a/drivers/video/fbdev/core/fbcon_cw.c
> +++ b/drivers/video/fbdev/core/fbcon_cw.c
> @@ -63,14 +63,13 @@ static void cw_bmove(struct vc_data *vc, struct fb_i=
nfo *info, int sy,
>   }
>
>   static void cw_clear(struct vc_data *vc, struct fb_info *info, int sy,
> -		     int sx, int height, int width)
> +		     int sx, int height, int width, int fg, int bg)
>   {
>   	struct fbcon_ops *ops =3D info->fbcon_par;
>   	struct fb_fillrect region;
> -	int bgshift =3D (vc->vc_hi_font_mask) ? 13 : 12;
>   	u32 vxres =3D GETVXRES(ops->p, info);
>
> -	region.color =3D attr_bgcol_ec(bgshift,vc,info);
> +	region.color =3D bg;
>   	region.dx =3D vxres - ((sy + height) * vc->vc_font.height);
>   	region.dy =3D sx *  vc->vc_font.width;
>   	region.height =3D width * vc->vc_font.width;
> diff --git a/drivers/video/fbdev/core/fbcon_ud.c b/drivers/video/fbdev/c=
ore/fbcon_ud.c
> index 594331936..0af7913a2 100644
> --- a/drivers/video/fbdev/core/fbcon_ud.c
> +++ b/drivers/video/fbdev/core/fbcon_ud.c
> @@ -64,15 +64,14 @@ static void ud_bmove(struct vc_data *vc, struct fb_i=
nfo *info, int sy,
>   }
>
>   static void ud_clear(struct vc_data *vc, struct fb_info *info, int sy,
> -		     int sx, int height, int width)
> +		     int sx, int height, int width, int fg, int bg)
>   {
>   	struct fbcon_ops *ops =3D info->fbcon_par;
>   	struct fb_fillrect region;
> -	int bgshift =3D (vc->vc_hi_font_mask) ? 13 : 12;
>   	u32 vyres =3D GETVYRES(ops->p, info);
>   	u32 vxres =3D GETVXRES(ops->p, info);
>
> -	region.color =3D attr_bgcol_ec(bgshift,vc,info);
> +	region.color =3D bg;
>   	region.dy =3D vyres - ((sy + height) * vc->vc_font.height);
>   	region.dx =3D vxres - ((sx + width) *  vc->vc_font.width);
>   	region.width =3D width * vc->vc_font.width;
> diff --git a/drivers/video/fbdev/core/tileblit.c b/drivers/video/fbdev/c=
ore/tileblit.c
> index eff7ec4da..45b0828fa 100644
> --- a/drivers/video/fbdev/core/tileblit.c
> +++ b/drivers/video/fbdev/core/tileblit.c
> @@ -32,16 +32,14 @@ static void tile_bmove(struct vc_data *vc, struct fb=
_info *info, int sy,
>   }
>
>   static void tile_clear(struct vc_data *vc, struct fb_info *info, int s=
y,
> -		       int sx, int height, int width)
> +		       int sx, int height, int width, int fg, int bg)
>   {
>   	struct fb_tilerect rect;
> -	int bgshift =3D (vc->vc_hi_font_mask) ? 13 : 12;
> -	int fgshift =3D (vc->vc_hi_font_mask) ? 9 : 8;
>
>   	rect.index =3D vc->vc_video_erase_char &
>   		((vc->vc_hi_font_mask) ? 0x1ff : 0xff);
> -	rect.fg =3D attr_fgcol_ec(fgshift, vc, info);
> -	rect.bg =3D attr_bgcol_ec(bgshift, vc, info);
> +	rect.fg =3D fg;
> +	rect.bg =3D bg;
>   	rect.sx =3D sx;
>   	rect.sy =3D sy;
>   	rect.width =3D width;

