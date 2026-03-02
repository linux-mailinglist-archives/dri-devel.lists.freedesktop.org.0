Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6O6rGLEXpmkCKQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 00:05:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B65451E6446
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 00:05:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91BCC10E030;
	Mon,  2 Mar 2026 23:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="eVcnaIZp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 318 seconds by postgrey-1.36 at gabe;
 Mon, 02 Mar 2026 23:05:15 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1821710E030
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 23:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1772492713; x=1773097513; i=wahrenst@gmx.net;
 bh=3i0kTk9h4Tm7QszjJIXjo1qFSidrNxe30HcG0SNcNOc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=eVcnaIZpixQjT/adx/ve6+MjPC9Jy0WuSVxxDp7QNC1kA7mQbIU+nbEIo05cBf4l
 MiUjYEkSyW/I75I7ejeGfWEGaxbTdYgKcIuMat5F5PHeTkQKQVfQuu+tlA4GiI1Hq
 fm4ghE0C+q8VFhcWU3jrzzjlMHKvPvECD642r7NeSlWKqL7uHcmG2iOdZWuBrwzNO
 eApeGoYIZyZng8maTs+mzrq2pgAk9Ds4TFzz0cwtmZxNuWJhq+Acdu9KsyFg3jtHO
 PAaHQT+JmDhpFWKy1ekjyg+Cyu5Lo2nhnOkOjwLfSpufHa8EvjVHUIiE9pryaQ/cB
 LmdgKJx35+Jwn+owSA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MXXuH-1wBJFD2kJz-00MLyB; Mon, 02
 Mar 2026 23:59:40 +0100
Message-ID: <1ac72f71-e742-4754-9400-4a7f26a8b52d@gmx.net>
Date: Mon, 2 Mar 2026 23:59:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/6] drm/v3d: Introduce Runtime Power Management
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>,
 Chema Casanova <jmcasanova@igalia.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
References: <20260218-v3d-power-management-v6-0-40683fd39865@igalia.com>
 <20260218-v3d-power-management-v6-6-40683fd39865@igalia.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20260218-v3d-power-management-v6-6-40683fd39865@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1h3Bzt16hbphMMQXb+zgTJ8MNFCC485TK5VhSAWsJxoz11vFXBt
 WnOcRXjLD050pht+F8uwItJkeO3JdgNwP7Trv7LnpRXCYi2gj749STBYaQESbYFbHFR6RZ1
 O25Rdw0v4m/Z6dYKk2sojqPrcHkWVQJYuDKcGR8Qf7JNftakTTSZcrcoj4VbVMW0BphmOQo
 ykvQl8aP8XrX03aCE+ahg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RTaJhIWrgzc=;vFEXE8Z2V7cwBkKHAd08PeJdeN0
 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
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
X-Rspamd-Queue-Id: B65451E6446
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmx.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmx.net:s=s31663417];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:mcanal@igalia.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:nsaenz@kernel.org,m:florian.fainelli@broadcom.com,m:mripard@kernel.org,m:mwen@igalia.com,m:itoral@igalia.com,m:jmcasanova@igalia.com,m:dave.stevenson@raspberrypi.com,m:p.zabel@pengutronix.de,m:linux-clk@vger.kernel.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:bcm-kernel-feedback-list@broadcom.com,m:kernel-dev@igalia.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[wahrenst@gmx.net,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmx.net];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[wahrenst@gmx.net,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmx.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:email]
X-Rspamd-Action: no action

Hi Ma=C3=ADra,

just 2 nits.

Am 18.02.26 um 21:45 schrieb Ma=C3=ADra Canal:
> Commit 90a64adb0876 ("drm/v3d: Get rid of pm code") removed the last
> bits of power management code that V3D had, which were actually never
> hooked. Therefore, currently, the GPU clock is enabled during probe
> and only disabled when removing the driver.
>
> Implement proper power management using the kernel's Runtime PM
> framework.
>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
>   drivers/gpu/drm/v3d/Makefile      |  3 +-
>   drivers/gpu/drm/v3d/v3d_debugfs.c | 23 ++++++++++-
>   drivers/gpu/drm/v3d/v3d_drv.c     | 84 ++++++++++++++++++-------------=
=2D-------
>   drivers/gpu/drm/v3d/v3d_drv.h     | 17 ++++++++
>   drivers/gpu/drm/v3d/v3d_mmu.c     | 10 ++++-
>   drivers/gpu/drm/v3d/v3d_perfmon.c | 18 +++++++--
>   drivers/gpu/drm/v3d/v3d_power.c   | 83 +++++++++++++++++++++++++++++++=
+++++++
>   drivers/gpu/drm/v3d/v3d_submit.c  | 19 +++++++--
>   8 files changed, 198 insertions(+), 59 deletions(-)
>
> diff --git a/drivers/gpu/drm/v3d/Makefile b/drivers/gpu/drm/v3d/Makefile
> index b7d673f1153bef16db3800e50b2bfaf36bf8871b..9cb1fd4e4091dbb56e6a73e2=
b8a51fa0d242698b 100644
> --- a/drivers/gpu/drm/v3d/Makefile
> +++ b/drivers/gpu/drm/v3d/Makefile
> @@ -13,7 +13,8 @@ v3d-y :=3D \
>   	v3d_trace_points.o \
>   	v3d_sched.o \
>   	v3d_sysfs.o \
> -	v3d_submit.o
> +	v3d_submit.o \
> +	v3d_power.o
Please keep the alphabetical order.
>  =20
>   v3d-$(CONFIG_DEBUG_FS) +=3D v3d_debugfs.o
>  =20
...
>  =20
> diff --git a/drivers/gpu/drm/v3d/v3d_power.c b/drivers/gpu/drm/v3d/v3d_p=
ower.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..f3d30ef5de4ea6ecdbd21c43=
8b8af54bdf4d0dba
> --- /dev/null
> +++ b/drivers/gpu/drm/v3d/v3d_power.c
> @@ -0,0 +1,83 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/* Copyright (C) 2026 Raspberry Pi */
> +
> +#include <linux/clk.h>
> +#include <linux/reset.h>
> +
> +#include <drm/drm_print.h>
> +
> +#include "v3d_drv.h"
> +#include "v3d_regs.h"
> +
> +static void
> +v3d_resume_sms(struct v3d_dev *v3d)
> +{
> +	if (v3d->ver < V3D_GEN_71)
> +		return;
> +
> +	V3D_SMS_WRITE(V3D_SMS_TEE_CS, V3D_SMS_CLEAR_POWER_OFF);
> +
> +	if (wait_for((V3D_GET_FIELD(V3D_SMS_READ(V3D_SMS_TEE_CS),
> +				    V3D_SMS_STATE) =3D=3D V3D_SMS_IDLE), 100)) {
> +		drm_err(&v3d->drm, "Failed to power up SMS\n");
> +	}
> +
> +	v3d_reset_sms(v3d);
> +}
> +
> +static void
> +v3d_suspend_sms(struct v3d_dev *v3d)
> +{
> +	if (v3d->ver < V3D_GEN_71)
> +		return;
> +
> +	V3D_SMS_WRITE(V3D_SMS_TEE_CS, V3D_SMS_POWER_OFF);
> +
> +	if (wait_for((V3D_GET_FIELD(V3D_SMS_READ(V3D_SMS_TEE_CS),
> +				    V3D_SMS_STATE) =3D=3D V3D_SMS_POWER_OFF_STATE), 100)) {
> +		drm_err(&v3d->drm, "Failed to power off SMS\n");
> +	}
> +}
> +
> +int v3d_power_suspend(struct device *dev)
> +{
> +	struct drm_device *drm =3D dev_get_drvdata(dev);
> +	struct v3d_dev *v3d =3D to_v3d_dev(drm);
> +
> +	v3d_irq_disable(v3d);
> +	v3d_suspend_sms(v3d);
> +
> +	if (v3d->reset)
> +		reset_control_assert(v3d->reset);
Shouldn't we handle the error case?
> +
> +	clk_disable_unprepare(v3d->clk);
> +
> +	return 0;
> +}
> +
> +int v3d_power_resume(struct device *dev)
> +{
> +	struct drm_device *drm =3D dev_get_drvdata(dev);
> +	struct v3d_dev *v3d =3D to_v3d_dev(drm);
> +	int ret;
> +
> +	ret =3D clk_prepare_enable(v3d->clk);
> +	if (ret)
> +		return ret;
> +
> +	if (v3d->reset) {
> +		ret =3D reset_control_deassert(v3d->reset);
> +		if (ret)
> +			goto clk_disable;
> +	}
> +
> +	v3d_resume_sms(v3d);
> +	v3d_mmu_set_page_table(v3d);
> +	v3d_irq_enable(v3d);
> +
> +	return 0;
> +
> +clk_disable:
> +	clk_disable_unprepare(v3d->clk);
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_=
submit.c
> index 794c3571662de7eb566bf4c0561571d7618dd234..fea7573505cd0d2b84d21efd=
a88ed4da657d18d4 100644
> --- a/drivers/gpu/drm/v3d/v3d_submit.c
> +++ b/drivers/gpu/drm/v3d/v3d_submit.c
> @@ -103,6 +103,9 @@ v3d_job_free(struct kref *ref)
>   	if (job->perfmon)
>   		v3d_perfmon_put(job->perfmon);
>  =20
> +	if (job->has_pm_ref)
> +		v3d_pm_runtime_put(job->v3d);
> +
>   	kfree(job);
>   }
>  =20
> @@ -184,13 +187,13 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file =
*file_priv,
>   				if (copy_from_user(&in, handle++, sizeof(in))) {
>   					ret =3D -EFAULT;
>   					drm_dbg(&v3d->drm, "Failed to copy wait dep handle.\n");
> -					goto fail_deps;
> +					goto fail_job_init;
>   				}
>   				ret =3D drm_sched_job_add_syncobj_dependency(&job->base, file_priv=
, in.handle, 0);
>  =20
>   				// TODO: Investigate why this was filtered out for the IOCTL.
>   				if (ret && ret !=3D -ENOENT)
> -					goto fail_deps;
> +					goto fail_job_init;
>   			}
>   		}
>   	} else {
> @@ -198,14 +201,22 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file =
*file_priv,
>  =20
>   		// TODO: Investigate why this was filtered out for the IOCTL.
>   		if (ret && ret !=3D -ENOENT)
> -			goto fail_deps;
> +			goto fail_job_init;
> +	}
> +
> +	/* CPU jobs don't require hardware resources */
> +	if (queue !=3D V3D_CPU) {
> +		ret =3D v3d_pm_runtime_get(v3d);
> +		if (ret)
> +			goto fail_job_init;
> +		job->has_pm_ref =3D true;
>   	}
>  =20
>   	kref_init(&job->refcount);
>  =20
>   	return 0;
>  =20
> -fail_deps:
> +fail_job_init:
>   	drm_sched_job_cleanup(&job->base);
>   	return ret;
>   }
>

