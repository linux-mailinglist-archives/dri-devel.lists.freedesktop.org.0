Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3C9C5729F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 12:25:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C280410E096;
	Thu, 13 Nov 2025 11:25:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="RJ40f5UZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 412 seconds by postgrey-1.36 at gabe;
 Thu, 13 Nov 2025 11:25:32 UTC
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com
 [95.215.58.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72EA210E096
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 11:25:32 +0000 (UTC)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
 s=key1; t=1763032718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C+r3eA7uqjYviG5Wbo7UxLrUTDN7ePU6jG8MMKZBMMA=;
 b=RJ40f5UZpL+AYew0HKB3Ry38U/jj0BY+uYJilws9y2DZDU9YIyC5HmOU8C8hRQ4YjgUhvf
 0wZ6+z/JUelK8f5JxA6G9Ed+Q+ptcnrvdz9NkqNzJEfDrFwKjsPHgF5ZuaByEYgqFyontT
 SaKpUYpQ9wXtNskzxYj3/+Bjm97+7+RfuxuO5oMCGDI04ns5jPrD4OLUXvsme6H5w4UykS
 1HL62VZP/mV0Ioyt1uDv/yVRsZ2u4i9Q2E4W1f9Wa6LcKf8A8dWf0PC8CxZ8bTqtX1nKco
 kzqeEaRzmGZP/OrF7kvUaHs38mlDYj9OC8c6mhADKRu5h/k5SobOqRT47hBpGw==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Nov 2025 12:18:17 +0100
Message-Id: <DE7IXK6SWV7J.3B9AOCCGWT4EH@cknow-tech.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Dang Huynh" <dang.huynh@mainlining.org>, "Andy Yan" <andyshrk@163.com>
Cc: <heiko@sntech.de>, <hjc@rock-chips.com>, <diederik@cknow-tech.com>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-rockchip@lists.infradead.org>, "Andy
 Yan" <andy.yan@rock-chips.com>
Subject: Re: [PATCH] drm/rockchip: vop2: Use OVL_LAYER_SEL configuration
 instead of use win_mask calculate used layers
References: <20251112085024.2480111-1-andyshrk@163.com>
 <hrg6geclph37olvqr3o5v4d4mifvl25kaemh7f2z3hwega7h2b@muf2gkfqzvvz>
In-Reply-To: <hrg6geclph37olvqr3o5v4d4mifvl25kaemh7f2z3hwega7h2b@muf2gkfqzvvz>
X-Migadu-Flow: FLOW_OUT
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

On Thu Nov 13, 2025 at 9:11 AM CET, Dang Huynh wrote:
> Hi Andy,
>
> This fix works on my device. No more black box around the cursor.
>
> Tested-by: Dang Huynh <dang.huynh@mainlining.org>

Thanks for testing and your Tested-by tag :-D

FYI: Apparently something went wrong with delivery it as it only arrived
at LKML, but not dri-devel, linux-arm-kernel or linux-rockchip MLs.
No idea if that's problematic (for b4 f.e.) though.

'lore' has it here:
https://lore.kernel.org/all/hrg6geclph37olvqr3o5v4d4mifvl25kaemh7f2z3hwega7=
h2b@muf2gkfqzvvz/

Cheers,
 Diederik

> On Wed, Nov 12, 2025 at 04:50:23PM +0800, Andy Yan wrote:
>> From: Andy Yan <andy.yan@rock-chips.com>
>>=20
>> When there are multiple Video Ports, and only one of them is working
>> (for example, VP1 is working while VP0 is not), in this case, the
>> win_mask of VP0 is 0. However, we have already set the port mux for VP0
>> according to vp0->nlayers, and at the same time, in the OVL_LAYER_SEL
>> register, there are windows will also be assigned to layers which will
>> map to the inactive VPs. In this situation, vp0->win_mask is zero as it
>> now working, it is more reliable to calculate the used layers based on
>> the configuration of the OVL_LAYER_SEL register.
>>=20
>> Note: as the configuration of OVL_LAYER_SEL is take effect when the
>> vsync is come, so we use the value backup in vop2->old_layer_sel instead
>> of read OVL_LAYER_SEL directly.
>>=20
>> Fixes: 3e89a8c68354 ("drm/rockchip: vop2: Fix the update of LAYER/PORT s=
elect registers when there are multi display output on rk3588/rk3568")
>> Reported-by: Diederik de Haas <diederik@cknow-tech.com>
>> Closes: https://bugs.kde.org/show_bug.cgi?id=3D511274
>> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
>> ---
>>=20
>>  drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 49 +++++++++++++++++---
>>  1 file changed, 42 insertions(+), 7 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/=
drm/rockchip/rockchip_vop2_reg.c
>> index d22ce11a4235..f3950e8476a7 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
>> @@ -1369,6 +1369,25 @@ static const struct vop2_regs_dump rk3588_regs_du=
mp[] =3D {
>>  	},
>>  };
>> =20
>> +/*
>> + * phys_id is used to identify a main window(Cluster Win/Smart Win, not
>> + * include the sub win of a cluster or the multi area) that can do over=
lay
>> + * in main overlay stage.
>> + */
>> +static struct vop2_win *vop2_find_win_by_phys_id(struct vop2 *vop2, uin=
t8_t phys_id)
>> +{
>> +	struct vop2_win *win;
>> +	int i;
>> +
>> +	for (i =3D 0; i < vop2->data->win_size; i++) {
>> +		win =3D &vop2->win[i];
>> +		if (win->data->phys_id =3D=3D phys_id)
>> +			return win;
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>>  static unsigned long rk3568_set_intf_mux(struct vop2_video_port *vp, in=
t id, u32 polflags)
>>  {
>>  	struct vop2 *vop2 =3D vp->vop2;
>> @@ -1842,15 +1861,31 @@ static void vop2_parse_alpha(struct vop2_alpha_c=
onfig *alpha_config,
>>  	alpha->dst_alpha_ctrl.bits.factor_mode =3D ALPHA_SRC_INVERSE;
>>  }
>> =20
>> -static int vop2_find_start_mixer_id_for_vp(struct vop2 *vop2, u8 port_i=
d)
>> +static int vop2_find_start_mixer_id_for_vp(struct vop2_video_port *vp)
>>  {
>> -	struct vop2_video_port *vp;
>> -	int used_layer =3D 0;
>> +	struct vop2 *vop2 =3D vp->vop2;
>> +	struct vop2_win *win;
>> +	u32 layer_sel =3D vop2->old_layer_sel;
>> +	u32 used_layer =3D 0;
>> +	unsigned long win_mask =3D vp->win_mask;
>> +	unsigned long phys_id;
>> +	bool match;
>>  	int i;
>> =20
>> -	for (i =3D 0; i < port_id; i++) {
>> -		vp =3D &vop2->vps[i];
>> -		used_layer +=3D hweight32(vp->win_mask);
>> +	for (i =3D 0; i < 31; i +=3D 4) {
>> +		match =3D false;
>> +		for_each_set_bit(phys_id, &win_mask, ROCKCHIP_VOP2_ESMART3) {
>> +			win =3D vop2_find_win_by_phys_id(vop2, phys_id);
>> +			if (win->data->layer_sel_id[vp->id] =3D=3D ((layer_sel >> i) & 0xf))=
 {
>> +				match =3D true;
>> +				break;
>> +			}
>> +		}
>> +
>> +		if (!match)
>> +			used_layer +=3D 1;
>> +		else
>> +			break;
>>  	}
>> =20
>>  	return used_layer;
>> @@ -1935,7 +1970,7 @@ static void vop2_setup_alpha(struct vop2_video_por=
t *vp)
>>  	u32 dst_global_alpha =3D DRM_BLEND_ALPHA_OPAQUE;
>> =20
>>  	if (vop2->version <=3D VOP_VERSION_RK3588)
>> -		mixer_id =3D vop2_find_start_mixer_id_for_vp(vop2, vp->id);
>> +		mixer_id =3D vop2_find_start_mixer_id_for_vp(vp);
>>  	else
>>  		mixer_id =3D 0;
>> =20
>> --=20
>> 2.43.0
>>=20
>> base-commit: ded94ec6167e84195507237100f6278941e36fdd
>> branch: drm-misc-next-2025-1016
>>=20
>>=20
>> _______________________________________________
>> Linux-rockchip mailing list
>> Linux-rockchip@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-rockchip

