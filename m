Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F45316A8B6
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 15:44:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA8B6E519;
	Mon, 24 Feb 2020 14:44:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A436E519;
 Mon, 24 Feb 2020 14:44:20 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id t7so12164072edr.4;
 Mon, 24 Feb 2020 06:44:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=9BiQIzqw1g4Lc7fCMo41b2Sms1ZkrHji7czRtN4yRpY=;
 b=mLk7wyDJYg4qcJaXF1Qhmh8OWJqGeZ/q477fU82Xc6YA5qJ+xWbcDN0XTsr0B2/5Dj
 2OhmA/jfHfCZF4ofl1pGchJcivbXx+AOQzEv/tRSet0wdTGbbB0YDN4YMzybisE9ZcWk
 znaomTV7NdcEiGMKOYXEm7CVmyf10KVVKPZ/7HhNKp4c4wZv3BfUOByTlp4YgUW49Wgq
 bzrgkOLxwJqkAOCiinkyIAM/fS6HNN9ALTolBLyz1LixOH4Abrv+1TATyVwZpbLkxuNA
 gY1BHTd4EG2b5nXp60sVhfBbLeAAi413nb6gr8xFAq4wi0RR//q46Dd6jPHuZBqz2ud9
 i0MA==
X-Gm-Message-State: APjAAAU3rzdAf01P8bHnR8zm9GGfMiLbGoTrtlwOUcN0VQiATiRw1pT5
 5gMGOoMatc2WwzVlC2HlYuQ=
X-Google-Smtp-Source: APXvYqzwji2Ykgei/T3ukpc15pByx2S09B2SSkaAFB5FVLPyRnARm/VtcP3TWvca57zCxPIFcvsdrw==
X-Received: by 2002:a17:906:5604:: with SMTP id
 f4mr47998768ejq.255.1582555459077; 
 Mon, 24 Feb 2020 06:44:19 -0800 (PST)
Received: from pi3 ([194.230.155.125])
 by smtp.googlemail.com with ESMTPSA id a10sm961255edt.50.2020.02.24.06.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 06:44:17 -0800 (PST)
Date: Mon, 24 Feb 2020 15:44:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RESEND PATCH v2 9/9] ath5k: Constify ioreadX() iomem argument
 (as in generic implementation)
Message-ID: <20200224144413.GA2054@pi3>
References: <20200219175007.13627-1-krzk@kernel.org>
 <20200219175007.13627-10-krzk@kernel.org>
 <518a9023-f802-17b3-fca5-582400bc34ae@gmail.com>
 <20200224124744.GA1949@pi3>
 <CAMuHMdVev0PLF=8bD3nHrhcU9UgM-DAgdQpXi09PgvAxdbt24A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdVev0PLF=8bD3nHrhcU9UgM-DAgdQpXi09PgvAxdbt24A@mail.gmail.com>
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Jason Wang <jasowang@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 netdev <netdev@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 Linux-Arch <linux-arch@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Matt Turner <mattst88@gmail.com>, arcml <linux-snps-arc@lists.infradead.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, alpha <linux-alpha@vger.kernel.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>,
 Parisc List <linux-parisc@vger.kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jon Mason <jdmason@kudzu.us>,
 linux-ntb@googlegroups.com, Andrew Morton <akpm@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgMDE6NTQ6MDBQTSArMDEwMCwgR2VlcnQgVXl0dGVyaG9l
dmVuIHdyb3RlOgo+IEhpIEtyenlzenRvZiwKPiAKPiBPbiBNb24sIEZlYiAyNCwgMjAyMCBhdCAx
OjQ3IFBNIEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiBP
biBUaHUsIEZlYiAyMCwgMjAyMCBhdCAxMDo0ODozM0FNICswMTAwLCBKaXJpIFNsYWJ5IHdyb3Rl
Ogo+ID4gPiBPbiAxOS4gMDIuIDIwLCAxODo1MCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToK
PiA+ID4gPiBUaGUgaW9yZWFkWCgpIGhlbHBlcnMgaGF2ZSBpbmNvbnNpc3RlbnQgaW50ZXJmYWNl
LiAgT24gc29tZSBhcmNoaXRlY3R1cmVzCj4gPiA+ID4gdm9pZCAqX19pb21lbSBhZGRyZXNzIGFy
Z3VtZW50IGlzIGEgcG9pbnRlciB0byBjb25zdCwgb24gc29tZSBub3QuCj4gPiA+ID4KPiA+ID4g
PiBJbXBsZW1lbnRhdGlvbnMgb2YgaW9yZWFkWCgpIGRvIG5vdCBtb2RpZnkgdGhlIG1lbW9yeSB1
bmRlciB0aGUgYWRkcmVzcwo+ID4gPiA+IHNvIHRoZXkgY2FuIGJlIGNvbnZlcnRlZCB0byBhICJj
b25zdCIgdmVyc2lvbiBmb3IgY29uc3Qtc2FmZXR5IGFuZAo+ID4gPiA+IGNvbnNpc3RlbmN5IGFt
b25nIGFyY2hpdGVjdHVyZXMuCj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0
b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+Cj4gPiA+ID4gQWNrZWQtYnk6IEthbGxlIFZh
bG8gPGt2YWxvQGNvZGVhdXJvcmEub3JnPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICBkcml2ZXJzL25l
dC93aXJlbGVzcy9hdGgvYXRoNWsvYWhiLmMgfCAxMCArKysrKy0tLS0tCj4gPiA+ID4gIDEgZmls
ZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gPiA+ID4KPiA+ID4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDVrL2FoYi5jIGIvZHJp
dmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDVrL2FoYi5jCj4gPiA+ID4gaW5kZXggMmM5Y2VjOGI1
M2Q5Li44YmQwMWRmMzY5ZmIgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxl
c3MvYXRoL2F0aDVrL2FoYi5jCj4gPiA+ID4gKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRo
L2F0aDVrL2FoYi5jCj4gPiA+ID4gQEAgLTEzOCwxOCArMTM4LDE4IEBAIHN0YXRpYyBpbnQgYXRo
X2FoYl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gPiA+Cj4gPiA+ID4g
ICAgIGlmIChiY2ZnLT5kZXZpZCA+PSBBUjVLX1NSRVZfQVIyMzE1X1I2KSB7Cj4gPiA+ID4gICAg
ICAgICAgICAgLyogRW5hYmxlIFdNQUMgQUhCIGFyYml0cmF0aW9uICovCj4gPiA+ID4gLSAgICAg
ICAgICAgcmVnID0gaW9yZWFkMzIoKHZvaWQgX19pb21lbSAqKSBBUjVLX0FSMjMxNV9BSEJfQVJC
X0NUTCk7Cj4gPiA+ID4gKyAgICAgICAgICAgcmVnID0gaW9yZWFkMzIoKGNvbnN0IHZvaWQgX19p
b21lbSAqKSBBUjVLX0FSMjMxNV9BSEJfQVJCX0NUTCk7Cj4gPiA+Cj4gPiA+IFdoaWxlIEkgdW5k
ZXJzdGFuZCB3aHkgdGhlIHBhcmFtZXRlciBvZiBpb3JlYWQzMiBzaG91bGQgYmUgY29uc3QsIEkK
PiA+ID4gZG9uJ3Qgc2VlIGEgcmVhc29uIGZvciB0aGVzZSBjYXN0cyBvbiB0aGUgdXNlcnMnIHNp
ZGUuIFdoYXQgZG9lcyBpdAo+ID4gPiBicmluZyBleGNlcHQgbG9uZ2VyIGNvZGUgdG8gcmVhZD8K
PiA+Cj4gPiBCZWNhdXNlIHRoZSBhcmd1bWVudCBpcyBhbiBpbnQ6Cj4gPgo+ID4gZHJpdmVycy9u
ZXQvd2lyZWxlc3MvYXRoL2F0aDVrL2FoYi5jOiBJbiBmdW5jdGlvbiDigJhhdGhfYWhiX3Byb2Jl
4oCZOgo+ID4gZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDVrL2FoYi5jOjE0MToxODogd2Fy
bmluZzogcGFzc2luZyBhcmd1bWVudCAxIG9mIOKAmGlvcmVhZDMy4oCZIG1ha2VzIHBvaW50ZXIg
ZnJvbSBpbnRlZ2VyIHdpdGhvdXQgYSBjYXN0IFstV2ludC1jb252ZXJzaW9uXQo+ID4gICAgcmVn
ID0gaW9yZWFkMzIoQVI1S19BUjIzMTVfQUhCX0FSQl9DVEwpOwo+IAo+IFRoYXQncyBhbiBhcmd1
bWVudCBmb3Iga2VlcGluZyB0aGUgY2FzdCB0byAidm9pZCBfX2lvbWVtICoiLCBub3QgZm9yCj4g
YWRkaW5nIHRoZSAiY29uc3QiLCByaWdodD8KClllcywgY29ycmVjdC4gTWF5YmUgSSBtaXN1bmRl
cnN0b29kIHRoZSBxdWVzdGlvbi4uLiBUaGUgY29uc3Qgb24gdGhlCm90aGVyIGhhbmQgZG9lcyBu
b3QgaGF2ZSB0byBiZSBpbiB0aGUgY2FzdC4gSXQgaXMgbWVyZWx5IGZvciBtYWtpbmcgaXQKY29u
c2lzdGVudCB3aXRoIGludGVyZmFjZS4gSXQgaXMgbm90IHJlcXVpcmVkLiBJIGFsc28gbWVudGlv
bmVkIGl0IGluCnRoZSBjb3ZlciBsZXR0ZXI6CiJQQXRjaGVzIDUtOSBhcmUgb3B0aW9uYWwgY2xl
YW51cCwgd2l0aG91dCBhY3R1YWwgaW1wYWN0IgoKRmVlbCBmcmVlIHRvIGlnbm9yZSB0aGlzIG9u
ZSBpZiBpdCBpcyBub3Qgd29ydGggdGhlIGVmZm9ydC4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9m
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
