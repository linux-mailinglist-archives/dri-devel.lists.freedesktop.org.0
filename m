Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE5855BE92
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 08:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65AC0113D2F;
	Tue, 28 Jun 2022 06:03:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BA7F11B47B
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 19:53:47 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id e63so10057274pgc.5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 12:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=networkplumber-org.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k/l4LcE4w+6LYrCo6/Ek+44r04gbnpHm9yyPA0qKR6A=;
 b=ryYp2naL1201DMNfPmSbpexCs+zqiLsBQDBXHc9esFHxBJ8Ep2LLrsgHtxJtosu2+J
 1iBYfvQQXv6NYwKQ2qXQCc4mHXYQGPYeeUC3hu2OgPUPjZXH+3Hi6Zqo5SyTeGerBVQA
 p1Bh5daOuP6Q9UMRPxlj6vxZpUjBpxOPEYhjttl3pP6gtksJnO1wA5G3ERXmm3iOhFrs
 MlyYmEaZt8I/cdZ0xlE1RQA9V/oE3k4e+iV7r8nrUlXmSvlRImOQktUmXD254MFh7ceV
 2zbWTxt+/QD0MTYLBrv8xqePAliI2A59OkEqXOPrksIatTeOcW53aiRz+65e7KopsoX+
 3osw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k/l4LcE4w+6LYrCo6/Ek+44r04gbnpHm9yyPA0qKR6A=;
 b=rBGqHipy+s3HcgtEjuLBajQfcQYJC+k3mWGJZIibF0M6TvZQ4sxJTLct8rLmdvEhSS
 rCYvgTJGZullrBzeVE82qAotqbpVz2rRdSLYFsdK9ybE3JInqLBY7Kv05x6PlJBCS69b
 DRtG7zf+hbVjEwoyW5vD6CGvJDnUAL1kNjdX7Ot+xiRkJBD//n7fP1CECgM1I+SS7SsS
 utM129F/WiVGrSoBkb5/uDl88OY1hzkOUjGguslXOhOnOmZsYJySYF/iD/IqNklBPsWu
 tQEn8LemYtrV7S3mOiIaieEQ4yeheJFTj3fQcZ/YA0+eAltUI/txyC2LqN8jOWsLuVfU
 Diyg==
X-Gm-Message-State: AJIora9jC7QrdNUkHpzXmLQUWAXyi4vDeqkLDTAoQExhPvljZzq+v3Ye
 PfBIfNAAV4mYqoqJKXrkxP4HPQ==
X-Google-Smtp-Source: AGRyM1ssDeW6Ux1oaY9ixgaaapzXMFszbxcRVeOWaHAYiiaVMZ4HUYtPzqxXzR6I8+fqeJNf8u9hpg==
X-Received: by 2002:a63:7a5d:0:b0:40c:fcbe:4799 with SMTP id
 j29-20020a637a5d000000b0040cfcbe4799mr14428539pgn.297.1656359626928; 
 Mon, 27 Jun 2022 12:53:46 -0700 (PDT)
Received: from hermes.local (204-195-112-199.wavecable.com. [204.195.112.199])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a056a00009000b0051c1b445094sm7821510pfj.7.2022.06.27.12.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 12:53:46 -0700 (PDT)
Date: Mon, 27 Jun 2022 12:53:43 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH][next] treewide: uapi: Replace zero-length arrays with
 flexible-array members
Message-ID: <20220627125343.44e24c41@hermes.local>
In-Reply-To: <20220627180432.GA136081@embeddedor>
References: <20220627180432.GA136081@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 28 Jun 2022 06:03:27 +0000
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
Cc: nvdimm@lists.linux.dev, alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dm-devel@redhat.com, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net,
 linux-stm32@st-md-mailman.stormreply.com, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org, x86@kernel.org,
 kasan-dev@googlegroups.com, lvs-devel@vger.kernel.org, coreteam@netfilter.org,
 v9fs-developer@lists.sourceforge.net, Kees Cook <keescook@chromium.org>,
 intel-gfx@lists.freedesktop.org, linux-can@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 virtualization@lists.linux-foundation.org, io-uring@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-sctp@vger.kernel.org, netfilter-devel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 27 Jun 2022 20:04:32 +0200
"Gustavo A. R. Silva" <gustavoars@kernel.org> wrote:

> There is a regular need in the kernel to provide a way to declare
> having a dynamically sized set of trailing elements in a structure.
> Kernel code should always use =E2=80=9Cflexible array members=E2=80=9D[1]=
 for these
> cases. The older style of one-element or zero-length arrays should
> no longer be used[2].
>=20
> This code was transformed with the help of Coccinelle:
> (linux-5.19-rc2$ spatch --jobs $(getconf _NPROCESSORS_ONLN) --sp-file scr=
ipt.cocci --include-headers --dir . > output.patch)
>=20
> @@
> identifier S, member, array;
> type T1, T2;
> @@
>=20
> struct S {
>   ...
>   T1 member;
>   T2 array[
> - 0
>   ];
> };
>=20
> -fstrict-flex-arrays=3D3 is coming and we need to land these changes
> to prevent issues like these in the short future:
>=20
> ../fs/minix/dir.c:337:3: warning: 'strcpy' will always overflow; destinat=
ion buffer has size 0,
> but the source string has length 2 (including NUL byte) [-Wfortify-source]
> 		strcpy(de3->name, ".");
> 		^
>=20
> Since these are all [0] to [] changes, the risk to UAPI is nearly zero. If
> this breaks anything, we can use a union with a new member name.
>=20
> [1] https://en.wikipedia.org/wiki/Flexible_array_member
> [2] https://www.kernel.org/doc/html/v5.16/process/deprecated.html#zero-le=
ngth-and-one-element-arrays
>=20
> Link: https://github.com/KSPP/linux/issues/78
> Build-tested-by: https://lore.kernel.org/lkml/62b675ec.wKX6AOZ6cbE71vtF%2=
5lkp@intel.com/
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks this fixes warning with gcc-12 in iproute2.
In function =E2=80=98xfrm_algo_parse=E2=80=99,
    inlined from =E2=80=98xfrm_state_modify.constprop=E2=80=99 at xfrm_stat=
e.c:573:5:
xfrm_state.c:162:32: warning: writing 1 byte into a region of size 0 [-Wstr=
ingop-overflow=3D]
  162 |                         buf[j] =3D val;
      |                         ~~~~~~~^~~~~
