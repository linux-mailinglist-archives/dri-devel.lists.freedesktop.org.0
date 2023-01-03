Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD41A65BFFE
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 13:39:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E428A10E259;
	Tue,  3 Jan 2023 12:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A009610E259;
 Tue,  3 Jan 2023 12:39:01 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id m3so13656820wmq.0;
 Tue, 03 Jan 2023 04:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TqFoaWiA4MgdyFrgK49/jFKMyDheMheehYDZRY4TeIs=;
 b=PpweDless7o07+umGSyS7T0VFtSAUQOdEEoYt7m3Oeb/MZsJWJiWNnJpomzt5GeipV
 eKD0/slueIsFbf1QilfsbSfJrcJ+ai1ehyxS4ju7jz/wv/ztJLJIQnnMaGG7f0/DQaf9
 QdT2yEYxCoBH+sdGgVdew4OfiS6imOE1cGuJTivKAcpnleO0wLExZP2hZGDCADjorWlV
 lH5M1s/PO2F+05qlJfMZupdQjJ2fr/POJ2/c2amot6DJGkXQ9B/oRTMLBFN7zBOE+UlL
 Vnn5AEMKX9+MFgzcDevyBRMZFIkY+z7PMHlTsjrUJcK5Hr4Io+/VDLGJ99fmeWv/lt2F
 0xtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TqFoaWiA4MgdyFrgK49/jFKMyDheMheehYDZRY4TeIs=;
 b=c3TpOEviJgTY/N6/HDq6cV18ESUtgfmWLsks2G4NRgUEO0QHDZztF9xD+x5Wd4xflQ
 gBgU/IxS2wCGXRybMiYj0wDRyomJg/l+aF7nMG332dqvQ5MdthlkSOeoHg6S0rOC1TLq
 msJouCkp6GglE6BJwM9K5fvW1Y/YMd/XtkSdoCAbEsSx6YRTfV708VpAZORZjzGQdgaW
 hfzqxW8qfTaGCrvS7lxRPws5RP1c4rzJv1xINa+GZy3L9t0wZq1Mid+rPvprP0J2cXY+
 7TNaQf6Uf6IIvxRPdMXauqDU1LzKbJguUKO1d8Qt0U3SLXGZ7IybPtlt1CtvH2oFP6BH
 R4yA==
X-Gm-Message-State: AFqh2kqlwOUj94LnbtAMoxCMSQm9nJpI5KC+GlS0ZzJ7e8iEuhSgzFC+
 AGjNQo4ihXJLzlMxCBXZWA4CMp0iE3v6h3Ik8Uo=
X-Google-Smtp-Source: AMrXdXsthaO0LF9xH1/xM9gViQG8+IYe/f7FggJYIUYbzr+ps+Gpn+PkP+pKE0V5uoDpRSySV3+hcB98GUL/s3GkeW8=
X-Received: by 2002:a1c:a442:0:b0:3d0:2c5c:e483 with SMTP id
 n63-20020a1ca442000000b003d02c5ce483mr2106113wme.141.1672749539959; Tue, 03
 Jan 2023 04:38:59 -0800 (PST)
MIME-Version: 1.0
References: <20221119021352.1774592-1-sashal@kernel.org>
 <20221119021352.1774592-24-sashal@kernel.org>
In-Reply-To: <20221119021352.1774592-24-sashal@kernel.org>
From: Yury Zhuravlev <stalkerg@gmail.com>
Date: Tue, 3 Jan 2023 21:38:48 +0900
Message-ID: <CANiD2e9w=--0E1mbd_zZV6Gs0yUOVOMXBezkxJ=ZQte5NNSqHQ@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 5.15 24/27] Revert "drm/amdgpu: Revert
 "drm/amdgpu: getting fan speed pwm for vega10 properly""
To: Sasha Levin <sashal@kernel.org>
Content-Type: multipart/alternative; boundary="00000000000020a7e605f15b5a5b"
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
Cc: Guchun Chen <guchun.chen@amd.com>, dri-devel@lists.freedesktop.org,
 Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Asher Song <Asher.Song@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, evan.quan@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000020a7e605f15b5a5b
Content-Type: text/plain; charset="UTF-8"

Hello!

Why is this revert for revert coming for 6.1 but reverted again for 6.1.2?
My GPU is not working correctly again!
https://cdn.kernel.org/pub/linux/kernel/v6.x/ChangeLog-6.1.2

It seems like somebody made a mistake and pick up the wrong patch for the
stable channel.

Regards!

On Sat, Nov 19, 2022 at 11:14 AM Sasha Levin <sashal@kernel.org> wrote:

> From: Asher Song <Asher.Song@amd.com>
>
> [ Upstream commit 30b8e7b8ee3be003e0df85c857c5cd0e0bd58b82 ]
>
> This reverts commit 4545ae2ed3f2f7c3f615a53399c9c8460ee5bca7.
>
> The origin patch "drm/amdgpu: getting fan speed pwm for vega10 properly"
> works fine.
> Test failure is caused by test case self.
>
> Signed-off-by: Asher Song <Asher.Song@amd.com>
> Reviewed-by: Guchun Chen <guchun.chen@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  .../amd/pm/powerplay/hwmgr/vega10_thermal.c   | 25 +++++++++----------
>  1 file changed, 12 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_thermal.c
> b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_thermal.c
> index dad3e3741a4e..190af79f3236 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_thermal.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_thermal.c
> @@ -67,22 +67,21 @@ int vega10_fan_ctrl_get_fan_speed_info(struct pp_hwmgr
> *hwmgr,
>  int vega10_fan_ctrl_get_fan_speed_pwm(struct pp_hwmgr *hwmgr,
>                 uint32_t *speed)
>  {
> -       uint32_t current_rpm;
> -       uint32_t percent = 0;
> -
> -       if (hwmgr->thermal_controller.fanInfo.bNoFan)
> -               return 0;
> +       struct amdgpu_device *adev = hwmgr->adev;
> +       uint32_t duty100, duty;
> +       uint64_t tmp64;
>
> -       if (vega10_get_current_rpm(hwmgr, &current_rpm))
> -               return -1;
> +       duty100 = REG_GET_FIELD(RREG32_SOC15(THM, 0, mmCG_FDO_CTRL1),
> +                               CG_FDO_CTRL1, FMAX_DUTY100);
> +       duty = REG_GET_FIELD(RREG32_SOC15(THM, 0, mmCG_THERMAL_STATUS),
> +                               CG_THERMAL_STATUS, FDO_PWM_DUTY);
>
> -       if (hwmgr->thermal_controller.
> -                       advanceFanControlParameters.usMaxFanRPM != 0)
> -               percent = current_rpm * 255 /
> -                       hwmgr->thermal_controller.
> -                       advanceFanControlParameters.usMaxFanRPM;
> +       if (!duty100)
> +               return -EINVAL;
>
> -       *speed = MIN(percent, 255);
> +       tmp64 = (uint64_t)duty * 255;
> +       do_div(tmp64, duty100);
> +       *speed = MIN((uint32_t)tmp64, 255);
>
>         return 0;
>  }
> --
> 2.35.1
>
>

--00000000000020a7e605f15b5a5b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello!</div><div><br></div><div>Why is this revert fo=
r revert coming for 6.1 but reverted again for 6.1.2? My GPU is not working=
 correctly again!</div><div><a href=3D"https://cdn.kernel.org/pub/linux/ker=
nel/v6.x/ChangeLog-6.1.2">https://cdn.kernel.org/pub/linux/kernel/v6.x/Chan=
geLog-6.1.2</a></div><div><br></div><div>It seems like somebody made a mist=
ake and pick up the wrong patch for the stable channel. <br></div><div><br>=
</div><div>Regards!<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sat, Nov 19, 2022 at 11:14 AM Sasha Levin =
&lt;<a href=3D"mailto:sashal@kernel.org">sashal@kernel.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Asher Song =
&lt;<a href=3D"mailto:Asher.Song@amd.com" target=3D"_blank">Asher.Song@amd.=
com</a>&gt;<br>
<br>
[ Upstream commit 30b8e7b8ee3be003e0df85c857c5cd0e0bd58b82 ]<br>
<br>
This reverts commit 4545ae2ed3f2f7c3f615a53399c9c8460ee5bca7.<br>
<br>
The origin patch &quot;drm/amdgpu: getting fan speed pwm for vega10 properl=
y&quot; works fine.<br>
Test failure is caused by test case self.<br>
<br>
Signed-off-by: Asher Song &lt;<a href=3D"mailto:Asher.Song@amd.com" target=
=3D"_blank">Asher.Song@amd.com</a>&gt;<br>
Reviewed-by: Guchun Chen &lt;<a href=3D"mailto:guchun.chen@amd.com" target=
=3D"_blank">guchun.chen@amd.com</a>&gt;<br>
Signed-off-by: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher@amd.com=
" target=3D"_blank">alexander.deucher@amd.com</a>&gt;<br>
Signed-off-by: Sasha Levin &lt;<a href=3D"mailto:sashal@kernel.org" target=
=3D"_blank">sashal@kernel.org</a>&gt;<br>
---<br>
=C2=A0.../amd/pm/powerplay/hwmgr/vega10_thermal.c=C2=A0 =C2=A0| 25 ++++++++=
+----------<br>
=C2=A01 file changed, 12 insertions(+), 13 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_thermal.c b/driv=
ers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_thermal.c<br>
index dad3e3741a4e..190af79f3236 100644<br>
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_thermal.c<br>
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_thermal.c<br>
@@ -67,22 +67,21 @@ int vega10_fan_ctrl_get_fan_speed_info(struct pp_hwmgr =
*hwmgr,<br>
=C2=A0int vega10_fan_ctrl_get_fan_speed_pwm(struct pp_hwmgr *hwmgr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t *speed)<br=
>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t current_rpm;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t percent =3D 0;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (hwmgr-&gt;thermal_controller.fanInfo.bNoFan=
)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct amdgpu_device *adev =3D hwmgr-&gt;adev;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t duty100, duty;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t tmp64;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (vega10_get_current_rpm(hwmgr, &amp;current_=
rpm))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0duty100 =3D REG_GET_FIELD(RREG32_SOC15(THM, 0, =
mmCG_FDO_CTRL1),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CG_FDO_CTRL1, FMAX_DUTY100);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0duty =3D REG_GET_FIELD(RREG32_SOC15(THM, 0, mmC=
G_THERMAL_STATUS),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CG_THERMAL_STATUS, FDO_PWM_DUTY);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (hwmgr-&gt;thermal_controller.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0advanceFanControlParameters.usMaxFanRPM !=3D 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0percent =3D current=
_rpm * 255 /<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0hwmgr-&gt;thermal_controller.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0advanceFanControlParameters.usMaxFanRPM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!duty100)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0*speed =3D MIN(percent, 255);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tmp64 =3D (uint64_t)duty * 255;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0do_div(tmp64, duty100);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*speed =3D MIN((uint32_t)tmp64, 255);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0}<br>
-- <br>
2.35.1<br>
<br>
</blockquote></div>

--00000000000020a7e605f15b5a5b--
