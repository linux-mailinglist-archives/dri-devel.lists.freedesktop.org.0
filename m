Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC16E3E970F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 19:51:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7715B8972B;
	Wed, 11 Aug 2021 17:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8376C896ED
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 17:51:40 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 c23-20020a0568301af7b029050cd611fb72so4344379otd.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 10:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=2DfNuz5O7Mpdzge58x7dhXEmqV1KbsWUVKw3z3NErkw=;
 b=KegjHwRhqP0eyTIjTxdo+VQWrHOjxNclssYbN0gYdv+UXtuPfpLohCE61Br2R0f0xS
 sVV35sxF3U+OMySclqVD79ydUWjUvGcKMnapmPU/O6z0A22kYnk00cKWLKFDpniF2zh7
 YgjtJ2yV4YWL/DTcfHaijEnuQsELdmlb8846E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=2DfNuz5O7Mpdzge58x7dhXEmqV1KbsWUVKw3z3NErkw=;
 b=tNp7F8BwyOg88njcjMOV9/2jNuKBGLnfCA557kZnoXIW2f3Ygo0Jf4b/CmxA9j6YhI
 F2PJzXU8Zn9ngwrxXFsNoALlHrfbOhOWMHGUNktZd5Eujoc90Wpmw56TvSYG5X1c0Z3k
 SfwP6N+uRbZi54yGoBxUYFmRECOIJF0b4/9zF3dzwhrGcJ9ECT0PWAeBrueKfZx3fMZZ
 WS95un4b4G106FqCyaX+WZCB+1bS7/cpIoZikQiI91mWuys9JViWXfodyHcPk37qHnaV
 1mmlHPHe7X0c7JshYL8lytRsRhVpL0560ornSUffXUMmGRnJquk2hfNUqzk7VnCJs1Ig
 rsLQ==
X-Gm-Message-State: AOAM5302DibU3Q0y1vqzhCwGbRF9FZ0wDn+V+W07BgpDCPNf3zwOT2it
 prMM8/hPAj9oRHKJMSQu5K9XL0zKe7B4nPaSEVacJQ==
X-Google-Smtp-Source: ABdhPJxP4Vj/nnRZByQ6ppiULeaZtVP0wwSMf/t1xhztsfuKaN7WpnJStix5REbZv/OdPm2wJyTwoly2glhXlLB7PX4=
X-Received: by 2002:a05:6830:1490:: with SMTP id
 s16mr120971otq.233.1628704299752; 
 Wed, 11 Aug 2021 10:51:39 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Aug 2021 10:51:39 -0700
MIME-Version: 1.0
In-Reply-To: <1628691835-36958-1-git-send-email-akhilpo@codeaurora.org>
References: <1628691835-36958-1-git-send-email-akhilpo@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 11 Aug 2021 10:51:39 -0700
Message-ID: <CAE-0n51i2OcQ5G=nDXyOQwYoT4j3iyRKu8r-YYotmqTNfaBzhQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] arm64: dts: qcom: sc7280: Add gpu support
To: Akhil P Oommen <akhilpo@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>, 
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, freedreno <freedreno@lists.freedesktop.org>, 
 linux-arm-msm@vger.kernel.org
Cc: Jordan Crouse <jordan@cosmicpenguin.net>,
 Matthias Kaehlcke <mka@chromium.org>, 
 Jonathan Marek <jonathan@marek.ca>, Douglas Anderson <dianders@chromium.org>, 
 Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>,
 linux-kernel@vger.kernel.org
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

Quoting Akhil P Oommen (2021-08-11 07:23:54)
> Add the necessary dt nodes for gpu support in sc7280.
>
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
