Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0125D2AE65
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 08:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 043DB8928D;
	Mon, 27 May 2019 06:10:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CB5A8928D
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 06:10:47 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id w11so25018844edl.5
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2019 23:10:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=aHQcZA86QadOz+hqte+kGa5A/aXSBOF9jgEN8JYF4HM=;
 b=udzMFruJlAML7poaNPVZhRFjjlW9TEWNfc2if4rKytH/62CfV4RYc95HR460uN8Agw
 OMF3HS1f4lqGxTzTcb5Y7LA3ghYariz0UDQpJAh5G4+/65XbvBQmnEMcg1QYI0j+QEJ3
 byTqKVPr9ozSiam8J5Be0jAVSLnOyJc8DDtg5wl9xGdfiLK3x4q5HVZnON8/XSANc4XF
 j05dWmW3qsPGMx1u0PSvElW1OCkPXkvBBB3Vz+N0weHPRRq2R+0E6rRpc0vno7LJd56U
 V92ZtFKkSU8Uff6KXHjqyh6SzvAeNcxuXV+BJgmT0SHsqOO7XSLaRE0oOAGWAiFXfzna
 un2w==
X-Gm-Message-State: APjAAAWptNIBndOE5Sg0DlO9muraQHsvfJGJkAlSss0EPr85v1Ocmou8
 xT/yiZvcn5sOxuyQMSlIu12XYg==
X-Google-Smtp-Source: APXvYqw5DeaRhyIeIlB5ezWdqfd/I3KorqeJKmhUNN+wTqwQrdBepsfLJvMmK2DS7vWCzfiPR73EWg==
X-Received: by 2002:a17:906:5e16:: with SMTP id
 n22mr53158605eju.28.1558937446036; 
 Sun, 26 May 2019 23:10:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id h8sm1570633ejf.73.2019.05.26.23.10.44
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 26 May 2019 23:10:45 -0700 (PDT)
Date: Mon, 27 May 2019 08:10:42 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 09/33] fbcon: Remove fbcon_has_exited
Message-ID: <20190527061042.GF21222@phenom.ffwll.local>
Mail-Followup-To: Sam Ravnborg <sam@ravnborg.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Prarit Bhargava <prarit@redhat.com>,
 Kees Cook <keescook@chromium.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Yisheng Xie <ysxie@foxmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Konstantin Khorenko <khorenko@virtuozzo.com>
References: <20190524085354.27411-1-daniel.vetter@ffwll.ch>
 <20190524085354.27411-10-daniel.vetter@ffwll.ch>
 <20190525153826.GA8661@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190525153826.GA8661@ravnborg.org>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=aHQcZA86QadOz+hqte+kGa5A/aXSBOF9jgEN8JYF4HM=;
 b=Z+eTylDr8v0NnqgdFOxT1FsB+Gv/PP4fKMnQokTae0Nh6mADuZnJH5r9rleXV/+6NP
 CHmTMRs3RV7wt5U1LiOWfNYHss2hDXFFuXDLBEQSqOKgpzz0sQvchRSC8h/GQJsRIagy
 JdmFva87UC/Rh7hBX51Sp2WcMN/L9yZQ9fA6M=
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
Cc: Prarit Bhargava <prarit@redhat.com>, Kees Cook <keescook@chromium.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Yisheng Xie <ysxie@foxmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Konstantin Khorenko <khorenko@virtuozzo.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBNYXkgMjUsIDIwMTkgYXQgMDU6Mzg6MjZQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IEhpIERhbmllbC4KPiAKPiBPbmUgZGV0YWlsIEkgbm90aWNlZCB3aGlsZSBicm9zaW5n
IHRoZSBjaGFuZ2VzLgo+IAo+ID4gIAo+ID4gQEAgLTEwNjQsOSArMTA2MiwxMyBAQCBzdGF0aWMg
dm9pZCBmYmNvbl9pbml0KHN0cnVjdCB2Y19kYXRhICp2YywgaW50IGluaXQpCj4gPiAgCWludCBs
b2dvID0gMSwgbmV3X3Jvd3MsIG5ld19jb2xzLCByb3dzLCBjb2xzLCBjaGFyY250ID0gMjU2Owo+
ID4gIAlpbnQgY2FwLCByZXQ7Cj4gPiAgCj4gPiAtCWlmIChpbmZvX2lkeCA9PSAtMSB8fCBpbmZv
ID09IE5VTEwpCj4gPiArCWlmIChXQVJOX09OKGluZm9faWR4ID09IC0xKSkKPiA+ICAJICAgIHJl
dHVybjsKPiA+ICAKPiA+ICsJaWYgKGNvbjJmYl9tYXBbdmMtPnZjX251bV0gPT0gLTEpCj4gPiAr
CQljb24yZmJfbWFwW3ZjLT52Y19udW1dID0gaW5mb19pZHg7Cj4gPiArCj4gPiArCWluZm8gPSBy
ZWdpc3RlcmVkX2ZiW2NvbjJmYl9tYXBbdmMtPnZjX251bV1dOwo+ID4gIAljYXAgPSBpbmZvLT5m
bGFnczsKPiAKPiBXaGVuIGluZm8gaXMgZGVmaW5lZCBpdCBpcyBhbHNvIGFzc2lnbmVkOgo+IHN0
cnVjdCBmYl9pbmZvICppbmZvID0gcmVnaXN0ZXJlZF9mYltjb24yZmJfbWFwW3ZjLT52Y19udW1d
XTsKPiAKPiBBcyB0aGUgdGVzdCBmb3IgaW5mbyBpcyBnb25lIHRoaXMgYXNzaWdubWVudCBpcyBu
byBsb25nZXIKPiByZXF1cmlyZWQgYW5kIGNhbiBiZSBkZWxldGVkLgoKV2UgdXNlIGl0IGxhdGVy
IG9uLCBzbyB3ZSBkZWZpbml0ZWx5IHN0aWxsIG5lZWQgaW5mby4gQnV0IEkgaW5kZWVkIGZvcmdv
dAp0byBkZWxldGUgdGhlIGluaXRpYWwgYXNzaWdubWVudCBvZiBpbmZvIGF0IHRoZSBmdW5jdGlv
biBzdGFydC4gSXMgdGhhdAp3aGF0IHlvdSBtZWFuIGhlcmU/Cj4KPiBUaGUgY29kZSBub3cgYXNz
dW1lcyB0aGF0IHRoZXJlIGlzIGFsd2F5cyBhbiBmYl9pbmZvIGlmIGNvbjJmYl9tYXBbXQo+IGlz
IG5vdCBzZXQgdG8gLTEuIEkgY291bGQgbm90IGRldGVybWluZSBpZiB0aGlzIGlzIE9LLCBidXQg
dGhpcwo+IGxpa2VseSBib2lscyBkb3duIHRvIHlvdXIgbG9ja2luZyBjb25jZXJuIG9mIHJlZ2lz
dGVyZWRfZmIuCgpZdXAsIHNlZSBob3cgZmJfcmVnaXN0ZXJlZC91bnJlZ2lzdGVyZWQgbWFuYWdl
IHRoaXMuIEkgdGhpbmsgdGhhdCBwYXJ0CmFjdHVhbGx5IGFsbCB3b3JrcyBvdXQgY29ycmVjdGx5
IChhcyBsb25nIGFzIGV2ZXJ5b25lIGlzIGhvbGRpbmcKY29uc29sZV9sb2NrKS4gQnV0IGl0J3Mg
YSBiaXQgdW5wcmV0dHkgdGhhdCBmYmNvbiBkaWdzIGFyb3VuZCBpbiB0aGUgcmF3CnJlZ2lzdGVy
ZWRfZmIgYXJyYXkgaW5zdGVhZCBvZiBnb2luZyB0aHJvdWdoIHRoZSByZWZjb3VudGVkIGhlbHBl
cnMsIGFuZApoYXZpbmcgYSBmdWxsIHJlZmNvdW50ZWQgcG9pbnRlci4gTXVjaCBlYXNpZXIgdG8g
Y29udmluY2UgeW91cnNlbGYgb2YgdGhhdAp0aGFuIGNoYXNpbmcgaW5kaWNlcyBhc3NpZ21lbnRz
IGFsbCBvdmVyIGltby4KLURhbmllbAoKPiAKPiAJU2FtCj4gCj4gPiAgCj4gPiAgCWlmIChsb2dv
X3Nob3duIDwgMCAmJiBjb25zb2xlX2xvZ2xldmVsIDw9IENPTlNPTEVfTE9HTEVWRUxfUVVJRVQp
Cj4gPiBAQCAtMzMzNiwxNCArMzMzOCw2IEBAIHN0YXRpYyBpbnQgZmJjb25fZXZlbnRfbm90aWZ5
KHN0cnVjdCBub3RpZmllcl9ibG9jayAqc2VsZiwKPiA+ICAJc3RydWN0IGZiX2JsaXRfY2FwcyAq
Y2FwczsKPiA+ICAJaW50IGlkeCwgcmV0ID0gMDsKPiA+ICAKPiA+IC0JLyoKPiA+IC0JICogaWdu
b3JlIGFsbCBldmVudHMgZXhjZXB0IGRyaXZlciByZWdpc3RyYXRpb24gYW5kIGRlcmVnaXN0cmF0
aW9uCj4gPiAtCSAqIGlmIGZiY29uIGlzIG5vdCBhY3RpdmUKPiA+IC0JICovCj4gPiAtCWlmIChm
YmNvbl9oYXNfZXhpdGVkICYmICEoYWN0aW9uID09IEZCX0VWRU5UX0ZCX1JFR0lTVEVSRUQgfHwK
PiA+IC0JCQkJICBhY3Rpb24gPT0gRkJfRVZFTlRfRkJfVU5SRUdJU1RFUkVEKSkKPiA+IC0JCWdv
dG8gZG9uZTsKPiA+IC0KPiA+ICAJc3dpdGNoKGFjdGlvbikgewo+ID4gIAljYXNlIEZCX0VWRU5U
X1NVU1BFTkQ6Cj4gPiAgCQlmYmNvbl9zdXNwZW5kZWQoaW5mbyk7Cj4gPiBAQCAtMzM5Niw3ICsz
MzkwLDYgQEAgc3RhdGljIGludCBmYmNvbl9ldmVudF9ub3RpZnkoc3RydWN0IG5vdGlmaWVyX2Js
b2NrICpzZWxmLAo+ID4gIAkJZmJjb25fcmVtYXBfYWxsKGlkeCk7Cj4gPiAgCQlicmVhazsKPiA+
ICAJfQo+ID4gLWRvbmU6Cj4gPiAgCXJldHVybiByZXQ7Cj4gPiAgfQo+ID4gIAo+ID4gQEAgLTM0
NDMsOSArMzQzNiw2IEBAIHN0YXRpYyBzc2l6ZV90IHN0b3JlX3JvdGF0ZShzdHJ1Y3QgZGV2aWNl
ICpkZXZpY2UsCj4gPiAgCWludCByb3RhdGUsIGlkeDsKPiA+ICAJY2hhciAqKmxhc3QgPSBOVUxM
Owo+ID4gIAo+ID4gLQlpZiAoZmJjb25faGFzX2V4aXRlZCkKPiA+IC0JCXJldHVybiBjb3VudDsK
PiA+IC0KPiA+ICAJY29uc29sZV9sb2NrKCk7Cj4gPiAgCWlkeCA9IGNvbjJmYl9tYXBbZmdfY29u
c29sZV07Cj4gPiAgCj4gPiBAQCAtMzQ2OCw5ICszNDU4LDYgQEAgc3RhdGljIHNzaXplX3Qgc3Rv
cmVfcm90YXRlX2FsbChzdHJ1Y3QgZGV2aWNlICpkZXZpY2UsCj4gPiAgCWludCByb3RhdGUsIGlk
eDsKPiA+ICAJY2hhciAqKmxhc3QgPSBOVUxMOwo+ID4gIAo+ID4gLQlpZiAoZmJjb25faGFzX2V4
aXRlZCkKPiA+IC0JCXJldHVybiBjb3VudDsKPiA+IC0KPiA+ICAJY29uc29sZV9sb2NrKCk7Cj4g
PiAgCWlkeCA9IGNvbjJmYl9tYXBbZmdfY29uc29sZV07Cj4gPiAgCj4gPiBAQCAtMzQ5MSw5ICsz
NDc4LDYgQEAgc3RhdGljIHNzaXplX3Qgc2hvd19yb3RhdGUoc3RydWN0IGRldmljZSAqZGV2aWNl
LAo+ID4gIAlzdHJ1Y3QgZmJfaW5mbyAqaW5mbzsKPiA+ICAJaW50IHJvdGF0ZSA9IDAsIGlkeDsK
PiA+ICAKPiA+IC0JaWYgKGZiY29uX2hhc19leGl0ZWQpCj4gPiAtCQlyZXR1cm4gMDsKPiA+IC0K
PiA+ICAJY29uc29sZV9sb2NrKCk7Cj4gPiAgCWlkeCA9IGNvbjJmYl9tYXBbZmdfY29uc29sZV07
Cj4gPiAgCj4gPiBAQCAtMzUxNCw5ICszNDk4LDYgQEAgc3RhdGljIHNzaXplX3Qgc2hvd19jdXJz
b3JfYmxpbmsoc3RydWN0IGRldmljZSAqZGV2aWNlLAo+ID4gIAlzdHJ1Y3QgZmJjb25fb3BzICpv
cHM7Cj4gPiAgCWludCBpZHgsIGJsaW5rID0gLTE7Cj4gPiAgCj4gPiAtCWlmIChmYmNvbl9oYXNf
ZXhpdGVkKQo+ID4gLQkJcmV0dXJuIDA7Cj4gPiAtCj4gPiAgCWNvbnNvbGVfbG9jaygpOwo+ID4g
IAlpZHggPSBjb24yZmJfbWFwW2ZnX2NvbnNvbGVdOwo+ID4gIAo+ID4gQEAgLTM1NDMsOSArMzUy
NCw2IEBAIHN0YXRpYyBzc2l6ZV90IHN0b3JlX2N1cnNvcl9ibGluayhzdHJ1Y3QgZGV2aWNlICpk
ZXZpY2UsCj4gPiAgCWludCBibGluaywgaWR4Owo+ID4gIAljaGFyICoqbGFzdCA9IE5VTEw7Cj4g
PiAgCj4gPiAtCWlmIChmYmNvbl9oYXNfZXhpdGVkKQo+ID4gLQkJcmV0dXJuIGNvdW50Owo+ID4g
LQo+ID4gIAljb25zb2xlX2xvY2soKTsKPiA+ICAJaWR4ID0gY29uMmZiX21hcFtmZ19jb25zb2xl
XTsKPiA+ICAKPiA+IEBAIC0zNjY4LDkgKzM2NDYsNiBAQCBzdGF0aWMgdm9pZCBmYmNvbl9leGl0
KHZvaWQpCj4gPiAgCXN0cnVjdCBmYl9pbmZvICppbmZvOwo+ID4gIAlpbnQgaSwgaiwgbWFwcGVk
Owo+ID4gIAo+ID4gLQlpZiAoZmJjb25faGFzX2V4aXRlZCkKPiA+IC0JCXJldHVybjsKPiA+IC0K
PiA+ICAjaWZkZWYgQ09ORklHX0ZSQU1FQlVGRkVSX0NPTlNPTEVfREVGRVJSRURfVEFLRU9WRVIK
PiA+ICAJaWYgKGRlZmVycmVkX3Rha2VvdmVyKSB7Cj4gPiAgCQlkdW1teWNvbl91bnJlZ2lzdGVy
X291dHB1dF9ub3RpZmllcigmZmJjb25fb3V0cHV0X25iKTsKPiA+IEBAIC0zNjk1LDcgKzM2NzAs
NyBAQCBzdGF0aWMgdm9pZCBmYmNvbl9leGl0KHZvaWQpCj4gPiAgCQlmb3IgKGogPSBmaXJzdF9m
Yl92YzsgaiA8PSBsYXN0X2ZiX3ZjOyBqKyspIHsKPiA+ICAJCQlpZiAoY29uMmZiX21hcFtqXSA9
PSBpKSB7Cj4gPiAgCQkJCW1hcHBlZCA9IDE7Cj4gPiAtCQkJCWJyZWFrOwo+ID4gKwkJCQljb24y
ZmJfbWFwW2pdID0gLTE7Cj4gPiAgCQkJfQo+ID4gIAkJfQo+ID4gIAo+ID4gQEAgLTM3MTgsOCAr
MzY5Myw2IEBAIHN0YXRpYyB2b2lkIGZiY29uX2V4aXQodm9pZCkKPiA+ICAJCQkJaW5mby0+cXVl
dWUuZnVuYyA9IE5VTEw7Cj4gPiAgCQl9Cj4gPiAgCX0KPiA+IC0KPiA+IC0JZmJjb25faGFzX2V4
aXRlZCA9IDE7Cj4gPiAgfQo+ID4gIAo+ID4gIHZvaWQgX19pbml0IGZiX2NvbnNvbGVfaW5pdCh2
b2lkKQo+ID4gLS0gCj4gPiAyLjIwLjEKPiA+IAo+ID4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiA+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0
d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
