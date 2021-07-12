Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D73373C5D76
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 15:39:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1678C898EA;
	Mon, 12 Jul 2021 13:39:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59176898EA
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 13:39:44 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id j184so17938783qkd.6
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 06:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/y3AswAn7xrfStWckKQ4mdfAYQv8LuashoWFVm7wmnI=;
 b=JIUoCU9T0XfyuPyJPuVrcxCa8UoWsH/qeP/iWmQomkfVNKt6Mnzy8lEYTsbBLAjQDY
 qA2lrYcGl7R7GwRo7zb4EcRYe0d2sy5LWLilGAQERXHWRpwcRsU4AXvQl2DgNurV6j9N
 GaO1ghyx3qKRzIY5oEx/5Ib8QbPhKF1MbPyX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/y3AswAn7xrfStWckKQ4mdfAYQv8LuashoWFVm7wmnI=;
 b=OvA2ThtROmAnxbb+GXIa24k7SxQbvlsk1tW/8fqgEipsQTrj3hGtZkFNciy1L3eg3f
 I3q6mShGAom0XLnWJ+pJklcw/5EF1PcE/UoP12/cuT2lYRLJMDlYiC4zcxILVetvyLGL
 y1hCD+Z1a9CJ5b7fq7P85Uk5rwzzYz3Ab83YPARktUpLbJEDJCkHSItf4YXXtc4eZ6Aq
 v6JIQebQ1T1BfOXKXiVfndicfzMwZJE2mMDw1Djw5si64XpjxqlQ5zEiCsbst24WiJLG
 cfaikREUDQHzVE1dzPwQz63oUFz+DNsCJgvonMlpoxJ4ZK/Fpe3Lt7Q9xVl6G9uz/hbe
 R3ww==
X-Gm-Message-State: AOAM533AdCmQplOQZGqbJt40fbGU7cVrRAy/7EoFIxrEucKWDqhvTH/G
 LH+wQ08qvQ3FdYLiTJgzD5RTpSKQsenr0g==
X-Google-Smtp-Source: ABdhPJzdjN+6nt6zyWTMDAt+SE1h0G8hOnPB9BvJQlIVrn54REQZcmuTzx3kAiJv8D92hZVchS2O2A==
X-Received: by 2002:a05:620a:16cf:: with SMTP id
 a15mr6353880qkn.484.1626097183409; 
 Mon, 12 Jul 2021 06:39:43 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com.
 [209.85.219.178])
 by smtp.gmail.com with ESMTPSA id h2sm6763143qkf.106.2021.07.12.06.39.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 06:39:42 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id o139so28942435ybg.9
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 06:39:42 -0700 (PDT)
X-Received: by 2002:a25:3486:: with SMTP id
 b128mr71633896yba.523.1626097181672; 
 Mon, 12 Jul 2021 06:39:41 -0700 (PDT)
MIME-Version: 1.0
References: <1624726268-14869-1-git-send-email-rajeevny@codeaurora.org>
 <1624726268-14869-2-git-send-email-rajeevny@codeaurora.org>
 <7f8562df-7e1f-dcfb-1c58-f1edd9dcc606@suse.de>
In-Reply-To: <7f8562df-7e1f-dcfb-1c58-f1edd9dcc606@suse.de>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 12 Jul 2021 06:39:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V8CaKObbQTCsX2GrP=O8aJUaWLZY3zgBMRATtSn6Be4g@mail.gmail.com>
Message-ID: <CAD=FV=V8CaKObbQTCsX2GrP=O8aJUaWLZY3zgBMRATtSn6Be4g@mail.gmail.com>
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

On Mon, Jul 12, 2021 at 2:41 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> > +     ret = drm_dp_dpcd_read(aux, DP_EDP_DPCD_REV, edp_dpcd,
> > +                            EDP_DISPLAY_CTL_CAP_SIZE);
>
> This creates a cyclic dependency between drm_kms_helper-ko and drm.ko.
> drm_panel.c is in the latter, while drm_dp_dpcd_read() in
> drm_dp_helper.c is in the former. Please fix.

Yeah, this was reported Friday and I posted a patch to try to fix it:

https://lore.kernel.org/lkml/20210709152909.1.I23eb4cc5a680341e7b3e791632a635566fa5806a@changeid/

I see Rajeev had some feedback on it. Once I've dug out of my weekend
email hole I'll take a look at plan to post a v2 ASAP.

-Doug
