Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 386A51B6EBC
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 09:15:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 035CA6EA83;
	Fri, 24 Apr 2020 07:15:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 267186EA55
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 23:41:33 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id z1so2169080pfn.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 16:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=UvY6yRSr9LoxwMbjAv+ye5C9hpbZ65HCNFVPFwYb5gE=;
 b=jUVhZMwkNiCZgtMssvAQEOCuMI34GiHeO2OcbYFNA0MO2tPfgE3ecSGPvuR4DPi4rw
 nrDqAIP+/voLFN3dUnkLv0OMk3nDYNqW8jwkBtqhMo4F2DCygEWZMgmz9XH5/kNZc0bd
 GWIkMaBex51qJfiKuQsvPBcHbWzw3cikkvWe0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=UvY6yRSr9LoxwMbjAv+ye5C9hpbZ65HCNFVPFwYb5gE=;
 b=EhVuG3G+aAPcpv01799HwWkzmwHLQZqAqC3us/ispKk925M5lltNAjiaXQMNQMDuJS
 jALT9I4XLdmvoobbEYCMlEED8/Gnpiib5KflBcsW38+AX2hJXcJjsvpSjWa6WVvLPIz9
 b81CYpzZcqxGPhGP3nKo0bCMreLbfR7AmS+L45bhm7ZtBEBNfIxazfNhQZoDldHVC4Cw
 LYeVKne1kErc0b3g3Zy3EnoZdE8rwmgdLJ4XlMXkgEVU6b9JktzYTE2YiSYjJ4rACouN
 Uqtn9abzEn+u9XnAaqGt6PV8uMKSTVnT1HYIoLI6nXsVbTLdEAFmvmW5zeRpkZ94tGOV
 JGlA==
X-Gm-Message-State: AGi0PuYnRsK2+SKPjflCx55IzKYPZ4tKlimHYbF/cFBDKnH0g+Qil9oU
 q2pi/pzhGa9X8kuL//nmQi7gLg==
X-Google-Smtp-Source: APiQypL/1HUpGNgMyu557lD7TWDtpCq8eHWZGde9uRaxlMdNp6k6YJ/zYkJ2Q2VQfzwQSkKLN4Cvvg==
X-Received: by 2002:a65:4641:: with SMTP id k1mr6634067pgr.406.1587685292738; 
 Thu, 23 Apr 2020 16:41:32 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id h193sm3755976pfe.30.2020.04.23.16.41.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 16:41:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1585701031-28871-3-git-send-email-tanmay@codeaurora.org>
References: <1585701031-28871-1-git-send-email-tanmay@codeaurora.org>
 <1585701031-28871-3-git-send-email-tanmay@codeaurora.org>
Subject: Re: [DPU PATCH v5 2/5] drm: add constant N value in helper file
From: Stephen Boyd <swboyd@chromium.org>
To: Tanmay Shah <tanmay@codeaurora.org>, devicetree@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 seanpaul@chromium.org
Date: Thu, 23 Apr 2020 16:41:31 -0700
Message-ID: <158768529129.135303.14920680590198766597@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-Mailman-Approved-At: Fri, 24 Apr 2020 07:15:40 +0000
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
Cc: abhinavk@codeaurora.org, hoegsberg@google.com,
 dri-devel@lists.freedesktop.org, Vara Reddy <varar@codeaurora.org>,
 aravindh@codeaurora.org, linux-clk@vger.kernel.org,
 Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Tanmay Shah (2020-03-31 17:30:28)
> From: Chandan Uddaraju <chandanu@codeaurora.org>
> 
> The constant N value (0x8000) is used by multiple DP

There's one driver using it, not multiple.

> drivers. Define this value in header file and use this
> in the existing i915 display driver.
> 
> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
> Signed-off-by: Vara Reddy <varar@codeaurora.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
