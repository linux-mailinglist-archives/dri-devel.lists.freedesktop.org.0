Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9620295913
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 09:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D3736E07D;
	Thu, 22 Oct 2020 07:27:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 971DC6E9B2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 07:24:07 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id f19so942459pfj.11
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 00:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=hAIhzFswDyObHC/AccJ2pW9tYMVZUmTRll6IsakeHDI=;
 b=hcxqhkvAd7gaUVg+ADZjC/g5t7FunCEWj40dk9Jkh/xjioI52ZXAkwo5BMXN3dd6bK
 5yXuvLzPNM3xRKnqdyMdj4t+47mqUiHukE7zp03beKQSUIMlvPx4UIwK8I+FHjqcmJK+
 m/BFHJXQmFjXQ8bMAZqWLhKkQs9XMJMwLfK9KLRTPTTK0VqGNT1ILV7h8O1faqdo/jo4
 RnbVTYrqOhJJX40NnBh57Kvpk11HcrFZljb+h+jDOuMIAQLRZDKUntg+d0RwJGn2AWEH
 05nApZQVycKIsoa+R52Nh1RncFPKJRVeAHd/N+wiBZk7rXT5ryOvdRuVzz3Kc2MSGxVM
 o+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hAIhzFswDyObHC/AccJ2pW9tYMVZUmTRll6IsakeHDI=;
 b=hnJflPIgFJFvTqzLeVMkKyx/p0knvtxVG+U2H3Ax+FplRTa6kdpfQX4gfm2AIOJezJ
 naeAOf0fdAQcXAoWIzANVsNIhxKoOhr7YsifznSPtp+MXFSy3a45Q0e7ioiFTR6RBNOB
 7E0Aix8sh8rAieiReqFqeAjslpbbBGJ11yvesBiZiFV99oua5ojp8LKvjNohGqD35PTs
 5B2H6x6MvQ+s56F98jWww27XVrs8W+B3BIytJEyXDF9Q370iGPHm83qg9eBE2lUoE7jb
 q5InIr5VAMnJ7YJUoqW7QVsgS9j3hUC32hTgiSE+sUIp6ReWm4KAaWq3OhjVW3x0mfKC
 UU2Q==
X-Gm-Message-State: AOAM533q5Beax8MHQVI1P2XIBawPu5eC4W7AvGEX8uLl2COgDYmmZAxN
 hecQp/l6LZtwPKJm6Sc4d592Wg==
X-Google-Smtp-Source: ABdhPJxdvf151N9thd6CsPj2u4ESktngUMo7t9TYxraGbFVI19jZ698HL0h3xJRccblV6DfAzwc+Ng==
X-Received: by 2002:aa7:84c6:0:b029:155:d56e:5191 with SMTP id
 x6-20020aa784c60000b0290155d56e5191mr2068267pfn.41.1603265047189; 
 Wed, 21 Oct 2020 00:24:07 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id o2sm1377845pgg.3.2020.10.21.00.24.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 21 Oct 2020 00:24:06 -0700 (PDT)
Date: Wed, 21 Oct 2020 12:54:04 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: rnayak@codeaurora.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Subject: Re: [PATCH V2 3/8] drm/msm: Unconditionally call
 dev_pm_opp_of_remove_table()
Message-ID: <20201021072404.y43tjzd2ehclrejp@vireshk-i7>
References: <cover.1598594714.git.viresh.kumar@linaro.org>
 <6e4110032f8711e8bb0acbeccfe66dec3b09d5c1.1598594714.git.viresh.kumar@linaro.org>
 <20201005062633.ejpehkpeuwksrx3e@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201005062633.ejpehkpeuwksrx3e@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Thu, 22 Oct 2020 07:27:48 +0000
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
Cc: Nishanth Menon <nm@ti.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>,
 Rafael Wysocki <rjw@rjwysocki.net>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05-10-20, 11:56, Viresh Kumar wrote:
> On 28-08-20, 11:37, Viresh Kumar wrote:
> > dev_pm_opp_of_remove_table() doesn't report any errors when it fails to
> > find the OPP table with error -ENODEV (i.e. OPP table not present for
> > the device). And we can call dev_pm_opp_of_remove_table()
> > unconditionally here.
> > 
> > While at it, also create a label to put clkname.
> > 
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> 
> Can someone please apply this and the other drm patch (2/8) ?

Rob/Rajendra, can someone please have a look at these patches ?

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
