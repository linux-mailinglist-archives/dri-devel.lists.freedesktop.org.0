Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0F18BE9D0
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 18:54:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D015112524;
	Tue,  7 May 2024 16:54:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Ock2zafK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27DE0112524
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 16:54:31 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a59b58fe083so538009166b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 09:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1715100870; x=1715705670;
 darn=lists.freedesktop.org; 
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x+/m+VOoT4mV8mZDo3MLSD/vsCL7+IgmGDq9kgXSLzI=;
 b=Ock2zafKNks+uWGTgRYdzmmkdjnyPFxkE1YZeb6AFv8hwoFmfWgWw/f5850L3AmX9D
 W2izPNyCq+IdLdqk6f0yI/9TjYI0KBWDaStH61yjpJAm/8JwhTdUjtmKmz22ly+Y0io3
 ulllJqhGoCsQIxaoxA4vuaUIunAlQANflf8SA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715100870; x=1715705670;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x+/m+VOoT4mV8mZDo3MLSD/vsCL7+IgmGDq9kgXSLzI=;
 b=kAa+Qa318msxowvffocbFdmkIYgewb5/FRXkFv+WEFe64MZkeSTDh6y4/t5xd4aqXC
 THgK5pdHd4+CkUw/KGcBPkNyIR0eqxTDMKCBG2UU0MgQpHLLFXJI0rR9fsL83jfYff9r
 PscDwKThgl1mIMqP5tFZZlsIh65+fWni7etyhvBYswtVi/+NLvyXhOlNOZVzm7jK/73i
 3px113nreAhTki40drCSDffkzWzvWjjpMdwNv9QIkHOYzNmQxrQOobsIPnmg6n43P+BI
 9lZCTeHzsYZoimiQWVT16mSxGjAq1Stx5M+CkGMmlsor0LXM2/oCdCccrT4qhpdPhAKg
 Zu7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWM5qXSPs59CG+fzYG8kCj/bKNWATewjGJGuzcWltuQgAXsmaeEEi0tYTlUwvYLqdqXNTnzb6McEBFDllYXMEvAec513VOTHv5UhgTLPigc
X-Gm-Message-State: AOJu0Yw6fwNWW99c9QWXKGN5zsgBqVgQ/PwPZUvS2Cc2B3bvEUeouOoV
 VeACvurZYnyHlbuMiRm3GdYJdU88+ydMTHV2PZjzlrm3qiIJeL86VLJKtVjUsqK+NISDx/wvh4i
 bP/Xxgg==
X-Google-Smtp-Source: AGHT+IH4BbtgeeXgCixCjYiHLwe/twUIZ1TzaAEURGStgDXoGFIQedmGJP2bSqHRSdTMVz2K56oj2A==
X-Received: by 2002:a17:906:5611:b0:a59:c7d7:8b18 with SMTP id
 a640c23a62f3a-a59fb95a4a8mr3483666b.30.1715100870097; 
 Tue, 07 May 2024 09:54:30 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com.
 [209.85.128.46]) by smtp.gmail.com with ESMTPSA id
 f13-20020a1709067f8d00b00a59d146f034sm2382378ejr.132.2024.05.07.09.54.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 May 2024 09:54:29 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-41b794510cdso27038185e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 09:54:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW5tv9iONfhv8QxSIAbYDsGvKG6Zs4Ps5bC7BVvUYsR8/Bqh5NlS2lL58Wz5DzNHDZ2r2f7kr07vYIM/650TPDxqCt7OvSopWPErQapy27R
X-Received: by 2002:a17:906:d148:b0:a59:b099:1544 with SMTP id
 a640c23a62f3a-a59fb96bda9mr1610066b.42.1715100407952; Tue, 07 May 2024
 09:46:47 -0700 (PDT)
MIME-Version: 1.0
References: <202405031110.6F47982593@keescook>
 <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV>
 <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240504-wohngebiet-restwert-6c3c94fddbdd@brauner>
 <CAHk-=wj_Fu1FkMFrjivQ=MGkwkKXZBuh0f4BEhcZHD5WCvHesw@mail.gmail.com>
 <CAHk-=wj6XL9MGCd_nUzRj6SaKeN0TsyTTZDFpGdW34R+zMZaSg@mail.gmail.com>
 <b1728d20-047c-4e28-8458-bf3206a1c97c@gmail.com>
 <ZjoKX4nmrRdevyxm@phenom.ffwll.local>
In-Reply-To: <ZjoKX4nmrRdevyxm@phenom.ffwll.local>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 7 May 2024 09:46:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgh5S-7sCCqXBxGcXHZDhe4U8cuaXpVTjtXLej2si2f3g@mail.gmail.com>
Message-ID: <CAHk-=wgh5S-7sCCqXBxGcXHZDhe4U8cuaXpVTjtXLej2si2f3g@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH] epoll: try to be a _bit_ better about
 file lifetimes
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christian Brauner <brauner@kernel.org>, 
 Al Viro <viro@zeniv.linux.org.uk>, keescook@chromium.org, axboe@kernel.dk, 
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

On Tue, 7 May 2024 at 04:03, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> It's really annoying that on some distros/builds we don't have that, and
> for gpu driver stack reasons we _really_ need to know whether a fd is the
> same as another, due to some messy uniqueness requirements on buffer
> objects various drivers have.

It's sad that such a simple thing would require two other horrid
models (EPOLL or KCMP).

There'[s a reason that KCMP is a config option - *some* of that is
horrible code - but the "compare file descriptors for equality" is not
that reason.

Note that KCMP really is a broken mess. It's also a potential security
hole, even for the simple things, because of how it ends up comparing
kernel pointers (ie it doesn't just say "same file descriptor", it
gives an ordering of them, so you can use KCMP to sort things in
kernel space).

And yes, it orders them after obfuscating the pointer, but it's still
not something I would consider sane as a baseline interface. It was
designed for checkpoint-restore, it's the wrong thing to use for some
"are these file descriptors the same".

The same argument goes for using EPOLL for that. Disgusting hack.

Just what are the requirements for the GPU stack? Is one of the file
descriptors "trusted", IOW, you know what kind it is?

Because dammit, it's *so* easy to do. You could just add a core DRM
ioctl for it. Literally just

        struct fd f1 = fdget(fd1);
        struct fd f2 = fdget(fd2);
        int same;

        same = f1.file && f1.file == f2.file;
        fdput(fd1);
        fdput(fd2);
        return same;

where the only question is if you also woudl want to deal with O_PATH
fd's, in which case the "fdget()" would be "fdget_raw()".

Honestly, adding some DRM ioctl for this sounds hacky, but it sounds
less hacky than relying on EPOLL or KCMP.

I'd be perfectly ok with adding a generic "FISAME" VFS level ioctl
too, if this is possibly a more common thing. and not just DRM wants
it.

Would something like that work for you?

                 Linus
