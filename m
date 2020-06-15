Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6471F8F9B
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C7896E0C1;
	Mon, 15 Jun 2020 07:27:19 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D78A89DA7
 for <dri-devel@freedesktop.org>; Mon, 15 Jun 2020 06:23:03 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id m2so6656520pjv.2
 for <dri-devel@freedesktop.org>; Sun, 14 Jun 2020 23:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=WMjD/jZlOfc+fAUGkEXl65YinbY+zUt21mw95ubF/dE=;
 b=xAMaUePfDuF1ThufwZJVKKONMJOKTRJMWdqyRex3kVGyC4Ae+LSjrM5isO8bSYG4RC
 H90sidjDOXbdpTHi+bJcCFM/uOg+r7xBNvV3xd+ZbEbocn7F6U/35rN2V0mUCsXA47By
 Jdj4o82R9Lo6E1/8vlXj2hzNBto0oz6tcKcpPiX9iHpYNFGss4IfNLZVRLlr0/i93SSg
 fZHPRAzUXx8wBs1rQ5jNkFR2/8E8bEeicYGHurL5CvDP60rQncwkVmuSc6f9mtIs1mRA
 bIJIJ/VD3ViU3pSHJZuNRAkSH5ZmAS+Q9xVNNlpXSUMopHnHlq4yszjEgLRsImtd/5rQ
 2wsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WMjD/jZlOfc+fAUGkEXl65YinbY+zUt21mw95ubF/dE=;
 b=tN08DqNgrWd/g3g3CiFbokGqsre38gP2U0mGSTM5J9HedQvupcOMWa25v3uZi+N36e
 FKtq0cSanhzIBy3w4tjlVv4OkhTQxJ+eSXBYq6nkTTyA8zyBUu0c1tBTHI5cgD4E+DRE
 /Kip/kqQOejsDmEr0EOEeQxMtq0645iB/7MaaTEkuch6FrtnlIsYKPqnYW6Txk9BZxnK
 hBHkCXFw64PPlvCsdlEBxoe4TQShavGK0FHFwfCLGxHQEsez2UJDPodTHWvgdiK9l4HI
 CPFefHdNYjj6TWXQ8z5t4m4xnzdFJjbEx9TgbjvSNf0aSmBKcVR3UQ3paCojLF2RKiXh
 dfaw==
X-Gm-Message-State: AOAM533i73iSeR8rJWuKr6nvfk/KHZkUXsX/gW+kZrTibGXsS0IVKiBo
 P7krEaYQgoM090LvVu026Sb/tA==
X-Google-Smtp-Source: ABdhPJxwAMo1y8FPHgLT09IPRRljmFY+jBUdhioK1x+wI513O4XnacM1ENl2wrU/w3tubtWxTPXQWw==
X-Received: by 2002:a17:90a:c797:: with SMTP id
 gn23mr10283076pjb.165.1592202183152; 
 Sun, 14 Jun 2020 23:23:03 -0700 (PDT)
Received: from localhost ([122.172.62.209])
 by smtp.gmail.com with ESMTPSA id a29sm12389483pfg.201.2020.06.14.23.23.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 14 Jun 2020 23:23:02 -0700 (PDT)
Date: Mon, 15 Jun 2020 11:53:00 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sharat Masetty <smasetty@codeaurora.org>
Subject: Re: [PATCH v3 0/6] Add support for GPU DDR BW scaling
Message-ID: <20200615062300.3g6rhcovbe6kssag@vireshk-i7>
References: <1591417551-38051-1-git-send-email-smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1591417551-38051-1-git-send-email-smasetty@codeaurora.org>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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
Cc: devicetree@vger.kernel.org, saravanak@google.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, mka@chromium.org,
 dri-devel@freedesktop.org, freedreno@lists.freedesktop.org,
 sibis@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06-06-20, 09:55, Sharat Masetty wrote:
> This is a respin of [1]. Incorported review feedback and fixed issues observed
> during testing. Picked up the Georgi's series from opp/linux-next [2], and this
> series is also dependent on a helper function needed to set and clear ddr
> bandwidth vote [3]. Patch number 4 in the series adds support for SDM845 as well
> but its not tested yet(WIP), but the SC7180 patches are well tested now.
> 
> [1] https://patchwork.freedesktop.org/series/75291/
> [2] https://kernel.googlesource.com/pub/scm/linux/kernel/git/vireshk/pm/+log/opp/linux-next/
> [3] https://patchwork.kernel.org/patch/11590563/

Had a quick look of the series and looked mostly fine to me.

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
