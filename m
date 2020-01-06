Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A465A131592
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 17:01:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 477A36E49B;
	Mon,  6 Jan 2020 16:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DE466E48E;
 Mon,  6 Jan 2020 16:01:24 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id 73so17279024uac.6;
 Mon, 06 Jan 2020 08:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WHKvj+lR2oxOoJDYfB6OF+P0g9s4Fqqs9QyHOmAvNmo=;
 b=hE/Il/myONgZlPpM8dlP5hw/oNFkwGoIN4KZ+UY30BclcbEOUqUAWhMT9MwU5gZBxx
 gptw9QRBG10TwkwJAciBTr1c1//qBZB0PU3e3vyxhViKR94ANuJYmDclsBnmg+T+HU7v
 uFM//nFhAhfWR826oCEUpvKst94HTwOj9F64CfMr+aUEcftPvMW/9wEQ6FZkpDgk9UNh
 Nh++Q8b7giwiQpWsElAsGunOQGXVyNGxgfM2sST2pxro7mLwJiYKOZ3znx05Q10QH7QO
 ZSro9EN6Hzy2bT4uIfk7dmHuTXXR2CZJK/OuLFjHNnB4fqMlOe3Z3idimGPjERQKqMvv
 EChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WHKvj+lR2oxOoJDYfB6OF+P0g9s4Fqqs9QyHOmAvNmo=;
 b=GhV5MqqqnQXA8S9TtesjNDquYONeTKFfHGPR2agBBHIrs2cBrVN0PHqRZLO1d7ZAkC
 EKE9bOK6w3JhiCmyTVgwdF500Ihb4riAmwFECu1jLmBJAvZX+NG76JwALY5QJAJr67ZU
 1NW+kR3kW4gPtbqJEgHS0Y8hwNIIkk09+IfyuW0g6ukWp+AaonS5Kjrr6cX306pOe9tz
 Vh2OF9HBqQR1oDagoOkxRxBisVAAikmQ9adLc18/Zn2tzJodHgiEsoZW6xMc0mxU4wga
 SkzMcrbOYoI1QFp0CuuM2oLROVEwbXlTInTWKp2xT8jj7yoxIZ8sTYahY7hlYZlx+nWU
 JGVA==
X-Gm-Message-State: APjAAAWtqBn6dEl82guFO8+Xq6LTBS4dnvRqj3L7YQ2+maAO1zjrICfF
 eC3RPsAG3665f5XKQNqccCYJGktRMTHamKTkgwQ=
X-Google-Smtp-Source: APXvYqyanrUg5kMh1Y7eIxZ0CnYSMUXd/hQcoQkIbAMWiOWbPfnrcHCsktMDMB1gAMN1jTUdSGTJGPI1aMc5afzrAXM=
X-Received: by 2002:ab0:4aca:: with SMTP id t10mr57253605uae.89.1578326483419; 
 Mon, 06 Jan 2020 08:01:23 -0800 (PST)
MIME-Version: 1.0
References: <20200106151655.311413-1-christian.gmeiner@gmail.com>
 <20200106153643.GA8535@ravnborg.org>
In-Reply-To: <20200106153643.GA8535@ravnborg.org>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 6 Jan 2020 17:01:11 +0100
Message-ID: <CAH9NwWd7C+DzAKe97kURm=sGjDH+KQJOif3j=w6K+99xmYGncQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] update hwdw for gc400
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

> For future patches can you please incldue a small changelog
> within each patch.
>
> Something like
>
> v2:
>   - Drop redundant newlines (Lucas)
>
> This serves several purposes:
> - It explains what was changed since last version
> - It allow the reader to focus on changed parts
> - It attributes who requested a specific change
> - It gives a good idea of the history of a patch
>
> In the DRM sub-subsystem the idea is that if it is written it
> should be visible in git too. So include the changelog part in the
> normal commit-message.
>

To be honest.. I forgot the change log thing this time - sorry. So the rule
is to have the change log in the normal commit message?
Funny - Lucas told me something different:

"Please move those changelogs below the 3 dashes, so they don't end up
in the commit message. They don't really add any value to the
persistent kernel history."
https://lkml.org/lkml/2019/9/13/107

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
