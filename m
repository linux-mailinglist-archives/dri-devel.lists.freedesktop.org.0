Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0981FA99C
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 09:09:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7B8F6E7EC;
	Tue, 16 Jun 2020 07:09:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC0896E50C
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 20:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1592253078;
 bh=pkbuJEMyxK0hT38PdmlLkMNuQuNuLkOuhmyZRWTYLyc=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=W91GZSvf8RZlamkDbb5BQvkEF6CFQYAb1RWVuj2ONy9oAa0IMiaZb3WDCjSXHYKq/
 z54cr47u2Z4FFvAKIuEopgQsZrchTnH8nj4fXUWhFJI+s7GDZIZ5MTFwNyINMclewv
 2YbALC2M641mNjK4ivFc/JvsCQNIP1bUbNEH7jps=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.132.153]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mf0BM-1jHcHk0LPu-00gW0m; Mon, 15
 Jun 2020 22:31:18 +0200
Subject: Re: [PATCH 26/38] vt: use newly defined CUR_* macros
To: Jiri Slaby <jslaby@suse.cz>, gregkh@linuxfoundation.org
References: <20200615074910.19267-1-jslaby@suse.cz>
 <20200615074910.19267-26-jslaby@suse.cz>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
Message-ID: <51bd492b-52aa-0875-cdaa-bd40b1e2e89c@gmx.de>
Date: Mon, 15 Jun 2020 22:31:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200615074910.19267-26-jslaby@suse.cz>
Content-Language: en-US
X-Provags-ID: V03:K1:5OK7wuzshnZaZzPVGxsx0o95XxvIF60NvJtmXV/lLvRgalZWKhZ
 tX3xsd2fqrsH58E0/M3rjwZ3V0MfM9Uuc+djcLCBz/jHgdgSb0JyjwwO01TXW31KCB0DluR
 PQvhQGo0xA1l1/c8UJogikw91mwvgwnQZjKpHBdZNfn+jFrYu7cD3nMJRK5d9r9NITLt7nk
 tGOtbu4vhLEPUwhU64rnw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LOPNjWFBcVA=:KRxsnpQpS5u1aXBDunUfYZ
 6aD/6qC5xdQ2y92DGbAMcNMKgVSsHvaWhVPykKd3IozNi8WI8oF8bkgctxsIE66pSlXl9h9Us
 dxREV8jIKyTeiHYRPc2AHilmRjVPVxAs1XQluoNYk+GKNpUsKb42/YsIKrYkTT2/mCpgbEk8+
 eel2nXUpOcYhZC8zXS4+Mj6E5Zagw6gwmPEjVnRtCgmxPNn7R7WPermSkLocSt2g97IK0o7QW
 iIJgHnKBKujH3353FpVR9xfbLsNP2poRyrNpAbUf5dnx6+fDioitN0/H+0kGEWYWQbTLvCmNB
 W+0nvwcqCjKMaB7jT1itSXr+Iy86q7IxBcXdJNdPmIPLr+PNFXnnunZMS+4L29AMqBLZ9HZDM
 VCPMQHbaiA57ZYI6mI1Nl0NqnUx9ZdD+lOvWrbKC3cuRxb1o8rXqCjyrgyRZ05XQolDLmF+yo
 YuyiCQF7eEv4dVVACMnb9m+G4/FMAw9jRpUT8Pkwk/p8R/fbPn0zQMm8eeyLIpJOz2AbnA59s
 f0+QUvOKEBdwmB7/kcKypuIKSd80OLL5hEWjouyIDnjpDMFpnX56QtjNqdE9luSYSus8x3NdN
 8zmxHKqRSqacVkMJJRQMI/h4Vzti3fZzrsq4C/qfk9GeyEAIbVeRyWQJcZq/HwD7HbjUF8Uex
 lQ5YeYUyEIe28gAOzRUZMTThWllCBtfnWcWY123Fab6ZskaKpBp/Y15EUxoQS9SnW/Cs1ME3B
 +H3/Otox+UCysKKLXzD90KvHo3WmWMSHaSs8ODztfIhmlYEq+O1q7cWc1oe+1xc6fQjmnj7JA
 fyVTRDoUIbE0802jCpoCkIoyUzWEkISKUQyfvZCZ9K+LP75vxzos1TXokp31BgVyNfCtw7l0Y
 8o9QoWkDjxeS5LFnq6SmLSR4nfGCxgc1N4jJCpFA6Kk4EnupKbGVG8zD5mw8rDasVt447K6Y0
 BrxD3w0G5x//5Mr0g3bbK3fo6x3IUmcZK2Of8smA5PKjtXVB1M4DyNVTTbENJTe7LxfXukmAh
 IDVlRx3rn0+vCCMyrJOKoCfgIkc1GrVCu95LRAgOcrLgdv3jXPNpfW4pCD+whDXNJgaseeMAE
 COlXK01YrnsLE6Vq9smcVyVTwUspcsXOP0KuKE4essYjfsxjrbgtI9o2k3b1rbO5zwFjWU6oC
 +ar8UaP0P6C1WKRS+E74bywfCfeD4L039PLJqPKYIPct+mmP9YGsddGbfaKfynuxLDJM4yz1U
 pYDg0aaEeo0T+UOHt
X-Mailman-Approved-At: Tue, 16 Jun 2020 07:09:12 +0000
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
Cc: linux-fbdev@vger.kernel.org, Thomas Winischhofer <thomas@winischhofer.net>,
 linux-parisc@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 linux-serial@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15.06.20 09:48, Jiri Slaby wrote:
> We defined macros for all the magic constants in the previous patch. So
> let us use the macro in the code now.
>
> No functional change intended.
>
> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
> Cc: Thomas Winischhofer <thomas@winischhofer.net>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: linux-usb@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org
> Cc: linux-parisc@vger.kernel.org


Acked-by: Helge Deller <deller@gmx.de>

Thanks!
Helge

> ---
>  drivers/tty/vt/vt.c                     | 22 +++++++++++++---------
>  drivers/usb/misc/sisusbvga/sisusb_con.c |  2 +-
>  drivers/video/console/mdacon.c          |  2 +-
>  drivers/video/console/sticon.c          |  2 +-
>  drivers/video/console/vgacon.c          |  2 +-
>  drivers/video/fbdev/core/bitblit.c      |  2 +-
>  drivers/video/fbdev/core/fbcon.c        |  2 +-
>  drivers/video/fbdev/core/fbcon_ccw.c    |  2 +-
>  drivers/video/fbdev/core/fbcon_cw.c     |  2 +-
>  drivers/video/fbdev/core/fbcon_ud.c     |  2 +-
>  drivers/video/fbdev/core/tileblit.c     |  2 +-
>  11 files changed, 23 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
> index af1ef717f416..2b9fc628f05b 100644
> --- a/drivers/tty/vt/vt.c
> +++ b/drivers/tty/vt/vt.c
> @@ -866,17 +866,18 @@ static void add_softcursor(struct vc_data *vc)
>  	int i = scr_readw((u16 *) vc->vc_pos);
>  	u32 type = vc->vc_cursor_type;
>
> -	if (!(type & 0x10))
> +	if (!(type & CUR_SW))
>  		return;
>  	if (softcursor_original != -1)
>  		return;
>  	softcursor_original = i;
> -	i |= (type >> 8) & 0xff00;
> -	i ^= type & 0xff00;
> -	if ((type & 0x20) && (softcursor_original & 0x7000) == (i & 0x7000))
> -		i ^= 0x7000;
> -	if ((type & 0x40) && (i & 0x700) == ((i & 0x7000) >> 4))
> -		i ^= 0x0700;
> +	i |= CUR_SET(type);
> +	i ^= CUR_CHANGE(type);
> +	if ((type & CUR_ALWAYS_BG) &&
> +			(softcursor_original & CUR_BG) == (i & CUR_BG))
> +		i ^= CUR_BG;
> +	if ((type & CUR_INVERT_FG_BG) && (i & CUR_FG) == ((i & CUR_BG) >> 4))
> +		i ^= CUR_FG;
>  	scr_writew(i, (u16 *)vc->vc_pos);
>  	if (con_should_update(vc))
>  		vc->vc_sw->con_putc(vc, i, vc->state.y, vc->state.x);
> @@ -910,7 +911,7 @@ static void set_cursor(struct vc_data *vc)
>  		if (vc_is_sel(vc))
>  			clear_selection();
>  		add_softcursor(vc);
> -		if ((vc->vc_cursor_type & 0x0f) != 1)
> +		if (CUR_SIZE(vc->vc_cursor_type) != CUR_NONE)
>  			vc->vc_sw->con_cursor(vc, CM_DRAW);
>  	} else
>  		hide_cursor(vc);
> @@ -2322,7 +2323,10 @@ static void do_con_trol(struct tty_struct *tty, struct vc_data *vc, int c)
>  		case 'c':
>  			if (vc->vc_priv == EPdec) {
>  				if (vc->vc_par[0])
> -					vc->vc_cursor_type = vc->vc_par[0] | (vc->vc_par[1] << 8) | (vc->vc_par[2] << 16);
> +					vc->vc_cursor_type =
> +						CUR_MAKE(vc->vc_par[0],
> +							 vc->vc_par[1],
> +							 vc->vc_par[2]);
>  				else
>  					vc->vc_cursor_type = cur_default;
>  				return;
> diff --git a/drivers/usb/misc/sisusbvga/sisusb_con.c b/drivers/usb/misc/sisusbvga/sisusb_con.c
> index 80657c49310a..1058eaba3084 100644
> --- a/drivers/usb/misc/sisusbvga/sisusb_con.c
> +++ b/drivers/usb/misc/sisusbvga/sisusb_con.c
> @@ -727,7 +727,7 @@ sisusbcon_cursor(struct vc_data *c, int mode)
>
>  	baseline = c->vc_font.height - (c->vc_font.height < 10 ? 1 : 2);
>
> -	switch (c->vc_cursor_type & 0x0f) {
> +	switch (CUR_SIZE(c->vc_cursor_type)) {
>  		case CUR_BLOCK:		from = 1;
>  					to   = c->vc_font.height;
>  					break;
> diff --git a/drivers/video/console/mdacon.c b/drivers/video/console/mdacon.c
> index 00cb6245fbef..ef29b321967f 100644
> --- a/drivers/video/console/mdacon.c
> +++ b/drivers/video/console/mdacon.c
> @@ -492,7 +492,7 @@ static void mdacon_cursor(struct vc_data *c, int mode)
>
>  	mda_set_cursor(c->state.y * mda_num_columns * 2 + c->state.x * 2);
>
> -	switch (c->vc_cursor_type & 0x0f) {
> +	switch (CUR_SIZE(c->vc_cursor_type)) {
>
>  		case CUR_LOWER_THIRD:	mda_set_cursor_size(10, 13); break;
>  		case CUR_LOWER_HALF:	mda_set_cursor_size(7,  13); break;
> diff --git a/drivers/video/console/sticon.c b/drivers/video/console/sticon.c
> index bbcdfd312c36..21a5c280c8c9 100644
> --- a/drivers/video/console/sticon.c
> +++ b/drivers/video/console/sticon.c
> @@ -139,7 +139,7 @@ static void sticon_cursor(struct vc_data *conp, int mode)
>  	break;
>      case CM_MOVE:
>      case CM_DRAW:
> -	switch (conp->vc_cursor_type & 0x0f) {
> +	switch (CUR_SIZE(conp->vc_cursor_type)) {
>  	case CUR_UNDERLINE:
>  	case CUR_LOWER_THIRD:
>  	case CUR_LOWER_HALF:
> diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgacon.c
> index c1c4ce28ac5e..f0f3d573f848 100644
> --- a/drivers/video/console/vgacon.c
> +++ b/drivers/video/console/vgacon.c
> @@ -728,7 +728,7 @@ static void vgacon_cursor(struct vc_data *c, int mode)
>  	case CM_MOVE:
>  	case CM_DRAW:
>  		write_vga(14, (c->vc_pos - vga_vram_base) / 2);
> -		switch (c->vc_cursor_type & 0x0f) {
> +		switch (CUR_SIZE(c->vc_cursor_type)) {
>  		case CUR_UNDERLINE:
>  			vgacon_set_cursor_size(c->state.x,
>  					       c->vc_font.height -
> diff --git a/drivers/video/fbdev/core/bitblit.c b/drivers/video/fbdev/core/bitblit.c
> index 3b002b365a5a..dde8004d8610 100644
> --- a/drivers/video/fbdev/core/bitblit.c
> +++ b/drivers/video/fbdev/core/bitblit.c
> @@ -241,7 +241,7 @@ static void bit_cursor(struct vc_data *vc, struct fb_info *info, int mode,
>  	unsigned short charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
>  	int w = DIV_ROUND_UP(vc->vc_font.width, 8), c;
>  	int y = real_y(ops->p, vc->state.y);
> -	int attribute, use_sw = (vc->vc_cursor_type & 0x10);
> +	int attribute, use_sw = vc->vc_cursor_type & CUR_SW;
>  	int err = 1;
>  	char *src;
>
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index 38d2a00b0ccf..86fe41b1deb8 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -1393,7 +1393,7 @@ static void fbcon_cursor(struct vc_data *vc, int mode)
>  	if (fbcon_is_inactive(vc, info) || vc->vc_deccm != 1)
>  		return;
>
> -	if (vc->vc_cursor_type & 0x10)
> +	if (vc->vc_cursor_type & CUR_SW)
>  		fbcon_del_cursor_timer(info);
>  	else
>  		fbcon_add_cursor_timer(info);
> diff --git a/drivers/video/fbdev/core/fbcon_ccw.c b/drivers/video/fbdev/core/fbcon_ccw.c
> index 5b67bcebe34c..b5dd8317086d 100644
> --- a/drivers/video/fbdev/core/fbcon_ccw.c
> +++ b/drivers/video/fbdev/core/fbcon_ccw.c
> @@ -226,7 +226,7 @@ static void ccw_cursor(struct vc_data *vc, struct fb_info *info, int mode,
>  	unsigned short charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
>  	int w = (vc->vc_font.height + 7) >> 3, c;
>  	int y = real_y(ops->p, vc->state.y);
> -	int attribute, use_sw = (vc->vc_cursor_type & 0x10);
> +	int attribute, use_sw = vc->vc_cursor_type & CUR_SW;
>  	int err = 1, dx, dy;
>  	char *src;
>  	u32 vyres = GETVYRES(ops->p->scrollmode, info);
> diff --git a/drivers/video/fbdev/core/fbcon_cw.c b/drivers/video/fbdev/core/fbcon_cw.c
> index f1aab3ae3bc9..dbb5dbf3dd01 100644
> --- a/drivers/video/fbdev/core/fbcon_cw.c
> +++ b/drivers/video/fbdev/core/fbcon_cw.c
> @@ -209,7 +209,7 @@ static void cw_cursor(struct vc_data *vc, struct fb_info *info, int mode,
>  	unsigned short charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
>  	int w = (vc->vc_font.height + 7) >> 3, c;
>  	int y = real_y(ops->p, vc->state.y);
> -	int attribute, use_sw = (vc->vc_cursor_type & 0x10);
> +	int attribute, use_sw = vc->vc_cursor_type & CUR_SW;
>  	int err = 1, dx, dy;
>  	char *src;
>  	u32 vxres = GETVXRES(ops->p->scrollmode, info);
> diff --git a/drivers/video/fbdev/core/fbcon_ud.c b/drivers/video/fbdev/core/fbcon_ud.c
> index 81ed6f6bed67..b2c9cdbcc9e4 100644
> --- a/drivers/video/fbdev/core/fbcon_ud.c
> +++ b/drivers/video/fbdev/core/fbcon_ud.c
> @@ -256,7 +256,7 @@ static void ud_cursor(struct vc_data *vc, struct fb_info *info, int mode,
>  	unsigned short charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
>  	int w = (vc->vc_font.width + 7) >> 3, c;
>  	int y = real_y(ops->p, vc->state.y);
> -	int attribute, use_sw = (vc->vc_cursor_type & 0x10);
> +	int attribute, use_sw = vc->vc_cursor_type & CUR_SW;
>  	int err = 1, dx, dy;
>  	char *src;
>  	u32 vyres = GETVYRES(ops->p->scrollmode, info);
> diff --git a/drivers/video/fbdev/core/tileblit.c b/drivers/video/fbdev/core/tileblit.c
> index ac51425687e4..1dfaff0881fb 100644
> --- a/drivers/video/fbdev/core/tileblit.c
> +++ b/drivers/video/fbdev/core/tileblit.c
> @@ -83,7 +83,7 @@ static void tile_cursor(struct vc_data *vc, struct fb_info *info, int mode,
>  			int softback_lines, int fg, int bg)
>  {
>  	struct fb_tilecursor cursor;
> -	int use_sw = (vc->vc_cursor_type & 0x10);
> +	int use_sw = vc->vc_cursor_type & CUR_SW;
>
>  	cursor.sx = vc->state.x;
>  	cursor.sy = vc->state.y;
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
