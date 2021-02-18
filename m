Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7738B31F2B7
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 00:02:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F0E6E89B;
	Thu, 18 Feb 2021 23:02:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB7D36E89B
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 23:02:32 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id t11so2202704pgu.8
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 15:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=vapw8v9gd6gzUZfgZWeHcnI7BY6UOi1UlhquxFwuYA8=;
 b=myyxUgL8UCCIqyF9TebzT62kDycJr1y+iVGqSe8euO0ZH6L0wL44ljB1lRBO2DwHFa
 pvcC4/CkIpCKc+n23ZHRreytCuqUSGCi268XsZZ6pRIUauZYc4IdG4pv6tWXXocLUIaW
 H918ZYZifVJj+zdvqTI+5BJzJUa91CWz8qH3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=vapw8v9gd6gzUZfgZWeHcnI7BY6UOi1UlhquxFwuYA8=;
 b=E4gq6krcu8RJEZ2I8lmXMq4y4jxUDgrPOeZL3+K9FiB2xI9E2Q5tYZl5RNiVoeLkZe
 saerV92JuBY84Dzxg0T4tsTLhukpx/OWxv+k1cPFHCY3bYQ6qBjH2AlJRzKpifqwtBeC
 ZtYW1CNTZMbOeJhKaCB0ko6dhiHMpcLQ2RF4qY+8n36gW3VCtwfNy9WUF22/etwkpwJO
 xyAHlQxbXEuSczu9yV8NxivkZSmhhWde75Y96lSVaWbiidVg3uPmYFyDCW90UvLNiIbB
 0zNJgCL0H4uimyzYgfd3pbuhtSNhPhniaaAod68XLl3MRvB5n7V0M//EHQgw6wfTYaP0
 soQQ==
X-Gm-Message-State: AOAM531RqR3MK65H3v0WLOJ22R7ZsSuxDOTXZSF0wx6Xm3b6OY0tll/m
 /a3Xgn4NF4M2n80vUppqF+oTTw==
X-Google-Smtp-Source: ABdhPJy9l/n+BZwpzPMU732tYNzMsXY8ijKjjyCt211yBXiRCWRp4d87GdOMQSntjHwy7ERugFHcDg==
X-Received: by 2002:a63:1409:: with SMTP id u9mr5796112pgl.312.1613689352388; 
 Thu, 18 Feb 2021 15:02:32 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:e561:d87c:c8df:56e2])
 by smtp.gmail.com with ESMTPSA id c18sm6566737pgm.88.2021.02.18.15.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 15:02:31 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1613681704-12539-1-git-send-email-khsieh@codeaurora.org>
References: <1613681704-12539-1-git-send-email-khsieh@codeaurora.org>
Subject: Re: [PATCH v2 2/2] drm/msm/dp: add supported max link rate specified
 from dtsi
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Date: Thu, 18 Feb 2021 15:02:30 -0800
Message-ID: <161368935031.1254594.14384765673800900954@swboyd.mtv.corp.google.com>
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, khsieh@codeaurora.org, tanmay@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-02-18 12:55:04)
> Allow supported link rate to be limited to the value specified at
> dtsi. If it is not specified, then link rate is derived from dpcd
> directly. Below are examples,
> link-rate = <162000> for max link rate limited at 1.62G
> link-rate = <270000> for max link rate limited at 2.7G
> link-rate = <540000> for max link rate limited at 5.4G
> link-rate = <810000> for max link rate limited at 8.1G
> 
> Changes in V2:
> -- allow supported max link rate specified from dtsi

Please don't roll this into the patch that removes the limit. The
previous version of this patch was fine. The part that lowers the limit
back down should be another patch.

We rejected link-rate in DT before and we should reject it upstream
again. As far as I can tell, the maximum link rate should be determined
based on the panel or the type-c port on the board. The dp controller
can always achieve HBR3, so limiting it at the dp controller is
incorrect. The driver should query the endpoints to figure out if they
want to limit the link rate. Is that done automatically sometimes by
intercepting the DPCD?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
