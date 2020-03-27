Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E29195521
	for <lists+dri-devel@lfdr.de>; Fri, 27 Mar 2020 11:25:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 110756E9F0;
	Fri, 27 Mar 2020 10:25:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A3F86E9F0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 10:25:15 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id y24so9234046ioa.8
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 03:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+DtgW0asTVLRmsP/wkgDLG5KuILtoelQrHJyD4vPRGk=;
 b=VixHdO8Hw9jXt84SnnDFMGQQjN+nZh5xzNUbbN5TwxzAF/tN0b966nHiajtCMIUjRe
 QPrW8LgWJCh/qCTIWcBul+nq3pGxjVd7qN3hBNLBZYo3Y9nAKcG7/MJZNbYiZUsWgWqj
 0dKw5nHWGX5HMroQsYECsSA9OoFyjOYNaPcNTtb9/7Yp9p075eTwNb0T24TdH6CBlI+8
 ZPKuxCQ7llQkFU+Qcwl26aLr8yUREpdsDvFvrAbnBPcXWG9hjM82ZqZ5DF6d+w+Q6OyV
 N0VWSHaOOhgSSsYHaOaRx7NnFfDkTSADaPM1dlNEZdjVBsM+oX7z0luWXoaNI4VKban+
 abfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+DtgW0asTVLRmsP/wkgDLG5KuILtoelQrHJyD4vPRGk=;
 b=c9vhC44KaAWJQ+8GkcktOQWZxl9JMyB+xeM8M08XPDMak/C8Q2UaDCAzXNmbAHSCQP
 KMlduMb3GuKFK2ydAQKirjdK4xuNZwKJXvzN2U2H1BQwk5bafazri2hRFbeEOzRwsWhc
 buCZn6z4DeMInOVccgBeU2+OVvQMHlOuB1zK3wtJwSpw0n+fmvubDXRYhKjqOgKKAlZA
 CYrJgeyInI2k/Idqy/h7EXBPKMArTOXasRTsFHa5h/86axBvGi7FBdr0FXLFqmsuof94
 uQXfMWPiwPIiB9u7mSXSB4ASvuKNd9r2Q1vmoyeALtlO11wVp0KlqVJJ98OC+FVpjSej
 Oq8w==
X-Gm-Message-State: ANhLgQ3ff4VLnsWruU9NwIEri+kZ3SOa1axw3lodAb47ScQOy8eBr3kK
 JD+Ga6JxkTNBPf0Zmstn6wExDEDK4Ap1p8/b1wI=
X-Google-Smtp-Source: ADFU+vvlcRTv5JovTHQ7RzXH0cra/ZdGkjZHlnblRSUuAxnLXSZ5BrZueQ9HJCBkcc1dc3kUFDm7yiF7dseHsA+NeRA=
X-Received: by 2002:a6b:c916:: with SMTP id z22mr12020083iof.138.1585304714741; 
 Fri, 27 Mar 2020 03:25:14 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200327082453eucas1p15b2371b61f653031408f319cc6d13893@eucas1p1.samsung.com>
 <20200327082446.18480-1-m.szyprowski@samsung.com>
 <CABnpCuDySf89HL2AksMB2fOcVCci+1zgB9r8zjRdpCAH3GWhPA@mail.gmail.com>
 <64025801-10f0-9f28-17b2-2c04d4308ac5@samsung.com>
In-Reply-To: <64025801-10f0-9f28-17b2-2c04d4308ac5@samsung.com>
From: Shane Francis <bigbeeshane@gmail.com>
Date: Fri, 27 Mar 2020 10:25:04 +0000
Message-ID: <CABnpCuBUEO6V=hwzHkUEKK5KDXC=ovPrTHyb9zFYrj0KaHHdww@mail.gmail.com>
Subject: Re: [PATCH] drm/prime: fix extracting of the DMA addresses from a
 scatterlist
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
Cc: linux-samsung-soc@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, "Michael J . Ruhl" <michael.j.ruhl@intel.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Marek,

On Fri, Mar 27, 2020 at 9:00 AM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> > I have tested the above patch against my original issues with amdgpu
> > and radeon drivers and everything is still working as expected.
> >
> > Sorry I missed this in my original patches.
>
> No problem. Thanks for testing!
>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
Just a thought.

Would it be worth adding some comments to the code to explain why this
is needed, reading
the thread around my original patches and the DMA-API documentation it
is not instantly
clear why you would be mapping the pages in this way.

Would probably prevent someone in the future making the same mistake I
did while updating
this code.

Regards,

Shane Francis
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
