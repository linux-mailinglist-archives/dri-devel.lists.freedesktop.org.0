Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 722D98BBCD3
	for <lists+dri-devel@lfdr.de>; Sat,  4 May 2024 17:40:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4DD910E2E3;
	Sat,  4 May 2024 15:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Vk0mtpKm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA8C510E2E3
 for <dri-devel@lists.freedesktop.org>; Sat,  4 May 2024 15:40:45 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a599c55055dso125717966b.0
 for <dri-devel@lists.freedesktop.org>; Sat, 04 May 2024 08:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1714837244; x=1715442044;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PFxw8P3AYgeC7IB6rTn+68WOAU10n6cRPv/6X7o+SOY=;
 b=Vk0mtpKmgijNPIDnbN2N7l/ED0Q7hDEgmnETcQkfHjsVTxRwQx1OWOb/dfweV8bbNn
 UVbQeSUDmcClfeQj0kgP7AQuy32X0M187zJ9lpeoWey2x6D9EI0D0QYecHxptGrykwBS
 pUjcIt5PvVgJyNs4S6750drMJgI9QcbLdhjRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714837244; x=1715442044;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PFxw8P3AYgeC7IB6rTn+68WOAU10n6cRPv/6X7o+SOY=;
 b=uUK6NZa0yWhtUFHvNHgUNG4qDRVeiZxu5QIneKvF91d1hZ9MO6lWq9EOck9d8hwvrC
 iR3XQtjnC7h6yKZqEgE6S5S+UDw/I/FgDbKinox/dTgxF09fKv8QfI33mR5MyUHPuKT+
 Yxibrv3GZh7KDIPTSMQxSXVq/ORBDFcofbmQMeUmPR1v4ec0YB9YSmgd+G5oUEh9+QJj
 Om1ejAT1DVRt968KKBc9YycnFp4k7IOMW76Ct50EnISZ3locDjigpFbcEi6ndOPVIWZp
 n5pQjKI9dTcuJaAnXec8Wn0qNs14UMVE6tylKmJQnBQctmxy0lpmNbrXnRpJHFPdD5Kc
 T4Ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFv1PvuZbqMq0ewGJBk191yz+vEit5kjCKjYX4hNqpxMv0xEpnvbbAP4oUaKrIFWGGiOi1FoEq9vRuaR8Hm6jc2qmE3euXp2QQWtIgBALV
X-Gm-Message-State: AOJu0YzV8R7P3rHUo7k8VkNOcj+bssIfLE+I5lY4UUt3ohfR0aZoMDKX
 uAGTxN31dQNonpERTiK6u+FiHxKEHViMkPoJG0VqRIPqwYoxfOLV/TyHPxIeWcgkuuz4a664pZQ
 qnVFUzQ==
X-Google-Smtp-Source: AGHT+IG2U0WA7yfpUiUxfdX1eZOIAZ0Ekaj1vNprDUlwLPY3Uy6B/pVUubCFlMbmASPDUyjjr8nHCQ==
X-Received: by 2002:a17:906:b212:b0:a59:a83b:d440 with SMTP id
 p18-20020a170906b21200b00a59a83bd440mr1225783ejz.31.1714837243867; 
 Sat, 04 May 2024 08:40:43 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com.
 [209.85.218.49]) by smtp.gmail.com with ESMTPSA id
 x19-20020a170906135300b00a599e418208sm1438035ejb.9.2024.05.04.08.40.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 May 2024 08:40:42 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a599c55055dso125714266b.0
 for <dri-devel@lists.freedesktop.org>; Sat, 04 May 2024 08:40:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUPhU+Qpo1DYUyARrNXOq0P9cv/fHw2ayCqypeoJSN5gZ3wls9g0s5auB5dFNdx6iq4YofVxBreqPNRaSnQFCW+Zy/F0vpKz8dVk64ypsYq
X-Received: by 2002:a17:906:cf83:b0:a55:75f6:ce0f with SMTP id
 um3-20020a170906cf8300b00a5575f6ce0fmr3540131ejb.13.1714837242162; Sat, 04
 May 2024 08:40:42 -0700 (PDT)
MIME-Version: 1.0
References: <202405031110.6F47982593@keescook>
 <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV>
 <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240504-wohngebiet-restwert-6c3c94fddbdd@brauner>
 <CAHk-=wj_Fu1FkMFrjivQ=MGkwkKXZBuh0f4BEhcZHD5WCvHesw@mail.gmail.com>
In-Reply-To: <CAHk-=wj_Fu1FkMFrjivQ=MGkwkKXZBuh0f4BEhcZHD5WCvHesw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 4 May 2024 08:40:25 -0700
X-Gmail-Original-Message-ID: <CAHk-=wirxPSQgRV1u7t4qS1t4ED7w7OeehdUSC-LYZXspqa49w@mail.gmail.com>
Message-ID: <CAHk-=wirxPSQgRV1u7t4qS1t4ED7w7OeehdUSC-LYZXspqa49w@mail.gmail.com>
Subject: Re: [PATCH] epoll: try to be a _bit_ better about file lifetimes
To: Christian Brauner <brauner@kernel.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, keescook@chromium.org, axboe@kernel.dk, 
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
 io-uring@vger.kernel.org, jack@suse.cz, laura@labbott.name, 
 linaro-mm-sig@lists.linaro.org, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 minhquangbui99@gmail.com, sumit.semwal@linaro.org, 
 syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com, 
 syzkaller-bugs@googlegroups.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 4 May 2024 at 08:32, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Now, during this TOTALLY INNOCENT sock_poll(), in another thread, the
> file closing completes, eventpoll_release() finishes [..]

Actually, Al is right that ep_item_poll() should be holding the
ep->mtx, so eventpoll_release() -> eventpoll_release_file_file() ->
mutex_lock(&ep->mtx) should block and the file doesn't actually get
released.

So I guess the sock_poll() issue cannot happen. It does need some
poll() function that does 'fget()', and believes that it works.

But because the f_count has already gone down to zero, fget() doesn't
work, and doesn't keep the file around, and you have the bug.

The cases that do fget() in poll() are probably race, but they aren't
buggy. epoll is buggy.

So my example wasn't going to work, but the argument isn't really any
different, it's just a much more limited case that breaks.

And maybe it's even *only* dma-buf that does that fget() in its
->poll() function. Even *then* it's not a dma-buf.c bug.

               Linus
