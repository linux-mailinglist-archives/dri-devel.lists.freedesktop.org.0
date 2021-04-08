Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E093587B9
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 17:02:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EFC26EB1E;
	Thu,  8 Apr 2021 15:02:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 634BC6EB20
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 15:02:17 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id 7so2466260qka.7
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Apr 2021 08:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=wtgr+b1moxhgAFBso0N+AErY75QLY5SUOMKvKhZbTnk=;
 b=BAWM/d2lBFvMp8pNgQCMQcvJKt1x+ESGFKj/2owcjxeC3qRT+Kd/HY2eXdU+ds0av4
 y7CwBiSOCstYyU+CA3w26fjac+vlbIHRvGQRxrwWRO40uS9nljC2j4NzxflO0ZiyP4c2
 AQXADjp68//IoFapTdjfE8FZH4LmBwkm8Yaty4UeBUDuS1cQQEpK7meyPjmkNtiWMGGb
 xx2kufrwsUs4WncwXvEBPxiXclpQD6kdYmz0qeoeZoqpnXedew/cF85LTLfZakSk6Wnf
 NnGGqej01GOMuHeB8LXUkQ216pi21EfCG7ayZV9OvBSgVRc6QiidK8X0aLtEGmgbz16D
 Qzbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wtgr+b1moxhgAFBso0N+AErY75QLY5SUOMKvKhZbTnk=;
 b=Dx2rNTKlim8XuGA92mPDwkQWY8kwHm7Qmg3e8/d1xrLNWXToYmm7hvFFNlOR8LAPPA
 nakeuUse6TJdotvZ2R4FUg29HioVx1snHDq5EDVSMwH6FvVRk0atSw9kVG+qpBM7vsso
 zArVu+2uBaWt+rQP++Ku15jG7ErP9FWZ7/+5Nq8hitt1l6u25noItyGAr3m5oZTfBQ2E
 DQuvUO90RTPyljDFl2J0N3+ZlR4NAPbZDJH9IetDFyBbqkJ37LwnRSj7L91yF93r2Hfm
 0lpR8qphOOY7MTC8RLfW88SO1l2ZGpq12dQ9ivFb7fBG5NlhePgNVcFIHprQilX7I+HB
 0D4w==
X-Gm-Message-State: AOAM530XaX2A9mzCq/32iGfZcN1f94OFFL9Ww4diOJLPH6Y6JFcxfcKl
 5t/7cnL2nRYGRcz2pak+8oqFpw==
X-Google-Smtp-Source: ABdhPJwhBcRwtu0iiGpW40Lle+dqS2hM9CVOxnY+rZe7yu7WuciF7PF6ymzQMZUzBR9LwFWlDQQvMA==
X-Received: by 2002:a37:ae04:: with SMTP id x4mr8917048qke.245.1617894133851; 
 Thu, 08 Apr 2021 08:02:13 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.115.133])
 by smtp.gmail.com with ESMTPSA id m25sm18978459qtq.59.2021.04.08.08.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 08:02:12 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1lUWAe-002lLr-49; Thu, 08 Apr 2021 12:02:12 -0300
Date: Thu, 8 Apr 2021 12:02:12 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Felix Kuehling <Felix.Kuehling@amd.com>
Subject: Re: [PATCH 00/34] Add HMM-based SVM memory manager to KFD v4
Message-ID: <20210408150212.GC227011@ziepe.ca>
References: <20210406014629.25141-1-Felix.Kuehling@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210406014629.25141-1-Felix.Kuehling@amd.com>
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
Cc: =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBcHIgMDUsIDIwMjEgYXQgMDk6NDU6NTVQTSAtMDQwMCwgRmVsaXggS3VlaGxpbmcg
d3JvdGU6Cj4gUmViYXNlZCBvbiB1cHN0cmVhbS4gRHJvcHBlZCBhbHJlYWR5IHVwc3RyZWFtIHBh
dGNoCj4gImRybS9hbWRncHU6IHJlc2VydmUgZmVuY2Ugc2xvdCB0byB1cGRhdGUgcGFnZSB0YWJs
ZSIuCj4gCj4gQWRkZWQgbW9yZSBmaXhlczoKPiAtIEZpeGVkIGtlcm5lbCB0ZXN0IHJvYm90IHdh
cm5pbmdzIGFib3V0IHN0YXRpYyBmdW5jdGlvbnMKPiAtIEZpeGVkIGEga2VybmVsIHRlc3Qgcm9i
b3Qgd2FybmluZyBhYm91dCBhbiB1bnVzZWQgdmFyaWFibGUKPiAtIEZpeGVkIGEga2VybmVsIHRl
c3Qgcm9ib3Qgd2FybmluZyBhYm91dCBzZWxlY3QgREVWSUNFX1BSSVZBVEUuCj4gICBVc2luZyAi
ZGVwZW5kcyBvbiIgbm93LiAoc2VlIHBhdGNoIDM0KQo+IC0gUHJvcG9ydGlvbmFsbHkgbG9uZ2Vy
IHRpbWVvdXQgZm9yIGhtbV9yYW5nZV9mYXVsdCBvbiBsYXJnZSBhZGRyZXNzIHJhbmdlcwo+ICAg
KHNlZSBwYXRjaCA2KQo+IC0gRml4ZWQgUFRFIGZsYWdzIGZvciBYR01JIG1hcHBpbmdzIG9uIEFy
Y3R1cnVzIGFuZCBBbGRlYmFyYW4gKHNlZSBwYXRjaCAxNykKPiAtIEZpeGVkIHJhbmdlLWxpc3Qg
Y2xlYW51cCBvbiBwcm9jZXNzIHRlcm1pbmF0aW9uIHRvIGF2b2lkIEJVR3MgZnJvbSBkYW5nbGlu
Zwo+ICAgaW50ZXJ2YWwgbm90aWZpZXJzIChzZWUgcGF0Y2ggMTYpCj4gLSBGaXhlZCBTVk0gcmFu
Z2UgbG9ja2luZyBhbmQgaW50ZXJ2YWwgbm90aWZpZXIgc2VxdWVuY2UgdXBkYXRlCj4gICAoc2Vl
IHBhdGNoIDggYW5kIHJlbGF0ZWQgdHdlYWtzIGluIHBhdGNoZXMgMTAsIDExLCAyMSkKPiAKPiBB
ZGRlZCBteSBSZXZpZXdlZC1ieSB0byBhbGwgcGF0Y2hlcyBwcmltYXJpbHkgYXV0aG9yZWQgYnkg
UGhpbGlwIGFuZCBBbGV4Lgo+IEkgYmVsaWV2ZSB0aGlzIHBhdGNoIHNlcmllcyBpcyBuZWFybHkg
cmVhZHkgdG8gZ28uCj4gCj4gVGhpcyBzZXJpZXMgYW5kIHRoZSBjb3JyZXNwb25kaW5nIFJPQ20g
VGh1bmsgYW5kIEtGRFRlc3QgY2hhbmdlcyBhcmUgYWxzbwo+IGF2YWlsYWJsZSBvbiBnaXR1YiBh
bmQgcGF0Y2h3b3JrLgo+IAo+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9SYWRlb25PcGVuQ29t
cHV0ZS9ST0NLLUtlcm5lbC1Ecml2ZXIvdHJlZS9meGthbWQvaG1tLXdpcAo+IExpbms6IGh0dHBz
Oi8vZ2l0aHViLmNvbS9SYWRlb25PcGVuQ29tcHV0ZS9ST0NULVRodW5rLUludGVyZmFjZS90cmVl
L2Z4a2FtZC9obW0td2lwCj4gTGluazogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3Jn
L3Nlcmllcy84NTU2My8KPiBDQzogSsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+
Cj4gQ0M6IEphc29uIEd1bnRob3JwZSA8amdnQHppZXBlLmNhPgoKVGhpcyBzZXJpZXMgaXMgaHVn
ZSwgYnV0IGl0IGxvb2tzIGxpa2UgaXQgc3RpbGwgZG9lc24ndCBmaXggdGhlCkZJWE1FJ3MgYXJv
dW5kIHRoZSBBTUQgZHJpdmVyIHVzZSBvZiBobW0uCgpDYW4geW91IGZpeCB0aGVtIGJlZm9yZSBw
aWxpbmcgb24gbW9yZSBzdHVmZj8KCkphYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
