Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 153B8276A87
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 09:19:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D1C6EAAE;
	Thu, 24 Sep 2020 07:19:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D586EAAD
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 06:32:14 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id u24so1307910pgi.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 23:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=QLnDNKE2S3wzGcgxQbn94gD4gMx4cWe6gJ0q+mzRl+Q=;
 b=a33jq1KwBVdBeHZ6vJ/PJDssGM/nkkdTZuwG6vxdqOkbpjhTUyZn7nvYMusycvTeUg
 l5vP/b8Wg0uPEOnvQJMVKhMFtkTEAX9gNC7BWHHxSbvR14Dj/1CQhKacpHoQsGrKu6P2
 IHpi6jXMAW7JYNPevhxHBR022uVslkdWxU4/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=QLnDNKE2S3wzGcgxQbn94gD4gMx4cWe6gJ0q+mzRl+Q=;
 b=Q7vlWKUD1gWC3cuYP+FddD7lQ86UdWxUKf5BkfZwDUZuCezwQRDV18ivMDC6reBzfy
 KSP+Vw7hRr+J6jHXbDyAce1KyzFoLuQLvk5xApPLTIVtXT/mFXGwLUUAVat8h/um9YmG
 4vMXDuDstI1soXpkFfMWpGHMKbiVyM6+mhMQYOBXck9OFLfODwlCxDwaVBbvOb7yzy0Y
 MoS9C0dcVHimO17QR7Jh+uKQyT6yJi9ys/Z/hG/yTD6fYSlDssULnTCeRqjR8nR0q+gj
 Ho3/QkLvNinPUxrzxwPZXmBKfAIRfJzZfe/da6KCCrjkucPBszPFHIfg08K4G2JQ9wzI
 E4hA==
X-Gm-Message-State: AOAM532xUAyy6UEAnJKgG0rFqV79ZqTOkAtnxWLvhsJa/D9BxfrKQ31+
 whe5FYqLSpGzP8uzvJr3OHnBUg==
X-Google-Smtp-Source: ABdhPJzH1YjRbI7I1wZnL68bv9NNgPPGtLGQpYKz73xHcQIYGHEmTe5RXFL5RZ9shSJozYaiqwYClg==
X-Received: by 2002:aa7:8a54:0:b029:142:2501:34f6 with SMTP id
 n20-20020aa78a540000b0290142250134f6mr3022588pfa.79.1600929134015; 
 Wed, 23 Sep 2020 23:32:14 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id i9sm1584716pfq.53.2020.09.23.23.32.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 23:32:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200923232448.24516-1-abhinavk@codeaurora.org>
References: <20200923232448.24516-1-abhinavk@codeaurora.org>
Subject: Re: [PATCH] drm/msm/dp: fix incorrect function prototype of
 dp_debug_get()
From: Stephen Boyd <swboyd@chromium.org>
To: Abhinav Kumar <abhinavk@codeaurora.org>, dri-devel@lists.freedesktop.org
Date: Wed, 23 Sep 2020 23:32:12 -0700
Message-ID: <160092913200.310579.7777419545906412437@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Thu, 24 Sep 2020 07:19:09 +0000
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
Cc: kernel test robot <lkp@intel.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, khsieh@codeaurora.org,
 seanpaul@chromium.org, tanmay@codeaurora.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Abhinav Kumar (2020-09-23 16:24:48)
> Fix the incorrect function prototype for dp_debug_get()
> in the dp_debug module to address compilation warning.
> 
> Fixes: f913454aae8e ("drm/msm/dp: move debugfs node to /sys/kernel/debug/dri/*/")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Will the compliance testing parts be moved out of debugfs at some point?
Just curious what the plan is there.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
