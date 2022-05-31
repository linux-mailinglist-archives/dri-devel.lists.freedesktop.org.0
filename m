Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E901538C7C
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 10:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7FBC10F7CB;
	Tue, 31 May 2022 08:04:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3724210F7CD
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 08:04:39 +0000 (UTC)
Received: from mail-yb1-f182.google.com ([209.85.219.182]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MmUDf-1nVApw3Y93-00iRMW for <dri-devel@lists.freedesktop.org>; Tue, 31
 May 2022 10:04:38 +0200
Received: by mail-yb1-f182.google.com with SMTP id f34so9522819ybj.6
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 01:04:37 -0700 (PDT)
X-Gm-Message-State: AOAM532TNiurxYgwULhUyar57GhdVDCEtRGiR+xYqcFrmZyDkpQL6MK1
 Is0+dBf2NkdbkDo9WiP6mRWd1Gq2G+qaCJhcEjM=
X-Google-Smtp-Source: ABdhPJzullwHURqjYFLuUbj5z3ZAXSH5S2TTm7eQzxfj3C4Cw8NUJrDyWWQCTyWhoCHKYMFfEK0FxV85gP8hLdTej/I=
X-Received: by 2002:a25:69c4:0:b0:65c:ed2b:9106 with SMTP id
 e187-20020a2569c4000000b0065ced2b9106mr8172776ybc.394.1653984276242; Tue, 31
 May 2022 01:04:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a2Zg2QDS1_Ysn8-Zqqd+K7bbTFS7JV7gPabp6nvPiKaog@mail.gmail.com>
 <91E67F46-A3C7-4159-9E0C-C6C6306F3669@inria.fr>
In-Reply-To: <91E67F46-A3C7-4159-9E0C-C6C6306F3669@inria.fr>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 31 May 2022 10:04:19 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2iAsemAQdbTZ_E7GGGCXAOeWbjSjLgXEsd5sg_buZWhw@mail.gmail.com>
Message-ID: <CAK8P3a2iAsemAQdbTZ_E7GGGCXAOeWbjSjLgXEsd5sg_buZWhw@mail.gmail.com>
Subject: Re: mainline build failure due to f1e4c916f97f ("drm/edid: add EDID
 block count and size helpers")
To: Julia Lawall <Julia.Lawall@inria.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CwElvUjfMAmDvnM01sIfs8O8YcskSdYQtfn41AUjaWzYpEGJgCG
 1qASqqX2J5wSvsHyZAe6x1LM5vgFCvlsnaZBwMjXBuJtUiG2DqkQ/lQROUMoDN8mmEL5e2B
 ITiXGhKMrF++xaHoa+Mbs82Zes+tkQcNsI1qkEcsT060HBSoFQ2IO/VGSrgo1ZqghHBQDxr
 eqhA9s1nS1KywI6lYN7Jw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zMjHya5FUhg=:putIoRjEkXzqA5SBg/i4w+
 yqwHuRTNR4gLSaheSTa0625E/6zRz1QKoFUUP9trBVR4NTF9ZjW2L5HqJBIfgcoFD8H98sG7N
 HjK0ZFxuLOYqXaWej1LhcaPVMwnbLTsjo39/FHVmp2vv/luxduaVI0bPUGHSIZQWKXMxLcxlQ
 QPW8aZh2gGFsSNnR/6prDS6mgifBdytisfD1bHgrQ/jsLwJ4ILe+M3Xi4BiMbLoecfpD3NOnW
 2nSI9RRqAlq4knfqtHAIAZ/qVHDzpKYo83voJnBtKee/tCu1Xd4fGvv31rRBKTskEU/OTu0MS
 JJDQUGdvkAnc78E7P/CrQu7sOgkanwWb8x9ezcG4zMuO90I0SZeoulEHvqUu9mSD8Jqq5PomN
 v9sxHemeBZ4Wa4NoHbiHODz1WB3OF7pZkotrJbiu0V4jXEuJTGXhCromXnWwAClQQQk6ObbFB
 dO/XOssn2i5z8pLclJg1+me4RfJu55NTdymjWjCIcEPc23J24i6cqtbnHJ2UwO5uEMlVi3is2
 cd1uZ80EG9HlK6KGI4vSwQM1CljD2jLl75uVTYZ1mx8Or4ytQviK8LScnhOMcglJQa2qNmPDT
 V2/Tkxd1GsllZD7E107J4zZJ8scIP46QjDquUnhXc79kUH6d4p17Fwsx/IUg7nOH8OkljXyYI
 m9ZV5/tv18V8gNqboGebqKKFjfgm3HJwyMs/9sFEvD9IjXi/3j3Bfyza88hN8fMeaiQ6OD2kh
 GouBiDPg3tNp6hSepf/bL0VR5YFAQMcmbr4w+WWtS6ct7zEsHJ9sKev+d6sHAF5XCJWtG9qdM
 fZZjvEkFilknjwvoih04fE5N7uI8lfnIkXGvtQ4x94EVaeygB4KVa3DfknzRyfU3xdug+ZTVY
 XLxE1pfw+qbX0Q7Dbv7Q==
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, Jani Nikula <jani.nikula@intel.com>,
 Viresh Kumar <vireshk@kernel.org>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, SoC Team <soc@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 31, 2022 at 8:26 AM Julia Lawall <Julia.Lawall@inria.fr> wrote:
> > On 30 May 2022, at 15:27, Arnd Bergmann <arnd@arndb.de> wrote:
> > =EF=BB=BFOn Mon, May 30, 2022 at 4:08 PM Jani Nikula <jani.nikula@intel=
.com> wrote:
> >>> On Mon, 30 May 2022, Arnd Bergmann <arnd@arndb.de> wrote:
> >>> struct my_driver_priv {
> >>>       struct device dev;
> >>>       u8 causes_misalignment;
> >>>       spinlock_t lock;
> >>>       atomic_t counter;
> >>> } __packed; /* this annotation is harmful because it breaks the atomi=
cs */
> >>
> >> I wonder if this is something that could be caught with coccinelle. Or
> >> sparse. Are there any cases where this combo is necessary? (I can't
> >> think of any, but it's a low bar. ;)
> >>
...
> >>> or if the annotation does not change the layout like
> >>>
> >>> struct my_dma_descriptor {
> >>>     __le64 address;
> >>>     __le64 length;
> >>> } __packed; /* does not change layout but makes access slow on some
> >>> architectures */
> >>
> >> Why is this the case, though? I'd imagine the compiler could figure th=
is
> >> out.
> >
> > When you annotate the entire structure as __packed without an
> > extra __aligned() annotation, the compiler has to assume that the
> > structure itself is unaligned as well. On many of the older architectur=
es,
> > this will result in accessing the values one byte at a time. Marking
> > the structure as "__packed __aligned(8)" instead would be harmless.
> >
> > When I have a structure with a few misaligned members, I generally
> > prefer to only annotate the members that are not naturally aligned,
> > but this approach is not very common.
>
> Searching for specific types in a packed structure would be easy.

As an experiment: what kind of results would we get when looking
for packed structures and unions that contain any of these:

- spinlock_t
- atomic_t
- dma_addr_t
- phys_addr_t
- size_t
- any pointer
- any enum
- struct mutex
- struct device

This is just a list of common data types that are used in a lot of
structures but that one should never find in hardware specific
types. If the output from coccinelle is 90% actual bugs, this would
be really helpful. OTOH if there is no output at all, or all
false-positives, we don't need to look for additional types.

> Coccinelle could duplicate the structure without the packed and see if
> any offsets change, using build bug on, but that would be architecture
> specific so maybe not useful.

I would consider this a separate issue. The first one above is for identify=
ing
structures that are marked as packed but should not be packed at
all, regardless of whether that changes the layout.

       Arnd
