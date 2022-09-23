Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C095E7D28
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 16:33:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EABE310E3D0;
	Fri, 23 Sep 2022 14:33:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6825F10E3D0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 14:33:44 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id lh5so1052631ejb.10
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 07:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=5YJNawVCB64KpIAstvsKw73aAH2yj+Relp5ZFDa3MaI=;
 b=JJbRfx9cLZf7rfabp1oQDbdQ5l8dhYb9U34ueRVV9VAbDSSqorTUwrEx5FVDjKYjLR
 8bHiK+VB0iExV4IvICu/qPuW+1QbSMAJHdJW5VY8lt6zEZET+YXzJobrV4G5o1xnTBbU
 5ZVuqhXzXm59CxvMlFGNyhjAq0k4bwsIxbch0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=5YJNawVCB64KpIAstvsKw73aAH2yj+Relp5ZFDa3MaI=;
 b=4wXTXKA5AkWJqfsCw6ziTQzipWeUVPr9j1Ti0eqgsaF3LK9bNjKwdPNiPHIo8zqysT
 OX1RBkd2REVeB0Jye0zCaE3qXNAzdcGe4cdW5R7LOxO7redW+NBH4GNhxtyjypJJmOer
 SfmyScSCwF7ZSrfspTwf8Sm4OlzoB6craQguJQO4Jho5IwZ4F1iMrT0yxPkrp1YQxm0o
 X40gN3FwNXMWSS+YU0JRKIxjJh4qNHdP1Pus0MXbXGsQeqtaGwpefWuzmpFHwU8Y+I7y
 72vTiwaSVnjLOA9WIwTXeAppcuUzlqU5GJfpU7taCja6nV1wyskpl17HLU2VXUR7rnkV
 gXeA==
X-Gm-Message-State: ACrzQf13WysG+PbuKQ3BHGzkM2J7JNtRbUdeGfqaP3+mIN+u8sJXfBk9
 0ptan9l7udA8HctBRWBztck8ljmBDDAqz8kc
X-Google-Smtp-Source: AMsMyM7hTKP11pweRx3K9dByQ7xo/SSQtL8DSgy8WSgUd28qr/w/7+lufkl4geqpOkLRPgUshp83nw==
X-Received: by 2002:a17:907:3e0b:b0:780:a882:d2fd with SMTP id
 hp11-20020a1709073e0b00b00780a882d2fdmr7162016ejc.564.1663943622752; 
 Fri, 23 Sep 2022 07:33:42 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com.
 [209.85.128.52]) by smtp.gmail.com with ESMTPSA id
 u17-20020a1709061db100b0077d6f628e14sm4053477ejh.83.2022.09.23.07.33.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 07:33:41 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id o5so361622wms.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 07:33:41 -0700 (PDT)
X-Received: by 2002:a05:600c:500d:b0:3b5:234:d7e9 with SMTP id
 n13-20020a05600c500d00b003b50234d7e9mr5982543wmr.57.1663943621242; Fri, 23
 Sep 2022 07:33:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220923054614.302440-1-sean.hong@quanta.corp-partner.google.com>
In-Reply-To: <20220923054614.302440-1-sean.hong@quanta.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 23 Sep 2022 07:33:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xje=_kFShMCZ_WbzLBnkehvOp3DQ5p_RsdAPi+SSvAnA@mail.gmail.com>
Message-ID: <CAD=FV=Xje=_kFShMCZ_WbzLBnkehvOp3DQ5p_RsdAPi+SSvAnA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add BOE NT116WHM-N21
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

On Thu, Sep 22, 2022 at 10:46 PM Sean Hong
<sean.hong@quanta.corp-partner.google.com> wrote:
>
> Add support for the BOE - NT116WHM-N21 (HW: V8.2) panel.
>
> Signed-off-by: Sean Hong <sean.hong@quanta.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

As with previous trivial patches that just add an entry to this
structure, there's no reason to wait before applying. Pushed to
drm-misc-next:

9d6b59478cc5 drm/panel-edp: Add BOE NT116WHM-N21
