Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3515D658741
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 23:16:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1888A10E232;
	Wed, 28 Dec 2022 22:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9802D10E232
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Dec 2022 22:16:39 +0000 (UTC)
Received: from [192.168.1.139] ([37.4.248.41]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MHGTI-1p6J7Y2kts-00DE85; Wed, 28 Dec 2022 23:16:16 +0100
Message-ID: <9bb7c19c-effb-51e8-0b10-61077529030d@i2se.com>
Date: Wed, 28 Dec 2022 23:16:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: WARNING: CPU: 2 PID: 42 at drivers/gpu/drm/drm_modeset_lock.c:276
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Melissa Wen <mwen@igalia.com>
References: <47a25f27-a3a1-5ec3-0c63-e68d05dff94e@i2se.com>
 <6ebcc09f-47d1-6c08-53f8-0b87ba2d75f6@i2se.com>
 <4c036775-3989-b14a-8f3f-478ef488f108@igalia.com>
Content-Language: en-US
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <4c036775-3989-b14a-8f3f-478ef488f108@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:AIjO3t3Rrxb+o2FxTK0lbKJKCOVbTZ4/JHzNISAgThRWxYiTAmb
 6BoeBBLLaV4swFngHaKqlFlHImJLh/j4CJ/uxlcxEjtxKJrMBdN3anj60rEstpDMoSKbYox
 sNl/m0K6FSd5NAAiruaFARiBAh+y7MziRgcFOG2Xa867Xb8fbhGwxwHQoWp2quVfmc6blB/
 A8HLitSCqZjV2IIlg/2MQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Jt4FzGfnsj0=;u7oz72LmBH/9Se+XmkfmnZmxW7j
 tEGE+Qp0g9eTq0t1Dc7PoDo8AIAPOcigPi5nnQYRlGtGDr9BPqYzRWdNuabnAruRZIvyiDpKO
 4pkxaiGcCwy3XLrqAg+HK9NKx5Zt0viGJv6+eggEW3TKZ/tIMr4a3RduLlDiUzQOLZhm5p3Wy
 ex2n7SIya9354e4xZKmzbCHHKduVMJ326muJz9ITLuojnGxeXFUFZuCTMUHK+ABBf20EUo/TN
 e0HM7VMPajrEAholJ3/hy7CJv3ydYd3F+2XCkMTm2NYrRsY6AWEGHPEeRCGGjmwOF6vNJByFi
 eksVzIcqbfW2KZMBVMaPX4fGksGvJ07NILGNKQSenhpPULPykp7UTSghlNWIoAZi8TRzvVm38
 sFcBrT7l+i+tJVzyAQUA/4+xrbUxSVd58QHSdCM7vadlarU560gGAPI2/mru+lMfJHh5Qrz34
 m2aHxDnR9eEE8Rrqt6bAiXUSN2eK0/3t2WYTgb0+7OFqLxZ38b9R4ubF1B0jNkNC8/rcm29Gq
 /RUCHtUyAiGIqfwPqa3FGESLY2r7Ekiywl7x/149I9uoHGbRgzFYSc5gXwLkyVmmje5jyCr0j
 JYw0CgLwdKM+/m48NGnoqqSMFiYh9SUmEKa5bwQrw+SfjkqP4fl5zds8v5+ZCKtME/Ww/1yk3
 FF4rPzA+sjVlJKnw+pWHa3BIyJorFHAkv1r8UlGXmw==
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maíra,

Am 28.12.22 um 20:49 schrieb Maíra Canal:
> Hi Stefan,
>
> I was able to reproduce this error on drm-misc-next. I bisected,
> and I got into commit 6bed2ea3cb38. I noticed that the crtc->mutex is
> being locked twice, and this might be causing the problem. I wrote a
> patch to try to fix this issue, and after applying the patch, I wasn't
> able to reproduce the error anymore.
>
> Let me know if you were able to reproduce the warning after applying 
> this patch.

the patch works as expected and avoid the warning. I tested it on top of 
v6.1 with RPi 3 B+ and RPi 4 B.

In case you send the patch please add the Fixes tag so the patch get 
backported to stable.

Thanks a lot

Stefan

>
> Best Regards,
> - Maíra Canal
>
> ---
>
> From f6c910327d060e2314947e7e456db363a6164a49 Mon Sep 17 00:00:00 2001
> From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
> Date: Wed, 28 Dec 2022 16:14:34 -0300
> Subject: [PATCH] drm/vc4: don't lock crtc's mutex on reset link
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
>
> Current, crtc->mutex is being locked twice: first, by
> vc4_hdmi_reset_link() and them, internally, by
> drm_atomic_get_crtc_state(). This produces the following output when
> PROVE_LOCKING is enabled:
>
> [  825.612809] ------------[ cut here ]------------
> [  825.612852] WARNING: CPU: 1 PID: 116 at 
> drivers/gpu/drm/drm_modeset_lock.c:276 
> drm_modeset_drop_locks+0x60/0x68 [drm]
> [  825.613458] Modules linked in: 8021q mrp garp stp llc
> raspberrypi_cpufreq brcmfmac brcmutil crct10dif_ce hci_uart cfg80211
> btqca btbcm bluetooth vc4 raspberrypi_hwmon snd_soc_hdmi_codec cec
> clk_raspberrypi ecdh_generic drm_display_helper ecc rfkill
> drm_dma_helper drm_kms_helper pwm_bcm2835 bcm2835_thermal bcm2835_rng
> rng_core i2c_bcm2835 drm fuse ip_tables x_tables ipv6
> [  825.613735] CPU: 1 PID: 116 Comm: kworker/1:2 Tainted: G W 
> 6.1.0-rc6-01399-g941aae326315 #3
> [  825.613759] Hardware name: Raspberry Pi 3 Model B Rev 1.2 (DT)
> [  825.613777] Workqueue: events output_poll_execute [drm_kms_helper]
> [  825.614038] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS 
> BTYPE=--)
> [  825.614063] pc : drm_modeset_drop_locks+0x60/0x68 [drm]
> [  825.614603] lr : drm_helper_probe_detect+0x120/0x1b4 [drm_kms_helper]
> [  825.614829] sp : ffff800008313bf0
> [  825.614844] x29: ffff800008313bf0 x28: ffffcd7778b8b000 x27: 
> 0000000000000000
> [  825.614883] x26: 0000000000000001 x25: 0000000000000001 x24: 
> ffff677cc35c2758
> [  825.614920] x23: ffffcd7707d01430 x22: ffffcd7707c3edc7 x21: 
> 0000000000000001
> [  825.614958] x20: 0000000000000000 x19: ffff800008313c10 x18: 
> 000000000000b6d3
> [  825.614995] x17: ffffcd777835e214 x16: ffffcd7777cef870 x15: 
> fffff81000000000
> [  825.615033] x14: 0000000000000000 x13: 0000000000000099 x12: 
> 0000000000000002
> [  825.615070] x11: 72917988020af800 x10: 72917988020af800 x9 : 
> 72917988020af800
> [  825.615108] x8 : ffff677cc665e0a8 x7 : d00a8c180000110c x6 : 
> ffffcd77774c0054
> [  825.615145] x5 : 0000000000000000 x4 : 0000000000000001 x3 : 
> 0000000000000000
> [  825.615181] x2 : ffff677cc55e1880 x1 : ffffcd7777cef8ec x0 : 
> ffff800008313c10
> [  825.615219] Call trace:
> [  825.615232]  drm_modeset_drop_locks+0x60/0x68 [drm]
> [  825.615773]  drm_helper_probe_detect+0x120/0x1b4 [drm_kms_helper]
> [  825.616003]  output_poll_execute+0xe4/0x224 [drm_kms_helper]
> [  825.616233]  process_one_work+0x2b4/0x618
> [  825.616264]  worker_thread+0x24c/0x464
> [  825.616288]  kthread+0xec/0x110
> [  825.616310]  ret_from_fork+0x10/0x20
> [  825.616335] irq event stamp: 7634
> [  825.616349] hardirqs last  enabled at (7633): [<ffffcd777831ee90>] 
> _raw_spin_unlock_irq+0x3c/0x78
> [  825.616384] hardirqs last disabled at (7634): [<ffffcd7778315a78>] 
> __schedule+0x134/0x9f0
> [  825.616411] softirqs last  enabled at (7630): [<ffffcd7707aacea0>] 
> local_bh_enable+0x4/0x30 [ipv6]
> [  825.617019] softirqs last disabled at (7618): [<ffffcd7707aace70>] 
> local_bh_disable+0x4/0x30 [ipv6]
> [  825.617586] ---[ end trace 0000000000000000 ]---
>
> So, don't lock crtc->mutex inside the driver and let the right lock be
> automatically acquired by drm_atomic_get_crtc_state().
>
> Reported-by: Stefan Wahren <stefan.wahren@i2se.com>
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c 
> b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 0d3313c71f2f..b3b1958b5f4d 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -340,10 +340,6 @@ static int vc4_hdmi_reset_link(struct 
> drm_connector *connector,
>      if (!crtc)
>          return 0;
>
> -    ret = drm_modeset_lock(&crtc->mutex, ctx);
> -    if (ret)
> -        return ret;
> -
>      crtc_state = crtc->state;
>      if (!crtc_state->active)
>          return 0;
