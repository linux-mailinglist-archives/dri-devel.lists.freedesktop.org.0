Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CDCA7E00
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 10:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A16498997C;
	Wed,  4 Sep 2019 08:37:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A46968997E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 08:37:51 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id g24so21646040edu.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2019 01:37:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=aVdFPGsO99fAHb0fDhq0jDs2yUdP0q6E5B82ILny3Mw=;
 b=jogUuusaxbE1MHPhXAQuGBZrYoS7O6B8aVRSqDXruVanfBppvBpuJQeRQeBugU8STY
 OZN/AkKtsjOm7+PeFaEMGCTnMYr8N284Xu39RltLfEwuzC3WT9S7Wjrw4jhvESiz/w7R
 A008Uw2dfc4/tqnq0iUe+XAqPlmhWh6V65DS1ysYOznqabxcS67BRe45Mb3VxeWHWaT6
 /RBKl9cWgNyURgivW5dW+OHnyi3e4VI228RevSLJWNlMOUMjFUDawmKMMkaoYWNZJRmh
 xc+XnRFegp5UjVTel0TGm986tDcT7xL+G5eznC+hT2u9dIiEvElvzWSPQ42ZCUA1kf1V
 vv4w==
X-Gm-Message-State: APjAAAXbvRPUt/pRFTCTiAwwTZx4avp+eFH3+PsXrmnNnEGldwdsQhSW
 QV0YNSoDc00chelmmo7KSHwo9w==
X-Google-Smtp-Source: APXvYqz0ChI/C22nVFm32NQ+8BGIvxKJ90yP02BZdljqxcx7QVaEp8goV21yUaH/pz+vZNJPQFlB9A==
X-Received: by 2002:a17:906:7c55:: with SMTP id
 g21mr1482880ejp.177.1567586270115; 
 Wed, 04 Sep 2019 01:37:50 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id t16sm2638378ejj.48.2019.09.04.01.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 01:37:49 -0700 (PDT)
Date: Wed, 4 Sep 2019 10:37:47 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Hillf Danton <hdanton@sina.com>
Subject: Re: gnome-shell stuck because of amdgpu driver [5.3 RC5]
Message-ID: <20190904083747.GE2112@phenom.ffwll.local>
Mail-Followup-To: Hillf Danton <hdanton@sina.com>,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Linux kernel <linux-kernel@vger.kernel.org>,
 Alex Deucher <alexdeucher@gmail.com>,
 Harry Wentland <hwentlan@amd.com>
References: <20190830032948.13516-1-hdanton@sina.com>
 <CABXGCsNywbo90+wgiZ64Srm-KexypTbjiviwTW_BsO9Pm11GKQ@mail.gmail.com>
 <5d6e2298.1c69fb81.b5532.8395SMTPIN_ADDED_MISSING@mx.google.com>
 <CABXGCsMG2YrybO4_5jHaFQQxy2ywB53pY63qRfXK=ZKx5qc2Bw@mail.gmail.com>
 <CAKMK7uH9q09XadTV5Ezm=9aODErD=w_+8feujviVnF5LO_fggA@mail.gmail.com>
 <5d6f10a6.1c69fb81.6b104.af73SMTPIN_ADDED_MISSING@mx.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5d6f10a6.1c69fb81.6b104.af73SMTPIN_ADDED_MISSING@mx.google.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=aVdFPGsO99fAHb0fDhq0jDs2yUdP0q6E5B82ILny3Mw=;
 b=U9+zEmr/e91kEhC0hkj435zZ0gbXQfHEM0gCZI0xxo4dfi1ycr946w8RBp5Vp6dYmo
 1jYryGWSSRgZGuKaXNbE87tsfEGHFZfP6KOuyMa/Vdl33wxKSdAn9aKG1BA0LvniT9DL
 gKWayI2hSfYejDicvfILxoqr37c/e1/IqH6js=
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
Cc: Linux kernel <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 Harry Wentland <hwentlan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMDQsIDIwMTkgYXQgMDk6MTc6MTZBTSArMDgwMCwgSGlsbGYgRGFudG9uIHdy
b3RlOgo+IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiA+Pgo+ID4+IE5vdyAxMTow
MXBtIGFuZCAiZ25vbWUgc2hlbGwgc3R1Y2sgd2FybmluZyIgbm90IGFwcGVhciBzaW5jZSAxOTox
Ny4gU28KPiA+PiBsb29rcyBsaWtlIGlzc3VlIGhhcHBlbnMgb25seSB3aGVuIGNvbXB1dGVyIGJs
b2NrZWQgYW5kIG1vbml0b3IgaW4KPiA+PiBwb3dlciBzYXZlIG1vZGUuCj4gPgo+ID4gSSdkIGJl
dCBvbiBydW50aW1lIHBtIG9yIHNvbWUgb3RoZXIgcG93ZXIgc2F2aW5nIGZlYXR1cmUgaW4gYW1k
Z3B1Cj4gPiBzaHV0dGluZyB0aGUgaW50ZXJydXB0IGhhbmRsaW5nIGRvd24gYmVmb3JlIHdlJ3Zl
IGhhbmRsZWQgYWxsIHRoZQo+ID4gaW50ZXJydXB0cy4gVGhhdCB3b3VsZCB0aGVuIHJlc3VsdCBp
biBhIHN0dWNrIGZlbmNlLgo+ID4KPiA+IERvIHdlIGFscmVhZHkga25vdyB3aGljaCBmZW5jZSBp
cyBzdHVjaz8KPiAKPiBJdCBpcyB3ZWxjb21lZCB0byBzaGVkIGEgdGhyZWFkIG9mIGxpZ2h0IG9u
IGhvdyB0byBjb2xsZWN0L3ByaW50IHRoYXQgaW5mby4KPiBTYXkgbGluZTp4eHgteXl5IGluIHBh
dGgvdG8vYW1kZ3B1L3p6ei5jCgpFeHRlbmQgeW91ciBiYWNrdHJhYyB3YXJuaW5nIHNsaWdodGx5
IGxpa2UKCglXQVJOKHIsICJ3ZSdyZSBzdHVjayBvbiBmZW5jZSAlcFNcbiIsIGZlbmNlLT5vcHMp
OwoKQWxzbyBhZGRpbmcgSGFycnkgYW5kIEFsZXgsIEknbSBub3QgcmVhbGx5IHdvcmtpbmcgb24g
YW1kZ3B1IC4uLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJ
bnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
