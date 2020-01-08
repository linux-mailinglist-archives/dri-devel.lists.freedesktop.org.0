Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8FE133D78
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 09:45:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D5506E877;
	Wed,  8 Jan 2020 08:44:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FAA76E877;
 Wed,  8 Jan 2020 08:44:57 +0000 (UTC)
Received: from mail-qk1-f169.google.com ([209.85.222.169]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MQNAv-1j25Xa21Dt-00MNUE; Wed, 08 Jan 2020 09:44:55 +0100
Received: by mail-qk1-f169.google.com with SMTP id x1so1896593qkl.12;
 Wed, 08 Jan 2020 00:44:55 -0800 (PST)
X-Gm-Message-State: APjAAAUnWS2dCz4MfX76E88zD9UYmW4pBsaOjYeeDmDJ4YP6eo8tA/Sv
 mEjZViVneIWwWpnKgACoBBPsZKaOx8m6kdDaYl8=
X-Google-Smtp-Source: APXvYqwBkJ8QmnIL+nEzdyW4cVb2dCgT1+bxTVHrv/QXRUdjO9mWLnIecKxCrEVE9XkgL278ZPmA2bqFRRwBDXNH4F8=
X-Received: by 2002:a05:620a:a5b:: with SMTP id
 j27mr3333439qka.286.1578473093254; 
 Wed, 08 Jan 2020 00:44:53 -0800 (PST)
MIME-Version: 1.0
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
 <CAMuHMdW4ek0OYQDrrbcpZjNUTTP04nSbwkmiZvBmKcU=PQM9qA@mail.gmail.com>
 <CAMuHMdUBmYtJKtSYzS_5u67hVZOqcKSgFY1rDGme6gLNRBJ_gA@mail.gmail.com>
 <CAJKOXPfq9vS4kSyx1jOPHBvi9_HjviRv0LU2A8ZwdmqgUuebHQ@mail.gmail.com>
 <2355489c-a207-1927-54cf-85c04b62f18f@c-s.fr>
In-Reply-To: <2355489c-a207-1927-54cf-85c04b62f18f@c-s.fr>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 8 Jan 2020 09:44:36 +0100
X-Gmail-Original-Message-ID: <CAK8P3a21yPrmp4ik3Ei1BZfeqZNf0wL5NZNF3uXqb4FLRDyUPw@mail.gmail.com>
Message-ID: <CAK8P3a21yPrmp4ik3Ei1BZfeqZNf0wL5NZNF3uXqb4FLRDyUPw@mail.gmail.com>
Subject: Re: [RFT 00/13] iomap: Constify ioreadX() iomem argument
To: Christophe Leroy <christophe.leroy@c-s.fr>
X-Provags-ID: V03:K1:eTwWuJU3Pu3vfd3swVS9/O4ZrS6NM/8n5pPg/n4irQSs/OB+VVg
 x/CBdQIz5s8c7asLWUUfG2Pn39A5X/kwd5K8mIkp1m4PXS2zIxR3KTXqUSbavIGaFgrIpFn
 pv+/R8qG+EsDUt2tGqqLTg06tARAP0SlPtTA8l8weCExGECE78YsqPUECNoIvLG1mYlU4S3
 R6kVU/IJOMDq+U1Up5z7w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:MBHbI+rS12o=:z9ZLslwhwB/ZVyaKq0arkH
 oFv0Cj9cfbnxgkJO88/KRoqzk5HfR3UHl/4BJNXVtlYzlIkcNXSPkz/bp+2DmG/IXbSXTXdav
 SW6eckp9EWYdithsul/W7WycmcRqqxnDl5LrK6xHVz/8wE1DHooPzSjY7aRKgZ3Gk87B32a2r
 kAW4ZTM7iuFIW3uwSI4eKlTcbx5P2tTZAnCicZyASTEBckERuBkha99Usa3ukKGgBvyTIQfdn
 CsL8MRgmIrxCYst6omXOzwmY2GT6CubgqJ/d1OVCa9jVaodOKgSqqEnAUUplxjrb8kMf84GzI
 AYtx5JfybWvqkPGiHwlPTU6C4Ps3tqx7m/4tHSDDkZKnj16xtx142dvA3Y5DM9olrtZ4dSRVh
 y5r8msadRPIpR3a5ySQ40JEhASZk9s9oh7y2Lw4Fj9blRWZbENqDD6/IGpDCfqKwAf8XfWb0q
 dg5csAZXMpvbN3yrf8a37W4dwwHoO1Z5WZ6TXBxbNcXS8/k9cIVrBn/sjJSHpe0CE4Rl9NWKf
 ckeI+HiSLDtykomeqIuuPQkOS886EyaruY6sOqW7FSZWqRMeddTXGsEmrrZatINaHBws38SPG
 NO1QD+CKm2eWeXtvP8Zh1Zt4DlCXOJgluH3bPdoymx6nnDIsKcB+otqZMr2O44pByXrk5bMG8
 DgK6vQaJGarLOkF+aYU4CiMBhlumiQZLen1AN+NHN+ojIhfqk5rqymVwgXojRkTbNRIM1a+V/
 eO+paOlu/UG2SckQIUSMAh/zFIOC21RKNcHRj6pY/ZbkT1cY7vQqRAaCFPwQKU5oNyPMrHskI
 CZhlF2kleSDA/Oqw3A6OqU0lEOb17kzIQscveThEoMn/NNuMRQ9uVZkbkqP+qjL5I1uGd36+9
 1WsYacINx5MpOfcV23Cw==
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
Cc: Rich Felker <dalias@libc.org>, Jiri Slaby <jirislaby@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 ML nouveau <nouveau@lists.freedesktop.org>, Jason Wang <jasowang@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Paul Mackerras <paulus@samba.org>, Linux-Arch <linux-arch@vger.kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Helge Deller <deller@gmx.de>, Linux-sh list <linux-sh@vger.kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Matt Turner <mattst88@gmail.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 Jon Mason <jdmason@kudzu.us>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>,
 Parisc List <linux-parisc@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 alpha <linux-alpha@vger.kernel.org>, linux-ntb@googlegroups.com,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKYW4gOCwgMjAyMCBhdCA5OjM2IEFNIENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9w
aGUubGVyb3lAYy1zLmZyPiB3cm90ZToKPiBMZSAwOC8wMS8yMDIwIMOgIDA5OjE4LCBLcnp5c3p0
b2YgS296bG93c2tpIGEgw6ljcml0IDoKPiA+IE9uIFdlZCwgOCBKYW4gMjAyMCBhdCAwOToxMywg
R2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4gPiBJJ2xs
IGFkZCB0byB0aGlzIG9uZSBhbHNvIGNoYW5nZXMgdG8gaW9yZWFkWF9yZXAoKSBhbmQgYWRkIGFu
b3RoZXIKPiA+IHBhdGNoIGZvciB2b2xhdGlsZSBmb3IgcmVhZHMgYW5kIHdyaXRlcy4gSSBndWVz
cyB5b3VyIHJldmlldyB3aWxsIGJlCj4gPiBhcHByZWNpYXRlZCBvbmNlIG1vcmUgYmVjYXVzZSBv
ZiBpb3JlYWRYX3JlcCgpCj4gPgo+Cj4gdm9sYXRpbGUgc2hvdWxkIHJlYWxseSBvbmx5IGJlIHVz
ZWQgd2hlcmUgZGVlbWVkIG5lY2Vzc2FyeToKPgo+IGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9j
L2h0bWwvbGF0ZXN0L3Byb2Nlc3Mvdm9sYXRpbGUtY29uc2lkZXJlZC1oYXJtZnVsLmh0bWwKPgo+
IEl0IGlzIHNhaWQ6ICIgLi4uICBhY2Nlc3NvciBmdW5jdGlvbnMgbWlnaHQgdXNlIHZvbGF0aWxl
IG9uCj4gYXJjaGl0ZWN0dXJlcyB3aGVyZSBkaXJlY3QgSS9PIG1lbW9yeSBhY2Nlc3MgZG9lcyB3
b3JrLiBFc3NlbnRpYWxseSwKPiBlYWNoIGFjY2Vzc29yIGNhbGwgYmVjb21lcyBhIGxpdHRsZSBj
cml0aWNhbCBzZWN0aW9uIG9uIGl0cyBvd24gYW5kCj4gZW5zdXJlcyB0aGF0IHRoZSBhY2Nlc3Mg
aGFwcGVucyBhcyBleHBlY3RlZCBieSB0aGUgcHJvZ3JhbW1lci4iCgpUaGUgSS9PIGFjY2Vzc29y
cyBhcmUgb25lIG9mIHRoZSBmZXcgcGxhY2VzIGluIHdoaWNoICd2b2xhdGlsZScgZ2VuZXJhbGx5
Cm1ha2VzIHNlbnNlLCBhdCBsZWFzdCBmb3IgdGhlIGltcGxlbWVudGF0aW9ucyB0aGF0IGRvIGEg
cGxhaW4gcG9pbnRlcgpkZXJlZmVyZW5jZSAocHJvYmFibHkgbm9uZSBvZiB0aGUgb25lcyBpbiBx
dWVzdGlvbiBoZXJlKS4KCkluIGNhc2Ugb2YgcmVhZGwvd3JpdGVsLCB0aGlzIGlzIHdoYXQgd2Ug
ZG8gaW4gYXNtLWdlbmVyaWM6CgpzdGF0aWMgaW5saW5lIHUzMiBfX3Jhd19yZWFkbChjb25zdCB2
b2xhdGlsZSB2b2lkIF9faW9tZW0gKmFkZHIpCnsKICAgICAgICByZXR1cm4gKihjb25zdCB2b2xh
dGlsZSB1MzIgX19mb3JjZSAqKWFkZHI7Cn0KClRoZSBfX2ZvcmNlLWNhc3QgdGhhdCByZW1vdmVz
IHRoZSBfX2lvbWVtIGhlcmUgYWxzbyBtZWFucyB0aGF0CnRoZSAndm9sYXRpbGUnIGtleXdvcmQg
Y291bGQgYmUgZHJvcHBlZCBmcm9tIHRoZSBhcmd1bWVudCBsaXN0LAphcyBpdCBoYXMgbm8gcmVh
bCBlZmZlY3QgYW55IG1vcmUsIGJ1dCB0aGVuIHRoZXJlIGFyZSBhIGZldyBkcml2ZXJzCnRoYXQg
bWFyayB0aGVpciBpb21lbSBwb2ludGVycyBhcyBlaXRoZXIgJ3ZvbGF0aWxlIHZvaWQgX19pb21l
bSonIG9yCih3b3JzZSkgJ3ZvbGF0aWxlIHZvaWQgKicsIHNvIHdlIGtlZXAgaXQgaW4gdGhlIGFy
Z3VtZW50IGxpc3QgdG8gbm90CmFkZCB3YXJuaW5ncyBmb3IgdGhvc2UgZHJpdmVycy4KCkl0IG1h
eSBiZSB0aW1lIHRvIGNoYW5nZSB0aGVzZSBkcml2ZXJzIHRvIG5vdCB1c2Ugdm9sYXRpbGUgZm9y
IF9faW9tZW0KcG9pbnRlcnMsIGJ1dCB0aGF0IHNlZW1zIG91dCBvZiBzY29wZSBmb3Igd2hhdCBL
cnp5c3p0b2YgaXMgdHJ5aW5nCnRvIGRvLiBJZGVhbGx5IHdlIHdvdWxkIGJlIGNvbnNpc3RlbnQg
aGVyZSB0aG91Z2gsIGVpdGhlciB1c2luZyB2b2xhdGlsZQphbGwgdGhlIHRpbWUgb3IgbmV2ZXIu
CgogICAgICAgIEFybmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
