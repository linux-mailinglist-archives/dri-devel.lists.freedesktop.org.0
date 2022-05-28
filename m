Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1943536E83
	for <lists+dri-devel@lfdr.de>; Sat, 28 May 2022 23:09:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5975E10E4D2;
	Sat, 28 May 2022 21:09:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E165510E4D2
 for <dri-devel@lists.freedesktop.org>; Sat, 28 May 2022 21:09:14 +0000 (UTC)
Received: from mail-yb1-f176.google.com ([209.85.219.176]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MSbt9-1oO1aL1YG9-00SxkT for <dri-devel@lists.freedesktop.org>; Sat, 28
 May 2022 23:09:12 +0200
Received: by mail-yb1-f176.google.com with SMTP id e184so3802525ybf.8
 for <dri-devel@lists.freedesktop.org>; Sat, 28 May 2022 14:09:11 -0700 (PDT)
X-Gm-Message-State: AOAM530MrLF8+zBzwmPcC6hEDW1KxbeR6xP7kSjyIFmIYUagy0JNR6cP
 IrDdgtlJfOdRP/TeNk1gS9NDN5HsATE2nYrW0+8=
X-Google-Smtp-Source: ABdhPJzYWcxVMSVO35SjnuTA/wM3uXbL0KS/JIGSkpi4QT9U3HrCaqV40mr9DwdV/Jk6nh6hQeh9t/VVFkm1NyZMo88=
X-Received: by 2002:a25:db8a:0:b0:65c:b04a:f612 with SMTP id
 g132-20020a25db8a000000b0065cb04af612mr2641390ybf.106.1653772150854; Sat, 28
 May 2022 14:09:10 -0700 (PDT)
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
In-Reply-To: <CAHk-=whfmwzjF4eBPYS6pHFqHVzJF3m=2h=gRWSRyHks8V=ABA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 28 May 2022 23:08:54 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2DRBrDmfhz2GbMOqNBufNKS7K7XyeE1Px3AhqAuSZD4A@mail.gmail.com>
Message-ID: <CAK8P3a2DRBrDmfhz2GbMOqNBufNKS7K7XyeE1Px3AhqAuSZD4A@mail.gmail.com>
Subject: Re: mainline build failure due to f1e4c916f97f ("drm/edid: add EDID
 block count and size helpers")
To: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:o+4k+sXjNEza9U2RaxLVO+qJ9t4iQv3piaS3T2zgL7Km3KD3ui4
 7QDMfh6bOWGeF9kztoTZAtKhcmeD31HJN8Ihdab0+EticNjJXSawyDfBheeFWItlxBLdQjR
 ORFqyNToSGdPA0EBAUYUoE+cQuFxuJgoxqotRRrFTs/AFH4Y/Hi83grFjuv3MJdhNjlXT7D
 /ghFLDXJYTa681PxZpnHQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:FgaQvhOvNXk=:M09zHRhjwQfwy/lz9D7Z8h
 /aQh2rNt4JYT5M4n4Y9VljWtxghgQZX0DH/DpaSeWEREr4oID1a7G1gTZ500o0IpADQgTPUmJ
 ksZwAfKetPCtC2uWy8uG9PHu23BA2IQrdBd8lU1/oT4gyPJv2QzSHfzwefJ9ilXIRzm3Hh1Ub
 l5D//AGTt6fdr7ZaaxNB9Le2M3dLPWWFhLIhZ6ar11AwXqeybYhstmYHxuvsHiEuSvenjVGx0
 F33mvNzRCp494eJWFBcG0nY4zXi4Te+o8BIbCE3aMRblmexTck9NYRyo+xS4d7/xYys66sYdL
 CpXPz1bynwFZGD85LrhEzZBDOLvGVdnNgDCWLWkb3BvSF/iWOZ6jlQsqsDPSoR+mMpM2nUFe2
 wsy46IZ5AfPK/ar+xycl9H3Zxor6+D3PG08ubzszURrw//S6zSW3l4PgE0rGsizBDSi6Z/hpg
 oOhLnOBXUEeaU8fz9O/qkvbEBiEoB79pqzAsZaR+yyezeUA35loU3DMhCLnYOAFHQgVOHA93f
 5KcyM7CFGEho126DHHPzyGx5u14SudobIKO2whPKWgii7hWBlfSnmHYxgxC6KoIpykMvKEutN
 0ZAYLagVvhPP5UQlNyNGE0q8dswwoF9Ga8lWdn8L700sXov0b4jO2lTcr/TWDUTE9p1gr3XOm
 dcrk/cD5EHKhokJslWEUTRkDE7uHiK1LUbq/JjKBbNs1DgzZCcR++8vPbisumdux1LxH+H+J+
 T0KxrM7iZavTIGcKE8RFp8axeuU7rkMhSFf3iA==
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
 Viresh Kumar <vireshk@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, SoC Team <soc@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, May 28, 2022 at 10:31 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Sat, May 28, 2022 at 11:59 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > It's CONFIG_ARM_AEABI, which is normally set everywhere. Without this
> > option, you the kernel is built for the old 'OABI' that forces all non-packed
> > struct members to be at least 16-bit aligned.
>
> Looks like forced word (32 bit) alignment to me.

Ah, of course, I keep mixing it up with the odd structure alignment of m68k,
which does the opposite and aligns struct members to no more than 16 bits.

        Arnd
