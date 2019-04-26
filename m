Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4ACFDCD3
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2019 09:28:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC022891AB;
	Mon, 29 Apr 2019 07:28:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-it1-x143.google.com (mail-it1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6084489221
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2019 23:55:01 +0000 (UTC)
Received: by mail-it1-x143.google.com with SMTP id s3so8525050itk.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2019 16:55:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WU03Ki48Dvm6T/xud/B67f7U5Mq2RTuwpBv2iAIar80=;
 b=cKhd8q2gdhQVhuBHGGrwh03X6EqcTDa+F9wFEydQgyhlErK+p79S5/0msfIgQXK5Yx
 90o3MThVEDZAImhtAK7TcOlUTaWwCeKU6cUTp9oC80wuPOjb9YLN8+rS6YqVTqL5Kw9O
 nbYNiN55inNe8MGuwv3FCR6fyPp6IzCaYLTacLPLU2MgKVzQaxuloL8AuHVEAgQnlD8+
 Ffqyhl8IethJQmqwPQDtIGZL0E7/OUaF4GURMKYizUmq1snRczLblsr0PqNIjuTNzxqT
 rRGLmVTq5TvK1fFLxjAfDpX6wpsfyW1u+YxOjY70hEflwTaWkEFhNGrEZnytoHGWjTbR
 k0TA==
X-Gm-Message-State: APjAAAWzxDSsU3n4O0Mc/kxx4np3H3MUPF63txNXhgFN4c3od1jBXav3
 GL3c7mFtOiZ6rL9zv3uI1cpdsdbTm5UPPpxS+fE=
X-Google-Smtp-Source: APXvYqwKj9VRndGXWWOtHZc04aPsD0SeOqt2DCnlgm5Ae2NwnfDhoDHLtMepQBRl1p0R3Z+cAPamzQhXwNx2pdlA/jM=
X-Received: by 2002:a02:924d:: with SMTP id y13mr33137561jag.24.1556322900697; 
 Fri, 26 Apr 2019 16:55:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190326103146.24795-1-tomi.valkeinen@ti.com>
 <20190326103146.24795-3-tomi.valkeinen@ti.com>
 <20190420203049.GE4964@pendragon.ideasonboard.com>
 <275405d7-0538-93bb-ac06-f37fee942b7c@ti.com>
In-Reply-To: <275405d7-0538-93bb-ac06-f37fee942b7c@ti.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Fri, 26 Apr 2019 16:54:49 -0700
Message-ID: <CAHQ1cqE-qB0__p7hLUq7_Ug=Ek505oL5dNLOsWP9Tf0ebbMG9A@mail.gmail.com>
Subject: Re: [PATCHv2 02/22] drm/bridge: tc358767: reset voltage-swing &
 pre-emphasis
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
X-Mailman-Approved-At: Mon, 29 Apr 2019 07:28:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=WU03Ki48Dvm6T/xud/B67f7U5Mq2RTuwpBv2iAIar80=;
 b=SnK4gLjS5RmgLi89OvbJINHuopocenT+MJWrrwfTCkF/u/Py9Q0WsmxGHUgkhp0Ka/
 vugJhkjvveV8rnwJtJVfugjeiYPTdgciaSn+nFSwHBd59rk6vHwaWcBsi3hRqUxm8yn4
 Jo8gwtfnPkzyCSZT3KXGQNITD9JqKT7mxzNWvr4dIbQ+JQv9qSW8Y47ItFCNEycY2ShW
 c0qF45h95WTxqmFQ+r5hZHVmkSQIRF7RYtVTn0RgnY+G5AWZByFcjQbbFGltFQ9ZShlW
 oa8yTsyOWriTT9DnpSIfJuoeIzgOy8kyyNFVkkGY1eVjmEFYXxpGAWbeae3UgfCBfsx0
 ZgTw==
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
Cc: Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 Jyri Sarha <jsarha@ti.com>, dri-devel@lists.freedesktop.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBcHIgMjYsIDIwMTkgYXQgNzoxNCBBTSBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxr
ZWluZW5AdGkuY29tPiB3cm90ZToKPgo+IE9uIDIwLzA0LzIwMTkgMjM6MzAsIExhdXJlbnQgUGlu
Y2hhcnQgd3JvdGU6Cj4gPiBIaSBUb21pLAo+ID4KPiA+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNo
Lgo+ID4KPiA+IE9uIFR1ZSwgTWFyIDI2LCAyMDE5IGF0IDEyOjMxOjI2UE0gKzAyMDAsIFRvbWkg
VmFsa2VpbmVuIHdyb3RlOgo+ID4+IFdlIG5lZWQgdG8gcmVzZXQgRFBDRCB2b2x0YWdlLXN3aW5n
ICYgcHJlLWVtcGhhc2lzIGJlZm9yZSBzdGFydGluZyB0aGUKPiA+PiBsaW5rIHRyYWluaW5nLCBh
cyBvdGhlcndpc2UgdGMzNTg3Njcgd2lsbCB1c2UgdGhlIHByZXZpb3VzIHZhbHVlcyBhcwo+ID4+
IG1pbmltdW1zLgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogVG9taSBWYWxrZWluZW4gPHRvbWku
dmFsa2VpbmVuQHRpLmNvbT4KPiA+PiAtLS0KPiA+PiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90
YzM1ODc2Ny5jIHwgNiArKysrKysKPiA+PiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygr
KQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3Njcu
YyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYwo+ID4+IGluZGV4IDcwMzFjNGY1
MmM1Ny4uMTFhNTBmN2JiNGJlIDEwMDY0NAo+ID4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvdGMzNTg3NjcuYwo+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3Njcu
Ywo+ID4+IEBAIC05NTYsNiArOTU2LDEyIEBAIHN0YXRpYyBpbnQgdGNfbWFpbl9saW5rX3NldHVw
KHN0cnVjdCB0Y19kYXRhICp0YykKPiA+PiAgICAgIGlmIChyZXQgPCAwKQo+ID4+ICAgICAgICAg
ICAgICBnb3RvIGVycl9kcGNkX3dyaXRlOwo+ID4+Cj4gPj4gKyAgICAvLyBSZXNldCB2b2x0YWdl
LXN3aW5nICYgcHJlLWVtcGhhc2lzCj4gPgo+ID4gVGhlIGRyaXZlciB1c2VzIEMtc3R5bGUgY29t
bWVudHMsIEkgdGhpbmsgaXQgd291bGQgYmUgYmVzdCB0byBzdGljayB0bwo+ID4gdGhlbSB0byBh
dm9pZCBhIHN0eWxlIG1pc21hdGNoLgo+Cj4gT29wcy4gWWVwLiBJIG9mdGVuIHVzZSBjKysgY29t
bWVudHMgd2hlbiBoYWNraW5nL2RldmVsb3BpbmcgYXMgdGhleSdyZQo+IG9mdGVuIGVhc2llciB0
byB1c2UuIFNvbWV0aW1lcyBJIG1pc3MgY29udmVydGluZyB0aGVtIHRvIGMgY29tbWVudHMuLi4K
Pgo+ID4KPiA+PiArICAgIHRtcFswXSA9IHRtcFsxXSA9IERQX1RSQUlOX1ZPTFRBR0VfU1dJTkdf
TEVWRUxfMCB8IERQX1RSQUlOX1BSRV9FTVBIX0xFVkVMXzA7Cj4gPgo+ID4gWW91IG1heSB3YW50
IHRvIHdyYXAgdGhlIGxpbmUuCj4KPiBXZWxsLCBJIHBlcnNvbmFsbHkgZG9uJ3QgdGhpbmsgd3Jh
cHBpbmcgYXQgODAgaXMgYSBnb29kIGlkZWEuCgpUcnlpbmcgdG8gcmVhZCB0d28gZmlsZXMgc2lk
ZSBieSBzaWRlIG9uIGEgMTMiIGxhcHRvcCBzY3JlZW4gbWlnaHQKY2hhbmdlIHlvdXIgbWluZCA6
LSkgKzEgb24gd3JhcHBpbmcgdGhlIGNvZGUgYXJvdW5kIDgwIGNoYXJhY3RlciBmcm9tCm1lLgoK
VGhhbmtzLApBbmRyZXkgU21pcm5vdgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
