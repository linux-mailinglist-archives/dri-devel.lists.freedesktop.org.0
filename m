Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 968519302DE
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jul 2024 02:48:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E310C10E1A6;
	Sat, 13 Jul 2024 00:48:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="P6v5tL4f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE2C10E1A6
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jul 2024 00:48:49 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-58b0beaf703so3155526a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 17:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720831728; x=1721436528; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6HsKtFDDgviwQH1b4AdwR89R/oIpdTxW9lu5rBhyzP8=;
 b=P6v5tL4fc+F//CzxHPJs0wCJrHXY1rjVD7c29Tdx09x5QJL1dLQ46NpcUM88z0Xpey
 mrmdeMYLyCAiO10VbAF+DYv/YlSYAXwZ9saED9rqAz+jl7Jmz62ZLWZUmR1W3Lb/KkeY
 LQCFinERcy5uuEf5GyvA37Hxg4n4U7wRuCSp86jtcdbwtz0k7GMavAYRbUYG8HiCPKeE
 kmfl5z+B0HXvNQzDWYnzG0Oue+eN/rDEH1dCc6jS40RzMvialD+dOw8lobW2ejn969/x
 bwl0W+OwlmXHVLA9eEQVzJOzvLvKWUsDllqv0MTw/W5Sdy4zMDDWOjsOO6Cdy3Jm0Nd1
 7K0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720831728; x=1721436528;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6HsKtFDDgviwQH1b4AdwR89R/oIpdTxW9lu5rBhyzP8=;
 b=c0KqFzivRH+OPUYmQi6OF74PnWalFXEIzFBpvNFlXN82fP8cSgYPi9G/TFZi97kif6
 wUrJvhMObqH1dCgyvP3ok3buX0aPTzQCWlZJZndj+LjoA210xnm6QKdLkQAhBUkZ0CJf
 K62aDs02DJ6gBV1JnEo+mvpHasJpJd5Wh62zkCvoT7cZdOQi8vpCrv7jfTTqcZ1eQPi0
 HHh5rjzwKZlcBSOUbbXDdZdwuKAkvR225lo/JO5jWAJM7Le3mgEloHf3kJkfkglZuVdK
 dH4v8arzHVd4HYiFjBVnTkd1HTViLfWOkY/7to/VTsJlFoo/wmTCTOXjaDqmu8MsizAF
 Ab7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFgsA3SAM5vjpc43/FDyEtDTRD7PDZ8mri/TI4xAW5QVaCOO2iV5iqaQw/Hc3JoyHrX1hQ7G3+31HDd9l/4Klrpc8meA6EuaqA2aWDwBKY
X-Gm-Message-State: AOJu0YxKrX44xTs5zPSaqXh1f6v6cDs+5dSXLNOLAohKB3sbs8pkwkfn
 KGjJSeuIrip2ci2kR0Ok5Uu0Hue9l6rHjj9akxUDjv9vuFERm6lecsRtSOrtEdRSRWpg1zHjfmx
 /ZbFzuB0LD2/vyNxA80yGZd26lqz3dbr5
X-Google-Smtp-Source: AGHT+IFeeJ3/yWZLz9nMde/4bWSuZg18FBSHV/qNjaFCrj/uBC8/sAe66xVQO4ioF4q/Ni373euOM4ug9j90dYFf/so=
X-Received: by 2002:a17:906:195a:b0:a77:e48d:bc9 with SMTP id
 a640c23a62f3a-a780b68a472mr741456766b.16.1720831727888; Fri, 12 Jul 2024
 17:48:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240710225011.275153-1-daniel.almeida@collabora.com>
 <fe84a028-01a8-4987-b1b7-141fb76d263c@arm.com>
 <4344B22F-D859-4C64-A351-69FFB5208362@collabora.com>
 <ZpFDeajsuVONbSYJ@cassiopeiae>
 <0A0C1EFC-29A1-4D73-8B02-CC1C693D6A7A@collabora.com>
 <ZpFMmAEdqo1dhj0s@cassiopeiae>
In-Reply-To: <ZpFMmAEdqo1dhj0s@cassiopeiae>
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 13 Jul 2024 10:48:36 +1000
Message-ID: <CAPM=9twNU3Wm02zCqzipSt4mDU3UUF5AyVycpBkPTGqv7fwPAQ@mail.gmail.com>
Subject: Re: [RFC PATCH] drm: panthor: add dev_coredumpv support
To: Danilo Krummrich <dakr@redhat.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 Steven Price <steven.price@arm.com>, 
 Wedson Almeida Filho <wedsonaf@gmail.com>, ojeda@kernel.org, lyude@redhat.com,
 robh@kernel.org, 
 lina@asahilina.net, mcanal@igalia.com, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Sat, 13 Jul 2024 at 01:32, Danilo Krummrich <dakr@redhat.com> wrote:
>
> On Fri, Jul 12, 2024 at 12:13:15PM -0300, Daniel Almeida wrote:
> >
> >
> > > On 12 Jul 2024, at 11:53, Danilo Krummrich <dakr@redhat.com> wrote:
> > >
> > > You could also just define those structures in a C header directly an=
d use it
> > > from Rust, can't you?
> > >
> >
> >
> > Sure, I am open to any approach here. Although this looks a bit reverse=
d to me.
> >
> > i.e.: why should I declare these structs in a separate language and fil=
e, and then use them in Rust through bindgen? Sounds clunky.
>
> The kernel exposes the uAPI as C header files. You just choose to do the
> implementation in the kernel in Rust.
>
> Hence, I'd argue that the uAPI header is the actual source. So, we should
> generate stuff from those headers and not the other way around I think.
>
> >
> > Right now, they are declared right next to where they are used in the c=
ode, i.e.: in the same Rust file. And so long as they=E2=80=99re #[repr(C)]=
 we know that an equivalent C version can generated by cbindgen.
> >
>
> I'm not sure whether it's a good idea to generate uAPI header files in ge=
neral.
>
> How do we ensure that the generated header file are useful for userspace =
in
> terms of readability and documentation?
>
> How do we (easily) verify that changes in the Rust code don't break the u=
API by
> due to leading to changes in the generated header files?
>
> Do we have guarantees that future releases of cbindgen can't break anythi=
ng?

I think I'm on the uapi should remain in C for now, we define uapi
types with the kernel types and we have downstream tools to scan and
parse them to deal with alignments and padding (I know FEX relies on
it), so I think we should be bindgen from uapi headers into rust for
now. There might be a future where this changes, but that isn't now
and I definitely don't want to mix C and rust uapi in one driver.

Dave.
