Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECBD537ABC
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 14:44:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C134D10E7B0;
	Mon, 30 May 2022 12:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC48D10E7E9
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 12:44:05 +0000 (UTC)
Received: from mail-yb1-f178.google.com ([209.85.219.178]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MzQbw-1nZZYZ2o8e-00vLfH for <dri-devel@lists.freedesktop.org>; Mon, 30 May
 2022 14:44:03 +0200
Received: by mail-yb1-f178.google.com with SMTP id z7so18833617ybf.7
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 05:44:03 -0700 (PDT)
X-Gm-Message-State: AOAM531Y2+FOAcSCJMnTj7H7Mv+lnO7n4U+NbxUGM3rrRsFD80qytogm
 eVyzUqk7t1qq4SjYENgXvXh6kdDpJZZojL7eK3E=
X-Google-Smtp-Source: ABdhPJwGhDH7TTQEFtfKClpkV8v6MgE6/PlkkdchHiAR2sctlXWrlvyx8XgWbwbNazMHWQ8TgK10FAziIIsvzr+V4hc=
X-Received: by 2002:a25:9b89:0:b0:655:8454:dc92 with SMTP id
 v9-20020a259b89000000b006558454dc92mr25317431ybo.550.1653914642134; Mon, 30
 May 2022 05:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <YpCUzStDnSgQLNFN@debian>
 <CAHk-=wg0uGAX5DYZq+tY2KeUAR8DtR91YE1y9CkPMKkKOyE4jg@mail.gmail.com>
 <CADVatmNGPbSdRNQuwJEWAaPtqb3vBYRjvsuBpoRUnhEHj=X5GQ@mail.gmail.com>
 <CAHk-=wisQd8yiPX=SsK3eFiakKo713hq4SyqPWsJ-oyAmLFefQ@mail.gmail.com>
 <YpIR67FMtTGCwARZ@debian>
 <CAHk-=wjuyHE=1wLgHncub8FfgeyYqfWYsy4-YrhAvq9991h_Aw@mail.gmail.com>
 <CAHk-=wi_hJV0V=Ecg2dzbe2P_H1XKTu6VP_AtCH6u=tis31ayg@mail.gmail.com>
 <CAK8P3a0-QyOQiieEvM0yQb43XbCtPmeao8UvoAsdFnjCxYPz7Q@mail.gmail.com>
 <CAHk-=whfmwzjF4eBPYS6pHFqHVzJF3m=2h=gRWSRyHks8V=ABA@mail.gmail.com>
 <87a6aztli2.fsf@intel.com> <877d63tleq.fsf@intel.com>
In-Reply-To: <877d63tleq.fsf@intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 30 May 2022 14:43:45 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0-S77QLR1dK3NT6ot7JTAD5AdojAZJr-Xi112-v5EOdw@mail.gmail.com>
Message-ID: <CAK8P3a0-S77QLR1dK3NT6ot7JTAD5AdojAZJr-Xi112-v5EOdw@mail.gmail.com>
Subject: Re: mainline build failure due to f1e4c916f97f ("drm/edid: add EDID
 block count and size helpers")
To: Jani Nikula <jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:dbm1jwWR0vMt51BkvrxM+RGeyHvCVqSbWQmdmLb2+S//nppShuV
 KY/cmIRkDdk5q+9mkFtMIg1unusM9CeWWO8ODAdlb5k8RXcaFIUORyqCqhik4c/7Z7lI7Gz
 dz2npp4HDLtIXGy+gf6zIPJSBz6pQ8hozrMuTIG/r8Q40nnXIH9+UzSRbxL7hrqzWudnVs9
 hJt9BCUmRzoxfd1ILzf7Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:DpppLXUazQo=:D0hmTP+WM1loH12WTYB+Gv
 Q2FQE1P1rPGRf6ckBCCYB4T0r15ddKvSnD4rOK/K8CZ5EVVY9LsgKyH9Ng7S9cJ3WGDTy2asp
 8Bw9k40srCpSope+ossokIm6d0RtDfoiWdRYyrHADR8d2NmOgw7rPF26h1JnMhzsF6XkuO0iO
 12co4ldcKSm4A5ScMjAAzX5R8k2yu6Zk4bYjVi7znl0mxVPtIQtkqtWElGIwWcI7/ub5keStM
 NsE4ul7qF7FFyxiiWKRWNtRNhpodaN53PKFu8qRmTu+h7elnCocI8yVWwhBkk1v748PQGhfUw
 rex7LkF4K3SCfQbfryJ/KwRkxRLv6V/f/ks8tffqQVU5jjGSRWfOQxnS/eq7WB9FIndVDDz57
 Tl5/9PQxBP0PzwjqP+DQ3AtVdXwJ9kNeB58K9Mp9rPWbvi3Xvi8aUAGT+5pouTijZMKnwVaTT
 AahHR3wlrmtsfDXNH5Ghu9MbyuImR9WxeIQi5xDaZQSvKQJr2f+KaMD2cZUZHVDjpIkuzWdCr
 DG7wr91vG3gq0Gv+PFCHulUrSPwtmkqVVP+8+vNPSHc4zHn93/u7tGVhy4rw2gVeWwjObGMuG
 T4eDhN43S4SymiCYbT11/b1mPiyz8APFy2oM/bR9wINWCW05JIsKuy5tH9CNhUfq5tUMrSXfA
 uHPjT1dErn2uw8ukDYrusNzznut4kEQ//Vl+ph0oG9jYY7NEdQYNyOCtj2hj+yKw+fcIu/wEm
 nHPd1qwbb7oAaMZ+dCmaGitU0tAUZeW/InWbUig9UOwXHhEkluTuN1sb6bGF8y9YQowH+nOcA
 Pkk+DCCl/hGO4RCDYgyHD6taTKf+w3n51DAVEuasbaXOd1S6AWj0WL2yKx+fbxgOLmMLNDCku
 uEcnYW+6YW9Bv38JQqPg==
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
 Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Viresh Kumar <vireshk@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 30, 2022 at 11:33 AM Jani Nikula <jani.nikula@intel.com> wrote:
>
> That is, for EDID. Makes you wonder about all the other packed structs
> with enum members across the kernel.

It is not the 'enum' that is special here, it's the 'union' having
unpacked members,
and the same thing happens when you have nested structs: both the inner
and the outer aggregate need to be packed, either with __packed at the
end, or on each individual member that is not fully aligned to
max(sizeof(member), 4)).

I think in general, most __packed annotations we have in the kernel are
completely pointless because they do not change the structure layout on
any architecture but instead just make member access slower on
architectures that lack unaligned load/store instructions. There have
definitely been other cases though where a __packed annotation is
not needed on any sane architecture but is needed for OABI ARM.

Overall I'm not that worried because the only machines running OABI
kernels would be on really old hardware that runs a limited set of
driver code.

A completely different matter are the extraneous __packed annotations
that lead to possible problems when accessed through a misaligned
pointer. We ignore -Waddress-of-packed-member and -Wcast-align
in the kernel, so these never get caught at build time, but we have
seen bugs from gcc making incorrect assumptions about alignment
even on architectures that have unaligned load/store instructions.

      Arnd
