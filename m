Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9ABE1CE5
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 15:39:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D6146EACF;
	Wed, 23 Oct 2019 13:39:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1ED16EACF
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 13:39:51 +0000 (UTC)
Received: from mail-qt1-f178.google.com ([209.85.160.178]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1N5VXu-1hvIqq0Q6U-016yUc for <dri-devel@lists.freedesktop.org>; Wed, 23
 Oct 2019 15:39:50 +0200
Received: by mail-qt1-f178.google.com with SMTP id m15so32388045qtq.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 06:39:49 -0700 (PDT)
X-Gm-Message-State: APjAAAX4cjgfHbuC5OIgFcPtB07aIJSTuHr/437bzr25A2NJUYcXPzzd
 hlteSwWgYODXtfxBBpxfc1CeVopx72rrdnq5nRs=
X-Google-Smtp-Source: APXvYqyt7m8OnGbGOfKvN6UapNf8Y0PixnD+b/5MFVO15QeK4AzpoE5xCHBxjuJT4OWklHgs4L5FWsrmt4sucJ53v+g=
X-Received: by 2002:ac8:18eb:: with SMTP id o40mr9289234qtk.304.1571837989082; 
 Wed, 23 Oct 2019 06:39:49 -0700 (PDT)
MIME-Version: 1.0
References: <20191010202802.1132272-1-arnd@arndb.de>
 <20191023131049.GG11048@pi3>
In-Reply-To: <20191023131049.GG11048@pi3>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 23 Oct 2019 15:39:32 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1v2-+geD+JbNP-t418ZjntQNSte4rt8c7N6sJdpb3+DQ@mail.gmail.com>
Message-ID: <CAK8P3a1v2-+geD+JbNP-t418ZjntQNSte4rt8c7N6sJdpb3+DQ@mail.gmail.com>
Subject: Re: [PATCH 00/36] ARM: samsung platform cleanup
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Provags-ID: V03:K1:1dagPp9jNoKe/lG3WdG78a8RiXLjGRbyGQPT8L+EShAp3mycH9l
 wGhKw58b23KEf+DT17o/Bz17YRkOqlqBA8v6WO1e81Au0/UIwLXO5wb4YPQpczOGkyNnqIf
 BbRtEIlYRSyhnuJI1hmZhxLdsIT3DJNSqZ9EaS5zTpV+RtymtVJSJDgq29EmneI0JdISJ6f
 yFvRAd3izwhCozQSYrcYQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:u6YAZN89rxY=:R3p57YLSQr7RTKnoDken+3
 K5Ob2rUHuK7aOnantEqKmMPPhjhcg/J9dy8WkhsK85M4rPlNmepiLaNOa0crcUtnDBSDeS7fr
 CqHkkHEwrpznWceyZOTBeQ8ac7oF61ZmpAtFecTzs4v7OPdr41hLO8u1Svi0ZaDBeiQVW9SBy
 WesjzkOjLyaelfJVOOqNGvNZNXV98DlMTS8xpB/ROXUjNI7TAHDGytZJQ1ldi+grYDg04oaLT
 SABTrEQpQ9ZJror4iyvCvZay3VPcEgbCe1h3zn9y06iXjN4vgXxZat/N3yuJf5p9SR9nYZ3QT
 FPBHnbHuCK88r4NxJlpVUtJUHMoclZ9fvlGwSVxLFvXQuqNQECShZ7le4BI6VzVL8kdBPrLbY
 mc9AdIxuhfHaWyFF4Q7NHjnN49UZtr5DShpQFGnrUA9Xh4o2c7zcz34YOb+etn/5rVRievE9V
 W9OQKYe/LMYTcoY8J9O4/9vhPfRehNNsWVoYRuymqyqzy9xlpvJNrJkpwL5loargbOXnGcDF+
 gfWiyPK2cEIP8x8mcgaVADASQrPMgZjxkJHMB9AdYbDBVhukbAuL1SARhX5lNcjgHd2xoqvxF
 MvTeUdsZrXJuTH75cO3Z+yIB1LsCnoO65AlBMQt1bIWz0N136ZeKFP9p5PwqIuCcGvVHGDSUm
 B2p8jmxjKLQpPZavubSq7zSepCXN/UpJoqDtJGMlBt1yeJC3DMVyoxNV9EbzmZspVoNOqyYd5
 iO8NcGQgZRSkOJ0TRNEFzFQ+kwDUYrMm5Dnp7gVxJlh7sV88Ai7d0Eilbyuv1qeZ19yigj2Az
 edx6BMLbp0cRqy6hSlEjD4V4t3x/TqcXNmFpqu2zyIuuFM7+8UDHkGqJcdb0CP4CZUCujkf9w
 4c6tc8uAEBfVbPiOuefg==
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
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org,
 "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 Lihua Yao <ylhuajnu@outlook.com>, Kukjin Kim <kgene@kernel.org>,
 linux-serial@vger.kernel.org,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
 Linux PWM List <linux-pwm@vger.kernel.org>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Linux PM list <linux-pm@vger.kernel.org>, Lihua Yao <ylhuajnu@163.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-hwmon@vger.kernel.org,
 patches@opensource.cirrus.com, USB list <linux-usb@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMzoxMSBQTSBLcnp5c3p0b2YgS296bG93c2tpIDxrcnpr
QGtlcm5lbC5vcmc+IHdyb3RlOgo+IE9uIFRodSwgT2N0IDEwLCAyMDE5IGF0IDEwOjI4OjAyUE0g
KzAyMDAsIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4gPiBUaGUgY29udGVudHMgYXJlIGF2YWlsYWJs
ZSBmb3IgdGVzdGluZyBpbgo+ID4KPiA+IGdpdDovL2tlcm5lbC5vcmc6L3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC9hcm5kL3BsYXlncm91bmQuZ2l0IHMzYy1tdWx0aXBsYXRmb3JtCj4KPiBXaGVu
IHNlbmRpbmcgdjIsIGNhbiB5b3UgQ2M6Cj4KPiBQYXdlxYIgQ2htaWVsIDxwYXdlbC5taWtvbGFq
LmNobWllbEBnbWFpbC5jb20+Cj4gTGlodWEgWWFvIDx5bGh1YWpudUBvdXRsb29rLmNvbT4KPiAo
b3IgTGlodWEgWWFvIDx5bGh1YWpudUAxNjMuY29tPiBpZiBvdXRsb29rLmNvbSBib3VuY2VzKQo+
IFNlcmdpbyBQcmFkbyA8c2VyZ2lvLnByYWRvQGUtbGFid29ya3MuY29tPgo+IFN5bHdlc3RlciBO
YXdyb2NraSA8cy5uYXdyb2NraUBzYW1zdW5nLmNvbT4KPgo+IFRoZXNlIGFyZSBmb2xrcyB3aGlj
aCB0byBteSBrbm93bGVkZ2UgaGFkIHdvcmtpbmcgUzNDIGFuZCBTNVAgYm9hcmRzCj4gc28gbWF5
YmUgdGhleSBjb3VsZCBwcm92aWRlIHRlc3RpbmcuCgpPaywgd2lsbCBkby4gSSd2ZSB1cGxvYWRl
ZCB0aGUgbW9kaWZpZWQgdmVyc2lvbiBiYXNlZCBvbiB5b3VyIGNvbW1lbnRzIHRvCnRoZSBhYm92
ZSBVUkwgZm9yIG5vdy4KCkknbGwgcHJvYmFibHkgZ2l2ZSBpdCBhIGxpdHRsZSBtb3JlIHRpbWUg
YmVmb3JlIHJlc2VuZGluZywgYnV0IHRoZXkKY291bGQgYWxyZWFkeQpzdGFydCB0ZXN0aW5nIHRo
YXQgdmVyc2lvbi4KClRoYW5rcyBhIGxvdCBmb3IgdGhlIHJldmlldyEKCiAgICAgIEFybmQKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
