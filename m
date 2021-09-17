Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 415B440F084
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 05:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B75E86EB42;
	Fri, 17 Sep 2021 03:51:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2439D6EB42
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 03:51:54 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 x10-20020a056830408a00b004f26cead745so11139901ott.10
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 20:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=eC8WWm0GB9m9+OiTXjvJDwwJ4bOx9YsGIUwSquTEdkE=;
 b=leXlvUp4wCgJ+WDoSlsI5mfKEeObgFzMYEyDUeRToizAqmkwRLhzsTBxrdEHJ1LdYD
 F1jlqshs/rFCIBHW6i5CscigoTLiIEwaxQ1O/7w84B5WqXaa6JB05tIBgBGUouTzY+BZ
 5ngRCTCyGAVKY1/dVw68vCIPuKawOTvBfu5lM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=eC8WWm0GB9m9+OiTXjvJDwwJ4bOx9YsGIUwSquTEdkE=;
 b=fvtiu1d+gIB6GVe5/ZS9Va8ttPJ3pf9f2Sf4NCG8aZ3BDc4ja6+mGmAVl7v+0CR7n3
 XBE8oQy7zyByEFgiHPpR0LXCp4WDNy/X17YaO2m+ENRfa3+n7Nr7GwZRyutuSXE0LTXd
 wKgEtCbKD8gZxqnrlD2MTJI8N8mTtRJhUyE897LZ1CLy9zr54Ur9YiUo4Ymy2R71LlzM
 5P8WqF7Yqd5G+SLpHSIYgJbp3oGOL5agXY4ZC/CbtmA0HDzvuNHlsKyJ3ExzaDOnyDdC
 vNQaACHpG6IPWqwtkRYbRYuR/ZDQjikn1YITXrHNPwUF6S7mFVm7ciLR96sYdSQRGLnq
 V6mQ==
X-Gm-Message-State: AOAM532UXv7NPtmRghNefgJpB4eyZL4b47rCO+F1IXOqHjXEDdXBmlvO
 rdgsqdv0joJ/ecJIjWnxtsO5g1dr5osQZIKtB9TQpA==
X-Google-Smtp-Source: ABdhPJwb+CAeP1LbhPRSrTra9NOvhp96+APdALmb4BWvnUD6hxz1CMABXqTRzuUhf7PFT5ityKS48rAG+XuHAMo+ZcQ=
X-Received: by 2002:a05:6830:719:: with SMTP id
 y25mr7534615ots.77.1631850713468; 
 Thu, 16 Sep 2021 20:51:53 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Sep 2021 20:51:52 -0700
MIME-Version: 1.0
In-Reply-To: <20210915203834.1439-12-sean@poorly.run>
References: <20210915203834.1439-1-sean@poorly.run>
 <20210915203834.1439-12-sean@poorly.run>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 16 Sep 2021 20:51:52 -0700
Message-ID: <CAE-0n53jiiasodgaat9jJPifxGg=mNo8vewzORdBB+ZVd3VXTw@mail.gmail.com>
Subject: Re: [PATCH v2 11/13] drm/msm/dp: Re-order dp_audio_put in
 deinit_sub_modules
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Sean Paul (2021-09-15 13:38:30)
> From: Sean Paul <seanpaul@chromium.org>
>
> Audio is initialized last, it should be de-initialized first to match
> the order in dp_init_sub_modules().

I don't really understand why the driver is written with all this "get"
stuff but sure.

>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-12-sean@poorly.run #v1
>
> Changes in v2:
> -None
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
