Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 921C656A07E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 12:54:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47EE510F48D;
	Thu,  7 Jul 2022 10:54:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 834C11124E2
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 10:54:33 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id x10so15284427edd.13
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jul 2022 03:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jt/YJPcMl7kxipaSK/ENofEQ4n+eCiFvyD83OZDQddk=;
 b=XgoFDS8EgG2kR9j+kAVUOT3aQopZ+0Py77KJdQCRPscuGALjEM4rSisnqT7/lHqhth
 lq1j3poru74F+R+1WrqT4LSQpZGU/srZAECPL0e80SqS8tTdGoq+btiIZAS9O9odD7B1
 l09omVa1pwqtYkbugLuphNHBJKGwo5/jmnfXc5vuMAnt1NPU0JWM/lhZbTP+EPAi4aBJ
 suFg+rjt9s83cUs/zyPuE2oNOMfCpCoHQ/ZoDaSYRY0/iB2S+YbAjV4lV5iehPIn+VaE
 KfYT/i3jdHrUD18/1QYeoOpPfy38VHHE0JTfUBVavebh0Kmh64okvHHmRNWgwoAJh6NI
 Q9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jt/YJPcMl7kxipaSK/ENofEQ4n+eCiFvyD83OZDQddk=;
 b=sxI6iTIuZYUIJS5Uc2MC4XPLEa+QWSInBX5UrMcF/XdJFYivXBzGuPMIpdc4HhBlMx
 CCxRL8nGI4bN+WsgVd8cbZqYeeS2JFSVWQH5uALo8RhnZi2NxRiobvbKGDpUR90l93QG
 UfchCG80Z0LiFTXZ3tuVYOhJm0MdqT3ZnPlXC3l3DJyWKQn2/1tfUreQF6PiF57XjXxN
 gIGnbblWEXcV4jvg2m5i8BglZa5AO0SJGTR7TtXuyoQLx5beNPCMkCH27uWsJ1kSykev
 xdbvOSUzKzz8xpufsuqrFB+HFbnqaRueGXkcsQG4Unyy2C6UaEw2AehIKqwG2M9GHu/n
 bt1A==
X-Gm-Message-State: AJIora962uvWAnnHLzpPUzQQ215wvC1OLrVkKKDKcEtHyYblyP7D6VXo
 jD/svw+B+nCBiEyluzzWfzADmvbN0moPHzc73N+XGw==
X-Google-Smtp-Source: AGRyM1vsL2Y7csy7pdY8snndrtFwLqhoxFfL3iWVV4/oAkz2yKJ0Y82hp41ITWNFlB4hTb+GuwqMPAXmhVvwce5lr00=
X-Received: by 2002:a05:6402:5245:b0:43a:a024:82cc with SMTP id
 t5-20020a056402524500b0043aa02482ccmr782183edd.56.1657191271582; Thu, 07 Jul
 2022 03:54:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220612144854.2223873-1-alvin@pqrs.dk>
 <20220612144854.2223873-3-alvin@pqrs.dk>
In-Reply-To: <20220612144854.2223873-3-alvin@pqrs.dk>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 7 Jul 2022 12:54:20 +0200
Message-ID: <CAG3jFytUrGy_C5-r5BYZqWpj+2kje=TeBQ9EkN8E=db6Cj5paA@mail.gmail.com>
Subject: Re: [PATCH RESEND 2/2] drm: bridge: adv7511: unregister cec i2c
 device after cec adapter
To: alvin@pqrs.dk
Content-Type: text/plain; charset="UTF-8"
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
Cc: Archit Taneja <architt@codeaurora.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Hans Verkuil <hans.verkuil@cisco.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 12 Jun 2022 at 16:49, Alvin =C5=A0ipraga <alvin@pqrs.dk> wrote:
>
> From: Alvin =C5=A0ipraga <alsi@bang-olufsen.dk>
>
> cec_unregister_adapter() assumes that the underlying adapter ops are
> callable. For example, if the CEC adapter currently has a valid physical
> address, then the unregistration procedure will invalidate the physical
> address by setting it to f.f.f.f. Whence the following kernel oops
> observed after removing the adv7511 module:
>
>     Unable to handle kernel execution of user memory at virtual address 0=
000000000000000
>     Internal error: Oops: 86000004 [#1] PREEMPT_RT SMP
>     Call trace:
>      0x0
>      adv7511_cec_adap_log_addr+0x1ac/0x1c8 [adv7511]
>      cec_adap_unconfigure+0x44/0x90 [cec]
>      __cec_s_phys_addr.part.0+0x68/0x230 [cec]
>      __cec_s_phys_addr+0x40/0x50 [cec]
>      cec_unregister_adapter+0xb4/0x118 [cec]
>      adv7511_remove+0x60/0x90 [adv7511]
>      i2c_device_remove+0x34/0xe0
>      device_release_driver_internal+0x114/0x1f0
>      driver_detach+0x54/0xe0
>      bus_remove_driver+0x60/0xd8
>      driver_unregister+0x34/0x60
>      i2c_del_driver+0x2c/0x68
>      adv7511_exit+0x1c/0x67c [adv7511]
>      __arm64_sys_delete_module+0x154/0x288
>      invoke_syscall+0x48/0x100
>      el0_svc_common.constprop.0+0x48/0xe8
>      do_el0_svc+0x28/0x88
>      el0_svc+0x1c/0x50
>      el0t_64_sync_handler+0xa8/0xb0
>      el0t_64_sync+0x15c/0x160
>     Code: bad PC value
>     ---[ end trace 0000000000000000 ]---
>
> Protect against this scenario by unregistering i2c_cec after
> unregistering the CEC adapter. Duly disable the CEC clock afterwards
> too.
>
> Fixes: 3b1b975003e4 ("drm: adv7511/33: add HDMI CEC support")
> Signed-off-by: Alvin =C5=A0ipraga <alsi@bang-olufsen.dk>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/d=
rm/bridge/adv7511/adv7511_drv.c
> index 5bb9300040dd..023c0ad132e0 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1339,9 +1339,6 @@ static int adv7511_remove(struct i2c_client *i2c)
>  {
>         struct adv7511 *adv7511 =3D i2c_get_clientdata(i2c);
>
> -       i2c_unregister_device(adv7511->i2c_cec);
> -       clk_disable_unprepare(adv7511->cec_clk);
> -
>         adv7511_uninit_regulators(adv7511);
>
>         drm_bridge_remove(&adv7511->bridge);
> @@ -1349,6 +1346,8 @@ static int adv7511_remove(struct i2c_client *i2c)
>         adv7511_audio_exit(adv7511);
>
>         cec_unregister_adapter(adv7511->cec_adap);
> +       i2c_unregister_device(adv7511->i2c_cec);
> +       clk_disable_unprepare(adv7511->cec_clk);
>
>         i2c_unregister_device(adv7511->i2c_packet);
>         i2c_unregister_device(adv7511->i2c_edid);
> --
> 2.36.1
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
