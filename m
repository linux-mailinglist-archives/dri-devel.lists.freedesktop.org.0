Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E940921F72A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 18:23:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF77789FA0;
	Tue, 14 Jul 2020 16:23:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C286B89FA0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 16:23:16 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id k71so1846796pje.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 09:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=X/RLsS5yfX7EXYlA8IeOjMJ1W+RyrTvf2oXuin3OWbM=;
 b=BrO4TI/cpnQPTSfx2dZA/ku0JexfDh+Ymk9Y4Gfkn9nEFd8S5ZkoULVC8X08fd4HHu
 0T9CAfxkSarAjc+wsUE4nUvmeYSn4o6qM/3AgPVfzHKA/qTrERRtdhiyuYN+qqJG46jo
 WVVS8Wsn8uH2mlyTG3XclUgKrCe2JYcgpxh9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=X/RLsS5yfX7EXYlA8IeOjMJ1W+RyrTvf2oXuin3OWbM=;
 b=t5/yP8NCeSwrBNW/bMuTzjGtf+bYJ/vFkEUb4IxdD8OduIhXafwRq03kL8kXCF+ejy
 YC9Vc0T3SmMIIpxWWu6paXJGGNvNkt9FtpLW34YUecixRf/O2yNgRTtBR9aawcRmJ+J6
 F42DycinEuWZr3daH6QRKReUyrMf3pg0ulltqn25pidVwHYrvjAyrYWmHv32p1Nji3GW
 0EjZ9PPxZcGqskVoNdKFI+Qv9WGfLNFPq75C2LxX1yNrbOpuTVWUdy/5A1bL/EliYbgW
 RVy/1VORnb7WWyyx+iakYyXb4ANKTVy8Ub6wi8CCiPKB8QvBE0HVun2PVAHkxgZ1VV0w
 peaA==
X-Gm-Message-State: AOAM533EwSnL45bJ5RnkHada3UrjRd4HZ3k12VXMtga6jBs5Ij/t3ONg
 kjzNjIzEdLjp7MzOzV1VCYzJnw==
X-Google-Smtp-Source: ABdhPJyBUwa8eGYp1ji5QbzsXhJoqUprSybfXZ7nPR6Ps/1B7VD1ETC0gv9wRoJi5Jcx5QcoNKKylg==
X-Received: by 2002:a17:90a:e687:: with SMTP id
 s7mr5202873pjy.21.1594743796339; 
 Tue, 14 Jul 2020 09:23:16 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
 by smtp.gmail.com with ESMTPSA id c1sm3262699pje.9.2020.07.14.09.23.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2020 09:23:15 -0700 (PDT)
Date: Tue, 14 Jul 2020 09:23:14 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: kalyan_t@codeaurora.org
Subject: Re: [v1] drm/msm/dpu: add support for clk and bw scaling for display
Message-ID: <20200714162314.GR3191083@google.com>
References: <1592489321-29213-1-git-send-email-kalyan_t@codeaurora.org>
 <20200714011219.GQ3191083@google.com>
 <38dc4bbfd754175e476252c4bc259d55@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <38dc4bbfd754175e476252c4bc259d55@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, mkrishn@codeaurora.org,
 linux-arm-msm@vger.kernel.org, travitej@codeaurora.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, seanpaul@chromium.org, hoegsberg@chromium.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 14, 2020 at 04:39:47PM +0530, kalyan_t@codeaurora.org wrote:
> On 2020-07-14 06:42, Matthias Kaehlcke wrote:
> > On Thu, Jun 18, 2020 at 07:38:41PM +0530, Kalyan Thota wrote:
> > > This change adds support to scale src clk and bandwidth as
> > > per composition requirements.
> > > 
> > > Interconnect registration for bw has been moved to mdp
> > > device node from mdss to facilitate the scaling.
> > > 
> > > Changes in v1:
> > >  - Address armv7 compilation issues with the patch (Rob)
> > > 
> > > Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> > 
> > It seems this is an evolution of this series:
> > https://patchwork.kernel.org/project/linux-arm-msm/list/?series=265351
> > 
> > Are the DT bits of the series still valid? If so please include them in
> > the
> > series, otherwise please add DT patches to allow folks to test and
> > review,
> > and get them landed in Bjorn's tree after the driver changes have
> > landed.
> 
> Hi,
> 
> Yes the patch is dependent on the DT changes, should i add them with depends
> tag in the commit text ?
> https://patchwork.kernel.org/patch/11470785/
> https://patchwork.kernel.org/patch/11470789/

This patch doesn't really depend on the DT changes. I would suggest to
make this a series of 3 patches, just like the original series linked
above.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
