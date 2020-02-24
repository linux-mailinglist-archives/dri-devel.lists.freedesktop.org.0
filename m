Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E5816A661
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 13:47:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC8886E45F;
	Mon, 24 Feb 2020 12:47:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 863856E45F;
 Mon, 24 Feb 2020 12:47:50 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id dc19so11719515edb.10;
 Mon, 24 Feb 2020 04:47:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6p1Rm/cgq3FqTcHGA+7QXUNsBMb6waSsaCWakkpOhMI=;
 b=tggnjTrjHiImxe2MkX+7io1dJy9jIh4exGDgMXpGPV98LuoIrxImQvP+h1sD4xSkIi
 bi9d9NGj4TgRAqGeJ+zzKsG1rNJN5yg428QTMCyf2iifCtg8ePRpRjqmx8WE2ZFMsAxN
 9mUTlVXiSzVgN3eQHhP6ELbZHB5KR40cGwz/BmlAKPHyYj2kWW/LcxgOP4uveJ8GYuW7
 jTq6Or70045ZNK18Mt2zYouJg2JK3FZkMT4WBLpdjGmjoZQyyKk68+8gTkxRop1UnsCQ
 EwaAmoEjnHdUXl7G/bwD4Xa5fvaMvyZEsgsSgdGYLGP1AsNEjErWsyjr+Kytu7SzEP1G
 r6pQ==
X-Gm-Message-State: APjAAAWaam2V0isRXf5yE5iAkQX7QfXqGYJQtDBN1Jj0yGiIxXYgFkDx
 Hvj2+i5LjM6DSTtUi1JLrO8=
X-Google-Smtp-Source: APXvYqxOCnjuqHzZ8w9dppB5X8CKpWu3LAO4qx3F7JuCo/1tjWWY0qRzHXx7PYmPGsjZ1wOThemeng==
X-Received: by 2002:a17:906:7fd0:: with SMTP id
 r16mr45290488ejs.319.1582548468870; 
 Mon, 24 Feb 2020 04:47:48 -0800 (PST)
Received: from pi3 ([194.230.155.125])
 by smtp.googlemail.com with ESMTPSA id n19sm944550edy.9.2020.02.24.04.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 04:47:48 -0800 (PST)
Date: Mon, 24 Feb 2020 13:47:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jiri Slaby <jirislaby@gmail.com>
Subject: Re: [RESEND PATCH v2 9/9] ath5k: Constify ioreadX() iomem argument
 (as in generic implementation)
Message-ID: <20200224124744.GA1949@pi3>
References: <20200219175007.13627-1-krzk@kernel.org>
 <20200219175007.13627-10-krzk@kernel.org>
 <518a9023-f802-17b3-fca5-582400bc34ae@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <518a9023-f802-17b3-fca5-582400bc34ae@gmail.com>
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
Cc: Rich Felker <dalias@libc.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Jason Wang <jasowang@redhat.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 netdev@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linux-arch@vger.kernel.org, Dave Jiang <dave.jiang@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 linux-sh@vger.kernel.org, Alexey Brodkin <abrodkin@synopsys.com>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, Nick Kossifidis <mickflemm@gmail.com>,
 Allen Hubbe <allenbh@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-alpha@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>, linux-parisc@vger.kernel.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 Jon Mason <jdmason@kudzu.us>, linux-ntb@googlegroups.com,
 Andrew Morton <akpm@linux-foundation.org>, linux-media@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBGZWIgMjAsIDIwMjAgYXQgMTA6NDg6MzNBTSArMDEwMCwgSmlyaSBTbGFieSB3cm90
ZToKPiBPbiAxOS4gMDIuIDIwLCAxODo1MCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiA+
IFRoZSBpb3JlYWRYKCkgaGVscGVycyBoYXZlIGluY29uc2lzdGVudCBpbnRlcmZhY2UuICBPbiBz
b21lIGFyY2hpdGVjdHVyZXMKPiA+IHZvaWQgKl9faW9tZW0gYWRkcmVzcyBhcmd1bWVudCBpcyBh
IHBvaW50ZXIgdG8gY29uc3QsIG9uIHNvbWUgbm90Lgo+ID4gCj4gPiBJbXBsZW1lbnRhdGlvbnMg
b2YgaW9yZWFkWCgpIGRvIG5vdCBtb2RpZnkgdGhlIG1lbW9yeSB1bmRlciB0aGUgYWRkcmVzcwo+
ID4gc28gdGhleSBjYW4gYmUgY29udmVydGVkIHRvIGEgImNvbnN0IiB2ZXJzaW9uIGZvciBjb25z
dC1zYWZldHkgYW5kCj4gPiBjb25zaXN0ZW5jeSBhbW9uZyBhcmNoaXRlY3R1cmVzLgo+ID4gCj4g
PiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+Cj4g
PiBBY2tlZC1ieTogS2FsbGUgVmFsbyA8a3ZhbG9AY29kZWF1cm9yYS5vcmc+Cj4gPiAtLS0KPiA+
ICBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoNWsvYWhiLmMgfCAxMCArKysrKy0tLS0tCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiA+IAo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGg1ay9haGIuYyBiL2Ry
aXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGg1ay9haGIuYwo+ID4gaW5kZXggMmM5Y2VjOGI1M2Q5
Li44YmQwMWRmMzY5ZmIgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgv
YXRoNWsvYWhiLmMKPiA+ICsrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGg1ay9haGIu
Ywo+ID4gQEAgLTEzOCwxOCArMTM4LDE4IEBAIHN0YXRpYyBpbnQgYXRoX2FoYl9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gIAo+ID4gIAlpZiAoYmNmZy0+ZGV2aWQgPj0g
QVI1S19TUkVWX0FSMjMxNV9SNikgewo+ID4gIAkJLyogRW5hYmxlIFdNQUMgQUhCIGFyYml0cmF0
aW9uICovCj4gPiAtCQlyZWcgPSBpb3JlYWQzMigodm9pZCBfX2lvbWVtICopIEFSNUtfQVIyMzE1
X0FIQl9BUkJfQ1RMKTsKPiA+ICsJCXJlZyA9IGlvcmVhZDMyKChjb25zdCB2b2lkIF9faW9tZW0g
KikgQVI1S19BUjIzMTVfQUhCX0FSQl9DVEwpOwo+IAo+IFdoaWxlIEkgdW5kZXJzdGFuZCB3aHkg
dGhlIHBhcmFtZXRlciBvZiBpb3JlYWQzMiBzaG91bGQgYmUgY29uc3QsIEkKPiBkb24ndCBzZWUg
YSByZWFzb24gZm9yIHRoZXNlIGNhc3RzIG9uIHRoZSB1c2Vycycgc2lkZS4gV2hhdCBkb2VzIGl0
Cj4gYnJpbmcgZXhjZXB0IGxvbmdlciBjb2RlIHRvIHJlYWQ/CgpCZWNhdXNlIHRoZSBhcmd1bWVu
dCBpcyBhbiBpbnQ6Cgpkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoNWsvYWhiLmM6IEluIGZ1
bmN0aW9uIOKAmGF0aF9haGJfcHJvYmXigJk6CmRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGg1
ay9haGIuYzoxNDE6MTg6IHdhcm5pbmc6IHBhc3NpbmcgYXJndW1lbnQgMSBvZiDigJhpb3JlYWQz
MuKAmSBtYWtlcyBwb2ludGVyIGZyb20gaW50ZWdlciB3aXRob3V0IGEgY2FzdCBbLVdpbnQtY29u
dmVyc2lvbl0KICAgcmVnID0gaW9yZWFkMzIoQVI1S19BUjIzMTVfQUhCX0FSQl9DVEwpOwoKQmVz
dCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
