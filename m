Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D457EED6
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:20:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C39D6ED24;
	Fri,  2 Aug 2019 08:19:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86BFE89D8A;
 Wed, 31 Jul 2019 12:25:29 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id s3so60575279wms.2;
 Wed, 31 Jul 2019 05:25:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=R7XjVu1Q+2t2OCDbFe6JERwCgU5GBze4iS/iecgn0V8=;
 b=rdXal3Lywx3wUcfJ5C9wn1c5m7CgD6QARg5KlHtwCQpbi+Ludd+uI+tz+YpkO7zMrl
 NM70LqnQsqjyHk96v0p4iaId3KjDNjJUaXZsjwaB5UJrvNL3qqHxgDbJqvLkegJlt4Ro
 Gtvs3MtVTxvqpD85aVxbVAes5Cmy/cy77SxAdt+MYVNLp1v9zvn/hcAOcFhKgFk/EqU/
 wHdbCrr97jGOJq5sXZvBy++jv5EMLKp05+i/5N+xYUI/BwnxU2zgdRXE3yhKh3hTDv17
 D3Si4TrTse5GiJ1spn/uEWix6T08v9UIrIIzZTDNtqVa8CsSijXAtd3N9KO3PcBH2Mxo
 Hgww==
X-Gm-Message-State: APjAAAUsSHylKuB8S3bgA81EkUeGC4qdsdp9whnMj4Q38HdAjlJDmx57
 IVoS18yC++kwMplaU6PLkd1RA/zC2stuM2Jugw8=
X-Google-Smtp-Source: APXvYqxVxxud91q/SIqbQpYtC/q0uxNH7WkuOed0ZaYA+0PM53Kfn+D5yFaPrxj3KUv3RfPJ5OTpAibDIA5CSzzdAX4=
X-Received: by 2002:a05:600c:225a:: with SMTP id
 a26mr116610265wmm.81.1564575928122; 
 Wed, 31 Jul 2019 05:25:28 -0700 (PDT)
MIME-Version: 1.0
References: <51a4155c5bc2ca847a9cbe85c1c11918bb193141.1564086017.git.jpoimboe@redhat.com>
 <alpine.DEB.2.21.1907252355150.1791@nanos.tec.linutronix.de>
 <156416793450.30723.5556760526480191131@skylake-alporthouse-com>
 <alpine.DEB.2.21.1907262116530.1791@nanos.tec.linutronix.de>
 <156416944205.21451.12269136304831943624@skylake-alporthouse-com>
In-Reply-To: <156416944205.21451.12269136304831943624@skylake-alporthouse-com>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Wed, 31 Jul 2019 14:25:16 +0200
Message-ID: <CA+icZUXwBFS-6e+Qp4e3PhnRzEHvwdzWtS6OfVsgy85R5YNGOg@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: Remove redundant user_access_end() from
 __copy_from_user() error path
To: Chris Wilson <chris@chris-wilson.co.uk>
X-Mailman-Approved-At: Fri, 02 Aug 2019 08:19:03 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=R7XjVu1Q+2t2OCDbFe6JERwCgU5GBze4iS/iecgn0V8=;
 b=ILVqBg5GPvAXj+lG/yEYdWeBKdGfPf7klH1okvhPhvnvb56wHJqAaW0GTzAQ43hwpt
 UxwLHzao3BquJGq/4xOCWUk71gXgNoo+/p+ol0oMYVO5IW4jw5hKTjtOBAN6Fntkw7PE
 uGMwYlJQ1Co/C40XS43b+Q8gf7vJk6FB8Yaw7GUM2YBJC7VdSg+KDY9SZFU44ZE2bGPk
 apKjXkVv7Iem1UUgP5gBQQvUPrUX9UGQ9NGF0qfrAGM1TiuOjBpSNPVigkiwmXYl6JeQ
 wYlTMMqesR7sW9CB2Ci3cX0dkE5HFlAVPnepRNx0yXNI2Awp2K7EFrZeRDaxOSGX6+ZE
 ENlg==
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
Reply-To: sedat.dilek@gmail.com
Cc: Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 intel-gfx@lists.freedesktop.org, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgOTozMCBQTSBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlz
LXdpbHNvbi5jby51az4gd3JvdGU6Cj4KPiBRdW90aW5nIFRob21hcyBHbGVpeG5lciAoMjAxOS0w
Ny0yNiAyMDoxODozMikKPiA+IE9uIEZyaSwgMjYgSnVsIDIwMTksIENocmlzIFdpbHNvbiB3cm90
ZToKPiA+ID4gUXVvdGluZyBUaG9tYXMgR2xlaXhuZXIgKDIwMTktMDctMjUgMjI6NTU6NDUpCj4g
PiA+ID4gT24gVGh1LCAyNSBKdWwgMjAxOSwgSm9zaCBQb2ltYm9ldWYgd3JvdGU6Cj4gPiA+ID4K
PiA+ID4gPiA+IE9ianRvb2wgcmVwb3J0czoKPiA+ID4gPiA+Cj4gPiA+ID4gPiAgIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9leGVjYnVmZmVyLm86IHdhcm5pbmc6IG9ianRvb2w6
IC5hbHRpbnN0cl9yZXBsYWNlbWVudCsweDM2OiByZWR1bmRhbnQgVUFDQ0VTUyBkaXNhYmxlCj4g
PiA+ID4gPgo+ID4gPiA+ID4gX19jb3B5X2Zyb21fdXNlcigpIGFscmVhZHkgZG9lcyBib3RoIFNU
QUMgYW5kIENMQUMsIHNvIHRoZQo+ID4gPiA+ID4gdXNlcl9hY2Nlc3NfZW5kKCkgaW4gaXRzIGVy
cm9yIHBhdGggYWRkcyBhbiBleHRyYSB1bm5lY2Vzc2FyeSBDTEFDLgo+ID4gPiA+ID4KPiA+ID4g
PiA+IEZpeGVzOiAwYjJjOGY4YjZiMGMgKCJpOTE1OiBmaXggbWlzc2luZyB1c2VyX2FjY2Vzc19l
bmQoKSBpbiBwYWdlIGZhdWx0IGV4Y2VwdGlvbiBjYXNlIikKPiA+ID4gPiA+IFJlcG9ydGVkLWJ5
OiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KPiA+ID4gPiA+IFJlcG9ydGVk
LWJ5OiBTZWRhdCBEaWxlayA8c2VkYXQuZGlsZWtAZ21haWwuY29tPgo+ID4gPiA+ID4gQWNrZWQt
Ynk6IFBldGVyIFppamxzdHJhIChJbnRlbCkgPHBldGVyekBpbmZyYWRlYWQub3JnPgo+ID4gPiA+
ID4gVGVzdGVkLWJ5OiBOaWNrIERlc2F1bG5pZXJzIDxuZGVzYXVsbmllcnNAZ29vZ2xlLmNvbT4K
PiA+ID4gPiA+IFRlc3RlZC1ieTogU2VkYXQgRGlsZWsgPHNlZGF0LmRpbGVrQGdtYWlsLmNvbT4K
PiA+ID4gPiA+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9DbGFuZ0J1aWx0TGludXgvbGludXgv
aXNzdWVzLzYxNwo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSm9zaCBQb2ltYm9ldWYgPGpwb2lt
Ym9lQHJlZGhhdC5jb20+Cj4gPiA+ID4KPiA+ID4gPiBSZXZpZXdlZC1ieTogVGhvbWFzIEdsZWl4
bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+Cj4gPiA+Cj4gPiA+IFdoaWNoIHRyZWUgZG8geW91IHBs
YW4gdG8gYXBwbHkgaXQgdG8/IEkgY2FuIHB1dCBpbiBkcm0taW50ZWwsIGFuZCB3aXRoCj4gPiA+
IHRoZSBmaXhlcyB0YWcgaXQgd2lsbCBwZXJjb2xhdGUgdGhyb3VnaCB0byA1LjMgYW5kIGJleW9u
ZCwgYnV0IGlmIHlvdQo+ID4gPiB3YW50IHRvIGFwcGx5IGl0IGRpcmVjdGx5IHRvIHNxdWFzaCB0
aGUgYnVpbGQgd2FybmluZ3MsIGZlZWwgZnJlZS4KPiA+Cj4gPiBJdCB3b3VsZCBiZSBuaWNlIHRv
IGdldCBpdCBpbnRvIDUuMy4gSSBjYW4gcm91dGUgaXQgbGludXh3YXJkcyBpZiB5b3UgZ2l2ZQo+
ID4gYW4gQWNrZWQtYnksIGJ1dCBJJ20gaGFwcHkgdG8gaGFuZCBpdCB0byB5b3UgOikKPgo+IEFj
a2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KClRob21hcyBk
aWQgeW91IHRha2UgdGhpcyB0aHJvdWdoIHRpcCB0cmVlIGFmdGVyIENocmlzJyBBQ0s/CgotIFNl
ZGF0IC0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
