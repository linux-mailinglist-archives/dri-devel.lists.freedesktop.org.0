Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 068B7320172
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 23:46:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF3D6E0DE;
	Fri, 19 Feb 2021 22:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A19326E0CB
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 22:46:44 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id t26so6026531pgv.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 14:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=77aFN3X3B8ZOa2LFV3nt5PPEdkKjE+anr2eIHArGBZI=;
 b=mNayBvgQSMayniwbb1d97dRJpctfMgOIorNOVhijMSM+SLYhY7+q7UyttewTf9a2Hp
 B3Jp3CFUjbYUJfipkc3GFgul0vtBVKZAasjqy/DQskZ8j9FkqI0Wvgx3wDdMzisNK43X
 YkWW/eknmby9epgU1tvmCJXUYmOHkCdklRSmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=77aFN3X3B8ZOa2LFV3nt5PPEdkKjE+anr2eIHArGBZI=;
 b=Y9xProUfTlZGUdhqKl4/r8UB/cDb7t3pIKDXAFLqDj8MJAJ5MYr3y0AyJuONBvjGoQ
 N32UxIHtTm1SMGzya5ctlsa79dtnivL4s6AlrdGLszrfaN3AIIEWyzXhwRLmCYGwtF0R
 3hR1IM9MBwGcnlnt3IgKowM/J7iUSpsn/RzGeKdiFI8T+LB62ghJPoVhrSzd6tHN1e3+
 TuzTm/ihmkOvlksUZvLq0viH8HcH0X3VWCbLx/DCAX08o5XbFfpZBlvpl/oK0spK6aCI
 NgVYu0O3/mpo9XfBLCUrMd84Ote7UOiQCQ27YC7NtvPIOl7UzVp5hgpYodd35EWQGyAu
 gKMA==
X-Gm-Message-State: AOAM530rl6PXxotwAZqsceYvYQqiIjdqcW9YojuOc6xjuVaDpRbghLHv
 seqckM1VrvCNgK8c3MbKH+hhRg==
X-Google-Smtp-Source: ABdhPJyphuJcAQ8DmrcSWPjKefON0H2PGIBTxC+RlzDXEyHoy4w2bBE6hWP83maxY6SZS9eKqjnzGw==
X-Received: by 2002:a62:e703:0:b029:1ed:5a8b:4308 with SMTP id
 s3-20020a62e7030000b02901ed5a8b4308mr2846228pfh.67.1613774804277; 
 Fri, 19 Feb 2021 14:46:44 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:dd53:b29e:3c8:33ae])
 by smtp.gmail.com with ESMTPSA id x9sm9342392pjp.29.2021.02.19.14.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 14:46:43 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <7af07dcacd5b68087cc61e467e9c57ea@codeaurora.org>
References: <1613681704-12539-1-git-send-email-khsieh@codeaurora.org>
 <161368935031.1254594.14384765673800900954@swboyd.mtv.corp.google.com>
 <7af07dcacd5b68087cc61e467e9c57ea@codeaurora.org>
Subject: Re: [PATCH v2 2/2] drm/msm/dp: add supported max link rate specified
 from dtsi
From: Stephen Boyd <swboyd@chromium.org>
To: khsieh@codeaurora.org
Date: Fri, 19 Feb 2021 14:46:41 -0800
Message-ID: <161377480166.1254594.16557636343276220817@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, tanmay@codeaurora.org,
 aravindh@codeaurora.org, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting khsieh@codeaurora.org (2021-02-19 08:39:38)
> On 2021-02-18 15:02, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2021-02-18 12:55:04)
> >> Allow supported link rate to be limited to the value specified at
> >> dtsi. If it is not specified, then link rate is derived from dpcd
> >> directly. Below are examples,
> >> link-rate = <162000> for max link rate limited at 1.62G
> >> link-rate = <270000> for max link rate limited at 2.7G
> >> link-rate = <540000> for max link rate limited at 5.4G
> >> link-rate = <810000> for max link rate limited at 8.1G
> >> 
> >> Changes in V2:
> >> -- allow supported max link rate specified from dtsi
> > 
> > Please don't roll this into the patch that removes the limit. The
> > previous version of this patch was fine. The part that lowers the limit
> > back down should be another patch.
> > 
> > We rejected link-rate in DT before and we should reject it upstream
> > again. As far as I can tell, the maximum link rate should be determined
> > based on the panel or the type-c port on the board. The dp controller
> > can always achieve HBR3, so limiting it at the dp controller is
> > incorrect. The driver should query the endpoints to figure out if they
> > want to limit the link rate. Is that done automatically sometimes by
> > intercepting the DPCD?
> 
> ok, i will roll back to original patch and add the second patch for max 
> link rate limited purpose.
> panel dpcd specified max link rate it supported.
> At driver, link rate is derived from dpcd directly since driver will try 
> to use the maximum supported link rate and less lane to save power.
> Therefore it is not possible that limit link rate base on dpcd.
> AS i understand we are going to do max link rate limitation is due to 
> old redriver chip can not support HBR3.
> How can I acquire which type-c port on the board so that I can trigger 
> max link rate limitation?
> 
> 

The driver already seems to support lowering the link rate during link
training. Can't we try to train at the highest rate and then downgrade
the link speed until it trains properly? I sort of fail to see why we
need to introduce a bunch of complexity around limiting the link rate on
certain boards if the driver can figure out that link training doesn't
work at HBR3 so it should try to train at HBR2 instead.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
