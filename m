Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA4F9750C6
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 13:28:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6DA310E9C0;
	Wed, 11 Sep 2024 11:28:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="v7O+hv0P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45BA210E9C3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 11:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1726054066; x=1726658866; i=markus.elfring@web.de;
 bh=yTtZxWE0JHb3TnA6oJ50YzGe95/FIcKE44d4OiLu6iY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=v7O+hv0Pzxur6hSXyQsSyzWcSvALNs8t7DoMepgzk/EIvE6coR6h5wrLCiV84VP2
 yWGTGdFq8d2lGn4B1OfVqsyFJgIlfpjHymgYNYA9yUAbtorOqP1EDndL+reSaKsTq
 k2v7NX1ZLhl23YUlMOJdlb5ylRrT5MdmNXZWkukOPFBKHTuTNAo0BuLPirsHOpmWS
 /Zun4/Bg1c4xr2nhs0HQspM7IqYmhm+nX7Tg6byaFLaP4bnIonedU5zYWDrGyMMBY
 1NhZNIQxfgE143BOpBQ/oxj9Lw2QAh3jvx9vKvlcY8SiZ5Q3eZEsgD5W41Fwbrdt9
 5HLRQpxflVyC3BLDMw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.86.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MSIF2-1sQ2I61AYC-00NmSK; Wed, 11
 Sep 2024 13:27:46 +0200
Message-ID: <50b75b24-afbd-46cf-af4d-01e6ea4832dc@web.de>
Date: Wed, 11 Sep 2024 13:27:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@tomeuvizoso.net>
References: <20240612-6-10-rocket-v1-8-060e48eea250@tomeuvizoso.net>
Subject: Re: [PATCH 8/9] accel/rocket: Add job submission IOCTL
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240612-6-10-rocket-v1-8-060e48eea250@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YmCb7NXdmFPxc7xnbYpPH3gDEvf/+oJCB9LfDAxISh25xOGXJhX
 xJqwC0k2vwG8Wg4Ljwp7J46b69w5H04HZv2saRwka7NMsngHoOuHBmnF99t40n/HTDcyhGv
 OrfeycGLIHZUB7lOU6SsqIQpHvz9/XbkMtydirXYtDwk1N8Bm+5VGFHufghtREbqgs5ak67
 RyCZOjWVRgOrA3ww41D7A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vOiVie10tQI=;pJqeoruLOD0q7PLKWjhqjCwpMIi
 wUbyfof0VkY56VFhYv5E8enK/5ratFGUpbica8CWkS3qKC1hdYt+nL1C9lBq/QYL3ggZ7tHMK
 Ay6RFBIY1peAsoplJfuNsFcf5yc/+e0a1vH3K54FG1XxeFO/KyBd1FagIie5cpHn4hag4+IGq
 Fk9XkUeWuK/w2igQAWvqKiRbdKvW4FrMZDe29pyjluya5cnGhRG6ymxugx0zGew4ta+fGLMAs
 c9e0y95ig0wgeGxExJx7DlNodPGaWckOHFx1DqwNW/ebOYhaKCljiQCWBe26rXyLX3QKbRNQB
 OD+26NpEXB3m31Scmy6ikiA5W31Fn30ExYO4LYL+yvtad8t1VygAI+DPUEOo5HsWylUeIQSJ2
 ZpAD586s5jnQmq4W3Vc9+Hf098axsiatJr+6qwvvHzrWzBLI2erE2nmpWo2hcgATmBTSUwZT4
 GM4qWb6SKc7gxH2I1Ye0b9Z+gc6ZDgFSu2HDMr9DGS5qWGTpQJfJGuV1VNaLqEFGeGQwkvUwd
 giCNsWeWCkGNvKws6NOLjWJUhsjYO6jLNeIIyjD4oWwKikAujz/MpjFh9H7AXFtJgTkdUvov/
 ra0USbAlz9O58lp7DkyTQtNap5DGe9arwchl5QkVTe8pGtvxjMhJFb7frOH2X+fsPNCINrQFT
 y3amKgwJB2dzOEWcwV84QlydNzgJQhe86O2ihbbEBl5Buiz7slG7BWBF//5tzRxwmyOoA5o4F
 YIZExP3lWGJX0GcnA7zpzTCgIAqCRuoqiG+/TnWhl2oVEQloxmjuIMK5APcPETjfdyRYsdvNM
 ufMAAL+QG9jA4fAnPdJj9w4A==
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

=E2=80=A6
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -0,0 +1,708 @@
=E2=80=A6
> +static int rocket_job_push(struct rocket_job *job)
> +{
=E2=80=A6
> +	mutex_lock(&rdev->sched_lock);
> +	drm_sched_job_arm(&job->base);
=E2=80=A6
> +	drm_sched_entity_push_job(&job->base);
> +
> +	mutex_unlock(&rdev->sched_lock);
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&rdev->sched_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.11-rc7/source/include/linux/mutex.h#L1=
96

Regards,
Markus
