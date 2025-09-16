Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E34B59CD8
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 18:04:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 636C810E110;
	Tue, 16 Sep 2025 16:04:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="elDbqYYt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2012A10E110
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 16:04:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 3F96AC8F462;
 Tue, 16 Sep 2025 16:04:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7A4066061E;
 Tue, 16 Sep 2025 16:04:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8BA90102F17AD; 
 Tue, 16 Sep 2025 18:04:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1758038676; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=P0fHfaim/HxGgy6ytMRt2/vtoxjkypDzQwdM+C1DBwA=;
 b=elDbqYYtqyeNzXfOqXZqcXEQ0oPEniTdP+uNCXMrcDyg40LHzXv9zpec3/QfRAnh7E2zZr
 GI/wvHXLKI1Wf75+r6aSUOpnLQa+gLLUH/uKpwjmGrnigzal67HVLXr4H4+/tvhqWrHcko
 vzOJVUjuUjECocWNaRO1xrRn0GFQAP7vTRrSXTLbCMlklPikcKc+kzEGKLLpotCzTOjpih
 xPmCcnX7gWvMyZHMrFNPhm39kGje8lowND9XrFmu0TsZpYJ4h5yKura1/9qlG988BaE58Z
 ws7aCEXGGbwtPhDPJvwBP0RdcOY1bXaPzmMpXRn3/YxVit1Ibtwo0Fc7UDkyYA==
Date: Tue, 16 Sep 2025 18:04:18 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Thierry Reding
 <treding@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Jonathan
 Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni
 <skomatineni@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Prashant Gaikwad
 <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Osipenko
 <digetx@gmail.com>, Jonas =?UTF-8?B?U2Nod8O2YmVs?=
 <jonasschwoebel@yahoo.de>, Charan Pedumuru <charan.pedumuru@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 11/23] staging: media: tegra-video: csi: add a check
 to tegra_channel_get_remote_csi_subdev
Message-ID: <20250916180418.3fa270a9@booty>
In-Reply-To: <20250906135345.241229-12-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
 <20250906135345.241229-12-clamor95@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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

Hello Svyatoslav,

On Sat,  6 Sep 2025 16:53:32 +0300
Svyatoslav Ryhel <clamor95@gmail.com> wrote:

> By default tegra_channel_get_remote_csi_subdev returns next device in pipe
> assuming it is CSI but in case of Tegra20 and Tegra30 it can also be VIP
> or even HOST. Lets check if returned device is actually CSI by comparing
> subdevice operations.

This is just for extra safety, or is there a real case where the lack
of this check creates some issues in your use case?

> --- a/drivers/staging/media/tegra-video/csi.c
> +++ b/drivers/staging/media/tegra-video/csi.c
> @@ -445,6 +445,22 @@ static const struct v4l2_subdev_ops tegra_csi_ops = {
>  	.pad    = &tegra_csi_pad_ops,
>  };
>  
> +struct v4l2_subdev *tegra_channel_get_remote_csi_subdev(struct tegra_vi_channel *chan)
> +{
> +	struct media_pad *pad;
> +	struct v4l2_subdev *subdev;
> +
> +	pad = media_pad_remote_pad_first(&chan->pad);
> +	if (!pad)
> +		return NULL;
> +
> +	subdev = media_entity_to_v4l2_subdev(pad->entity);
> +	if (!subdev)
> +		return NULL;
> +
> +	return subdev->ops == &tegra_csi_ops ? subdev : NULL;
> +}

I tested your series on a Tegra20 with a parallel camera, so using the
VIP for parallel input.

The added check on subdev->ops breaks probing the video device:

  tegra-vi 54080000.vi: failed to setup channel controls: -19
  tegra-vi 54080000.vi: failed to register channel 0 notifier: -19

This is because tegra20_chan_capture_kthread_start() is also calling
tegra_channel_get_remote_csi_subdev(), but when using VIP subdev->ops
points to tegra_vip_ops, not tegra_csi_ops.

Surely the "csi" infix in the function name here is misleading. At
quick glance I don't see a good reason for its presence however, as the
callers are not CSI-specific.

If such quick analysis is correct, instead of this diff we should:
 * not move the function out of vi.c
 * rename the function toremove the "_csi" infix
 * if a check is really needed (see comment above), maybe extend it:
   return (subdev->ops == &tegra_csi_ops ||
           subdev->ops == &tegra_vip_ops) ? subdev : NULL;

Let me know your thoughts.

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
