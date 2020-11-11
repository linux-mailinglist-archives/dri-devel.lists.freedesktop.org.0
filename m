Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FAA2B00FC
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 09:16:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E247C6E187;
	Thu, 12 Nov 2020 08:15:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D146E072
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 18:31:25 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id k7so1418103plk.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 10:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=wD0jJ9X64mmDYkYQXCPtOUmFoXPMN4LsIkpG0z5TLc4=;
 b=XNGMe8UIGU4UjjWGJfO7UCoPXJ/HXS48uim2rwQL/5T5pZKMxDtsYw5UhdBzAsuzga
 hcXUEg5BuNcET3U8EHMparmQNn5KFUqSYuMDc1A4PXs0JlhU00TdoW4BTQAQ3/TzPV3r
 lFzbnk1EO2Hs3WEaDfpSjwnjXjwAYz6U2lXUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=wD0jJ9X64mmDYkYQXCPtOUmFoXPMN4LsIkpG0z5TLc4=;
 b=fyx1Yge3smdBbST7hUW0+vWBUjfk5L5A1PvL3op8SGByjiLNDCutAPJjN7IQw90Yag
 9eaGJeF4PJreWK5b1sv4LGtc1Qzqvwu/JKTD9NRUikkMrYkRv4QzTwBWaUzyTgV9dOF1
 7VKhlJTiEvmEgXUtqcRUROqwkdWsRtkwToADwld0nSJ6N0JzGt1jIvi0T2sN9xutCmPy
 M4ESYW47mOZALWSzNhglO9H2CVx0r/6lLq95Z2vD9TODbDWmLchU8yN1baFS27s2LEXs
 z3iIyBzrx89vcFSmjvyWLnfJbIhG74I8PRXJYsplaIxt7aDTykGzKNvuK4UGQVQk6mXv
 LTRA==
X-Gm-Message-State: AOAM533mjk9jkuQfCuBFG2KzSDgU66LktSl53uM6nGSeCvPksWBIlIct
 jSy9VnER9Tr6ZzeCJM4BgSkbHQ==
X-Google-Smtp-Source: ABdhPJy09cg46m0g6zOTsBCTeks5xXNo/nK4uXKQMsNVoEVAyVBE7tfR8Q5SwMX43YYdwEDvK5ynlQ==
X-Received: by 2002:a17:90a:4dc3:: with SMTP id
 r3mr5029168pjl.155.1605119485287; 
 Wed, 11 Nov 2020 10:31:25 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id h16sm3018890pjz.10.2020.11.11.10.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 10:31:24 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1605081476-27098-1-git-send-email-tiantao6@hisilicon.com>
References: <1605081476-27098-1-git-send-email-tiantao6@hisilicon.com>
Subject: Re: [PATCH] drm/msm/dp: remove duplicate include statement
From: Stephen Boyd <swboyd@chromium.org>
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 robdclark@gmail.com, sean@poorly.run
Date: Wed, 11 Nov 2020 10:31:22 -0800
Message-ID: <160511948264.60232.638230439536068079@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Thu, 12 Nov 2020 08:15:51 +0000
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
Cc: tanmay@codeaurora.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 khsieh@codeaurora.org, abhinavk@codeaurora.org,
 freedreno@lists.freedesktop.org, chandanu@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Tian Tao (2020-11-10 23:57:56)
> linux/rational.h is included more than once, Remove the one that isn't
> necessary.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
