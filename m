Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A25FD588DF6
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 15:54:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6DA318BE54;
	Wed,  3 Aug 2022 13:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2621118BD95
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Aug 2022 13:54:01 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id z22so21558614edd.6
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Aug 2022 06:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=0kFvvVa1Ry8lFNFwqRcLz5HfPPFKIoO5GClVTFVHKAo=;
 b=Pm+xw36k75MgbBYWtIlvzPVrEx1sxmMi8PhC7QjORA4TpioAt1Y653gXwcZnqM9GAJ
 uRV1XrvItB7XOV23G8z6Tztth/UWRNpO9yBmRRYZxXJI+jL2XiuM4cAujb2TzKuEofAQ
 AScoKYAzpWNkClXatjzcWb6M+Nhj0lckjKEBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=0kFvvVa1Ry8lFNFwqRcLz5HfPPFKIoO5GClVTFVHKAo=;
 b=gd34PS6hLPeE2crBGM9OfY+LdTAMYGx/7cNaM3nZ39HVJHSv5J9LcVmhCDnC/fUdCn
 WWO9y+ZzP+YmqD1DsQBq4IzwaA9WzbsDgwnjkA+rsH1YEjTQ/KssUkQ8JFK+1vIxZqPA
 BV59RmBR/lt2UXJiewGEwofT9KmAjOcsqh6Ke0vYu+UCdnKFAQRqYLPp5cAMs+ZCSZKV
 oq9c733F5+0E17jB5TIt2gzHVLK56y84kC9YQAVnl9rKkymLE0/5vURMRKWVpA08GGQp
 3YazWi7gVE+/LQ3Jf27T4zTK64lijjj4IVq0+1bwhNPtS5crLO+0gBfNDqxfmYQ4v125
 RE+w==
X-Gm-Message-State: ACgBeo1cfn/arU+D0WrQw/aO47ryhWOdy3GG2CXjMwPGIoHQHFDhoDZq
 h8quiMnjRsL+AAmq1emuEqJNGUgj3J4wpYz0
X-Google-Smtp-Source: AA6agR66mXsDnugDMu0sc3Lmxy+9boB+8+KEsG/0UHPFEVBA3dVztC/FAEN3vZ1fd76PGMa1KUBXWQ==
X-Received: by 2002:aa7:c14e:0:b0:43d:7bad:b53e with SMTP id
 r14-20020aa7c14e000000b0043d7badb53emr17414612edp.353.1659534839080; 
 Wed, 03 Aug 2022 06:53:59 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com.
 [209.85.128.52]) by smtp.gmail.com with ESMTPSA id
 f23-20020a05640214d700b0043cb4db0012sm9490562edx.77.2022.08.03.06.53.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 06:53:57 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id
 r1-20020a05600c35c100b003a326685e7cso1757318wmq.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Aug 2022 06:53:56 -0700 (PDT)
X-Received: by 2002:a05:600c:1549:b0:3a3:2aa2:6f60 with SMTP id
 f9-20020a05600c154900b003a32aa26f60mr2974636wmg.57.1659534836576; Wed, 03 Aug
 2022 06:53:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220802223738.898592-1-dianders@chromium.org>
 <20220802153434.v3.5.I55a9e65cb1c22221316629e98768ff473f47a067@changeid>
 <228e5e34-6467-a75b-129d-2b37b32acf13@linaro.org>
In-Reply-To: <228e5e34-6467-a75b-129d-2b37b32acf13@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 3 Aug 2022 06:53:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XRM=KvnBGwgOLtfAEcAejPkQ8M9TFQGuu+832zR8z1nA@mail.gmail.com>
Message-ID: <CAD=FV=XRM=KvnBGwgOLtfAEcAejPkQ8M9TFQGuu+832zR8z1nA@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] drm/msm/dsi: Take advantage of
 devm_regulator_bulk_get_const()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jonathan Marek <jonathan@marek.ca>, Sireesh Kodali <sireeshkodali1@gmail.com>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 Mark Brown <broonie@kernel.org>, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Aug 3, 2022 at 12:19 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 03/08/2022 01:37, Douglas Anderson wrote:
> > As of the commit 1de452a0edda ("regulator: core: Allow drivers to
> > define their init data as const") we no longer need to do copying of
> > regulator bulk data from initdata to something dynamic. Let's take
> > advantage of that.
> >
> > In addition to saving some code, this also moves us to using
> > ARRAY_SIZE() to specify how many regulators we have which is less
> > error prone.
> >
> > This gets rid of some layers of wrappers which makes it obvious that
> > we can get rid of an extra error print.
> > devm_regulator_bulk_get_const() prints errors for you so you don't
> > need an extra layer of printing.
> >
> > In all cases here I have preserved the old settings without any
> > investigation about whether the loads being set are sensible. In the
> > cases of some of the PHYs if several PHYs in the same file used
> > exactly the same settings I had them point to the same data structure.
> >
> > NOTE: Though I haven't done the math, this is likely an overall
> > savings in terms of "static const" data. We previously always
> > allocated space for 8 supplies. Each of these supplies took up 36
> > bytes of data (32 for name, 4 for an int).
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Ah, so to array conversion is already done. That's great.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
>
> > ---
> >
> > Changes in v3:
> > - Do all the PHYs too.
>
> It would have been easier if DSI and DSI PHY were split to separate patches.

One of the earlier patches in the series (where we remove the
"disable" load) was harder to split since the DSI and DSI PHY code was
sharing a single data structure. Once I had one patch touching both at
the same time I figured I'd keep them all like that. If you need me to
rework them to be separate patches to make it easier to land then
please yell. Otherwise I'll assume it's OK.

-Doug
