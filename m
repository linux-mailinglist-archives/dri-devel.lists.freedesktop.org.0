Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BAE2830D3
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 09:22:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4157F6E152;
	Mon,  5 Oct 2020 07:22:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89FBA6E0C1
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 06:26:36 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id i3so4908806pjz.4
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Oct 2020 23:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=SKaQ5+8uUmRtIWBKZSxd+2jDGXEKN5QdEKsAPMYJkgg=;
 b=hVUBIPjnHGOWjGUi1oUG2maCLkvuCE7pMNCmJn6gkaIVPZ8LdYKidM635ZHKQeHwr+
 l2knVD95lg4NSfyju+W6598JCldz5UwtjNiq5Jw8H8LWwbCeS4VjYFXgNY9WYCMElFUg
 2atFKK1Z5tvYk+DhYbjVwhkBzLDgUhCcKGzBzX8j4fumt3o5pOmUeq9QqIeXEm7BnOnZ
 a+C2Am6JbEg4Ha9fo3qOa+KC6LPN927a6o67oRVjFKDbmc9/uYW0fgX+Cks4uxcGs2HW
 NWZrgF1TEebG01jSrJh4i4AjHHuHT+bSBFJDRKzAlvEWgDfpYYZ6UGBMMucpf0+sffjM
 zsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SKaQ5+8uUmRtIWBKZSxd+2jDGXEKN5QdEKsAPMYJkgg=;
 b=WT42vqO5ORV6l/ixbKa5d9P1YArIq9DLj38A2YbAGDkhiRTXXvEnc4rErY31pZE4gj
 rrFPnlm3QTdK7fGo64PCPt7+qSdQJftnd3WEyTHZPSv59iGi5I71xuWZXP0x/ACpjLyv
 Ks/PFwP7pWB6ySaJ5yAKTyrtiuv6ZUoRhEUka2iwT3FT06r9r0oUza9w1XW+bAYl2hq4
 ozUSHcGrul+uHq3xSo5+/R8bzPGZ0gyojoPlX7t6wCnFeMevB3Fdk52P1H2SEUziYPXH
 IUiRvYxTfxpBRhxcoWTxjGsOWRsXIt2g4YMKhJBUVm+5B2wPk/0zTdCS5BX2xEw2ljhI
 bgRg==
X-Gm-Message-State: AOAM53392cQEZovo2VvMVIt2Mkti3RTP7gTv7CC1KzqGHWA1iePw1NqL
 W6/3scYe6W4XocjSXPPHA0jvyg==
X-Google-Smtp-Source: ABdhPJzMX/4YpxutBiiXM2fWXSSduuaC0HQCvEVYpnrcJsYem70ESjGjA5g+ApA82zM/o6oW1zh/YQ==
X-Received: by 2002:a17:90a:e282:: with SMTP id
 d2mr104042pjz.159.1601879196092; 
 Sun, 04 Oct 2020 23:26:36 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id j6sm10860110pfi.129.2020.10.04.23.26.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 04 Oct 2020 23:26:35 -0700 (PDT)
Date: Mon, 5 Oct 2020 11:56:33 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: rnayak@codeaurora.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Subject: Re: [PATCH V2 3/8] drm/msm: Unconditionally call
 dev_pm_opp_of_remove_table()
Message-ID: <20201005062633.ejpehkpeuwksrx3e@vireshk-i7>
References: <cover.1598594714.git.viresh.kumar@linaro.org>
 <6e4110032f8711e8bb0acbeccfe66dec3b09d5c1.1598594714.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6e4110032f8711e8bb0acbeccfe66dec3b09d5c1.1598594714.git.viresh.kumar@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Mon, 05 Oct 2020 07:22:30 +0000
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

On 28-08-20, 11:37, Viresh Kumar wrote:
> dev_pm_opp_of_remove_table() doesn't report any errors when it fails to
> find the OPP table with error -ENODEV (i.e. OPP table not present for
> the device). And we can call dev_pm_opp_of_remove_table()
> unconditionally here.
> 
> While at it, also create a label to put clkname.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Can someone please apply this and the other drm patch (2/8) ?

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
