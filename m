Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 323D6327AF2
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 10:39:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B4CF6E527;
	Mon,  1 Mar 2021 09:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC646E527
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 09:39:06 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id e10so15119316wro.12
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Mar 2021 01:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=J67311LSdF6jMCXHcRsS2/P8YZ9lxrbt1gE7LzkRMqA=;
 b=SMs8rt66hMrlsINChSzuMepk42PUx9iaAaZVEOxSK5UptMf+PE3E8AgBZceDSHggYx
 QeZmp2FRQBjYAFj1sxNFwDfqGS9ubztYXljk92cv82I9ZwLgul4m/Grc3VYObKoiWoMO
 KMvTIZrsdbJnKJJFaJy4Sd71NCUFDdBRW1VdSacudcF9zSWSc6WN21IcVxWh3HKKhYYS
 Ls+ZZzj6fOJRag4C1A71591kdf5ekIvMr/VQrtU4lRhPVslxWWLzHKLXrglHsmS3Iohv
 mV4JCnu/viNvjvDFt+VmPy3x65XQOEM2kZC/NjNapIkCKbkxZVcSbw/zUAkSw+OFoqEo
 dz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=J67311LSdF6jMCXHcRsS2/P8YZ9lxrbt1gE7LzkRMqA=;
 b=nM/pIPyemfSN7lbQghrmbvkzQFSZJmK3vbjZhBVDKkk52UgEfgFxWs3Wst5/NM/k0N
 UriI1ILoGbWh7KXMMg42k/zxaFhvCza2Hp730gz+yzkyl/gTsWuX1iPmDgS+8zmsOPf8
 EpXonF28Q8yhi33BcsNCYcCS4caJDVElJltmesVqdfOjnQeF44Lj9u+U0UoLcZQxVcRc
 r0w5rMk778jn2ua8p+er7NFLY8Pi+ZAGDy3mRVvfxDhYhIOaj+gj2DOgE2dEzR7WWpUf
 1hZMQW33rQII+N2+XaYpBGTJQMyDjUmsgndCPxolf6kzD8h3RWW+dznEyhyVb2HmOy/j
 gquw==
X-Gm-Message-State: AOAM531WbSVfMkEiqbeuF2moPKdO6X16KWo65fqAoQjXMnGJBf6IfzAj
 bkFrDaKLEQWujZK06eUFzFxGiA==
X-Google-Smtp-Source: ABdhPJxxyw54JaDpxLeGBz4c4r4o9AdpPCLIRhPUI4Ox+mvAHwMnh/sSozrOG5nOE2++xvSKYigwGg==
X-Received: by 2002:a5d:6b89:: with SMTP id n9mr15695069wrx.74.1614591545301; 
 Mon, 01 Mar 2021 01:39:05 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id p12sm20328888wmq.1.2021.03.01.01.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 01:39:04 -0800 (PST)
Date: Mon, 1 Mar 2021 09:39:02 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: kgunda@codeaurora.org
Subject: Re: [PATCH V2 2/2] backlight: qcom-wled: Correct the sync_toggle
 sequence
Message-ID: <20210301093902.34mtfcouajc36y6t@maple.lan>
References: <1614341544-5306-1-git-send-email-kgunda@codeaurora.org>
 <1614341544-5306-3-git-send-email-kgunda@codeaurora.org>
 <20210226172601.aknj2d4hghkkqjol@maple.lan>
 <0cca377c2a7648c5f1606e38ba1b7d4d@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0cca377c2a7648c5f1606e38ba1b7d4d@codeaurora.org>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
 lee.jones@linaro.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 01, 2021 at 02:15:12PM +0530, kgunda@codeaurora.org wrote:
> On 2021-02-26 22:56, Daniel Thompson wrote:
> > On Fri, Feb 26, 2021 at 05:42:24PM +0530, Kiran Gunda wrote:
> > > As per the current implementation, after FSC (Full Scale Current)
> > > and brightness update the sync bits are transitioned from 1 to 0.
> > 
> > This still seems to incorrectly describe the current behaviour.
> > 
> > Surely in most cases (i.e. every time except the first) the value of the
> > sync bit is 0 when the function is called and we get both a 0 to 1
> > and then a 1 to 0 transition.
> > 
> > That is why I recommended set-then-clear terminology to describe the
> > current behaviour. It is concise and correct.
>
> Okay. Actually I have mentioned the "clear-and-set" in explaining the fix.
> Let me modify the same terminology in explaining the problem case also.

Yes please.

In my original review I took time to explain why patch descriptions
require care and attention and, also, why expressing the original behaviour
as 1 to 0 was inadequate. Based on the previous feedback (and reply) I
was rather surprised that the problem was only half corrected in the
next revision.


Daniel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
