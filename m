Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D2C5A5DCA
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 10:11:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 597B110EAE9;
	Tue, 30 Aug 2022 08:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC2810EAE9
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 08:11:15 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id s11so13094301edd.13
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 01:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=fF0F3OYElqiJ53mOWS2AL4qmvq01DykDqlv2QChjd7g=;
 b=CzT/IQv7gIVrM71VDnXPNhL10sVQ2eUR0MHqENslzwNedOPhq/reWqCs2XyNtxxZc+
 09hE41ikqlI9fAL2+O22OJZ8I7UBrqLO2ofhMISbkSWo57EXqcsZCFGMO4lqdzxHeLgS
 sImQjaRz6cCmdNbS0laz6bbe3+3tw/zCaFZptsMGG0HZy2abJzxP26ymxEvPKyDPrJXa
 1EN8U2X3ZbKkdwnJNULDab2vUNVhmuj1qbmGNXs3g+gUdHUOf9m4iBi9/S4KYHomjFeD
 Te8jiPbJxU67i6RL+9TDxBSIJR3NWKHC9cYxz91qW5AxoZpXDWiwe4A4Uj9XwvG46jns
 iEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=fF0F3OYElqiJ53mOWS2AL4qmvq01DykDqlv2QChjd7g=;
 b=k2ZyRQSClYetnXT63g7Sq2ac34LF+s3LTHfmvM+QzuBEFks4NzSjQIBrYIdSlom+L2
 FU7rAn+Zk9A37EoCcSEQVQ78xDLSp7CpxGesj0x26cJ8sjZFk9hksLviVhaHoquoATmF
 JcL7+kBpk2Kh9cI0KLwQcnJJhMzgqxb1P6OJYs5hDtnwjChH247hDFzYXu42JUKe/4qi
 4E50jYWr4DI4udZVdixxlrLiCeH8BaUMEspu+YshobgOsuJP8LbmtzaPmbZOcmJUfHke
 /c8PoxML+zknyvmOY5NoL1+/STW2BAVjExvpgdQ4PJ8ktLUIHEiyV6Aw19iOiu3Ikrld
 ZFIg==
X-Gm-Message-State: ACgBeo0bS8kx6alppwjztd62OaHL3V7H8IbCPwdVHdjEj0Pj2o0cJUDc
 TmL5yqZgteEdW0H1QcaGT2Wgv93TvtQ4pzjqJqP2dA==
X-Google-Smtp-Source: AA6agR7wcsvJt7cWbQfr58ltQz1nqA2WxVpk4pe5C09l6YNxCdtMXZvU+pXR0hNwmstqf0n6DYqJ1xHU4O3UpqLiN7c=
X-Received: by 2002:aa7:d846:0:b0:447:d664:8409 with SMTP id
 f6-20020aa7d846000000b00447d6648409mr15730188eds.159.1661847073970; Tue, 30
 Aug 2022 01:11:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220830073450.1897020-1-zheyuma97@gmail.com>
In-Reply-To: <20220830073450.1897020-1-zheyuma97@gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 30 Aug 2022 10:11:01 +0200
Message-ID: <CAG3jFyuQOb8gM0=86sUDXVjRiBw+3R3fCxc-E2X+=KnLaoQrKA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: megachips: Fix a null pointer dereference
 bug
To: Zheyu Ma <zheyuma97@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: martyn.welch@collabora.co.uk, narmstrong@baylibre.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, peter.senna@gmail.com,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 martin.donnelly@ge.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 30 Aug 2022 at 09:35, Zheyu Ma <zheyuma97@gmail.com> wrote:
>
> When removing the module we will get the following warning:
>
> [   31.911505] i2c-core: driver [stdp2690-ge-b850v3-fw] unregistered
> [   31.912484] general protection fault, probably for non-canonical address 0xdffffc0000000001: 0000 [#1] PREEMPT SMP KASAN PTI
> [   31.913338] KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
> [   31.915280] RIP: 0010:drm_bridge_remove+0x97/0x130
> [   31.921825] Call Trace:
> [   31.922533]  stdp4028_ge_b850v3_fw_remove+0x34/0x60 [megachips_stdpxxxx_ge_b850v3_fw]
> [   31.923139]  i2c_device_remove+0x181/0x1f0
>
> The two bridges (stdp2690, stdp4028) do not probe at the same time, so
> the driver does not call ge_b850v3_resgiter() when probing, causing the
> driver to try to remove the object that has not been initialized.
>
> Fix this by checking whether both the bridges are probed.
>
> Fixes: 11632d4aa2b3 ("drm/bridge: megachips: Ensure both bridges are probed before registration")
> Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
> ---
> Changes in v2:
>     - Alignment format
> ---
>  drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> index cce98bf2a4e7..72248a565579 100644
> --- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> +++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> @@ -296,7 +296,9 @@ static void ge_b850v3_lvds_remove(void)
>          * This check is to avoid both the drivers
>          * removing the bridge in their remove() function
>          */
> -       if (!ge_b850v3_lvds_ptr)
> +       if (!ge_b850v3_lvds_ptr ||
> +           !ge_b850v3_lvds_ptr->stdp2690_i2c ||
> +               !ge_b850v3_lvds_ptr->stdp4028_i2c)
>                 goto out;
>
>         drm_bridge_remove(&ge_b850v3_lvds_ptr->bridge);
> --
> 2.25.1
>

Applied to drm-misc-next.
