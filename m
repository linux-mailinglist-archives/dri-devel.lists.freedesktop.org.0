Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A204173D60
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 17:46:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A76DC6F480;
	Fri, 28 Feb 2020 16:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3E6A6F480
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 16:45:56 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id x7so3736977wrr.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 08:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dnB3YbRslroktKcVWBmtkOUB1kEjE4Aqzh9tCjoW9sA=;
 b=iJrIjG+IiWYGIuv4aS0pjFrtNOSHON/kkOz+fiN9gPNqV/5tmaqI5quNYhYtXpecqj
 h0lPxpt0G2l3YPQbieYSSvsK9K1gO4106/0u8OWo7DnozluA3vQdUjQ7TMiPNXIbXNBF
 iTpUnf84x/8gy3ffZuQouprp9+Aa16QxOw013HNiv2Zr2ZTU0WKzVuFvxSZsDw9qO1y8
 xDkWfOJbsUAe51FkbTGW4vTOwIubvGsJlqATWH9CkYAyBK55vv7ZwHj5hwgWdd2WGvwG
 Ubm3hqu/llx165YndZ4ECuFC8ejjAW0G3p9AbLSNA4r51+wOvxBKRkmnrwIUTYAyqbAY
 gGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dnB3YbRslroktKcVWBmtkOUB1kEjE4Aqzh9tCjoW9sA=;
 b=ojYzIxXF+AgDQygiejucW85nmFdLADniGBfoltTeHZU19vQDgsWCqxJlezT/ZS8ql1
 mrhW+gk7qgShTk9NOuZhxM+xn4LD2J1kobfRGplCVNZBCUt2HYCImBooS3RFjNY7YcCH
 ZOETWoEQlVR596eTRrP5X5zP1w3nRwvSW2HtllxPMFvXyKyK2oFUzEAvh8VhNVZ/Uwf8
 N85YRuKfLTdFXxp1dMV++PYveIsBG7fkSBy0BlmUAZ8n8bIvr7XEzuRLDOhCXKaf/Xoh
 670Pq0tohRfYYzTQVQu2azILmhtKfX1IE2TnAYgCncivoE1+a5LQed8OQqIe4hWsRqq0
 twJA==
X-Gm-Message-State: APjAAAW6/7Lqenatg0EHPsbo6yv0i32sg+VVYqrlEvakdS4zFdondE0d
 /MZiEIV7kiSPFSznpDtXf8UMzA==
X-Google-Smtp-Source: APXvYqxeVMWKAvVvcMF6nm972He/fdlmMo/3+VBeCasLPa2AoHRCa64fawVhVSsW5qeL9ISZwA3mwQ==
X-Received: by 2002:adf:cd88:: with SMTP id q8mr5442082wrj.286.1582908355553; 
 Fri, 28 Feb 2020 08:45:55 -0800 (PST)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id j5sm13406763wrw.24.2020.02.28.08.45.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 08:45:54 -0800 (PST)
Date: Fri, 28 Feb 2020 16:45:53 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Colin Ian King <colin.king@canonical.com>
Subject: Re: [PATCH][V2] backlight: sky81452: insure while loop does not
 allow negative array indexing
Message-ID: <20200228164553.eojh3hbrymq3tw2d@holly.lan>
References: <20200226195826.6567-1-colin.king@canonical.com>
 <20200227114623.vaevrdwiduxa2mqs@holly.lan>
 <b0e21719-3a7c-099a-292d-c3fa65a84fe8@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b0e21719-3a7c-099a-292d-c3fa65a84fe8@canonical.com>
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 kernel-janitors@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Bryan Wu <cooloney@gmail.com>, Gyungoh Yoo <jack.yoo@skyworksinc.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 27, 2020 at 03:10:43PM +0000, Colin Ian King wrote:
> On 27/02/2020 11:46, Daniel Thompson wrote:
> > On Wed, Feb 26, 2020 at 07:58:26PM +0000, Colin King wrote:
> >> From: Colin Ian King <colin.king@canonical.com>
> >>
> >> In the unlikely event that num_entry is zero, the while loop
> >> pre-decrements num_entry to cause negative array indexing into the
> >> array sources. Fix this by iterating only if num_entry >= 0.
> >>
> >> Addresses-Coverity: ("Out-of-bounds read")
> >> Fixes: f705806c9f35 ("backlight: Add support Skyworks SKY81452 backlight driver")
> >> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> >> ---
> >>
> >> V2: fix typo in commit subject line
> > 
> > Isn't the correct spelling "ensure"?
> 
> It is. V1 is correct after all. Doh.

It wasn't spelt "ensure" in v1... 


Daniel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
