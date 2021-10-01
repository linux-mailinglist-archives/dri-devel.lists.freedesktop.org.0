Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4991741EF51
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 16:20:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31E6A6E550;
	Fri,  1 Oct 2021 14:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89746E550
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 14:20:14 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id b192so7357387wmb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 07:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TkvezXZi1fkQu2wSS8sN2XxyukeSXc1Ehs+Ng7L0v2o=;
 b=M37+gLJCudNwkTp3onhQJxl5TOiJ+FpReycB0OQLaRNEuWn1E3vnJuOczX97Uweqru
 jNnu7MsRbuYvB1nlUzf6sJsFOAAo9bxuptxMabl2H3kVl8wZK+HtrbvNaY0K13RLGA7Y
 cjBugFhfb27ajXQKgIhGNCuQS8sVlRR0lj/14pOJOki6xNOn4pdafgoxcNYW1QscNQcx
 KUeg0/EQs2mnzVr/8+sfA8yoYiwArhzRHcUXxmFvpVrn9SR8rEjvqwtygf5HLUutijZF
 aO6aZxd4+9mh5m7MMNgwbBmqEMsmFSG1uz26QSDG6SvB5bowL5YIFS1T1GxGymoPYZBF
 55ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TkvezXZi1fkQu2wSS8sN2XxyukeSXc1Ehs+Ng7L0v2o=;
 b=bUX1FzqNJP+9TmedSoio3IhOKbpph0MKCo/6FRSqciKkgxdh2seUZf6kN9eQ3RUOjS
 yd/CW+HvKh2SBZ4UpbJ3IKT5EkrVWBmqf/5l1SvPGxcm8vk5wrEHKD0Z31O6Ivmq0pow
 RzGI0iDlydGZ7i1NjNI+8AtrFjfaPbuzY7btgMZhSvh5VFtUUO5k9jlMZJM0F2Z80QJu
 SR/PxZa01cuh7Kv4Xy+yXmTNfLLt6wVWzDOQvkhlYVywSYWSPCIW4yAi9Q5hjqR0XEt5
 L3LGixobT2u0Mriyh5AmDe6p3An6ERUOoUgwHESpcv6/IOoV+t4MLUo22Hn3WGuXRF0t
 HhGg==
X-Gm-Message-State: AOAM532OCVD8t0ToFCAeO57HPvKLUG388TITjWM93bVF2DE9lYN0JulM
 ZQ5xrTtHBkcMpopR+JxZDsHHTQ==
X-Google-Smtp-Source: ABdhPJzxtZlp1kEw8K9aNJvxGPN2K1mx0SKE8o8iaolaSDtaINwMztEVAHUiLcBZbVwCmCnCJqmBGQ==
X-Received: by 2002:a7b:cde8:: with SMTP id p8mr4695246wmj.160.1633098013189; 
 Fri, 01 Oct 2021 07:20:13 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id d129sm8300815wmd.23.2021.10.01.07.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 07:20:12 -0700 (PDT)
Date: Fri, 1 Oct 2021 15:20:10 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>, Jingoo Han <jingoohan1@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH] backlight: hx8357: Add SPI device ID table
Message-ID: <20211001142010.weg4w3doowdsj3ch@maple.lan>
References: <20210922151014.49719-1-broonie@kernel.org>
 <20210927094200.a7d73sl2k4x5xjch@maple.lan>
 <20210927114727.GB4199@sirena.org.uk>
 <20210927132417.lixg3ojhnwlleht3@maple.lan>
 <20210927133055.GD4199@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210927133055.GD4199@sirena.org.uk>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 27, 2021 at 02:30:56PM +0100, Mark Brown wrote:
> On Mon, Sep 27, 2021 at 02:24:17PM +0100, Daniel Thompson wrote:
> 
> > In that case what is the point of including unconsumed driver data? Most
> > DT centric drivers that included this for modalias reasons leave it
> > NULL.
> 
> It's mainly there because it's generated fairly mechanically from the OF
> ID table - there's no great reason for it to be there while all
> instantiation is done via DT.

Ok. If there's no plan to change the driver to pick it up from the table then
let's remove the redundant values. They just make it look like somebody forgot
something in the probe method (instead of it being a deliberate choice).


Daniel.
