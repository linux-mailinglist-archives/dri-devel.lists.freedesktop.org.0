Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C40C4A2AF7
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jan 2022 02:26:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF3C10E152;
	Sat, 29 Jan 2022 01:26:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0337010E152
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jan 2022 01:26:43 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id i10so23527731ybt.10
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 17:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=JbpMAj7CncoORA+WbrHTXHTdElJMCbzCL8WIdkltAx4=;
 b=u/g64RcnvlaTMTblwtN0TfTdySyyggXBAk0gRIL7m29gjXgkOlKqvFECIDitMcektX
 j5PoPZbaYKTyI/m2zZz+a33eJ2FoIlxspM6dd3ErGloRH+mLVrezDVpGC2EH/UhWYr+f
 3EKfuiLAHCQxqaOIyGJyRMAH7U9y+u+VeFrW0GP761D7SrIqNA5rbB/2r4fCBLzganTr
 RcRZkTsXviHiVuoB/lBvknhXzKUp3LzTBY8OMqCq9ozsAnR3qA+PSwT4Y4CQi8p270W/
 ve8Y5H2q6UPJ67tD0JhGpFJ+wSm+KQmhgjORm681A/olHxAXe32o5ETuIMjcmvRyYTEB
 19oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=JbpMAj7CncoORA+WbrHTXHTdElJMCbzCL8WIdkltAx4=;
 b=v3ldrL2MY7gUcJORR9GrTVPLvp+p6Q7j9r3clIUoNLVA4Z1MdiXDam6+TK4KcwtwPg
 q5BtRcFkcsfFHgWWXJG/we9DrRLztz5P5jKw1mVr+TtFI/lTyMMICn7dn8GUPWiUACM0
 eSLX41Jbj4iQ4TfJfNHKCNyigYKiv26YO0M+wSTgZAeAtC24eL2896FW0CXgFiCmmpxk
 C2i0V24sC7JNDcLWSmlH3rjORLslo8rV79QummdHqRjP8CKAtN9BvkKHuViwgViKEmZU
 d3nUZOUCg5hxn0v1qSxZ7IqkoWnLMi0uarjlat8ttgmoFda7rmtBeJVok70ylExa9Dwd
 5Nug==
X-Gm-Message-State: AOAM532y4HSym+pdW3XVmyoBW0PsjgOd8o0os5aoqWjseip11+U5JKHV
 h804sSq/jInyY5DyIXSLGZP2PbtjapD/g592HKI3Nw==
X-Google-Smtp-Source: ABdhPJyHa1mHpl2iu1FYlUB4r4htQgHW95kWjE6NwsGM/mnh2V0tepY8W9+mGTG1EqRvnqCA7+ZnDjL2KxXbZq8NDWo=
X-Received: by 2002:a25:df56:: with SMTP id w83mr16182690ybg.110.1643419603057; 
 Fri, 28 Jan 2022 17:26:43 -0800 (PST)
MIME-Version: 1.0
References: <20220103113822.654592-1-linus.walleij@linaro.org>
In-Reply-To: <20220103113822.654592-1-linus.walleij@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 29 Jan 2022 02:26:31 +0100
Message-ID: <CACRpkdZSz9gCHyHz7=ZKSGBH9GuozmfiZ_a-MHmoJ_5h8ED8cw@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/panel: Rename Sony ACX424 to Novatek NT35560
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
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

On Mon, Jan 3, 2022 at 12:40 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> A code drop from Sony Mobile reveals that the ACX424 panels are
> built around the Novatek NT35560 panel controllers so just bite
> the bullet and rename the driver and all basic symbols so that
> we can modify this driver to cover any other panels also using
> the Novatek NT35560 display controller.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Could someone take mercy in reviewing this patch set?

I can offer some patch review back!

Yours,
Linus Walleij
