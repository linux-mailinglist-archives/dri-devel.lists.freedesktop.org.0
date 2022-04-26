Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1378510939
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 21:38:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEFC010E233;
	Tue, 26 Apr 2022 19:38:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE63A10E233
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 19:38:37 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-e922e68b0fso9387867fac.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 12:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TXS09JkwF5GLec/M0dTras8T0t3eDRbS5BV0Hcw/hT4=;
 b=SrBjLVGo86/lJmZLse/aQwYTbrGGt+3owe5ItR27+bBCt4mg/gE5074SEWuwTLVYoT
 EP1Jd56rI87e3YR5dPBO/FQKdw0skbd3UfA5fQNXskV/bb8geAjNJnlYv9spJFLqvqLP
 +pALshcnx/psb4R6kMRfEO31FMgux8dVpoLpordmZ0t2BqzTYrf4XgsQAQq4Pa2BHk9I
 ZlinSTl2tnJ5LJT1XVb/Dc56hzmoREA31G8dVxUStwFQWDEDUJhxegsMlv7rYK9Qkyoi
 f4K2f1GwFKGLi8jf7zYHa7PltHgM20wPF8El7MZRk9sujvpkh/nffxCXSypu+42PkiGW
 7o9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TXS09JkwF5GLec/M0dTras8T0t3eDRbS5BV0Hcw/hT4=;
 b=fYtU83UzsQdS4FwVBlDm6dnTAzuq6AOiHBudWrNEYEwNoHLq+wx7yVFIkS+FTUFEEv
 rtDDpEL212eA36tOGUCisnG5wPrTbjiWjOeeiuU9AmPBPaoJke+Js2j1vP3SBWMtEahr
 wDvZury/nclo6H/k2swRxC/qz9eqGBNytPJS7+Xco4I4Qvv155D5Gzz6r3IbXsXMNhvi
 sUIiG1BJ/D0PZS1D/2GbvzEvAtW44gxl6iENUQYRHEHY59ACCDWOirHmqtPgcULShgGs
 pmB+ubJkjHDKQrB9dRb+GK7j9dEu/BkGJgdpjyNi0QNoKtoWiobbkzNYJShzCM4NabCj
 ZEqQ==
X-Gm-Message-State: AOAM531aABUrfKzw+z2Z62vXGKXEbiZ+hmfNIg9jTiJG3pTED+qtH/4N
 J7u2dvxArYBOM2woo4lHGCBjllsZPCHQoVLx38c=
X-Google-Smtp-Source: ABdhPJyerxF6hIONQQRiCTXKbDTN7rNXVZTFI8zUNnepp+qDq35Y4TrN+rrvTptINSWSWJdFHlI5ApT7ltRuYss3caY=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr13523534oaa.200.1651001917150; Tue, 26
 Apr 2022 12:38:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220426113502.224d0a90@eldfell>
In-Reply-To: <20220426113502.224d0a90@eldfell>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 26 Apr 2022 15:38:25 -0400
Message-ID: <CADnq5_N8AmTq-G04JcfrHKDv8SOvOwZwsmmZd=PU+Nc0GRwybw@mail.gmail.com>
Subject: Re: How should "max bpc" KMS property work?
To: Pekka Paalanen <ppaalanen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 =?UTF-8?B?Sm9uYXMgw4VkYWhs?= <jadahl@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 26, 2022 at 4:35 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> Hi all,
>
> I'm working on setting HDR & WCG video modes in Weston, and I thought
> setting "max bpc" KMS property on the connector would be a good idea.
> I'm confused about how it works though.
>
> I did some digging in https://gitlab.freedesktop.org/wayland/weston/-/issues/612
>
> Summary:
>
> - Apparently the property was originally added as a manual workaround
>   for sink hardware behaving badly with high depth. A simple end user
>   setting for "max bpc" would suffice for this use.
>
> - Drivers will sometimes automatically choose a lower bpc than the "max
>   bpc" value, but never bigger.
>
> - amdgpu seems to (did?) default "max bpc" to 8, meaning that I
>   definitely want to raise it.
>
> If I always slam "max bpc" to the highest supported value for that
> property, do I lose more than workarounds for bad sink hardware?
>
> Do I lose the ability to set video modes that take too much bandwidth
> at uncapped driver-selected bpc while capping the bpc lower would allow
> me to use those video modes?

You wouldn't lose workarounds for amdgpu, you'd just lose potential
modes.  The reason we added this feature in the first place was
because users bought new 4K monitors and the driver capped them at
30Hz because we always defaulted to the highest supported bpc.  We got
tons of bug reports about 4k@60 not being available and that was due
to the fact that the bpc was set to something greater than 8.  I'm not
sure what the right answer is.  It really depends on whether the user
wants higher bpc or faster refresh rates and possibly additional
higher res modes.

Alex

>
> Or, are drivers required to choose a lower-than-usual but highest
> usable bpc to make the requested video mode squeeze through the
> connector and link?
>
> Do I need to implement a fallback strategy in a display server,
> starting from the highest possible "max bpc" value, and if my modeset
> is rejected, repeatedly try with lower "max bpc" setting until it works
> or I'm out of bpc options?
>
>
> Thanks,
> pq
