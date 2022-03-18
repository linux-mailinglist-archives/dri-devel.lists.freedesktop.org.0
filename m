Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AD74DD198
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 01:04:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0994289FD1;
	Fri, 18 Mar 2022 00:04:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E5E289CF6
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 00:04:20 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id r23so8533095edb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 17:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0UsWfL2d3buCfR66QbOAjKWSr57IypHJxBiVAhmGi4M=;
 b=EFcmlZxQVZdmxurMBWghVQOI5rZtJ0CxcvzDKkyvCNRIWyFwEOG91za76YnKwGchla
 Xi1Ive9X2CNoEOSbIUFvrIcLnuG6Q+OgBvCxMMKcrkX44zbHB52V5RMw7092LSlqV/aZ
 uYlseCKaHPm8mppiKMXEDwWCFGJNFOGF5bHgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0UsWfL2d3buCfR66QbOAjKWSr57IypHJxBiVAhmGi4M=;
 b=AAzooB5MsVcG/Cq5EToaJjymksKyWEfXqLPYVptL7YI3il+LjBaP3Q1MlIVljj6SGv
 uTY3hI78g5Hkt8ZAC2p52LLcY4fhSJh1igMWdCsP66LCPVgPff06dayel9p8QtZX5DYd
 jDWhWD0F/+SXVoTGVrlZotUvq8GC+3NCgCZaMzUZHMOOMayFZ/Wj8d8nv1Jf4P/5bfPV
 pvpqea8UONUIH34V+r0W3nhgaz4Bn6/7a6xd/1kqtzUHGEHfMYl8tkEdsSI51fgHk+0Y
 vGzAPcD8xMXFScQcqzYM4dlmsIIBqZgwbXurlT9HQ54EfXk3GqALiwy3WI2FAnPChy7Q
 Ktaw==
X-Gm-Message-State: AOAM5325eeNZTVeDo+Nu66m21X0wkMiMFQNmmiG8VhfY/Dw93Qqp8t2c
 3SEfKmznV234wi3SpM9eUW7lJGrvdPnenQ==
X-Google-Smtp-Source: ABdhPJxbHrSkSFPES0+LQM+0y9dS+hhc6HOY+9WRTVKJHwzZZumdXSOMAzl88QDQGdE1Ryz3c4TZvw==
X-Received: by 2002:a50:c00f:0:b0:418:d6b8:7f9a with SMTP id
 r15-20020a50c00f000000b00418d6b87f9amr7096830edb.141.1647561858353; 
 Thu, 17 Mar 2022 17:04:18 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com.
 [209.85.221.50]) by smtp.gmail.com with ESMTPSA id
 c4-20020a170906340400b006d077e850b5sm3011993ejb.23.2022.03.17.17.04.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 17:04:17 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id p9so9580603wra.12
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 17:04:17 -0700 (PDT)
X-Received: by 2002:a5d:53c6:0:b0:203:ee27:12ff with SMTP id
 a6-20020a5d53c6000000b00203ee2712ffmr3705265wrw.422.1647561857230; Thu, 17
 Mar 2022 17:04:17 -0700 (PDT)
MIME-Version: 1.0
References: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com>
 <1647452154-16361-5-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1647452154-16361-5-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 17 Mar 2022 17:04:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XUfQoYO-=BPvH4o3EWReCVckfCThYxf==T2Ff_C8TrQQ@mail.gmail.com>
Message-ID: <CAD=FV=XUfQoYO-=BPvH4o3EWReCVckfCThYxf==T2Ff_C8TrQQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/9] drm/panel-edp: add LQ140M1JW46 edp panel entry
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 quic_khsieh@quicinc.com, Andy Gross <agross@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, quic_vproddut@quicinc.com,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, quic_abhinavk@quicinc.com,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <seanpaul@chromium.org>, Sean Paul <sean@poorly.run>,
 quic_kalyant <quic_kalyant@quicinc.com>, LKML <linux-kernel@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, krzk+dt@kernel.org,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 16, 2022 at 10:37 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> Add panel identification entry for the sharp LQ140M1JW46 eDP panel
> with power sequencing delay information.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

This is trivial and going through a different tree than everything
else, so I'm just pushing it to drm-misc-next (which is setup to land
things without regard to the merge window) without sitting on it.

You can leave it out of future spins of this series.

9f493fd71d4b drm/panel-edp: add LQ140M1JW46 edp panel entry
