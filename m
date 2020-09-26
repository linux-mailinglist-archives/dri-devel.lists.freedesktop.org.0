Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E407D27A811
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 09:06:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C7D36E125;
	Mon, 28 Sep 2020 07:06:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0BA6EDB4
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Sep 2020 07:40:03 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id b17so643402pji.1
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Sep 2020 00:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=qRaxhiyZE90m+amIVHIeCMA0LL3BWUXSOy1qHRMz/HE=;
 b=REsQD2UwdR9mJ2mZr8Lka7ng3h1M5e4t5YBSNhbSVEe4dBJq1XzPkdnga8WsA4blA7
 enldgWNaqTvjHUwuEuZ8zTdyodiiex2GstukHEm8QqFfnaUL5b2Qp+86p01XKfBONkbv
 94+OWFKFNefSgIloF+EIod5O3TihXi4rkG8pA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=qRaxhiyZE90m+amIVHIeCMA0LL3BWUXSOy1qHRMz/HE=;
 b=egdc8ito0ym2xXXABgvz8GQcLgK+wgN372kgKMKsezWq8PA6WvyGwaUbtVjm1tOSjA
 vk69VMGQRwKFw5Mr14iSVBzjyyNooNzVqqxR/6U2GWqfycNHq3P7zpfzMjisEIP4P6OV
 vVfGbDVEu3wtUZsALpTrYhc7rTuO0bd+e7qCbHS2yg1H1UOdS/pN0DReIrk1uLeobNVz
 x8qNMjYrce821Br0EVUxKTHS/v/TZjkU4hZVxY0KPnTOx2MfB3Y0Snf442Y8Fd7gqiSJ
 gJD17yqzG/KyHFP3624snH76Gk2x9RVsCHbO3WXMk4JjFZNjMua2KoQKdxaJOsZRWHJj
 7QYQ==
X-Gm-Message-State: AOAM532XnYvVIkNTgbVz+lAHJAeHqE1TAETKpVT4cU+1jReGXYHh/NA6
 cpL4NSX2LiZwbNGhg9bxozZAMw==
X-Google-Smtp-Source: ABdhPJx66j3Z3S4vye5sgwXdj+nfn5Pw1dqJE3BCIxshfgN+WI4IsNFGybEL3NUhX6uz2b9yZrS6uw==
X-Received: by 2002:a17:90a:69e3:: with SMTP id
 s90mr1129884pjj.130.1601106003310; 
 Sat, 26 Sep 2020 00:40:03 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id c12sm4540274pfj.164.2020.09.26.00.40.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2020 00:40:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200926045048.16175-1-tanmay@codeaurora.org>
References: <20200926045048.16175-1-tanmay@codeaurora.org>
Subject: Re: [PATCH] drm/msm/dp: DisplayPort PHY compliance tests fixup
From: Stephen Boyd <swboyd@chromium.org>
To: Tanmay Shah <tanmay@codeaurora.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Date: Sat, 26 Sep 2020 00:40:01 -0700
Message-ID: <160110600102.310579.8458722739510072790@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Mon, 28 Sep 2020 07:06:24 +0000
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
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, khsieh@codeaurora.org,
 seanpaul@chromium.org, Tanmay Shah <tanmay@codeaurora.org>,
 aravindh@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Tanmay Shah (2020-09-25 21:50:48)
> Bandwidth code was being used as test link rate. Fix this by converting
> bandwidth code to test link rate
> 
> Do not reset voltage and pre-emphasis level during IRQ HPD attention
> interrupt. Also fix pre-emphasis parsing during test link status process
> 
> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
> ---

Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
