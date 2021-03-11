Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A9333791C
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 17:20:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E73A16EE56;
	Thu, 11 Mar 2021 16:20:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 942CB6EE56
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 16:20:42 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id f16so2883638ljm.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 08:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4mfW5335h/WRWI9dVCvKJHe+RapkHx/nphEJf+JLEfY=;
 b=oj/xGKhwPlYIKGs7xGNB09v6HFRF++lyyRmlXCz0eDkY5xcQ3u8RrezpbRkdy11V9C
 +uhCGn6P/rPEbM965aoKuppk2Gvsz3XB7dmtWBEj3Emdg4PGblZQXIghdjISOtxHhdAD
 aY6hAoFGFd5oUpC/2iLC3lzxRzBo3LWLHI52K7qiGdsN4tHYQ8AaUxh9m7mzXK0nXhV7
 0TL4XbcYXCFYcfdH80iGpegLieJLpUbb16RFrglCRznxrD6QDUbtMYsNFXi/jR2aoDek
 tGQmVPJ4JxDfABjrXQPMXsTqvbWSOpjf20XOFkdOJqd+b5SE51BGdaLoFVP2lAZB4aB2
 wBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4mfW5335h/WRWI9dVCvKJHe+RapkHx/nphEJf+JLEfY=;
 b=lTYqkH8F7UBrxJc3/k34SF/Rr8AEar0aSx8alGjcWFG01CKojmS1W46o0S2kGcLpoH
 HuyK/2i19i5Axw2yx7cWRkUHOTGQkp9hPY4qNn7i/m4vQ/lI98057TTM69Yakt5VLBOF
 k81QtLxdrsqlbAOae2BiWGGquk6RdDThx6Mm6poGTqbXhPo3bLwMwdvLtj10yw8NGlfJ
 xvWeyIc7jGeoGhskNkNvke5TZV2+nYI5jYVw1+jdYXPW5ZSC2abf+Mw50t89urf7pj3f
 FgW40jNNzFP0gBXDdpiXiIsAFnRSh6aCbBXe8R1zx4d6Dt1MiJ8lgxnVh666f+coXhKM
 iQaw==
X-Gm-Message-State: AOAM532V7jnXZbr6rImJ/OSgPB7qWUxCflTPpj6d+QAcu3D1PCTvKj/h
 +Ej+iBUaL3nfZa13VG7Y+O5LZt5n1i9+apiDEGtZCg==
X-Google-Smtp-Source: ABdhPJxUPh5qHPBDejHPkQZGXI7Wr8UqPIjSZ7fl43pyrVqj46hUhhEA5svMYWySIqUU/pYnrGqKZGpg5zRKasOSBwk=
X-Received: by 2002:a2e:864a:: with SMTP id i10mr5068722ljj.467.1615479640987; 
 Thu, 11 Mar 2021 08:20:40 -0800 (PST)
MIME-Version: 1.0
References: <20210115224420.1635017-1-dianders@chromium.org>
 <CACRpkdYUs2W3b_u8YrmYwq_kcUCf0DhZ-o2o6O2EmU5rdtv=BA@mail.gmail.com>
 <CAD=FV=WDVAj+OcVXaTJRUu8tvdDzySW0KOfiGqZHi5YvP42BTA@mail.gmail.com>
 <CACRpkda1Ast1cqNfVJ_u6zs8610DWSQGykPt4yBw+mFZFrUPSg@mail.gmail.com>
 <CAD=FV=Vj-6Y0X667o5vH0EL7hXi6sU4ZWs_a41B6h0D1s05_Hw@mail.gmail.com>
In-Reply-To: <CAD=FV=Vj-6Y0X667o5vH0EL7hXi6sU4ZWs_a41B6h0D1s05_Hw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 11 Mar 2021 17:20:30 +0100
Message-ID: <CACRpkdZpy9yvp+bzHUGiZVyFBDpJHJcYSZQnBQreCfTQLOj1-Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] drm/panel-simple: Patches for N116BCA-EA1
To: Doug Anderson <dianders@chromium.org>
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

On Thu, Mar 11, 2021 at 2:01 AM Doug Anderson <dianders@chromium.org> wrote:

> If you happen to feel in an applying mood one other patch to
> simple-panel I think is OK to land is at:
>
> https://lore.kernel.org/r/20210222081716.1.I1a45aece5d2ac6a2e73bbec50da2086e43e0862b@changeid

I applied and pushed this as well.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
