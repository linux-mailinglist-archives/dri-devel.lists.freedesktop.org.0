Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8981502B
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 17:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E117E89A75;
	Mon,  6 May 2019 15:27:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67BF89A75
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 15:27:28 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id a8so15749792edx.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2019 08:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=utO6t28MWrTI48iGztsTSbVtbx1cM/zcvjPOlCN071M=;
 b=axvCWOxZvDYLlIrw3668Gc5LhfOOS9tXjOzABwZNbSeiiPbk/AeVnOv6ZBtppGrmke
 9WcA1HPqggs5Lv2i/p2EprWkISIQS1i6jIKhxZYjJ9XAigctIR/UsDoIK+l5AbtwCi1j
 SNbIUUxcUYeR3iCi1yLIM3TqpH4KQ2g/Iv8eg7hDrgwUY39SYrSnvYE5wIUfGsLDIBuL
 HWjcu6L2y+3RBF5gX5V+Qb0HlB7RttO9fWSE5WsuyKw3m4KjTlUlWvt06gTbx/xHvfqA
 pjd+m/Lkrr1oTPVGFfYU0t6FRTDiBV9WObmRhW5bUwTtQsZb4OeIQihQQvrnPebFQ9gw
 show==
X-Gm-Message-State: APjAAAWxpmDma7S7/4ZqqNZFWt7scisBZbj6k6rGpqtfuGP2Lj4JJl2V
 FRdpUAznfxS+I8kePXLR+UNpHg==
X-Google-Smtp-Source: APXvYqzDFqjVAWDg79OHRoCWg7F2PE6jQx2+H89NNo7nSXCC+xFCE6ZzrL/GV2dqmbzBnCB3rnRu1g==
X-Received: by 2002:a50:b244:: with SMTP id o62mr26804250edd.224.1557156447514; 
 Mon, 06 May 2019 08:27:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id l5sm3182071edb.50.2019.05.06.08.27.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 06 May 2019 08:27:26 -0700 (PDT)
Date: Mon, 6 May 2019 17:27:24 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm/doc: Improve docs for conn_state->best_encoder
Message-ID: <20190506152724.GK17751@phenom.ffwll.local>
References: <20190506144629.5976-1-daniel.vetter@ffwll.ch>
 <20190506145753.GA5021@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190506145753.GA5021@pendragon.ideasonboard.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=utO6t28MWrTI48iGztsTSbVtbx1cM/zcvjPOlCN071M=;
 b=acKuCRW4qKUPhEvu6Ys7CHafuo3mwtFUSEwcP84vgZt74pfnW34CjeaPwLAeXHvU5O
 CjZf30F8D+4BhA+j/qt4WyEaQQoT59SFgJmIDempliPGYgQzY2Rc4onj/t5iScXz/qed
 tNvSFuRcIlVho45qEYHfPPfOlKjyulO3G9jcg=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <sean@poorly.run>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMDYsIDIwMTkgYXQgMDU6NTc6NTNQTSArMDMwMCwgTGF1cmVudCBQaW5jaGFy
dCB3cm90ZToKPiBIaSBEYW5pZWwsCj4gCj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCj4gCj4g
T24gTW9uLCBNYXkgMDYsIDIwMTkgYXQgMDQ6NDY6MjlQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiA+IEl0J3MgbWFuZGF0b3J5IGFuZCBjb25zaWRlcmVkIGNvcmUgc3RhdGUgc2luY2Ug
aW9jdGxzIHJlbHkgb24gdGhpcwo+ID4gd29ya2luZy4KPiA+IAo+ID4gVGhhbmtzIHRvIExhdXJl
bnQgZm9yIHBvaW50aW5nIG91dCB0aGlzIGdhcC4KPiA+IAo+ID4gdjI6IENsYXJpZnkgdG8gImF0
b21pYyBkcml2ZXJzIiBvbmx5Lgo+ID4gCj4gPiBDYzogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVu
dC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+ID4gQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29y
bHkucnVuPgo+ID4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBp
bnRlbC5jb20+Cj4gPiAtLS0KPiA+ICBpbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmggfCA0ICsr
KysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmggYi9pbmNsdWRlL2RybS9kcm1fY29ubmVj
dG9yLmgKPiA+IGluZGV4IDAyYTEzMTIwMmFkZC4uZjQzZjQwZDU4ODhhIDEwMDY0NAo+ID4gLS0t
IGEvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oCj4gPiArKysgYi9pbmNsdWRlL2RybS9kcm1f
Y29ubmVjdG9yLmgKPiA+IEBAIC01MTcsNiArNTE3LDEwIEBAIHN0cnVjdCBkcm1fY29ubmVjdG9y
X3N0YXRlIHsKPiA+ICAJICogVXNlZCBieSB0aGUgYXRvbWljIGhlbHBlcnMgdG8gc2VsZWN0IHRo
ZSBlbmNvZGVyLCB0aHJvdWdoIHRoZQo+ID4gIAkgKiAmZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfZnVu
Y3MuYXRvbWljX2Jlc3RfZW5jb2RlciBvcgo+ID4gIAkgKiAmZHJtX2Nvbm5lY3Rvcl9oZWxwZXJf
ZnVuY3MuYmVzdF9lbmNvZGVyIGNhbGxiYWNrcy4KPiAKPiBIb3cgYWJvdXQgdXBkYXRpbmcgdGhp
cyBwYXJ0IGFzIHdlbGwgPwo+IAo+ICJVc2VkIGJ5IGJvdGggdGhlIERSTSBjb3JlIGFuZCB0aGUg
YXRvbWljIGhlbHBlcnMgdG8gc2VsZWN0IHRoZSBlbmNvZGVyCj4gKHRocm91Z2ggdGhlICZkcm1f
Y29ubmVjdG9yX2hlbHBlcl9mdW5jcy5hdG9taWNfYmVzdF9lbmNvZGVyKSwgYWNjZXNzIGl0Cj4g
YW5kIHJlcG9ydCBpdCB0byB1c2Vyc3BhY2UgKHRocm91Z2ggdGhlIEdFVENPTk5FQ1RPUiBhbmQg
R0VURU5DT0RFUgo+IGlvY3RscykuIFRoaXMgZmllbGQgc2hhbGwgYmUgc2V0IGJ5IGFsbCBhdG9t
aWMgZHJpdmVycywgZWl0aGVyIGRpcmVjdGx5Cj4gb3IgdGhyb3VnaCBhdG9taWMgaGVscGVycy4i
CgpJdCdzIGtpbmRhIHR3byB0aGluZ3MsIEkgdGhpbmsgYmVzdCB0byBkZXNjcmliZSBpbiB0d28g
cGFyYWdyYXBocy4gQnV0IEkKY2FuIG1vdmUgdGhlIGNvcmUgdXNhZ2UgdXAsIHNpbmNlIGFyZ3Vh
YmxlIG1vcmUgaW1wb3J0YW50LiBPdG9oIG1vc3QKZHJpdmVycyB3b24ndCBjYXJlIHNpbmNlIGhl
bHBlcnMgaGFuZGxlIHRoaXMsIGFuZCB0aGV5IGNhcmUgbW9yZSBhYm91dCBob3cKQGJlc3RfZW5j
b2RlciBpcyB1c2VkLgoKRS5nLiBjb3JlIG5ldmVyIGNhbGxzIHRoZSBoZWxwZXIgY2FsbGJhY2tz
CkBhdG9taWNfYmVzdF9lbmRvZXIvYmVzdF9lbmNvZGVyLCB3aGljaCBpc24ndCBjbGVhciBhbnlt
b3JlIHdpdGggeW91cgp3b3JkaW5nLiBBbmQgSSBoYXZlIGEgc3RpY2tlciBmb3IgY29yZS9oZWxw
ZXIgc3BsaXRzIDotKQotRGFuaWVsCj4gCj4gPiArCSAqCj4gPiArCSAqIE5PVEU6IEF0b21pYyBk
cml2ZXJzIG11c3QgZmlsbCB0aGlzIG91dCAoZWl0aGVyIHRoZW1zZWx2ZXMgb3IgdGhyb3VnaAo+
ID4gKwkgKiBoZWxwZXJzKSwgZm9yIG90aGVyd2lzZSB0aGUgR0VUQ09OTkVDVE9SIGFuZCBHRVRF
TkNPREVSIElPQ1RMcyB3aWxsCj4gPiArCSAqIG5vdCByZXR1cm4gY29ycmVjdCBkYXRhIHRvIHVz
ZXJzcGFjZS4KPiA+ICAJICovCj4gPiAgCXN0cnVjdCBkcm1fZW5jb2RlciAqYmVzdF9lbmNvZGVy
Owo+ID4gIAo+IAo+IC0tIAo+IFJlZ2FyZHMsCj4gCj4gTGF1cmVudCBQaW5jaGFydAoKLS0gCkRh
bmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9i
bG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
