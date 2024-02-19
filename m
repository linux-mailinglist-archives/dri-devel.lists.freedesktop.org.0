Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B80B85AA4F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 18:49:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C06E10E0F2;
	Mon, 19 Feb 2024 17:49:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="h4sRlf5z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06C8F10E0F2;
 Mon, 19 Feb 2024 17:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1708364915; x=1708969715; i=markus.elfring@web.de;
 bh=hPupRt57+r+Pl0dfVnsjq1GsNhHpCJ6eXReICe+eDDo=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:
 In-Reply-To;
 b=h4sRlf5zIV+QWDila5ohfglWmS12NfxX6Wx6NvhudyKq05oHZRWmmvB+yQAl/USd
 s/hF88fZLogXlVoPr9rYZcV6U1BvLPtgrwOs3I0XIdBFv8XpCNCNY3EEijkJj1DzY
 5VvHfB+6tRpIy0Tq9+g7oAj5CiRYslmyzxurJVIsHN3Kc9uYA8tBa3N1Mp5L6Y/wr
 oucP7TurufLy2QMHeMn/SgfhJjg31IVk1/FHtcdSB/Axxv9EWjjleNaSPrJeU4eX5
 oZ7w/z6ZtPYAINIoef5Lp0bfUVTHb8xQlzM7tiiHXC7yK1h1ujvgMvoDn/CvIgI7W
 Yu6xFw2F9eBfP/W1YQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.80.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M2xrs-1rfQbv2m5c-003JhM; Mon, 19
 Feb 2024 18:48:35 +0100
Message-ID: <c95f5ff3-8dad-4302-9384-92a9b83f7bdc@web.de>
Date: Mon, 19 Feb 2024 18:48:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Johan Hovold <johan+linaro@kernel.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Bjorn Andersson <andersson@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Vinod Koul <vkoul@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Rob Clark <robdclark@gmail.com>
References: <20240217150228.5788-2-johan+linaro@kernel.org>
Subject: Re: [PATCH 1/6] drm/bridge: aux-hpd: fix OF node leaks
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240217150228.5788-2-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1qY8TG6XGBPBySkXD9Iw+B/jMk+ITC9FUkKiHaIFz/AtRCFm3X8
 A2bG3gibnYIc7UfT5py0ZV3IHcRAAwqod7yJen0dD22Od/rMMXKMtv4O3ehHFd6NK1O47oF
 2FKhSK+MFr0qgPhK4sp6Gvv75D7So3Dsd6VTfJ4FGrbLdu71hXEBz4h4bEnOqoDzSyVLUQM
 FFo2segx5J963ehK0Nyqg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Vt1j2p9N3tU=;Y5Fkv24B75ZRsEO6v+JeViz6QDS
 Z0Qr1vSndEAhOcBQzzzF9Hc+zTH8Lh5ACQIDs7Em43y0RsMfANmO66fe8KzHagSpTU3nCS9yw
 seqRMXtdrL7zS+FYfxRWVQMh2n+AW0LD8yuU/LvcAOqSzpZuAxCp9sB894cWb6Vs/KQwhcvix
 0c0MCspFvzytZ8Z/VmjJpOa6U7u79EUFZbSTMcXdtOidhEyGaXoD1ed1lSk72ZHY4WrxBcoIG
 AQDpd7AAX8XoGPbGzDh8DSIIf76R1xfHsRz/IWtBKre8C5hyOZibsT6rlCWZf1Hn4OY8nyGe8
 0R7jtfGDhFTNaLob/euJ4Xouo1S6JDEo6roUqqRQhLm+eihsK/1yoocr3e4TN5EfooNR/mqlb
 JU0s2ZXbFHxS1HxFt10qTR2Q3UBDpjnHxaf0nc6H7jpfWpYApArkm5d6/CArQHWMYRyHggilo
 NOJYAzpbA7OAaB9NNxId1wvcwZvrTgkzAeabC2c5HsL0UzNsbWqKbMMceESmfn72wOIfsQIsP
 L1S6NcAESVAnTYRBVYmDfWpuRiWfiWzh6aw9JFeF6HLm6Y4ajY/9ve+rE1vwM2zw9Na/oA3vn
 fbfuZnuDVcd6HgPLX6VmhUXnUzA/O+87vE3/mjhRZ30qPnFNmB7/gDo+4lkRApUIZ+Y5SsU8T
 C/RmhXE33yy5bOoTU1jR3W+iZ1ylFub+AO8utosVVJ5xfLspRIaoR6ptLogpbtO8A+duLEl5g
 BTecZA4H8EdbrwYdstFYfumSnHWDkijS5WNqggvyMOhheue05/XZGimtzonJucoBOFIY89JRK
 mjveQA3OLbiH8J7EvTIIAlcAE3cn0wtcE7uXKqhPCSnq8=
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

> The two device node references taken during allocation need to be
> dropped when the auxiliary device is freed.
=E2=80=A6
> +++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
=E2=80=A6
> @@ -74,6 +75,8 @@ struct device *drm_dp_hpd_bridge_register(struct devic=
e *parent,
>
>  	ret =3D auxiliary_device_init(adev);
>  	if (ret) {
> +		of_node_put(adev->dev.platform_data);
> +		of_node_put(adev->dev.of_node);
>  		ida_free(&drm_aux_hpd_bridge_ida, adev->id);
>  		kfree(adev);
>  		return ERR_PTR(ret);

The last two statements are also used in a previous if branch.
https://elixir.bootlin.com/linux/v6.8-rc5/source/drivers/gpu/drm/bridge/au=
x-hpd-bridge.c#L63

How do you think about to avoid such a bit of duplicate source code
by adding a label here?

Regards,
Markus
