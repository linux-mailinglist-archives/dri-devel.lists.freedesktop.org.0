Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB9A3792E0
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 17:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 792BE6E4DD;
	Mon, 10 May 2021 15:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C4F26E8A8
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 15:37:51 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id m9so17119989wrx.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 08:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Q8Fq9xmVzE4Yi08lYHc942p8SDyYz8EpKthMuoU/EN8=;
 b=R98k/ks76Wc/daOq3HUiaZS2E1/ffj0sYJzR/zWLDGAmYVS9RZky1JyUwFNS+DLrfX
 GJwG6xNMoWciHHrgDOEXUKHR40dldL3eHKJvZbUi3sz0bkc2mH5WD79pMk6maMdeIKTz
 mc0DPje53gflkwHX5AN5ny+dXbV9MVavLRkpg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q8Fq9xmVzE4Yi08lYHc942p8SDyYz8EpKthMuoU/EN8=;
 b=BR24Ga9kV8Atqb1Sa5JGEIRbiiP+/1Wt2b+Rp+MhELFnVpt1tEg6+lOhFFavTctNQc
 TjdS+8H0WoA+4rdS8lFmSQHmJOLnHmOVvLOdlfnrl8LK2aXtPXENVCSmdqV9K/HaXe57
 d8CEp3GF+Hx6oFXzZw8AxUpYRg/7qTlzybt33JZVjr1UsEi98lrGYsGPNRB5Rv5nKSqV
 cVB+pbNJJPUqeMS7NViw2u0CHxiSKhjak0AcG3IWvJko1R1aStymuDbCGJZM/TnjfXi/
 1ZAGCFzOPlBUsW3qriiSm/vszYFe/OBQMgFLtyz8CH4G5NoH80VvzLLwe+OV2JIC3z+X
 SKJQ==
X-Gm-Message-State: AOAM530wlQ/7ETmuqBcXked0WwRYlRW8hQnBESWahDgrNKhinZCKWcpq
 AZ1ij368OSMUpRIKRk8utnMxnw==
X-Google-Smtp-Source: ABdhPJwmkcmA4nu+CSOPppU9tI8V/Xe5xuKFGK5lkA/7oZ+eAoJpS4pZ+HUs821Hf2nfsvBSQPlp5A==
X-Received: by 2002:adf:efca:: with SMTP id i10mr31824722wrp.284.1620661069925; 
 Mon, 10 May 2021 08:37:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q19sm26039127wmc.44.2021.05.10.08.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 08:37:49 -0700 (PDT)
Date: Mon, 10 May 2021 17:37:47 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] drm/panel: s6e63m0: Depromote debug prints
Message-ID: <YJlTSxUlRXr+sdEo@phenom.ffwll.local>
References: <20210313230913.4108256-1-linus.walleij@linaro.org>
 <CACRpkdapqaiTNENz-s5bGB-6JLb7MzZR6ffVOso9Ds5_qwh+5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdapqaiTNENz-s5bGB-6JLb7MzZR6ffVOso9Ds5_qwh+5g@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 10, 2021 at 01:09:27AM +0200, Linus Walleij wrote:
> On Sun, Mar 14, 2021 at 12:09 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> 
> > The dev_info():s in the DSI driver are very talkative,
> > depromote these to dev_dbg().
> >
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Could someone show mercy on this patch and apply
> it? Pretty please. Patch reviews offered in return.

Indeed that's a very talkative driver.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
> Yours,
> Linus Walleij

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
