Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1082F1AE686
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 22:10:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC796E14C;
	Fri, 17 Apr 2020 20:10:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15EC86E14C
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 20:10:12 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id z26so3303230ljz.11
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 13:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Nn6G8tOQDnhZCGYyqE58VkBwJRY/Jdvi62QL2IbYz3A=;
 b=NXNZ+W4Ro39UanrkLkeev1kwQhCojeyeO7cmeaA/B2+Fvjht8CfmC9aNSp78fuOzsa
 c5d3Oz8ry+WH9gqAa7xiZfgjlSS33ys/wiqM6ZfZLHe9yZgOmLMWpTCefYmaVXBNTqFG
 Dzu1k5cK3ErFXC8dW48gQrS6VBivsufqlWvaL21b3YquvG8S2mCHneh9HkviuFfhQztO
 wSHSz0CSkGEXNNBVs+35pvrT1j99TbalBy89M2RB4ZhesKOwYJcSREA8UBOXoUVOAEfu
 sU1p843GDbUynMth6isTHlMW2691kOrOA0/y2Q5SuovIdjxkk8cr98jwwms3Dxm4dfLO
 TzqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nn6G8tOQDnhZCGYyqE58VkBwJRY/Jdvi62QL2IbYz3A=;
 b=EKF9QozXv8OCFuJoG9LMn2P+pTPWvAiC5W6ehMIMmIs4imuTmAJGJSQ1osQX40xcIs
 RZLsCMBqPA1vcseKssoH7TK40amBhNqYCCQaa7bsz6yvNCwRGt4YzEcoYR2xBSibV+0e
 tazgVfPOYxo5umxq3lYFvOyGqlfQWHV2FkcVF7+m/NVMzhDMYRkb4/jAFtUjxfS+xbmI
 UdK98QSZu81vQLmDNgrmwmWisWl7cAPGm/DeY651Z0DzIiYKiLkZiFTJ8//8r58QCE/l
 4xMkTyu+PnhBsyydUCbI2H2OY8Ba8+FkaqHSPM063B+TMu0bL29/EdLrZL7WCCRKKVKy
 +c3A==
X-Gm-Message-State: AGi0Pubhc8XidNNvta9ey51YN6GZPAlD/VZVtd+uzD5oyTHkR4Rp+yCA
 xR50UchZQhNtSSqsd8VOLKG62iF4zjH5u3RMAO4NBg==
X-Google-Smtp-Source: APiQypLmo6iLs0Vo2SZfZMAO1FiAm922yRX8/1hFzV5YcdLsR9PLK3r8zfYrnEhDB4UeQEH1/if/YU25XDJlQ10GWJk=
X-Received: by 2002:a05:651c:32e:: with SMTP id
 b14mr3143246ljp.277.1587154210420; 
 Fri, 17 Apr 2020 13:10:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200409013947.12667-1-robh@kernel.org>
 <20200409013947.12667-2-robh@kernel.org>
In-Reply-To: <20200409013947.12667-2-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 17 Apr 2020 22:09:59 +0200
Message-ID: <CACRpkdbTO+fdW9EqEJQ=BUki-c4Nn6uUaD_TPf4Y2DyxM2TEsw@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm: pl111: Fix module autoloading
To: Rob Herring <robh@kernel.org>
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
Cc: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 9, 2020 at 3:39 AM Rob Herring <robh@kernel.org> wrote:

> Add a missing MODULE_DEVICE_TABLE entry to fix module autoloading.
>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
