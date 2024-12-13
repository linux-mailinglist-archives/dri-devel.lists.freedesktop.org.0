Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 732C39F0678
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 09:36:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E964610EF59;
	Fri, 13 Dec 2024 08:36:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="a8EbiBrB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C742010EF59;
 Fri, 13 Dec 2024 08:36:47 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id
 6a1803df08f44-6d932b5081eso13962796d6.1; 
 Fri, 13 Dec 2024 00:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734079007; x=1734683807; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KRt1MXIvY7wy4Sl3wPWxh5TWbRsTuTxrC9cGCSyNao0=;
 b=a8EbiBrBSd9y3oIhinswPJT3B01gxGfIrbOH5j6eWKrwBzvsmtpwTJZhKlVvU5PA4P
 ZScSJ46/D6cOmcIsx21W+6EEnQ9iLN/yhSS9e8dmpTtp7mXu9GwSzfh1OticUNORGnct
 aRdCoXSmHVLwXH/PdWMFx1M/cTMJbd8HexawB/DDpw6Fxh+O8bS8+47c1gF8BpSuK/n4
 rqdQYKKxVUuNdAaqquK1FicacOuck7Yh3RWjJlpqc+IdCoTh/Roj/STvzYghnFmWx/YD
 7w3P3B3NAz2WMzvnG7bICJTvpMXpF1arknzZ1t6oDrNLRA/p1N0OQmgazt6Qg2lMM2tb
 j3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734079007; x=1734683807;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KRt1MXIvY7wy4Sl3wPWxh5TWbRsTuTxrC9cGCSyNao0=;
 b=KsazMi2WbzY/JEtUF28POjdPeWL1NiyY+u8pfBRL2hRmGo1p5AOtue159Bc2Gocm2M
 6nr0GMyuDhsxIryR8f1z+acrlEpUViWK+1EeMcelorfrulqZQHYbWdEvLcFDM401CSuW
 hm7oRCWgJ7fLBNjRu6bTkdGk8bt/CLGy71yUdqAsstdUU5uT3XK2eeVah/j/yjbedRgS
 ejXr3hykVfH80K5saM9yk4lg7UNyhM4qLi/Ue5l2RBSaXxn4f78yW0N4PTlo+Orh5axN
 47F7G2Ej7LdItZrmy+LzCUMrQd2fPms1AlElZyYFIiA5ABr2BkDwvxbFlOivqCn9E9UU
 OenQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBHSWcC7KXFPRppYakyr/2Ue8Im0OmfOJRR1W3Vdf/t7/V6oY8qYxdhNQZgysx912J3zW6cObwvHE=@lists.freedesktop.org,
 AJvYcCVUbfNKCVM20ujzHpHSKtq/T/X+OFCbChLpwBPt4JAI1gwMO+YI8uI1En9reoY9wF3uCKcPUBr7uQ==@lists.freedesktop.org,
 AJvYcCXABTM3Yu4gR4ZtDnvYlq9o5vGla9F+2M4bb1GX+u1/oGukclN3q4Lka4dUb8TISbzl4kL4P7ZzGer2@lists.freedesktop.org,
 AJvYcCXDVK5rj1o5RGVG0y4+xNT2smZBE/9raM94VUoVSvHOXqhSadZBIhdLQwX3kg+ZZb5/cvKmS/XzHsM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yya9Kci8TLNWrhz25sVKhNDMgbsgVjBkEkaYw8Q0iqZEymMoNdz
 Vrur+KqbY+CuTBCbhIste/EkKfjSQsDqLr71Q2RNfKic9EHWSKwqKCOVDD6PwH5Xvw5rG+mZNQU
 u+K4Bg7pOkFHyVOypI4QkLakRpwo=
X-Gm-Gg: ASbGncuAqbDmKmzqUsjEdGG3pdL6Fkuz7klEVX1sH6VpZlvV86Ab1BHVgTocirCt2zk
 tGtlBqvvue/3Cq5Ew6qCd7/A43JRzmvNUpasPq7Y=
X-Google-Smtp-Source: AGHT+IEt1cOWo4VsTmw/6EdhS/KZ00UrsyLMhWiucugMYEeldbYzELrBj4wzlhuYfpJWzQ/nKiHjbqdqIiCiPqivAYk=
X-Received: by 2002:a05:6214:301e:b0:6cb:ee08:c1e8 with SMTP id
 6a1803df08f44-6dc8ca869aamr25025096d6.23.1734079006748; Fri, 13 Dec 2024
 00:36:46 -0800 (PST)
MIME-Version: 1.0
References: <20241213054610.55843-1-laoar.shao@gmail.com>
 <20241213054610.55843-2-laoar.shao@gmail.com>
 <Z1vq2-V7vB5KhBR9@pathway.suse.cz>
In-Reply-To: <Z1vq2-V7vB5KhBR9@pathway.suse.cz>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Fri, 13 Dec 2024 16:36:10 +0800
Message-ID: <CALOAHbAD-USZYry6dToxDTM-OO1+Rz0g6XQkCjhzhWDt7g4MGw@mail.gmail.com>
Subject: Re: [PATCH 1/7] vsprintf: Add %pTN to print task name
To: Petr Mladek <pmladek@suse.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
 linux-security-module@vger.kernel.org, x86@kernel.org, 
 linux-snps-arc@lists.infradead.org, linux-wireless@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 ocfs2-devel@lists.linux.dev, Steven Rostedt <rostedt@goodmis.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
 Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 13, 2024 at 4:05=E2=80=AFPM Petr Mladek <pmladek@suse.com> wrot=
e:
>
> On Fri 2024-12-13 13:46:04, Yafang Shao wrote:
> > Since the task->comm is guaranteed to be NUL-ternimated, we can print i=
t
> > directly. Add a new vsnprintf format specifier "%pTN" to print task com=
m,
> > where 'p' represents the task Pointer, 'T' stands for Task, and 'N' den=
ots
> > Name. With this abstraction, the user no longer needs to care about
> > retrieving task name.
>
> What is the advantage, please?

The advantage is that it provides the flexibility to modify the comm
representation to meet future requirements. For instance, we could
rename it to "task_name" and increase its size.

>
> Honestly, I believe that the meaning of
>
>         printk("%s\n", task->comm);
>
> is much more clear than using a cryptic %pXYZ modifier:
>
>         printk("%pTN\n", task);
>
>
> The %pXYZ modifiers makes sense only when the formatting of the printed
> information needs some processing. But this is a plain string.

That makes sense to me.

> IMHO, it is not worth it. In fact, I believe that it is a
> counter productive.

Linus, what are your thoughts?


--
Regards
Yafang
