Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0504BB4E88
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 14:53:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E606E338;
	Tue, 17 Sep 2019 12:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 495EC6E338
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 12:53:06 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id v8so3236995eds.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 05:53:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=hO+S2hn6G7IY85utEMPYlFYUwK0C3wWS4/W0+cvkWvo=;
 b=AEiAxCjPAjl4r1XVIDSBFwEHqpzBiyzzACr2kX3MF7g8wd2i/lSZoFUzolNyChuBRZ
 /gNznA4Z9M95rbgNj36yetG48kBQ0mG//aKR+I7cNQakkWJIxm7XE0gc38mQg2mv4xJx
 zMPR7B8zKcSaBLog+ujPIfGc8IrQOQyiCikhZJWjIGMT32SjCDuNVKC2LJ//Vi7uBcWZ
 tZjMqxTofPn4KpEq2Kq7+53BliG3PEM4dNPt4yabgAozkUlKORveBSsl86IF7JpZiXhF
 gs4wQ2enIm9yUYgLlGed2YcF12lzmskAHlI/MhrYEOc/XrdlgzWQRhoHKWKFvXqX5oLM
 XRow==
X-Gm-Message-State: APjAAAUiK+v0dJyHJ3HHF0Mke/qcQGSZ/dVu/QCMFwmKaNI0dZMCZg/v
 Vdu0kuW3SpdGOng1cEOCNoQSirjG060=
X-Google-Smtp-Source: APXvYqwMfjAvYVaFs8oW8jSgXu1sWU9T6LkhxnE/tQlcylPsSiT/jdUiW99WUngxF+LYi3GeN9sBeg==
X-Received: by 2002:a17:906:1e0e:: with SMTP id
 g14mr4455036ejj.247.1568724784844; 
 Tue, 17 Sep 2019 05:53:04 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id e44sm422367ede.34.2019.09.17.05.53.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2019 05:53:04 -0700 (PDT)
Date: Tue, 17 Sep 2019 14:53:01 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ayan Halder <Ayan.Halder@arm.com>
Subject: Re: [RFC PATCH] drm:- Add a modifier to denote 'protected' framebuffer
Message-ID: <20190917125301.GQ3958@phenom.ffwll.local>
Mail-Followup-To: Ayan Halder <Ayan.Halder@arm.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 Brian Starkey <Brian.Starkey@arm.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "sean@poorly.run" <sean@poorly.run>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 nd <nd@arm.com>
References: <20190909134241.23297-1-ayan.halder@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190909134241.23297-1-ayan.halder@arm.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=hO+S2hn6G7IY85utEMPYlFYUwK0C3wWS4/W0+cvkWvo=;
 b=VbqfDbhYu5lY9hD/YtniwKxIj8byA+w6ZYv9TnFclvEWGntf4QTtQMKzIC6r9Q94UR
 6wEfXIofBdkKXWmaOoguT6JyQX+Xm/5qgXuA3d9gXp8/ibLFeVgf9rDDs/28vhIs60Jp
 G9rx1ZwPbHW0jnFONJB0tr8UUPb05EtgaBvIk=
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
Cc: "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@linux.ie" <airlied@linux.ie>, nd <nd@arm.com>,
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMDksIDIwMTkgYXQgMDE6NDI6NTNQTSArMDAwMCwgQXlhbiBIYWxkZXIgd3Jv
dGU6Cj4gQWRkIGEgbW9kaWZpZXIgJ0RSTV9GT1JNQVRfTU9EX0FSTV9QUk9URUNURUQnIHdoaWNo
IGRlbm90ZXMgdGhhdCB0aGUgZnJhbWVidWZmZXIKPiBpcyBhbGxvY2F0ZWQgaW4gYSBwcm90ZWN0
ZWQgc3lzdGVtIG1lbW9yeS4KPiBFc3NlbnRpYWxseSwgd2Ugd2FudCB0byBzdXBwb3J0IEVHTF9F
WFRfcHJvdGVjdGVkX2NvbnRlbnQgaW4gb3VyIGtvbWVkYSBkcml2ZXIuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogQXlhbiBLdW1hciBIYWxkZXIgPGF5YW4uaGFsZGVyQGFybS5jb20+Cj4gCj4gLy0tIE5v
dGUgdG8gcmV2aWV3ZXIKPiBLb21lZGEgZHJpdmVyIGlzIGNhcGFibGUgb2YgcmVuZGVyaW5nIERS
TSAoRGlnaXRhbCBSaWdodHMgTWFuYWdlbWVudCkgcHJvdGVjdGVkCj4gY29udGVudC4gVGhlIERS
TSBjb250ZW50IGlzIHN0b3JlZCBpbiBhIGZyYW1lYnVmZmVyIGFsbG9jYXRlZCBpbiBzeXN0ZW0g
bWVtb3J5Cj4gKHdoaWNoIG5lZWRzIHNvbWUgc3BlY2lhbCBoYXJkd2FyZSBzaWduYWxzIGZvciBh
Y2Nlc3MpLgo+IAo+IExldCB1cyBpZ25vcmUgaG93IHRoZSBwcm90ZWN0ZWQgc3lzdGVtIG1lbW9y
eSBpcyBhbGxvY2F0ZWQgYW5kIGZvciB0aGUgc2NvcGUgb2YKPiB0aGlzIGRpc2N1c3Npb24sIHdl
IHdhbnQgdG8gZmlndXJlIG91dCB0aGUgYmVzdCB3YXkgcG9zc2libGUgZm9yIHRoZSB1c2Vyc3Bh
Y2UKPiB0byBjb21tdW5pY2F0ZSB0byB0aGUgZHJtIGRyaXZlciB0byB0dXJuIHRoZSBwcm90ZWN0
ZWQgbW9kZSBvbiAoZm9yIGFjY2Vzc2luZyB0aGUKPiBmcmFtZWJ1ZmZlciB3aXRoIHRoZSBEUk0g
Y29udGVudCkgb3Igb2ZmLgo+IAo+IFRoZSBwb3NzaWJsZSB3YXlzIGJ5IHdoaWNoIHRoZSB1c2Vy
c3BhY2UgY291bGQgYWNoaWV2ZSB0aGlzIGlzIHZpYTotCj4gCj4gMS4gTW9kaWZpZXJzIDotIFRo
aXMgbG9va3MgdG8gbWUgdGhlIGJlc3Qgd2F5IGJ5IHdoaWNoIHRoZSB1c2Vyc3BhY2UgY2FuCj4g
Y29tbXVuaWNhdGUgdG8gdGhlIGtlcm5lbCB0byB0dXJuIHRoZSBwcm90ZWN0ZWQgbW9kZSBvbiBm
b3IgdGhlIGtvbWVkYSBkcml2ZXIKPiBhcyBpdCBpcyBnb2luZyB0byBhY2Nlc3Mgb25lIG9mIHRo
ZSBwcm90ZWN0ZWQgZnJhbWVidWZmZXJzLiBUaGUgb25seSBwcm9ibGVtIGlzCj4gdGhhdCB0aGUg
Y3VycmVudCBtb2RpZmllcnMgZGVzY3JpYmUgdGhlIHRpbGluZy9jb21wcmVzc2lvbiBmb3JtYXQu
IEhvd2V2ZXIsIGl0Cj4gZG9lcyBub3QgaHVydCB0byBleHRlbmQgdGhlIG1lYW5pbmcgb2YgbW9k
aWZpZXJzIHRvIGRlbm90ZSBvdGhlciBhdHRyaWJ1dGVzIG9mCj4gdGhlIGZyYW1lYnVmZmVyIGFz
IHdlbGwuCj4gCj4gVGhlIG90aGVyIHJlYXNvbiBpcyB0aGF0IG9uIEFuZHJvaWQsIHdlIGdldCBh
biBpbmZvIGZyb20gR3JhbGxvYwo+IChHUkFMTE9DX1VTQUdFX1BST1RFQ1RFRCkgd2hpY2ggdGVs
bHMgdXMgdGhhdCB0aGUgYnVmZmVyIGlzIHByb3RlY3RlZC4gVGhpcyBjYW4KPiBiZSB1c2VkIHRv
IHNldCB1cCB0aGUgbW9kaWZpZXIvcyAoQWRkRkIyKSBkdXJpbmcgZnJhbWVidWZmZXIgY3JlYXRp
b24uCgpIb3cgZG9lcyB0aGlzIG1lc2ggd2l0aCBvdGhlciBtb2RpZmllcnMsIGxpa2UgQUZCQz8g
VGhhdCdzIHdoZXJlIEkgc2VlIHRoZQppc3N1ZSBoZXJlLgo+IAo+IDIuIEZyYW1lYnVmZmVyIGZs
YWdzIDotIEFzIG9mIHRvZGF5LCB0aGlzIGNhbiBiZSBvbmUgb2YgdGhlIHR3byB2YWx1ZXMKPiBp
ZSAoRFJNX01PREVfRkJfSU5URVJMQUNFRC9EUk1fTU9ERV9GQl9NT0RJRklFUlMpLiBVbmxpa2Ug
bW9kaWZpZXJzLCB0aGUgZHJtCj4gZnJhbWVidWZmZXIgZmxhZ3MgYXJlIGdlbmVyaWMgdG8gdGhl
IGRybSBzdWJzeXN0ZW0gYW5kIGlkZWFsbHkgd2Ugc2hvdWxkIG5vdAo+IGludHJvZHVjZSBhbnkg
ZHJpdmVyIHNwZWNpZmljIGNvbnN0cmFpbnQvZmVhdHVyZS4KPiAKPiAzLiBDb25uZWN0b3IgcHJv
cGVydHk6LSBJIGNvdWxkIHNlZSB0aGUgZm9sbG93aW5nIHByb3BlcnRpZXMgdXNlZCBmb3IgRFJN
Cj4gcHJvdGVjdGVkIGNvbnRlbnQ6LQo+IERSTV9NT0RFX0NPTlRFTlRfUFJPVEVDVElPTl9ERVNJ
UkVEIC8gRU5BQkxFRCA6LSAiVGhpcyBwcm9wZXJ0eSBpcyB1c2VkIGJ5Cj4gdXNlcnNwYWNlIHRv
IHJlcXVlc3QgdGhlIGtlcm5lbCBwcm90ZWN0IGZ1dHVyZSBjb250ZW50IGNvbW11bmljYXRlZCBv
dmVyCj4gdGhlIGxpbmsiLiBDbGVhcmx5LCB3ZSBhcmUgbm90IGNvbmNlcm5lZCB3aXRoIHRoZSBw
cm90ZWN0aW9uIGF0dHJpYnV0ZXMgb2YgdGhlCj4gdHJhbnNtaXR0ZXIuIFNvLCB3ZSBjYW5ub3Qg
dXNlIHRoaXMgcHJvcGVydHkgZm9yIG91ciBjYXNlLgo+IAo+IDQuIERSTSBwbGFuZSBwcm9wZXJ0
eTotIEFnYWluLCB3ZSB3YW50IHRvIGNvbW11bmljYXRlIHRoYXQgdGhlIGZyYW1lYnVmZmVyKHdo
aWNoCj4gY2FuIGJlIGF0dGFjaGVkIHRvIGFueSBwbGFuZSkgaXMgcHJvdGVjdGVkLiBTbyBpbnRy
b2R1Y2luZyBhIG5ldyBwbGFuZSBwcm9wZXJ0eQo+IGRvZXMgbm90IGhlbHAuCj4gCj4gNS4gRFJN
IGNydGMgcHJvcGVydHk6LSBGb3IgdGhlIHNhbWUgcmVhc29uIGFzIGFib3ZlLCBpbnRyb2R1Y2lu
ZyBhIG5ldyBjcnRjCj4gcHJvcGVydHkgZG9lcyBub3QgaGVscC4KCjYuIEp1c3QgdHJhY2sgdGhp
cyBhcyBwYXJ0IG9mIGJ1ZmZlciBhbGxvY2F0aW9uLCBpLmUuIEkgdGhpbmsgaXQgZG9lcwptYXR0
ZXIgaG93IHlvdSBhbGxvY2F0ZSB0aGVzZSBwcm90ZWN0ZWQgYnVmZmVycy4gV2UgY291bGQgYWRk
IGEgImlzCnByb3RlY3RlZCBidWZmZXIiIGZsYWcgYXQgdGhlIGRtYV9idWYgbGV2ZWwgZm9yIHRo
aXMuCgpTbyB5ZWFoIGZvciB0aGlzIHN0dWZmIGhlcmUgSSB0aGluayB3ZSBkbyB3YW50IHRoZSBm
dWxsIHVzZXJzcGFjZSBzaWRlLApmcm9tIGFsbG9jYXRvciB0byByZW5kZXJpbmcgc29tZXRoaW5n
IGludG8gdGhpcyBwcm90ZWN0ZWQgYnVmZmVycyAobm8gbmVlZAp0byBhbHNvIGhhdmUgdGhlIGVu
dGlyZSAiZGVjb2RlIGEgcHJvdGVjdGVkIGJpdHN0cmVhbSBwYXJ0IiBpbW8sIHNpbmNlCnRoYXQg
d2lsbCBmcmVhayBwZW9wbGUgb3V0KS4gVW5mb3J0dW5hdGVseSwgaW4gbXkgZXhwZXJpZW5jZSwg
dGhhdCBraWxscwppdCBmb3IgdXBzdHJlYW0gOi0vIEJ1dCBhbHNvIGluIG15IGV4cGVyaWVuY2Ug
b2YgbG9va2luZyBpbnRvIHRoaXMgZm9yCm90aGVyIGdwdSdzLCB3ZSByZWFsbHkgbmVlZCB0byBo
YXZlIHRoZSBmdWxsIHBpY3R1cmUgaGVyZSB0byBtYWtlIHN1cmUKd2UncmUgbm90IHNjcmV3aW5n
IHRoaXMgdXAuCi1EYW5pZWwKCj4gCj4gLS0vCj4gCj4gLS0tCj4gIGluY2x1ZGUvdWFwaS9kcm0v
ZHJtX2ZvdXJjYy5oIHwgOSArKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9u
cygrKQo+IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaCBiL2lu
Y2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oCj4gaW5kZXggM2ZlZWFhM2Y5ODdhLi4zOGU1ZTgx
ZDExZmUgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmgKPiArKysg
Yi9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaAo+IEBAIC03NDIsNiArNzQyLDE1IEBAIGV4
dGVybiAiQyIgewo+ICAgKi8KPiAgI2RlZmluZSBBRkJDX0ZPUk1BVF9NT0RfQkNIICAgICAoMVVM
TCA8PCAxMSkKPiAgCj4gKy8qCj4gKyAqIFByb3RlY3RlZCBmcmFtZWJ1ZmZlcgo+ICsgKgo+ICsg
KiBUaGUgZnJhbWVidWZmZXIgaXMgYWxsb2NhdGVkIGluIGEgcHJvdGVjdGVkIHN5c3RlbSBtZW1v
cnkgd2hpY2ggY2FuIGJlIGFjY2Vzc2VkCj4gKyAqIHZpYSBzb21lIHNwZWNpYWwgaGFyZHdhcmUg
c2lnbmFscyBmcm9tIHRoZSBkcHUuIFRoaXMgaXMgdXNlZCB0byBzdXBwb3J0Cj4gKyAqICdHUkFM
TE9DX1VTQUdFX1BST1RFQ1RFRCcgaW4gb3VyIGZyYW1lYnVmZmVyIGZvciBFR0xfRVhUX3Byb3Rl
Y3RlZF9jb250ZW50Lgo+ICsgKi8KPiArI2RlZmluZSBEUk1fRk9STUFUX01PRF9BUk1fUFJPVEVD
VEVECWZvdXJjY19tb2RfY29kZShBUk0sICgxVUxMIDw8IDU1KSkKPiArCj4gIC8qCj4gICAqIEFs
bHdpbm5lciB0aWxlZCBtb2RpZmllcgo+ICAgKgo+IC0tIAo+IDIuMjMuMAo+IAoKLS0gCkRhbmll
bCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9n
LmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
