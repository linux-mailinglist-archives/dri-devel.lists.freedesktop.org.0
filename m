Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69677783D1A
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 11:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B309D10E1C6;
	Tue, 22 Aug 2023 09:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A1AA10E030
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 02:18:41 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-51a52a7d859so10403263a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 19:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692670719; x=1693275519;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HJXlFOteHKVLHeYr+snSmPCLP+Kkg8KkznNpC4Ohn2U=;
 b=oyUKrebEodO8eBe4eCBxrUam8TTXfzWLUqr66grKvJs9PiENIqlWPsskUJe4z1lPJ6
 mOFcED65FYHXQBDOWPofmMxVwVz1fqIf2qVTqBlQqeGuJ5wIIW/FK+0vHbN+MEHFgh+n
 eKV9M/auehk+ks1yMzfz4OPj3r8tDMkruzCGkAru7f6EJBcNYBNAVILDqWoL6Y2xXHKX
 e1BCgNwk4l2o5DjpmaAH7oKVvuDtpUFAy8MgzQMCgSFAhClSxYW4C/M/1QDJighZJxEf
 gtESioQKo9ZmBNUu600/Zj71S8AQTjVATYNWJdNX2L8rYYdPf5qWGiB8CjQvOT58mzh1
 kfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692670719; x=1693275519;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HJXlFOteHKVLHeYr+snSmPCLP+Kkg8KkznNpC4Ohn2U=;
 b=Qk1CR6QqlZW+WZ1M/7yBF/BWca1pfmYXO/u1CcC4ibGVJxpiHsX3cImFlrNVY5Fz7Y
 sJlEHVjSYUbUoUnNBY6qqhdrrq/PyIc7mM2PzP2IsZ+Enjn1XeFCtlMUZaiBjMXoxqpu
 gMIdEYxJRt6h1Ka61d3keRtcyK617ZlIEZjMIgB4dhONMRXXYTnTOhwMS5nbxgIMvSvb
 i7zF8SL2rCXhHcF6m7sM/oi5sAZBNHBD3dU4EqOIFihAhPbWxQHe6vKXWzBnRH3CsGZR
 +4ykt6iiopjKp+a2vSqjq09XU7CRKHfnCaGilR5pSucqk+/6A3xFEmR/zfnL21eVnHkG
 71hQ==
X-Gm-Message-State: AOJu0YzclzbBSJJQVeixEqLqDSSLwUzZrq/I1PN8vdkyVBNfJL/mOTP2
 2xLCK/W7EfYHzWpg16AD5zGjvja/dD8AEUtdUzmjV4j0C7Edow==
X-Google-Smtp-Source: AGHT+IFNkRjoVyAheSXa8tJIeWpkCBCCqwGPsvgGJf4WYdFivvJtkgK/J6KHVOYP+1GwpwtquHU31CzzdIB+p4tKbCQ=
X-Received: by 2002:aa7:d058:0:b0:522:18b6:c01f with SMTP id
 n24-20020aa7d058000000b0052218b6c01fmr9447384edo.3.1692670719483; Mon, 21 Aug
 2023 19:18:39 -0700 (PDT)
MIME-Version: 1.0
References: <CADXzsigVPkgkx4vmaKnhGuMdjt_3w0Fo3eFqDNSwyoH9JCrRQw@mail.gmail.com>
 <46e286cb-ca1a-4b5a-153f-0e0cade22bb9@metux.net>
In-Reply-To: <46e286cb-ca1a-4b5a-153f-0e0cade22bb9@metux.net>
From: Raj J Putari <jmaharaj2013@gmail.com>
Date: Mon, 21 Aug 2023 19:18:28 -0700
Message-ID: <CADXzsihPteW5_gjg94AVd=Fa1fgAsdAR7rvz+4VK_fZMHUtjfw@mail.gmail.com>
Subject: Re: using gpu's to accelerate the linux kernel
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 22 Aug 2023 09:41:06 +0000
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
Cc: LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

nice read!

i was thinking of a kernel module that does stuff like offload some
work to the gpu.. like we can have like gpuaccel.ko that does stuff
like wrap gpu calls to stuff like compiles or low level stuff like
heavy computes, just looked up a few apis and it looks like opencl and
cuda are meant for 3d computation, so some way to access the gpus
compute internals would take some hacking, not sure if its possible

it would be awesome if we can offload some compilation from stuff like
cc and c++ to the gpu, if the technology is available (maybe with
amd?)


On Mon, Aug 21, 2023 at 7:21=E2=80=AFAM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:
>
> On 27.04.23 12:51, Raj J Putari wrote:
>
> > id write it but im an amatuer and i dont have time to read the kernel
> > source and experiment, we're talking about nvidia and amd video cards
> > assisting in processing heavy data.
>
> obviously not w/ NVidia (except for some old, already reverse-engineered
> gpus), since Nvidia is doing all they can hiding the necessary specs
> to write drivers from us.
>
> Forget about Nvidia. Never ever waste a single penny on that.
>
> > lets say youre compiling a kernel, you can write optimizations into
> > the kernel through a cuda module and offload cpu data directly to the
> > gpu using opencl or cuda or what amd supplies,
>
> cuda, opencl, etc, are *userland* *library* APIs. They don't work inside
> the kernel. One had to write something similar *inside* the kernel
> (which is working very differently from userland). Also consider that
> the most complex stuff (eg. creating command streams) is done in
> userland (eg. mesa's pipe drivers, ...), the kernel is just responsible
> for some more lowlevel things like buffer management, modesetting, etc.
>
>
> If you wanna go that route, you'd have to create something like Mesa's
> Gallium inside the kernel. Besides that this is a pretty huge task
> (and you'd have to reimplement lots of drivers), you'd also have to
> find a way to get a good performance when calling from userland (note
> that syscalls, even ioctls, etc, are much more expensive than just
> plain library function calls inside the same process). Probably comes
> down to using some bytecode (tgsi ?) and loading it somewhat similar
> to bpf.
>
>
> Assuming that's really up and running one day, it indeed could solve
> other problems, eg. clear separation between containers and hosts
> (for now, containers still needs the userland parts of gpu drivers
> for the corresponding host hardware).
>
> But be warned: this is a huge endavour, *a lot* work to do and hard
> to get it right.
>
>
> OTOH, I'm yet sceptical whether there's much practical use cases for
> using GPUs by the kernel *itself*. What exactly do you have in mind
> here ?
>
>
> --mtx
>
> --
> ---
> Hinweis: unverschl=C3=BCsselte E-Mails k=C3=B6nnen leicht abgeh=C3=B6rt u=
nd manipuliert
> werden ! F=C3=BCr eine vertrauliche Kommunikation senden Sie bitte ihren
> GPG/PGP-Schl=C3=BCssel zu.
> ---
> Enrico Weigelt, metux IT consult
> Free software and Linux embedded engineering
> info@metux.net -- +49-151-27565287
