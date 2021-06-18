Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 495FD3AC9B2
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 13:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC076E0AA;
	Fri, 18 Jun 2021 11:19:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75BBC6E0AA
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 11:19:52 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id b37so13484234ljr.13
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 04:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rVG4hdkF6QT4QWf7U6GmvAJj2w6Nre7+o+Q+Y7YqJ5A=;
 b=sDcla8/d7JvgNB55dGV7/B0y3RfSEPCIvy48k5NqZHea+yiD3zMPTPrhOH1SqMoGku
 NTittt6R5hzDfEkx8FL+urPIsnAJ3QUcEEqClVYCBB1Jye+MC1IiIu+52IcEG8Q9boAC
 IURh8QL6fKn3dtfESIJtM/+mLzbPyAzLedTG7tTIXvOWDGS1fGH0OAS5HD1fU9c6MwKS
 iZtb3abUeIAF717svBUvPu7hDT/0M1wRcvc6IJCtdGgz0BMiJ/PsQ3BFMxeqgeLbqETj
 zjgR6UPkp5z0AlInEwuSyT+nciXGKQw3RQhGAxGx0AoYDrwg2MwmnIqvOF0ad8MFImpv
 akNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rVG4hdkF6QT4QWf7U6GmvAJj2w6Nre7+o+Q+Y7YqJ5A=;
 b=ZENWdMPhU9yz0ZRolsMWZ+G9ujK8uBdzYTF5lCJPFBUzqYtB3WdM/fzu3o8xVx5t0h
 xaX/vtCR2d9DJSaWwC5+AnPwrdxoX4ai2HsCCR6kSnG5xoyZwzdzCXkCtiogiSS2MHdX
 8QSwKN+WXQDFiLrU8MEvt6ueILlye95E1k5ZxJvycTNH9Q2xB5RxeLKglkupp77yMa5M
 J6YBM9T+eqvnNVKns3u4AvSHGQA/Ze1H7msiqhW3XYztUrL+huX8vQZbNnj2yvtIlce7
 pEDsgYFUOByqJg5Q7vO7W0UpH68pbnM7+QoHy6PNoypRbWL9RA3rZcyCXJ5kF6pzI9ja
 ZClg==
X-Gm-Message-State: AOAM533KtUkb0kzyN//aNxU5Cpt7iTkErN3p/yqZcPPr0nAGMHpzf1Mg
 YiwnOlLCUYmbwg/HBZfLCAhJSs5dpRNfTn//ZSo=
X-Google-Smtp-Source: ABdhPJydxR7AgdiAIqIH1e87/gxYPFVe8agJ0K7sv330BlV9E3hlziJN2vSapU/I6e013UlRGPO779DslbMOwIMFmGA=
X-Received: by 2002:a2e:b4ee:: with SMTP id s14mr9095877ljm.372.1624015189486; 
 Fri, 18 Jun 2021 04:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <9eff854f-92ed-3f09-997f-f81c78a8b5a3@canonical.com>
In-Reply-To: <9eff854f-92ed-3f09-997f-f81c78a8b5a3@canonical.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Fri, 18 Jun 2021 13:19:38 +0200
Message-ID: <CAMeQTsaWZ8Y+sMr4BMS0r_xdwz3hJ+KRT3byyJmq+OeEo=5F1g@mail.gmail.com>
Subject: Re: gma500: issue with continue statement not doing anything useful
To: Colin Ian King <colin.king@canonical.com>
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
Cc: David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 18, 2021 at 12:26 PM Colin Ian King
<colin.king@canonical.com> wrote:
>
> Hi,

Hi Colin

>
> Static analysis with Coverity has found a rather old issue in
> drivers/gpu/drm/gma500/oaktrail_crtc.c with the following commit:

Relevant code is in drivers/gpu/drm/gma500/oaktrail_lvds.c

>
> commit 9bd81acdb648509dbbc32d4da0477c9fae0d6a73
> Author: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> Date:   Mon Dec 19 21:41:33 2011 +0000
>
>     gma500: Convert Oaktrail to work with new output handling
>
> The analysis is as follows:
>
> 114        /* Find the connector we're trying to set up */
> 115        list_for_each_entry(connector, &mode_config->connector_list,
> head) {
> 116                if (!connector->encoder || connector->encoder->crtc
> != crtc)
>
>    Continue has no effect (NO_EFFECT)useless_continue: Statement
> continue does not have any effect.
>
> 117                        continue;
> 118        }
> 119
> 120        if (!connector) {
> 121                DRM_ERROR("Couldn't find connector when setting mode");
> 122                gma_power_end(dev);
> 123                return;
> 124        }
>
> Currently it appears the loop just iterates to the end of the list
> without doing anything useful. I'm not sure what the original intent
> was, so I'm not sure how this should be fixed.

The code assumes there is only one correct connector so when iterating
over the connectors it checks for the connectors that does _not_ match
our criteria (!connector->encoder || connector->encoder->crtc
> != crtc). When the loop is done we end up with the correct connector set in the connector variable, hence the immediate check of "if (!connector) ...".

So the code is correct but perhaps unintuitive. You could do the
opposite (if that makes more sense to you):

list_for_each_entry(connector, &mode_config->connector_list, head) {
        if (connector->encoder && connector->encoder->crtc == crtc)
                break;
}

-Patrik

>
> Colin
