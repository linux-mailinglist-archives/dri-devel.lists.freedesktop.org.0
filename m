Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE0A19E4F2
	for <lists+dri-devel@lfdr.de>; Sat,  4 Apr 2020 14:45:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F00F76E142;
	Sat,  4 Apr 2020 12:45:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8312B6E209;
 Fri,  3 Apr 2020 08:29:04 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id i7so8341130edq.3;
 Fri, 03 Apr 2020 01:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ji/Kw+Gp/dYAEcNgsOkprc1Dknrrsb5ucuzSucuATuY=;
 b=i3+CnjojfPt7Sq3XtAbwvUPLSMPEHkIlbrr3Kj5S3C2932OXocFzU+OX62j0VRSdyC
 JFfy3sap9IMg9qK0bRrjqhqkBIuDVxaHajd7piEKVVyX2ump3V+ZHDCwcWtW3nVCpruX
 kDbP/I7xh/IgjvK2rsso4txesJcgoLkgpvCglByMl7W3XIw4KmTozuS6+ym6y8vpS47Y
 moGhnaa9jNVXB3cDsySJbTA153yubQpwS2FpwGhOacB3MSdFpKtEfZo3PGd6I7y5bezb
 ci668QZnPJMoM+jjJBvm0WLbDzWWuRuJiRo3lZQl4dfooakgGqPKwMvm+d0TUWftImQ7
 pXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ji/Kw+Gp/dYAEcNgsOkprc1Dknrrsb5ucuzSucuATuY=;
 b=nAnIvMIsBvMYnXOwSnTaZP9ZGcmSykuA4kC7cYxwzEHAov0RPG4w2O0HPAsVLozW3G
 T7yb8W9faTz3T0dhZYsS3/IsQO2ZFNE58993m9MiUBtEnCQg+ujj7Y0/+hjTJP4+VUeu
 Uh6ad/+cYe7UGaSdh+r+TBnYHxymYNyap0t5FFdW8oJpei5IuFGyizkgeg6bgBKdm733
 t1BVdVgldj0Wx5VBsV8E+zwxOuYfMQKkRe2woDnA5roNKmyFgyqM5PxlI6c4UHIBCOcv
 AZIHVvTmh0s2+Am7wrFLUYXVTbBNysFlvLoul9TC2L0DwM08+WMacBzSmKylKG1Cxiao
 sB9A==
X-Gm-Message-State: AGi0PubaIh7LdSjHxu+GCqd8fkpvC6MNHoCOceaB0E0oMw7J0kmqYjpq
 2iGk42sMO4Z8yEp6UOqq1KeMpGONBxquQt2kxJg=
X-Google-Smtp-Source: APiQypJEggPFwK79IksAV1Q8tO3tVYJF1KxMCTcJsM6PQQV35kksum5IbERbzsVQjrXUNy1ifAPGZt8hJJ2V0nL0moU=
X-Received: by 2002:a17:906:d1c3:: with SMTP id
 bs3mr7083561ejb.334.1585902543057; 
 Fri, 03 Apr 2020 01:29:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAJgxT3-11eZqvysgCQMCYtKEUVsNWWHd+7au91uNC7SWK1Fyug@mail.gmail.com>
 <20200403111411.5e4e6bfe@eldfell.localdomain>
In-Reply-To: <20200403111411.5e4e6bfe@eldfell.localdomain>
From: Guillermo Rodriguez <guillerodriguez.dev@gmail.com>
Date: Fri, 3 Apr 2020 10:28:52 +0200
Message-ID: <CABDcavY_00eeD-zR-CZNCwFdBL56DcFh4yAO_W4t+xC3j_qsow@mail.gmail.com>
Subject: Re: Aliases for DRI connectors?
To: Pekka Paalanen <ppaalanen@gmail.com>
X-Mailman-Approved-At: Sat, 04 Apr 2020 12:45:43 +0000
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
Cc: Matt Hoosier <matt.hoosier@gmail.com>, dri-devel@lists.freedesktop.org,
 wayland mailing list <wayland-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUGVra2EsCgpFbCB2aWUuLCAzIGFici4gMjAyMCBhIGxhcyAxMDoxNCwgUGVra2EgUGFhbGFu
ZW4KKDxwcGFhbGFuZW5AZ21haWwuY29tPikgZXNjcmliacOzOgo+Cj4gT24gV2VkLCAxIEFwciAy
MDIwIDE0OjM4OjM3IC0wNTAwCj4gTWF0dCBIb29zaWVyIDxtYXR0Lmhvb3NpZXJAZ21haWwuY29t
PiB3cm90ZToKPgo+ID4gSSdtIHNlYXJjaGluZyBmb3Igc29tZSBzb3J0IG9mIHNjaGVtZSB0aGF0
IHdpbGwgbGV0IG15IERSSSBtYXN0ZXIgcXVlcnkgdGhlCj4gPiBzZXQgb2YgYXZhaWxhYmxlIGNv
bm5lY3RvcnMgYW5kIHNlbGVjdCB0aGUgb25lIGNhcnJ5aW5nIGEgcHJlYXJyYW5nZWQKPiA+IGRl
c2lnbmF0aW9uLiBUaGUgcHJvYmxlbSBJJ20gdHJ5aW5nIHRvIHNvbHZlIGlzIHRvIGFsbG93IGRl
cGxveWluZyBvbmUKPiA+IHN0YW5kYXJkaXplZCB1c2Vyc3BhY2UgY29tcG9uZW50IGFjcm9zcyBh
IGZsZWV0IG9mIGRldmljZXMgdGhhdCBoYXZlCj4gPiB2YXJ5aW5nIG51bWJlcnMgb2YgZGlzcGxh
eXMsIHdpdGggdGhlIHVzZSBjYXNlcyBub3QgYWx3YXlzIGRyaXZlbiBvbiB0aGUKPiA+IHNhbWUg
Y29ubmVjdG9yIHRvcG9sb2dpY2FsbHkuCj4gPgo+ID4gSSBoYWQgYSBsb29rIGFyb3VuZCB0aGUg
cHJvcGVydGllcyBhdmFpbGFibGUgb24gbXkgc3lzdGVtJ3MgRFJJIGNvbm5lY3RvcnMsCj4gPiBh
bmQgbm90aGluZyBpbW1lZGlhdGUganVtcGVkIG91dCBhdCBtZS4gSXMgdGhlcmUgYSBzdGFuZGFy
ZCBjb25uZWN0b3IKPiA+IHByb3BlcnR5IHRoYXQgKGFzc3VtaW5nIEkgY2FuIGZpbmQgdGhlIHJp
Z2h0IHBsYWNlIGluIERldmljZVRyZWUgb3Igc2ltaWxhcgo+ID4gdG8pIHRoYXQgd291bGQgYmUg
YSBnb29kIGZpdCBmb3IgdGhpcz8KPgo+IEhpLAo+Cj4gSSd2ZSBuZXZlciBoZWFyZCBvZiBhIHRo
aW5nIHRoYXQgY291bGQgYWNjb21wbGlzaCB0aGF0LiBEUk0gY29ubmVjdG9yCj4gbmFtZXMgYXJl
IG5vdCBldmVuIGFjdHVhbGx5IGNvbW11bmljYXRlZCB0byB1c2Vyc3BhY2UuIFdoYXQgdXNlcnNw
YWNlCj4gc2VlcyBpcyBjb25uZWN0b3IgdHlwZSAoZW51bSkgYW5kIHNvbWUgY291bnRlciBudW1i
ZXJzICh3aGljaCBhcmUgbm90Cj4gcGVyc2lzdGVudCwgc28gbm90IHJlbGlhYmxlIGlmIHlvdSBo
YXZlIGUuZy4gbXVsdGlwbGUgRFJNIGRyaXZlcnMKPiByYWNpbmcgdG8gaW5pdGlhbGl6ZSksCgpJ
IG1heSBiZSBtaXNyZWFkaW5nIHlvdSwgYnV0IGRvZXMgdGhpcyBtZWFuIHRoYXQgdGhlIGNvbm5l
Y3RvciBuYW1lcwp1c2VkIGluIHRoZSBbb3V0cHV0XSBzZWN0aW9uIG9mIHRoZSB3ZXN0b24uaW5p
IGNvbmZpZ3VyYXRpb24gZmlsZSBhcmUKbm90IHJlbGlhYmxlPwpUaGVuIHdoYXQgaXMgdGhlIHBy
b3BlciB3YXkgdG8gY29uZmlndXJlIG9uZSBzcGVjaWZpYyAocGh5c2ljYWwpCm91dHB1dCBpbiBX
ZXN0b24/CgpCUiwKCkd1aWxsZXJtbwoKPiBhbmQgdGhlbiB1c2Vyc3BhY2UgbWFudWZhY3R1cmVz
IGEgY29ubmVjdG9yIG5hbWUKPiBmcm9tIHRob3NlLiBUaGlzIGhhcyBiZWVuIG1vc3QgcGFpbmZ1
bCB3aXRoIFhvcmcsIHdoZXJlIHRoZSBkaWZmZXJlbnQKPiB2aWRlbyBERFggZHJpdmVycyB1c2Vk
IHRvIHVzZSBkaWZmZXJlbnQgY29udmVudGlvbnMgaW4gbWFraW5nIHVwIHRoZQo+IG5hbWVzLCBt
ZWFuaW5nIHRoYXQgaWYgeW91IHN3aXRjaGVkIEREWGVzIChlLmcuIGJldHdlZW4gZHJpdmVyLXNw
ZWNpZmljCj4gZHJpdmVyIGFuZCBtb2Rlc2V0dGluZyBkcml2ZXIpLCB0aGUgY29ubmVjdG9yIG5h
bWVzIGNoYW5nZWQKPiBpbnZhbGlkYXRpbmcgeW91ciB4b3JnLmNvbmYuCj4KPiBIb3dldmVyLCB0
aGUgcHJvYmxlbSBvZiBub24tcGVyc2lzdGVudCBjb25uZWN0b3IgbmFtZXMgaGFzIGJlZW4gdGhv
dWdodAo+IG9mLCBzZWUgZS5nLjoKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNo
aXZlcy9kcmktZGV2ZWwvMjAxOS1KdW5lLzIyMTkwMi5odG1sCj4gVGhlIHRocmVhZCBoYXMgbWVz
c2FnZXMgYWxzbyBpbiBKdWx5IGFuZCBBdWd1c3QuCj4KPiBJZiB5b3UgaGFkIHJlbGlhYmxlLCBw
ZXJzaXN0ZW50IGNvbm5lY3RvciBuYW1lcyAoYW5kIHVzZWQgZS5nLiBkZXZpY2UKPiBwYXRoIGZy
b20gdWRldiB0byByZWxpYWJseSBpZGVudGlmeSBEUk0gZGV2aWNlcyksIG1heWJlIHlvdSBjb3Vs
ZCBidWlsZAo+IHNvbWV0aGluZyBvbiB0b3Agb2YgdGhhdD8KPgo+IFRob3VnaCBJIGRvdWJ0IGlm
IG1haW50YWluZXJzIHdvdWxkIGxpa2UgeW91ciBjb25maWcgdG8gYmUgaW4gRFQgb3IKPiBrZXJu
ZWwsIG1heWJlIGl0IG5lZWRzIHRvIGJlIGhhbmRsZWQgaW4gdXNlcnNwYWNlPwo+Cj4KPiBUaGFu
a3MsCj4gcHEKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IHdheWxhbmQtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gd2F5bGFuZC1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3dheWxhbmQtZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
