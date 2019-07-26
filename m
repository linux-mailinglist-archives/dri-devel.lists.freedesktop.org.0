Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E64576C55
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 17:06:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC20A6EDA0;
	Fri, 26 Jul 2019 15:06:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC73C6EDA0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 15:06:14 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id x21so17203024otq.12
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 08:06:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b1w8tr9L2YUU2MN81EceBnIWLWPBsGBLFgcwGzf4RlA=;
 b=qBcsG4yR+zhjaO/3+gc33yE9sGDq9Lj751/MUhmOH/HGp2awTJmCdYkl5lt8P0xO/g
 4Z/87IopkCdMtBHvkXEht5hkm5Mti9CDDdfnI3Rk3kdTKTBNgWqMGihobzfihXgXvoDC
 zvhuaa5IXMdGbdQLM2WdX9chatM0SmclvfL5iStZ34iidJbvfbYrTmyhXCNbmH2n+ab8
 vIwWogad95+gV/YOKzBosRDkDVZsP6lVbcpH4Bq5+cS/96G8zHRwt9MmKyE8cmAFokl0
 F5Qie45e9xbp+xibKdIUXS58gCcHU2lLSGtVGw27oZA4z40sGz4Q7+AdYtir36ZhZBTp
 bp9w==
X-Gm-Message-State: APjAAAVSJlAuLReKb4Wea+EjQuxjiyZq8COBL+4DvgrEt3SzXB4Nj+KX
 ptd1XQ1jQk58f7dFlcPnw8QG59cnU+eyC5qtUU4=
X-Google-Smtp-Source: APXvYqzvA5HEGIYz4hqqHWnuOkW5hB09HNRsTxQDxjwn/aQq41rx/1Zsb29ZqX4yswmh7edfEYXT2JqfbW2HBzUSRCU=
X-Received: by 2002:a05:6830:ce:: with SMTP id
 x14mr52907632oto.188.1564153573918; 
 Fri, 26 Jul 2019 08:06:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190304125033.28841-1-josef@lusticky.cz>
 <20190708145618.26031-1-josef@lusticky.cz>
 <20190726122510.GA14341@ravnborg.org>
 <20190726145513.GK15868@phenom.ffwll.local>
In-Reply-To: <20190726145513.GK15868@phenom.ffwll.local>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 26 Jul 2019 17:06:03 +0200
Message-ID: <CAKMK7uESP5D4e_Qx6W7amURqxJ=5Y4JHduZYCtkyVQY9jKJQeA@mail.gmail.com>
Subject: Re: Controllers with several interface options - one or more drivers?
To: Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Andrzej Hajda <a.hajda@samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=b1w8tr9L2YUU2MN81EceBnIWLWPBsGBLFgcwGzf4RlA=;
 b=DC6UNKhVgncGZJPugrrjkidDjiy+JvEzFfFvEQWjdGv4CZg2keVlFvY6xNxFbLgfYB
 bxIt8wqsZLkV93uaQaGWuk4c+gq7IMOyR988r/F2OO542RqQMzcfacwA9X7dV9AZNaXc
 0m1gfDgRnQWmWP5/lr49mrQTzfMjF6pfBG/lw=
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
Cc: devicetree <devicetree@vger.kernel.org>, Dave Airlie <airlied@linux.ie>,
 Josef Lusticky <josef@lusticky.cz>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWxzbyBwcm9iYWJseSBzaG91bGQgYWRkIGEgZmV3IG1vcmUgKGRybV9icmlkZ2UpIHBlb3BsZSwg
SSB0aGluawp0aGF0J3MgYWxzbyBzb21ld2hhdCByZWxldmFudCBoZXJlLgotRGFuaWVsCgpPbiBG
cmksIEp1bCAyNiwgMjAxOSBhdCA0OjU1IFBNIERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5j
aD4gd3JvdGU6Cj4KPiBPbiBGcmksIEp1bCAyNiwgMjAxOSBhdCAwMjoyNToxMFBNICswMjAwLCBT
YW0gUmF2bmJvcmcgd3JvdGU6Cj4gPiBIaSBKb3NlZiwgRGFuaWVsIGV0IGFsLgo+ID4KPiA+IFRo
ZSBkcml2ZXIgdGhhdCB0cmlnZ2VyZWQgdGhpcyByZXBseSBpcyBhIGRyaXZlciB0aGF0IGFkZHMg
cGFyYWxsZWwKPiA+IHN1cHBvcnQgdG8gaWxpOTM0MSBpbiBhIGRlZGljYXRlZCBwYW5lbCBkcml2
ZXIuCj4gPiBUaGUgaXNzdWUgaGVyZSBpcyB0aGF0IHdlIGFscmVhZHkgaGF2ZSBhIHRpbnkgZHJp
dmVyIHRoYXQgc3VwcG9ydHMgdGhlCj4gPiBpbGk5MzQxIGNvbnRyb2xsZXIgLSBidXQgd2l0aCBh
IHNsaWdodGx5IGRpZmZlcmVudCBjb25maWd1cmF0aW9uLgo+ID4KPiA+IFRoZSBpbGk5MzQxIHN1
cHBvcnRzIHNldmVyYWwgaW50ZXJmYWNlcyAtIGZyb20gdGhlIGRhdGFzaGVldDoKPiA+ICAgICAi
SUxJOTM0MSBzdXBwb3J0cyBwYXJhbGxlbCA4LS85LS8xNi0vMTgtYml0IGRhdGEgYnVzCj4gPiAg
ICAgIE1DVSBpbnRlcmZhY2UsIDYtLzE2LS8xOC1iaXQgZGF0YSBidXMgUkdCIGludGVyZmFjZSBh
bmQKPiA+ICAgICAgMy0vNC1saW5lIHNlcmlhbCBwZXJpcGhlcmFsIGludGVyZmFjZSAoU1BJKSIK
PiA+Cj4gPiBOb3JhbGYgLSBpbiBhbm90aGVyIG1haWwgZXhwbGFpbmVkOgo+ID4gIgo+ID4gVGhl
IE1JUEkgQWxsaWFuY2UgaGFzIGxvdHMgb2Ygc3RhbmRhcmRzIHNvbWUgd3J0LiBkaXNwbGF5IGNv
bnRyb2xsZXIKPiA+IGludGVyZmFjZXM6Cj4gPiAtIE1JUEkgREJJIC0gRGlzcGxheSBCdXMgSW50
ZXJmYWNlICh1c2VkIGZvciBjb21tYW5kcyBhbmQgb3B0aW9uYWxseSBwaXhlbHMpCj4gPiAtIE1J
UEkgRFBJIC0gRGlzcGxheSBQaXhlbCBJbnRlcmZhY2UgKGFsc28gY2FsbGVkIFJHQiBpbnRlcmZh
Y2Ugb3IKPiA+IERPVENMSyBpbnRlcmZhY2UpCj4gPiAtIE1JUEkgRFNJIC0gRGlzcGxheSBTZXJp
YWwgSW50ZXJmYWNlIChjb21tYW5kcyBhbmQgcGl4ZWxzKQo+ID4KPiA+IFRoZSBpbGk5MzQxIHN1
cHBvcnRzIGJvdGggTUlQSSBEQkkgYW5kIERQSS4KPiA+ICIKPiA+Cj4gPiBNSVBJIERQSSAtIGlz
IGEgZ29vZCBmaXQgZm9yIGEgZHJtX3BhbmVsIGRyaXZlci4KPiA+IE1JUEkgREJJIC0gcmVxdWly
ZXMgYSBmdWxsIGRpc3BsYXkgY29udHJvbGxlciBkcml2ZXIuCj4gPgo+ID4gVGhlcmUgYXJlIG1h
bnkgb3RoZXIgZXhhbXBsZXMgb2YgZHJpdmVyIFNvQyB0aGF0IGluIHRoZSBzYW1lIHdheQo+ID4g
Y2FuIGJlIHNlZW4gb25seSBhcyBhIHBhbmVsIG9yIGFzIGEgZnVsbCBkaXNwbGF5IGNvbnRyb2xs
ZXIgZHJpdmVyLgo+ID4KPiA+IFRoZSBvcGVuIHF1ZXN0aW9uIGhlcmUgaXMgaWYgd2Ugc2hvdWxk
IHRyeSB0byBzdXBwb3J0IGJvdGggY2FzZXMgaW4gdGhlCj4gPiBzYW1lIGRyaXZlciAvIGZpbGUu
IE9yIHNoYWxsIHdlIGltcGxtZW50IHR3byBkaWZmZXJlbnQgZHJpdmVycy4KPiA+IE9uZSBmb3Ig
dGhlIHBhbmVsIHVzZS1jYXNlLiBBbmQgb25lIGZvciB0aGUgZGlzcGxheSBjb250cm9sbGVyIHVz
ZWNhc2U/Cj4gPgo+ID4gTm90IHN1cmUgLSBzbyBhc2tpbmcgZm9yIGZlZWRiYWNrLgo+Cj4gSSdt
IG5vdCBzdXJlLiBDdXJyZW50bHkgd2UgZG8gaGF2ZSBEU0kgYW5kIGR1bWIgUkdCIHBhbmVscyBh
bGwgaW4KPiBkcm0vcGFuZWwuIEkgZG9uJ3QgdGhpbmsgd2UgaGF2ZSBEQkkgcGFuZWxzIGluIHRo
ZXJlIHlldCwgYnV0IHRoZW4KPiBkcm0vdGlueSBpcyB0aGUgb25seSBvbmUgc3VwcG9ydGluZyB0
aGVzZS4KPgo+IEkgZ3Vlc3Mgd2UgY291bGQgbG9vayBpbnRvIG1vdmUgc29tZSBvZiB0aGUgREJJ
IHBhbmVsIGRyaXZlcnMgaW50byBwYW5lbAo+IGRyaXZlcnMsIGJ1dCB0aGF0IG5lZWRzIGEgYml0
IG1vcmUgZ2x1ZSBhbGwgYXJvdW5kLiBJJ20gaG9uZXN0bHkgbm90IHN1cmUKPiBob3cgdGhlIGN1
cnJlbnQgRFNJIGRyaXZlcnMgaW4gZHJtX3BhbmVsIHdvcmsgZXhhY3RseSwgZXNwZWNpYWxseSBm
b3IKPiBjb21tYW5kIG1vZGUuCj4KPiBPciBtYXliZSB3ZSBuZWVkIGEgbmV3IGludGVyZmFjZSBm
b3IgY29tbWFuZCBtb2RlLgo+Cj4gV3J0IHNoYXJpbmcgY29kZSBiZXR3ZWVuIGRyaXZlcnMgZm9y
IHRoZSBzYW1lIGNoaXAsIGJ1dCBkaWZmZXJlbnQKPiBpbnRlcmZhY2VzOiBJIHdvdWxkbid0IHdv
cnJ5IHRvbyBtdWNoIGFib3V0IHRoYXQuIE1heWJlIHRyeSB0byBoYXZlIGEKPiBzaGFyZWQgaGVh
ZGVyIGZpbGUgYXQgbGVhc3QgZm9yIHJlZ2lzdGVycy4gTG9uZyB0ZXJtIHdlIGNvdWxkIGVuZCB1
cCB3aXRoCj4gb25lIGRyaXZlciBtb2R1bGUgd2hpY2ggZXhwb3NlcyBkaWZmZXJlbnQgZmxhdm91
cnMgb2YgdGhlIHNhbWUgY2hpcCwgc28KPiBtdWx0aXBsZSBkcm1fcGFuZWwgZHJpdmVycywgb3Ig
bWF5YmUgd2UnbGwgZ2V0IHNvbWV0aGluZyBtb3JlIHNwZWNpZmljIGZvcgo+IGRzaS9kYmkuCj4g
LURhbmllbAo+IC0tCj4gRGFuaWVsIFZldHRlcgo+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBD
b3Jwb3JhdGlvbgo+IGh0dHA6Ly9ibG9nLmZmd2xsLmNoCgoKCi0tIApEYW5pZWwgVmV0dGVyClNv
ZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAt
IGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
