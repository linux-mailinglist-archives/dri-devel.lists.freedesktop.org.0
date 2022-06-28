Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 020CF55BF13
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 09:27:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 171E611B79E;
	Tue, 28 Jun 2022 07:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4761211B79E;
 Tue, 28 Jun 2022 07:27:36 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id z1so1521710qvp.9;
 Tue, 28 Jun 2022 00:27:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hwgLtruPC06mcRCnQAsf+kJqHCP1mf00hTNnpiQ34M0=;
 b=bwYmCXWNDzg5YGwddJpSSLZhzRrIPHw2dxjBgbJa3ISoqv71aFG4NbyDtTseR3VjlU
 LmneAKNTv5l3JWqEQzfiOw/E3gt6dNbLUAfSfft+qCEHmVM6mPrl7d9chAkL2ggtSYS3
 3u2/2cv8215sk5h8vL5G/2DlbNd4o1gzGUHY5Edy+FczLUIuLOuOyiYQEIl92UN7fgHS
 cm8CzPOB/be3RzsKozQcYHmgsIYghmeLszM4PjXAotthTqbgMQPhnzZZjxb8NlilfiRy
 Zfdddf5IOKav4jv+9H4gq5vgCFprT4jsr6ZrlXzjcv6ecdH8JOU4mJkwtJHyz994BW+l
 dRCQ==
X-Gm-Message-State: AJIora/0H6h0dDuZuhp7kUxSl1hXq4ix0IfMZOyMsfOHrmwNO6Tc+hnd
 N2RRdSMXJyn7va6Un5JKi5PFVFrEqrvRtFBv
X-Google-Smtp-Source: AGRyM1uf7/rTjmSjxFObE1njFiykhwx1rX4PjacGrDStsYTrMhIWPG78wAdbcXJK0HEB/cAJiN2ljw==
X-Received: by 2002:a05:6214:ca7:b0:470:47dd:f449 with SMTP id
 s7-20020a0562140ca700b0047047ddf449mr2459235qvs.112.1656401255157; 
 Tue, 28 Jun 2022 00:27:35 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com.
 [209.85.128.182]) by smtp.gmail.com with ESMTPSA id
 bi13-20020a05620a318d00b006a6c552736asm10211778qkb.119.2022.06.28.00.27.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jun 2022 00:27:34 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-3178acf2a92so107587867b3.6; 
 Tue, 28 Jun 2022 00:27:33 -0700 (PDT)
X-Received: by 2002:a81:a092:0:b0:318:5c89:a935 with SMTP id
 x140-20020a81a092000000b003185c89a935mr20762801ywg.383.1656401253054; Tue, 28
 Jun 2022 00:27:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220627180432.GA136081@embeddedor>
In-Reply-To: <20220627180432.GA136081@embeddedor>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Jun 2022 09:27:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU27TG_rpd=WTRPRcY22A4j4aN-6d_8OmK2aNpX06G3ig@mail.gmail.com>
Message-ID: <CAMuHMdU27TG_rpd=WTRPRcY22A4j4aN-6d_8OmK2aNpX06G3ig@mail.gmail.com>
Subject: Re: [PATCH][next] treewide: uapi: Replace zero-length arrays with
 flexible-array members
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
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
Cc: nvdimm@lists.linux.dev,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 KVM list <kvm@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dm-devel@redhat.com,
 target-devel <target-devel@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 linux-hardening@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-s390 <linux-s390@vger.kernel.org>, scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>, lvs-devel@vger.kernel.org,
 coreteam@netfilter.org, V9FS Developers <v9fs-developer@lists.sourceforge.net>,
 Kees Cook <keescook@chromium.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-can@vger.kernel.org, linux-raid@vger.kernel.org,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 virtualization@lists.linux-foundation.org, io-uring@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 netdev <netdev@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>,
 Linux MMC List <linux-mmc@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-perf-users@vger.kernel.org, linux-sctp@vger.kernel.org,
 NetFilter <netfilter-devel@vger.kernel.org>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
 linux-btrfs <linux-btrfs@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Gustavo,

Thanks for your patch!

On Mon, Jun 27, 2022 at 8:04 PM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
> There is a regular need in the kernel to provide a way to declare
> having a dynamically sized set of trailing elements in a structure.
> Kernel code should always use =E2=80=9Cflexible array members=E2=80=9D[1]=
 for these
> cases. The older style of one-element or zero-length arrays should
> no longer be used[2].

These rules apply to the kernel, but uapi is not considered part of the
kernel, so different rules apply.  Uapi header files should work with
whatever compiler that can be used for compiling userspace.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
