Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C956D1172F6
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 18:40:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB19D6E03E;
	Mon,  9 Dec 2019 17:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 035026E03E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 17:40:08 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9093D2080D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 17:40:07 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id v23so13846660qkg.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2019 09:40:07 -0800 (PST)
X-Gm-Message-State: APjAAAUNtj/HNxk5DmKm6yGXqRIb1FpuTD3TvXOfHIJae0KpGnsIZIQp
 +7virStbzUOYBvGlpLncx+fiC+rkhmKC3ZLSjA==
X-Google-Smtp-Source: APXvYqxUoG+SqrXR5LgshSdUQVxR9MZHP7wICmocF4ZQqNRo+pC+tQchnEKozzNnRSx1Sn8VF/Z6htjHpAHJ5wwKXeo=
X-Received: by 2002:a37:4904:: with SMTP id w4mr26432322qka.119.1575913206702; 
 Mon, 09 Dec 2019 09:40:06 -0800 (PST)
MIME-Version: 1.0
References: <20191119231309.18295-1-robh@kernel.org>
 <20191130194337.GE24722@ravnborg.org>
 <CAL_Jsq+AsCOQh89t1foJjDFFoQzfx5NythgdcbQGYNxRHRjB2A@mail.gmail.com>
 <20191204201452.GA30193@ravnborg.org>
In-Reply-To: <20191204201452.GA30193@ravnborg.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 9 Dec 2019 11:39:55 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLNSF3j9q49SVTpg=742dgt-60BRhXUxEVUXyYtroAqOQ@mail.gmail.com>
Message-ID: <CAL_JsqLNSF3j9q49SVTpg=742dgt-60BRhXUxEVUXyYtroAqOQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: Convert a bunch of panels to DT
 schema
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1575913207;
 bh=fO3QVAlG1OLh/os2egcINJgc4sXwb3ey4tuBeS0INII=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Ng3lSjJf+epVuaGapV72kMeYLodPePvBoaKwd7DE+sSQ39qfvTilm0XWDyD0u3Xoy
 6HNyoShzOJmue9fj93r3FYYmpWZ3fpOIuYzaet0wU9yP24ZxRHxRyXyD2joeR27WIW
 xNqsoiQ8r8rRj8ss9abTkE1dpe1xpYD5rJ9IcS4s=
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
Cc: devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBEZWMgNCwgMjAxOSBhdCAyOjE1IFBNIFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3Jn
Lm9yZz4gd3JvdGU6Cj4KPiBIaSBSb2IuCj4KPiBPbiBNb24sIERlYyAwMiwgMjAxOSBhdCAwODoz
ODozOUFNIC0wNjAwLCBSb2IgSGVycmluZyB3cm90ZToKPiA+IE9uIFNhdCwgTm92IDMwLCAyMDE5
IGF0IDE6NDMgUE0gU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPiB3cm90ZToKPiA+ID4K
PiA+ID4gSGkgUm9iLgo+ID4gPgo+ID4gPiBUaGFua3MgZm9yIGRvaW5nIHRoaXMgYm9yaW5nLCB0
cml2aWFsIGFuZCB0aXJlc29tZSB0YXNrLgo+ID4KPiA+IEl0IHdhcyBzb21ld2hhdCBzY3JpcHRl
ZCBhdCBsZWFzdC4uLgo+ID4KPiA+ID4gT24gVHVlLCBOb3YgMTksIDIwMTkgYXQgMDU6MTM6MDlQ
TSAtMDYwMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gPiA+ID4gQ29udmVydCBhbGwgdGhlICdzaW1w
bGUnIHBhbmVscyB3aGljaCBlaXRoZXIgdXNlIHRoZSBzaW5nbGUKPiA+ID4gPiAncG93ZXItc3Vw
cGx5JyBwcm9wZXJ0eSBvciBkb24ndCBzYXkgYW5kIGp1c3QgcmVmZXJlbmNlCj4gPiA+ID4gc2lt
cGxlLXBhbmVsLnR4dC4gSW4gdGhlIGxhdGVyIGNhc2UsIGJpbmRpbmdzIGFyZSBjbGVhciBhcyB0
byB3aGljaAo+ID4gPiA+IHByb3BlcnRpZXMgYXJlIHJlcXVpcmVkIG9yIHVudXNlZC4KPiA+ID4g
Pgo+ID4gPiA+IENjOiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+Cj4gPiA+ID4g
Q2M6IENoZW4tWXUgVHNhaSA8d2Vuc0Bjc2llLm9yZz4KPiA+ID4gPiBDYzogVGhpZXJyeSBSZWRp
bmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KPiA+ID4gPiBDYzogU2FtIFJhdm5ib3JnIDxz
YW1AcmF2bmJvcmcub3JnPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2Jo
QGtlcm5lbC5vcmc+Cj4gPiA+Cj4gPiA+IFNvIFRoaWVycnkgYW5kIEkgZW5kZWQgdXAgYXMgTWFp
bnRpYW5lcyBmb3IgdGhlbSBhbGwuCj4gPiA+IEkgZ3VlcyB0aGF0cyBPSyBhcyB3ZSBsb29rIGFm
dGVyIHRoZSBwYW5lbCBzdHVmZiBhbnl3YXkuCj4gPiA+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gV2Ug
Y291bGQgcGVyaGFwcyBjb25zb2xpZGF0ZSBhIGJ1bmNoIG9mIHRoZXNlLCBidXQgSSBoYXZlIG5v
IGlkZWEgaG93Cj4gPiA+ID4gYWNjdXJhdGUgc29tZSBvZiB0aGVzZSBhcmUgV1JUIHdoYXQncyBy
ZXF1aXJlZCBvciBub3QuIFNlZW1zIHN0cmFuZ2UKPiA+ID4gPiB0aGF0ICdiYWNrbGlnaHQnIGlz
IG9wdGlvbmFsIHVubGVzcyB0aGUgYmFja2xpZ2h0IGlzIHRpZWQgZnVsbCBvbiBmb3IKPiA+ID4g
PiBleGFtcGxlLiBJZiB0aGF0J3MgdGhlIGNhc2UsIHRoZW4gc2hvdWxkIGJhY2tsaWdodCBldmVy
IGJlIHJlcXVpcmVkPwo+ID4gPiBJIGRvIG5vdCByZWFsbHkgZm9sbG93IHlvdSBoZXJlLgo+ID4g
PiBMb29raW5nIHRocm91Z2ggdGhlIHBhdGNoIHNldCB0aGluZ3MgbG9va3Mgbm9ybWFsIHRvIG1l
Lgo+ID4gPgo+ID4gPiBXaGF0IGRvIEkgbWlzcyBoZXJlPwo+ID4KPiA+IEknbSBzYXlpbmcgYSBi
dW5jaCBvZiB0aGVzZSBjb3VsZCBqdXN0IGJlIGEgc2luZ2xlIHNjaGVtYSBkb2Mgd2l0aCBhCj4g
PiBsb25nIGxpc3Qgb2YgY29tcGF0aWJsZXMuIFRoZSB2YXJpYXRpb24gaXMgaW4gd2hhdCBwcm9w
ZXJ0aWVzIGFyZQo+ID4gcmVxdWlyZWQgb3Igbm90Lgo+Cj4gSXQgd291bGQgYmUganVzdCB3b25k
ZXJmdWwgaWYgd2UgY291bGQgaGF2ZSBvbmx5IGEgZmV3Cj4gZHQtYmluZGluZ3MgZm9yIHRoZSBz
aW1wbGUgcGFuZWxzLgo+IExpa2UgeW91IEkgY2Fubm90IHNlZSB3aHkgZW5hYmxlLWdwaW9zIHNo
b3VsZCBiZSByZXF1aXJlZC4KPgo+IFdlIGNvdWxkIGVuZCB1cCB3aXRoIHNvbWV0aGluZyBsaWtl
IHRocmVlIGNsYXNzZXMgb2YgYmluZGluZ3M6Cj4KPiArcmVxdWlyZWQ6Cj4gKyAgLSBjb21wYXRp
YmxlCj4gKyAgLSBwb3dlci1zdXBwbHkKPgo+ICtyZXF1aXJlZDoKPiArICAtIGNvbXBhdGlibGUK
PiArICAtIHBvcnQKPiArICAtIHBvd2VyLXN1cHBseQo+Cj4gK3JlcXVpcmVkOgo+ICsgIC0gYmFj
a2xpZ2h0Cj4gKyAgLSBjb21wYXRpYmxlCj4gKyAgLSBwb3J0Cj4gKyAgLSBwb3dlci1zdXBwbHkK
Pgo+IFRoZSBwb3J0IHBhcnQgaXMgdG8gbXkgYmVzdCB1bmRlcnN0YW5kaW5nIGEgd2F5IHRvCj4g
Y29ubmVjdCB0aGUgcGFuZWwgdG8gdGhlIGRpc3BsYXkgZHJpdmVyLgo+IFNvIGl0IHNob3VsZCBi
ZSBtb3JlIGhvdyB0aGUgY29ubmVjdCBpbiB0aGUgYmluZGluZwo+IHRoYXQgZGVjaWRlcyBpZiBw
b3J0IGlzIHVzZWQgb3Igbm90LgoKWWVzLCB0aG91Z2ggaXQncyBhbHNvIGluaXRpYWxseSBwYW5l
bHMgd2VyZSBqdXN0IHRoZSBjaGlsZCBvZiB0aGUKY29udHJvbGxlciBiZWZvcmUgJ3BvcnQnIGNh
bWUgYWxvbmcuIFdlIHN0aWxsIGFsbG93IGJvdGggd2F5cyB0aG91Z2gKJ3BvcnQnIGlzIHByZWZl
cnJlZC4KCj4gQW5kIHRoZSBwYW5lbCBzaG91bGQgbm90IHJlcXVpcmUgaXQuCj4KPiBJIG1heSB1
c2UgaXQgd2l0aCBkaXNwbGF5IGRyaXZlcnMgdGhhdCBkbyBub3Qgc3VwcG9ydCBpdAo+IGluIHRo
ZWlyIGJpbmRpbmcuCj4KPiBBbmQgdGhlbiB3ZSBoYXZlIGJhY2tsaWdodCAtIHdoaWNoIGNhbiBo
YXJkbHkgYmUgbWFuZGF0b3J5Lgo+IFRoZSBwYW5lbCBjb3VsZCBoYXJkLXdpcmUgaXQgdG8gcHJv
dmlkZSBiYWNrbGlndCBpZiBpdCB3YW50ZWQKPiBhbmQgdGhlIGJpbmRpbmcgc2hvdWxkIGNvbnRp
bnVlIHRvIHdvcmsuCj4gSSB0aGluayB5b3UgaGFkIHRoZSBzYW1lIGFyZ3VtZW50Lgo+Cj4gU28g
d2UgYXJlIGRvd24gdG8gdHdvIHJlcXVpcmVkIHByb3BlcnRpZXM6Cj4gK3JlcXVpcmVkOgo+ICsg
IC0gY29tcGF0aWJsZQo+ICsgIC0gcG93ZXItc3VwcGx5Cj4KPiBDb3VsZCB3ZSBwdXQgYWxsIHNp
bXBsZSBwYW5lbHMgaW4gb25lIGJpbmRpbmcgZmlsZQo+IHdpdGggb25seSB0aGlzIC0gdGhhdCB3
b3VsZCBiZSBncmVhdC4KPiBIb3BlZnVsbHkgc2NyaXB0ZWQgc29tZWhvdy4uLgo+Cj4gVGhlbiBh
ZGRpbmcgbmV3IHNpbXBsZSBwYW5lbHMgd291bGQgYmUgYSBtYXR0ZXIgb2YKPiBhZGRpbmcgYSBu
ZXcgY29tcGF0aWJsZS4KClllcy4gVGhlIGlzc3VlIHdvdWxkIGJlIGVuZm9yY2luZyB0aGUgYmln
IGRpc2NsYWltZXIgb2YgIkRvIG5vdCBhZGQKeW91ciBwYW5lbCBoZXJlIHVubGVzcyBpdCBoYXMg
YSBzaW5nbGUgcG93ZXIgcmFpbC4iIChBbmQgYW55dGhpbmcgZWxzZQp3ZSB0aGluayBvZikuIEJl
dHdlZW4gYSBzaW5nbGUgbGluZSBhZGQgdnMuIGEgd2hvbGUgbmV3IGRvYywgeW91IGtub3cKd2hh
dCBwZW9wbGUgd2lsbCBwaWNrLiBJIGd1ZXNzIHBhbmVscyBjb3VsZCBzdGlsbCBiZSBtb3ZlZCBv
dXQgb2YgdGhlCmNvbW1vbiBkb2MgbGF0ZXIgb24uIFdlJ2QgYWxzbyBoYXZlIHRvIGJlIGZpZ2h0
aW5nIG9mZiB0aGUgImxldCBtZSBhZGQKanVzdCBvbmUgbmV3IHByb3BlcnR5IGZvciBteSBwYW5l
bCIuCgo+IEFuZCBpZiB0aGV5IGFyZSBzb3J0ZWQgdGhpcyBzaG91bGQgbm90IGNhdXNlIG1hbnkg
bWVyZ2UgaXNzdWVzIGVpdGhlci4KPgo+IEkgaG9wZSBJIHVuZGVyc3Rvb2QgeW91IGNvcnJlY3Qu
CgpZb3UgZGlkLiBJJ2QgbGlrZSB0byBoZWFyIFRoaWVycnkncyB0aG91Z2h0cyBvbiB0aGlzIGJl
Zm9yZSBnb2luZyBkb3duCnRoaXMgcGF0aC4KClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
