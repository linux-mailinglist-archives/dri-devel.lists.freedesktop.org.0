Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 199B15F45DD
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 16:46:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7284610E03C;
	Tue,  4 Oct 2022 14:46:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CDD410E70C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 14:46:02 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id j7so17035073ybb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Oct 2022 07:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=9dr7qJ7Qml93GSKT3iv83T/pfmaFSKB83Wj12OdpTQ8=;
 b=BQUx0AnFkzWaEdyMHn06vsVqq+yQguDgxDoorjEzwbCeIhb79FOsXeaumiJird5sbr
 2g/PeBB9u87eoalbUaukckm53a5qp3qdr5tb27Dbc0Pib/XrQrrbSd+be50cvo4aY8FZ
 bqpZ1QIMsyoCXGebe/HmBUfWDjYnU1huyVBw0DUZgiEN2RA/kMimiTBnPSUHWKNpehEa
 X+N4ebBwrfiOX4Zbph+suwdKVXRHYowi56Bq/I1heGJ3QFnECihqOdBXggwWPe2Sq5rL
 zBwqXVTLPedYXauuUC3MWxR/C3R9UJGcUkb4cFFCFchDZ+7oFMXCfYCV0vG9L/9te7sn
 NNlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=9dr7qJ7Qml93GSKT3iv83T/pfmaFSKB83Wj12OdpTQ8=;
 b=ntbInxWiX6gUE1nKN0JWuCsKVaUQJ2eKzVNe7KS2b4ACDpg+Sv2m/0rvlSJ88l6nAn
 iqF5nwNKEYaNzTVfxNUywePvZNUeqyF2n+zuSGxTUI2kz0CKa4nUpRNJ6iOAQck10WnI
 lc77XYX2KC6vu8gZI4huzpU+7ZjddjkihgdjBAVh6bdYADD66/50gjHPXH7i8aJJl+/G
 phyCwSCNKnT98uFXSI0ircto6kqCpGf+LxdJr0EpuK2ygNwXch6WhPwDIbH1SChBhxyq
 C9iBzF37Psd/4JzX0rpxs9f+n6Xi7Jl5yabVN1LyFj4Q7DXGvMOauPoDvE8E7UuX9vwp
 VO4g==
X-Gm-Message-State: ACrzQf3TZhvYCMkv7ovzhuF2rjb1dEqwQ7A8oi67jeCtlo+h3pGd/yoU
 oQR0fv0IckCEtWos7Hi1nUWwVfhJmiqlvdPPC7aY0A==
X-Google-Smtp-Source: AMsMyM4GlEKH++HoB5HPsS9oEYIc89cjO+AgKYwLjkK0bJ21xdnrimtiaSFkoCg2fZuKNZ0WWx6CCLoFq3t7mgRVYEc=
X-Received: by 2002:a5b:c:0:b0:6bd:f84c:b63e with SMTP id
 a12-20020a5b000c000000b006bdf84cb63emr7242772ybp.275.1664894761093; 
 Tue, 04 Oct 2022 07:46:01 -0700 (PDT)
MIME-Version: 1.0
References: <20221001190807.358691-1-marijn.suijten@somainline.org>
 <20221001190807.358691-4-marijn.suijten@somainline.org>
In-Reply-To: <20221001190807.358691-4-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 4 Oct 2022 17:45:50 +0300
Message-ID: <CAA8EJppYJ-PYCsaKn=sGDpnJJdW2QBx=MOqUr6qzY0bAZtpGxA@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/msm/dsi: Account for DSC's bits_per_pixel having
 4 fractional bits
To: Marijn Suijten <marijn.suijten@somainline.org>
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
Cc: David Airlie <airlied@linux.ie>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, Marek Vasut <marex@denx.de>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 1 Oct 2022 at 22:08, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> drm_dsc_config's bits_per_pixel field holds a fractional value with 4
> bits, which all panel drivers should adhere to for
> drm_dsc_pps_payload_pack() to generate a valid payload.  All code in the
> DSI driver here seems to assume that this field doesn't contain any
> fractional bits, hence resulting in the wrong values being computed.
> Since none of the calculations leave any room for fractional bits or
> seem to indicate any possible area of support, disallow such values
> altogether.
>
> Fixes: b9080324d6ca ("drm/msm/dsi: add support for dsc data")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 34 +++++++++++++++++++++++-------
>  1 file changed, 26 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index cb6f2fa11f58..42a5c9776f52 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -847,6 +847,11 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>         u32 pkt_per_line;
>         u32 bytes_in_slice;
>         u32 eol_byte_num;
> +       int bpp = dsc->bits_per_pixel >> 4;
> +
> +       if (dsc->bits_per_pixel & 0xf)
> +               /* dsi_populate_dsc_params() already caught this case */
> +               pr_err("DSI does not support fractional bits_per_pixel\n");
>
>         /* first calculate dsc parameters and then program
>          * compress mode registers
> @@ -860,7 +865,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>         if (slice_per_intf > dsc->slice_count)
>                 dsc->slice_count = 1;
>
> -       bytes_in_slice = DIV_ROUND_UP(dsc->slice_width * dsc->bits_per_pixel, 8);
> +       bytes_in_slice = DIV_ROUND_UP(dsc->slice_width * bpp, 8);


bytes_in_slice = DIV_ROUND_UP(dsc->slice_width * dsc->bits_per_pixel, 8 * 16); ?

>
>         dsc->slice_chunk_size = bytes_in_slice;
>
> @@ -913,6 +918,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>         u32 va_end = va_start + mode->vdisplay;
>         u32 hdisplay = mode->hdisplay;
>         u32 wc;
> +       int ret;
>
>         DBG("");
>
> @@ -948,7 +954,9 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>                 /* we do the calculations for dsc parameters here so that
>                  * panel can use these parameters
>                  */
> -               dsi_populate_dsc_params(dsc);
> +               ret = dsi_populate_dsc_params(dsc);
> +               if (ret)
> +                       return;
>
>                 /* Divide the display by 3 but keep back/font porch and
>                  * pulse width same
> @@ -1229,6 +1237,10 @@ static int dsi_cmd_dma_add(struct msm_dsi_host *msm_host,
>         if (packet.size < len)
>                 memset(data + packet.size, 0xff, len - packet.size);
>
> +       if (msg->type == MIPI_DSI_PICTURE_PARAMETER_SET)
> +               print_hex_dump(KERN_DEBUG, "ALL:", DUMP_PREFIX_NONE,
> +                               16, 1, data, len, false);
> +
>         if (cfg_hnd->ops->tx_buf_put)
>                 cfg_hnd->ops->tx_buf_put(msm_host);
>
> @@ -1786,6 +1798,12 @@ static int dsi_populate_dsc_params(struct drm_dsc_config *dsc)
>         int data;
>         int final_value, final_scale;
>         int i;
> +       int bpp = dsc->bits_per_pixel >> 4;
> +
> +       if (dsc->bits_per_pixel & 0xf) {
> +               pr_err("DSI does not support fractional bits_per_pixel\n");
> +               return -EINVAL;
> +       }
>
>         dsc->rc_model_size = 8192;
>         dsc->first_line_bpg_offset = 12;
> @@ -1807,7 +1825,7 @@ static int dsi_populate_dsc_params(struct drm_dsc_config *dsc)
>         }
>
>         dsc->initial_offset = 6144; /* Not bpp 12 */
> -       if (dsc->bits_per_pixel != 8)
> +       if (bpp != 8)
>                 dsc->initial_offset = 2048;     /* bpp = 12 */
>
>         mux_words_size = 48;            /* bpc == 8/10 */
> @@ -1830,16 +1848,16 @@ static int dsi_populate_dsc_params(struct drm_dsc_config *dsc)
>          * params are calculated
>          */
>         groups_per_line = DIV_ROUND_UP(dsc->slice_width, 3);
> -       dsc->slice_chunk_size = dsc->slice_width * dsc->bits_per_pixel / 8;
> -       if ((dsc->slice_width * dsc->bits_per_pixel) % 8)
> +       dsc->slice_chunk_size = dsc->slice_width * bpp / 8;
> +       if ((dsc->slice_width * bpp) % 8)

One can use fixed point math here too:

dsc->slice_chunk_size = (dsc->slice_width * dsc->bits_per_pixel  + 8 *
16 - 1)/ (8 * 16);

>                 dsc->slice_chunk_size++;
>
>         /* rbs-min */
>         min_rate_buffer_size =  dsc->rc_model_size - dsc->initial_offset +
> -                               dsc->initial_xmit_delay * dsc->bits_per_pixel +
> +                               dsc->initial_xmit_delay * bpp +
>                                 groups_per_line * dsc->first_line_bpg_offset;
>
> -       hrd_delay = DIV_ROUND_UP(min_rate_buffer_size, dsc->bits_per_pixel);
> +       hrd_delay = DIV_ROUND_UP(min_rate_buffer_size, bpp);
>
>         dsc->initial_dec_delay = hrd_delay - dsc->initial_xmit_delay;
>
> @@ -1862,7 +1880,7 @@ static int dsi_populate_dsc_params(struct drm_dsc_config *dsc)
>         data = 2048 * (dsc->rc_model_size - dsc->initial_offset + num_extra_mux_bits);
>         dsc->slice_bpg_offset = DIV_ROUND_UP(data, groups_total);
>
> -       target_bpp_x16 = dsc->bits_per_pixel * 16;
> +       target_bpp_x16 = bpp * 16;
>
>         data = (dsc->initial_xmit_delay * target_bpp_x16) / 16;

It looks like this can be replaced with the direct multiplication
instead, maybe with support for overflow/rounding.

>         final_value =  dsc->rc_model_size - data + num_extra_mux_bits;
> --
> 2.37.3
>


-- 
With best wishes
Dmitry
