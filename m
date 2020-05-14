Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6071D2528
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 04:40:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E72776E0EF;
	Thu, 14 May 2020 02:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D6B6E05A;
 Thu, 14 May 2020 02:40:19 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id h26so1268462lfg.6;
 Wed, 13 May 2020 19:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K4cErI3AscpNO2jykaWdRgxSDShuBARQicHYOzOkFX0=;
 b=B2FcAITDo8OkHtW3DZIV1grkQJEgpVzfrgtp/B4KO+r0+kVVTEKA5QPhZSmo9nYnJE
 oADABPqGsbNupidK8+8SNhVQoDPHaTV+bo9PpZ5Z4udffLQDL0vO+GBzvy8BVkpiJFmq
 W4U98ognAFTPWJZOaiTdbiJpgVb6lU6CWvmlbycvoAjNF0/FAk5brvEc6gwxqhZUV4bW
 pkux2Xu5Wz+C8sipIYZqPLzsGszAVdWrt5EsCwU9slksUIRqa0d/kzXYOL9XAtF6vasB
 CEaP4R19egNzfMHOEfu+OXnO2Sd19pjXXK5T1/73tpSA9aWJDH7MkzbLCyLBuEIRuywl
 mjnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K4cErI3AscpNO2jykaWdRgxSDShuBARQicHYOzOkFX0=;
 b=lc0mtAkzGfXnrzDHXc6i8wBh5A5ZA4+r6B60mE6k/6L0l2S588jOpL/DpGtCFUqjCy
 +fUelIroyydzcTP35oejFkiM5AM/J5bxckjq3SU1Lv+7J6Cx+f5pkKafp7c+xAgV8GOH
 VSo5OtSmF++IyeTilAjMHFDtsN8Ey2h1k/429AMod8PeRP6hx99i3UhCZdIOxrk2jkLq
 bV0rtlksZMNEyie8ujrnFRC6CUyBA0/brKrr1eX6c+0bl81KXJOO/5yCGqbXhqTeNCTk
 RGVhWtlYjhjdEwV9RI0cSwHNkBVW4lz2hDtALQUFwBC2EcJ0PfvK3MbwvSSs+uFvjtCC
 cKAQ==
X-Gm-Message-State: AOAM533oWmLhBIbiTY6vGThcM5yk0u8mqJVhL7K8vFtP+Bgd0GrNYjHr
 Dig7gunqbmff1ml/BvyUJ2kcNAOghhEPlCCzHV4=
X-Google-Smtp-Source: ABdhPJykFjdGurpWwc8+7/0JB93hVc0BVhXikueHs05N38p4BgNJAr9FiqZ/ZNaYTXcIraPsA0gJlt3IUDxXjvHlfU8=
X-Received: by 2002:a19:4b57:: with SMTP id y84mr1607420lfa.214.1589424018105; 
 Wed, 13 May 2020 19:40:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200513150007.1315395-1-lkundrak@v3.sk>
 <20200513150007.1315395-3-lkundrak@v3.sk>
 <CAOMZO5B582=tZ_YBCyVYFtGh=z5hZKFxP7XoUHEmH3jZsk2uYQ@mail.gmail.com>
In-Reply-To: <CAOMZO5B582=tZ_YBCyVYFtGh=z5hZKFxP7XoUHEmH3jZsk2uYQ@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 13 May 2020 23:41:31 -0300
Message-ID: <CAOMZO5BdiXCVXs+8jP7PoRvgKd1sxCu4KhjvJBvL=Qig2WOs4g@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/etnaviv: Don't ignore errors on getting clocks
To: Lubomir Rintel <lkundrak@v3.sk>
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
Cc: The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 13, 2020 at 2:09 PM Fabio Estevam <festevam@gmail.com> wrote:

> The binding doc Documentation/devicetree/bindings/gpu/vivante,gc.yaml
> says that only the 'reg' clock could be optional, the others are
> required.

arch/arm/boot/dts/dove.dtsi only uses the 'core' clock.
arch/arm/boot/dts/stm32mp157.dtsi uses 'bus' and 'core'

Maybe the binding needs to be updated and it seems that using
devm_clk_get_optional() like you propose is safe.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
