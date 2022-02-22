Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0570F4C01FB
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 20:25:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F5510E339;
	Tue, 22 Feb 2022 19:25:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F41A10E339
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 19:25:54 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id d10so45991132eje.10
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 11:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sxPYkxQ6mY3MfEsJx+8iE64/URTY/HAr2HMcmjeViMQ=;
 b=V83V6RXAXvourhNVZvf2jgxzgWgbvwcqNI4r4pat82eR93ldTr1f7UnyLwwf2qycr7
 a0xsJu4B7LJ0a8fb9YtI8NKspnKLSg3ZkC5edbZCl0z9GiEPzizCh1VTsL6b55uhFAT8
 5XLvUxqQKyaIUvk9UTZ0CbvKc9mBw+5pp329s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sxPYkxQ6mY3MfEsJx+8iE64/URTY/HAr2HMcmjeViMQ=;
 b=DVO/VuVaOm4h2i95en7GF9CVijCPBFFDdjkp9gU//iYzdIWmlN2c1y8fdRHgALYerQ
 5aLGJuqUv8kB7WRAW8mLV68YPQskMSF4CgefhQD9s/4HvR+3aXvnXzJVvUmmOdrpBL//
 /TVCxZ0h8jpkfkDcUslyIFI3a0s6SU3vSJRiyUitpFj5frt3N7d8CC/rmNYfgUUWulbn
 0huVvIIx1dOEpQiKCGJPeiCbGrPlq/pL3Zn0kccxbDVbyskz/Ayt5IHa34t6rKc3LebL
 0Hd5wdjuLzpEq/E56Z25KjyDh9fgVBFugxQ9zYYy+L7uaXNB7/8zfdKcZprrFfXfnhLH
 QgIw==
X-Gm-Message-State: AOAM530IFQHVNbLKW1LtQkR4qiitreFDyCiHuo/QM3lOXCVKR1vSt3JI
 cB4BsYDJVpsBbIKkhGuERNERmo1q+hcbIYBU
X-Google-Smtp-Source: ABdhPJxUXY18ZIGeGueMQA6I7WituXohZDmS2Os3FxtVw9nb7NRdBiDEaV91mOCLyzDruuuAghC9CA==
X-Received: by 2002:a17:906:9711:b0:6bd:181b:a5a4 with SMTP id
 k17-20020a170906971100b006bd181ba5a4mr21026975ejx.98.1645557952470; 
 Tue, 22 Feb 2022 11:25:52 -0800 (PST)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com.
 [209.85.221.44])
 by smtp.gmail.com with ESMTPSA id q16sm6213414ejc.21.2022.02.22.11.25.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 11:25:51 -0800 (PST)
Received: by mail-wr1-f44.google.com with SMTP id v21so93745wrv.5
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 11:25:51 -0800 (PST)
X-Received: by 2002:adf:e4c2:0:b0:1e3:3e5d:bd65 with SMTP id
 v2-20020adfe4c2000000b001e33e5dbd65mr21065461wrm.422.1645557950867; Tue, 22
 Feb 2022 11:25:50 -0800 (PST)
MIME-Version: 1.0
References: <1645455086-9359-1-git-send-email-quic_vpolimer@quicinc.com>
 <1645455086-9359-2-git-send-email-quic_vpolimer@quicinc.com>
 <CAA8EJppRUZ5OHSMS1NdFXDDvRXJFNsdoJDWgU7ZPUoAW9OD+eQ@mail.gmail.com>
In-Reply-To: <CAA8EJppRUZ5OHSMS1NdFXDDvRXJFNsdoJDWgU7ZPUoAW9OD+eQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 22 Feb 2022 11:25:37 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W2wi47egKmWDS+BZGSy85K+A8jX0gvi6CYhmFgoBBRmw@mail.gmail.com>
Message-ID: <CAD=FV=W2wi47egKmWDS+BZGSy85K+A8jX0gvi6CYhmFgoBBRmw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm/msm/dp: Add basic PSR support for eDP
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
Cc: quic_kalyant@quicinc.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, quic_vproddut@quicinc.com,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Feb 21, 2022 at 7:12 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> > +static int dp_link_psr_status(struct dp_link_private *link)
> > +{
> > +       u8 status[2];
> > +
> > +       drm_dp_dpcd_read(link->aux, DP_PSR_ERROR_STATUS, status, 2);
> > +
> > +       if (status[0] & DP_PSR_LINK_CRC_ERROR)
> > +               DRM_ERROR("PSR LINK CRC ERROR\n");
> > +       else if (status[0] & DP_PSR_RFB_STORAGE_ERROR)
> > +               DRM_ERROR("PSR RFB STORAGE ERROR\n");
> > +       else if (status[0] & DP_PSR_VSC_SDP_UNCORRECTABLE_ERROR)
> > +               DRM_ERROR("PSR VSC SDP UNCORRECTABLE ERROR\n");
> > +       else if (status[1] & DP_PSR_CAPS_CHANGE)
> > +               DRM_INFO("PSR Capability Change\n");
>
> DRM_DEBUG_DP

Not sure I'll have time to go back and review the series, but one
thing that caught my eye as this flashed through my inbox is that I
think all of these "shouting" are deprecated. It's even officially
documented now as of commit d2f0a8afc1be ("UPSTREAM: drm/print: Add
deprecation notes to DRM_...() functions").

-Doug
