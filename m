Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B183C5EC7
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 17:04:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3E48923C;
	Mon, 12 Jul 2021 15:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B852C8923C
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 15:04:07 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id q190so18248175qkd.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 08:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=isd/llWwr/Y0cL0WxQwwfUZGS9+zFVVnxXEoNVeoRKQ=;
 b=JTqNDAZEgzekdEwusOKFc/BA38hvqh2Q/Y0osda98t33A9XhabVx51fuWMSUG2X2k8
 PUGz839O2kQ17hLlv8qrvpsoe7ZeNnGZVrAq9ZhuzGIU+esN4VCDCF1WiRU2r5Y8eeX9
 waoFggrUUaK1Yrpp6/HAPHxdJAyUhC4iVEqJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=isd/llWwr/Y0cL0WxQwwfUZGS9+zFVVnxXEoNVeoRKQ=;
 b=V8cumai9WZLujWGTKiDoBoyjpbMiJjjlJR/fwInNTjnlbKhs+TiyWVasXM6DDeUDUb
 f223v9jOv1NWvP/LLpnbbVNU3ow6290gzGUFQHEItXNyLz5iIN7USlU1g0+6GKSt8YaI
 mg7IfsaS+ieZcK2gkLMs+lIyIhGxNWRPFuCQ5yQhPZ2ZpcsFYQur7nXzbaHt3tzZChom
 LcGGInbuBvHaRkQDGm6QAeIR0g7SELN8KW3yNJF3Wkl0ZvwLnOC3QqCDiqZ2O7H2HrUY
 e7yuektL/lSUS42nhXnoRQpXWdQiBsd7J0tBQntX3g5w4lS3i94uXHf7axlcQCnK18Rd
 8WcA==
X-Gm-Message-State: AOAM5312b7QRO+YNelhqnzjpXaK7SZqYVPKiVePg3wxmYfF9S2NKmEy0
 zAlbCI7mSDexnFwaEU8TwqIDA009Hh2uPQ==
X-Google-Smtp-Source: ABdhPJyD1lnH0FfGklfm6K+HC9ZpYAOipHAmtVaDvGvnylf8on296xt9cGRmP9t1xzidpAng4L2vMQ==
X-Received: by 2002:a05:620a:2486:: with SMTP id
 i6mr30041610qkn.142.1626102246990; 
 Mon, 12 Jul 2021 08:04:06 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170])
 by smtp.gmail.com with ESMTPSA id o66sm6789012qkd.60.2021.07.12.08.04.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 08:04:06 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id b13so29484282ybk.4
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 08:04:06 -0700 (PDT)
X-Received: by 2002:a25:cc52:: with SMTP id l79mr63888238ybf.476.1626102245460; 
 Mon, 12 Jul 2021 08:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <1624726268-14869-1-git-send-email-rajeevny@codeaurora.org>
 <1624726268-14869-2-git-send-email-rajeevny@codeaurora.org>
 <7f8562df-7e1f-dcfb-1c58-f1edd9dcc606@suse.de>
 <CAD=FV=V8CaKObbQTCsX2GrP=O8aJUaWLZY3zgBMRATtSn6Be4g@mail.gmail.com>
In-Reply-To: <CAD=FV=V8CaKObbQTCsX2GrP=O8aJUaWLZY3zgBMRATtSn6Be4g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 12 Jul 2021 08:03:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wij=nih9c1Dxmh=3UFXsOvdbTHBqwXxsUa+rQfpuf4Wg@mail.gmail.com>
Message-ID: <CAD=FV=Wij=nih9c1Dxmh=3UFXsOvdbTHBqwXxsUa+rQfpuf4Wg@mail.gmail.com>
Subject: Re: [v8 1/6] drm/panel: add basic DP AUX backlight support
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Sean Paul <seanpaul@chromium.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>,
 Rajeev Nandan <rajeevny@codeaurora.org>, Jingoo Han <jingoohan1@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Jul 12, 2021 at 6:39 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Mon, Jul 12, 2021 at 2:41 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >
> > > +     ret = drm_dp_dpcd_read(aux, DP_EDP_DPCD_REV, edp_dpcd,
> > > +                            EDP_DISPLAY_CTL_CAP_SIZE);
> >
> > This creates a cyclic dependency between drm_kms_helper-ko and drm.ko.
> > drm_panel.c is in the latter, while drm_dp_dpcd_read() in
> > drm_dp_helper.c is in the former. Please fix.
>
> Yeah, this was reported Friday and I posted a patch to try to fix it:
>
> https://lore.kernel.org/lkml/20210709152909.1.I23eb4cc5a680341e7b3e791632a635566fa5806a@changeid/
>
> I see Rajeev had some feedback on it. Once I've dug out of my weekend
> email hole I'll take a look at plan to post a v2 ASAP.

Breadcrumbs: v2 of the fix is at:

https://lore.kernel.org/lkml/20210712075933.v2.1.I23eb4cc5a680341e7b3e791632a635566fa5806a@changeid/

I'm hoping this looks OK so we can get this resolved before it trips
too many people up.

-Doug
