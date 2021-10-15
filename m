Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E3C42E858
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 07:17:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE976ECCD;
	Fri, 15 Oct 2021 05:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 944B16E220;
 Fri, 15 Oct 2021 05:17:53 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id t16so33171516eds.9;
 Thu, 14 Oct 2021 22:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IY0VDzzBP/Ta/+EbEWrnfIeYI/gKNtDErU5o48aI9tU=;
 b=ghmufCpFSZTrwm1H++YTPAHtceSg1c7+k5d5bhNCWTjwA8rOKTCPq0sKZUKL9Fmys0
 a3oTpe4bLSc1yIxWMZfcTvYpPSrDJDKpOrXQ83Ne+G3LC6Jr4JKft+rZn11wUucTEi1p
 1syrJcLxQ89XNNgpG9BMlZtbSkvST1Gk89O9sbsB1T/lXRPb9HFNAjDfgJHgJbAJhZlk
 nL6wSxKXPHAmQ8stHpfyhjhy56QQ5q2gNhfeAav+5rR8JfAFIPqf5x38pXNpaQgXLM8I
 PJNT6U/CAl24rTrmXwiHJVLd1fGMw8gOeVBv+mF+TytFDEtvOoZZkU0U3fUEVuJzOG0z
 SChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IY0VDzzBP/Ta/+EbEWrnfIeYI/gKNtDErU5o48aI9tU=;
 b=gtJqOAodBSnMk/N9cI34mh/rLZjR/j3EqNpYqo2f7z1+JWVwyBxTrKny6xohnXjNxR
 zx17BKXnXLp7Ztx4jpVgEXksy9rfqGdOcVzutZgwOihoeavpp6OdS6NgH2sNbyY3rAju
 zr8ajUH9jeIFCCSjqF/D2WoEcnTx4Co3u31u417V97T9BgY7KqnB9aqcRKYN4zV/Z3m8
 VzqkAyxXe+X1kmZQjDY3KbMuJAS7EmDEuiK/kUqlC5lFf86VcerfrulY0c6Kf7yKfuUk
 jUGLDevrU8aGt5p3wnUxNUNWPuURwL0Ee40AxFuqqyvykd5OBXUek+f2CRUl6AGfpeHg
 jL+Q==
X-Gm-Message-State: AOAM532eF5aMOVjWsKi/HyMJ2EzavW+E0gxzbsDIQFsyn/qx+4Fn/sDm
 OkhhYdDTosE5/KzX+Tqwdyb7/9p2VPtceJD3MnU=
X-Google-Smtp-Source: ABdhPJw9/RH6fccv0J/pir5ytqRVb5bsqqdJtiC2IIaQAskMYkm18UnxljhJJkJzBzNhx1meTeBUSmlc7pWdmR+2G9Q=
X-Received: by 2002:a17:907:2156:: with SMTP id
 rk22mr4344953ejb.64.1634275072068; 
 Thu, 14 Oct 2021 22:17:52 -0700 (PDT)
MIME-Version: 1.0
References: <8ac9a968-64d8-44ae-a9ae-863c21524fce@linux.intel.com>
In-Reply-To: <8ac9a968-64d8-44ae-a9ae-863c21524fce@linux.intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 15 Oct 2021 15:17:40 +1000
Message-ID: <CAPM=9tzcrtHqLtKVrpOp9nPxY5+owxz372pQ=ZhXq9tWn_nOmw@mail.gmail.com>
Subject: Re: [PULL] drm-misc-fixes
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Sean Paul <sean@poorly.run>, dri-devel <dri-devel@lists.freedesktop.org>, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>
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

> - Respun clock fixes for vc4/hdmi.

I was uneasy with these patches due to the number and size of them at
this point in the cycle. Is there any major problem leaving them until
next? I think fixes needs a hard reset and rebase to rc6 when it's
tagged.

If these are super-urgent fixes then I'd rather they come in a topic
branch I can give to Linus separately.

Dave.
