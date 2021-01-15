Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D202F8907
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 23:59:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4A46E4DD;
	Fri, 15 Jan 2021 22:59:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com
 [IPv6:2607:f8b0:4864:20::e2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 246BD6E4DD
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 22:59:46 +0000 (UTC)
Received: by mail-vs1-xe2c.google.com with SMTP id o125so4636679vsc.6
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 14:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lBeHYBPs8O+PuMBSXIDj9EGHakvLyVLX6sC/5Rr17Uw=;
 b=ND4BhA6Nr8vjqjBtdcIkQkMJzPTFPMG+L9xCmvlLIbeVS/TMzcLLcKSWxLVLWFh+zl
 KW3OjtmjZjtir71AO6GCHm9ejeO1o9+wshl3qk/RKumMzQQc1/Nr3yxA/JhFbk/gu0F4
 E4Qe8P6iLBuy4RzA4+JoUtE9xsTKt7+a8wsr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lBeHYBPs8O+PuMBSXIDj9EGHakvLyVLX6sC/5Rr17Uw=;
 b=Q/8eurrloAFJ1AVth3KyOgPVo3ypVY9Vf7lxAxqXb00F/1f+j57K+yG95slyMRQO7V
 avQYtycfSmRJJsgVHH/TjiL84b2+ati+kJ2OBDs32OGEAUxdh9KpQ+jWRfPn2XEy9zTS
 nnddJ8p7i/wgsixtweRaPIQLtqdrZOl81nRxvgWH5bCPar5PLWlK2k+OUOXKCdfYXOtv
 +xn5Y9DqAhHdLcfXCXKaArOanrTASY/PGvBwmi8WMXHhyFV6BAxGKbnjKpDKNO7Mpcwg
 IGDvApXNDSR38U09wxIwP0ZJ04zjIdRq9yDcRT/XFWSrat8nS8bc8nBGW3hm8gCnurP4
 M28g==
X-Gm-Message-State: AOAM530/zqlLbyHP7ziDGX17Ven008jUJGlo/R3NcO3PVXbUQ0sxYb7t
 /GNK2AiLkFxKaRWtc8kWXyMGu7KkJrymOw==
X-Google-Smtp-Source: ABdhPJwtdIeSyl1cE/l3spZgaIv7yx1krCT+SYjbvvHVbG7R2HpMJHpKNmuy7qUX/QPrscprf/Bzvw==
X-Received: by 2002:a67:f7c5:: with SMTP id a5mr12413776vsp.16.1610751584526; 
 Fri, 15 Jan 2021 14:59:44 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com.
 [209.85.222.54])
 by smtp.gmail.com with ESMTPSA id g145sm1547483vkg.18.2021.01.15.14.59.43
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jan 2021 14:59:44 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id p2so3438704uac.3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 14:59:43 -0800 (PST)
X-Received: by 2002:ab0:5a70:: with SMTP id m45mr11259619uad.121.1610751583152; 
 Fri, 15 Jan 2021 14:59:43 -0800 (PST)
MIME-Version: 1.0
References: <20210115224420.1635017-1-dianders@chromium.org>
 <20210115144345.v2.4.I6889e21811df6adaff5c5b8a8c80fda0669ab3a5@changeid>
In-Reply-To: <20210115144345.v2.4.I6889e21811df6adaff5c5b8a8c80fda0669ab3a5@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 15 Jan 2021 14:59:31 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X3LgTz1x_C_y3u1cypa80qikOnvmo-v2sETkfaDd_ChQ@mail.gmail.com>
Message-ID: <CAD=FV=X3LgTz1x_C_y3u1cypa80qikOnvmo-v2sETkfaDd_ChQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] dt-bindings: dt-bindings: display: simple: Add
 N116BCA-EA1
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Jan 15, 2021 at 2:44 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> Another simple eDP panel.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v2:
> - ("dt-bindings: dt-bindings: display: simple: Add N116BCA-EA1") new for v2.
>
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)

As per always I find my typos right after I hit send.  ${SUBJECT} has
one too many copies of the "dt-bindings:" tag.  I will assume this can
be fixed when it's applied.  Please yell if you'd rather I spam a
repost.  ;-)

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
