Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48ABC6BBE35
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 21:57:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B10610E068;
	Wed, 15 Mar 2023 20:56:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96FE210E068
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 20:56:56 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id bk32so15121093oib.10
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 13:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678913816;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L5nQ/qpzt0oaqB3uXUI9DghvbDHZxBYtU4vb8xaNMZg=;
 b=BBJzoCdlv2m4yAlxDru7UMmXGx0atT8eNve/djKAdP6JF0Pa0fln3nteM7CtcXH7ge
 7tmEDx30QfS2rFzhb5xSSzZ8XdD/qL8u55PncGJs0N2KGgOQnvHVJkCsVGOezF8pLCQJ
 3Taol/hTDlr5vJ3tGpHQHEldYK1W+YQ8VMqUJGQsFsOyskArA+AUEVf9B3c/QXjTobM8
 EeEpn+50MYeDI1J22FNfrpHShSeHcSC/s5U8H4tMdiLTq3aPLND/BFpMCXxnMGw7Fp0O
 EwLEC+p1oY/cu+jGyZUT19Z9r0ioMWIj8XZ3YGzGixCIiLcQZyWDueLBVBbkhyh1wDiO
 9Fpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678913816;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L5nQ/qpzt0oaqB3uXUI9DghvbDHZxBYtU4vb8xaNMZg=;
 b=uo/8AFR54xvPU8e3JhhEdbNWb/1NpYCYLpfCgoveKg/ch1WwkikJcR2tIbM4NWKEkf
 mN2rvSntCwuL+UUgRQm7SL+awI1NqfR1VQ75vN6c7KiVtJjDbKtIdCZ25HIi1czWhMY9
 QAouenCZaRaRQRmv4P4yG0Si7UJE3VeQQ+XXXREl5F8BcPKHwJlLXhW9F79yd1QrhuzR
 /+F7gpWSuGzDnaVIRGJkjRONv4r6ZJKCkCzDDXEsJJYRyDXKF+1DXlZnNWRzFvM82EQG
 df61HPh/vsTkyNbss+0CfwKpbqeXZ6twBpLA1AB0sSzvzJNT9Pk46NCfkkZtlC8xJUbJ
 uTBA==
X-Gm-Message-State: AO0yUKUtgmv77Y5OPkJkJahB8/zJ/7I79KWmLTHqKE28KFhnz3TOe0e8
 9gQTfbxjXN8C4GZfjg7jHnO0eNudaXoX9c2hyeI=
X-Google-Smtp-Source: AK7set/frHFe10zRlzzkYZdrBNvEStbLGdbm1JDTXvS4gaJeZWDN0ckW8LGWeG0vDfE3Sinfoewb0jUzmpK7Fy1UPjE=
X-Received: by 2002:a05:6808:354:b0:384:23ed:1ff6 with SMTP id
 j20-20020a056808035400b0038423ed1ff6mr1201172oie.3.1678913815757; Wed, 15 Mar
 2023 13:56:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txaQfHkjs6nWcwBtnYQXtr996dyht7wasJ7QOovjepmAw@mail.gmail.com>
In-Reply-To: <CAPM=9txaQfHkjs6nWcwBtnYQXtr996dyht7wasJ7QOovjepmAw@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 15 Mar 2023 16:56:43 -0400
Message-ID: <CADnq5_PdxFdvVwVnQ2n4vXXPYKe0ZOVYBPT0Kf+6aPuQLc960g@mail.gmail.com>
Subject: Re: enhancing module info to allow grouping of firmwares
To: Dave Airlie <airlied@gmail.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Luis R. Rodriguez" <mcgrof@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-modules@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 15, 2023 at 4:35=E2=80=AFPM Dave Airlie <airlied@gmail.com> wro=
te:
>
> Hey moduly/firmware people,
>
> We are facing a problem in the future of NVIDIA providing giant
> firmwares for their devices that are version locked with unstable
> APIs. Even if they weren't version locked we'd likely have to support
> multiple major versions over time.
>
> Now this becomes a problem because when you generate multiple
> initramfs and stick them into /boot over time the number of firmwares
> MODULE_FIRMWARE will match will increase and dracut will shove them
> all into the initramfs.
>
> I think one way to mitigate that would be to provide some sort of
> grouping of module firmwares that are acceptable, and having dracut
> only pick one from the list to provide in the initramfs (hopefully the
> latest one). That way the driver can provide a list of MODULE_FIRMWARE
> lines and userspace knows they are a group.
>
> I've just little idea how we could expose this via current module
> info, happy to try and come up with an enhanced scheme maybe with a
> fallback to just include all of them but was just wanting to get some
> feedback on whether this was something that anyone has ever considered
> before now.

What about bundling the compatible FWs together into one big FW
package and tag it with some sort of common metadata header that the
driver can parse.  That would keep all cross FW compatibilities
together.  Then on the driver side, change the firmware name specified
in the kernel to match whatever is required for that kernel version.
E.g., one kernel could specify nv_fw_1_0.bin and another could specify
nv_fw_2_1.bin, etc.  It's pretty ugly and not a great user experience
if there is no backwards compat, but it should work as only the
compatible FW would be copied to the initrd.

Alex


>
> Thanks,
> Dave.
