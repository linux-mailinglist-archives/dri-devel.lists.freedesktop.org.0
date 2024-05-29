Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 858828D34E5
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 12:50:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 959A310E2D3;
	Wed, 29 May 2024 10:50:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IM8ymfDV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2ABA10E2D3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 10:50:48 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 46e09a7af769-6f361af4cb6so620383a34.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 03:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716979848; x=1717584648; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ON8VbFksVmbIPG/lyhHTYgnpBNOyPvXdvZ1EVrZ290Y=;
 b=IM8ymfDVsUR8Ph0/VJfwiEkjA14OLyLSObiKK328KxXZEM272IYWJbm1kx0AvJmwhV
 a0soLrgotIXlwbOgiy5AbtWHGQsfDjhxI4KJ7EEL7gxR8KmKAbwZGpVhtDaqODyIOhie
 qbWEuEIQXWzC6ubZmyPILnjnB+Bl7rkf1QELJbfvZqLa1D1q4+9Gl7fG270rPzFhO81O
 Zpsv3M8zrSX6HkxcokaceJp5GMpszi8dBI8OmcWQSO1mMbyA2oEPBvIpByfLm6PyF8ai
 8bSvrIhoBRnZQB9xfQe3Wt04EBxHYsZCP49OI3oqImYjljRI4HEb+WUIi+7t9fBkLi01
 qmug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716979848; x=1717584648;
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ON8VbFksVmbIPG/lyhHTYgnpBNOyPvXdvZ1EVrZ290Y=;
 b=nVvF/qQCJ5N0ozkHRAEH0hPcXvvafxdhdv2v8qQQH8/AkAIEmlTGoBZXYiin4kWN8I
 FOrBrzuu6rOJntBsYR8qwZC4i5gCjFV1bix3zfsDu7VUuzYD0RSUmgkQDyLWhwt29ogS
 2vZAAaYQuxQmRrzDxMtCyNWQnJwAzAgpkgNYCs0ObIJgkX7tebQ4i631YH0gFrxvnXlY
 DqGKvM3uHiubVXriLi2pL0OJXldRybwVTX3YNvJ34YxmTqDOUEOa5giGxq88bOdwrb1N
 2FRKtLm9wzNgQ1vlOKhdAkz5U/QzmKnioVPYHXvi9ZPcjayXwbm5ZmkjJG8WvP10/h6g
 ycag==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqCUoEyre4NoQyVw5MB+kJZurSS/SNswYmeBoy7u9q+JRcFf8H9wy+WZu3hzsxeX6CElmJiGTdzQAE8+AtTtkC+sd2wogu1cx089YMVYYd
X-Gm-Message-State: AOJu0YxGiSSaT5VA6YX5Sm81Fdl6IKWjBvSqGQslJtf2xwxY868QEOLh
 twcTe5BkSNTCrRmSv7cfuCaEIqNwElHIN5ncWIoc4eVAdOrT26w7
X-Google-Smtp-Source: AGHT+IEDsGCiyN149iX9lU2bvkB1z7h9rA7d3r9gRWABUoCAZd/4EOHcw9C0uBV4EXJZJiYtYzmp4A==
X-Received: by 2002:a05:6870:55c9:b0:24f:e1be:39b4 with SMTP id
 586e51a60fabf-24fe1be4a39mr14171911fac.46.1716979847520; 
 Wed, 29 May 2024 03:50:47 -0700 (PDT)
Received: from [127.0.0.1] ([106.194.121.206])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fd4dcde6sm7780536b3a.211.2024.05.29.03.50.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 May 2024 03:50:47 -0700 (PDT)
Date: Wed, 29 May 2024 16:20:41 +0530 (GMT+05:30)
From: Shresth Prasad <shresthprasad7@gmail.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: robh@kernel.org, saravanak@google.com,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, javier.carrasco.cruz@gmail.com,
 julia.lawall@inria.fr
Message-ID: <06a5901b-a2f1-4e3f-9744-bbcb3a34f666@gmail.com>
In-Reply-To: <8d95757c-fd05-4a48-ae9d-24d78d04d663@samsung.com>
References: <20240515202915.16214-3-shresthprasad7@gmail.com>
 <CGME20240529101246eucas1p1266853c07f5178c7e3e4b8a264eb436e@eucas1p1.samsung.com>
 <8d95757c-fd05-4a48-ae9d-24d78d04d663@samsung.com>
Subject: Re: [PATCH][next] of: property: Remove calls to of_node_put
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <06a5901b-a2f1-4e3f-9744-bbcb3a34f666@gmail.com>
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

29 May 2024 3:42:48=E2=80=AFpm Marek Szyprowski <m.szyprowski@samsung.com>:

> On 15.05.2024 22:29, Shresth Prasad wrote:
>> Add __free cleanup handler to some variable initialisations, which
>> ensures that the resource is freed as soon as the variable goes out of
>> scope. Thus removing the need to manually free up the resource using
>> of_node_put.
>>=20
>> Suggested-by: Julia Lawall <julia.lawall@inria.fr>
>> Signed-off-by: Shresth Prasad <shresthprasad7@gmail.com>
>> ---
>=20
> This patch landed in today's linux-next as commit b94d24c08ee1 ("of:
> property: Remove calls to of_node_put"). I found that it triggers the
> following warning while booting of the Samsung Exynos5800 based Pi
> Chromebook (arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts):
>=20
> OF: ERROR: of_node_release() detected bad of_node_put() on /panel
> CPU: 2 PID: 68 Comm: kworker/u36:1 Not tainted
> 6.10.0-rc1-00001-gb94d24c08ee1 #8619
> Hardware name: Samsung Exynos (Flattened Device Tree)
> Workqueue: events_unbound deferred_probe_work_func
> tps65090 20-0048: No cache defaults, reading back from HW
> Call trace:
> =C2=A0unwind_backtrace from show_stack+0x10/0x14
> =C2=A0show_stack from dump_stack_lvl+0x50/0x64
> =C2=A0dump_stack_lvl from of_node_release+0x110/0x138
> =C2=A0of_node_release from kobject_put+0x98/0x108
> =C2=A0kobject_put from drm_of_find_panel_or_bridge+0x94/0xd8
> =C2=A0drm_of_find_panel_or_bridge from exynos_dp_probe+0xf0/0x158 [exynos=
drm]
> =C2=A0exynos_dp_probe [exynosdrm] from platform_probe+0x80/0xc0
> =C2=A0platform_probe from really_probe+0xc8/0x288
> =C2=A0really_probe from __driver_probe_device+0x8c/0x190
> =C2=A0__driver_probe_device from driver_probe_device+0x30/0xd0
> =C2=A0driver_probe_device from __device_attach_driver+0x8c/0xbc
> =C2=A0__device_attach_driver from bus_for_each_drv+0x74/0xc0
> =C2=A0bus_for_each_drv from __device_attach+0xe8/0x184
> =C2=A0__device_attach from bus_probe_device+0x88/0x8c
> =C2=A0bus_probe_device from deferred_probe_work_func+0x7c/0xa8
> =C2=A0deferred_probe_work_func from process_scheduled_works+0xe8/0x41c
> =C2=A0process_scheduled_works from worker_thread+0x14c/0x35c
> =C2=A0worker_thread from kthread+0xd0/0x104
> =C2=A0kthread from ret_from_fork+0x14/0x28
> Exception stack(0xf0a81fb0 to 0xf0a81ff8)
>=20
> OF: ERROR: next of_node_put() on this node will result in a kobject
> warning 'refcount_t: underflow; use-after-free.'
> ------------[ cut here ]------------
> WARNING: CPU: 3 PID: 68 at lib/refcount.c:25 kobject_get+0xa0/0xa4
> refcount_t: addition on 0; use-after-free.
> Modules linked in: i2c_cros_ec_tunnel(+) cros_ec_keyb cros_ec_dev
> cros_ec_spi cros_ec snd_soc_i2s snd_soc_idma snd_soc_max98090
> snd_soc_snow snd_soc_s3c_dma snd_soc_core tpm_i2c_infineon ac97_bus
> snd_pcm_dmaengine tpm exynosdrm libsha256 libaescfb snd_pcm analogix_dp
> ecdh_generic samsung_dsim ecc snd_timer atmel_mxt_ts snd libaes
> soundcore exynos_gsc s5p_jpeg s5p_mfc v4l2_mem2mem spi_s3c64xx
> videobuf2_dma_contig exynos_adc pwm_samsung videobuf2_memops
> videobuf2_v4l2 videodev phy_exynos_usb2 videobuf2_common ohci_exynos
> ehci_exynos mc exynos_ppmu rtc_s3c exynos_rng s3c2410_wdt s5p_sss
> phy_exynos_mipi_video phy_exynos_dp_video
> CPU: 3 PID: 68 Comm: kworker/u36:1 Not tainted
> 6.10.0-rc1-00001-gb94d24c08ee1 #8619
> Hardware name: Samsung Exynos (Flattened Device Tree)
> Workqueue: events_unbound deferred_probe_work_func
> Call trace:
> =C2=A0unwind_backtrace from show_stack+0x10/0x14
> =C2=A0show_stack from dump_stack_lvl+0x50/0x64
> =C2=A0dump_stack_lvl from __warn+0x108/0x12c
> =C2=A0__warn from warn_slowpath_fmt+0x118/0x17c
> =C2=A0warn_slowpath_fmt from kobject_get+0xa0/0xa4
> =C2=A0kobject_get from of_node_get+0x14/0x1c
> =C2=A0of_node_get from of_get_next_parent+0x24/0x50
> =C2=A0of_get_next_parent from of_graph_get_port_parent.part.1+0x58/0xa4
> =C2=A0of_graph_get_port_parent.part.1 from
> of_graph_get_remote_port_parent+0x1c/0x38
> =C2=A0of_graph_get_remote_port_parent from of_graph_get_remote_node+0x10/=
0x6c
> =C2=A0of_graph_get_remote_node from drm_of_find_panel_or_bridge+0x50/0xd8
> =C2=A0drm_of_find_panel_or_bridge from exynos_dp_probe+0xf0/0x158 [exynos=
drm]
> =C2=A0exynos_dp_probe [exynosdrm] from platform_probe+0x80/0xc0
> =C2=A0platform_probe from really_probe+0xc8/0x288
> =C2=A0really_probe from __driver_probe_device+0x8c/0x190
> =C2=A0__driver_probe_device from driver_probe_device+0x30/0xd0
> =C2=A0driver_probe_device from __device_attach_driver+0x8c/0xbc
> =C2=A0__device_attach_driver from bus_for_each_drv+0x74/0xc0
> =C2=A0bus_for_each_drv from __device_attach+0xe8/0x184
> =C2=A0__device_attach from bus_probe_device+0x88/0x8c
> =C2=A0bus_probe_device from deferred_probe_work_func+0x7c/0xa8
> =C2=A0deferred_probe_work_func from process_scheduled_works+0xe8/0x41c
> =C2=A0process_scheduled_works from worker_thread+0x14c/0x35c
> =C2=A0worker_thread from kthread+0xd0/0x104
> =C2=A0kthread from ret_from_fork+0x14/0x28
> Exception stack(0xf0a81fb0 to 0xf0a81ff8)
>=20
> ---[ end trace 0000000000000000 ]---
> ------------[ cut here ]------------
>=20
> If I got this right, this points to the drm_of_find_panel_or_bridge()
> function. I briefly scanned it, but I don't see any obvious
> of_node_put() related issue there.
>=20
>=20
>> I had submitted a similar patch a couple weeks ago addressing the same
>> issue, but as it turns out I wasn't thorough enough and had left a coupl=
e
>> instances.
>>=20
>> I hope this isn't too big an issue.
>> ---
>> =C2=A0 drivers/of/property.c | 27 +++++++++++----------------
>> =C2=A0 1 file changed, 11 insertions(+), 16 deletions(-)
>>=20
>> diff --git a/drivers/of/property.c b/drivers/of/property.c
>> index 17b294e16c56..96a74f6a8d64 100644
>> --- a/drivers/of/property.c
>> +++ b/drivers/of/property.c
>> @@ -773,15 +773,14 @@ EXPORT_SYMBOL(of_graph_get_port_parent);
>> =C2=A0 struct device_node *of_graph_get_remote_port_parent(
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct device_node *node)
>> =C2=A0 {
>> -=C2=A0=C2=A0 struct device_node *np, *pp;
>> +=C2=A0=C2=A0 struct device_node *pp;
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0 /* Get remote endpoint node. */
>> -=C2=A0=C2=A0 np =3D of_graph_get_remote_endpoint(node);
>> +=C2=A0=C2=A0 struct device_node *np __free(device_node) =3D
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 of_graph_get_remote_endpoint(node);
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0 pp =3D of_graph_get_port_parent(np);
>> =C2=A0
>> -=C2=A0=C2=A0 of_node_put(np);
>> -
>> =C2=A0=C2=A0=C2=A0 return pp;
>> =C2=A0 }
>> =C2=A0 EXPORT_SYMBOL(of_graph_get_remote_port_parent);
>> @@ -835,17 +834,18 @@ EXPORT_SYMBOL(of_graph_get_endpoint_count);
>> =C2=A0 struct device_node *of_graph_get_remote_node(const struct device_=
node *node,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u3=
2 port, u32 endpoint)
>> =C2=A0 {
>> -=C2=A0=C2=A0 struct device_node *endpoint_node, *remote;
>> +=C2=A0=C2=A0 struct device_node *endpoint_node __free(device_node) =3D
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 of_graph_get_endpoint_by_regs(node, port, endpoint);
>> +
>> +=C2=A0=C2=A0 struct device_node *remote __free(device_node) =3D
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 of_graph_get_remote_port_parent(endpoint_node);
>> =C2=A0
>> -=C2=A0=C2=A0 endpoint_node =3D of_graph_get_endpoint_by_regs(node, port=
, endpoint);
>> =C2=A0=C2=A0=C2=A0 if (!endpoint_node) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_debug("no valid endpoint (=
%d, %d) for node %pOF\n",
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 port, endpoint, node);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
>> =C2=A0=C2=A0=C2=A0 }
>> =C2=A0
>> -=C2=A0=C2=A0 remote =3D of_graph_get_remote_port_parent(endpoint_node);
>> -=C2=A0=C2=A0 of_node_put(endpoint_node);
>> =C2=A0=C2=A0=C2=A0 if (!remote) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_debug("no valid remote nod=
e\n");
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
>> @@ -853,7 +853,6 @@ struct device_node *of_graph_get_remote_node(const s=
truct device_node *node,
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0 if (!of_device_is_available(remote)) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_debug("not available for r=
emote node\n");
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 of_node_put(remote);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
>> =C2=A0=C2=A0=C2=A0 }
>> =C2=A0
>> @@ -1064,19 +1063,15 @@ static void of_link_to_phandle(struct device_nod=
e *con_np,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device_node *sup_np,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 flags)
>> =C2=A0 {
>> -=C2=A0=C2=A0 struct device_node *tmp_np =3D of_node_get(sup_np);
>> +=C2=A0=C2=A0 struct device_node *tmp_np __free(device_node) =3D of_node=
_get(sup_np);
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0 /* Check that sup_np and its ancestors are available.=
 */
>> =C2=A0=C2=A0=C2=A0 while (tmp_np) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (of_fwnode_handle(tmp_np)->dev)=
 {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 of_node_pu=
t(tmp_np);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (of_fwnode_handle(tmp_np)->dev)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break=
;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!of_device_is_available(tmp_np=
)) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 of_node_pu=
t(tmp_np);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!of_device_is_available(tmp_np=
))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tmp_np =3D of_get_next_parent=
(tmp_np);
>> =C2=A0=C2=A0=C2=A0 }
>=20
> Best regards
> --=20
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland

Thanks for letting me know.

It seems this has already been fixed by Alexander Stein here:
https://lore.kernel.org/all/20240529073246.537459-1-alexander.stein@ew.tq-g=
roup.com/

Regards,
Shresth
