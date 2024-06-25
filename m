Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A68FB916A24
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 16:21:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2EA310E66F;
	Tue, 25 Jun 2024 14:21:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="uR54Fk7w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 469AD10E66B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 14:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1719325274; x=1719930074; i=wahrenst@gmx.net;
 bh=C87qNLAu7SiRIDBMmbR5Db7YOtj7u02iMKlulAAxpH8=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=uR54Fk7wAys0tMJdyHGEEHq2Uw0APtwfgD5aULDvIkFuMZZrrDT5rAFApBubwq1d
 4tiKnCBXoP5TjDYZ63TIC/uafX78GgKmyr07XFqd5ZRYD2eX44nhQ9KxWHezOEAoq
 IqYEFZY+Df32YrjweWzjTjfiCPZWE+J3iB1BvB2TcItY5RjK/7x/RZSIMa7KN1LAe
 8J8yR/x1bul3kI/Svoj1UA3c918IcU/8ZbS3DExjByRUogla1FbV5UCatE1d40kXh
 fjwHXqrKVaC574g3cbIMk+pjy8+K0rz0MLVKwmoXFEt265PJ0zJyAVegVtzW/ypyr
 +VQOpWU111Xkt9kHkg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPXhK-1rzTYG1tdC-00Tw1Q; Tue, 25
 Jun 2024 16:21:14 +0200
Message-ID: <26c16ecc-408a-4f7e-a98c-dc36adcc7ac6@gmx.net>
Date: Tue, 25 Jun 2024 16:21:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: vc4: WARNING during suspend to idle of Raspberry Pi 3 Plus
To: Maxime Ripard <mripard@kernel.org>
Cc: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-pm@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <7003512d-7303-4f41-b0d6-a8af5bf8e497@gmx.net>
 <20240624-furry-kangaroo-of-flowers-85ecdf@houat>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240624-furry-kangaroo-of-flowers-85ecdf@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dSZap/sYmmOihZsKqVSsycAi48HvRhT8Kn8iDjCXxjeZf95b4F8
 lwIRHYsixlU8nWz6Y1F1vrdRQf8KtkU+HZAjwdENLrHWeGS/xzoopqqXY1BF5qCDGhWXGQ9
 OgzC4SEw3k1Q6rFzSMKwdFFQaBcPy4Njvg8blSGg0XeUMU5FrqAsn/xfJm0Fdcs3tH4OMr7
 6mVihwvRsE8YaYP2Fc7UA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MkJkrNS4thA=;45Wmu3UqXiJlpmJ8Fv10UTOdOqT
 GJ7/wsoXmtVe2eIFeq9ymHL3pMiHavdtMJxbU4yUCvFdvhV3eekfoF++k5CJtEe6cG2GxJJz+
 SVyjSJABEwpPcNHgwO4l8NG9rz9qio8OfCHcutSt0xJCCRxyCNLE/xzVAc7heuiBj5N4BVwg3
 QJs/b9F6v/BmhI0YrMwTyY/zemogGLqyS7qiKKbIFf07BhDFSM469nKpRfVzM8kKlMA5M0aqi
 getWLng1+KKTi0LPXHuOx7YymhiwVMxc6obW1xNoidueLpuskav1cfDLgwCvL9H88KAYRjKVM
 JxFQt3NBiBfEATvlMDS9kfvSvMLKVkrmUgvRBANQVMpBXeINOf2Wb+lmykH4857VmKxg86FVg
 UpG2r2b4gV1fWsyht3yE/EA8HZ5+eLdUmBlbWKJJ2yRnn4c8Qv9hGgn5NnQVtbpfmQc9NnK6Z
 YE3/x/r9d84FPTKjbizeSWDiM17GR13ioWXhYsZGYCHM6WfY0BgInLASKdJwaNZp3zkXOqExL
 KJtrTg6Fhj/i/pT15avF6fAGlj3QYu9f3cbIfJzCTQTuKRAeRwe0QKSDwZiKLQTekhw2Ue89k
 HFjoPQAUoJU2I1gzYFvup3eDlX+FddizQKqeyojtG+HmZeZeDW4hpi2VwacpdC48NeDk2Erjf
 GONN62FOVWP0fmo2qf2DG/W1xhymikdp8wdMxgoVIUqRMxTo4vwhi2hqrdglRm6CMsk0pr+w5
 rKt3VvrZ6AFs77b2lbY/NmqYt1z3Nx3ytRh4TNxPwRJiP+Fa0cHpxD7GREz6JmcaxYpks2nbO
 qRAf63qSxeI7qVYeLC5l5ZGpHvcATiSX752FlrOfMw73I=
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

Hi Maxime,

Am 24.06.24 um 14:57 schrieb Maxime Ripard:
> On Sun, Jun 16, 2024 at 11:27:08AM GMT, Stefan Wahren wrote:
>> Hi,
>> i'm currently experiment with suspend to idle on the Raspberry Pi [1].
>>
>> During my tests, i noticed a WARNING of the vc4 during suspend incl.
>> Runtime PM usage count underflow. It would be nice if someone can look
>> at it. In case you want to reproduce it, i can prepare a branch with
>> some improvements/hacks. For example i disabled dwc2/USB because it
>> cause a lot of trouble during resume.
>>
>> Here are the steps to trigger this issue:
>> - make sure necessary kernel options are enabled ( CONFIG_SUSPEND,
>> CONFIG_PM_DEBUG, CONFIG_PM_ADVANCED_DEBUG )
>> - make sure no HDMI cable is connected to Raspberry Pi 3 Plus
sorry, i forgot the specific type of the Raspberry Pi 3 B Plus, but the
issue on Pi 3 A Plus is the same.
>> - Add "no_console_suspend" to cmdline.txt and reboot
>> - Connect via Debug UART:
>>
>> echo 1 > /sys/power/pm_debug_messages
>> echo platform > /sys/power/pm_test
>> echo freeze > /sys/power/state
>>
>> Here is the output:
>>
>> [=C2=A0=C2=A0 75.538497] PM: suspend entry (s2idle)
>> [=C2=A0=C2=A0 76.915786] Filesystems sync: 1.377 seconds
>> [=C2=A0=C2=A0 79.678262] rpi_firmware_set_power: Set HDMI to 1
>> [=C2=A0=C2=A0 79.678634] rpi_firmware_set_power: Set HDMI to 0
>> [=C2=A0=C2=A0 79.850949] Freezing user space processes
>> [=C2=A0=C2=A0 79.852460] Freezing user space processes completed (elaps=
ed 0.001
>> seconds)
>> [=C2=A0=C2=A0 79.852484] OOM killer disabled.
>> [=C2=A0=C2=A0 79.852493] Freezing remaining freezable tasks
>> [=C2=A0=C2=A0 79.853684] Freezing remaining freezable tasks completed (=
elapsed
>> 0.001 seconds)
>> [=C2=A0=C2=A0 80.892819] ieee80211 phy0: brcmf_fil_cmd_data: bus is dow=
n. we have
>> nothing to do.
>> [=C2=A0=C2=A0 80.892843] ieee80211 phy0: brcmf_cfg80211_get_tx_power: e=
rror (-5)
>> [=C2=A0=C2=A0 81.514053] PM: suspend of devices complete after 1659.336=
 msecs
>> [=C2=A0=C2=A0 81.514089] PM: start suspend of devices complete after 16=
60.386 msecs
>> [=C2=A0=C2=A0 81.515616] PM: late suspend of devices complete after 1.5=
09 msecs
>> [=C2=A0=C2=A0 81.515938] rpi_firmware_set_power: Set VEC to 0
>> [=C2=A0=C2=A0 81.516010] rpi_firmware_set_power: Set V3D to 0
>> [=C2=A0=C2=A0 81.516998] PM: noirq suspend of devices complete after 1.=
239 msecs
>> [=C2=A0=C2=A0 81.517016] PM: suspend debug: Waiting for 5 second(s).
>> [=C2=A0=C2=A0 89.598310] rpi_firmware_set_power: Set V3D to 1
>> [=C2=A0=C2=A0 90.078228] ------------[ cut here ]------------
>> [=C2=A0=C2=A0 90.078240] WARNING: CPU: 1 PID: 216 at
>> drivers/gpu/drm/vc4/vc4_hdmi.c:477
>> vc4_hdmi_connector_detect_ctx+0x2e4/0x34c [vc4]
>> [=C2=A0=C2=A0 90.078344] Modules linked in: aes_arm aes_generic cbc cry=
pto_simd
>> cryptd algif_skcipher af_alg brcmfmac_wcc brcmfmac vc4 brcmutil
>> snd_soc_hdmi_codec snd_soc_core ac97_bus sha256_generic
>> snd_pcm_dmaengine libsha256 snd_pcm sha256_arm snd_timer hci_uart
>> cfg80211 btbcm snd bluetooth soundcore drm_dma_helper crc32_arm_ce
>> ecdh_generic ecc raspberrypi_hwmon libaes bcm2835_thermal
>> [=C2=A0=C2=A0 90.078551] CPU: 1 PID: 216 Comm: kworker/1:2 Not tainted =
6.9.3-dirty #30
>> [=C2=A0=C2=A0 90.078568] Hardware name: BCM2835
>> [=C2=A0=C2=A0 90.078580] Workqueue: events output_poll_execute
>> [=C2=A0=C2=A0 90.078610] Call trace:
>> [=C2=A0=C2=A0 90.078624]=C2=A0 unwind_backtrace from show_stack+0x10/0x=
14
>> [=C2=A0=C2=A0 90.078660]=C2=A0 show_stack from dump_stack_lvl+0x50/0x64
>> [=C2=A0=C2=A0 90.078688]=C2=A0 dump_stack_lvl from __warn+0x7c/0x124
>> [=C2=A0=C2=A0 90.078723]=C2=A0 __warn from warn_slowpath_fmt+0x170/0x17=
8
>> [=C2=A0=C2=A0 90.078760]=C2=A0 warn_slowpath_fmt from
>> vc4_hdmi_connector_detect_ctx+0x2e4/0x34c [vc4]
>> [=C2=A0=C2=A0 90.078862]=C2=A0 vc4_hdmi_connector_detect_ctx [vc4] from
>> drm_helper_probe_detect_ctx+0x40/0x120
>> [=C2=A0=C2=A0 90.078951]=C2=A0 drm_helper_probe_detect_ctx from
>> output_poll_execute+0x160/0x24c
>> [=C2=A0=C2=A0 90.078982]=C2=A0 output_poll_execute from process_one_wor=
k+0x16c/0x3b4
>> [=C2=A0=C2=A0 90.079012]=C2=A0 process_one_work from worker_thread+0x27=
0/0x488
>> [=C2=A0=C2=A0 90.079036]=C2=A0 worker_thread from kthread+0xe0/0xfc
>> [=C2=A0=C2=A0 90.079060]=C2=A0 kthread from ret_from_fork+0x14/0x28
>> [=C2=A0=C2=A0 90.079080] Exception stack(0xf0af9fb0 to 0xf0af9ff8)
>> [=C2=A0=C2=A0 90.079096] 9fa0:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 00000000
>> 00000000 00000000 00000000
>> [=C2=A0=C2=A0 90.079113] 9fc0: 00000000 00000000 00000000 00000000 0000=
0000
>> 00000000 00000000 00000000
>> [=C2=A0=C2=A0 90.079129] 9fe0: 00000000 00000000 00000000 00000000 0000=
0013 00000000
>> [=C2=A0=C2=A0 90.079141] ---[ end trace 0000000000000000 ]---
>> [=C2=A0=C2=A0 90.079155] vc4_hdmi 3f902000.hdmi: vc4_hdmi_connector_det=
ect_ctx:
>> pm_runtime_resume_and_get failed: -13
>> [=C2=A0=C2=A0 92.638262] rpi_firmware_set_power: Set HDMI to 1
>> [=C2=A0=C2=A0 95.678251] rpi_firmware_set_power: Set VEC to 1
>> [=C2=A0=C2=A0 95.678380] PM: noirq resume of devices complete after 916=
0.930 msecs
>> [=C2=A0=C2=A0 95.679604] PM: early resume of devices complete after 1.0=
69 msecs
>> [=C2=A0=C2=A0 95.812230] brcmfmac: brcmf_fw_alloc_request: using
>> brcm/brcmfmac43455-sdio for chip BCM4345/6
>> [=C2=A0=C2=A0 95.812282] PM: resume of devices complete after 132.657 m=
secs
>> [=C2=A0=C2=A0 95.813246] vc4_hdmi 3f902000.hdmi: Runtime PM usage count=
 underflow!
>> [=C2=A0=C2=A0 95.814456] OOM killer enabled.
>> [=C2=A0=C2=A0 95.814466] Restarting tasks ... done.
>> [=C2=A0=C2=A0 95.817193] random: crng reseeded on system resumption
>> [=C2=A0=C2=A0 95.819813] rpi_firmware_set_power: Set HDMI to 0
>> [=C2=A0=C2=A0 95.827808] PM: suspend exit
>>
>> [1] - https://github.com/raspberrypi/firmware/issues/1894
> The code itself looks fine to me still, but It's not clear to me why it
> getting called during suspend in the first place.
This is a good question. I don't have idea why this should be necessary.

But according to the kernel docs the worker output_poll_execute can be
disabled with drm_kms_helper_poll_disable().

Btw do we need to use SET_SYSTEM_SLEEP_PM_OPS here?
>   IIRC, it's in the HPD
> interrupt handler path, could it be that the interrupt fires during
> suspend?
Based on the trace and my further investigations the function is called
vc4_hdmi_connector_detect_ctx every 10s while no HDMI connector is
plugged by output_poll_execute. This has the advantage that also the
GPIOs from the expander could be used as HPD. Since the suspend test is
5 sec long, there is a high chance for this warning.

Here is my current workaround:

drm/vc4: hdmi: Handle error case of pm_runtime_resume_and_get

The commit 0f5251339eda ("drm/vc4: hdmi: Make sure the controller is
powered in detect") introduced the necessary power management handling
to avoid register access while controller is powered down.
Unfortunately it just print a warning if pm_runtime_resume_and_get()
fails and proceed anyway.

This could happen during suspend to idle. So we must assume it is unsafe
to access the HDMI register. So bail out properly.

Fixes: 0f5251339eda ("drm/vc4: hdmi: Make sure the controller is powered
in detect")
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 =C2=A0drivers/gpu/drm/vc4/vc4_hdmi.c | 7 ++++++-
 =C2=A01 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi=
.c
index d30f8e8e896717..2c1d59a181d833 100644
=2D-- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -462,6 +462,7 @@ static int vc4_hdmi_connector_detect_ctx(struct
drm_connector *connector,
 =C2=A0{
 =C2=A0=C2=A0=C2=A0=C2=A0 struct vc4_hdmi *vc4_hdmi =3D connector_to_vc4_h=
dmi(connector);
 =C2=A0=C2=A0=C2=A0=C2=A0 enum drm_connector_status status =3D connector_s=
tatus_disconnected;
+=C2=A0=C2=A0=C2=A0 int ret;

 =C2=A0=C2=A0=C2=A0=C2=A0 /*
 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0* NOTE: This function should really take v=
c4_hdmi->mutex, but
@@ -474,7 +475,11 @@ static int vc4_hdmi_connector_detect_ctx(struct
drm_connector *connector,
 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0* the lock for now.
 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0*/

- WARN_ON(pm_runtime_resume_and_get(&vc4_hdmi->pdev->dev));
+=C2=A0=C2=A0=C2=A0 ret =3D pm_runtime_resume_and_get(&vc4_hdmi->pdev->dev=
);
+=C2=A0=C2=A0=C2=A0 if (ret) {
+=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 DRM_ERROR("Failed to retain HDMI po=
wer domain: %d\n", ret);
+=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 return status;
+=C2=A0=C2=A0=C2=A0 }

 =C2=A0=C2=A0=C2=A0=C2=A0 if (vc4_hdmi->hpd_gpio) {
 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (gpiod_get_value_cansleep(=
vc4_hdmi->hpd_gpio))
