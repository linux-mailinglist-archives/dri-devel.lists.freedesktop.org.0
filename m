Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A1D43386
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:29:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF7B3893B8;
	Thu, 13 Jun 2019 07:28:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764A78981D;
 Wed, 12 Jun 2019 18:37:01 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id n2so9379010pgp.11;
 Wed, 12 Jun 2019 11:37:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DXItd4QKKcMyTRkmGL6RVgljzEiWFbcFIOw7FfH00GY=;
 b=Dyai7gyT1/GK72FkueAXMMUvXR0mhrNt/p+Y1aaJpy76xu0G77bOPea/GPDIAyM4/i
 IhTXDqs4KscWXAlsVVJ5f5Xq7pKuALyUrrHpwd1lNs/HmjCAwB3vQruwGE9WeLRBsK2z
 pMaoufeACGi85v5DCvsD99oydUxWpxjWdHX9yylVVR2bX+LpkzIzg+FFwCWliElTlFHy
 rDz68/WqYXZl6v33LmvvEYocRRpfsnooDsdXI4YCj12XgLLIBaqJxwz1sDvStYg+o0RR
 TzORAYuRnb6fWfNk8+IEyCtKR4PGqkLDi2PB/u1ZzGcBY9cGgmfaI94GcsWULYYYp+Pp
 0j2w==
X-Gm-Message-State: APjAAAXw3Ky7LUIEGDV5nnMHbWYMkQ7R7MdalJGFi7AZh4E3Z7TjWZVH
 8Kj+7H+WUVTiRHGmB+AX3BJ6bO8s
X-Google-Smtp-Source: APXvYqzjdoMxCVuEJbHHk09NkgKkEkrFSeajkMZcGBlMNFEnpUY9Mfd7qwmsZB2dZpGscl2+DABZMA==
X-Received: by 2002:a62:4d04:: with SMTP id a4mr87702880pfb.177.1560364621102; 
 Wed, 12 Jun 2019 11:37:01 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.89.153])
 by smtp.gmail.com with ESMTPSA id 3sm250910pfp.114.2019.06.12.11.36.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2019 11:37:00 -0700 (PDT)
Date: Thu, 13 Jun 2019 00:06:55 +0530
From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915/gvt: remove duplicate entry of trace
Message-ID: <20190612183654.GA16750@hari-Inspiron-1545>
References: <20190526075633.GA9245@hari-Inspiron-1545>
 <20190612032236.GH9684@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190612032236.GH9684@zhen-hp.sh.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DXItd4QKKcMyTRkmGL6RVgljzEiWFbcFIOw7FfH00GY=;
 b=V1ykHWXuVctHxVCMZR31Lhf3ekEW5RMkXg6I05eaOkPCMQsvEUB1GVZaePVtkB/AkR
 bWSJpUjVq7yRTAKhi/PaorCVoSomgKPHQvsWCaE+dw/19ArzU5MGJLobYMvq1YBz3bCg
 CaZVseF+pNS62h+aqbO+KjLTbqJwEe1uqAAfLm39CR4/eXxMhNmm0pN471EUwlAs+qhh
 leT90bOaEEsVRv/62wmo+FKl1YZoiEhxSA+DsweI4ZqY6+So33HOn5cK68e3IKzNWBAp
 JcPEAhEDlISCS4ivdeUEp8kSAGLMQzJI513eyyHD1dHe8C150IH+AaURoTChf1U7GI+R
 M53A==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMTE6MjI6MzZBTSArMDgwMCwgWmhlbnl1IFdhbmcgd3Jv
dGU6Cj4gT24gMjAxOS4wNS4yNiAxMzoyNjozMyArMDUzMCwgSGFyaXByYXNhZCBLZWxhbSB3cm90
ZToKPiA+IFJlbW92ZSBkdXBsaWNhdGUgaW5jbHVkZSBvZiB0cmFjZS5oCj4gPiAKPiA+IElzc3Vl
IGlkZW50aWZpZWQgYnkgaW5jbHVkZWNoZWNrCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEhhcmlw
cmFzYWQgS2VsYW0gPGhhcmlwcmFzYWQua2VsYW1AZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3RyYWNlX3BvaW50cy5jIHwgMSAtCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d2dC90cmFjZV9wb2ludHMuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC90cmFj
ZV9wb2ludHMuYwo+ID4gaW5kZXggYTNkZWVkNjkuLjU2OWY1ZTMgMTAwNjQ0Cj4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvdHJhY2VfcG9pbnRzLmMKPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC90cmFjZV9wb2ludHMuYwo+ID4gQEAgLTMyLDUgKzMyLDQgQEAKPiA+
ICAKPiA+ICAjaWZuZGVmIF9fQ0hFQ0tFUl9fCj4gPiAgI2RlZmluZSBDUkVBVEVfVFJBQ0VfUE9J
TlRTCj4gPiAtI2luY2x1ZGUgInRyYWNlLmgiCj4gPiAgI2VuZGlmCj4gPiAtLSAKPiAKPiBUaGlz
IGFjdHVhbGx5IGNhdXNlZCBidWlsZCBpc3N1ZSBsaWtlCj4gRVJST1I6ICJfX3RyYWNlcG9pbnRf
Z21hX2luZGV4IiBbZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNS5rb10gdW5kZWZpbmVkIQo+IEVS
Uk9SOiAiX190cmFjZXBvaW50X3JlbmRlcl9tbWlvIiBbZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkx
NS5rb10gdW5kZWZpbmVkIQo+IEVSUk9SOiAiX190cmFjZXBvaW50X2d2dF9jb21tYW5kIiBbZHJp
dmVycy9ncHUvZHJtL2k5MTUvaTkxNS5rb10gdW5kZWZpbmVkIQo+IEVSUk9SOiAiX190cmFjZXBv
aW50X3NwdF9ndWVzdF9jaGFuZ2UiIFtkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1LmtvXSB1bmRl
ZmluZWQhCj4gRVJST1I6ICJfX3RyYWNlcG9pbnRfZ21hX3RyYW5zbGF0ZSIgW2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2k5MTUua29dIHVuZGVmaW5lZCEKPiBFUlJPUjogIl9fdHJhY2Vwb2ludF9zcHRf
YWxsb2MiIFtkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1LmtvXSB1bmRlZmluZWQhCj4gRVJST1I6
ICJfX3RyYWNlcG9pbnRfc3B0X2NoYW5nZSIgW2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTUua29d
IHVuZGVmaW5lZCEKPiBFUlJPUjogIl9fdHJhY2Vwb2ludF9vb3Nfc3luYyIgW2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2k5MTUua29dIHVuZGVmaW5lZCEKPiBFUlJPUjogIl9fdHJhY2Vwb2ludF93cml0
ZV9pciIgW2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTUua29dIHVuZGVmaW5lZCEKPiBFUlJPUjog
Il9fdHJhY2Vwb2ludF9wcm9wYWdhdGVfZXZlbnQiIFtkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1
LmtvXSB1bmRlZmluZWQhCj4gRVJST1I6ICJfX3RyYWNlcG9pbnRfaW5qZWN0X21zaSIgW2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2k5MTUua29dIHVuZGVmaW5lZCEKPiBFUlJPUjogIl9fdHJhY2Vwb2lu
dF9zcHRfcmVmY291bnQiIFtkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1LmtvXSB1bmRlZmluZWQh
Cj4gRVJST1I6ICJfX3RyYWNlcG9pbnRfc3B0X2ZyZWUiIFtkcml2ZXJzL2dwdS9kcm0vaTkxNS9p
OTE1LmtvXSB1bmRlZmluZWQhCj4gRVJST1I6ICJfX3RyYWNlcG9pbnRfb29zX2NoYW5nZSIgW2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2k5MTUua29dIHVuZGVmaW5lZCEKPiBzY3JpcHRzL01ha2VmaWxl
Lm1vZHBvc3Q6OTE6IHJlY2lwZSBmb3IgdGFyZ2V0ICdfX21vZHBvc3QnIGZhaWxlZAo+IAo+IExv
b2tzIHdlIG5lZWQgZml4IGxpa2UgYmVsb3cuCj4gCj4gU3ViamVjdDogW1BBVENIXSBkcm0vaTkx
NS9ndnQ6IHJlbW92ZSBkdXBsaWNhdGUgaW5jbHVkZSBvZiB0cmFjZS5oCj4gCj4gVGhpcyByZW1v
dmVzIGR1cGxpY2F0ZSBpbmNsdWRlIG9mIHRyYWNlLmguIEZvdW5kIGJ5IEhhcmlwcmFzYWQgS2Vs
YW0KPiB3aXRoIGluY2x1ZGVjaGVjay4KPiAKPiBSZXBvcnRlZC1ieTogSGFyaXByYXNhZCBLZWxh
bSA8aGFyaXByYXNhZC5rZWxhbUBnbWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogWmhlbnl1IFdh
bmcgPHpoZW55dXdAbGludXguaW50ZWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvdHJhY2VfcG9pbnRzLmMgfCAyIC0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvdHJhY2VfcG9p
bnRzLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvdHJhY2VfcG9pbnRzLmMKPiBpbmRleCBh
M2RlZWQ2OTJiOWMuLmZlNTUyZTg3N2UwOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQvdHJhY2VfcG9pbnRzLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
dHJhY2VfcG9pbnRzLmMKPiBAQCAtMjgsOCArMjgsNiBAQAo+ICAgKgo+ICAgKi8KPiAgCj4gLSNp
bmNsdWRlICJ0cmFjZS5oIgo+IC0KPiAgI2lmbmRlZiBfX0NIRUNLRVJfXwo+ICAjZGVmaW5lIENS
RUFURV9UUkFDRV9QT0lOVFMKPiAgI2luY2x1ZGUgInRyYWNlLmgiCj4gLS0gCj4gMi4yMC4xCj4g
Cj4gLS0gCj4gT3BlbiBTb3VyY2UgVGVjaG5vbG9neSBDZW50ZXIsIEludGVsIGx0ZC4KPiAKPiAk
Z3BnIC0ta2V5c2VydmVyIHd3d2tleXMucGdwLm5ldCAtLXJlY3Yta2V5cyA0RDc4MTgyNwoKSGkg
Wmhlbnl1IFdhbmcsClRoYW5rcyBmb3IgY29ycmVjdGluZyB0aGUgcGF0Y2guCkl0IHNlZW1zIHdl
IHNob3VsZCBmaXJzdCBkZWZpbmUgQ1JFQVRFX1RSQUNFX1BPSU5UUyBhbmQgaW5jbHVkZSB0cmFj
ZS5oIGFzIHBlciBkb2N1bWVudGF0aW9uLgoKVGhhbmtzLApIYXJpcHJhc2FkIGsKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
