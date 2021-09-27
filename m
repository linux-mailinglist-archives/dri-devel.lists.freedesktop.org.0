Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD2E419FF9
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 22:16:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 980396E040;
	Mon, 27 Sep 2021 20:16:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E72C6E040;
 Mon, 27 Sep 2021 20:16:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4284F611C0;
 Mon, 27 Sep 2021 20:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632773763;
 bh=Lb3LIgfAEjVXdf1vE2V7OoMMbogeWMravjEabJ1Nxyg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aoqynUkGyB6ZPUI0PZbhRVWrRQEh4dUFl+HnGRbJEjz36swl07OI+waO5juXrxZEL
 jHlAKLJtp7vLEn53dGPq9ybdvqoV7skp3bnJ2v0dt7b3LCLaWszZoJwfgXGV5CewIZ
 EeT9Puax/p5vO3xFfjNQpP/s5z+vV6IucH/tDVc9OrhV9apJ4xfqmWfbZVQ6mT6zds
 T7V/1iyHvtmaHFbCozBGLs87R9buQKkqhGe1GFJbwuhVxRAw/14pw6aQABaZ9IXQ/3
 OdqLZFHV5ZJBQxWkAwNJ0thZGMxGk74lNv+sDueBnQKqvqp7vbKRWok7c77AtHcBAs
 PL2/kpsfVk1jA==
Received: by mail-wr1-f50.google.com with SMTP id x20so9334489wrg.10;
 Mon, 27 Sep 2021 13:16:03 -0700 (PDT)
X-Gm-Message-State: AOAM532gBv0czpDtQcwxSEg+lv57xOMtwMPHKpZpmMu8/MtqBSTGiCeC
 ZQc/+x+OTfYgSEGTivZpEs7Ax9r3HfxZ+EhKVow=
X-Google-Smtp-Source: ABdhPJxhSUG+xfsMcnYBJG/aU9zQ/jW83Rbf6e2ezlqzSM1qdDuC1ur8sa8pPTTU3lbMghJJfkyUaLecI/p3sCcMSis=
X-Received: by 2002:a5d:6cb4:: with SMTP id a20mr1431020wra.428.1632773761805; 
 Mon, 27 Sep 2021 13:16:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210927152412.2900928-1-arnd@kernel.org>
 <YVIg9CxJGaJr1vpp@ripper>
In-Reply-To: <YVIg9CxJGaJr1vpp@ripper>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 27 Sep 2021 22:15:45 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1fEuFsQVY9b1oGdTOHzr8pu9wvrSBCMn2iOvgWqtHNnA@mail.gmail.com>
Message-ID: <CAK8P3a1fEuFsQVY9b1oGdTOHzr8pu9wvrSBCMn2iOvgWqtHNnA@mail.gmail.com>
Subject: Re: [PATCH] [RFC] qcom_scm: hide Kconfig symbol
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: John Stultz <john.stultz@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Alex Elder <elder@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, 
 Kalle Valo <kvalo@codeaurora.org>, Andy Gross <agross@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Maxime Ripard <mripard@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>, 
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, 
 Networking <netdev@vger.kernel.org>, ath10k@lists.infradead.org, 
 linux-wireless <linux-wireless@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev
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

On Mon, Sep 27, 2021 at 9:52 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Mon 27 Sep 08:22 PDT 2021, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> >  - To avoid a circular dependency chain involving RESET_CONTROLLER
> >    and PINCTRL_SUNXI, change the 'depends on RESET_CONTROLLER' in
> >    the latter one to 'select'.
>
> Can you please help me understand why this is part of the same patch?

This can be done as a preparatory patch if we decide to do it this way,
for the review it seemed better to spell out that this is required.

I still hope that we can avoid adding another 'select RESET_CONTROLLER'
if someone can figure out what to do instead.

The problem here is that QCOM_SCM selects RESET_CONTROLLER,
and turning that into 'depends on' would in turn mean that any driver that
wants to select QCOM_SCM would have to have the same RESET_CONTROLLER
dependency.

An easier option might be to find a way to build QCOM_SCM without
RESET_CONTROLLER for compile testing purposes. I don't know
what would break from that.

     Arnd
