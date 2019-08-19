Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BD895875
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 09:31:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF3AB6E5F3;
	Tue, 20 Aug 2019 07:30:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net
 [194.109.24.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04CD66E0DD;
 Mon, 19 Aug 2019 12:01:10 +0000 (UTC)
Received: from [192.168.2.10] ([46.9.232.237])
 by smtp-cloud7.xs4all.net with ESMTPA
 id zgLGhBcThThuuzgLKhW3k2; Mon, 19 Aug 2019 14:01:09 +0200
Subject: Re: [PATCH v7 0/9] drm: cec: convert DRM drivers to the new notifier
 API
To: Dariusz Marcinkiewicz <darekm@google.com>
References: <20190814104520.6001-1-darekm@google.com>
 <42c7ef3c-b7e5-8c63-c7c2-bfc6c56100c6@xs4all.nl>
 <CALFZZQHu1C_8idxkwjBdxpW=y9gKmDnLOeTHZ9iAkNo7YubZHg@mail.gmail.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <04c7dcb9-d5b1-804f-959e-d953dec9f937@xs4all.nl>
Date: Mon, 19 Aug 2019 14:00:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CALFZZQHu1C_8idxkwjBdxpW=y9gKmDnLOeTHZ9iAkNo7YubZHg@mail.gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfFV3jVCXFwOEmTkQx82eRsQbIhJkR81Nq+PQ7+JIxD7SfeDf16QIlfyskYXOROnMUb1Xtz63nmAd+iRuAvv3lI+kSlWyeIEhZqUxAxunUBgSNPsIh0RS
 mjy/qEor/1jPIWCs++cE11cKIMSmJG6MIRet1GEXPjDRkJmQp+a35H+MmUUZQwTTR1+nKE21+e8g8uyyOC+brrm8l7IGJzM2xkjZnb2phy+jJaFPjeDphiq2
 wJGwcAxVj3hzR83+NKHB9G1k+vXw4aQ/MzI9QM2Rfexrr6SfKwhQNC+fwINRnkI5GRv/KsnG7Cp4puXP7DO5yBdGoVSWgH5CmENYnS/eKuSiU5EKfP9JydOZ
 0TeBKSmPe/yG2uEbKvOEhTbYTbxGExNNS3gikvrlFuX507yqvyqZgFfwXyscLCN6ETQlF3KcmsvXjIEPG2ihAzWWYLVIBTio1TyMSJGFEmpBY+moeHhgCKd5
 QCLNKE3tEPzrfY+D5ZHPBjzAXkNtyO8+jlsRa+grS9TcaYqHwmBRDX2sgu0n8SZpiRaKUQ8CUNelmd1dDTk5FXZ7tHD5MJDPHi0zvxN/SpPt23kTbWgKE5gU
 aHY/WwWjcm4lJ0BmDIdybu6YMud1jvX5At1xRAcdF5JQLSwQhzz5AnH7cbrjV+1SzM7/DENC5sFV2ym2htRgqEjwdJM7u7CUJiwVR94R62DkJg6QWcOJHjBj
 uj7LoLdwv94P1jm8zrEIn7g9nvYCZ4fPudE4xn05aUnlExieWaDmbS/aVLlYRiO3bkOp2FM2h+aMgsglzWIlUPh8/AZedUNJMF/tXdaiya9WyxwwUd0C/0s4
 RXKALAxZpKpCHYKLuvsjLjpNepoDePmgax++EIwE0VSgQkiULQDut+CklRWpNuVjs7K3YW7QhaV5TJs7hbD+zcHGBx9U78V8DDOrC94VW5aZ28ZEfOZ0uzgP
 8OQfTYKMg0Nl1M+kmnceE4SHiS/votNR2zN+llnit1yPqD/1wvVTcJn27TGpY7LISvFLMAUQAscfevNJq/YrgAg/YmxNJ5d4U5TH2TEQp2j6XqjB3e9Qv7oJ
 0UATqeHOZxCLGn6HGA3HDZ2pf1HIPj7fEDp02kgtojum+Qn3UuBmxKGnRQMJwwdYeIW0SvKuLMbKexAZHG2NCcawo8nAu7IqARHW7s0L/zTRIfNsao7ZFqyj
 i0dvT/P6zEDeItI9/vwF0nf9pPt0uzcREtdYflMFe+g1eRvv3+mCICN6r+bpv9SpijR9E13MwmlLVWnwDZNrTnqAOTC59SJBNJbLXkod0WXHvsxMxlJsiNS/
 NfACYT3H/B23rUIEn6UEcxP8Ddn00V3hDKUI1JC79+04/vTSsf4xZJKfVa3/jcHwzPkXnn8XxBuHr+xznAKCVi/mo5fXLuU8O8Z3XpZ1daQ0o3df/YsgVwHH
 lOIZa4FuohIX5ifk
X-Mailman-Approved-At: Tue, 20 Aug 2019 07:30:56 +0000
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-samsung-soc@vger.kernel.org,
 David Francis <David.Francis@amd.com>, amd-gfx@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, "Jerry \(Fangzhi\) Zuo" <Jerry.Zuo@amd.com>,
 Allison Randal <allison@lohutok.net>, nouveau@lists.freedesktop.org,
 linux-media@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 Russell King <rmk+kernel@armlinux.org.uk>, Sean Paul <seanpaul@chromium.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Thomas Lim <Thomas.Lim@amd.com>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>, Enrico Weigelt <info@metux.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8xOS8xOSAxOjI4IFBNLCBEYXJpdXN6IE1hcmNpbmtpZXdpY3ogd3JvdGU6Cj4gT24gTW9u
LCBBdWcgMTksIDIwMTkgYXQgMTE6MzggQU0gSGFucyBWZXJrdWlsIDxodmVya3VpbC1jaXNjb0B4
czRhbGwubmw+IHdyb3RlOgo+Pgo+PiBIaSBhbGwsCj4+Cj4gSGkgSGFucy4KPj4gVGhlIHBhdGNo
ZXMgaW4gdGhpcyBzZXJpZXMgY2FuIGJlIGFwcGxpZWQgaW5kZXBlbmRlbnRseSBmcm9tIGVhY2gg
b3RoZXIuCj4+Cj4+IElmIHlvdSBtYWludGFpbiBvbmUgb2YgdGhlc2UgZHJpdmVycyBhbmQgeW91
IHdhbnQgdG8gbWVyZ2UgaXQgZm9yIHY1LjQKPj4geW91cnNlbGYsIHRoZW4gcGxlYXNlIGRvIHNv
IGFuZCBsZXQgbWUga25vdy4gSWYgeW91IHByZWZlciBJIGNvbW1pdCBpdAo+PiB0byBkcm0tbWlz
YywgdGhlbiBwbGVhc2UgcmV2aWV3IGFuZCAoaG9wZWZ1bGx5KSBBY2sgdGhlIHBhdGNoLgo+Pgo+
PiBJIHdvdWxkIHJlYWxseSBsaWtlIHRvIGdldCB0aGlzIGluIGZvciB2NS40IHNvIEkgY2FuIGdl
dCB0aGUgdXNlcnNwYWNlCj4+IGJpdHMgaW4gZm9yIHY1LjQgYXMgd2VsbCB0aHJvdWdoIHRoZSBt
ZWRpYSBzdWJzeXN0ZW0uCj4+Cj4+IERhcml1c3osIGNhbiB5b3UgcG9zdCBhIHY3LjEgZm9yIHBh
dGNoIDUvOSBmaXhpbmcgdGhlIHR5cG8/Cj4+Cj4gRG9uZS4KPiAKPiBJIHRoaW5rIGl0IHdvdWxk
IGJlIGdvb2QgdG8gdGVzdCB2NyBjaGFuZ2VzIHRvIGR3LWhkbWkgYW5kIHRkYTk5OHggb24KPiBh
IHJlYWwgaGFyZHdhcmUuIEhhbnMsIGRvIHlvdSB0aGluayB5b3Ugd291bGQgYmUgYWJsZSB0byB0
ZXN0IHRob3NlPwo+IAo+IFRoYW5rIHlvdS4KPiAKCkknbGwgdHJ5IHRvIGRvIHRoaXMgZm9yIGR3
LWhkbWkgdG9kYXksIGJ1dCB0aGUgdGRhOTk4eCB0ZXN0aW5nIHdpbGwgaGF2ZSB0byB3YWl0CnVu
dGlsIG5leHQgd2Vlay4KClJlZ2FyZHMsCgoJSGFucwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
