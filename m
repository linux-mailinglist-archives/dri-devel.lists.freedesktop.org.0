Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1AD34562E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 04:24:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A3FE6E832;
	Tue, 23 Mar 2021 03:24:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90BDB6E832
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 03:24:44 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id h25so10319287pgm.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 20:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=hodATnKjKQUhE5+cuWqoiqtEQY4BaJr2OLA8v0fcrQ8=;
 b=Woqg7ffdwtVJhO9A1EbkRO1TS2BL2uMiyp1MfJVdCzkz8sIi14UbpOpAuy/p096EHV
 EcT5UvJu5TK5fVulp0NKDEY6zuub54j1ramn1RYwTLOGlCPjDtRfYrltZ74OujqduN0K
 gdL+ccqLFZAJ4xRZrI5x4Fe0pdfXST1p1wS8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=hodATnKjKQUhE5+cuWqoiqtEQY4BaJr2OLA8v0fcrQ8=;
 b=fNe+d+6/Ap1oY4oU9gRVGUgIdgsUNod5A+Ogw98nkK57H48lnQoaeljl5+QEOp+T4g
 vo1da81QxH7vMP8NKtYuOgjys1XDWhUtiVm0yHQKzNtYRQAUv3YskAWBFtN0sAeWIz9r
 RUfpT/DohpJvvNnsDE8WoSKXgEHxPhi+qw+TRJkWLGsQWBIbs2A1HGLKHPOliZbh5bKx
 Iil/56c2oufs0t8gH9fkX7JLmYEj0EwzGimy5U8fHtlBOjSyWUY/hLG7GiGC0Bb4grT1
 epQ/bL4bxqX6zBblmjaCp/kVxY8dwHsjUNnva+44eXE43DHsr4yfDcic9BoUSo2Tp4v3
 vObw==
X-Gm-Message-State: AOAM53000lzZIPOdTdBdcbPrWqomkLxtq10smAMfPcw1UJYWBVoaRIbs
 2Qec2n8xbelvIArczKhTHY87MQ==
X-Google-Smtp-Source: ABdhPJwQuMfvnRVwix8vZq60PYLbsuTsaoSc+9YR/JehIv2GN8pbSU2ylDpgKbh2R38rU+4g5c9xSA==
X-Received: by 2002:a17:902:d694:b029:e6:bc94:4931 with SMTP id
 v20-20020a170902d694b02900e6bc944931mr3157077ply.6.1616469884216; 
 Mon, 22 Mar 2021 20:24:44 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e90d:d453:87ae:2e10])
 by smtp.gmail.com with ESMTPSA id l19sm735913pjt.16.2021.03.22.20.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 20:24:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20210318062650.19886-1-unixbhaskar@gmail.com>
References: <20210318062650.19886-1-unixbhaskar@gmail.com>
Subject: Re: [PATCH] drm/msm/dp: Fixed couple of typos
From: Stephen Boyd <swboyd@chromium.org>
To: airlied@linux.ie, chandanu@codeaurora.org, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 khsieh@codeaurora.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
 tanmay@codeaurora.org, unixbhaskar@gmail.com
Date: Mon, 22 Mar 2021 20:24:42 -0700
Message-ID: <161646988202.3012082.5548408805057433167@swboyd.mtv.corp.google.com>
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
Cc: rdunlap@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Bhaskar Chowdhury (2021-03-17 23:26:50)
> s/modueles/modules/ ....two different places
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
