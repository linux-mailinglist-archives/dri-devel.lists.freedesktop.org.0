Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0147D51077A
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 20:48:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B81510E3DB;
	Tue, 26 Apr 2022 18:48:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6409B10E3DB
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 18:48:18 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id kq17so14764935ejb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 11:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fi4UID/HmFece7oTL/UhSNA9qggnqUU7Xw1cgGW6Rg0=;
 b=aqWjLkdHqdOFB49iwf5Y4RQwk+Ttcp7/V4Ed9GhbY0FJtH/LOgxkMwi6yimmLKCDKQ
 b15sUfrqFb4zKv92ew4D5gnVulyEv3XWxOqsnWuf7A7Hsv9YkfsB0yJ+Jq3GnUix8T92
 OhjiEgYtIeKLE63VdPnbE878TJT/VB/AdbkpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fi4UID/HmFece7oTL/UhSNA9qggnqUU7Xw1cgGW6Rg0=;
 b=ubP55GX8KtqtY2L+jQM329PSjJuoO9rJSP9iNBjbmMTiq5KSCA1/hy4oHDJSBrLT5W
 DXe+vogzhIR7ExxG4F3pyLA1+vQQII0sCA+hn+fhbWElY7tcwjiwz0YxuP1v75ytB2KL
 PEBR1bHfhgeD41ZrL2xVH7MJ2Hmi8D7JQDwcKxnkyOn9e/pmixfADMEikcCfHlxAToLH
 KmKV7oQMZRnGySh36BXg2STfUMXblXhqd9/jOXT5DTCM5RWPsoPCADlC6ULdFwW9inhk
 iZDTiNLSsO1o12VjkwmQnCIfENbyEEycJCQli9/K/gx0dZSs+NUMjM67w4OAl1kbvw3j
 qtxg==
X-Gm-Message-State: AOAM531ue/rUWUzVHz2Qvlj+CEFndKcLmarFNkpmXsKwukcDFkklC6Gp
 lp+ATX4NtLvTP9+Hn98+4/m94xvyc+LvOl+B55Q=
X-Google-Smtp-Source: ABdhPJzTQHpn+xnxqWi7+wacBPC8UXbA6pDHgI1Hrak7E+qtCmU937zqd/0TUKpsc5DzrXtOIWjo0w==
X-Received: by 2002:a17:907:1b19:b0:6f0:1022:1430 with SMTP id
 mp25-20020a1709071b1900b006f010221430mr23191134ejc.13.1650998896963; 
 Tue, 26 Apr 2022 11:48:16 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53]) by smtp.gmail.com with ESMTPSA id
 p16-20020a170906785000b006f2d8530459sm5151235ejm.112.2022.04.26.11.48.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 11:48:16 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id
 ay11-20020a05600c1e0b00b0038eb92fa965so2078012wmb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 11:48:16 -0700 (PDT)
X-Received: by 2002:a05:600c:3c99:b0:392:b49c:7b79 with SMTP id
 bg25-20020a05600c3c9900b00392b49c7b79mr22469790wmb.199.1650998895809; Tue, 26
 Apr 2022 11:48:15 -0700 (PDT)
MIME-Version: 1.0
References: <1650671124-14030-1-git-send-email-quic_khsieh@quicinc.com>
 <3b9588d2-d9f6-c96f-b316-953b56b59bfe@linaro.org>
 <73e2a37e-23db-d614-5f5c-8120f1869158@quicinc.com>
 <CAA8EJprjuzUrfwXodgKmbWxgK6t+bY601E_nS7CHNH_+4Tfn5Q@mail.gmail.com>
 <9b331b16-8d1b-4e74-8fee-d74c4041f8d7@quicinc.com>
 <CAD=FV=VxEnbBypNYSq=iTUTwZUs_v620juSA6gsMW4h2_3HyBQ@mail.gmail.com>
 <9b4ccdef-c98a-b907-c7ee-a92456dc5bba@quicinc.com>
 <CAD=FV=U3MJ1W6CCVW0+Si8ZyAD+_ZBYsL1cT6Y8yhcTvWsCLUQ@mail.gmail.com>
 <d3d1d0d5-d3e0-0777-5b20-cdf24697742d@quicinc.com>
 <CAD=FV=W2WPdiY2zq6JC_-10kOqzDuiUYQOdYbyRyw2k-fbXFXQ@mail.gmail.com>
 <eaedbc40-f8cb-aaf8-f335-ef48e3cf82cc@quicinc.com>
In-Reply-To: <eaedbc40-f8cb-aaf8-f335-ef48e3cf82cc@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 26 Apr 2022 11:48:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XJsWRjawybS2222MupBLVD7rLyKxUPBmax8PaFX8N4dA@mail.gmail.com>
Message-ID: <CAD=FV=XJsWRjawybS2222MupBLVD7rLyKxUPBmax8PaFX8N4dA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: move add fail safe mode to
 dp_connector_get_mode()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: Sean Paul <sean@poorly.run>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Andy Gross <agross@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Apr 26, 2022 at 8:37 AM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> > Can you provide the exact EDID from the failing test case? Maybe that
> > will help shed some light on what's going on. I looked at the original
> > commit and it just referred to 4.2.2.1, which I assume is "EDID Read
> > upon HPD Plug Event", but that doesn't give details that seem relevant
> > to the discussion here.
>
> Yes so it is 4.2.2.1 and 4.2.2.6.
>
> That alone wont give the full picture.
>
> So its a combination of things.
>
> While running the test, the test equipment published only one mode.
> But we could not support that mode because of 2 lanes.
> Equipment did not add 640x480 to the list of modes.
> DRM fwk will also not add it because count_modes is not 0 ( there was
> one mode ).
> So we ended up making these changes.

Ah! This is useful context and makes tons of sense.

This really feels like something that could be handled in the core. OK, See:

https://lore.kernel.org/r/20220426114627.2.I4ac7f55aa446699f8c200a23c10463256f6f439f@changeid


> > I guess maybe what's happening is that the test case is giving an EDID
> > where all the modes are not supportable by the current clock rate /
> > lanes? ...and then somehow we're not falling back to 640x480. It's
> > always possible that this is a userspace problem.
> >
> > In any case, would you object to a revert of the patches in the short term?
>
> Not sure, if you saw this change kuogee posted last night.
> https://patchwork.freedesktop.org/patch/483415/
> We did decided to remove all the code related to these test cases and
> handle them in IGT.

I hadn't seen it yet and I wasn't CCed. :( I'll take a look now.
