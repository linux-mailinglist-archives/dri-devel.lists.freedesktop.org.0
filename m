Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C204558C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:17:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86895894FF;
	Fri, 14 Jun 2019 07:17:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2A978928D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 07:17:14 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id k21so2074532edq.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 00:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=zMBRrx89XY9/+cL2HUa95GjmKLop61XwxaeCfqLnOfI=;
 b=c30ZlDW47W79bMNzyJvIL9Uj46andORxRWEw8a1CFmjYRWk3Zf5nACscShIbt2dJHy
 Q7S/LjnmPX3KiiubsODRfP24GlPMzQPBSVF90wUSVOjRSvksuJtFLbmaH64oAkYZ/0Vb
 Q4/4Rcuk69MTRgsT4anTgwN7LmatObnTpJ3JAP/AtFfQQIiWeAI93+2u/qNx7/y6ddrm
 8vLsH2jQK10NtP+w/HmEcQVFxCLoHWl9u8DpPV7XJ2NV0ZK8EFH/I5URpB6HpoupUM0p
 ZtI/2NCYVmvbO95jViEAPvkHMJEcfU1hVPJkQAKe0eejxvRO3g9q00bekePAIBZFDjtb
 nHlQ==
X-Gm-Message-State: APjAAAWfxkVKTPam/jmDJv8o2DNuHiBZn/PWBvTtlzIAZ3uTjl4RdVbQ
 RkT+KBIbTKlogOnRfxOzjblHgA==
X-Google-Smtp-Source: APXvYqxhIvZId23XHyhkZj6Wgg/i9Jf/0RMT4fxwwJJuG2zXDl//NhXZCiIuwzM65xHLgwWFUwXh/Q==
X-Received: by 2002:a17:906:644c:: with SMTP id
 l12mr29931705ejn.199.1560496633384; 
 Fri, 14 Jun 2019 00:17:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id d44sm612439eda.75.2019.06.14.00.17.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 00:17:12 -0700 (PDT)
Date: Fri, 14 Jun 2019 09:17:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: Cleanup of -Wunused-const-variable in
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
Message-ID: <20190614071710.GU23020@phenom.ffwll.local>
References: <CAJkfWY50geqLZv=dnchNEGp4i1yy0QfmTSz30uL6DXJXAq3VuA@mail.gmail.com>
 <CAF6AEGt+f+cPFXLmS-y_73K+ecms5vqwZQog_3s9N6g+4kLr=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGt+f+cPFXLmS-y_73K+ecms5vqwZQog_3s9N6g+4kLr=Q@mail.gmail.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zMBRrx89XY9/+cL2HUa95GjmKLop61XwxaeCfqLnOfI=;
 b=MvETRBGtOehmzavPf1Rm3d1PGdnh9uTubB7/3mBIErJrCRoXNK6BWVVX4yIvllU5j6
 8xIM5O/r2/cCghVo0IDPMUl1Pehqw4c5A18Ma1lWbKMUO0/QwXPKyfKpvpbY81SiZOVP
 QAEjGktQy16P8I7UcU35og7XzDmsRK05KMEtc=
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nathan Huckleberry <nhuck@google.com>, clang-built-linux@googlegroups.com,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDE6NTI6MDJQTSAtMDcwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+IHNvLCBmb3IgZHB1X2Zvcm1hdF9tYXBfdGlsZSwgSSdkIGxpa2UgdG8gZGVmaW5lIGEgZm91
cmNjIG1vZGlmaWVyIGZvcgo+IHRpbGVkIGZvcm1hdHMgKHdlIGN1cnJlbnRseSBoYXZlIGEgd29y
a2Fyb3VuZCBpbiB1c2Vyc3BhY2Ugdy8gYQo+IHByaXZhdGUgbW9kaWZpZXIgaW4gdGhlIGdhbGxp
dW0gZHJpdmVyKS4uIEkgdGhpbmsgdGhlIHByb2JsZW0gaXMKPiBkZWZpbmluZyB0aGUgbGF5b3V0
IG9mIHRoZSB0aWxlZCBmb3JtYXQocykgKHRoZXJlIGFyZSBhdCBsZWFzdCB0d28gcGVyCj4gZ2Vu
ZXJhdGlvbiBhbmQgSSBjYW4ndCBndWFyYW50ZWUgdGhleSBhcmUgdGhlIHNhbWUgYWNyb3NzIGFk
cmVubwo+IGdlbmVyYXRpb25zKS4gIFdlJ3ZlIG1vc3RseSBhdm9pZGVkIG5lZWRpbmcgdG8ga25v
dyB0aGUgZXhhY3QgbGF5b3V0Cj4gYnkgdXNpbmcgZ3B1IGJsaXRzIHRvIGdvIGZyb20gdGlsZWQ8
LT5saW5lYXIgc28gZmFyLgo+IAo+IEZvciB0aGUgb3RoZXJzLCB0aG9zZSBsb29rIGxpa2UgZm9y
bWF0cyB3ZSBoYXZlbid0IHdpcmVkIHVwIHlldC4KPiAKPiBJJ2Qgc2F5IHRoZXkgYXJlIGFsbCB0
aGluZ3Mgd2Ugd2FudCB0byBzdXBwb3J0IGV2ZW50dWFsbHksIGFsdGhvdWdoCj4gbm90IHN1cmUg
d2hhdCB0aGUgdGltZWxpbmUgd2lsbCBiZS4uICBidXQgSSdkIGFzayBpZiB5b3UgcmVtb3ZlIHRo
ZW0KPiB0aGVuIHNwbGl0IGludG8gYXQgbGVhc3QgYSBzZXBhcmF0ZSBwYXRjaCBmb3IgZHB1X2Zv
cm1hdF9tYXBfdGlsZSB2cwo+IG90aGVycywgc28gd2UgY2FuIG1vcmUgZWFzaWx5IHJldmVydC9h
bWVuZCB0byBicmluZyB0aGVtIGJhY2suCgpXZSd2ZSBiZWVuIGtpbmRhIGNoZWF0aW5nIG9uIHRo
aXMgd2l0aCBpOTE1IG1vZGlmaWVycyB0b28sIFgvWSB0aWxlZApkZXBlbmQgdXBvbiB0aGUgY2hp
cCB5b3UncmUgcnVubmluZyBvbiA6LSkgQnV0IG9uIGFsbCBtb2Rlcm4gY2hpcHMgaXQncyBhCmxv
dCBtb3JlIHdlbGwtZGVmaW5lZCwgc28gcHJvYmFibHkgbm90IGEgaHVnZSBwcm9ibGVtLgoKSSB0
aGluayB0aGVyZSdzIGxpdHRsZSBjaGFuY2UgcmlnaHQgbm93IGZvciBhZHJlbm8gdG8gYmVjb21l
IGEgZGlzY3JldGUKZ3B1LCBzbyBjb3VsZCBkbyB0aGUgc2FtZSB0cmlja3kuIElmIGl0IGV2ZXIg
YmVjb21lcyBkaXNjcmV0ZSBvciB3ZSB3YW50CnRvIHNoYXJlIG1vcmUsIHRoZW4gd2UnZCBuZWVk
IHRvIGJha2UgaW4gdGhlIGxheW91dCBwcm9wZXJseSBJIHRoaW5rLgoKSSBndWVzcyB0aGUgcXVl
c3Rpb24gaXM6IElzIHRoZSBmb3JtYXQgc2hhcmVkIHdpdGggZS5nLiBjYW1lcmEgYmxvY2tzLCBv
cgpwdXJlbHkgYSBmcmVlZHJlbm8gaW50ZXJuYWwgdGhpbmcuCi1EYW5pZWwKCj4gCj4gQlIsCj4g
LVIKPiAKPiBPbiBUaHUsIEp1biAxMywgMjAxOSBhdCAxOjEzIFBNIE5hdGhhbiBIdWNrbGViZXJy
eSA8bmh1Y2tAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGV5IGFsbCwKPiA+Cj4gPiBJJ20g
bG9va2luZyBpbnRvIGNsZWFuaW5nIHVwIGlnbm9yZWQgd2FybmluZ3MgaW4gdGhlIGtlcm5lbCBz
byB3ZSBjYW4KPiA+IHJlbW92ZSBjb21waWxlciBmbGFncyB0byBpZ25vcmUgd2FybmluZ3MuCj4g
Pgo+ID4gVGhlcmUgYXJlIHNldmVyYWwgdW51c2VkIHZhcmlhYmxlcyBpbiBkcHVfZm9ybWF0cy5j
Cj4gPiAoJ2RwdV9mb3JtYXRfbWFwX3RpbGUnLCAnZHB1X2Zvcm1hdF9tYXBfcDAxMCcsCj4gPiAn
ZHB1X2Zvcm1hdF9tYXBfcDAxMF91YndjJywgJ2RwdV9mb3JtYXRfbWFwX3RwMTBfdWJ3YycpLgo+
ID4gVGhleSBsb29rIGxpa2UgbW9kaWZpZXJzIHRoYXQgd2VyZSBuZXZlciBpbXBsZW1lbnRlZC4g
SSdkIGxpa2UgdG8KPiA+IHJlbW92ZSB0aGVzZSB2YXJpYWJsZXMgaWYgdGhlcmUgYXJlIG5vIHBs
YW5zIG1vdmluZyBmb3J3YXJkIHRvCj4gPiBpbXBsZW1lbnQgdGhlbS4gT3RoZXJ3aXNlIEknbGwg
anVzdCBsZWF2ZSB0aGVtLgo+ID4KPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9DbGFuZ0J1aWx0TGlu
dXgvbGludXgvaXNzdWVzLzUyOAo+ID4KPiA+IFRoYW5rcywKPiA+IE5hdGhhbiBIdWNrbGViZXJy
eQoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9u
Cmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
