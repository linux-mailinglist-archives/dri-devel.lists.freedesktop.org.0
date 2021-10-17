Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85793430A41
	for <lists+dri-devel@lfdr.de>; Sun, 17 Oct 2021 17:37:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB016E7D5;
	Sun, 17 Oct 2021 15:37:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C697C6E7D5
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Oct 2021 15:37:39 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 34-20020a9d0325000000b00552cae0decbso1069318otv.0
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Oct 2021 08:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rhJ3MYQxq7jBWrI9qP0fXJvJ7nX/eTAbsnjrRWMMFSk=;
 b=GCtnrjiizXGVQMZOGAeOU0DNHpUUeMzYqWIJgqJFXZilHvYermpet4Oe9/jxnwO/iM
 4AgFbFnGJgxGQrpM7uMVA7pcW3n1CuvoeMXHkG88JRLEceU/B3oYL/oW3AmFLDlz5prj
 D8+xbpnJUEAFBp17G9Tkg5RfTvbgkAKzlbkg8HqpTiTY4UTUd6X80mzqa/TiqLo8AorA
 h5Cy5X2Ud8IwTR4zH1E6bQdLrOJ9v0/ISUK+G+0RPz4lSiDa4hodJ8GhxshaqkOF7GS/
 5t1GsAKrm78wm0P7jvhXir9dNQ1veHeLvZDcWzcNL1UobHtrRlKjdmymivH38WPtiRqB
 wBZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rhJ3MYQxq7jBWrI9qP0fXJvJ7nX/eTAbsnjrRWMMFSk=;
 b=CO9yiKS4iKsn04//ngCD4fcJl7qR4HP1Eg6b784lkaJZnCZkxQ87olhF3d33ASqeiR
 k+23Hr79vBUYCtZcIAZdyf+k94euB3qA00/6LRoFOb/QVGTUQzN1PPpKaNHpJOZW9fkl
 hiRafybPM4bfGshD+8AV+UkVcUPbzxPpXEKzKOMkFbzX3hsMGTKBYx7crLfRWYAPnb82
 XxBZsvy5SRmzKKjDKz/WiEvEsLJ4oeIQDeaCUqqO7sMKdm/C+0wNbZm4g50IRzwcoN/V
 lfLuAIPfTWjYylOQzwPYd2rSUVG4JZPGX5B+elKKuvaKj1QvNnlZX5jRclqyDnZzBjiy
 Lamg==
X-Gm-Message-State: AOAM533WoNMCwGo3C1kqoz+OOKE3AbhEUTFpZ/5RK1Jn0By5exymkSDp
 I7ICCqIPUQd0ILsxIWDvkMlEQg==
X-Google-Smtp-Source: ABdhPJwjycxtRcae2uuxEEliyOr1THEo6rI+dgHveXyCqMO2SaAU+kA94jDbKXV5kLu7kDuNKnwebw==
X-Received: by 2002:a05:6830:95:: with SMTP id
 a21mr18534612oto.43.1634485059006; 
 Sun, 17 Oct 2021 08:37:39 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
 by smtp.gmail.com with ESMTPSA id bp21sm2290370oib.31.2021.10.17.08.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 08:37:38 -0700 (PDT)
Date: Sun, 17 Oct 2021 10:37:36 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Stephen Boyd <swboyd@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>, Sean Paul <sean@poorly.run>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 7/7] drm/msm/dp: Add sc8180x DP controllers
Message-ID: <YWxDQInQD8ZDa1IB@builder.lan>
References: <20211016221843.2167329-1-bjorn.andersson@linaro.org>
 <20211016221843.2167329-8-bjorn.andersson@linaro.org>
 <CAE-0n53R79HOoBsuLXVkVhYotFam8k4mWZqWnaiJcqcr7w522w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n53R79HOoBsuLXVkVhYotFam8k4mWZqWnaiJcqcr7w522w@mail.gmail.com>
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

On Sat 16 Oct 20:32 CDT 2021, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2021-10-16 15:18:43)
> > The sc8180x has 2 DP and 1 eDP controllers, add support for these to the
> > DP driver.
> >
> > Link: https://lore.kernel.org/linux-arm-msm/20210725042436.3967173-7-bjorn.andersson@linaro.org/
> 
> BTW, was the link intentional?

No, I didn't intend for this Link to go upstream, just forgot to clean
it out as I was sending out the patches.

@Rob, @Dmitry, can you drop this as you apply the patch, or would you
prefer a resend?

Thanks,
Bjorn
