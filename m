Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D6B588DE1
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 15:51:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4993012B9F5;
	Wed,  3 Aug 2022 13:51:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB09D12A1E1
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Aug 2022 13:50:51 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id dc19so8875622ejb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Aug 2022 06:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=JobmQomHLtYAJ+DDomxdN8Lk7HYy1OLd4rHEITgLQdA=;
 b=OPbC8bWfgzWIie1MfD0jyh6gObqMl3sUtChiIWlKH1yMV8iPxv4ElTDcA/PzHNegar
 6Q0saDylV3e1iDeJ1byjBXOSyeKWMBGjWYRa5oQbwaeiE8Z2F7rmGUHCGcWI70WcGI+X
 +jYxrmH6tmuZkcUvlnKf2JFiqxRcT748c8QQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=JobmQomHLtYAJ+DDomxdN8Lk7HYy1OLd4rHEITgLQdA=;
 b=g1Pkj1zYTJZQmYdDx2sXvYnx08mrQskTmk2TEoFnbkVdzuwyFv7WeHCKfXNxRcXn4w
 1TC4awUrtr+17WoqnrqnEDidvpNr1CagVf+xhtYnkEtzm7vHIMjarn5PQL+Q4VIHoEE3
 us9An+AIV2tRZAgm7GYUw1DpGoWWZT4eEK/TBEXK9ZUcYN8APTnG0BRA5OTtBLhjXThW
 8Yo9ngLemfbJJgbjUsfxMNscmy+7RGhAv6bfmVqczMUPtYHYPnnyjYR1YgHpWplafzmk
 /tMFsUJ90aO96fX/A2hdr2k9Uihrdo0vP0TkOT+P6g4azBIUDKjmUToJ33TeMhNdyfYC
 fS5Q==
X-Gm-Message-State: AJIora8FYFZri8CAVSXma9Ns16dZu/Co7N3jrClNYV2C0bqW18OHxjqd
 +b3MFvLMO7zaklx4cZOPO+U8g3QGYwib/tTN
X-Google-Smtp-Source: AGRyM1sTqq41dOjy21sLmTSDvpFLH56tu0LUbtNzzh0ckujEj+FoFLKxYSp7Vc8FRBkoP+vEGIcLIA==
X-Received: by 2002:a17:907:72ca:b0:72f:1a9b:361b with SMTP id
 du10-20020a17090772ca00b0072f1a9b361bmr20796434ejc.274.1659534650036; 
 Wed, 03 Aug 2022 06:50:50 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com.
 [209.85.221.52]) by smtp.gmail.com with ESMTPSA id
 7-20020a170906328700b00722e8c47cc9sm7282971ejw.181.2022.08.03.06.50.48
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 06:50:48 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id z16so21589828wrh.12
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Aug 2022 06:50:48 -0700 (PDT)
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr16303940wrr.583.1659534647816; Wed, 03
 Aug 2022 06:50:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220802223738.898592-1-dianders@chromium.org>
 <20220802153434.v3.4.I7b3c72949883846badb073cfeae985c55239da1d@changeid>
 <232f875a-4986-300a-f1e8-18f2da3a8fc6@linaro.org>
In-Reply-To: <232f875a-4986-300a-f1e8-18f2da3a8fc6@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 3 Aug 2022 06:50:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XWxMis61zouPeAoTUC6xYz7rSUC33wdvyLii0Cd2j4Ww@mail.gmail.com>
Message-ID: <CAD=FV=XWxMis61zouPeAoTUC6xYz7rSUC33wdvyLii0Cd2j4Ww@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] drm/msm/dsi: Use the new regulator bulk feature to
 specify the load
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
Cc: Sean Paul <sean@poorly.run>, Vinod Koul <vkoul@kernel.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Mark Brown <broonie@kernel.org>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Aug 3, 2022 at 12:12 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 03/08/2022 01:37, Douglas Anderson wrote:
> > As of commit 6eabfc018e8d ("regulator: core: Allow specifying an
> > initial load w/ the bulk API") we can now specify the initial load in
> > the bulk data rather than having to manually call regulator_set_load()
> > on each regulator. Let's use it.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> It might have been better, if the previous patch had only removed the
> load_setting on disable and inlined the dsi_host_regulator_disable().
> Then this patch would drop the regulator_set_load() from
> dsi_host_regulator_enable() path and inline it. Then it would have been
> more obvious that after these two changes the time when we set loads is
> not changed.

Seems like I should post a v4 to update the commit message of the
final patch in the series, but I'm going to leave this the way it is
since the end result is the same. Originally when I wrote the series I
didn't know if the new regulator API changes would be accepted, so the
previous patch did the most cleanup it could do with the old API. ;-)

-Doug
