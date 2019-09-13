Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C670BB1968
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 10:14:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 655946EEC8;
	Fri, 13 Sep 2019 08:14:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D03F06EEC8
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 08:14:53 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id 67so28641952oto.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 01:14:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YNW9mDyIVRFqB5FPZ6madsda4K792LcwbzdvqC7teog=;
 b=tgE73iXKuzZPK6SqtIet/tUPpnG4o8yKXTXS36zxArmEVqaXzEU6V+t177/BSApot+
 EOJ+L3UhQ7HH1DthRKtUtmUVDOrTgjwyKmt/wj2l1O/e3AFVYf2kMTOxVf0XdK4J5O9o
 bpyIkqMYC5Qh0+/3wAs14X4PR+i7PiYY+q8gRfHZGgtehl9aHXnzGfV5kHLX1mibq/Yj
 Aur6CUGlG/Rn/U/n1HP7W88pp7uL8bezGUt4Ap485RVGx4M0xLRBmDdTYwsk2mZLG4EI
 KoiWLBFkCSn69PtIe1DliatDTNgi1IXaPcPdHO73pfgd1NcrFobSBW8FKy+0pW6MhYQG
 VMgg==
X-Gm-Message-State: APjAAAX2lolLRY2YY6xrqaAZx7KwwcJqXilfZuK8C0ZrqI7JHhByVTyV
 emVMHKgOi3tyZdyMtfLy5i/KmvIVQ78Jl5P6KFjNxaI2
X-Google-Smtp-Source: APXvYqyJF3XPR8yIepPjSdvqoRfwOuHH4dK4061v41kqRFKA+Qv9tAVEH9e9HdevYknLZYJwmrcPSw4Mb0cr25cDaAk=
X-Received: by 2002:a05:6830:1594:: with SMTP id
 i20mr22939696otr.188.1568362492893; 
 Fri, 13 Sep 2019 01:14:52 -0700 (PDT)
MIME-Version: 1.0
References: <10cb9f86-9d46-6654-ad9d-dcb77d6ef624@amd.com>
 <20190912074751.GB14191@intel.com>
 <57b94728-9dd5-a794-8a76-1a40dd857381@amd.com> <87ftl1zhni.fsf@intel.com>
 <0816be99-e85b-3b93-96d2-c4f007f24c6a@amd.com>
In-Reply-To: <0816be99-e85b-3b93-96d2-c4f007f24c6a@amd.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 13 Sep 2019 10:14:41 +0200
Message-ID: <CAKMK7uHES1hPEBNwrLfOyS+Tk9jn_bmX+j+LJWEFDWL-oSvneg@mail.gmail.com>
Subject: Re: HDCP Content Type Interface
To: Harry Wentland <hwentlan@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YNW9mDyIVRFqB5FPZ6madsda4K792LcwbzdvqC7teog=;
 b=Htv5uwQPYK+WK5knqffwXkWdqnyEvV50tJ2itYMTEGsl/wu/DM39PcdPN+ChWk5Qa8
 HGMrRiwgmJfbwaS5DPn3AWpqhGdzI93YGt5fMY+pTpJFOElmqvv2ugY5S+nmjxbuY1Wu
 r8ZYuVdZUYKEU7rUQhAYn0m1CvBek1We++pSs=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTIsIDIwMTkgYXQgOToyMSBQTSBIYXJyeSBXZW50bGFuZCA8aHdlbnRsYW5A
YW1kLmNvbT4gd3JvdGU6Cj4KPgo+Cj4gT24gMjAxOS0wOS0xMiAxMDo1NyBhLm0uLCBKYW5pIE5p
a3VsYSB3cm90ZToKPiA+IE9uIFRodSwgMTIgU2VwIDIwMTksIEhhcnJ5IFdlbnRsYW5kIDxod2Vu
dGxhbkBhbWQuY29tPiB3cm90ZToKPiA+PiBPbiAyMDE5LTA5LTEyIDM6NDcgYS5tLiwgUmFtYWxp
bmdhbSBDIHdyb3RlOgo+ID4+PiBPbiAyMDE5LTA5LTA5IGF0IDE1OjU0OjUwICswMDAwLCBMYWto
YSwgQmhhd2FucHJlZXQgd3JvdGU6Cj4gPj4+PiBIaSBhbGwsCj4gPj4+Pgo+ID4+Pj4gVGhpcyBp
cyByZWdhcmRpbmcgdGhlIHJlY2VudCBoZGNwIGNvbnRlbnQgdHlwZSBwYXRjaCB0aGF0IHdhcyBt
ZXJnZWQgaW50byBkcm0tbWlzYy4gKGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9w
YXRjaC8zMjA5NTgvP3Nlcmllcz01NzIzMyZyZXY9MTEpCj4gPj4+Pgo+ID4+Pj4gVGhlcmUgYXJl
IGRpc3BsYXlzIG9uIHRoZSBtYXJrZXQgdGhhdCBhZHZlcnRpc2UgSERDUCAyLjIgc3VwcG9ydCBh
bmQgd2lsbCBwYXNzIGF1dGhlbnRpY2F0aW9uIGFuZCBlbmNyeXB0aW9uIGJ1dCB3aWxsIHRoZW4g
c2hvdyBhIGNvcnJ1cHRlZC9ibHVlL2JsYWNrIHNjcmVlbiAodGhlIGRyaXZlciBjYW5ub3QgZGV0
ZWN0IHRoaXMpLiBUaGVzZSBkaXNwbGF5cyB3b3JrIHdpdGggSERDUCAxLjQgd2l0aG91dCBhbnkg
aXNzdWVzLiBEdWUgdG8gdGhlIGxhcmdlIG51bWJlciBvZiBIRENQLXN1cHBvcnRpbmcgZGV2aWNl
cyBvbiB0aGUgbWFya2V0IHdlIG1pZ2h0IG5vdCBiZSBhYmxlIHRvIGNhdGNoIHRoZW0gd2l0aCBh
IGJsYWNrbGlzdC4KPiA+Pj4+Cj4gPj4+PiBGcm9tIHRoZSB1c2VyIG1vZGVzIHBlcnNwZWN0aXZl
LCBIRENQMS40IGFuZCBIRENQMi4yIFR5cGUwIGFyZSB0aGUgc2FtZSB0aGluZy4gTWVhbmluZyB0
aGF0IHRoaXMgaW50ZXJmYWNlIGRvZXNuJ3QgYWxsb3cgdXMgdG8gZm9yY2UgdGhlIGhkY3AgdmVy
c2lvbi4gRHVlIHRvIHRoZSBwcm9ibGVtcyBtZW50aW9uZWQgYWJvdmUgd2UgbWlnaHQgd2FudCB0
byBleHBvc2UgdGhlIGFiaWxpdHkgZm9yIGEgdXNlciB0byBmb3JjZSBhbiBIRENQIGRvd25ncmFk
ZSB0byBhIGNlcnRhaW4gbGV2ZWwgKGUuZy4gMS40KSBpbiBjYXNlIHRoZXkgZXhwZXJpZW5jZSBw
cm9ibGVtcy4KPiA+Pj4+Cj4gPj4+PiBXaGF0IGFyZSB5b3VyIHRob3VnaHRzPyBhbmQgd2hhdCB3
b3VsZCBiZSBhIGdvb2Qgd2F5IHRvIGRlYWwgd2l0aCBpdD8KPiA+Pj4gSGksCj4gPj4+Cj4gPj4+
IEFzIHlvdSBtZW50aW9uZWQsIHVBUEkgaXMgZGVzaWduZWQgdG8gYmUgSERDUCB2ZXJzaW9uIGFn
bm9zdGljLiBLZXJuZWwKPiA+Pj4gc3VwcG9zZWQgdG8gZXhlcmNpc2UgdGhlIGhpZ2hlc3QgdmVy
c2lvbiBvZiBIRENQIHN1cHBvcnRlZCBvbiBwYW5lbCBhbmQKPiA+Pj4gcGxhdGZvcm0uCj4gPj4+
Cj4gPj4+IEFzIHdlIGltcGxlbWVudCB0aGUgSERDUCBzcGVjIHN1cHBvcnQsIGlmIGEgZGV2aWNl
IGlzIG5vbi1jb21wbGlhbnQgd2l0aAo+ID4+PiBIRENQIHNwZWMgYWZ0ZXIgY29tcGxldGluZyB0
aGUgSERDUCBhdXRoZW50aWNhdGlvbiwgSSBkb250IHRoaW5rIHdlIG5lZWQKPiA+Pj4gdG8gd29y
cnkgYWJvdXQgaXQuCj4gPj4+Cj4gPj4KPiA+PiBUZWxsIHRoYXQgdG8gb3VyIChvciB5b3VyKSBj
dXN0b21lcnMuCj4gPgo+ID4gQWdyZWVkLCBsZXQncyByYXRoZXIgbm90Lgo+ID4KPiA+PiBJbiB0
aGlzIGNhc2UgYW4gZW5kdXNlciBtaWdodCBwbHVnIGluIGEgYmFkIG1vbml0b3Igb3IgVFYgYW5k
IGJlIHVuYWJsZQo+ID4+IHRvIHBsYXkgcHJvdGVjdGVkIGNvbnRlbnQuCj4gPj4KPiA+PiBXaGF0
IGlmIHdlIGFkZCBhIG5ldyBlbnVtIHZhbHVlIHRvIHRoZSBjb250ZW50X3R5cGUgcHJvcGVydHkg
dGhhdCBzYXlzCj4gPj4gIkRSTV9NT0RFX0hEQ1BfQ09OVEVOVF9UWVBFX0ZPUkNFXzE0Ij8KPiA+
Cj4gPiBJbiBnZW5lcmFsLCBJIHRoaW5rIGlmIHRoZSBmaXggaXMgdG8gdGVhY2ggdGhlIHVzZXIg
dG8ganVtcCB0aHJvdWdoCj4gPiBob29wcyBpbiBjYXNlIHRoZSBvdXRwdXQgaXMgbm90IHdvcmtp
bmcsIGl0IGlzIHJlYWxseSBub3QgYSBmaXguCj4gPgo+ID4gV291bGQsIHNheSwgYSBzZXQgdG9w
IGJveCBvciBhIEJsdS1yYXkgcGxheWVyIGhhdmUgYSBzZXR0aW5nIHRvIGZvcmNlCj4gPiBIRENQ
IDEuNCwgYW5kIGEgdHJvdWJsZXNob290aW5nIGl0ZW0gaW4gdGhlIG1hbnVhbCB0byBzZWxlY3Qg
dGhhdCBpZiB0aGUKPiA+IGRpc3BsYXkgZG9lcyBub3Qgd29yaz8gT3Igd291bGQgT1MgWCBoYXZl
IHRoYXQ/Cj4gPgo+Cj4gTm90IHN1cmUuIEFGQUlVIG9uIG90aGVyIE9TIHdlJ3JlIGN1cnJlbnRs
eSBkZWFsaW5nIHdpdGggdGhpcyB0aHJvdWdoCj4gbW9uaXRvciBxdWlya3MuIFdlIGNhbiBwcm9i
YWJseSBwdWxsIHRoZSBzYW1lIHF1aXJrcyB0byBEUk0uCj4KPiA+IElmIGJyb2tlbiBIRENQIDIu
MiBzaW5rIHN1cHBvcnQgaXMgYSB3aWRlc3ByZWFkIHByb2JsZW0gKGlzIGl0PyksIHdoYXQKPiA+
IGRvIG90aGVyIEhEQ1Agc291cmNlcyBkbz8gSWYgaXQncyBhIExpbnV4IGlzc3VlLCB3aGF0IGFy
ZSB3ZSBkb2luZyB3cm9uZwo+ID4gb3IgZGlmZmVyZW50Pwo+Cj4gTm90IGEgTGludXggaXNzdWUg
YW5kIG5vdCBvdmVybHkgd2lkZXNwcmVhZC4gTG9va3MgbGlrZSBhIGhhbmRmdWwgb2YKPiByZWNl
aXZlcnMgYXJlIHByb2JsZW1hdGljLgoKQ291bGQgd2UganVzdCBtYXNzLWltcG9ydCB0aGF0IHF1
aXJrIGxpc3QgKHNpbmNlIGl0IHNlZW1zIGl0J3Mgbm90CnVucmVhc29uYWJsZSBiaWcpIGFuZCBi
ZSBkb25lIHdpdGggdGhpcz8KLURhbmllbAoKPiBIYXJyeQo+Cj4gPgo+ID4KPiA+IEJSLAo+ID4g
SmFuaS4KPiA+Cj4gPgo+ID4KPiA+Pgo+ID4+IEhhcnJ5Cj4gPj4KPiA+Pj4gSW4gY2FzZSBpZiB5
b3Ugd2FudCB0byB0cmFjayBhbmQgaW1wbGVtZW50IGEgcXVpcmsgZm9yIGl0LCBsaWtlIG5vdCB0
bwo+ID4+PiBwcm9qZWN0IHRoZSBIRENQMi4yIGNhcGFiaWxpdHksIHlvdSBjYW4gdXNlIHRoZSBy
ZWNlaXZlciBpZCBvZiB0aGF0IHBhbmVsCj4gPj4+IHRvIHRyYWNrIGl0Lgo+ID4+Pgo+ID4+PiBU
aGFua3MsCj4gPj4+IC1SYW0KPiA+Pj4+Cj4gPj4+Pgo+ID4+Pj4gVGhhbmtzLAo+ID4+Pj4KPiA+
Pj4+IEJoYXdhbgo+ID4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gPj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+ID4+IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiA+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo+ID4KCgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5n
aW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Js
b2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
