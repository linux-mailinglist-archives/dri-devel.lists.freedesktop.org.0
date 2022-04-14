Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AAD5018EA
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 18:40:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B1A510FF0E;
	Thu, 14 Apr 2022 16:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6148410FF0E
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 16:40:08 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id k23so11147483ejd.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 09:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sMT54nF1SMSOMqMYCZmgi8xN7eOCKvvK35fHMg+oHcc=;
 b=HSJ9f0E6ehW76H552h3PgIs14xn6y6HwbJiaJF0oa3iCxtOPhzg/D2glMXnfa5V7zs
 2ydypI+2zeXrr0g9B4UWfLJdZ34Qn5AYYeaah1j314JBM4begDsciAwS3BG0HazrznFc
 uoig8EHfEzKP8qEFJ3HrxOKUff/q+RBzzM2nM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sMT54nF1SMSOMqMYCZmgi8xN7eOCKvvK35fHMg+oHcc=;
 b=nOJgQo92ivvEgZQ9VJJcezsKmTojlviq58dPmRe7PkuODDcpAf1RDrWfLSHFg5guSD
 NXBOSR71WcPZVW1pAsGoqcoodTLYWAwr2YJhaqQkWJIgW99WQ9tYg2vAI/WLrweDSL/d
 gYypInFzVSOHr29hQivxMrfqctyrhEedAOjbgFWqyx//oaZ8lVrR0JjkuGG0tj7zui8t
 mn7cbBkqYOFCl5arTDJLGsX2SiN6Qganv5to2LuQ8MIAGyG7z+pO25cS9dCoHmHZpQSh
 pyiiffrCdRNRj6bfzbtV/I24Y4s3ETKT4Uzu7oezvwzpzsbkMU0mqZlwRd8/ziUcIlYp
 4sMA==
X-Gm-Message-State: AOAM530PCc3hWUAFHAx9nqN8SmIAEBMbSuI+XrqrYBRKlKdPnARXQiAj
 ndDm75mgBcG4QdtDQLi1kwEAbBirIMZR59Hj
X-Google-Smtp-Source: ABdhPJxh1KkS47CtTLwLYkrroKHI7TfVUAgNdWSiwMd2JxJCv74MFTZTpiCw27h+I/uojzlSBN4hfw==
X-Received: by 2002:a17:906:b155:b0:6c9:ea2d:3363 with SMTP id
 bt21-20020a170906b15500b006c9ea2d3363mr2985045ejb.729.1649954406454; 
 Thu, 14 Apr 2022 09:40:06 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com.
 [209.85.221.45]) by smtp.gmail.com with ESMTPSA id
 bs2-20020a056402304200b0041fc40eeb91sm1203240edb.49.2022.04.14.09.40.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 09:40:05 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id m14so7708691wrb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 09:40:05 -0700 (PDT)
X-Received: by 2002:a5d:64ce:0:b0:208:fff6:22cb with SMTP id
 f14-20020a5d64ce000000b00208fff622cbmr2751540wri.301.1649954404806; Thu, 14
 Apr 2022 09:40:04 -0700 (PDT)
MIME-Version: 1.0
References: <1649938766-6768-1-git-send-email-quic_sbillaka@quicinc.com>
 <1649938766-6768-4-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1649938766-6768-4-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 14 Apr 2022 09:39:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wv57p-A=zniSKZYStRSPby7vSE-SqZQ-JVuQsO+MbK+A@mail.gmail.com>
Message-ID: <CAD=FV=Wv57p-A=zniSKZYStRSPby7vSE-SqZQ-JVuQsO+MbK+A@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] drm/msm/dp: wait for hpd high before aux
 transaction
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Sean Paul <seanpaul@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Apr 14, 2022 at 5:20 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> The source device should ensure the sink is ready before proceeding to
> read the sink capability or perform any aux transactions. The sink
> will indicate its readiness by asserting the HPD line. The controller
> driver needs to wait for the hpd line to be asserted by the sink before
> it performs any aux transactions.
>
> The eDP sink is assumed to be always connected. It needs power from the
> source and its HPD line will be asserted only after the panel is powered
> on. The panel power will be enabled from the panel-edp driver and only
> after that, the hpd line will be asserted.
>
> Whereas for DP, the sink can be hotplugged and unplugged anytime. The hpd
> line gets asserted to indicate the sink is connected and ready. Hence
> there is no need to wait for the hpd line to be asserted for a DP sink.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---

It might be worth mentioning "after the cut" that we may eventually
end up changing the rules if people like my proposal [1]. However,
what your code is doing here for eDP is correct as things are
currently intended to work and it would make sense to land it while we
debate about whether we want to add the is_hpd_asserted() callback
like my patch does.

[1] https://lore.kernel.org/r/20220408193536.RFC.3.Icf57bb12233a47727013c6ab69eebf803e22ebc1@changeid/


> Changes in v7:
>   - add a comment to say why the wait si done for eDP
>   - correct the commit text
>
> Changes in v6:
>   - Wait for hpd high only for eDP
>   - Split into smaller patches
>
>  drivers/gpu/drm/msm/dp/dp_aux.c     | 21 ++++++++++++++++++++-
>  drivers/gpu/drm/msm/dp/dp_aux.h     |  3 ++-
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 13 +++++++++++++
>  drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
>  drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
>  5 files changed, 37 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> index 6d36f63..cf0739f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -36,6 +36,7 @@ struct dp_aux_private {
>         bool initted;
>         u32 offset;
>         u32 segment;
> +       bool is_edp;

Kinda nitty, but can you put it next to the other booleans? This will
help with structure packing.


>         struct drm_dp_aux dp_aux;
>  };
> @@ -337,6 +338,22 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
>                 goto exit;
>         }
>
> +       /*
> +        * For eDP it's important to give a reasonably long wait here for HPD
> +        * to be asserted. This is because the panel driver may have _just_
> +        * turned on the panel and then tried to do an AUX transfer. The panel
> +        * driver has no way of knowing when the panel is ready, so it's up
> +        * to us to wait. For DP we never get into this situation so let's
> +        * avoid ever doing the extra long wait for DP.
> +        */
> +       if (aux->is_edp) {
> +               ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog);
> +               if (ret) {
> +                       DRM_DEBUG_DP("Panel not ready for aux transactions\n");
> +                       goto exit;
> +               }
> +       }
> +
>         dp_aux_update_offset_and_segment(aux, msg);
>         dp_aux_transfer_helper(aux, msg, true);
>
> @@ -491,7 +508,8 @@ void dp_aux_unregister(struct drm_dp_aux *dp_aux)
>         drm_dp_aux_unregister(dp_aux);
>  }
>
> -struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog)
> +struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog,
> +                               bool is_edp)

nit: I think indentation rules for this file are that the type of the
argument for the 2nd line should line up right under the 1st. Thus you
should delete one tab character and insert 6 spaces before the "bool".

Similar in other places, like your header file.


Stuff above is all nits and this looks right to me. I'm happy with:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
