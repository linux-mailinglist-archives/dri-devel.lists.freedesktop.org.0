Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0082A8120
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 15:41:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB7086EA51;
	Thu,  5 Nov 2020 14:41:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F8686ED29
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 14:41:02 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id 23so1816030ljv.7
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 06:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5d6Bf1sCiSBTkV1f0O+KumDGD1FIdt2VxlTytyNjdJk=;
 b=R+JP5HJmq6thUul2lilvsTDmwUI9pv9ZiOWda+19uYiIjrGbXNfNv1YZwNvLyEhQBD
 tFQrNBI8nsdrny6Rs1yzgKT24KIrSs15Ppy7cGVXtZOT6mF0jmC20XM1fQOLz1O0sdR4
 PLBDS0EKqkqfprRs8XOd0Ib5RaTe6waqXPPTtpo+4L5J2MYnFyu134F8VZfy4L5wpN1A
 72wBQiNOlLH9/bSquKVIGFiG0ZnEbj3B6rUQ3JJ5o+CCFLpKtPVynTwAuQ2luj7caKon
 I/2QCBw6i4BuRNIqBBD8eZS8s4sj+iT+S2GBmOuRkULJPkXxzV6he4gFQ8E6yLIHwbFX
 5hBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5d6Bf1sCiSBTkV1f0O+KumDGD1FIdt2VxlTytyNjdJk=;
 b=JDKMtWXDdsed1IU/dAAUS9a7yzktx+Nhj25y1hMrSxuq2jC+gJP1SK5CbzSjc3ss6e
 Xp3V7HJgGUxHMb49xsGxxs1uaAwxPagpyc2sCNQitte57B7vJp97H+C8wyzEyehcKwkW
 bYTbNmEp6+6rPQl/qSb1kitODq8J7f4oGDQeFzYKMZW6s71svs7XfEqG1teuusLRuwD4
 tZV3wfYce24CCE9F32YPLYYjUkONNftsYlCo+L4pOmZd+hjPvNq24Otb/zPDo4gzftlB
 Vl9WbtpiFGAsqsG4eoR0gbFG8yXVFQj1OVj6tkcYybfY6ygFCsPwaHHfvsnm+3i72JoY
 lJmw==
X-Gm-Message-State: AOAM5305iqYbT7D0oTcbGIm5ExZc04xfuYBDxH8IJW+dzSLMVwpv0TGo
 /iukFFd9hRKRszVf6eodqvu4B6+D00yk78kiz8X+4Q==
X-Google-Smtp-Source: ABdhPJwEXu7IGskmhCnWGIbT75eQKMeQSo0GqyFXteTYjXKLCOF7y3CBYRVBKOBr5g/Iyh5afWY1RxS8e/LbKj3Hc2U=
X-Received: by 2002:a2e:8905:: with SMTP id d5mr986960lji.144.1604587261106;
 Thu, 05 Nov 2020 06:41:01 -0800 (PST)
MIME-Version: 1.0
References: <20201030002014.5398-1-linus.walleij@linaro.org>
 <6965ac31-c268-290c-c227-9c0e48ebf82f@denx.de>
In-Reply-To: <6965ac31-c268-290c-c227-9c0e48ebf82f@denx.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Nov 2020 15:40:50 +0100
Message-ID: <CACRpkdYnU5=vK5tjpwCzaZ7kVzGhEUmbsxSV7CiYNn3=_G5Vug@mail.gmail.com>
Subject: Re: [PATCH v7] backlight: lms283gf05: Convert to GPIO descriptors
To: Marek Vasut <marex@denx.de>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Lee Jones <lee.jones@linaro.org>, Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 30, 2020 at 9:13 AM Marek Vasut <marex@denx.de> wrote:
> On 10/30/20 1:20 AM, Linus Walleij wrote:

> > Marek: I saw this was written by you, are you regularly
> > testing the Z2 device?
>
> No, it has been a very long time since I last used this device.

OK then I suggest the maintainers just apply it by the token that
if a tree falls in the forest and noone is there to hear it, it doesn't
make a noise.

The kernel sure looks better after than before.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
