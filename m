Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B47EC38C7AD
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 15:19:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE0076F649;
	Fri, 21 May 2021 13:18:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D8D6F64C;
 Fri, 21 May 2021 13:18:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 230B5613EC;
 Fri, 21 May 2021 13:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621603138;
 bh=kML0VNwTPmuZzhjwUe6WlLUM6s2hR7O8GQYI8nIVEx4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bxlk4rI+nT2n2MilrkZEOxmGPpUtz5EM4hIvKviME1p5OqepyQ5kkp+CvAwVT5cAj
 Ku9puQxIF9brbZ5vJTXmOPmc3eAwU0Um6HuXrJQIMfWiSc0ENOiFOrE3eTi/hekg+7
 byFXoB0KFQyw6TBddhpvCkFbpkZKU5CDjw4wQqVDDNMZI0IgQa1p7I/zwm4I1+QOYm
 fq6i3qeZ4iMVGg+ZO1rpctE0+23FuTODinw/xTnV6LYtInrTs+HAGt5/zcrKdOQR/D
 CqrWl9I1AKZ8JmjwzmXemkdMkVGfzT6ZWZUK1eqlmPNS7llAIuoX3WxG3KGaEhANj6
 9UtXFKw7LR4Uw==
Received: by mail-ed1-f52.google.com with SMTP id g7so11127205edm.4;
 Fri, 21 May 2021 06:18:58 -0700 (PDT)
X-Gm-Message-State: AOAM531r7huZ2EhPPQ8jRV5eOSO86N/7pe5nkDqbMBSQpTuo0n6+9tGt
 Ok0t5jltZGu9Tmy5fSwhjNvzKk8AQ8YFF1HZ2g==
X-Google-Smtp-Source: ABdhPJwmzwbCzIeEFfbyH8umGA8C0KXX6vUz4OS2ROZ9YiW5j/tCvUb0NLoSYwTa9fxOPM6+xMux6sI6PbKiUDMEH5I=
X-Received: by 2002:a50:c446:: with SMTP id w6mr11114280edf.62.1621603136815; 
 Fri, 21 May 2021 06:18:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210521124946.3617862-1-vkoul@kernel.org>
 <20210521124946.3617862-3-vkoul@kernel.org>
In-Reply-To: <20210521124946.3617862-3-vkoul@kernel.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 21 May 2021 08:18:44 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJqPwkzxVgAfS9VgEXcY=ZH5LOaaxzoPDBzuDxOZ_OLjw@mail.gmail.com>
Message-ID: <CAL_JsqJqPwkzxVgAfS9VgEXcY=ZH5LOaaxzoPDBzuDxOZ_OLjw@mail.gmail.com>
Subject: Re: [RFC PATCH 02/13] dt-bindings: msm/dsi: Document Display Stream
 Compression (DSC) parameters
To: Vinod Koul <vkoul@kernel.org>
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
Cc: devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 21, 2021 at 7:50 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> DSC enables streams to be compressed before we send to panel. This
> requires DSC enabled encoder and a panel to be present. So we add this
> information in board DTS and find if DSC can be enabled and the
> parameters required to configure DSC are added to binding document along
> with example
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  .../devicetree/bindings/display/msm/dsi.txt       | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

This is getting converted to schema. Hopefully, v17 will be it. Sigh.

Rob
