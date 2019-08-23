Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CD69B4D8
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 18:48:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C72D6ECF3;
	Fri, 23 Aug 2019 16:48:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E676ECF3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 16:48:21 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id y8so5876785plr.12
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 09:48:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=shB6SKOCWrivD7S412WveV0DXQGCOHDXUApJqsM/wlA=;
 b=dK6EYP7fT/zLkP7Qe3eIHsRKLLJA8Y2oanCF1dJN04q5wGA6Eyp64ju8XUDeT0eLaz
 jOBZG8frggvsz6hv3BtISTKN85KXR9kZ+aEcO2HKJNHR6AmVcI9gEwJMjcqY8yFS3vMa
 nn6QBS9aStTsjjZ7Sy1Nh9scj3uC8+T+nf7oghlzydk8Y5xQGvpdu2IfT29kZ/+Hd+Nb
 OR6oZmWRKw2sm2j8JYMVGVP1uapXhXAjz9CmsB67+zhqNQ0zTEvEKcVUfMWVCWJUvUj2
 byBJGkpVqPRYUAWO1Gwn/0f7nj8Mx9laIFgIVGuDxtlEX4v3VNwk6Z/8n0vq4e66Pjl0
 dr5Q==
X-Gm-Message-State: APjAAAXSvH6XdyXTk1N4D2F0+oDVCWjZrtTd3TXFIa+L8fiwjJjXxpGl
 XR6u7L+7HbYGKjPu6Om5mNEpyuT11lc01yexgsC4fw==
X-Google-Smtp-Source: APXvYqyVqeK74/JWJUZ7pW5UAwhfOe02PTG6GeE5ufM2yWENnaiC/3vIkdv/0Gau1b+w32MpN7Tbr1pv4cTuRxiXwSc=
X-Received: by 2002:a17:902:169:: with SMTP id
 96mr5617305plb.297.1566578900191; 
 Fri, 23 Aug 2019 09:48:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190820232046.50175-1-brendanhiggins@google.com>
 <20190820232046.50175-2-brendanhiggins@google.com>
 <7f2c8908-75f6-b793-7113-ad57c51777ce@kernel.org>
In-Reply-To: <7f2c8908-75f6-b793-7113-ad57c51777ce@kernel.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 23 Aug 2019 09:48:08 -0700
Message-ID: <CAFd5g44mRK9t4f58i_YMEt=e9RTxwrrhFY_V2LW_E7bUwR3cdg@mail.gmail.com>
Subject: Re: [PATCH v14 01/18] kunit: test: add KUnit test runner core
To: shuah <shuah@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=shB6SKOCWrivD7S412WveV0DXQGCOHDXUApJqsM/wlA=;
 b=Ompr7qYsU3e4pxkTUvcGDfd4ML8vgFjnLheqC9j82bJxX2WMtGNPBrUA1tpfZZ7kkl
 2MlcYLnijPbPInvIsR6zoBG80ArVaqo/qH8Nz2C1fLluKeQqMKpdn1Isx73kDPRrmtfA
 uzlQbv8SAmt8wmBgLzDRa1pCbkLXVUC7pw3IzF7X6tCUWtvjtpbvC0Rxd012AHX4+phE
 8vFfpItPxvkt5HF2AluYoxPT8xW+p0eqWdqhZxhn3iXjphBqdQMERaOSG3vodu0lrJ5X
 dliaDAtQHPNKh2+Qm2AedTz/hBlaONpPrX2iSmH0iODNpBCdBlLEBbRkV7kNpmjj1hL+
 ogpQ==
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
Cc: Petr Mladek <pmladek@suse.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Amir Goldstein <amir73il@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 linux-nvdimm <linux-nvdimm@lists.01.org>, Kevin Hilman <khilman@baylibre.com>,
 Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-kbuild <linux-kbuild@vger.kernel.org>, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Josh Poimboeuf <jpoimboe@redhat.com>, kunit-dev@googlegroups.com,
 Theodore Ts'o <tytso@mit.edu>, Richard Weinberger <richard@nod.at>,
 Stephen Boyd <sboyd@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgODozMyBBTSBzaHVhaCA8c2h1YWhAa2VybmVsLm9yZz4g
d3JvdGU6Cj4KPiBIaSBCcmVuZGFuLAo+Cj4gT24gOC8yMC8xOSA1OjIwIFBNLCBCcmVuZGFuIEhp
Z2dpbnMgd3JvdGU6Cj4gPiBBZGQgY29yZSBmYWNpbGl0aWVzIGZvciBkZWZpbmluZyB1bml0IHRl
c3RzOyB0aGlzIHByb3ZpZGVzIGEgY29tbW9uIHdheQo+ID4gdG8gZGVmaW5lIHRlc3QgY2FzZXMs
IGZ1bmN0aW9ucyB0aGF0IGV4ZWN1dGUgY29kZSB3aGljaCBpcyB1bmRlciB0ZXN0Cj4gPiBhbmQg
ZGV0ZXJtaW5lIHdoZXRoZXIgdGhlIGNvZGUgdW5kZXIgdGVzdCBiZWhhdmVzIGFzIGV4cGVjdGVk
OyB0aGlzIGFsc28KPiA+IHByb3ZpZGVzIGEgd2F5IHRvIGdyb3VwIHRvZ2V0aGVyIHJlbGF0ZWQg
dGVzdCBjYXNlcyBpbiB0ZXN0IHN1aXRlcyAoaGVyZQo+ID4gd2UgY2FsbCB0aGVtIHRlc3RfbW9k
dWxlcykuCj4gPgo+ID4gSnVzdCBkZWZpbmUgdGVzdCBjYXNlcyBhbmQgaG93IHRvIGV4ZWN1dGUg
dGhlbSBmb3Igbm93OyBzZXR0aW5nCj4gPiBleHBlY3RhdGlvbnMgb24gY29kZSB3aWxsIGJlIGRl
ZmluZWQgbGF0ZXIuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQnJlbmRhbiBIaWdnaW5zIDxicmVu
ZGFuaGlnZ2luc0Bnb29nbGUuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IEdyZWcgS3JvYWgtSGFydG1h
biA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4gPiBSZXZpZXdlZC1ieTogTG9nYW4gR3Vu
dGhvcnBlIDxsb2dhbmdAZGVsdGF0ZWUuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IEx1aXMgQ2hhbWJl
cmxhaW4gPG1jZ3JvZkBrZXJuZWwub3JnPgo+ID4gUmV2aWV3ZWQtYnk6IFN0ZXBoZW4gQm95ZCA8
c2JveWRAa2VybmVsLm9yZz4KPiA+IC0tLQo+ID4gICBpbmNsdWRlL2t1bml0L3Rlc3QuaCB8IDE3
OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgIGt1bml0L0tj
b25maWcgICAgICAgIHwgIDE3ICsrKysKPiA+ICAga3VuaXQvTWFrZWZpbGUgICAgICAgfCAgIDEg
Kwo+ID4gICBrdW5pdC90ZXN0LmMgICAgICAgICB8IDE5MSArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCj4gPiAgIDQgZmlsZXMgY2hhbmdlZCwgMzg4IGluc2VydGlv
bnMoKykKPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUva3VuaXQvdGVzdC5oCj4gPiAg
IGNyZWF0ZSBtb2RlIDEwMDY0NCBrdW5pdC9LY29uZmlnCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0
NCBrdW5pdC9NYWtlZmlsZQo+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQga3VuaXQvdGVzdC5jCj4g
Pgo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUva3VuaXQvdGVzdC5oIGIvaW5jbHVkZS9rdW5pdC90
ZXN0LmgKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAwLi5l
MGIzNGFjYjllZTRlCj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9pbmNsdWRlL2t1bml0L3Rl
c3QuaAo+ID4gQEAgLTAsMCArMSwxNzkgQEAKPiA+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMCAqLwo+ID4gKy8qCj4gPiArICogQmFzZSB1bml0IHRlc3QgKEtVbml0KSBBUEku
Cj4gPiArICoKPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMTksIEdvb2dsZSBMTEMuCj4gPiArICog
QXV0aG9yOiBCcmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW5oaWdnaW5zQGdvb2dsZS5jb20+Cj4gPiAr
ICovCj4gPiArCj4gPiArI2lmbmRlZiBfS1VOSVRfVEVTVF9ICj4gPiArI2RlZmluZSBfS1VOSVRf
VEVTVF9ICj4gPiArCj4gPiArI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+Cj4gPiArCj4gPiArc3Ry
dWN0IGt1bml0Owo+ID4gKwo+ID4gKy8qKgo+ID4gKyAqIHN0cnVjdCBrdW5pdF9jYXNlIC0gcmVw
cmVzZW50cyBhbiBpbmRpdmlkdWFsIHRlc3QgY2FzZS4KPiA+ICsgKiBAcnVuX2Nhc2U6IHRoZSBm
dW5jdGlvbiByZXByZXNlbnRpbmcgdGhlIGFjdHVhbCB0ZXN0IGNhc2UuCj4gPiArICogQG5hbWU6
IHRoZSBuYW1lIG9mIHRoZSB0ZXN0IGNhc2UuCj4gPiArICoKPiA+ICsgKiBBIHRlc3QgY2FzZSBp
cyBhIGZ1bmN0aW9uIHdpdGggdGhlIHNpZ25hdHVyZSwgYGB2b2lkICgqKShzdHJ1Y3Qga3VuaXQg
KilgYAo+ID4gKyAqIHRoYXQgbWFrZXMgZXhwZWN0YXRpb25zIChzZWUgS1VOSVRfRVhQRUNUX1RS
VUUoKSkgYWJvdXQgY29kZSB1bmRlciB0ZXN0LiBFYWNoCj4gPiArICogdGVzdCBjYXNlIGlzIGFz
c29jaWF0ZWQgd2l0aCBhICZzdHJ1Y3Qga3VuaXRfc3VpdGUgYW5kIHdpbGwgYmUgcnVuIGFmdGVy
IHRoZQo+ID4gKyAqIHN1aXRlJ3MgaW5pdCBmdW5jdGlvbiBhbmQgZm9sbG93ZWQgYnkgdGhlIHN1
aXRlJ3MgZXhpdCBmdW5jdGlvbi4KPiA+ICsgKgo+ID4gKyAqIEEgdGVzdCBjYXNlIHNob3VsZCBi
ZSBzdGF0aWMgYW5kIHNob3VsZCBvbmx5IGJlIGNyZWF0ZWQgd2l0aCB0aGUgS1VOSVRfQ0FTRSgp
Cj4gPiArICogbWFjcm87IGFkZGl0aW9uYWxseSwgZXZlcnkgYXJyYXkgb2YgdGVzdCBjYXNlcyBz
aG91bGQgYmUgdGVybWluYXRlZCB3aXRoIGFuCj4gPiArICogZW1wdHkgdGVzdCBjYXNlLgo+ID4g
KyAqCj4gPiArICogRXhhbXBsZToKPgo+IENhbiB5b3UgZml4IHRoZXNlIGxpbmUgY29udGludWF0
aW9ucy4gSXQgbWFrZXMgaXQgdmVyeSBoYXJkIHRvIHJlYWQuCj4gU29ycnkgZm9yIHRoaXMgbGF0
ZSBjb21tZW50LiBUaGVzZSBjb21tZW50cyBsaW5lcyBhcmUgbG9uZ2VyIHRoYW4gODAKPiBhbmQg
d3JhcC4KCk5vbmUgb2YgdGhlIGxpbmVzIGluIHRoaXMgY29tbWl0IGFyZSBvdmVyIDgwIGNoYXJh
Y3RlcnMgaW4gY29sdW1uCndpZHRoLiBTb21lIGFyZSBleGFjdGx5IDgwIGNoYXJhY3RlcnMgKGxp
a2UgYWJvdmUpLgoKTXkgZ3Vlc3MgaXMgdGhhdCB5b3UgYXJlIHNlZWluZyB0aGUgZGlmZiBhZGRl
ZCB0ZXh0ICgrICksIHdoaWNoIHdoZW4KeW91IGFkZCB0aGF0IHRvIGEgbGluZSB3aGljaCBpcyBl
eGFjdGx5IDgwIGNoYXIgaW4gbGVuZ3RoIGVuZHMgdXAKYmVpbmcgb3ZlciA4MCBjaGFyIGluIGVt
YWlsLiBJZiB5b3UgYXBwbHkgdGhlIHBhdGNoIHlvdSB3aWxsIHNlZSB0aGF0CnRoZXkgYXJlIG9u
bHkgODAgY2hhcnMuCgo+Cj4gVGhlcmUgYXJlIHNldmVyYWwgY29tbWVudCBsaW5lcyBpbiB0aGUg
ZmlsZSB0aGF0IGFyZSB3YXkgdG9vIGxvbmcuCgpOb3RlIHRoYXQgY2hlY2twYXRjaCBhbHNvIGRv
ZXMgbm90IGNvbXBsYWluIGFib3V0IGFueSBvdmVyIDgwIGNoYXIKbGluZXMgaW4gdGhpcyBmaWxl
LgoKU29ycnkgaWYgSSBhbSBtaXN1bmRlcnN0YW5kaW5nIHdoYXQgeW91IGFyZSB0cnlpbmcgdG8g
dGVsbCBtZS4gUGxlYXNlCmNvbmZpcm0gZWl0aGVyIHdheS4KClRoYW5rcwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
