Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4285EA724
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 15:28:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF29410E6B1;
	Mon, 26 Sep 2022 13:28:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E502B10E6B1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 13:27:58 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id n15so10243359wrq.5
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 06:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=T7W3vMO9tuQw1ch0loPah1OFffLIuFMRKn5RdUQipcs=;
 b=yfgZBniecjUWpi3bk6V4rQIus/MCIZpz9t4A7SVfoQPg00l0Rk23hmYkPyEaObXEb4
 hErU2p41GocomjtVpFRtLhtaVT/pVCvWai5rb66aecDYLhjdoxtTjhCtiAlyt7d+GoDd
 ExMEssCO5FQeGG9RZtVpGSYpS9DPtffUjQ/gWMr+cXq41hPvghCzcjm/etv6p+RSNuWw
 dJPvz42iGKt7Ja2hRVDorsq9VDPdrWr5fG8bwkuv8zThTLQskIX9o+zoOWF7yyxCXf1w
 Q0eiNduP6bFY3YXQ0VhPbuwyLS6qyewDcnGye4M4V/Dq/FQAy3+iRIehVfaFaI11ezH8
 z2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=T7W3vMO9tuQw1ch0loPah1OFffLIuFMRKn5RdUQipcs=;
 b=2IIAtR+CQzilSNFbBdHdjEQp2K3+/CTkuV68QRUTT5BQw80gtvH8oAzIUOnAAD4GCc
 x26W2nOQ4I9PNrqUf+rpaisxAm//NtRG+M4q/xCsS+EXNynlUplN7rP32ccpuFFfjQ83
 /mLkeejp4zOpYv0gjPDoX84NqfBrWPRMci4RVnxZvECGXJNxaaA3XI7DTeC82oWnJbIO
 E53zKTjRcErlE9SceuDiuIIMa38W/tgMgdiippyA5+uEKbcCkLuI+LiXnJQkFBrnGiXN
 QbvJv7F8N1iD2Rz7rCr6L6xK7AV7ZP0gWJgNjDhhGKHMatF5joRebi4uTxTM0pCnHvxO
 udBQ==
X-Gm-Message-State: ACrzQf09LNmoijvSyv/ohWh8QvvtPI/fPM5oVif4phyJhwL1AfGTGfdq
 lnbR4S+cPr1t6lgAeSB0lkF9UGYIp+9YQUAr
X-Google-Smtp-Source: AMsMyM44LUAubokNSp9WXwZur0Fu+NrElkwTgpu8o/bVy7gK60y+vIm67nYa43Tnf3t+D7BzAJmGhA==
X-Received: by 2002:a5d:6b09:0:b0:225:37cf:fb8b with SMTP id
 v9-20020a5d6b09000000b0022537cffb8bmr13370722wrw.179.1664198877330; 
 Mon, 26 Sep 2022 06:27:57 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 bn27-20020a056000061b00b0022762b0e2a2sm15616002wrb.6.2022.09.26.06.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 06:27:56 -0700 (PDT)
Date: Mon, 26 Sep 2022 14:27:54 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: cgel.zte@gmail.com
Subject: Re: [PATCH linux-next] backlight: lp8788: use sysfs_emit() to
 instead of scnprintf()
Message-ID: <YzGo2o3bVLnOiQJr@maple.lan>
References: <20220923063533.239315-1-ye.xingchen@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220923063533.239315-1-ye.xingchen@zte.com.cn>
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
Cc: linux-fbdev@vger.kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 lee@kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ye xingchen <ye.xingchen@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 23, 2022 at 06:35:33AM +0000, cgel.zte@gmail.com wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
>
> Replace the open-code with sysfs_emit() to simplify the code.
>
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
> ---
>  drivers/video/backlight/lp8788_bl.c | 2 +-

This one has the subject right and is a good change. However I'd still
prefer it as a single patchset that fixes *all* instances of this code
pattern.


Daniel.
