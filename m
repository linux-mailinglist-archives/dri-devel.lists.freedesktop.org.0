Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C3058BC25
	for <lists+dri-devel@lfdr.de>; Sun,  7 Aug 2022 19:57:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B93D3112A72;
	Sun,  7 Aug 2022 17:57:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53759112EEC
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Aug 2022 17:55:23 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id f22so8897563edc.7
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Aug 2022 10:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=tH9P5Ev6KfldpgA7IyGsP6cuudklMvx95MGD8TKUKT4=;
 b=C4CL1iu+qx5rdNpY/Qdx3Op6dbE/9zKXo4LCAeV+cbmx/rvLCK+FcObJUilhM226pd
 qtTxjZWV0gQfDYjqPT/IttAiEKQ6zFvDllkAQkGzhczUFYexBZVFtNxH/hwngF0cEm0M
 jFXxpFIfpzmNNaiVAKGaWiV4JLbHqQY4j7Qg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=tH9P5Ev6KfldpgA7IyGsP6cuudklMvx95MGD8TKUKT4=;
 b=ixQz4udD+CX+4lLR4WrRo8VW1ZEuPCvMxcVPBWNz8ylMJTsdAynSIHpsTiwzyDGeaD
 /DqFkuey1kJp0/vOhSEOVGiyQbGlJu4E7490EJ09XMd0P3MQmDnbvZ0FVTngDNBE2x9f
 LIDmWdD6aV5h/7HAsg1biu1l6tHyeTcdpgZwEHvopbAFIX9mqYDhrsCp/nlDxKI7VUx+
 yjIwGcHuoT0h0XOrWyZMW1MjfXQ/d5cGTptOJjMINdsQJvhxyn5ZKGu4dotbXtMJoAbB
 e/pOMFZ9VjOtKeyDrdix7W9oK9wNf+lrKccPoVxA/6LBXRzweneyHfysJ/BKFQ/rGN26
 HiKg==
X-Gm-Message-State: ACgBeo1w+beLwpNlC/72W8Z+m4Cx6bhKcY2NTzGvP3Hhkd5hs177w93W
 awV5rx+oVSxIm6oQX0rj/niGBX3Q7Xo3AHN3
X-Google-Smtp-Source: AA6agR4zNIxwc/8s1TQDIGepsfmiwHq7E92cxCMy7w2wri/HeEghqR548YXgYj7ZQb7tiCyhHuvlGw==
X-Received: by 2002:a05:6402:5510:b0:43a:76ff:b044 with SMTP id
 fi16-20020a056402551000b0043a76ffb044mr15439554edb.197.1659894921624; 
 Sun, 07 Aug 2022 10:55:21 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com.
 [209.85.128.50]) by smtp.gmail.com with ESMTPSA id
 q19-20020aa7da93000000b0043bd2a79311sm3443369eds.37.2022.08.07.10.55.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Aug 2022 10:55:21 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id
 c187-20020a1c35c4000000b003a30d88fe8eso6333050wma.2
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Aug 2022 10:55:21 -0700 (PDT)
X-Received: by 2002:a05:600c:1d94:b0:3a4:ffd9:bb4a with SMTP id
 p20-20020a05600c1d9400b003a4ffd9bb4amr10178442wms.8.1659894920750; Sun, 07
 Aug 2022 10:55:20 -0700 (PDT)
MIME-Version: 1.0
References: <YuwRyQYPCb1FD+mr@debian>
 <CAHk-=whptVSSZL=wSUQJdRBeVfS+Xy_K4anQ7eQOky7XUrXhUQ@mail.gmail.com>
 <CAK8P3a2bEaExue0OtNeLa2CVzBx-1dE9w2HZ2PAV5N8Ct9G=JQ@mail.gmail.com>
 <YuwvfsztWaHvquwC@dev-arch.thelio-3990X>
 <9fb73284-7572-5703-93d3-f83a43535baf@amd.com>
 <CAK8P3a3Fv=_+GV9r=k4jP72zZOjJowL-GOue-51EhyVDBaEfEw@mail.gmail.com>
 <Yu1bMqL5tsbq1ojj@dev-arch.thelio-3990X>
 <CAK8P3a3PAxkctN6AXOsoTBTFgwHhk7_OSYwJ4Rgk7Dbs+bc0Qw@mail.gmail.com>
 <cb3ea155c4e149eca30ca870e3f2546d@AcuMS.aculab.com>
In-Reply-To: <cb3ea155c4e149eca30ca870e3f2546d@AcuMS.aculab.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 7 Aug 2022 10:55:04 -0700
X-Gmail-Original-Message-ID: <CAHk-=wghheK1pKhpu9SuQkjzUvu25-vTu8nyxozooarhAmaXhw@mail.gmail.com>
Message-ID: <CAHk-=wghheK1pKhpu9SuQkjzUvu25-vTu8nyxozooarhAmaXhw@mail.gmail.com>
Subject: Re: mainline build failure for x86_64 allmodconfig with clang
To: David Laight <David.Laight@aculab.com>
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
Cc: Arnd Bergmann <arnd@kernel.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@linux.ie>, clang-built-linux <llvm@lists.linux.dev>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Sudip Mukherjee \(Codethink\)" <sudipm.mukherjee@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 7, 2022 at 10:36 AM David Laight <David.Laight@aculab.com> wrote:
>
> Or just shoot the software engineer who thinks 100 arguments
> is sane. :-)

I suspect the issue is that it's not primarily a software engineer who
wrote that code.

Hardware people writing code are about as scary as software engineers
with a soldering iron.

               Linus
