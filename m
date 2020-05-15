Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0431D4288
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 02:58:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F6E6EB9A;
	Fri, 15 May 2020 00:58:21 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A31906E3D3
 for <dri-devel@freedesktop.org>; Fri, 15 May 2020 00:58:19 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id u10so243484pls.8
 for <dri-devel@freedesktop.org>; Thu, 14 May 2020 17:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PYudng5R/wrTc6vNtO9kYwTzA6rGU6HzaC8pWT1Yijs=;
 b=im5Kif4hQbjYjGoKpn59HdHsewBmXMA5l9xRvjBaBG8IMXIe228lODRusVefCZp+wB
 lMMb74JQf1vcjIYjoRXUJ9onY/hyUMpdJ0LaVDqcXRyhyQyiVyU5lzHm1RH8l3/gpQCX
 FAoLbHI0FEMXWhjTR5xznZStgNuNZ0Hc5G628=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PYudng5R/wrTc6vNtO9kYwTzA6rGU6HzaC8pWT1Yijs=;
 b=d8d87QIBf4HuZ5GjfacYRPfPcsgHrndYgdkg6rQmxl5vfNhkjtOIMWJfulOOfjQeOt
 15zo5+Y/BPFsRUHSy5J9rrx6K5iCLE0QcblU/n7Jc9+q0B4vPXBrDe+b7+YNnwLN09IJ
 ZByG5ZJDe9k3gdAoDiMcRbujaVe5wr39E9mmWRVidv3aKJIVUxAOx73ItHM6xM1WVZ/j
 K3Dc/n2KnaKxRCIH7mxM0fSV9sPSHBwygmQG6B3TWpUmYm4xyjXN11UgFjQRmV1Iz5fd
 d87jyArpoJJd8EsKyG8Y5Hn7IzeSW94Ji4XAjLyDiq1ywYh4aaE2nATrnrRc8HZhLgqg
 DC9w==
X-Gm-Message-State: AOAM53082bba/Rq+Gk0fBWJMqa1BKuM7cdMS1JTwu2tod/C/JGxck9uG
 Zt36RFNWKdqHiq+4KH/AQ/BWTQ==
X-Google-Smtp-Source: ABdhPJxye5U4MtIWKA8XEV+Ile2cxBdIwWMj2P7B8bI+uQVmvGBl5gA50D6rwtjuL+/STdr3NPYmXw==
X-Received: by 2002:a17:90a:22d0:: with SMTP id
 s74mr701194pjc.200.1589504299208; 
 Thu, 14 May 2020 17:58:19 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id m188sm363345pfd.67.2020.05.14.17.58.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2020 17:58:18 -0700 (PDT)
Date: Thu, 14 May 2020 17:58:17 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Sharat Masetty <smasetty@codeaurora.org>
Subject: Re: [PATCH 4/6] drm: msm: a6xx: send opp instead of a frequency
Message-ID: <20200515005817.GW4525@google.com>
References: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
 <1589453659-27581-5-git-send-email-smasetty@codeaurora.org>
 <20200515003957.GV4525@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200515003957.GV4525@google.com>
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
 linux-kernel@vger.kernel.org, dri-devel@freedesktop.org,
 freedreno@lists.freedesktop.org, georgi.djakov@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 14, 2020 at 05:39:57PM -0700, Matthias Kaehlcke wrote:
> On Thu, May 14, 2020 at 04:24:17PM +0530, Sharat Masetty wrote:
> > This patch changes the plumbing to send the devfreq recommended opp rather
> > than the frequency. Also consolidate and rearrange the code in a6xx to set
> > the GPU frequency and the icc vote in preparation for the upcoming
> > changes for GPU->DDR scaling votes.
> 
> Could this be relatively easily split in two patches, one passing the OPP
> instead of the frequency, and another doing the consolidation? It typically
> makes reviewing easier when logically unrelated changes are done in separate
> patches.

After looking at the "upcoming changes for GPU->DDR scaling votes", which is
essentially one line I'm doubting if the splitting would actually make sense.
I'm now rather inclined to see "drm: msm: a6xx: use dev_pm_opp_set_bw to set
DDR bandwidth" squashed into this patch.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
