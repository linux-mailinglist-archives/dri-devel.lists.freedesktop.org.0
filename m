Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A7CE1CC0
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 15:36:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A7846E0FD;
	Wed, 23 Oct 2019 13:36:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E13D66E0FF
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 13:36:08 +0000 (UTC)
Received: from mail-qk1-f172.google.com ([209.85.222.172]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MlO5j-1hj1Vy0ejd-00llny for <dri-devel@lists.freedesktop.org>; Wed, 23
 Oct 2019 15:36:07 +0200
Received: by mail-qk1-f172.google.com with SMTP id m4so2806245qke.9
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 06:36:06 -0700 (PDT)
X-Gm-Message-State: APjAAAXMD/tCrGm+SQ4L8goNNXqBRSSRDKWdOtdy2aeD/U6ppO2S5cBe
 +IFJwVnCxfPG6SCYVV8EHCMWeAsH4PkQL9FUKZw=
X-Google-Smtp-Source: APXvYqwqW5j67aigUtbaQwMvvZPaRM75Zx1vwHK4rpCvIcwvfeEYCvDuZFw2giioKFckU9rb9ypL7pHNYyg0dml8Ps0=
X-Received: by 2002:aed:3c67:: with SMTP id u36mr9047061qte.142.1571837765100; 
 Wed, 23 Oct 2019 06:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <20191010202802.1132272-1-arnd@arndb.de>
 <20191010203043.1241612-1-arnd@arndb.de>
 <20191010203043.1241612-28-arnd@arndb.de> <20191023131321.GH11048@pi3>
In-Reply-To: <20191023131321.GH11048@pi3>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 23 Oct 2019 15:35:49 +0200
X-Gmail-Original-Message-ID: <CAK8P3a03JtFrCYFUQAFnSENghrXSCDBQXB-QfiDG3yTxXxdpaw@mail.gmail.com>
Message-ID: <CAK8P3a03JtFrCYFUQAFnSENghrXSCDBQXB-QfiDG3yTxXxdpaw@mail.gmail.com>
Subject: Re: [PATCH 28/36] fbdev: s3c2410fb: remove mach header dependency
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Provags-ID: V03:K1:H1FJQ5qE835Y3zTPK4QfFxTmeFnBwz+f0IG71lZJkD+NPrrxU5P
 0ZotK2Tm8PGUJsoU9q/0zJp0pyWYZE5CpO312ox85P/vfPH4oBqEaV9172kdpmOnovI9MGe
 BGa3FUpqwxMWkGmeWWczPCHEX4sfW8QSb8Kw5zeqevqEStjZOtUJl3a7+MGDMfWSA7zMgs+
 pCom6eS/cwLTMHMGIYxxA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Xb69efoFXEY=:aSrSX7Ld6czgvqa2t+SyV0
 oJ1tsXAygqNeZ4criEFnhT6o3XBNGcwThkFIK/VxeIUd+Zvv8LcuxlbhLAV27aCxV+Tjo7ytD
 U6Q6KKwPSS7vorf11QYt6YpOnCJiTjgLF2YqF4JrccQ/2ca3s6Qc5DSQNCLl92pJdprQH5ssH
 BlyY4nx8LXIrUQMtARRvIa4BLAYFR9zYB6tyUoTHh7riFdOgAva8Fk+zpohGkcp6leGYwpjLL
 A29TK4lj1i5shi1mapFtO0jie3KLonQhihek//24it1LluYbh6GGeNte8oEgonvBBg/Z/9iij
 LEagoyiGyGaXumsWqH/XS7P7qknzR5rNL2RNM6SrBKkFsjq1bdxu9MaaIyotDi9VD+S43xdhV
 zpX36qHxNBvVXf5lAde3ujV5LLwT+IUyUaLxX8XYXqslphSWCdkNReyCg/YRrEIKYJezsuYzQ
 x+F4SVw/PXJ6PJqo4cgRFz1TQcKzWBCorYxidTnvbqLBgYx6OGTOxRSwvLN6FA2Z7YwLJDlaO
 EcV9qE4DiELUVAZ9J/15Bc7El2kak/tmjREmHY1wOO4mmqNExUXuqrWgDhW9Gl+vDrbhunYZn
 7XG3/UnFnzG7xiClOfoXFEuW7JNoQ76A6+HQwmzp+OF/3oZ3G03w+TJQr+DDqPCgLiRYGRMrs
 B7ZAFNx0mTXdzd4Czo+FpX1Mb7ET8g5BcgpCU6gydT2uRai2EnW6M56jkJuysUslPyUjGbPGJ
 L6IAzEPDNi6YmFn/tVIWpAMDfiQ7t6A9PBHV+v7816gsRe/k2FgBxAkW257nyAVwS8aEYpRaK
 cT8LnG7u+xI12wjqe9SWPGZludQA24RKccZvN4ri8fYeklFME4egxJRBpIIVP7mOJ2uPvHUOm
 2rLDD/TuUiCOtLMb+B0w==
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
 "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Kukjin Kim <kgene@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMzoxMyBQTSBLcnp5c3p0b2YgS296bG93c2tpIDxrcnpr
QGtlcm5lbC5vcmc+IHdyb3RlOgo+IE9uIFRodSwgT2N0IDEwLCAyMDE5IGF0IDEwOjMwOjEyUE0g
KzAyMDAsIEFybmQgQmVyZ21hbm4gd3JvdGU6Cgo+ID4gQEAgLTMyMSw2ICszMjAsNyBAQCBzdGF0
aWMgc3RydWN0IHMzYzI0MTBmYl9tYWNoX2luZm8gaml2ZV9sY2RfY29uZmlnID0gewo+ID4gICAg
ICAgICogZGF0YS4gKi8KPiA+Cj4gPiAgICAgICAuZ3BjdXAgICAgICAgICAgPSAoMHhmIDw8IDEp
IHwgKDB4M2YgPDwgMTApLAo+ID4gKyAgICAgLmdwY3VwX3JlZyA9ICAgIFMzQzI0MTBfR1BDVVAs
Cj4KPiBOaXRzOiBpbmRlbnRhdGlvbiBiZWZvcmUvYWZ0ZXIgJz0nIGxvb2tzIHdyb25nLiBUYWIg
c2hvdWxkIGJlCj4gYmVmb3JlICc9Jywgb25lIHNwYWNlIGFmdGVyLgoKT2ssIGZpeGVkIG5vdyBm
b3IgdGhlIGZvdXIgYm9hcmRzIHRoYXQgaGFkIGluY29uc2lzdGVudCBpbmRlbnRhdGlvbiAtLQpq
aXZlLCBtaW5pMjQ0MCwgc21kazI0NDAsIGFuZCByeDE5NTAuIFVuZm9ydHVuYXRlbHkgZWFjaCBi
b2FyZApzZWVtZWQgdG8gaGF2ZSBpdHMgb3duIHdheSBvZiBkb2luZyB0aGlzLgoKICAgICAgQXJu
ZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
