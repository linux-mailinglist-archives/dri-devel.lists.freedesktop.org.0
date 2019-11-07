Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAA7F35FA
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 18:43:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E3806F770;
	Thu,  7 Nov 2019 17:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB766F76A
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 17:43:11 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id c22so3423033wmd.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Nov 2019 09:43:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=KpzG87r35EsZrqE/IUkJdVHfxUuuO7z6BfNkPZgsL6o=;
 b=T5cqPqt7Dgg2zEFpNAbQuBUr+gG37lPZx1nY/rMFT2dytfJPkpPlIxbh1uwJZ6en+O
 4qBsvURDqQiWPI4qWd0CFB5S9iwy2yjXRhhYnXU8wYSC1VlQV1iglzK+hSoLh6cZoQZ8
 ngutLOUgm8ywQQs8xk/2wHyFaRZb6BPV9o3+9oU/K5i3gRO93zmhuk1LkDvmMuSaAnIv
 lYGV7K/zGdSysfTMrKcFhIx3gukxHLHO+8L+gacO49VJ4BVYojxo9n/9DTOqxMpuhTCB
 4VSUGIsN7g60DWze+TBN3my5hnIfaCvN+zK8mrYAzMxMUQ1hn8h7rI99hhpRdRWeD21k
 xtBA==
X-Gm-Message-State: APjAAAU/l8bpky4eT9yYrzQ41QdxmvETfU4PChZZlNd+XLQGW3TnLv2b
 7IyxZHOlVuwQuFHacf+blt5VExqgYU8=
X-Google-Smtp-Source: APXvYqyGO5IIm7hx0yfbYBQADBczX5Ibv3hJOD+rPNObmhL0D74jU4CBc/gpKSB04YYQGcQAcBwxhQ==
X-Received: by 2002:a7b:c347:: with SMTP id l7mr230296wmj.48.1573148589814;
 Thu, 07 Nov 2019 09:43:09 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id f188sm2587065wmf.3.2019.11.07.09.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2019 09:43:09 -0800 (PST)
Date: Thu, 7 Nov 2019 18:43:07 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH] drm/msm/dpu: Add UBWC support for RGB8888 formats
Message-ID: <20191107174307.GR23790@phenom.ffwll.local>
References: <20191106232553.76553-1-frkoenig@google.com>
 <CAF6AEGuXv+ePcGtuN2XTFazrMrtyCYMjZOvYn5CZ3bKE2UhVQg@mail.gmail.com>
 <87wocbiofp.fsf@anholt.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87wocbiofp.fsf@anholt.net>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KpzG87r35EsZrqE/IUkJdVHfxUuuO7z6BfNkPZgsL6o=;
 b=VRBInIVqqovYgG87MdJQDmvchFsoAPEUi6MZB224Oeu+93Hr+hLd75ykTAdedIncMr
 MTA18XjNvJddxEmULDe7wkHgiG0pqVid8vIuqSzWTrDmiSBKSfXS2w5cT6BBJduhe3Xh
 zMbWnJRHH21qtPIM4Vjd4r0YIfNKdoUbZcCyM=
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
Cc: Sean Paul <sean@poorly.run>, Fritz Koenig <frkoenig@google.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMDk6MzA6NTBBTSAtMDgwMCwgRXJpYyBBbmhvbHQgd3Jv
dGU6Cj4gUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPiB3cml0ZXM6Cj4gPiBPbiBXZWQs
IE5vdiA2LCAyMDE5IGF0IDM6MjYgUE0gRnJpdHogS29lbmlnIDxmcmtvZW5pZ0Bnb29nbGUuY29t
PiB3cm90ZToKPiA+Pgo+ID4+IEhhcmR3YXJlIG9ubHkgbmF0aXZlbHkgc3VwcG9ydHMgQkdSODg4
OCBVQldDLgo+ID4+IFVCV0Mgc3VwcG9ydCBmb3IgUkdCODg4OCBjYW4gYmUgaGFkIGJ5IHByZXRl
bmRpbmcKPiA+PiB0aGF0IHRoZSBidWZmZXIgaXMgQkdSLgo+ID4KPiA+IEp1c3QgdG8gZXhwYW5k
LCB0aGlzIGFsaWducyB3aXRoIGhvdyB3ZSBoYW5kbGUgUkdCIGNvbXBvbmVudCBvcmRlciBpbgo+
ID4gbWVzYSBmb3IgdGlsZWQgb3IgdGlsZWQrdWJ3Yy4gIElmIHVuY29tcHJlc3NlZCB0byBsaW5l
YXIgdGhlIGNvbXBvbmVudAo+ID4gb3JkZXIgaXMgUkdCLCBidXQgaW4gdGlsZWQgb3IgdGlsZWQr
dWJ3YywgdGhlIGNvbXBvbmVudCBvcmRlciBpcwo+ID4gYWx3YXlzIHRoZSBodyAibmF0aXZlIiBv
cmRlciAoQkdSKSByZWdhcmRsZXNzIG9mIHdoYXQgdGhlIG91dHNpZGUKPiA+IHdvcmxkIHRoaW5r
cy4gIEJ1dCB0aGF0IGRldGFpbCBraW5kYSBkb2Vzbid0IG1hdHRlciwgaXQncyBub3QgbGlrZQo+
ID4gZ2VuZXJpYyBjb2RlIGlzIGdvaW5nIHRvIHVuZGVyc3RhbmQgdGhlIHRpbGVkIG9yIHRpbGVk
K3Vid2MgZm9ybWF0IGluCj4gPiB0aGUgZmlyc3QgcGxhY2UuLiBhbmQgY29kZSB0aGF0IGRvZXMg
dW5kZXJzdGFuZCBpdCwga25vd3MgZW5vdWdoIHRvCj4gPiBrbm93IHRoYXQgdGlsZWQvdGlsZWQr
dWJ3YyBpcyBhbHdheXMgaW4gdGhlIG5hdGl2ZSBjb21wb25lbnQgb3JkZXIuCj4gPgo+ID4+IFNp
Z25lZC1vZmYtYnk6IEZyaXR6IEtvZW5pZyA8ZnJrb2VuaWdAZ29vZ2xlLmNvbT4KPiA+Cj4gPiBS
ZXZpZXdlZC1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgo+IAo+IFNlZW1zIGxp
a2UgYSByZWFzb25hYmxlIHdvcmthcm91bmQgdG8gbWUsIGFuZCBwZXJtaXNzaWJsZSBieSBvdXIg
Zm91cmNjCj4gbW9kaWZpZXIgcnVsZXMgKCJ5b3UganVzdCBoYXZlIHRvIGhhdmUgb25lIHdheSB0
byBhZGRyZXNzIHRoZSBwaXhlbHMKPiBnaXZlbiBhIGZvdXJjYyBhbmQgYSBtb2RpZmllciIpLgoK
WWVhaCB3ZSBoYXZlIHNvbWUgb3RoZXIgYWxpYXNpbmcgZ29pbmcgb24gYWxyZWFkeSBJIHRoaW5r
LiBBbmQgc2luY2UgZm9yCmludGVyb3B0IHlvdSBqdXN0IG5lZWQgdG8gcGljayBtYXRjaGluZyAo
Zm91cmNjLCBtb2RpZmllcikgcGFpcnMgd29yc3QKY2FzZSB0aGF0IG1lYW5zIGRyaXZlcnMgbmVl
ZCB0byBhZGQgYSBidW5jaCBvZiBkdW1taWVzL2R1cGxpY2F0ZXMuIExpa2Ugd2UKZG8gaGVyZS4K
CkFja2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgoKQ2hlZXJz
LCBEYW5pZWwKCj4gCj4gUmV2aWV3ZWQtYnk6IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5uZXQ+
CgoKCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBk
cmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
CgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9u
Cmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
