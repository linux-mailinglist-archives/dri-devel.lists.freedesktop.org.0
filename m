Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A593E4DCC49
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 18:21:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD3510E5F0;
	Thu, 17 Mar 2022 17:21:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F27510E637
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 17:21:13 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id d18so5006830plr.6
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 10:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GVH5wVAAit8dSLwq1mNIRCt3Jo09Ih9fX4BoyZZKgPQ=;
 b=iTFoidxbuOT1lSI7/Ijmymp0fz5i9LCFVj36rYqM9/RnB0fdLmDulWRgpkR3cB/3lE
 5358Gi6sMXZLRVf9CO6aC4XxLmiTrrRBkJm+OfNr30V6mEBuXo4NuX0XBgxJqNWDNzdK
 jIBT5ZIec0zweLFylC+8GTTCFvuTmcTsAs4PmgxWAc6FdDeLM9VeztG5YtpfgBGulohF
 fQ2+aNlr7RlidLrQMM2MsCSpiUrPMfzXkhHrT+zdxwnV8XEt4Ai6ToeQ9g+kcuBVG+7P
 ARNInrm8U/jSAbwxhsCkeDkVlybyKPBeIE0FCyJkDXbr2LWHutpKbpFDe9Cu+VA8Esmi
 64QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GVH5wVAAit8dSLwq1mNIRCt3Jo09Ih9fX4BoyZZKgPQ=;
 b=Wn6cJ24QyoMnMD/RPhaQTMK/gMP7ovU0F0Kujfc5Qhus+WJRti4aemofa8dWAi47ZO
 FZyKUMWppWYWZP9IMwPhbY6pp0aKQSaNJfnomJAc/UN7zIWInjxnF9ibUkDsti3X1K5s
 syXUPv58qyB7fbclGAnar+iN2suMXFg1A9mIPwhvJ8SQqAQpE7a8i9ki8wX/DnUa3j8O
 BeX3TTqDcUMTl3o1rCBsa4sNdARZekg96bqybeuNcy4oeXLC7rKtCggYzFEKTXzdvIcO
 G8P/BnwDHAxWEGG9FOMhe5NkQHmL8sqGYc+gAnx/VXAC6FgBaar133VfYr4KuoNzRtGH
 /dbw==
X-Gm-Message-State: AOAM533QSUhglwwc8zTxNPCnUnu6pWTCNvGycpApPNw3aTUjxH4tPYt5
 BWL6PBQ/KkGKWO7Q4Balzcr8PNaiosjp7nxTtcLb5A==
X-Google-Smtp-Source: ABdhPJzqgsPT0hwjxBN45Gy/9OR0t7APqndu9r3X2Xqq7QlDima8SHekoYP4JM8Hssel7QLwL+wIFHPwKWalxj6/VC8=
X-Received: by 2002:a17:90b:124c:b0:1bc:369b:7db5 with SMTP id
 gx12-20020a17090b124c00b001bc369b7db5mr17253678pjb.179.1647537672934; Thu, 17
 Mar 2022 10:21:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220317094724.25972-1-yuehaibing@huawei.com>
In-Reply-To: <20220317094724.25972-1-yuehaibing@huawei.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 17 Mar 2022 18:21:01 +0100
Message-ID: <CAG3jFythpVSh-CLuBAu8AC403Yq7Sh-oAjjkPtA+JFuN7_OriA@mail.gmail.com>
Subject: Re: [PATCH -next] drm/bridge: it6505: Fix build error
To: YueHaibing <yuehaibing@huawei.com>
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
Cc: jonas@kwiboo.se, airlied@linux.ie, allen.chen@ite.com.tw,
 dri-devel@lists.freedesktop.org, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com, Hermes.Wu@ite.com.tw,
 laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey,

Thanks for submitting this.

I think this[1] patch should solve the issue you're seeing too. Can
you confirm that[1] fixes your issues?

[1] https://lore.kernel.org/all/YjJXnzJmDGsrZAXj@xps13/


Rob.
