Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C3C7A5703
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 03:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D272510E388;
	Tue, 19 Sep 2023 01:34:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BAF410E388;
 Tue, 19 Sep 2023 01:34:12 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-986d8332f50so698675966b.0; 
 Mon, 18 Sep 2023 18:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695087250; x=1695692050; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UUAxPmCBMOuqnkmkQnHd5T3QJ8jY1TpkFSSePjQMDNs=;
 b=WNxMzMjMl3hKq6id9YB5+DTHexGjdXp7I3lt7193+ro9ZdkiXUeAUtCBRnvUnf2WKg
 53xmzdMXt8Lr8O+fmVHveu1pgxsKfucZHtEoQeMa/pshzQ2vfsH4+1KBKTT32cxuleUR
 LV6kF6ijMTg0SBJzHXE87+7LrR9TxyRdy08Saiuu1OZg0/qoL004j+tz17RaOa91DnJI
 QcJTNDipmTbAzieOKzmPdLwiWjBHlVTEWLrSu6DkJQ9KSxa6VMCqlxzXoeAwYITmEgJR
 0LpWuLHsU9jJucjmv7W9ozPscVgIbWNe5nZR2eCATPXozOCCmv0V3jNlmhV1tLjHJB1E
 5JnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695087250; x=1695692050;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UUAxPmCBMOuqnkmkQnHd5T3QJ8jY1TpkFSSePjQMDNs=;
 b=rOFiuDNRv7/gbx0YEynaxe7yuEagfYvOwmNRuFpgg7b1T8cPqVpqoGFU5MCF64CFxu
 nFUvaI1EIlsAc4Xypgdk+JJ1qmdPIOVdGk/q5m1XB7cQIIuz0R8x0HruSGqQB4j2HNed
 X7qsLeygkpuUZguo+8mkeOymkRWZCYkW4wa5b3k+dXxLMFIJni/XH56lfW5HMfYoaFE+
 FbXx0EZAXABbc/bd6rke3jR5M9YG0I/tY61Dmcpkh5rTyRN8zMtfEmMZRRIVgCa0T0VU
 maBWwMZRyubFIe5VC5q/E7mU1PEbPqHhf5R/LUkErxJROLX4mcNW//9KTTZpSmQOLlUP
 rDPw==
X-Gm-Message-State: AOJu0Yydff2FniqFf6oVA2LjiAdGAuNW8YKScVSr0IOjOEe16z7zT8mI
 av2dbqp2xo0lM+MG7Q0SaWrF9QxQsYwkrhhwfzU=
X-Google-Smtp-Source: AGHT+IEWEtULaociDohtB1JgqvShTVraFOt8WqGFtPWe6Zq6yxpwx4Tzfvw8q5FApkB8GUtUvwKxlxLrPzEOf+y3IjQ=
X-Received: by 2002:a17:907:ca29:b0:9ad:e389:4bf5 with SMTP id
 uk41-20020a170907ca2900b009ade3894bf5mr6607948ejc.3.1695087250230; Mon, 18
 Sep 2023 18:34:10 -0700 (PDT)
MIME-Version: 1.0
References: <CACAvsv6c78-K4UQ-vduBoYCqAsQ9Xn2XPzAyJY8A_8EAhv8Vgw@mail.gmail.com>
In-Reply-To: <CACAvsv6c78-K4UQ-vduBoYCqAsQ9Xn2XPzAyJY8A_8EAhv8Vgw@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 19 Sep 2023 11:33:58 +1000
Message-ID: <CAPM=9txPwQEoaiSJKToVKgqPDDVz9DcOs_-20V8BLkh1mCeb3g@mail.gmail.com>
Subject: Re: [Nouveau] Stepping away.
To: Ben Skeggs <skeggsb@gmail.com>
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
Cc: ML nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>
> As you may have gathered from the MAINTAINERS patch I just sent out, I
> have resigned from my position at Red Hat, and will be stepping back
> from nouveau development.
>
> This is a personal decision that I've been mulling over for a number
> of years now, and I feel that with GSP-RM greatly simplifying support
> of future HW, and the community being built around NVK, that things
> are in good hands and this is the right time for me to take some time
> away to explore other avenues.
>
> I still have a personal system with an RTX 4070, which I've been using
> the nouveau GSP-RM code on for the past couple of weeks, so chances
> are I'll be poking my nose in every so often :)
>
> I wish everyone the best, and look forward to seeing the progress you
> all make on nouveau in the future.

With upstream maintainer hat,

Thanks for all the work over the years, Cambridge XDS 2007, and Sydney
LCA 2007 were quite the era ago when you started down this road, and
you will probably remain the greatest single authority on NVIDIA
hardware for many years to come,

I'm cc'ing dri-devel for wider coverage, we do have some contingencies
in place, which we will roll out over next few days, nouveau will
continue with the headstart Ben has given us with the GSP work.

Dave.
