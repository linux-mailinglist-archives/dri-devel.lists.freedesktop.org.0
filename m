Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09593A753C0
	for <lists+dri-devel@lfdr.de>; Sat, 29 Mar 2025 01:48:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37AA610EAD4;
	Sat, 29 Mar 2025 00:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="TqtpcE9G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B953110EAD4
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Mar 2025 00:48:05 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-ac73723b2d5so77197366b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 17:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1743209284; x=1743814084;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vSWfXqTtVONWjEjGnSYCIl5O9S7T/KCfljo3I595s4w=;
 b=TqtpcE9GeRDjW3sLdphorLWHwwZDpzHCQpauINlZWJxYLp9ap3R4zJ9IbAPQaKTSL7
 lS6TgzXHTB9OYKI7FadY66kaknxbs+tSX7xLbLPfKKASWz7FXk1Cdxs5uWdhLd9aJ+LA
 3lcZ1hDCLdZiWOGaa9650BlzVLtrDMR6nv878=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743209284; x=1743814084;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vSWfXqTtVONWjEjGnSYCIl5O9S7T/KCfljo3I595s4w=;
 b=G1oZGhqrym8R1/IN6er4ishaT7152hLlZ69iJb8XhS8CljA4U9rZdpzJVuZyoj+4f9
 IWhm7vnzLTb/9w2pz4i6opuX2mJwNNMpopmO0WFpCaxVcKKSs3f0dTx41Iv/i063s9s5
 txrbQ+uGBnxqGEKUFC9JEZtjG7i/ytbaORmHnLp7zyKdRT6cfHcEFSsFIoce9stDOsk0
 +s4zGWiusahkZ9JzRTCa+5oA1YvhlkiksCLfZ+WX1HSm0CEUFXF0w3XX66FL0fB+bbOD
 pQdGDdKr3acvqWFX5Vv/FHrU5Ro/fymiE8ebqhRINrKyq/O8UfEDepTNgQSdGTnknM8a
 bLdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMKngux1RY/Ae8/yM6eYGEih+LXAln+UZfDKI4zqcf1WEwWEypI7P/FLFAKIjJQ41ZpvzINnCbIeo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBBUkef1Sa8BoKWIaO4i0n+bZDmwsT4Ikz2xYzVxQKSe/bh30g
 gqNVtRfxVjbRzcQqMx/XblL1B1pedsfeMxfLBqXv8fgYHd2HVmQWRr97LEx9numA7d4Xm2yD7ct
 C0kM=
X-Gm-Gg: ASbGncse/tduufyhcYD6JJ29FcL041wHMNAAqhqH9I6pKhAoMnKYryy6VjBtMMp6dqi
 bG7VMGIn7m0pPaLw+PcFFX2Q3deLFKinp2/JlFeF/ZlNOcI8YXSEAgAnnAOyrArKURgzTS+5g+M
 7zLuNspZvGBE1tmNh0wzNsbanx8VXW+2tfG9j3lbPYq1BjyFc0/ewPjo+z+EnT088Pl1Zy8Lyb7
 omKfD9KXwsUtnK9RTJb+zFBTOOb/I5ti3xYHX4AkpX2NDXFXUC8yrjAweW/4JIMg5w6kpvIMhH1
 KzKF/2I7dgVvU+dgQ0stYsDOJrCnYEX+whUne6/UxYbzBBLLck2V+QVmpK0GvwrTq53YkZum1Xz
 zYYX5eaYv96vWi/7e+/g=
X-Google-Smtp-Source: AGHT+IF9RDx8F6m36N6EglVRNHGxIeYJuMDEbZLgJkIaKeC7Jua3NpdYJF7xp4wyMbSq+ToF8RdQjA==
X-Received: by 2002:a17:907:2ce6:b0:ac4:493:403 with SMTP id
 a640c23a62f3a-ac738be0827mr76160566b.37.1743209283703; 
 Fri, 28 Mar 2025 17:48:03 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com.
 [209.85.208.42]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5edc17b1e41sm2114312a12.63.2025.03.28.17.48.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Mar 2025 17:48:03 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5e5cd420781so5276596a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 17:48:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVBCozQzHAAKD5gKjuuFJFZas5PviUi+jsJUUhZxPaTBte2ZjeoevxtYbNrPkZGx9TYM1RvmDX9ggc=@lists.freedesktop.org
X-Received: by 2002:a17:907:7243:b0:abf:59e1:ad88 with SMTP id
 a640c23a62f3a-ac738a52618mr108343466b.29.1743209282057; Fri, 28 Mar 2025
 17:48:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tyx=edsZ3ajuAUAv4vjfa=WNEzobqAsYbBTjCfLbuEeFQ@mail.gmail.com>
In-Reply-To: <CAPM=9tyx=edsZ3ajuAUAv4vjfa=WNEzobqAsYbBTjCfLbuEeFQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 28 Mar 2025 17:47:45 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjcdfrDTjzm6J6T-3fxtVyBG7a_0BXc2=mgOuM6KPFnCg@mail.gmail.com>
X-Gm-Features: AQ5f1JpwLkBfLNPVNA75n3MocrdUGO9s7ICZtUVMklJ6FSaTF5cP68qqN1KX5Co
Message-ID: <CAHk-=wjcdfrDTjzm6J6T-3fxtVyBG7a_0BXc2=mgOuM6KPFnCg@mail.gmail.com>
Subject: Re: [git pull] drm for 6.15-rc1
To: Dave Airlie <airlied@gmail.com>
Cc: simona.vetter@ffwll.ch, dri-devel <dri-devel@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>
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

On Thu, 27 Mar 2025 at 19:53, Dave Airlie <airlied@gmail.com> wrote:
>
> This is the main drm pull request for 6.15. Bit late, but my wife was
> away getting a PhD and kids took over my writing summaries time, and
> fd.o was offline last week which slowed me down a small bit.

Grr. I did the pull, resolved the (trivial) conflicts, but I notice
that this ended up containing the disgusting "hdrtest" crap that

 (a) slows down the build because it's done for a regular allmodconfig
build rather than be some simple thing that you guys can run as needed

 (b) also leaves random 'hdrtest' turds around in the include directories

People already complained separately about this. It should never have
made it to me in this broken form.

Why the heck is this testing being done as a regular part of the build?

And dammit we don't add random turd files for dependencies that then
make the source tree nasty.

The thing that made me notice that it was still there was that "git
status" complains about the stupid turds not being ignored.

But more importantly, those turds also break filename completion! So
no, adding it to gitignore doesn't actually fix the problem, it would
just have made me not notice as quickly.

This thing needs to *die*.

If you want to do that hdrtest thing, do it as part of your *own*
checks. Don't make everybody else see that disgusting thing and have
those turds in their trees.

I'll just disable it by marking it BROKEN for now. You guys can figure
out what you want to do, but no, forcing others to see those things is
not the answer.

I would suggest you *not* make this part of the Kconfig setup and
normal build at all, but be something where *you* can run it as part
of your tests (ie do it as a "make drm-hdrtest" kind of thing, not as
part of regular builds).

                 Linus
