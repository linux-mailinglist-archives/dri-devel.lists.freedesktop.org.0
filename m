Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 228225EFF12
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 23:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCBF210E09B;
	Thu, 29 Sep 2022 21:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1475810E09B
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 21:08:48 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id y8so3576551edc.10
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 14:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=xjbVBmltUI6GziuaG3qhAgJ85Kzm6RQ/sUf9zJ28Tis=;
 b=ct83XGxq4Splb+RmS3cGdWjXvA+uHvPFTgXyS+vGxW+ogQWw0/nCMi/ZN91npmCWmD
 OD/GbH8hRuY92wRDZ0ZrEstRyqCdDWpAud1xnSwIdO1ImAzt0fEc5If2rtQC09MMNsaW
 Qrn+sLD6zfHk5l1yEUKehyfTdj+e2hVtVn2fc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=xjbVBmltUI6GziuaG3qhAgJ85Kzm6RQ/sUf9zJ28Tis=;
 b=FmWJPaJ6KDHj6ca5QFhzOm5rnH4nsuGOSOcB+eOoWXr1LQQmu5sfdo4FcHNOBGtH4T
 Pm4vR8LTpor9hv4R2OXy0OMLcBCXxFryrErvMjdElOKZlia8UyMEZPqTH931eJd1A2Dq
 bq/GnG4Z/+vzr3x4vXkCGCUbnMaxpbLoenLl9DPbRMNJF9a0/Qo00yJOw4lfS0rMbTOD
 C9riuQYFX24c+P/Bke2fMSbKGIBoFI7nhndv+zjl6rR03CsTnCc+u2q30LPPWnFRKyYH
 OxBmIiG8LJQcCX7KW482FW7SmdmGHbuxNymTIjCEvhesO0xzAmow0m/g4R42fhknSGD1
 mDFA==
X-Gm-Message-State: ACrzQf0yV7JDe32ZswvIdOFRToQsIyTDrtg4HvFStRPKiC1RwE05b+ro
 busiSllwdL/KIE0INBTrhZ83EChhZZfPI+m3
X-Google-Smtp-Source: AMsMyM51P1BZj2KxIIQ8NImBGJYjIAbbMW13jO2eAtFZN9cy/k+2zlKi5Q3SxwTIgOLX9wuD0ZnTKg==
X-Received: by 2002:a05:6402:2286:b0:457:4fa8:f089 with SMTP id
 cw6-20020a056402228600b004574fa8f089mr4973150edb.210.1664485726398; 
 Thu, 29 Sep 2022 14:08:46 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41]) by smtp.gmail.com with ESMTPSA id
 ku9-20020a170907788900b0073d15dfdc09sm150380ejc.11.2022.09.29.14.08.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Sep 2022 14:08:45 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id o5so1753677wms.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 14:08:45 -0700 (PDT)
X-Received: by 2002:a05:600c:5488:b0:3b5:634:731 with SMTP id
 iv8-20020a05600c548800b003b506340731mr11585998wmb.188.1664485725630; Thu, 29
 Sep 2022 14:08:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220929015503.17301-1-yuancan@huawei.com>
 <20220929015503.17301-3-yuancan@huawei.com>
In-Reply-To: <20220929015503.17301-3-yuancan@huawei.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 29 Sep 2022 14:08:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WsTfN_HJ5VA8gLytL=X6O-k=EYLfie5-RAvM81AZkyCQ@mail.gmail.com>
Message-ID: <CAD=FV=WsTfN_HJ5VA8gLytL=X6O-k=EYLfie5-RAvM81AZkyCQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/panel: simple: Use dev_err_probe() to simplify
 code
To: Yuan Can <yuancan@huawei.com>
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
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Sep 28, 2022 at 6:57 PM Yuan Can <yuancan@huawei.com> wrote:
>
> In the probe path, dev_err() can be replaced with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and prints the
> error name. It also sets the defer probe reason which can be
> checked later through debugfs.
>
> Signed-off-by: Yuan Can <yuancan@huawei.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)

Pushed to drm-misc-next:

c9b48b91e2fb drm/panel: simple: Use dev_err_probe() to simplify code

For the other patches in your original series, I'll assume folks
paying more attention to those panel drivers will commit them. If they
totally stall for a while, though, then yell and I can try taking a
look at them. :-)

-Doug
