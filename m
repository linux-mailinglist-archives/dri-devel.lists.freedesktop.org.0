Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3713B5E7D2E
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 16:34:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD9C10E853;
	Fri, 23 Sep 2022 14:34:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B8D10E74C
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 14:34:05 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id lh5so1055106ejb.10
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 07:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=e4LOIvkqvEQf1PPlP5H8S1k+93vEgQ21MykK8wpOxMw=;
 b=L9b9Tj3kOV+wemLtGDPI+SbrzmTy/CcQP4KSNrhfR5VENbNRpMjeph2jzcUGjKOmPZ
 qoPdqD4eTrVl30jhohqE/+erghlWjkxsP3o4PTKjWNxQ2dmBEsCMS90r/KxJxvTBi9Nn
 DUh5WqWOsnbAwQFjPs/l+mP8CK/PNZtjYxChs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=e4LOIvkqvEQf1PPlP5H8S1k+93vEgQ21MykK8wpOxMw=;
 b=abZTEM8MIGnP79X6Npf8vnQteyMdLf4WQhjo1TeaDMRGdsvxlbLn91eAz4PvCueQ3q
 WtKPeCNALBl+9aDmpUModiJnSIdCztY/x+Cs4aXzdX/tmr/gEiMrKlugfRi5VyIUilaE
 lRHpsVpJ7+VBWpeVfDY3J5p7WpXoxhSJtLQ1+8CYd13SPiDOKLT0ATiBaNZ4VCqkxSNU
 5NZCmsYlKHNG7yQG1EXtATjVP68J6Rsbh6lg6X0WiTsXfrSp1WDarz8fM4bB64/6EXRh
 NwuH6DBEXSvpP1/dJ99OUpyjOAatnnHJiyFHPvWUnZQ7yWXSJdXjc/hXeKckFYVnuHIq
 o34w==
X-Gm-Message-State: ACrzQf1CmmQ6MQMEgkQlrt4a0h1Ej1wZfstGc5Ie1fBp3eNe1RHWNXgP
 xMmwQZ3gWZJruNCJNEOTjZWBnG/N2e70sgRs
X-Google-Smtp-Source: AMsMyM4PHzymlGgMMpFDsPnmD63jNJPAaUFs/qAq1LIvWz+m+3UeAXrbuWHJt1yezpJ533HLocSYeg==
X-Received: by 2002:a17:906:dac9:b0:780:ab6f:591f with SMTP id
 xi9-20020a170906dac900b00780ab6f591fmr7317721ejb.77.1663943644887; 
 Fri, 23 Sep 2022 07:34:04 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com.
 [209.85.128.42]) by smtp.gmail.com with ESMTPSA id
 f19-20020a056402195300b004531b137e4bsm5743555edz.67.2022.09.23.07.34.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 07:34:03 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id l8so362098wmi.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 07:34:03 -0700 (PDT)
X-Received: by 2002:a05:600c:1e18:b0:3b3:b9f8:2186 with SMTP id
 ay24-20020a05600c1e1800b003b3b9f82186mr6378087wmb.151.1663943643491; Fri, 23
 Sep 2022 07:34:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220923055133.302740-1-sean.hong@quanta.corp-partner.google.com>
In-Reply-To: <20220923055133.302740-1-sean.hong@quanta.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 23 Sep 2022 07:33:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Uhk2jTYWVU6Lr+d1xEAyScbQr-8w84F7gAbkRgP_YkgA@mail.gmail.com>
Message-ID: <CAD=FV=Uhk2jTYWVU6Lr+d1xEAyScbQr-8w84F7gAbkRgP_YkgA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add AUO B116XAK01.6
To: Sean Hong <sean.hong@quanta.corp-partner.google.com>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Sep 22, 2022 at 10:51 PM Sean Hong
<sean.hong@quanta.corp-partner.google.com> wrote:
>
> Add support for the AUO - B116XAK01.6 (HW: 1A) panel.
>
> Signed-off-by: Sean Hong <sean.hong@quanta.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

As with previous trivial patches that just add an entry to this
structure, there's no reason to wait before applying. Pushed to
drm-misc-next:

a70abdd994cb drm/panel-edp: Add AUO B116XAK01.6
