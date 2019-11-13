Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED16FAB2A
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 08:43:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7DC56E25C;
	Wed, 13 Nov 2019 07:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A82BA6E25C
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 07:43:40 +0000 (UTC)
Received: from mail-qk1-f177.google.com ([209.85.222.177]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MIxBa-1iAWG311x4-00KU1I for <dri-devel@lists.freedesktop.org>; Wed, 13
 Nov 2019 08:38:33 +0100
Received: by mail-qk1-f177.google.com with SMTP id q70so876970qke.12
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 23:38:31 -0800 (PST)
X-Gm-Message-State: APjAAAWL/JizoaRIzoi5qVAJ89pWKz3/SUvuGbUbQZBBZlgg7creohye
 8PoW91Yi1cSSaVlRkdAyQ2gh4m5U7yc6NT50RqI=
X-Google-Smtp-Source: APXvYqwcv3J/m3EiKMnljDoadHXNfb1emGEfcNt/Ep/L32JdSlabgCsOT3L46pVsDG+wtjusUmekE0tuUmfRXOb/k7g=
X-Received: by 2002:a37:9d8c:: with SMTP id g134mr1350982qke.352.1573630711029; 
 Tue, 12 Nov 2019 23:38:31 -0800 (PST)
MIME-Version: 1.0
References: <20191111192258.2234502-1-arnd@arndb.de>
 <20191112105507.GA7122@lst.de>
 <CAKMK7uEEz1n+zuTs29rbPHU74Dspaib=prpMge63L_-rUk_o4A@mail.gmail.com>
 <20191112140631.GA10922@lst.de>
 <CAKMK7uFaA607rOS6x_FWjXQ2+Qdm8dQ1dQ+Oi-9if_Qh_wHWPg@mail.gmail.com>
 <20191112222423.GO11244@42.do-not-panic.com> <20191113072708.GA3213@lst.de>
In-Reply-To: <20191113072708.GA3213@lst.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 13 Nov 2019 08:38:15 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3OpiWAep86tOiN1Fj2W7ud5hQ1OLTkBR8ueAKsMHk-dA@mail.gmail.com>
Message-ID: <CAK8P3a3OpiWAep86tOiN1Fj2W7ud5hQ1OLTkBR8ueAKsMHk-dA@mail.gmail.com>
Subject: Re: [PATCH] video: fbdev: atyfb: only use ioremap_uc() on i386 and
 ia64
To: Christoph Hellwig <hch@lst.de>
X-Provags-ID: V03:K1:NzZIkx9nos+jTqK04hi9gcFVg6wv0cogGIYh5bjH+DSrRhTUNVZ
 Io+OIIWqQHzGK6oDifLKg9b+KN8eEngB5vXAHUY/SJE4eQQ4TbyPUzNIxpY/PU+l0M65pK+
 1F1Kr4Rc6g73+jWDivm9vXAdNpYyuGq9SL9yQHN/kL0LYho/A3rJprs9YRGi6zEk++MIjnR
 wOHRCO6cTBVK4uaMRTdEg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rginaIAsYCM=:gkvJfiEst8MXCW2NjKrA52
 PUrmqfK/OTzi5e3RfIdjXdLsDvqNKe3P07MNRF7Frrrk29E6agRpgKn0oYHaXoftN+rm1U3eG
 5yCqVZM6XSnqEgsWaybyU5ym/QwIG27Nsj/8cwo81sZPMtFh1qqqxQqcZTvbLdq62BQNvz7+c
 9uDYWJgAJx0rqokVEqj8CQAwCEHCXxJ0UsJ2qIOtyT2etsKq9bwe73ktY07G6kf9JwkXAogWM
 4Hb8MiDfc7rAYeNP7FE/+Ga4NkNJbiI71JZTmV2N/fyWpEHwlvgpRvTaPSenfOB2i8ptXKh8j
 LmLaJ5PzgvBwKsaqnnv8L7o+mLBA4c139pj+MROJ5vWGdROpCocEt+SxZPRFSN0yGFAxW0q43
 q7bjkIav/NgpoumOdz4U5TI0uUKe0d222CKepSotHDyTxyT98CG/lWhyYj8uKkQWQTUoowgXq
 XfT9PqU7JAGrJ2yX8NvbXZL5apgy+sj6zQF+p8F7C18z/qoUTFD7hrYmdN2fwD4Bcwsc72GDv
 zOjLV1je9Dkfzi2IyupeJj60UpcNwr6Ym9dNs5xM1Pz/kKOB8DXQGcDP4+oTVjxYSYEtuD+1O
 9dHlO6VkqmFGEp1iCe5ylecb8PnNSOUbCuyXNd6zvl2dmgp5Z21MFn/959MBn9ORolOIfhD8P
 xZWSLEBUurSP9YL4HkNrwc9o0nMzdlrx5e9m6ptbBso3mp85qK2V67vcddg6PvMzrrfbE+9ii
 RB7Kf+oTuKw7I0VNKQN3qbHmD8wSbvcxVD7Lq8npEplrN6LyoVFcDO+E8OKpwQnwRXMc6yiYf
 n/JSjFfiriEnM/hXk4+cjgnOKiP5lVoNYMyRs3q+xqysHK2hSr6Ao2mBqsdpgCRDuDbEddXSL
 2VAVvFYHDUiZGH2I8ndg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-ia64@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Lee Jones <lee.jones@linaro.org>, X86 ML <x86@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Tuowen Zhao <ztuowen@gmail.com>,
 Fenghua Yu <fenghua.yu@intel.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 "Luis R. Rodriguez" <mcgrof@suse.com>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Juergen Gross <jgross@suse.com>, Tony Luck <tony.luck@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, AceLan Kao <acelan.kao@canonical.com>,
 Souptick Joarder <jrdr.linux@gmail.com>, Roman Gilg <subdiff@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMTMsIDIwMTkgYXQgODoyNyBBTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxz
dC5kZT4gd3JvdGU6Cj4KPiBPbiBUdWUsIE5vdiAxMiwgMjAxOSBhdCAxMDoyNDoyM1BNICswMDAw
LCBMdWlzIENoYW1iZXJsYWluIHdyb3RlOgo+ID4gSSB0aGluayB0aGlzIHdvdWxkIGJlIHBvc3Np
YmxlIGlmIHdlIGNvdWxkIGZsb3AgaW9yZW1hcF9ub2NhY2hlKCkgdG8gVUMKPiA+IGluc3RlYWQg
b2YgVUMtIG9uIHg4Ni4gT3RoZXJ3aXNlLCBJIGNhbid0IHNlZSBob3cgd2UgY2FuIHJlbW92ZSB0
aGlzIGJ5Cj4gPiBzdGlsbCBub3QgYWxsb3dpbmcgZGlyZWN0IE1UUlIgY2FsbHMuCj4KPiBJZiBl
dmVyeXRoaW5nIGdvZXMgd2VsbCBpb3JlbWFwX25vY2FjaGUgd2lsbCBiZSBnb25lIGFzIG9mIDUu
NS4KCkFzIGlvcmVtYXBfbm9jYWNoZSgpIGp1c3QgYW4gYWxpYXMgZm9yIGlvcmVtYXAoKSwgSSBz
dXBwb3NlIHRoZSBpZGVhIHdvdWxkCnRoZW4gYmUgdG8gbWFrZSB4ODYgaW9yZW1hcCBiZSBVQyBp
bnN0ZWFkIG9mIFVDLSwgYWdhaW4gbWF0Y2hpbmcgd2hhdCB0aGUKb3RoZXIgYXJjaGl0ZWN0dXJl
cyBkbyBhbHJlYWR5LgoKICAgICAgQXJuZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
