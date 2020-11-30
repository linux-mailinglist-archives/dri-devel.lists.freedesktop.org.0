Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8412C7E16
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 07:20:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D0F6E3FC;
	Mon, 30 Nov 2020 06:20:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA866E3FC
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 06:20:10 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id iq13so698892pjb.3
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Nov 2020 22:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=e6/0gQdvLoVUNAqzND9z211r0JVYgRFA1dvP6rq7O2I=;
 b=Y6f4khUrZoLfQLqy69ifbfbcTpPOG3XcRlzw8TU3PDdfr87ez15ZoDz9Klr7Bi9pNN
 K0cUG+yBuv7eSOSHj2P+KOaBCiGLyFGQCV6IpiSinLzJIhVzwPh8UvTGJO7YUDCdk2MS
 rfkqiJw7k7A5x6bhLg8jn5hzXE/ycO2lP7jRmLrBTGfdc9bbTNUPIT5fBTKG1vAp/cmQ
 YuDFhkfCh4o+DtMuUHLLdU8HXv7HcSyljb9uLur7IPwYaKkuxFBhbmG3KSQve1ORQCEN
 Iwd7HIJOP/Y9mXB2pPn+rFUfExFksjiLIoGfqfTKe1DOjbn1eVRf/3suti2v+A9qUH1O
 yOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=e6/0gQdvLoVUNAqzND9z211r0JVYgRFA1dvP6rq7O2I=;
 b=HVr7QUXE8HygdMSE6OqzhcLotVUF09XcuBZdhSFQpJXeB5H3J8IdVCQe26YJHkduO5
 kCe2O4LkryBJon179Q4P8YbVD5gP/Knm9iJRAJq+0VA3tytqT9aw5KyIIs8Z9aVllZbw
 Do5c4fU7YeIE1ecDDfcJ+PBeNV1UYSqS/iMMVTz83dLZpxaSwP9ftDJ1JJrei2sAHygl
 xKakq6nxphUN2LGcZCHF60K2tCi3Lq/pjBRvN2myrTdMmt0uV6KgDwDsyHEiLsGdrZiF
 vHeGF9Sn7SjlUj+cJ4CQXq0gMgwA3P4K3U07YR5HRVh32cRx7KfwFLztaVYbX2ksSHdd
 jtkQ==
X-Gm-Message-State: AOAM531zbAL02S5a+ZhO3a77HXVXpmD7YsIdgSHmUgs5gX3pPKS4DJ5u
 1eqi1q9jd6maoIZCZu3g7EmfHQ==
X-Google-Smtp-Source: ABdhPJxPYNdR6BJ3iG7Ra34F3nFO3OcGXFwA4UclLlDhKqm+lE0TfNn/LO5gZblhCwsWtMAR0KM7RA==
X-Received: by 2002:a17:902:7488:b029:da:6be9:3aac with SMTP id
 h8-20020a1709027488b02900da6be93aacmr6634118pll.59.1606717209620; 
 Sun, 29 Nov 2020 22:20:09 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
 by smtp.gmail.com with ESMTPSA id 16sm19896139pjf.36.2020.11.29.22.20.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 29 Nov 2020 22:20:09 -0800 (PST)
Date: Mon, 30 Nov 2020 14:20:02 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] Revert "i2c: qcom-geni: Disable DMA processing on the
 Lenovo Yoga C630"
Message-ID: <20201130062001.GB28578@dragon>
References: <20201124185743.401946-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124185743.401946-1-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Wolfram Sang <wsa@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Steev Klimaszewski <steev@kali.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Akash Asthana <akashast@codeaurora.org>, Andy Gross <agross@kernel.org>,
 linux-i2c@vger.kernel.org, Mukesh Savaliya <msavaliy@codeaurora.org>,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 24, 2020 at 12:57:43PM -0600, Bjorn Andersson wrote:
> A combination of recent bug fixes by Doug Anderson and the proper
> definition of iommu streams means that this hack is no longer needed.
> Let's clean up the code by reverting '127068abe85b ("i2c: qcom-geni:
> Disable DMA processing on the Lenovo Yoga C630")'.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Acked-by: Shawn Guo <shawn.guo@linaro.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
