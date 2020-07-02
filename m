Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD1C211C4F
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 08:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D28CF884B0;
	Thu,  2 Jul 2020 06:58:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94066E107
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 06:58:02 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200702065800euoutp0188ffcaf127d278ff0f1d76e0039b45b5~d3TkqApCg1352013520euoutp01a
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 06:58:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200702065800euoutp0188ffcaf127d278ff0f1d76e0039b45b5~d3TkqApCg1352013520euoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1593673080;
 bh=HY3QJuzFQ+SJkNZhYjq1mgAxfvlBDyzp0zvay/HzfxI=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=mOkJnVMLeqNqVSWDaZwMrAqWqbgKv6p2u1Mt9mkM4dDzyvp/VMsAHUuUnsPAlT+fa
 3SUAmcU/PIv/JIGGanZQl6MYqIARrBh4rwi5W/UlfYmE8iyCp3/eAtPy40g1Tyu1/M
 QGVSRH0Oy3ma6VrE01S53coIhqHpopC+/19uGKc8=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200702065800eucas1p2501315ca027794f9e159de569803fd71~d3TkVL7OU2154521545eucas1p23;
 Thu,  2 Jul 2020 06:58:00 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 77.CF.06456.8758DFE5; Thu,  2
 Jul 2020 07:58:00 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200702065759eucas1p27aed78f9bea21366d390de015624cacf~d3Tj5db_I2866328663eucas1p2F;
 Thu,  2 Jul 2020 06:57:59 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200702065759eusmtrp1a46bc4aa0194674fbbd56e521b0911a4~d3Tj4mgDk1817218172eusmtrp1D;
 Thu,  2 Jul 2020 06:57:59 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-d4-5efd8578b72c
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 09.F2.06017.7758DFE5; Thu,  2
 Jul 2020 07:57:59 +0100 (BST)
Received: from [106.210.85.205] (unknown [106.210.85.205]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200702065756eusmtip2c7bd6fd2a24410f6728b9731c3cb082c~d3Tgl8o7Z2648926489eusmtip2w;
 Thu,  2 Jul 2020 06:57:56 +0000 (GMT)
Subject: Re: [PATCH v6 2/4] driver core: add deferring probe reason to
 devices_deferred property
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <e6057292-39de-831c-0b8d-b3f0b66937dc@samsung.com>
Date: Thu, 2 Jul 2020 08:57:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAKdAkRRLBLCLGH2qhEjaVnt8wNjoyGAfQimNWHZUvzx2m6Mwng@mail.gmail.com>
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0iTYRTHefZe9jqavE7FQ4bW6ktRmhXxlGb3eqEi+1JUOJv5eiGntqmt
 PpRohpey5aVyJtpKmiPxrmmascxpopmmaHhJNFAxDNMyu7q9Sn77nfP/n/P8DzwMIftJrWTC
 IqJ5dYQyXE5LyKqmH283aRN/KzZPdznhcd0rhEvvF1M4a3iUxq8MYwi/n52iccKjYhoXZpK4
 +/s4gVsmu0mcfOexGJeN9FC4q/YBjc1Z9QgXNQ6IsTntLM6dySL2sFxXzzuCm+pNFHM1+gEx
 l5OUTXFlpmSaa9Z1iriG3KdibijVIuLKH1/j0ipMiHt5K4PkLL3VIu5rmZuf9IzEJ4gPD4vl
 1Z6+5yShxtS/oqh+d+3PukNx6BekIDsG2G3wrbJBnIIkjIw1IuipM1NCMYPgTWMCIRRfEZQ8
 jUNLI687hhddTxBM6lqQUEwhqO7LJawuRzYQBirqKSs7sZ5QnTNvMxGshYJbz9NsAs2uh9/l
 fbSVpawvVFV/WmCGIdl1kJnuam07s/6QVpC/aHGAluxR0sp27AkonMyxJSJYd0iozCEEdoH4
 mUJbOmCLGDB80dNC7AMwljglFtgRJiwVi7wKWjNukgJfgyHjdUIYTkJQWVJDCII39LfP28IR
 C6GLaz2tCOxeKBjZLqA99H52ECLYQ3rVPUJoSyHphkzYsQaG2ioX97lAQccsrUNy/bLD9MuO
 0S87Rv//2XxEmpALH6NRhfAarwj+kodGqdLERIR4nI9UlaGFL9n6xzL9DM12BpoRyyD5Cmmo
 9pdCRiljNZdVZgQMIXeS7mtrVcikQcrLV3h1ZIA6JpzXmJErQ8pdpFsN4/4yNkQZzV/g+She
 vaSKGLuVceiUZaTbdKfJ25le67uj0+fji+C5i37xio03V9Gj7VfnPgTUjhyZWN2dF6x9+dBE
 7z3YJDns8WGLU56KwPP3cyeOBTLG5LD9Xu++uFVkGg2Kxl3qrMHbmd/m6o4avE76nNZ/dk0q
 Dzn+Pnj39E7xXcfo252DzaUTusgZynxkY9cp90tyUhOq9NpAqDXKf3A1nuSOAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnleLIzCtJLcpLzFFi42I5/e/4Pd3y1r9xBlcnmlm8nHCY0WLjjPWs
 FlMfPmGzOLzoBaPFla/v2SyaF69ns1g5hcXi6veXzBYn31xlseicuITdYtPja6wWl3fNYbM4
 NHUvo8XaI3fZLQ71RVvM/TKV2UHA4/K1i8we72+0snvsnHWX3WN2x0xWj02rOtk8Tky4xOSx
 f+4ado/73ceZPDYvqffo27KK0eNA72QWj+M3tjN5fN4kF8AbpWdTlF9akqqQkV9cYqsUbWhh
 pGdoaaFnZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJexovs/U8Ed+Yrfe9waGP9IdDFyckgI
 mEgcvfCQtYuRi0NIYCmjxN1jrawQCXGJ3fPfMkPYwhJ/rnWxQRS9ZZS4seARE0hCWCBJ4u6W
 vWANIgL6Ettn/2IEKWIWOMkqcXb6TyaIjjPMErfnXwerYhPQlPi7+SYbiM0rYCexbftTIJuD
 g0VARWLKJGmQsKhArMS3e1ugSgQlTs58wgJicwoESqx8M5sRxGYWMJOYt/khM4QtL9G8dTaU
 LS7R9GUl6wRGoVlI2mchaZmFpGUWkpYFjCyrGEVSS4tz03OLjfSKE3OLS/PS9ZLzczcxAhPD
 tmM/t+xg7HoXfIhRgINRiYc3o+JPnBBrYllxZe4hRgkOZiURXqezp+OEeFMSK6tSi/Lji0pz
 UosPMZoC/TaRWUo0OR+YtPJK4g1NDc0tLA3Njc2NzSyUxHk7BA7GCAmkJ5akZqemFqQWwfQx
 cXBKNTDOmDx/4Q+RSw/3r9JYvahQtWP7xnupvFbrHkyMW+afz3t6+vK6Equ70wo+B37J8PHY
 N+X0mkOemx9dqCrKlLNada6Z+bpeZHZAulLyY7fW8LeiK71O5k758idQ8AiH3jVHHqtOpbT1
 dYbVBzb9qwj89VH75Msnwo2LlzpJnX/ooXpuSXNJrddnJZbijERDLeai4kQA9ILhMCIDAAA=
X-CMS-MailID: 20200702065759eucas1p27aed78f9bea21366d390de015624cacf
X-Msg-Generator: CA
X-RootMTR: 20200626100110eucas1p2c5b91f2c98a5c6e5739f5af3207d192e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200626100110eucas1p2c5b91f2c98a5c6e5739f5af3207d192e
References: <20200626100103.18879-1-a.hajda@samsung.com>
 <CGME20200626100110eucas1p2c5b91f2c98a5c6e5739f5af3207d192e@eucas1p2.samsung.com>
 <20200626100103.18879-3-a.hajda@samsung.com>
 <5f159e00-44fd-515b-dd8c-4db9845dc9e6@ti.com>
 <7e3c924b-c025-a829-6868-78e2935c70eb@samsung.com>
 <66faa188-5ef6-d449-07fe-28c8be5e559c@ti.com>
 <21f5ec9c-2d1d-5f28-5aeb-ac0db144a55e@samsung.com>
 <CAKdAkRRLBLCLGH2qhEjaVnt8wNjoyGAfQimNWHZUvzx2m6Mwng@mail.gmail.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDMwLjA2LjIwMjAgMjA6MDAsIERtaXRyeSBUb3Jva2hvdiB3cm90ZToKPiBPbiBUdWUsIEp1
biAzMCwgMjAyMCBhdCA4OjQyIEFNIEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+
IHdyb3RlOgo+Pgo+PiBPbiAzMC4wNi4yMDIwIDEwOjU5LCBHcnlnb3JpaSBTdHJhc2hrbyB3cm90
ZToKPj4+IEhpCj4+Pgo+Pj4gT24gMjkvMDYvMjAyMCAxNDoyOCwgQW5kcnplaiBIYWpkYSB3cm90
ZToKPj4+PiBIaSBHcnlnb3JpaSwKPj4+Pgo+Pj4+ICguLi4pCj4+Pj4KPj4+Pj4+ICAgICAvKgo+
Pj4+Pj4gICAgICAqIGRlZmVycmVkX2RldnNfc2hvdygpIC0gU2hvdyB0aGUgZGV2aWNlcyBpbiB0
aGUgZGVmZXJyZWQgcHJvYmUKPj4+Pj4+IHBlbmRpbmcgbGlzdC4KPj4+Pj4+ICAgICAgKi8KPj4+
Pj4+IEBAIC0yMjEsNyArMjQxLDggQEAgc3RhdGljIGludCBkZWZlcnJlZF9kZXZzX3Nob3coc3Ry
dWN0IHNlcV9maWxlICpzLAo+Pj4+Pj4gdm9pZCAqZGF0YSkKPj4+Pj4+ICAgICAgICAgbXV0ZXhf
bG9jaygmZGVmZXJyZWRfcHJvYmVfbXV0ZXgpOwo+Pj4+Pj4gICAgICAgICAgIGxpc3RfZm9yX2Vh
Y2hfZW50cnkoY3VyciwgJmRlZmVycmVkX3Byb2JlX3BlbmRpbmdfbGlzdCwKPj4+Pj4+IGRlZmVy
cmVkX3Byb2JlKQo+Pj4+Pj4gLSAgICAgICAgc2VxX3ByaW50ZihzLCAiJXNcbiIsIGRldl9uYW1l
KGN1cnItPmRldmljZSkpOwo+Pj4+Pj4gKyAgICAgICAgc2VxX3ByaW50ZihzLCAiJXNcdCVzIiwg
ZGV2X25hbWUoY3Vyci0+ZGV2aWNlKSwKPj4+Pj4+ICsgY3Vyci0+ZGV2aWNlLT5wLT5kZWZlcnJl
ZF9wcm9iZV9yZWFzb24gPzogIlxuIik7Cj4+Pj4+PiAgICAgICAgICAgbXV0ZXhfdW5sb2NrKCZk
ZWZlcnJlZF9wcm9iZV9tdXRleCk7Cj4+Pj4+Pgo+Pj4+PiBTcnksIG1heSBiZSBpIG1pc3Npbmcg
c210aCwgYnV0IHNob3VsZG4ndCBpdCBiZSBvcHRpb25hbAo+Pj4+PiAoQ09ORklHX0RFQlVHX0ZT
IGlzIHByb2JhYmx5IHRvbyBnZW5lcmljKS4KPj4+Pj4KPj4+PiBJIGFtIG5vdCBzdXJlIHdoYXQg
ZXhhY3RseSBhcmUgeW91IHJlZmVycmluZyB0bywgYnV0IHRoaXMgcGF0Y2ggZG9lcyBub3QKPj4+
PiBhZGQgbmV3IHByb3BlcnR5LCBpdCBqdXN0IGV4dGVuZHMgZnVuY3Rpb25hbGl0eSBvZiBleGlz
dGluZyBvbmUuCj4+PiBTcnksIG5lZWRlZCB0byBiZSBtb3JlIHNwZWNpZmljLgo+Pj4KPj4+IFlv
dSd2ZSBhZGRlZCAgZGV2aWNlX3NldF9kZWZlcnJlZF9wcm9iZV9yZXNvbihkZXYsICZ2YWYpOwo+
Pj4gd2hpY2ggZXhwZWN0ZWQgdG8gYmUgdXNlZCBvbiBldmVyeSBFUFJPQkVfREVGRVIgaW4gZGV2
X2Vycl9wcm9iZSgpIGluCj4+PiBjb21iaW5hdGlvbiB3aXRoCj4+Pgo+Pj4gKyAgICAgICB9IGVs
c2Ugewo+Pj4gKyAgICAgICAgICAgICAgIGRldmljZV9zZXRfZGVmZXJyZWRfcHJvYmVfcmVzb24o
ZGV2LCAmdmFmKTsKPj4+ICAgICAgICAgICAgICAgICAgZGV2X2RiZyhkZXYsICJlcnJvciAlZDog
JXBWIiwgZXJyLCAmdmFmKTsKPj4+Cj4+PiBeXiBkZXZfZGJnKCkgZG9lcyBub3QgYWRkIGFueSBy
dW50aW1lIG92ZXJoZWFkIGR1cmluZyBib290IHVubGVzcyBlbmFibGVkCj4+PiArICAgICAgIH0K
Pj4+Cj4+PiBCdXQ6Cj4+Pgo+Pj4gK3ZvaWQgZGV2aWNlX3NldF9kZWZlcnJlZF9wcm9iZV9yZXNv
bihjb25zdCBzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdAo+Pj4gdmFfZm9ybWF0ICp2YWYpCj4+
PiArewo+Pj4gKyAgICAgICBjb25zdCBjaGFyICpkcnYgPSBkZXZfZHJpdmVyX3N0cmluZyhkZXYp
Owo+Pj4gKwo+Pj4gKyAgICAgICBtdXRleF9sb2NrKCZkZWZlcnJlZF9wcm9iZV9tdXRleCk7Cj4+
PiArCj4+PiArICAgICAgIGtmcmVlKGRldi0+cC0+ZGVmZXJyZWRfcHJvYmVfcmVhc29uKTsKPj4+
ICsgICAgICAgZGV2LT5wLT5kZWZlcnJlZF9wcm9iZV9yZWFzb24gPSBrYXNwcmludGYoR0ZQX0tF
Uk5FTCwgIiVzOgo+Pj4gJXBWIiwgZHJ2LCB2YWYpOwo+Pj4gKwo+Pj4gKyAgICAgICBtdXRleF91
bmxvY2soJmRlZmVycmVkX3Byb2JlX211dGV4KTsKPj4+ICt9Cj4+Pgo+Pj4gXl4gQWRkcyBsb2Nr
aW5nLCBrZnJlZSgpIGFuZCBrYXNwcmludGYoKSBmb3IgZXZlcnkgZGVmZXJyZWQgcHJvYmUKPj4+
IGR1cmluZyBib290IGFuZCBjYW4ndCBiZSBkaXNhYmxlZC4KPj4+Cj4+PiBSaWdodD8KPj4KPj4g
UmlnaHQsIGJ1dCB1c3VhbGx5IHRoZSBidXJkZW4gc2hvdWxkIGJlIGluc2lnbmlmaWNhbnQgaW4g
Y29tcGFyaXNvbiB0bwo+PiBwcm9iZSB0aW1lLCBzbyBJIGRvIG5vdCB0aGluayBpdCBpcyB3b3J0
aCBvcHRpbWl6aW5nLgo+IEkgZG8gbm90IHRoaW5rIHRoaXMgaXMgZ29pbmcgdG8gdGFrZS4gWW91
IGFyZSBzdWdnZXN0aW5nIHRoYXQgd2UKPiBtb2RpZnkgcHJldHR5IG11Y2ggZXZlcnkgZHJpdmVy
IHRvIHN1cHBseSB0aGlzIGRlZmVycmFsIHJlYXNvbiwgYW5kIEkKPiBkb3VidCBpdCB3aWxsIGhh
cHBlbi4gQ2FuIHdlIHB1dCB0aGlzIGJ1cmRlbiBvbiBwcm92aWRlcnMgdGhhdCByYWlzZQo+IHRo
ZSBkZWZlcnJhbD8KCgpJIHdvdWxkbid0IHNheSB0aGV5IHJhaXNlIHRoZSBkZWZlcnJhbCwgdGhl
eSBqdXN0IGluZm9ybSByZXNvdXJjZSBpcyBub3QgCnlldCBhdmFpbGFibGUuIE9ubHkgZGV2aWNl
IGRyaXZlciwgYW5kIG9ubHkgaW4gaXRzIHByb2JlIGZ1bmN0aW9uIGNhbiAKInJhaXNlIHRoZSBk
ZWZlcnJhbCIuCgoKPiAgIEkuZS4gbWFqb3JpdHkgb2YgY29kZSBhcmUgdXNpbmcgZGV2bSBBUEkg
bm93LCBzbyB3ZSBtb3N0Cj4gbGlrZWx5IGtub3cgdGhlIGRldmljZSBmb3Igd2hpY2ggZGVmZXJy
YWwgaXMgYmVpbmcgcmFpc2VkLiBXZSBjYW4gaGF2ZQo+IGEgbGlzdCBvZiBkZWZlcnJhbCByZWFz
b25zIGFuZCB0aGVpciBkZXZpY2VzIGFuZCB3aGVuIGluIGRldmljZSBjb2RlCj4gb25jZSBwcm9i
ZSBpcyBkb25lIHdlIGNvdWxkIHRyeSByZWNvbmNpbGluZyBpdCB3aXRoIHRoZSBkZWZlcnJlZAo+
IGRldmljZWxpc3QsIGFuZCB0aGlzIHdvdWxkIG1lYW4geW91IG9ubHkgbmVlZCB0byBpbXBsZW1l
bnQgdGhpcyBpbgo+IGdwaW9saWIsIHJlZ3VsYXRvciBjb3JlLCBjbG9ja3MgY29yZSwgZXRjLgoK
ClRoaXMgcGF0Y2hzZXQgdHJpZXMgdG8gc29sdmUgc2ltcGxlIGlzc3VlIC0gcmVwbGFjZSBtdWx0
aXBsZSBsaW5lcyBvZiAKY29kZSBwcmVzZW50IGluIG11bHRpcGxlIHByb2JlIGZ1bmN0aW9ucyAo
YWRkaXRpb25hbGx5IGZpeGluZyBsb3Qgb2YgCnRoZW0pIHdpdGggc2luZ2xlIGNhbGwgYW5kIHRo
ZW4gZW5oYW5jZSBpdCBsaXR0bGUgYml0LCBub3RoaW5nIG1vcmUuCgpXaGF0IHlvdSBhcmUgcHJv
cG9zaW5nIGlzIGJsdXJyeSBhdCB0aGUgbW9tZW50IGZvciBtZSwgcHJvdmlkZXIgZG9lcyBub3Qg
Cmtub3cgaWYgY29uc3VtZXIgd2FudCB0byBkZWZlcizCoCBvciB3aWxsIGNvbnRpbnVlIHdvcmtp
bmcgd2l0aG91dCAKbWlzc2luZyByZXNvdXJjZSwgbW9yZW92ZXIgc29tZSBjb25zdW1lcnMgY2Fu
IGFjcXVpcmUgcmVzb3VyY2VzIGFmdGVyIApwcm9iZSAtIGFnYWluIG5vIHByb2JlIGRlZmVycmFs
LiBFdmVuIGlmIGl0IHdpbGwgYmUgZG9uZSAoaXQgY2FuIGJlLCBmb3IgCmV4YW1wbGUgYnkgY3Jl
YXRpbmcgcHJvYmUgdmVyc2lvbiBvZiBhbGwgcmVzb3VyY2UgZ2V0IGZ1bmN0aW9ucyksIGl0IAp3
aWxsIHJlcXVpcmUgbXVjaCBtb3JlIGNoYW5nZXMgYnV0IGZpbmFsbHkgaXQgd2lsbCBsb29rIGxp
a2U6CgpyZXMgPSBkZXZtX2dldF9yZXNvdXJjZV9mcm9tX3Byb2JlKC4uLi4pCgppZiAoSVNfRVJS
KHJlcykpCgogwqDCoMKgIHJldHVybiBQVFJfRVJSKHJlcyk7Cgp2czoKCnJlcyA9IGRldm1fZ2V0
X3Jlc291cmNlKC4uLikKCmlmIChJU19FUlIocmVzKSkKCiDCoMKgwqAgcmV0dXJuIGRldl9lcnJf
cHJvYmUoZGV2LCBQVFJfRVJSKHJlcyksIC4uLik7CgoKUmVnYXJkcwoKQW5kcnplagoKCj4KPiBU
aGFua3MuCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
