Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6787E6C22AF
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 21:30:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E45410E663;
	Mon, 20 Mar 2023 20:30:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D427810E666
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 20:30:36 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id r11so51770047edd.5
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 13:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1679344235;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N2+Cqt9Dw1TliJ9hvyF98sgSSViJR0lNIaWyRtxAIhg=;
 b=D1+1UYOHb/z/WfJlZyxQvGrDf3hygcuQOhllbGNlRq8aGEWlDJEZIdV9+srQA0jKwc
 k+mFGcoCkUhU6EHiea6hB+UqH7Ky33fniRXlqKvv88lfxDp0/+dCxSQ2PQ5PtRCMyf46
 HqwxpAx+1nPVskCqmBhzH2lldd0mBkF9t6Jfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679344235;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N2+Cqt9Dw1TliJ9hvyF98sgSSViJR0lNIaWyRtxAIhg=;
 b=xGSg2cIRs6VGNUgkRzAAyEFKChHdNZcfv9kYVWqr0eHry79FTEXv38yxSUW4xqzG2w
 5d+ToE1eHur4/iqa6jjNfPj53+qrt0cCSQVYOdyzj6hYnDK3GISDIt986EEyDQ3F9gDb
 lRj1UFnpk7GlIRVXrHqfUntEK6nSX5ljEUvE1JcD5Ls+f4uq1d8HoeO1CYhATkEQ1MeL
 AvTTPDlE6JTHV2Z4rXZDNuFPItqWRKcZCU7xcE3CBvOh54Q1r0vZHAP+t+BIw95wyJ+H
 ZILM0tpfnZDcjzodty16dCUiqZnsa1vCqPjTUzjGcra8qdbQmLD90MVmdCG/5hI2sMpT
 KfpA==
X-Gm-Message-State: AO0yUKWyGzCA/X7ag4fCJzTqdIPPkE+8I5UOJwl6lvT375URJnpoQuoj
 WMx6bXs56+kvTdDJ9gtIq7LL6svpv8sBf/ZoyOIFGrUV
X-Google-Smtp-Source: AK7set9kKezjUuuwvBYnXgPqJ8e43aiJp+mp1TpkZNhMQZnB93sQBBs29aWL3KJZN6Zascr5vqRS3A==
X-Received: by 2002:a17:906:f201:b0:91e:37ec:3c90 with SMTP id
 gt1-20020a170906f20100b0091e37ec3c90mr405955ejb.31.1679344234909; 
 Mon, 20 Mar 2023 13:30:34 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com.
 [209.85.208.42]) by smtp.gmail.com with ESMTPSA id
 k7-20020a1709062a4700b008b176df2899sm4818616eje.160.2023.03.20.13.30.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 13:30:34 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id cn12so6123259edb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 13:30:34 -0700 (PDT)
X-Received: by 2002:a17:907:375:b0:933:1967:a984 with SMTP id
 rs21-20020a170907037500b009331967a984mr145268ejb.15.1679344234061; Mon, 20
 Mar 2023 13:30:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wiPd8R8-zSqTOtJ9KYeZLBByHug7ny3rgP-ZqzpP_KELg@mail.gmail.com>
 <20230320180501.GA598084@dev-arch.thelio-3990X>
 <CAHk-=wgSqpdkeJBb92M37JNTdRQJRnRUApraHKE8uGHTqQuu2Q@mail.gmail.com>
 <4adbed5a-6f73-42ac-b7be-e12c764ae808@roeck-us.net>
In-Reply-To: <4adbed5a-6f73-42ac-b7be-e12c764ae808@roeck-us.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 20 Mar 2023 13:30:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgyJREUR1WgfFmie5XVJnBLr1VPVbSibh1+Cq57Bh4Tag@mail.gmail.com>
Message-ID: <CAHk-=wgyJREUR1WgfFmie5XVJnBLr1VPVbSibh1+Cq57Bh4Tag@mail.gmail.com>
Subject: Re: Linux 6.3-rc3
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Nathan Chancellor <nathan@kernel.org>, dri-devel@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 20, 2023 at 1:05=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> I have noticed that gcc doesn't always warn about uninitialized variables
> in most architectures.

Yeah, I'm getting the feeling that when the gcc people were trying to
make -Wmaybe-uninitialized work better (when moving it into "-Wall"),
they ended up moving a lot of "clearly uninitialized" cases into it.

So then because we disable the "maybe" case (with
-Wno-maybe-uninitialized) because it had too many random false
positives, we end up not seeing the obvious cases either.

              Linus
