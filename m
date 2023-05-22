Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C986670CE5E
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 00:57:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B4810E2BD;
	Mon, 22 May 2023 22:57:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E1910E2BD
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 22:56:58 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-5617d793160so86501117b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 15:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684796218; x=1687388218;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XXcEEoSDUQBuJY5wjK6hHz3D+MpxCJ5uA+e68AM04Xg=;
 b=LOtd/cObzugR2ZdYbrOqKHIvok79/3R00GwQL+I9VwslW8sCTCzrnPLnzCo6Y/1IE5
 w8zIT5twQVE4ziaKPGghO45wQPe/Xgfd6fDg3joKBo4iAAsLF7QMBgScfE7rh1gfi1Ev
 YHUC0JK04uOo7LVDc33zCR6hVSDYHL2L72BPCrbO3l1/oFJsMXbKDY1VWQVEtzYS8p4J
 m4IJdTv3o+oYgOkjoK1dOV3PxWES70Rm9t8uXYz+S7b96B4Rz1OtBgJSi++BzGrp5CcC
 H9qmRW70CWRzUlyy4ZXXrNfLXKbrrtpV5LrNiS6GJuBtwEGPBLaWaQ/3Ycaaf6+5W1Ax
 Sapw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684796218; x=1687388218;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XXcEEoSDUQBuJY5wjK6hHz3D+MpxCJ5uA+e68AM04Xg=;
 b=ZZJ3ABHalgvizPrqOxKd64KklAnHm8Mqmf3sDAdhSaCq4Sfct6MS/NCx94qp+z4ctk
 asTK+MeNzBf8Y53GehwhBY518R9osOZrhgUIRJLJ+vWxTe6njsPrMWologidM/3S4Pnm
 kQ1iqAMPvg1AFyaTkwmOEhOCNCufzpmWWJrjoJvCCXFtXc1ANcbMuJazP2PaDeytFw3o
 xjPK3qHmT09kv0uK/8GNGGMRRX8xwncXgTNLAPTV2vm/mjJChw1ChzvU0TplfTsgPl54
 VaD2HhUm1UUV7jkUTcrg8nPjuEXhUoOD2ACOPUCEcSVnstoPsr4THlsBIxIxsiQK0C54
 y+RA==
X-Gm-Message-State: AC+VfDxs++soKyPTetwj19qyODmA34SQeWaHxI5Maaj1yr6xeq/xKytU
 BTLG2Uym3T5dFAIiVLXQLClJAGjjHz9TtupqYzJq6A==
X-Google-Smtp-Source: ACHHUZ7Ub8qC7wd7Cma8FQgO7ATYAbenBB9G3QZ2NY5Z824hncIzM8SI+FEsMKLr6dilkm7r/I6tRIbSIRoMkvNE7c4=
X-Received: by 2002:a81:5289:0:b0:55a:4840:68d with SMTP id
 g131-20020a815289000000b0055a4840068dmr12541888ywb.20.1684796217847; Mon, 22
 May 2023 15:56:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org>
 <20230521-drm-panels-sony-v1-6-541c341d6bee@somainline.org>
 <f34cd6a8-6d6d-9dcf-b681-56439416c4b4@linaro.org>
 <gzhxxdh235nsbjbns37thi33rpk546ynkihihjiam46pkngkud@opwtr2swvdau>
In-Reply-To: <gzhxxdh235nsbjbns37thi33rpk546ynkihihjiam46pkngkud@opwtr2swvdau>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 23 May 2023 01:56:46 +0300
Message-ID: <CAA8EJppniEh3cFpi=AdK-i=KZcd=tzpPru0W4Vq9LJjJL8q=qQ@mail.gmail.com>
Subject: Re: [PATCH RFC 06/10] drm/panel/samsung-sofef01: Add panel driver for
 Sony Xperia 5 / 10 II
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
Cc: dri-devel@lists.freedesktop.org, Caleb Connolly <caleb@connolly.tech>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Sam Ravnborg <sam@ravnborg.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Andy Gross <agross@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 23 May 2023 at 01:32, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2023-05-22 04:19:45, Dmitry Baryshkov wrote:
> > On 22/05/2023 00:23, Marijn Suijten wrote:
> > > This SOFEF01-M Display-IC driver supports two modes with different
> > > compatibles to differentiate between slightly different physical sizes
> > > (panels) found on the Xperia 5 (6.1") and 10 II (6.0").
> > >
> > > It is currently also used to hardcode significantly higher fake porches
> > > for the Xperia 5, which are unused in transfers due to this being a
> > > command-mode panel but do have an effect on the clock rates set by
> > > dsi_host.c.  Without higher clock rates this panel fails to achieve
> > > 60fps and has significant tearing artifacts, while the same calculated
> > > clock rate works perfectly fine on the Xperia 10 II.
>
> <snip>
>
> > > +/* Sony Xperia 5 (kumano bahamut) */
> > > +static const struct drm_display_mode samsung_sofef01_m_bahamut_mode = {
> > > +   /*
> > > +    * WARNING: These massive porches are wrong/useless for CMDmode
> > > +    * (and not defined in downstream DTS) but necessary to bump dsi
> > > +    * clocks higher, so that we can achieve proper 60fps without tearing.
> > > +    */
> > > +   .clock = (1080 + 156 + 8 + 8) * (2520 + 2393 + 8 + 8) * 60 / 1000,
> > > +   .hdisplay = 1080,
> > > +   .hsync_start = 1080 + 156,
> > > +   .hsync_end = 1080 + 156 + 8,
> > > +   .htotal = 1080 + 156 + 8 + 8,
> > > +   .vdisplay = 2520,
> > > +   .vsync_start = 2520 + 2393,
> > > +   .vsync_end = 2520 + 2393 + 8,
> > > +   .vtotal = 2520 + 2393 + 8 + 8,
> > > +   .width_mm = 61,
> > > +   .height_mm = 142,
> > > +};
> > > +
> > > +/* Sony Xperia 10 II (seine pdx201) */
> > > +static const struct drm_display_mode samsung_sofef01_m_pdx201_mode = {
> > > +   .clock = (1080 + 8 + 8 + 8) * (2520 + 8 + 8 + 8) * 60 / 1000,
> > > +   .hdisplay = 1080,
> > > +   .hsync_start = 1080 + 8,
> > > +   .hsync_end = 1080 + 8 + 8,
> > > +   .htotal = 1080 + 8 + 8 + 8,
> > > +   .vdisplay = 2520,
> > > +   .vsync_start = 2520 + 8,
> > > +   .vsync_end = 2520 + 8 + 8,
> > > +   .vtotal = 2520 + 8 + 8 + 8,
> > > +   .width_mm = 60,
> > > +   .height_mm = 139,
> > > +};
> > > +
> > > +static const struct of_device_id samsung_sofef01_m_of_match[] = {
> > > +   { .compatible = "samsung,sofef01-m-bahamut", .data = &samsung_sofef01_m_bahamut_mode },
> > > +   { .compatible = "samsung,sofef01-m-pdx201", .data = &samsung_sofef01_m_pdx201_mode },
> >
> > Are there really two panels? Can we use one mode for both usecases?
>
> See the commit description where I explained exactly this: the panels
> have different dimensions (6.1" vs 6.0", hence different DPI) and I also
> abuse this to hack in higher clock rates via fake porches.
>
> I just ended up on a scary website that supposedly contains the panel
> names:
>
> - Xperia 5 (bahamut, 6.1"): AMB609TC01
> - Xperia 10 II (pdx201, 6.0"): AMS597UT01

Great! From the patch description it was not obvious if those are two
different panels or a single panel with slight difference in the glass
cover. With these names in place (well, with two distinct names in
place) it makes sense.

-- 
With best wishes
Dmitry
