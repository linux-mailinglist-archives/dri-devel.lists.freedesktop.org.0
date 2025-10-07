Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3CBBC23DC
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 19:21:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1847E10E1C6;
	Tue,  7 Oct 2025 17:21:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aPe/apwp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C61A10E1C6
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 17:21:28 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-269ba651d06so12353865ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 10:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759857687; x=1760462487; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GY9baoySzSZr6T4oYF3bCPJoTe08YW4EjCGWDqwSwoI=;
 b=aPe/apwprWjx8xF8cohfoPEqPnVOZ3GjjYk4/nErDjrQZXk0p1xRwvnzbW/e6PYxUy
 i8gsRQ1N+eLkYEFqejVheJaAmHigDcbll/AsGzkonCDpLrwrNbuZQnwn4AKLTr1OzphB
 WV2ohVpOPxFPye1LoNAKQhilE/mlvMPBq4GBRTvT2OdX5NhhS9x6SpsMdQrz0+7JARuE
 zzTU59iG8FhGDx7hgtw2+DLK0aEz5BQIU/GRVo4BOibvjkNIYoLUU5MjHbasSLziV886
 0pl4yYQN2S/BuonnnTgsqwlcuQSMCYg26c55Bu27swjE/zaBWTnKv7H4rBd9yxrdXS3A
 Dt1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759857687; x=1760462487;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GY9baoySzSZr6T4oYF3bCPJoTe08YW4EjCGWDqwSwoI=;
 b=sCJOo5JLQFsZ1rApIPh9m5tZmv4zL9BDc3fZXQ9wBk1fz3OZYe7veUH/f60XGuyLq5
 Q/JRsTXf2Z5ZfDqe/gIgBublpgSI1zkt+t3skwGlYRr3GuSM91vKpMxPXa0ezhI4dmBn
 bGO/PkJshv8vnIca0wpJXLEIabVz90WYBLwUGDOYJGCmY263ga2K+HXJPgU12NySyoPy
 IxxmfThzxpYKm5HG5GGw4/hIXnWF2gvMH8VCvmC1mUECOM19XLVXr1OLaGXIg+JG/Va/
 u2JGDK00U78TN4zSmclH2F+IIuljgUW+PKTM4nsUyTTRCeLtGq+KqNI0tPnpjLF6AhVR
 sBjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXe0N3v/qHjEgJvq+cbAxcirwMN2ogLuAf/Si/NDO8W9Ff+LWe/9e9TGu77PHOyMNr5ydu36JQRQ9o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1WBL4ejtmNelqnhv8e4wekIabWgrBXg1n49C/0/CiRfkW4Imo
 eWNfm2fIuZkca9oG0uvQEZ6m+4GCdLLufsxOnpnFBtbCRVCGnqwci/wRZ8IDhYo0PnHdb6vUWCI
 FQPbPZ2FuJfiq3XTBX0ACiu6tQ6NBnl8=
X-Gm-Gg: ASbGncvwV4tp5btq8jQmwwfd/5LVV59nk2G3e1qKxO48KXV5GLaQUoD+m+zxQCL6R97
 C3yN9c8FVdT0DaqHIPkxoTK6LK3eFw8CxyVOZ9o8gZY1kC5xgLPGoW29sjxmRdGtEtcplLDgZoT
 0axcnH12zFmihZIa5dhKF43osUXs0qt2NKmeSGZOlk0/RT6gXWw85UAi9hUFZu5tBhiXJ2g0xZG
 IQXJ2XntrvzV/nkBfjQ7eBpeANm80Bbe0/e5/YC7dT6Bd6GMXnwroKtBq5BDLQIRewSqeBy3t2C
 iEBsOB0rYk80+n+jcriCxp8KyU2dCmjRmHMccy1dsWoQsrdhDw==
X-Google-Smtp-Source: AGHT+IGb9eTHfz3z9Yt3XqFGv9YvEYPb2KiB7MHj2b6wZb1nnL/QXub+VSTfQ0PcWpPzT36tTEahOhEzWY23RhwT1a4=
X-Received: by 2002:a17:902:fb8b:b0:266:914a:2e7a with SMTP id
 d9443c01a7336-2902743ae8fmr2411475ad.6.1759857687383; Tue, 07 Oct 2025
 10:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzYUBfz+YmifRDgdBsuTL=FpBxQVfxu23it48kGRzJNPQ@mail.gmail.com>
 <CANiq72kq5YHovH=_a9c0JQgfrAx9gRsQvVo1VfHd-FaupOp7rQ@mail.gmail.com>
 <bd004ac5-9e51-4e90-a3a4-025d74941a38@nvidia.com>
 <3771775.lGaqSPkdTl@hyperion>
 <CAHk-=wj4_zaYJ9ieazt9dnL69R+SL1PEfJtquGVOqsNCVt_rDA@mail.gmail.com>
In-Reply-To: <CAHk-=wj4_zaYJ9ieazt9dnL69R+SL1PEfJtquGVOqsNCVt_rDA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 Oct 2025 19:21:13 +0200
X-Gm-Features: AS18NWC_RH9_bRB4snwAZ0VxZRYHqiLEXEVcXDR2yH7h0c0kZfkYKI8KcUzkT5I
Message-ID: <CANiq72kDB1cX1XXX7sc3yQvnaUUYB8q1wVKNxykv8=OV-=rWuQ@mail.gmail.com>
Subject: Re: [git pull] drm for 6.18-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Maarten ter Huurne <maarten@treewalker.org>,
 John Hubbard <jhubbard@nvidia.com>, 
 Dave Airlie <airlied@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Sima Vetter <sima@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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

On Sun, Oct 5, 2025 at 11:33=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Oh, that sounds like a good heuristic, because that "comma after last
> entry" is very much "I expect this list to be expanded upon later".

We can use a trick today to approximate that, which is adding a
comment after one of the commas, e.g.

    use crate::{
        fmt,
        page::AsPageIter, //
    };

It is not the first time I do something like that -- I used an empty
comment to force visual separation between attributes in b9b701fce49a
("rust: clarify the language unstable features in use"), so there is
some precedent.

Yes, it isn't ideal, but it avoids the repetition of the prefix all
the time (many `use` statements), and we can use that temporarily as a
shorthand for "skip formatting this" (which `rustfmt` also supports
with an attribute, but takes more characters and a new line). Then, if
upstream `rustfmt` agrees, eventually we should be able to remove
those extra couple slashes and everything should "just work", i.e.
stay the same.

It seems to work fine in the nested cases (i.e. you can control it
per-level), and it allows to keep single item cases with braces too.

So I will send you a patch to unbreak the situation with some added
docs too, unless you hate it.

By the way, I also took a very quick look at the "trailing comma" idea
to see how complex it could be upstream (it could be either a "just
accept the multiline formatting if there is a trailing comma" approach
or the "take the comma as a hint to reformat accordingly" one
mentioned), and it seems doable. But we will see what they think about
it -- they don't have much bandwidth, I think.

I ran a quick test for the reformatting approach on the kernel, and
the diff isn't terribly big (e.g. +183 -45). One gets things like [1]
-- notice how the nested one (`property::`) is kept as a one liner
because there is no comma there, but the others are reformatted as
vertical on purpose. And if one adds a comma after `NArgs`, then it
will make it multiline.

If we got something like this upstream, it should be easy to
eventually migrate since the diff can be kept small by using the
workaround above meanwhile.

Cheers,
Miguel

[1]

diff --git a/samples/rust/rust_driver_platform.rs
b/samples/rust/rust_driver_platform.rs
index 6473baf4f120..90544b093c85 100644
--- a/samples/rust/rust_driver_platform.rs
+++ b/samples/rust/rust_driver_platform.rs
@@ -63,13 +63,15 @@
 //!

 use kernel::{
-    acpi, c_str,
+    acpi,
+    c_str,
     device::{
         self,
         property::{FwNodeReferenceArgs, NArgs},
         Core,
     },
-    of, platform,
+    of,
+    platform,
     prelude::*,
     str::CString,
     sync::aref::ARef,
