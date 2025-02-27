Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E09DA48C3E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 00:01:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC5F410EBA7;
	Thu, 27 Feb 2025 23:01:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Uqw1oTd4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0940410EBA7
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 23:01:36 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-390cf7458f5so1438850f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 15:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740697294; x=1741302094;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T/KXETJ0TFWxdMyVLabvOPEG48vmilHHA1hKIy0LJBc=;
 b=Uqw1oTd4Aj6+7pXjffzzzzCYd8orIdILd7XZFDENb4kCak2/VfP3a+HrN/sl6oVzJs
 cUP4oivhrkGTuI36u18uAikmuZ7J30ivAYQW02UhhD8SI675Iu9ZA4o2BT2atnlX5grc
 HNwUAh68ca6773RcYrBFNASJi44bq7s99os3crAKT2KBFmumZ0yC9BJ9xY+/QB8sqACX
 Gy5zDPx8i30d22TUtvO8ScgzHzQN0TpCyEdyVsAr8mc2TMEJXQt5NFq4OCKisKtzlhRK
 C+P38CdD6RnrkACjKLWsQI154kcgPbvmVpZjf9/PR6xDsHyGhvJqSALQxcdEpOVJz8HR
 4XZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740697294; x=1741302094;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T/KXETJ0TFWxdMyVLabvOPEG48vmilHHA1hKIy0LJBc=;
 b=AQ8zrSMOHMqrPYOqmrdnTQTGQdPAttmphRd+LJ7nGkswSj2tpGZTFuXcg6jnBew03x
 hSGeXDAQZ6Ncifthep2GHH9L0nksOspwlFr60BBYJ/7geG3NVz6jv7rFQSEmgDlD/I6S
 XSDbYJXVqvrONFnXJIpeiFEp/PZ1hGuEFtNmQrInILnxzZorFi8yq+j0u/SqK7+KRN1U
 OfuLt6Cpg7xSGgWSDyuGEw5BCZNY9j2dSqhYMqkwJfRvVZyMYngTFjgO/BOe/O9ygyMT
 ZTuFAjn0Oxld4wRAX0GHmRcN6qQqhxCUFOzDFPtnGMurz0DFNn7SOtRfB8wvpujScRxw
 PNYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBsUy8YQBaWz7aCezy8nOdl/EfUm3Og58TdbwnPBQU3C/aXVDA0353hCpjIZDJo947GumFRogzg+A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJ/DPnJSfW2EYvomD4LVK3vDH8E/5DQrNDu860zdBRGlAWvyH9
 z/jhPGegpwGmdFhiyDiw7/GCrxbWmW5F/zSU5fRP95Lu8q2hbqDRCynO9sn4mzN7IQGLrt+dTJ4
 J7teCIA0gHaVbuPXshetUmop/sS+U5mkwA0Gy
X-Gm-Gg: ASbGncvm3yB4z+eMrGCrjWJxjcpDAX6PjVwFC+3WRs8DIl+jDoLzqZSu52TrZT9OqZZ
 6G6c+79IPdn029Qt0ZZif0i9FCMK3bSAnFPcNyZN5zA1qPv8BXN8FYCUTgGQdM6ysMVgsasMtf6
 rym8B3ee0d
X-Google-Smtp-Source: AGHT+IEUTU0KblbuQlyHGcIr54A0QbBhcS2oujT2neK736LGyvJHYwON23tG1rKqrRjcL4V5ye5JFgYZaKYHem62dEg=
X-Received: by 2002:a05:6000:4c6:b0:38d:c44a:a64b with SMTP id
 ffacd0b85a97d-390eca2589amr634869f8f.48.1740697294171; Thu, 27 Feb 2025
 15:01:34 -0800 (PST)
MIME-Version: 1.0
References: <20250227-export-macro-v1-0-948775fc37aa@google.com>
 <20250227-export-macro-v1-4-948775fc37aa@google.com>
 <Z8DZEPoTJRwYj0p3@boqun-archlinux>
In-Reply-To: <Z8DZEPoTJRwYj0p3@boqun-archlinux>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 28 Feb 2025 00:01:22 +0100
X-Gm-Features: AQ5f1Joq_xPPPjbC654zyWyFJjBzyt9Fu0LwYPzYOhRY-ceZYmiJ6D8fWyhkRCQ
Message-ID: <CAH5fLghEiHmDABQNNCNr6czDyL4Cis60zxM6aFo+9CdqqSjsJQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] panic_qr: use new #[export] macro
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org
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

On Thu, Feb 27, 2025 at 10:29=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> =
wrote:
>
> On Thu, Feb 27, 2025 at 05:02:02PM +0000, Alice Ryhl wrote:
> > This validates at compile time that the signatures match what is in the
> > header file. It highlights one annoyance with the compile-time check,
> > which is that it can only be used with functions marked unsafe.
> >
> > If the function is not unsafe, then this error is emitted:
> >
> > error[E0308]: `if` and `else` have incompatible types
>
> Is there a way to improve this error message? I vaguely remember there
> are ways to do customized error message.

The if/else error message is super nice because it shows the two types
next to each other where it's very easy to read the signatures and
spot the difference. But if you want to investigate other constructs
that potentially have better error messages, feel free. I'm happy to
update if you find a better construct.

Alice
