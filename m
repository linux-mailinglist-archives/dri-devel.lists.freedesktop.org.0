Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5891824A50
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 10:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D3589247;
	Tue, 21 May 2019 08:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE5889247
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 08:26:57 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id f37so28009601edb.13
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 01:26:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=sflGufuJmBGrWVV7kp0a21Ak4l+RlvLDFK6F90TjUIk=;
 b=fnoyIQqkeMSUhZZjGn0/rRiLMONC4K4M/oNzBLgTIdaG3ZKO4csfQqp3MaCvasIsUw
 wuId59+MdpoosuLVQxNagibNVM0kzyh2mrSGKsUplJ7Ml6yQDdo9bki4obP7BkErw6Wi
 VCl29l9/cTpU24dpWS4KlbV5GoSazu2YOHF7C/ECGFNY2e1Z08VLr/MJWAfduprzbtDV
 7g4OQH4374ekgMBldbFIWD78zCtXT5skp4kuiI/Xz5wXTfjON1JCp6/sNKEFeE/SFtBd
 34xAqJBAPPwlvnf4ASn5Hj+ZbXZYOcPvnjYiC+LhmCw1M4u5l2KPsDHz4iuJwR7uzSSH
 M6eg==
X-Gm-Message-State: APjAAAXzznhy53Qa603GXKOuuNUHotOAhXxOud4A1QIbWpixV8Nvva2x
 AI5ib2LXucE/My42JfFvGm/LcQ==
X-Google-Smtp-Source: APXvYqwA6mKKB38IoocAh7xCa1f9JR4yiOByi2IoSmFpDSnNdZHvj/wmfZQp19/9E2v9ZWOHBhQsHA==
X-Received: by 2002:a50:addc:: with SMTP id b28mr82524241edd.7.1558427216045; 
 Tue, 21 May 2019 01:26:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id d24sm6190111edb.5.2019.05.21.01.26.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 21 May 2019 01:26:55 -0700 (PDT)
Date: Tue, 21 May 2019 10:26:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH 2/2] drm/doc: Document expectation that userspace review
 looks at kernel uAPI.
Message-ID: <20190521082653.GJ21222@phenom.ffwll.local>
Mail-Followup-To: Pekka Paalanen <ppaalanen@gmail.com>,
 Eric Anholt <eric@anholt.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20190424185617.16865-1-eric@anholt.net>
 <20190424185617.16865-2-eric@anholt.net>
 <20190424193636.GU9857@phenom.ffwll.local>
 <20190521104734.2d8853ac@eldfell.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190521104734.2d8853ac@eldfell.localdomain>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=sflGufuJmBGrWVV7kp0a21Ak4l+RlvLDFK6F90TjUIk=;
 b=PO/+DkkqU2QMkKp1T2YLYKA9bqN7zoE0orBMP1ZgOfRn1ykb8Rhc2OAb4f/CU2LToz
 f+jqxUBiuPwEGvvw2rEqeXFB3bIkuNt7ATmh9dscN4EhugZWbZGLxTJjP0r+j2I6kP5S
 qU9Gy87QX7JdjaLotxtlAsPUGE7EsUdqsMwwU=
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMjEsIDIwMTkgYXQgMTA6NDc6MzRBTSArMDMwMCwgUGVra2EgUGFhbGFuZW4g
d3JvdGU6Cj4gT24gV2VkLCAyNCBBcHIgMjAxOSAyMTozNjozNiArMDIwMAo+IERhbmllbCBWZXR0
ZXIgPGRhbmllbEBmZndsbC5jaD4gd3JvdGU6Cj4gCj4gPiBPbiBXZWQsIEFwciAyNCwgMjAxOSBh
dCAxMTo1NjoxN0FNIC0wNzAwLCBFcmljIEFuaG9sdCB3cm90ZToKPiA+ID4gVGhlIHBvaW50IG9m
IHRoaXMgcmV2aWV3IHByb2Nlc3MgaXMgdGhhdCB1c2Vyc3BhY2UgdXNpbmcgdGhlIG5ldyB1QVBJ
Cj4gPiA+IGNhbiBhY3R1YWxseSBsaXZlIHdpdGggdGhlIHVBUEkgYmVpbmcgcHJvdmlkZWQsIGFu
ZCBpdCdzIGhhcmQgdG8ga25vdwo+ID4gPiB0aGF0IHdpdGhvdXQgaGF2aW5nIGFjdHVhbGx5IGxv
b2tlZCBpbnRvIGEga2VybmVsIHBhdGNoIHlvdXJzZWxmLgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9m
Zi1ieTogRXJpYyBBbmhvbHQgPGVyaWNAYW5ob2x0Lm5ldD4KPiA+ID4gU3VnZ2VzdGVkLWJ5OiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+ID4gPiAtLS0KPiA+ID4gIERv
Y3VtZW50YXRpb24vZ3B1L2RybS11YXBpLnJzdCB8IDQgKysrLQo+ID4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZ3B1L2RybS11YXBpLnJzdCBiL0RvY3VtZW50YXRpb24vZ3B1L2Ry
bS11YXBpLnJzdAo+ID4gPiBpbmRleCA4ZTU1NDVkZmJmODIuLjI5ODQyNGI5OGQ5OSAxMDA2NDQK
PiA+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9ncHUvZHJtLXVhcGkucnN0Cj4gPiA+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vZ3B1L2RybS11YXBpLnJzdAo+ID4gPiBAQCAtODUsNyArODUsOSBAQCBsZWFk
cyB0byBhIGZldyBhZGRpdGlvbmFsIHJlcXVpcmVtZW50czoKPiA+ID4gIC0gVGhlIHVzZXJzcGFj
ZSBzaWRlIG11c3QgYmUgZnVsbHkgcmV2aWV3ZWQgYW5kIHRlc3RlZCB0byB0aGUgc3RhbmRhcmRz
IG9mIHRoYXQKPiA+ID4gICAgdXNlcnNwYWNlIHByb2plY3QuIEZvciBlLmcuIG1lc2EgdGhpcyBt
ZWFucyBwaWdsaXQgdGVzdGNhc2VzIGFuZCByZXZpZXcgb24gdGhlCj4gPiA+ICAgIG1haWxpbmcg
bGlzdC4gVGhpcyBpcyBhZ2FpbiB0byBlbnN1cmUgdGhhdCB0aGUgbmV3IGludGVyZmFjZSBhY3R1
YWxseSBnZXRzIHRoZQo+ID4gPiAtICBqb2IgZG9uZS4KPiA+ID4gKyAgam9iIGRvbmUuICBUaGUg
dXNlcnNwYWNlLXNpZGUgcmV2aWV3ZXIgc2hvdWxkIGFsc28gcHJvdmlkZSBhdCBsZWFzdCBhbgo+
ID4gPiArICBBY2tlZC1ieSBvbiB0aGUga2VybmVsIHVBUEkgcGF0Y2ggaW5kaWNhdGluZyB0aGF0
IHRoZXkndmUgbG9va2VkIGF0IGhvdyB0aGUKPiA+ID4gKyAga2VybmVsIHNpZGUgaXMgaW1wbGVt
ZW50aW5nIHRoZSBuZXcgZmVhdHVyZSBiZWluZyB1c2VkLiAgCj4gPiAKPiA+IEFuc3dlcnMgYSBx
dWVzdGlvbiB0aGF0IGp1c3QgcmVjZW50bHkgY2FtZSB1cCBvbiBtZXJnaW5nIG5ldyBrbXMKPiA+
IHByb3BlcnRpZXMuCj4gPiAKPiA+IFJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGZmd2xsLmNoPgo+IAo+IEhpLAo+IAo+IGZvciB0aGUgcmVjb3JkLCBJIHBlcnNvbmFs
bHkgd2lsbCBub3QgYmUgYWJsZSB0byBwcm92aWRlIHN1Y2ggQWNrZWQtYnkKPiB0YWcgYWNjb3Jk
aW5nIHRvIGtlcm5lbCByZXZpZXcgcnVsZXMsIGJlY2F1c2UgSSBhbSBjb21wbGV0ZWx5IHVuZmFt
aWxpYXIKPiB3aXRoIGtlcm5lbCBEUk0gaW50ZXJuYWxzIGFuZCBjYW5ub3QgcmV2aWV3IGtlcm5l
bCBjb2RlIGF0IGFsbC4gVGhpcwo+IG1pZ2h0IG1ha2UgcGVvcGxlIGV4cGVjdGluZyBXZXN0b24g
dG8gcHJvdmUgdGhlaXIgdUFQSSBkaXNhcHBvaW50ZWQsCj4gc2luY2UgdGhlcmUgYXJlIHZlcnkg
ZmV3IFdlc3RvbiByZXZpZXdlcnMgYXZhaWxhYmxlLgo+IAo+IElmIHlvdSBtZWFudCBzb21ldGhp
bmcgZWxzZSwgcGxlYXNlIHdvcmQgaXQgdG8gdGhhdCB5b3UgYWN0dWFsbHkgbWVhbnQuCgpIbSBy
aWdodCwgdGhhdCB3b3JkaW5nIGlzIHB1dHRpbmcgYSBiaXQgdG9vIGhpZ2ggYSBiYXIuIFdlIHdh
bnQgdGhlCnVzZXJzcGFjZSB2aWV3IHBvaW50IGhlcmUsIG5vdCBmb3JjZSB1c2Vyc3BhY2UgcGVv
cGxlIHRvIHJldmlldyBrZXJuZWwKY29kZS4gSSdsbCB0cnkgdG8gY2xhcmlmeSB0aGlzIGEgYml0
IGJldHRlci4KLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50
ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
