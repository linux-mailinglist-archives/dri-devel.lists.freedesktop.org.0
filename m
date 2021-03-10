Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C14C2334C78
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 00:25:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 001F96E1D3;
	Wed, 10 Mar 2021 23:25:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 688466E1D3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 23:25:18 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id e7so36571757lft.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 15:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MgKseNFFkrrRFclSHj6wbS3S/tiTuRT8S1xZlIqzXlo=;
 b=IjSkl6wJ2e929mSFyx3S1AYyWJi8WZsF060mBGXt6Rvngu6a9brGEMgy8OQcuKs/i4
 QYHuH8hDjrhyCURvf340UfFNAKq+RK8VjIAFe3FugcoEAlsXvViQ6pdDHoiYbni6neu6
 E4CETeLfFF/D7jbdJFYpwerqbqKuUvGHv15Apwy0EgMlUsRvDTmsMMbiB0XiD2cTVKpD
 BFDbNtwNJp/BJD1okzaEvCGaTbn7P/WfAxpp+wyZCd6qP9aPw2tKjQg60pfFCta0j9Mm
 rlL8T0YsoMyRZAh4bGwRaKcYYwrCBVZyiBeeN+uZizv5gBuJAZukyTXOE7q/U/xQwavI
 VBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MgKseNFFkrrRFclSHj6wbS3S/tiTuRT8S1xZlIqzXlo=;
 b=mISQaLC0xqr75o/vj0V9TmoRrxb5GwYM9u/6oiuj+xp1ni4iD0WFsSLProYSmAJ0fq
 CygfQk/+BEztD73Exm1I+9EveBeAaPjVyvo7yKLjM0Hof3XwgluIsdWBcnvb4S/wiB6M
 odA0vZn1fC7ptLJNInxWbu7BIF3A8Cher0d0YRDnkhm36ve5gCuJku4B/gU5Kus9/10v
 e85wdg2TNtfNEo98YpOKrfReDDyr7mafF3mojyypDSYUMV/LRtms2UHTWqGmIVsWJm9N
 hAvZI5cupgMhDumjfSn2vSgERz+sLCA+iaN/hLjN6dP5ivPsu98T5rWnJyBqUtkqQiDa
 6i0g==
X-Gm-Message-State: AOAM530zeHfExw04O8FIq8DFadnTXs0qGDAG0rCF0DIxeeei0e95c3K8
 WWztp5uoYl4YW5ZBY26jco3a2vHy27K8P4HxckU4SA==
X-Google-Smtp-Source: ABdhPJwGk6XtIb3w/iX57ttUl7E3k4dv+R8ze9Q1sAcTvGDDr2Xt4Qko01grmgJD8rFH0mJ9Oh66fDhzHwkgI2//SbY=
X-Received: by 2002:a05:6512:243:: with SMTP id
 b3mr514695lfo.529.1615418716717; 
 Wed, 10 Mar 2021 15:25:16 -0800 (PST)
MIME-Version: 1.0
References: <20210115224420.1635017-1-dianders@chromium.org>
In-Reply-To: <20210115224420.1635017-1-dianders@chromium.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 11 Mar 2021 00:25:06 +0100
Message-ID: <CACRpkdYUs2W3b_u8YrmYwq_kcUCf0DhZ-o2o6O2EmU5rdtv=BA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] drm/panel-simple: Patches for N116BCA-EA1
To: Douglas Anderson <dianders@chromium.org>
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 15, 2021 at 11:44 PM Douglas Anderson <dianders@chromium.org> wrote:

> - ("drm/panel-simple: Don't wait longer for HPD...") new for v2.
> - ("drm/panel-simple: Retry if we timeout waiting for HPD") new for v2.

I couldn't find these patches in my inbox but my concern would
be that at some point panel-simple will turn from simple into
panel-rube-goldberg-machine.

Given that the talk with the manufacturer may result
in even more quirks... maybe this should just be a separate
panel driver?

(I expect pushback because I see how handy it is, but
I am the guy writing new panel drivers all the time rather than
using simple.)

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
