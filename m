Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54507259921
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 18:37:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 834596E879;
	Tue,  1 Sep 2020 16:37:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B546E836
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 08:38:15 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id i10so326565pgk.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Sep 2020 01:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=sVtA4BoZtd+qYp70Vhjk25E1OWB6lKP1vnEo/fyHhLs=;
 b=SnQgHt594OnvLQ+HxoV+1b+xHTfWiZdjynemjFAeMz42JIh9tNJ12ru0Sdf87mOruN
 YIS2eu2r1BgbUmwZ5B6/xd2LkGoztpFrlWs8OA5BQTUysDWl9UFYPnuOpjogN4KbX2YR
 cKS6X66plUmYw9WLQnKQB2lbF41fKnPmq0ZAc4NUbGlb6lhiNtmG25L7KtxXA67rgAtq
 2BNfqsH4eLHVD18cv5Y0FLwxrPM2ZeN9ZVsrWYIVi7A8mp3/FYORXPRdo5jFVHPf8xtD
 JaHb7u2FUskbMnYCc+RlYKp/pNEoGHUdb790uRF8fS08FGQeaVWozJSDGsWLJt2fZCRE
 PsWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sVtA4BoZtd+qYp70Vhjk25E1OWB6lKP1vnEo/fyHhLs=;
 b=jd/Nc3ZOzJdm/7fTjFQiRb1sQXilAPxnSGXKpSZKBePeJGjuf5yApzwxFVJIrfC/xz
 qcPS+4u7Wy59aPFj6c59p3dNjwu493DfInw429VomdhHdTpX7mN6ZNGVb/+gh0a2Fnyz
 dQTv1vAHPvqDsHBEhKN0h3IKBnlCh47F9DBpIPDUn5a7hQB+a4bLm2U+FRDsQ+dSG6MT
 sOiG2L10aSoHx3byhNO9Zfq/b9Tct03Mcui2aS6acNpLVaBZTwEuFEu9W3IJ1naG37Jf
 KWtfjsNAitn3/4kRkSlrLUPZIDhdYCrCzIN1g6GUzheEXNoqIemYszWpD5zaKQ8dOS+G
 99kw==
X-Gm-Message-State: AOAM533ivHTLrO5NyWA3lv0YcPzlF6dS0Vji0S5n8fr6Ywo/NLHQtgJJ
 +f6U/4N1wM7a1gTm/qzby+sgGA==
X-Google-Smtp-Source: ABdhPJwZHBfT3ETPIgNI5qRnnz8/BpmRAeI4KxWCHE2M6+mIYJNgUAe/wNWoWcH+xoGqRksqZeUjGg==
X-Received: by 2002:a63:ba49:: with SMTP id l9mr605427pgu.101.1598949495328;
 Tue, 01 Sep 2020 01:38:15 -0700 (PDT)
Received: from localhost ([122.167.135.199])
 by smtp.gmail.com with ESMTPSA id o6sm708807pju.25.2020.09.01.01.38.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Sep 2020 01:38:14 -0700 (PDT)
Date: Tue, 1 Sep 2020 14:08:06 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH V2 3/8] drm/msm: Unconditionally call
 dev_pm_opp_of_remove_table()
Message-ID: <20200901083806.a2wz7idmfce2aj3a@vireshk-i7>
References: <cover.1598594714.git.viresh.kumar@linaro.org>
 <6e4110032f8711e8bb0acbeccfe66dec3b09d5c1.1598594714.git.viresh.kumar@linaro.org>
 <bc64e031-c42f-9ed2-c597-18a790a4d3bb@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bc64e031-c42f-9ed2-c597-18a790a4d3bb@codeaurora.org>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Tue, 01 Sep 2020 16:37:23 +0000
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
Cc: Nishanth Menon <nm@ti.com>, freedreno@lists.freedesktop.org,
 Vincent Guittot <vincent.guittot@linaro.org>, linux-pm@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Naresh Kamboju <naresh.kamboju@linaro.org>, Rafael Wysocki <rjw@rjwysocki.net>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01-09-20, 13:01, Rajendra Nayak wrote:
> So FWIU, dpu_unbind() gets called even when dpu_bind() fails for some reason.

Ahh, I see.

> I tried to address that earlier [1] which I realized did not land.

I don't think that patch was required, as you can call
dev_pm_opp_put_clkname() multiple times and it will return without any
errors/crash.

> But with these changes
> it will be even more broken unless we identify if we failed dpu_bind() before
> adding the OPP table, while adding it, or all went well with opps and handle things
> accordingly in dpu_unbind.

Maybe not as dev_pm_opp_of_remove_table() can be called multiple times
as well without any errors or crash.

> [1] https://lore.kernel.org/patchwork/patch/1275632/

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
