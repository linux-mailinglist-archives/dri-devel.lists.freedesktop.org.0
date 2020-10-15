Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 225CA28F7D2
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 19:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E80D46ED7E;
	Thu, 15 Oct 2020 17:51:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7CD96ED7E
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 17:51:45 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id x16so4072907ljh.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 10:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7zfqSGDv+yEOvufj9SkONQzGaf2/0wsWCEsO8GC9IHg=;
 b=czqTq+3XFohOXJ6g49AuRL3Dw7MRZTZUfMefn5c5GmP1G4+6XCMxrazGZjrHIJgGi4
 c6M3a+qtOQggFBrWzaTuEqyg4VmV08TTkMCpbN7VLF+lxumR+QWo2wE1NQic6kAs4uKQ
 3ppdo6NTG8V/+RDJ++tu3X1KkNFj1UZ31F1N4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7zfqSGDv+yEOvufj9SkONQzGaf2/0wsWCEsO8GC9IHg=;
 b=Ga7qTmdItE4mbLywhmQKgyGu+bfSA0Rpjs1anMf65ECZuQ4nSxgNPzCIHYyqUBjUSz
 n40CPsSxa93YsbvblqFaLL5IqngqHBF8B15YYJGvCyWiKmOvemT4z+qDf2T24n5QMCpm
 uYOvEXWratw+5z1Xe/T0cnqocKyPs5su6rAY79oVvVSTi/NFs8OR7Ll6A2Q4zbtvoLCm
 5fUxYyaw1+330xG21YX/qq9IAVKiz3hb53iAlj8B8hP+3/CVVxMjliaWzuakasobT/AG
 L6akKJdqWbhnEocOWdUShvQk4mgKQdF0yd8suqiuJLzbBH8ztuJwcFvpsk4/ULFB9DUk
 2wsg==
X-Gm-Message-State: AOAM5311P9OxkdC5l2EEpa5v2DBOFn1zGGF6OIBj0I0UYGKJmt5rqHId
 Ixwap05fZ4869/cx563RiekBCdvoZOEsyA==
X-Google-Smtp-Source: ABdhPJwdrRHttL2AUfLVuuWaAw7GuphbiK5VVr8RsDL/GL8WX3Gy6am7DMfcHEafio79GYv0CnF5QQ==
X-Received: by 2002:a05:651c:511:: with SMTP id
 o17mr658828ljp.256.1602784303912; 
 Thu, 15 Oct 2020 10:51:43 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com.
 [209.85.167.49])
 by smtp.gmail.com with ESMTPSA id y7sm1253165lfy.22.2020.10.15.10.51.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2020 10:51:43 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id c141so4600428lfg.5
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 10:51:42 -0700 (PDT)
X-Received: by 2002:a19:4815:: with SMTP id v21mr1599742lfa.603.1602784302538; 
 Thu, 15 Oct 2020 10:51:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txyMmW1DWhS--SuYQu4qDK1GPzgHJwxbAfhHT=hUsPODA@mail.gmail.com>
In-Reply-To: <CAPM=9txyMmW1DWhS--SuYQu4qDK1GPzgHJwxbAfhHT=hUsPODA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 15 Oct 2020 10:51:26 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiP+S4K3yU+FqgGmF+EgcSgk04Eerf3gE-6qObicy346w@mail.gmail.com>
Message-ID: <CAHk-=wiP+S4K3yU+FqgGmF+EgcSgk04Eerf3gE-6qObicy346w@mail.gmail.com>
Subject: Re: [git pull] drm next pull for 5.10-rc1
To: Dave Airlie <airlied@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 14, 2020 at 6:33 PM Dave Airlie <airlied@gmail.com> wrote:
>

> There are a bunch of conflicts but none of them seemed overly scary,
> and sfr has provided resolutions for them all. I've put a tree up with
> my merge results, so you can tell me I did it wrong here:
> https://cgit.freedesktop.org/~airlied/linux/log/?h=drm-next-5.10-merged

Thanks, looks good to me, and I missed the same msm_iommu.c patch you
did, so kudos for pointing that one out too.

                Linus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
