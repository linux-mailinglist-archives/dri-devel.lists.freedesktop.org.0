Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F5CB0CBE1
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 22:34:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9CD10E5AD;
	Mon, 21 Jul 2025 20:34:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Bi/hVZP+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E752510E5AD;
 Mon, 21 Jul 2025 20:34:01 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-553d771435fso4770134e87.3; 
 Mon, 21 Jul 2025 13:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753130040; x=1753734840; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Ul1sa4tbosUa9ruhwhtdcqNwp0uQWDOf/7Qd/o2M7Y=;
 b=Bi/hVZP+hvkiG/95aR7rPYh9q3A/hA5V8CiCOgd0/7z3OnN/yI+8cLCvri4WD0xNIm
 Qd2fQZVYDHdg1QjK5FKilEgnFfurpqpINZLIU035Dl1tDIkXsbFr5bzbw+IKGzAlNlSe
 uiUJISttFbaF3uPX4BaHn1X/EzaP/EbkJcYSXmntVKpMOQTlxvYhtd3pG4sJJnLVV+pJ
 9fKpHaXnyUi8QnDmZtQuC1PsmcL3wVetnFfktDXc2pMBDF3RkLnnKy7hzAdKpdtud/wb
 2K5IUdSzzlWWfKjszSf+BKEeTJrmufI4LdCraAlX2efTCff2squKe5W6nizKSNk/ASIx
 CZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753130040; x=1753734840;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4Ul1sa4tbosUa9ruhwhtdcqNwp0uQWDOf/7Qd/o2M7Y=;
 b=G18zPbW+cWGV+mv4ppowTHq5zjnpBcEPUEed1x8NgxcOT4Jj43+GB23bREShb80PC/
 7N/S1ELl/oEb9tk19t1bJuGt/O60Ipxd5aH0SxDU6+94UBE/o2pTpl3gGI5U8pRXRAab
 z05fUUmMxbT85CAZ4CCS+1X5o1I1o/TFApH8sxPDjN2ULqWy5UfgTIaJ3fpI7SkOxlUW
 o1qxUDoX7WQWXtIXymYggOX7dIMP7VL63uQV/10CDRmaYZVzEfILFTNDc/QiWPXv/Fqi
 ZbPT4OUm/TPXc/pplyB3l40En6lLUrG5+gQxr8pnENdGx419Gx4TTdqnXdM3+i/XhdD1
 xhsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEmm8WCC+nEF5e342OlxZREup5lZcuOjY87mKoIplGxBa8OgurE3lJsWGVYVz9dmb0Vu8noSSBsg==@lists.freedesktop.org,
 AJvYcCV4IOt1lBK6tBBnH/rBQFtHdA4UagTZUMBtnQ/MRvfilYkXeSK1l4W6l6DZI68fQDp0iC5oLvzrNBM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymK5Ju23cqMz4ST4Mn4Lf2BGIiA8huRAQddPCH4Q7RGrHeOtTw
 +lUdPl/356IOh9Aj6OxFT0uG2mCx8FQUDXZP9sL6QOeV6kpiK/nBtL8QWBomRjIgrU668z98Or6
 1eGor4KmV8SLb8/hSJ53LUZ0fNFjw+7c=
X-Gm-Gg: ASbGncsdgi61F8N/8qM1ZNfoFvo58tL3KoBabkmE5SqEu9x49jAzyonb5F7jmzTGoe8
 uiO6VBMalVlAG/dMKoKE2boXwcV6sDLbr8MMK4m9S5VcnMItHAx1njJBOuUYtXhdwVgkSgjFZzg
 2jsUspcKBDQdJTifK5E0jloKURoUydH1Hp8ZQ33CWtIQeybWF6lR7NXIvPlRhTPEY/AcQrmF5BR
 Vl7TFpA
X-Google-Smtp-Source: AGHT+IH6A989z7ThsmWhcmnfnAuNOS7u4N0waP3LiQaOQAG3vGt/H7R2XFVf4RgsPjVfbzK8xHrD35QxEhunVNnKS14=
X-Received: by 2002:a05:6512:1313:b0:54a:cc76:1676 with SMTP id
 2adb3069b0e04-55a233d987cmr6580162e87.44.1753130040075; Mon, 21 Jul 2025
 13:34:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250719-core-cstr-fanout-1-v2-0-1ab5ba189c6e@gmail.com>
 <CANiq72nxL9RORJA-w=rtnkwMKcXcLva3dGbMDLc71o1bqAHUsw@mail.gmail.com>
In-Reply-To: <CANiq72nxL9RORJA-w=rtnkwMKcXcLva3dGbMDLc71o1bqAHUsw@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 21 Jul 2025 16:33:23 -0400
X-Gm-Features: Ac12FXwowT4js33aAd4KV3lt6ZaqxKq6jdaJgK1Y7dU7h4bgb1eTladvHGZwSF0
Message-ID: <CAJ-ks9kQNDK5iNNT_wA_jrupiPepWhpqjE=cBQR61tgVP+5UZw@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] rust: use `kernel::{fmt,prelude::fmt!}`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Jens Axboe <axboe@kernel.dk>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
 Rae Moar <rmoar@google.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
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

On Mon, Jul 21, 2025 at 4:25=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sun, Jul 20, 2025 at 12:42=E2=80=AFAM Tamir Duberstein <tamird@gmail.c=
om> wrote:
> >
> > Subsystem maintainers: I would appreciate your `Acked-by`s so that this
> > can be taken through Miguel's tree (where the other series must go).
>
> Same here as in step 2b/5, i.e. Danilo's Acked-by was picked up for
> things he didn't Acked-by.

Yes, you are right.

>
> I imagine it was automatically done by `b4`, but that is why we need
> to be careful about automatically applying tags. I am mentioning this
> mainly to confirm I am not confused and to avoid forgetting about it,
> and also I hope it helps if you eventually apply patches yourself,
> e.g. if you eventually take care of a branch yourself.

You're not confused, and I appreciate you calling it out. I'll look
out for this kind of thing in the future.

Thanks Miguel.
Tamir
