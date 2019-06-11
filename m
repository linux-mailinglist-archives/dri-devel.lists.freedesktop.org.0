Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E513C60B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 10:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C3689183;
	Tue, 11 Jun 2019 08:37:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C178E89183
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 08:37:35 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id k21so15454315edq.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 01:37:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=TbZbC+Sp2SPAwZltpEl7T+4dxXkbBpcXlsNbpfrSndo=;
 b=PlL+cYzTLYtWbf4yv6sdiLF0S26Rxlhjv7SSv0e3o8K4dbcJKtCts+Nx2KVk5nqbs0
 4kL3iOLwXzq5eP7phq4Je5Q6FffiiTaJHdYm36uyEuDYLLHkaHHvRLzFsR8G+NkUCfL7
 w5HsEzbN4YLQp4cNEf1fJaScfbKDj8kTLtAvd3Sa3pCofo0pqQ8kYDO0bfsmJ1IJYSqQ
 TWaW5ncASaWLaX0hMWWZhD7KAZtx4hkTxG2QKy0MnfBTvsUF326MWmuM+3sjzOtVq5fR
 ITaiR7hSxU30F0Z9Ivl7x6oT1r9F0cMtyHU/YbnmvOL2fpARngX+0DcaG/psECfuZeW8
 UeaQ==
X-Gm-Message-State: APjAAAV4LO5EDaLcZOYDE01vxyFAjbPA7k1iHWG5e4OAI98EgiFvFcVc
 bjfg5tmnSoOnF2DR2DygHbbN5GR8zqk=
X-Google-Smtp-Source: APXvYqwoHe+yWqlwWu+bfE6C9rrYPikgvhQ9xXtuj59UwLinYDko2BQBXR4dv1ZhUliGJnvW+jDHcg==
X-Received: by 2002:a17:906:45d7:: with SMTP id
 z23mr12879082ejq.54.1560242254472; 
 Tue, 11 Jun 2019 01:37:34 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id i21sm2162159ejd.76.2019.06.11.01.37.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 01:37:33 -0700 (PDT)
Date: Tue, 11 Jun 2019 10:37:31 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH v3 33/33] docs: EDID/HOWTO.txt: convert it and rename to
 howto.rst
Message-ID: <20190611083731.GS21222@phenom.ffwll.local>
Mail-Followup-To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org
References: <cover.1560045490.git.mchehab+samsung@kernel.org>
 <74bec0b5b7c32c8d84adbaf9ff208803475198e5.1560045490.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <74bec0b5b7c32c8d84adbaf9ff208803475198e5.1560045490.git.mchehab+samsung@kernel.org>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=TbZbC+Sp2SPAwZltpEl7T+4dxXkbBpcXlsNbpfrSndo=;
 b=FaR8YuUFdDSfIP8hmPLLVMQ6SPKxLejrbqP75LhgLkqsJQOK4tyqQ4OY8OHSmc2+cB
 qk7BbUbMljJQAhtPYJlgu8QH+ZCqtwPvKyEGtNhlWgCsdAEL2j0M3nlmPgsiknjOvajc
 HorK2f0x9ImvVUoOoyFCMD1ZLZA0vQYfD4fSI=
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
Cc: Jonathan Corbet <corbet@lwn.net>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@infradead.org>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBKdW4gMDgsIDIwMTkgYXQgMTE6Mjc6MjNQTSAtMDMwMCwgTWF1cm8gQ2FydmFsaG8g
Q2hlaGFiIHdyb3RlOgo+IFNwaGlueCBuZWVkIHRvIGtub3cgd2hlbiBhIHBhcmFncmFwaCBlbmRz
LiBTbywgZG8gc29tZSBhZGp1c3RtZW50cwo+IGF0IHRoZSBmaWxlIGZvciBpdCB0byBiZSBwcm9w
ZXJseSBwYXJzZWQuCj4gCj4gQXQgaXRzIG5ldyBpbmRleC5yc3QsIGxldCdzIGFkZCBhIDpvcnBo
YW46IHdoaWxlIHRoaXMgaXMgbm90IGxpbmtlZCB0bwo+IHRoZSBtYWluIGluZGV4LnJzdCBmaWxl
LCBpbiBvcmRlciB0byBhdm9pZCBidWlsZCB3YXJuaW5ncy4KPiAKPiB0aGF0J3Mgc2FpZCwgSSBi
ZWxpZXZlIHRoYXQgdGhpcyBmaWxlIHNob3VsZCBiZSBtb3ZlZCB0byB0aGUKPiBHUFUvRFJNIGRv
Y3VtZW50YXRpb24uCgpZZXMsIGJ1dCB0aGVyZSdzIGEgYml0IGEgdHdpc3Q6IFRoaXMgaXMgZGVm
aW5pdGVseSBlbmQtdXNlciBkb2N1bWVudGF0aW9uLApzbyBtYXliZSBzaG91bGQgYmUgaW4gYWRt
aW4tZ3VpZGU/CgpBdG0gYWxsIHdlIGhhdmUgaW4gRG9jdW1lbnRhdGlvbi9ncHUvIGlzIGludGVy
bmFscyBmb3IgZHJpdmVycyArIHNvbWUKYmVnaW5uaW5ncyBvZiB1YXBpIGRvY3VtZW50YXRpb24g
Zm9yIHVzZXJzcGFjZSBkZXZlbG9wZXJzLgoKSm9uLCB3aGF0J3MgeW91ciByZWNvbW1lbmRhdGlv
biBoZXJlIGZvciBzdWJzeXN0ZW0gc3BlY2lmaWMKZW5kLXVzZXIvYWRtaW5nIGRvY3M/CgpUaGFu
a3MsIERhbmllbAoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1j
aGVoYWIrc2Ftc3VuZ0BrZXJuZWwub3JnPgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL0VESUQve0hP
V1RPLnR4dCA9PiBob3d0by5yc3R9ICAgfCAzMSArKysrKysrKysrKystLS0tLS0tCj4gIC4uLi9h
ZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQgICAgICAgICB8ICAyICstCj4gIGRyaXZl
cnMvZ3B1L2RybS9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gIDMgZmls
ZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCj4gIHJlbmFtZSBE
b2N1bWVudGF0aW9uL0VESUQve0hPV1RPLnR4dCA9PiBob3d0by5yc3R9ICg4MyUpCj4gCj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vRURJRC9IT1dUTy50eHQgYi9Eb2N1bWVudGF0aW9uL0VE
SUQvaG93dG8ucnN0Cj4gc2ltaWxhcml0eSBpbmRleCA4MyUKPiByZW5hbWUgZnJvbSBEb2N1bWVu
dGF0aW9uL0VESUQvSE9XVE8udHh0Cj4gcmVuYW1lIHRvIERvY3VtZW50YXRpb24vRURJRC9ob3d0
by5yc3QKPiBpbmRleCA1Mzk4NzFjM2I3ODUuLjcyNWZkNDlhODhjYSAxMDA2NDQKPiAtLS0gYS9E
b2N1bWVudGF0aW9uL0VESUQvSE9XVE8udHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9FRElEL2hv
d3RvLnJzdAo+IEBAIC0xLDMgKzEsOSBAQAo+ICs6b3JwaGFuOgo+ICsKPiArPT09PQo+ICtFRElE
Cj4gKz09PT0KPiArCj4gIEluIHRoZSBnb29kIG9sZCBkYXlzIHdoZW4gZ3JhcGhpY3MgcGFyYW1l
dGVycyB3ZXJlIGNvbmZpZ3VyZWQgZXhwbGljaXRseQo+ICBpbiBhIGZpbGUgY2FsbGVkIHhvcmcu
Y29uZiwgZXZlbiBicm9rZW4gaGFyZHdhcmUgY291bGQgYmUgbWFuYWdlZC4KPiAgCj4gQEAgLTM0
LDE2ICs0MCwxOSBAQCBNYWtlZmlsZS4gUGxlYXNlIG5vdGUgdGhhdCB0aGUgRURJRCBkYXRhIHN0
cnVjdHVyZSBleHBlY3RzIHRoZSB0aW1pbmcKPiAgdmFsdWVzIGluIGEgZGlmZmVyZW50IHdheSBh
cyBjb21wYXJlZCB0byB0aGUgc3RhbmRhcmQgWDExIGZvcm1hdC4KPiAgCj4gIFgxMToKPiAtSFRp
bWluZ3M6ICBoZGlzcCBoc3luY3N0YXJ0IGhzeW5jZW5kIGh0b3RhbAo+IC1WVGltaW5nczogIHZk
aXNwIHZzeW5jc3RhcnQgdnN5bmNlbmQgdnRvdGFsCj4gKyAgSFRpbWluZ3M6Cj4gKyAgICBoZGlz
cCBoc3luY3N0YXJ0IGhzeW5jZW5kIGh0b3RhbAo+ICsgIFZUaW1pbmdzOgo+ICsgICAgdmRpc3Ag
dnN5bmNzdGFydCB2c3luY2VuZCB2dG90YWwKPiAgCj4gLUVESUQ6Cj4gLSNkZWZpbmUgWFBJWCBo
ZGlzcAo+IC0jZGVmaW5lIFhCTEFOSyBodG90YWwtaGRpc3AKPiAtI2RlZmluZSBYT0ZGU0VUIGhz
eW5jc3RhcnQtaGRpc3AKPiAtI2RlZmluZSBYUFVMU0UgaHN5bmNlbmQtaHN5bmNzdGFydAo+ICtF
RElEOjoKPiAgCj4gLSNkZWZpbmUgWVBJWCB2ZGlzcAo+IC0jZGVmaW5lIFlCTEFOSyB2dG90YWwt
dmRpc3AKPiAtI2RlZmluZSBZT0ZGU0VUIHZzeW5jc3RhcnQtdmRpc3AKPiAtI2RlZmluZSBZUFVM
U0UgdnN5bmNlbmQtdnN5bmNzdGFydAo+ICsgICNkZWZpbmUgWFBJWCBoZGlzcAo+ICsgICNkZWZp
bmUgWEJMQU5LIGh0b3RhbC1oZGlzcAo+ICsgICNkZWZpbmUgWE9GRlNFVCBoc3luY3N0YXJ0LWhk
aXNwCj4gKyAgI2RlZmluZSBYUFVMU0UgaHN5bmNlbmQtaHN5bmNzdGFydAo+ICsKPiArICAjZGVm
aW5lIFlQSVggdmRpc3AKPiArICAjZGVmaW5lIFlCTEFOSyB2dG90YWwtdmRpc3AKPiArICAjZGVm
aW5lIFlPRkZTRVQgdnN5bmNzdGFydC12ZGlzcAo+ICsgICNkZWZpbmUgWVBVTFNFIHZzeW5jZW5k
LXZzeW5jc3RhcnQKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJu
ZWwtcGFyYW1ldGVycy50eHQgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJh
bWV0ZXJzLnR4dAo+IGluZGV4IDNkMDcyY2E1MzJiYi4uM2ZhZjM3YjhiMDAxIDEwMDY0NAo+IC0t
LSBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0Cj4gKysr
IGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQKPiBAQCAt
OTMwLDcgKzkzMCw3IEBACj4gIAkJCWVkaWQvMTY4MHgxMDUwLmJpbiwgb3IgZWRpZC8xOTIweDEw
ODAuYmluIGlzIGdpdmVuCj4gIAkJCWFuZCBubyBmaWxlIHdpdGggdGhlIHNhbWUgbmFtZSBleGlz
dHMuIERldGFpbHMgYW5kCj4gIAkJCWluc3RydWN0aW9ucyBob3cgdG8gYnVpbGQgeW91ciBvd24g
RURJRCBkYXRhIGFyZQo+IC0JCQlhdmFpbGFibGUgaW4gRG9jdW1lbnRhdGlvbi9FRElEL0hPV1RP
LnR4dC4gQW4gRURJRAo+ICsJCQlhdmFpbGFibGUgaW4gRG9jdW1lbnRhdGlvbi9FRElEL2hvd3Rv
LnJzdC4gQW4gRURJRAo+ICAJCQlkYXRhIHNldCB3aWxsIG9ubHkgYmUgdXNlZCBmb3IgYSBwYXJ0
aWN1bGFyIGNvbm5lY3RvciwKPiAgCQkJaWYgaXRzIG5hbWUgYW5kIGEgY29sb24gYXJlIHByZXBl
bmRlZCB0byB0aGUgRURJRAo+ICAJCQluYW1lLiBFYWNoIGNvbm5lY3RvciBtYXkgdXNlIGEgdW5p
cXVlIEVESUQgZGF0YQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZyBiL2Ry
aXZlcnMvZ3B1L2RybS9LY29uZmlnCj4gaW5kZXggNmIzNDk0OTQxNmIxLi5jM2E2ZGQyODRjOTEg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL0tjb25maWcKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vS2NvbmZpZwo+IEBAIC0xNDEsNyArMTQxLDcgQEAgY29uZmlnIERSTV9MT0FEX0VESURf
RklSTVdBUkUKPiAgCSAgbW9uaXRvciBhcmUgdW5hYmxlIHRvIHByb3ZpZGUgYXBwcm9wcmlhdGUg
RURJRCBkYXRhLiBTaW5jZSB0aGlzCj4gIAkgIGZlYXR1cmUgaXMgcHJvdmlkZWQgYXMgYSB3b3Jr
YXJvdW5kIGZvciBicm9rZW4gaGFyZHdhcmUsIHRoZQo+ICAJICBkZWZhdWx0IGNhc2UgaXMgTi4g
RGV0YWlscyBhbmQgaW5zdHJ1Y3Rpb25zIGhvdyB0byBidWlsZCB5b3VyIG93bgo+IC0JICBFRElE
IGRhdGEgYXJlIGdpdmVuIGluIERvY3VtZW50YXRpb24vRURJRC9IT1dUTy50eHQuCj4gKwkgIEVE
SUQgZGF0YSBhcmUgZ2l2ZW4gaW4gRG9jdW1lbnRhdGlvbi9FRElEL2hvd3RvLnJzdC4KPiAgCj4g
IGNvbmZpZyBEUk1fRFBfQ0VDCj4gIAlib29sICJFbmFibGUgRGlzcGxheVBvcnQgQ0VDLVR1bm5l
bGluZy1vdmVyLUFVWCBIRE1JIHN1cHBvcnQiCj4gLS0gCj4gMi4yMS4wCj4gCgotLSAKRGFuaWVs
IFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cu
ZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
