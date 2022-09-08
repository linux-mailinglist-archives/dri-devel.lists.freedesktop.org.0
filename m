Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BA45B227B
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 17:36:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35DD710EB47;
	Thu,  8 Sep 2022 15:36:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E38A610EB47
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 15:36:10 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id nc14so38929485ejc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 08:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=knhMsKK0YzQCQKsiPtIuuMjv+O66fK9juB2+nIAHPk0=;
 b=KfiYrfk6/8vzQ2y9m2B3d70Ln6jxPro9iQHMcnyBVr51+6I6SfcI70dnJnHWqHCLbE
 aJ0jmwq7FZVQHflmDW5PlZ8FmTwwZILYAnf4a6PYNrrVqMzFdkKVGrjbC4QxwWgBTkYo
 /gKG+JxCo++yPZryygU/Hzbxj0P4QZa7oUe0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=knhMsKK0YzQCQKsiPtIuuMjv+O66fK9juB2+nIAHPk0=;
 b=MzvrGHYUd01c8H/y3oAftliiIRNOUvJvH4Ju+IlDIe1Z0y4pWFc3HsxBvqMkb3l1LH
 wG6yIeCHfcHS7jxAkqIpUiJ+H/JJ6UriamuIPEa1CKKn67Y+Z5otaXuol+pkEKwkrznD
 obQdJSsCrXvNGbxfbRIvzGnXZPkIZw2IseemW91gZkvCOYOLyXbIjIR0Y3SDA9IdSL+m
 eV7KjfO7M8D6X1CFhGa324i1xaOdO8O987niTbPYXj+TMJ8yUlYwlmZ4GpKqW6APPVFw
 jGkTUAfYfSA275i5D7fULJHOk5uC7dXRtMbH0ziM3tSg4FlpBY/D8LuVAGCVF91JwmmK
 BIWQ==
X-Gm-Message-State: ACgBeo24qH9UXnywrm79fBFmL/cAVJTd+vCz1Dlyo8BKnnX+38Q/V3/t
 IC3D70l1YBiYEprbG+eT/1XaMGarvTIZrG+yjpI=
X-Google-Smtp-Source: AA6agR5VpO36nNR2IU1i9Sz7PsSFX+r+l96rDa9vF5Q+MxHcY881zRY3PZmgpsXeqdvyVvR8lMwq/Q==
X-Received: by 2002:a17:906:ef90:b0:730:9cd8:56d7 with SMTP id
 ze16-20020a170906ef9000b007309cd856d7mr6208231ejb.94.1662651369172; 
 Thu, 08 Sep 2022 08:36:09 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com.
 [209.85.221.46]) by smtp.gmail.com with ESMTPSA id
 ty16-20020a170907c71000b0077086ee4633sm1373250ejc.53.2022.09.08.08.36.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 08:36:08 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id c11so22525477wrp.11
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 08:36:08 -0700 (PDT)
X-Received: by 2002:a5d:4d0c:0:b0:228:cd9f:5a4c with SMTP id
 z12-20020a5d4d0c000000b00228cd9f5a4cmr5725454wrt.138.1662651368080; Thu, 08
 Sep 2022 08:36:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220908085454.1024167-1-wenst@chromium.org>
In-Reply-To: <20220908085454.1024167-1-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 8 Sep 2022 08:35:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VgyOT0eJ9eqwqaHRw2L7ypsTkiyGeSyqu-rEBURj5TCg@mail.gmail.com>
Message-ID: <CAD=FV=VgyOT0eJ9eqwqaHRw2L7ypsTkiyGeSyqu-rEBURj5TCg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/panel-edp: Fix delays for Innolux N116BCA-EA1
To: Chen-Yu Tsai <wenst@chromium.org>
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

On Thu, Sep 8, 2022 at 1:55 AM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> Commit 52824ca4502d ("drm/panel-edp: Better describe eDP panel delays")
> clarified the various delays used for eDP panels, tying them to the eDP
> panel timing diagram.
>
> For Innolux N116BCA-EA1, .prepare_to_enable would be:
>
>     t4_min + t5_min + t6_min + max(t7_max, t8_min)
>
> Since t4_min and t5_min are both 0, the panel can use either .enable or
> .prepare_to_enable.
>
> As .enable is better defined, switch to using .enable for this panel.
>
> Also add .disable = 50, based on the datasheet's t9_min value. This
> effectively makes the delays the same as delay_200_500_e80_d50.
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Fixes: 51d35631c970 ("drm/panel-simple: Add N116BCA-EA1")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Yup, this looks like a good fix to me. Thanks! I guess that patch
you're fixing was from a time before I had analyzed the eDP panel
delays quite so closely.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Given how non-controversial these types of patches are, I typically
just apply them right away so I'll do that shortly. If this upsets
anyone then please shout and I'll change my behavior. ;-)

I've applied this one to drm-misc-fixes.

8f7115c1923c drm/panel-edp: Fix delays for Innolux N116BCA-EA1

-Doug
