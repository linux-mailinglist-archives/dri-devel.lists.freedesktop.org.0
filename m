Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9279899A3
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 11:18:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B7BC6E2DA;
	Mon, 12 Aug 2019 09:18:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 741E46E2DA
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 09:18:03 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id e16so9828409edv.6
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 02:18:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qYfm+HhxiVLxwMRZpF6kOW9iq3of0f5g9KF9ckov0fc=;
 b=AwrjweGfW5vWCpMLBCZQPst5Xh6lNQ4F+JOeD9IigUWIS4ySJGG1eL8x2qp+zS7Gm8
 ot3/rvVYgInBuElaVz7+hiUVZGPnTcvwH5Q3Y5qqPtw5uDl8AfXhgGTE12Jm0cWiIb0s
 w+YTmu04Z/hTOMJ+XkNYueOcbsic8EL90bCvAk9gg6JokJ548LCrTY1RkwsoKxouy+oc
 AGFvibCK4z0mX72qLqeMlCHXwFXuefJxHQAaMQRmeUIy7rQPKDn6NaxQqbgliRdou6mh
 Z5L4iAQ5sPUUEH9otrxU2ZOC8/kF2ymkf8v/AEAIY9//1MLWh9m/ChTStOOz0nDx9pea
 89tQ==
X-Gm-Message-State: APjAAAXbmmcBEF1vGrHZ5S4S/hUAajXn9v9x1XGHppEqfRdLrTya/2a9
 1L5508pIznYtrvodIzdq8UqsgXdCtnQ=
X-Google-Smtp-Source: APXvYqw7M7Ow+P4oGOBbPc3RRAcJeBQxhKSSk8oy1ZCXbb0Sn9PkRr66Nki+Rg0yyiEXeu2MwGh3fQ==
X-Received: by 2002:a50:c35b:: with SMTP id q27mr35533629edb.98.1565601481435; 
 Mon, 12 Aug 2019 02:18:01 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com.
 [209.85.221.48])
 by smtp.gmail.com with ESMTPSA id d7sm23328076edr.39.2019.08.12.02.18.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Aug 2019 02:18:01 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id b16so7208828wrq.9
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 02:18:00 -0700 (PDT)
X-Received: by 2002:adf:dbce:: with SMTP id e14mr30773546wrj.9.1565601480549; 
 Mon, 12 Aug 2019 02:18:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190806155744.10263-1-megous@megous.com>
 <20190806155744.10263-2-megous@megous.com>
In-Reply-To: <20190806155744.10263-2-megous@megous.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 12 Aug 2019 17:17:48 +0800
X-Gmail-Original-Message-ID: <CAGb2v66+L6_QrL-05fLHQxqavBAmP-pEFp9RWT5XeTQ2rpGa3w@mail.gmail.com>
Message-ID: <CAGb2v66+L6_QrL-05fLHQxqavBAmP-pEFp9RWT5XeTQ2rpGa3w@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH v8 1/4] arm64: dts: allwinner: orange-pi-3:
 Enable ethernet
To: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megous@megous.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-sunxi <linux-sunxi@googlegroups.com>,
 Rob Herring <robh+dt@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgNiwgMjAxOSBhdCAxMTo1NyBQTSA8bWVnb3VzQG1lZ291cy5jb20+IHdyb3Rl
Ogo+Cj4gRnJvbTogT25kcmVqIEppcm1hbiA8bWVnb3VzQG1lZ291cy5jb20+Cj4KPiBPcmFuZ2Ug
UGkgMyBoYXMgdHdvIHJlZ3VsYXRvcnMgdGhhdCBwb3dlciB0aGUgUmVhbHRlayBSVEw4MjExRS4g
QWNjb3JkaW5nCj4gdG8gdGhlIHBoeSBkYXRhc2hlZXQsIGJvdGggcmVndWxhdG9ycyBuZWVkIHRv
IGJlIGVuYWJsZWQgYXQgdGhlIHNhbWUgdGltZSwKPiBidXQgd2UgY2FuIG9ubHkgc3BlY2lmeSBh
IHNpbmdsZSBwaHktc3VwcGx5IGluIHRoZSBEVC4KPgo+IFRoaXMgY2FuIGJlIGFjaGlldmVkIGJ5
IG1ha2luZyBvbmUgcmVndWxhdG9yIGRlcGVkbmluZyBvbiB0aGUgb3RoZXIgdmlhCj4gdmluLXN1
cHBseS4gV2hpbGUgaXQncyBub3QgYSB0ZWNobmljYWxseSBjb3JyZWN0IGRlc2NyaXB0aW9uIG9m
IHRoZQo+IGhhcmR3YXJlLCBpdCBhY2hpZXZlcyB0aGUgcHVycG9zZS4KPgo+IEFsbCB2YWx1ZXMg
b2YgUlgvVFggZGVsYXkgd2VyZSB0ZXN0ZWQgZXhoYXVzdGl2ZWx5IGFuZCBhIG1pZGRsZSBvbmUg
b2YgdGhlCj4gd29ya2luZyB2YWx1ZXMgd2FzIGNob3Nlbi4KPgo+IFNpZ25lZC1vZmYtYnk6IE9u
ZHJlaiBKaXJtYW4gPG1lZ291c0BtZWdvdXMuY29tPgo+IC0tLQo+ICAuLi4vZHRzL2FsbHdpbm5l
ci9zdW41MGktaDYtb3JhbmdlcGktMy5kdHMgICAgfCA0NCArKysrKysrKysrKysrKysrKysrCj4g
IDEgZmlsZSBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9h
cm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2LW9yYW5nZXBpLTMuZHRzIGIvYXJjaC9h
cm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2LW9yYW5nZXBpLTMuZHRzCj4gaW5kZXgg
MTdkNDk2OTkwMTA4Li4yYzY4MDdiNzRmZjYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9ib290
L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2LW9yYW5nZXBpLTMuZHRzCj4gKysrIGIvYXJjaC9hcm02
NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2LW9yYW5nZXBpLTMuZHRzCj4gQEAgLTE1LDYg
KzE1LDcgQEAKPgo+ICAgICAgICAgYWxpYXNlcyB7Cj4gICAgICAgICAgICAgICAgIHNlcmlhbDAg
PSAmdWFydDA7Cj4gKyAgICAgICAgICAgICAgIGV0aGVybmV0MCA9ICZlbWFjOwo+ICAgICAgICAg
fTsKPgo+ICAgICAgICAgY2hvc2VuIHsKPiBAQCAtNDQsNiArNDUsMjcgQEAKPiAgICAgICAgICAg
ICAgICAgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8NTAwMDAwMD47Cj4gICAgICAgICAgICAg
ICAgIHJlZ3VsYXRvci1hbHdheXMtb247Cj4gICAgICAgICB9Owo+ICsKPiArICAgICAgIC8qCj4g
KyAgICAgICAgKiBUaGUgYm9hcmQgdXNlcyAyLjVWIFJHTUlJIHNpZ25hbGxpbmcuIFBvd2VyIHNl
cXVlbmNlIHRvIGVuYWJsZQo+ICsgICAgICAgICogdGhlIHBoeSBpcyB0byBlbmFibGUgR01BQy0y
VjUgYW5kIEdNQUMtM1YgKGFsZG8yKSBwb3dlciByYWlscwo+ICsgICAgICAgICogYXQgdGhlIHNh
bWUgdGltZSBhbmQgdG8gd2FpdCAxMDBtcy4KPiArICAgICAgICAqLwo+ICsgICAgICAgcmVnX2dt
YWNfMnY1OiBnbWFjLTJ2NSB7Cj4gKyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicmVndWxh
dG9yLWZpeGVkIjsKPiArICAgICAgICAgICAgICAgcmVndWxhdG9yLW5hbWUgPSAiZ21hYy0ydjUi
Owo+ICsgICAgICAgICAgICAgICByZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDwyNTAwMDAwPjsK
PiArICAgICAgICAgICAgICAgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MjUwMDAwMD47Cj4g
KyAgICAgICAgICAgICAgIHN0YXJ0dXAtZGVsYXktdXMgPSA8MTAwMDAwPjsKPiArICAgICAgICAg
ICAgICAgZW5hYmxlLWFjdGl2ZS1oaWdoOwo+ICsgICAgICAgICAgICAgICBncGlvID0gPCZwaW8g
MyA2IEdQSU9fQUNUSVZFX0hJR0g+OyAvKiBQRDYgKi8KPiArCj4gKyAgICAgICAgICAgICAgIC8q
IFRoZSByZWFsIHBhcmVudCBvZiBnbWFjLTJ2NSBpcyByZWdfdmNjNXYsIGJ1dCB3ZSBuZWVkIHRv
Cj4gKyAgICAgICAgICAgICAgICAqIGVuYWJsZSB0d28gcmVndWxhdG9ycyB0byBwb3dlciB0aGUg
cGh5LiBUaGlzIGlzIG9uZSB3YXkKPiArICAgICAgICAgICAgICAgICogdG8gYWNoaWV2ZSB0aGF0
Lgo+ICsgICAgICAgICAgICAgICAgKi8KPiArICAgICAgICAgICAgICAgdmluLXN1cHBseSA9IDwm
cmVnX2FsZG8yPjsgLyogR01BQy0zViAqLwo+ICsgICAgICAgfTsKClRoZSBSVEw4MjExRSBkYXRh
c2hlZXQgSSBoYXZlIHNheXM6CgogICAgMi41ViAob3IgMS44LzEuNVYpIFJHTUlJIHBvd2VyIHNo
b3VsZCBiZSByaXNlbiBzaW11bHRhbmVvdXNseSBvciBzbGlnaHRseQogICAgZWFybGllciB0aGFu
IDMuM1YgcG93ZXIuIFJpc2luZyAyLjVWIChvciAxLjgvMS41VikgcG93ZXIgbGF0ZXIgdGhhbiAz
LjNWCiAgICBwb3dlciBtYXkgbGVhZCB0byBlcnJvcnMuCgpTaW5jZSB5b3UgY2FuJ3QgcmV2ZXJz
ZSB0aGUgcGFyZW50IHJlbGF0aW9uc2hpcCBpbiB5b3VyIHBhdGNoLCBtYXliZSBpdCdzCnRpbWUg
dG8gYWRkIGEgcGh5LWlvLXN1cHBseSBwcm9wZXJ0eT8KCkl0IGFsc28gc2F5cyB0aGUgcmlzZSB0
aW1lIGZvciAzLjNWIG11c3QgYmUgYmV0d2VlbiAxbXMgYW5kIDEwMG1zLiBIb3dldmVyCnRoZSBQ
TUlDIGRvZXNuJ3Qgc3VwcG9ydCB2b2x0YWdlIHJhbXAgY29udHJvbCBmb3IgdGhlIExET3MsIG5v
ciBkb2VzIGl0IGxpc3QKdGhlIHJhbXAgcmF0ZS4KCkNoZW5ZdQoKPiAgfTsKPgo+ICAmY3B1MCB7
Cj4gQEAgLTU4LDYgKzgwLDI4IEBACj4gICAgICAgICBzdGF0dXMgPSAib2theSI7Cj4gIH07Cj4K
PiArJmVtYWMgewo+ICsgICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKPiArICAgICAg
IHBpbmN0cmwtMCA9IDwmZXh0X3JnbWlpX3BpbnM+Owo+ICsgICAgICAgcGh5LW1vZGUgPSAicmdt
aWkiOwo+ICsgICAgICAgcGh5LWhhbmRsZSA9IDwmZXh0X3JnbWlpX3BoeT47Cj4gKyAgICAgICBw
aHktc3VwcGx5ID0gPCZyZWdfZ21hY18ydjU+Owo+ICsgICAgICAgYWxsd2lubmVyLHJ4LWRlbGF5
LXBzID0gPDE1MDA+Owo+ICsgICAgICAgYWxsd2lubmVyLHR4LWRlbGF5LXBzID0gPDcwMD47Cj4g
KyAgICAgICBzdGF0dXMgPSAib2theSI7Cj4gK307Cj4gKwo+ICsmbWRpbyB7Cj4gKyAgICAgICBl
eHRfcmdtaWlfcGh5OiBldGhlcm5ldC1waHlAMSB7Cj4gKyAgICAgICAgICAgICAgIGNvbXBhdGli
bGUgPSAiZXRoZXJuZXQtcGh5LWllZWU4MDIuMy1jMjIiOwo+ICsgICAgICAgICAgICAgICByZWcg
PSA8MT47Cj4gKwo+ICsgICAgICAgICAgICAgICByZXNldC1ncGlvcyA9IDwmcGlvIDMgMTQgR1BJ
T19BQ1RJVkVfTE9XPjsgLyogUEQxNCAqLwo+ICsgICAgICAgICAgICAgICByZXNldC1hc3NlcnQt
dXMgPSA8MTUwMDA+Owo+ICsgICAgICAgICAgICAgICByZXNldC1kZWFzc2VydC11cyA9IDw0MDAw
MD47Cj4gKyAgICAgICB9Owo+ICt9Owo+ICsKPiAgJm1tYzAgewo+ICAgICAgICAgdm1tYy1zdXBw
bHkgPSA8JnJlZ19jbGRvMT47Cj4gICAgICAgICBjZC1ncGlvcyA9IDwmcGlvIDUgNiBHUElPX0FD
VElWRV9MT1c+OyAvKiBQRjYgKi8KPiAtLQo+IDIuMjIuMAo+Cj4gLS0KPiBZb3UgcmVjZWl2ZWQg
dGhpcyBtZXNzYWdlIGJlY2F1c2UgeW91IGFyZSBzdWJzY3JpYmVkIHRvIHRoZSBHb29nbGUgR3Jv
dXBzICJsaW51eC1zdW54aSIgZ3JvdXAuCj4gVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGdyb3Vw
IGFuZCBzdG9wIHJlY2VpdmluZyBlbWFpbHMgZnJvbSBpdCwgc2VuZCBhbiBlbWFpbCB0byBsaW51
eC1zdW54aSt1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tLgo+IFRvIHZpZXcgdGhpcyBkaXNj
dXNzaW9uIG9uIHRoZSB3ZWIsIHZpc2l0IGh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vZC9tc2dp
ZC9saW51eC1zdW54aS8yMDE5MDgwNjE1NTc0NC4xMDI2My0yLW1lZ291cyU0MG1lZ291cy5jb20u
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
