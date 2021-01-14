Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE55C2F55BF
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 02:16:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9E989CB2;
	Thu, 14 Jan 2021 01:16:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B3B189CB2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 01:16:47 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id v67so5672950lfa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 17:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HV7acaig/IuRZH0FvYIco0+cS2A927XztjWMUTsde/M=;
 b=IXFf8TxyLoXqmiwzz7jnOBU1brF71r/TNOHrgUJum6TzTj2MIzEndUMppFjUPpZn98
 4HDRv5Mvwa5T7985Dy+e/m+R7NkWVG/359jcS5PeLV5tSzqbLd3rGClr5PYTPtr351Bv
 EyCVa+dYmnuYdWmJDX3DTEXb6uiUo0D9zv4W+ZWMNR0210lP16WR8KA9MbrSNaD39ByL
 s/nV32dLVX9hpWXJPGrnyO/BnYr3h9GdmP62XTGTGY6YQeKEI2gpmkAFWyeQ2PDcKV+v
 77jr6b5CADe+kxxmnh17PJZXtSagcndB2UDmXd48HiYlMzsV3htGuZTOjwhNzedCh3Cx
 kDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HV7acaig/IuRZH0FvYIco0+cS2A927XztjWMUTsde/M=;
 b=qA/hxfshdr7jlzWyfFGf+Ft9RF598iD506/RR+kV8Jc+k2EjxZ7fY4aEiaqu/Lttqi
 cbzCS/E0GkzDHwy5knQNaCKR+ePNxQx1cMZI7ROaZrcnfS/USnxPaRUIGj84TRr0Z3gh
 piqx3jd6BXweITn/XBCeqhXBBmlMW19OMsBZVJuza7pbRrzdlN31Hk0bGkcuOZWXTjAr
 8CD2lm0EsHSdxilBY7+6oU4DrboSRKc5kIWGTTSfhB9dU4i0qzT+Eqh+ixjI1lDdhkEk
 /ST+mstzBhYw1Fr4gCxdhA7AwO5QFXd6PD1z6IVOAJH5jzt2Lnys0PPTed81ndL47lbs
 wTnA==
X-Gm-Message-State: AOAM5313kb+N+epXDpw8q6hg4K7bOPIbi2itAXRuysqtCZy1lyyp5lJU
 ZI63EaQnfC5nYsGe4pCu4wh9lFK9c9Bfg25WUoM2RQ==
X-Google-Smtp-Source: ABdhPJyI7Qrj9xwod84Gx794EFJRqixlMuHqyjZlGkjTwv6t48YBJWudycgrvf0f6eTRNZ69PMLPYboo+0BS1hJIeXs=
X-Received: by 2002:ac2:5145:: with SMTP id q5mr1915337lfd.626.1610587005736; 
 Wed, 13 Jan 2021 17:16:45 -0800 (PST)
MIME-Version: 1.0
References: <1610567539-16750-1-git-send-email-veeras@codeaurora.org>
In-Reply-To: <1610567539-16750-1-git-send-email-veeras@codeaurora.org>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 13 Jan 2021 17:16:34 -0800
Message-ID: <CALAqxLVCf0w2oO2CPYp4R=Fk2yPGptDXY3v+RW5qzycg8R3NeA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dma-fence: allow signaling drivers to set fence
 timestamp
To: Veera Sundaram Sankaran <veeras@codeaurora.org>
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
Cc: David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo@padovan.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, pdhaval@codeaurora.org,
 abhinavk@codeaurora.org, Sean Paul <sean@poorly.run>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 13, 2021 at 11:52 AM Veera Sundaram Sankaran
<veeras@codeaurora.org> wrote:
> Some drivers have hardware capability to get the precise HW timestamp
> of certain events based on which the fences are triggered. The delta
> between the event HW timestamp & current HW reference timestamp can
> be used to calculate the timestamp in kernel's CLOCK_MONOTONIC time
> domain. This allows it to set accurate timestamp factoring out any
> software and IRQ latencies. Add a timestamp variant of fence signal
> function, dma_fence_signal_timestamp to allow drivers to update the
> precise timestamp for fences.
>
> Changes in v2:
> - Add a new fence signal variant instead of modifying fence struct
>
> Changes in v3:
> - Add timestamp domain information to commit-text and
> dma_fence_signal_timestamp documentation
>
> Signed-off-by: Veera Sundaram Sankaran <veeras@codeaurora.org>

Looks ok to me, also did some brief testing w/ AOSP and didn't see any
regressions.

Reviewed-by: John Stultz <john.stultz@linaro.org>

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
