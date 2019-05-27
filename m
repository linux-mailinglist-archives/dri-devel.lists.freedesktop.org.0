Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6692AE81
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 08:20:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8860E89804;
	Mon, 27 May 2019 06:20:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 344C289804
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 06:20:02 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id e24so25028694edq.6
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2019 23:20:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=UThDfIqXpwAMp2Mizf9XuCGlo5zUVSHqinqUEpR6nck=;
 b=sQmU0EnM2DQ6emuwiJ74c7IibVKSbpeG9osq0hwVDM4r4wr562U0AuzmsfjVjPyxRd
 iNKCf67BFNy5Rk75i7yj9/dxefIToyTBpzHI2o7o2v0F3cDwfonootVy8/OoSGfqv3Ql
 bUAZiXu2BdQBI+xKV/ZPGOIWiiwXSXyB5u+YsjePDXkJnXPSiHqHOybBr8MQJvAMC7Lv
 u5zfB7G23ELhcI7P7JEAJVJMdE67V6vURruVwHV7xcQRbODoggLiqNK26l8t3JB3hsNZ
 kL9dFlTKms+ys4DQMZtU0qF29+2OHAmkfQ7Wkkcsw/g6tqYH/O//n2GYQtrz+Xv4ilZp
 3/TQ==
X-Gm-Message-State: APjAAAXqoJC3pK+Nd4k8l6IX4Ioocyuwz/SE/RUS8JSLYZzjji2f8Ib1
 H8I7Z/fZd71z9HHNl7/0D3KK6w==
X-Google-Smtp-Source: APXvYqxGGTTW1vs8WBwylf0E+XoxqjnC2jy1gL0IPjsZJS18ykf5tN85XqmgMhsPHFjJQA+CZQ00ng==
X-Received: by 2002:a17:906:f84a:: with SMTP id
 ks10mr77380543ejb.65.1558938000899; 
 Sun, 26 May 2019 23:20:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id cg25sm1548867ejb.15.2019.05.26.23.19.59
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 26 May 2019 23:20:00 -0700 (PDT)
Date: Mon, 27 May 2019 08:19:58 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: CA+kt3u11xsbjhZ2mNRfJUBbqtrPaUJHsEMk9CfzLdEED=xBXSw@mail.gmail.com
Subject: Re: [ADV7393] DRM Encoder Slave or DRM Bridge
Message-ID: <20190527061958.GI21222@phenom.ffwll.local>
References: <20190527010753.GA15000@smart-ThinkPad-T410>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190527010753.GA15000@smart-ThinkPad-T410>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=UThDfIqXpwAMp2Mizf9XuCGlo5zUVSHqinqUEpR6nck=;
 b=RPv5lfFK4StUOFV7+eJWHQJij3zY9pEUouwIECtLyhtCFEWIrW51rpMipK9+NB2eEc
 O5ESTx2dgki0NHbwQGQP1wglXx0iAXdXxDmSSGtjah/jpvMNkDBa8y+bKXm61DfwB8F6
 WAGKf8tbZOW2fXT3k33/BwAUeOBXVQi7LHWU8=
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
Cc: tomi.valkeinen@ti.com, vikasmpatil@gmail.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMjcsIDIwMTkgYXQgMDU6Mzc6NTRBTSArMDQzMCwgbmFzc2VyIGFmc2hpbiB3
cm90ZToKPiBIaSBWaWthc2gsCj4gCj4gQXMgaXQncyBiZWVuIHF1aXRlIGEgd2hpbGUsIEkgd2Fu
dCB0byBrbm93IGlmIHRoZSBwcm9ibGVtIGlzIHNvbHZlZCBzdWNjZXNzZnVsbHkKPiBJZiBzbywg
Y291bGQgeW91IHBsZWFzZSBzaGVkIHNvbWUgbGlnaHQgb24gdGhlIHByb2JsZW0gc29sdmluZyBw
YXRoPwoKQ2FuIHlvdSBwbGVhc2UgZXhwbGFpbiAidGhlIHByb2JsZW0iPyBZb3VyIHN1YmplY3Qg
aXNuJ3QgZW5vdWdoIGZvciBtZSB0bwprbm93IHdoYXQgZXhhY3RseSB5b3UncmUgYXNraW5nIGFi
b3V0LgoKVGhhbmtzLCBEYW5pZWwKCj4gCj4gV29ya2luZyBvbiBhIGN1c3RvbSBoYXJkd2FyZSBi
YXNlZCBvbiBUSSBBTTU3MjgsIGFuZCBoYXZpbmcgdGhlIHNhbWUKPiBwcm9ibGVtIGF0IGhhbmQs
IEkganVzdCB3YXMgY3VyaW91cyBpZiBzb21lIG9uZSBoYXMgYmVlbiBhYmxlIHRvIHdyaXRlIGEK
PiBvbWFwZHJtIGJhc2VkIGRyaXZlciBmb3IgQURWNzM5My4KPiAKPiBBbnkgaGVscCB3b3VsZCBn
cmVhdGx5IGJlIGFwcHJlY2lhdGVkLgo+IAo+IEtpbmQgUmVnYXJkcywKPiBOYXNzZXIgQWZzaGlu
Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBk
cmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
CgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24K
aHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
