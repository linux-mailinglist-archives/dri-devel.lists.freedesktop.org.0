Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE41E227A65
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 10:18:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A7E289A6D;
	Tue, 21 Jul 2020 08:18:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F133189C3B
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 20:24:50 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id s26so9623773pfm.4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 13:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=4Ot9BSN65uwqjuzPt11oHFwPT284z0A1s3vHTUzwUuc=;
 b=P7kNkP1J0vskqpeYwWoRwgS0pIRkpEhb9+IyXfYYWTqympKRjTVxOzshkA4wbQFkw1
 xv9aA77wGusH5dc9v0Il+7wnwsbnpxhLK1PWdwacHM6/F2emh32Sb7s/jQvJX/xs9KlF
 16yDXjDs1sHY/0t+BRFW3GFojUuvY8/lS8QWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=4Ot9BSN65uwqjuzPt11oHFwPT284z0A1s3vHTUzwUuc=;
 b=FLQQ64Q4oep7qhljSFDAnyInVSllvP4i6cy3IdfEZl/dw5odcjPAWZiwxpg6zRNEcn
 Y7VPhwqITy8vs8vMfag88nKqFgDyhy2jw5iUBtPX7Jp802O1p1sNGVoFLc1YH1zPk4v1
 vrvxBUZAXi8JOC4uXP27meFSEejwWvOCB5PBazU9SSQXzANr6b5/S/+jLM7VEfUVf8Ri
 ybTjfgxiIYCe30UZRL1DrLWma4w351GXDgGh9yp0LabtMLLmBlhLjNDweETav429FrtY
 Hdw+4yGKol47QAdPfkftv6SYD2y5axVrLiXb6C5ImdJEJnBjdUcNEhn5YPJaOc+N4hIj
 vaJg==
X-Gm-Message-State: AOAM530oc0/Tf6LIgGqO9IcIselO7alI0hteFJxF9Hx5P6nNOv8rZZP4
 3rnGfBBFRE4h+6yJNp2pzpm1XIA932w=
X-Google-Smtp-Source: ABdhPJx0ht90Y69rD5rQnfk78renCW+m6JoyhG8U2VU/215s6FVTp+kZISZ6zfOaaE+wVaD2kwNDvQ==
X-Received: by 2002:a63:5220:: with SMTP id g32mr19401467pgb.78.1595276690630; 
 Mon, 20 Jul 2020 13:24:50 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id hg13sm433919pjb.21.2020.07.20.13.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 13:24:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5c2265e82af8f755d649c0c36a462f19@codeaurora.org>
References: <20200217085842.28333-1-harigovi@codeaurora.org>
 <159304723830.62212.5069780400830519255@swboyd.mtv.corp.google.com>
 <5c2265e82af8f755d649c0c36a462f19@codeaurora.org>
Subject: Re: [v3] arm64: dts: sc7180: add nodes for idp display
From: Stephen Boyd <swboyd@chromium.org>
To: harigovi@codeaurora.org
Date: Mon, 20 Jul 2020 13:24:49 -0700
Message-ID: <159527668913.1987609.9777678660905277260@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-Mailman-Approved-At: Tue, 21 Jul 2020 08:18:03 +0000
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, kalyan_t@codeaurora.org, hoegsberg@chromium.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting harigovi@codeaurora.org (2020-06-29 06:50:09)
> On 2020-06-25 06:37, Stephen Boyd wrote:
> > Quoting Harigovindan P (2020-02-17 00:58:42)
> >> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts 
> >> b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> >> index 388f50ad4fde..349db8fe78a5 100644
> >> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> >> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> >> @@ -232,6 +233,57 @@ vreg_bob: bob {
[...]
> >> +       ports {
> >> +               port@1 {
> >> +                       endpoint {
> >> +                               remote-endpoint = <&panel0_in>;
> >> +                               data-lanes = <0 1 2 3>;
> > 
> > Is this property needed? If it's the default assumption it would be 
> > nice
> > to omit it so that we don't have to think about it.
> > This property is needed during panel probe. If this is not mentioned 
> > here,
> mipi_dsi_attach() will fail during panel probe. In dsi_host.c, 
> dsi_host_attach()
> fails since dsi lanes are greater than msm_host lanes. msm_host lanes 
> are updated
> as part of dsi_host_parse_dt. If we dont provide data-lanes in dt, it'll 
> have default
> value and fail in dsi_host_attach().

What is the default value? It looks like dsi_host_parse_dt() says it's
using a default but I guess the default is 0 lanes? Why not make it the
normal 4 lanes?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
