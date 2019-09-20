Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 088D0B8AED
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 08:12:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A199A6EA2F;
	Fri, 20 Sep 2019 06:12:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 898CE6EA2F
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 06:12:42 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id w144so816907oia.6
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 23:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lESsRT7Y742o9lu/7K8TiQ3yA1m0tsPUb2vMEBOJDG8=;
 b=SKPrJKke7Dhx8SxoIkTNCXvBE3ISwZHB7qoKs8bt2UYaFBQfxE02qy+WtLmEPUUqRx
 0caiYDyaB+7DCmQapOAer/Hx7+2hvijpEJgXWIYllTbNfxhwGLq2XDn60S3+gDYB23kO
 O5w77p8XcdrX+/BHZUd23D8geaAkjCGTJjHUevRe8cc6HIngDdVXB8blGGp1x6nfxM3m
 nWTvhpUrIOYRgkpa7rRMihmahaJJC4JKnE/av4Es8VhyRT5Q6ixG6TnmtuhBEY6E85Oy
 TD/1T/hLXuf0v4AhnvH68UYAcFeVnV9KHyMU6bDhqpjfgRKhQO3irpmnKaJ4pSPzjcct
 3RJw==
X-Gm-Message-State: APjAAAX9kEOqEZKT+XlYktWTgx05nYhAQIEWeiTTMJJDWcgDKqT9t7KS
 HbEXOhdIG/rG0jRf6HxICQocDZhqdwikVBk63KViZA==
X-Google-Smtp-Source: APXvYqzTN7JfI+nPor6h/gdDsP+sD4veOVaMUBxGoFMVBtbAM50YvC2eEmGFl6vAWO8whxDaCQl6kvwaPAt6JU9IQDs=
X-Received: by 2002:aca:d841:: with SMTP id p62mr1636407oig.128.1568959961655; 
 Thu, 19 Sep 2019 23:12:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txTjip6SonSATB-O38TGX9ituQaw+29PnAkNJ960R1z6g@mail.gmail.com>
 <CAHk-=wjHDrmx+Rj+oJw5V4mfWjpYzpwcJbqY-L-nvsNW_d8e_g@mail.gmail.com>
 <CAPM=9tzLFenqZQo_NQqKd5xPQ5g-5WY+JxTotL7AHk_+6S89ow@mail.gmail.com>
In-Reply-To: <CAPM=9tzLFenqZQo_NQqKd5xPQ5g-5WY+JxTotL7AHk_+6S89ow@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 20 Sep 2019 08:12:29 +0200
Message-ID: <CAKMK7uHdNgL2hKdGqKeht2n2An4jemhrr2Jpn0JYpHbop67GpA@mail.gmail.com>
Subject: Re: [git pull] drm tree for 5.4-rc1
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=lESsRT7Y742o9lu/7K8TiQ3yA1m0tsPUb2vMEBOJDG8=;
 b=SWhpw9n8wEag72+Bq3xU93j3s9vQ6N+riAK0leJCeHMgOch5nmKmhvSYL+Jhn/1kEw
 KJSE9g3m+BQTRg9EdWIxwrt7Ttz8c5mq8dKO5z38wG6ZChbw3wXHBBrL58n81xrLGhv9
 ni7fxymhsN7XJxvNm1dEqL8+FvlXzAjIzLixU=
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@chromium.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMjAsIDIwMTkgYXQgMjoxMSBBTSBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFp
bC5jb20+IHdyb3RlOgo+ID4gSG1tLiBNeSBtZXJnZSBpc24ndCBpZGVudGljYWwgdG8gdGhhdC4g
SXQncyBjbG9zZSB0aG91Z2guIERpZmZlcmVudAo+ID4gb3JkZXIgZm9yIG9uZSAjZGVmaW5lIHdo
aWNoIG1pZ2h0IGJlIGp1c3QgZnJvbSB5b3UgYW5kIG1lIG1lcmdpbmcKPiA+IGRpZmZlcmVudCBk
aXJlY3Rpb25zLgo+ID4KPiA+IEJ1dCBJIGFsc28gZW5kZWQgdXAgcmVtb3ZpbmcgdGhlIC5nZW1f
cHJpbWVfZXhwb3J0IGluaXRpYWxpemF0aW9uIHRvCj4gPiBkcm1fZ2VtX3ByaW1lX2V4cG9ydCwg
YmVjYXVzZSBpdCdzIHRoZSBkZWZhdWx0IGlmIG5vbmUgZXhpc3RzLiBUaGF0J3MKPiA+IHRoZSBs
ZWZ0LW92ZXIgZnJvbQo+ID4KPiA+ICAgICAzYmFlZWIyMTk4M2EgKCJkcm0vbXRrOiBEcm9wIGRy
bV9nZW1fcHJpbWVfZXhwb3J0L2ltcG9ydCIpCj4gPgo+ID4gYWZ0ZXIgdGhlIGltcG9ydCBzdGF5
ZWQgYXJvdW5kIGJlY2F1c2UgaXQgZ290IHR1cm5lZCBpbnRvIGFuIGFjdHVhbGx5Cj4gPiBub24t
ZGVmYXVsdCBvbmUuCj4gPgo+ID4gSSB0aGluayB0aGF0IGJvdGggb2Ygb3VyIG1lcmdlcyBhcmUg
cmlnaHQgLSBlcXVpdmFsZW50IGJ1dCBqdXN0Cj4gPiBzbGlnaHRseSBkaWZmZXJlbnQuCj4gPgo+
ID4gQnV0IHRoZSByZWFzb24gSSdtIHBvaW50aW5nIHRoaXMgb3V0IGlzIHRoYXQgSSBhbHNvIGdl
dCB0aGUgZmVlbGluZwo+ID4gdGhhdCBpZiBpdCBuZWVkcyB0aGF0IGRldi0+ZGV2X3ByaXZhdGUg
ZGlmZmVyZW5jZSBmcm9tIHRoZSBkZWZhdWx0Cj4gPiBmdW5jdGlvbiBpbiBwcmltZV9pbXBvcnQo
KSwgd291bGRuJ3QgaXQgbmVlZCB0aGUgc2FtZSBmb3IgcHJpbWVfZXhwb3J0Cj4gPiB0b28/Cj4g
Pgo+ID4gSSBkb24ndCBrbm93IHRoZSBjb2RlLCBhbmQgSSBkb24ndCBrbm93IHRoZSBoYXJkd2Fy
ZSwgYnV0IGp1c3QgZnJvbSBhCj4gPiAicGF0dGVybiBtYXRjaGluZyIgYW5nbGUgSSBqdXN0IHdh
bnRlZCB0byBjaGVjayB3aGV0aGVyIG1heWJlIHRoZXJlJ3MKPiA+IG5lZWQgZm9yIGEgbXRrX2Ry
bV9nZW1fcHJpbWVfZXhwb3J0KCkgd3JhcHBlciB0aGF0IGRvZXMgdGhhdCBzYW1lCj4gPiB0aGlu
ZyB3aXRoCj4gPgo+ID4gICAgICAgICBzdHJ1Y3QgbXRrX2RybV9wcml2YXRlICpwcml2YXRlID0g
ZGV2LT5kZXZfcHJpdmF0ZTsKPiA+Cj4gPiAgICAgICAgIC4uIHVzZSBwcml2YXRlLT5kZXYgIGlu
c3RlYWQgb2YgZGV2LT5kZXYgLi4KPiA+Cj4gPiBTbyBJJ20ganVzdCBhc2tpbmcgdGhhdCBzb21l
Ym9keSB0aGF0IGtub3dzIHRoYXQgZHJtL210ayBjb2RlIHNob3VsZAo+ID4gZG91YmxlLWNoZWNr
IHRoYXQgb2RkaXR5Lgo+Cj4gSSd2ZSBjYydlZCBBbGV4YW5kcmUgd2hvIHdyb3RlIHRoZSBpbXBv
cnQgaGFsZiBvZiB0aGlzIGNvZGUgdG8gbG9vayBpbnRvIGl0Lgo+Cj4gSSd2ZSBsb29rZWQgYXQg
dGhlIG90aGVyIHJlc3VsdHMgYW5kIGl0IGFsbCBzZWVtcyBmaW5lIHRvIG1lLgoKKHByZS1jb2Zm
ZWUsIGJ1dCBsZXQncyBob3BlIHRoZSBicmFpbiBpcyBhd2FrZSBlbm91Z2gpCgpUaGlzIGFzeW1t
ZXRyeSBpbiBwcmltZSBpbXBvcnQvZXhwb3J0IGlzIHNvbWV3aGF0IGNvbW1vbiBmb3IgZGV2aWNl
cwp3aXRoIGZ1bmt5IGRtYSByZXF1aXJlbWVudHMvc2V0dXAgaW4gdGhlIGR0L3NvYyB3b3JsZC4K
Ci0gb24gZXhwb3J0IHdlIG5lZWQgdG8gdXNlIHRoZSAib2ZmaWNpYWwiIHN0cnVjdCBkZXZpY2Us
IHNvIHRoYXQgd2hlbgp3ZSByZS1pbXBvcnQgKGkuZS4gdXNlcnNwYWNlIGp1c3Qgc2hhcmVkIGEg
YnVmZmVyIGFjcm9zcyBwcm9jZXNzCnRocm91Z2ggZmQtcGFzc2luZywgbm90IGFjcm9zcyBkZXZp
Y2UtZHJpdmVycykgdGhlIGNvbW1vbiBoZWxwZXJzCnJlYWxpemUgImFoIHRoaXMgaXMgb3Vycywg
bGV0IG1lIGp1c3QgZ3JhYiB0aGUgdW5kZXJseWluZyBidWZmZXIKb2JqZWN0IiwgaW5zdGVhZCBv
ZiBjcmVhdGluZyBhIGZ1bGwgbmV3IGJ1ZmZlciBvYmplY3QgaGFuZGxlIGxpa2UgaXQKZG9lcyBm
b3IgYSByZWFsIGltcG9ydCBvZiBhIGRtYS1idWYgZnJvbSBhIGRpZmZlcmVudCBkZXZpY2UgZHJp
dmVyLgpCZWNhdXNlIGhhdmluZyAyIGJ1ZmZlciBvYmplY3QgaGFuZGxlcyBwb2ludGluZyBhdCB0
aGUgc2FtZSB1bmRlcmx5aW5nCmJ1ZmZlciBvYmplY3RzIHRlbmRzIHRvIG5vdCBnbyB3ZWxsLgoK
LSBvbiBpbXBvcnQgb3RvaCB3ZSBuZWVkIHRvIHBhc3MgdGhlIHN0cnVjdCBkZXZpY2Ugd2UgYWN0
dWFsbHkgbmVlZApmb3IgZG1hICh3aGljaCBmb3IgcmVhc29ucyB0aGF0IEkgZG9uJ3QgZnVsbHkg
Z3JvayBpc24ndCB0aGUgc2FtZSwgSQpnb3QgaXQgZXhwbGFpbmVkIG9uY2UgYnkgZHQvc29jIGZv
bGtzIGFuZCBmb3Jnb3QgYWdhaW4gd2h5IGV4YWN0bHkpLApzbyB0aGF0IGRtYV9tYXBfc2cgYW5k
IGZyaWVuZHMgZHRydC4KClNvIHRoYXQgcGFydCBzaG91bGQgYmUgYWxsIGZpbmUuCi1EYW5pZWwK
LS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0
MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
