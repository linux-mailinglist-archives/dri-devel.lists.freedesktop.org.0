Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDA091152
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:25:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC856E9DF;
	Sat, 17 Aug 2019 15:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF146EA0A
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 17:35:59 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id r21so2530765qke.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 10:35:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3I0/JtshV0JYc9v5er9Nyt2RkR0gXgFBErZRF2qt5m0=;
 b=SyDdl/rexvd8R/duxV+ji0TlmYxGv7aqddpMe+vVDRf/ELRJg4RNAzoglQ5eQzGBkY
 u9LeFANd+mbn29F90TRKc2L1gyAfwksN1txyYbMAesiCpcan26qQ3O2xZqyErtMzSot9
 p0Z01qVxCVi0egWbCMCWQCArlIGGz7lEn/HnvF5PrJOWrdNiD5zEPPZXalXLAOKYoC9W
 9zLqjAH32zhwxqLijGBFgsCITyZO0Jdpw5Qfg+LhTtxLpz5Nn/itxoFM/zbfkeSxBJMy
 KVcjxgVI0XgYbBnt1wNoxBURSP81ZjrvHHCkVzXTJxwhf3rf4YxIhY4hzNgBGbuGvd0w
 UUQQ==
X-Gm-Message-State: APjAAAVNqHXZuR10bsDa0VX3sRSdLP0d/Xz6va/ef6W2Z94fTY8qQH5s
 r0OifQ/ZX8+QIGTFJvUjCPmsUw==
X-Google-Smtp-Source: APXvYqxCT6Z6k6qpPIV0VSEi+Ea/Upm35vjesy1M0E1G5PDQA92PUo48Y+Ame9Jik9oEIwW+jp3Waw==
X-Received: by 2002:ae9:f707:: with SMTP id s7mr5159848qkg.0.1565890558329;
 Thu, 15 Aug 2019 10:35:58 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id e3sm1552304qkg.91.2019.08.15.10.35.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 15 Aug 2019 10:35:58 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hyJfJ-0006yS-GO; Thu, 15 Aug 2019 14:35:57 -0300
Date: Thu, 15 Aug 2019 14:35:57 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 2/5] kernel.h: Add non_block_start/end()
Message-ID: <20190815173557.GN21596@ziepe.ca>
References: <20190814202027.18735-1-daniel.vetter@ffwll.ch>
 <20190814202027.18735-3-daniel.vetter@ffwll.ch>
 <20190814134558.fe659b1a9a169c0150c3e57c@linux-foundation.org>
 <20190815084429.GE9477@dhcp22.suse.cz>
 <20190815130415.GD21596@ziepe.ca>
 <CAKMK7uE9zdmBuvxa788ONYky=46GN=5Up34mKDmsJMkir4x7MQ@mail.gmail.com>
 <20190815143759.GG21596@ziepe.ca>
 <CAKMK7uEJQ6mPQaOWbT_6M+55T-dCVbsOxFnMC6KzLAMQNa-RGg@mail.gmail.com>
 <20190815151028.GJ21596@ziepe.ca>
 <CAKMK7uG33FFCGJrDV4-FHT2FWi+Z5SnQ7hoyBQd4hignzm1C-A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uG33FFCGJrDV4-FHT2FWi+Z5SnQ7hoyBQd4hignzm1C-A@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3I0/JtshV0JYc9v5er9Nyt2RkR0gXgFBErZRF2qt5m0=;
 b=TEE2VTSv3tx1ZS4nODo3IOEMW+jHQ+D+qi1QIiUZkTdg3tRdtrDS1Yi2Ge0OnwlQjy
 9uKji7u3GHzFOTQr/5OvgUSnhcrBXLslyqF2JAqkQ3GgIk6PLNtVym1yiMIGLCNKTOL1
 iQXtVYo5wmF7eZRIICfA54N3DHqUUMZ+9l5FqFEVzN+v0bu03kcn014mCrD0u20coYbC
 eOTlerFgdQ1Hl3pSxKkr16MDtNGjVedbFoafrOTqsODAG2Dy9iAybdLDz91AheE0jhP3
 csOgvcEu4MCFZjOLKT0QXJJsbsK8STjBB7eCxSDOzDzFeZfx8mVvw4ErfTv55+OVi7LQ
 HPJQ==
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
Cc: Feng Tang <feng.tang@intel.com>, Randy Dunlap <rdunlap@infradead.org>,
 Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jann Horn <jannh@google.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Michal Hocko <mhocko@kernel.org>, Linux MM <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 David Rientjes <rientjes@google.com>, Wei Wang <wvw@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDY6MjU6MTZQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKCj4gSSdtIG5vdCByZWFsbHkgd2VsbCB2ZXJzZWQgaW4gdGhlIGRldGFpbHMgb2Ygb3Vy
IHVzZXJwdHIsIGJ1dCBib3RoCj4gYW1kZ3B1IGFuZCBpOTE1IHdhaXQgZm9yIHRoZSBncHUgdG8g
Y29tcGxldGUgZnJvbQo+IGludmFsaWRhdGVfcmFuZ2Vfc3RhcnQuIEplcm9tZSBoYXMgYXQgbGVh
c3QgbG9va2VkIGEgbG90IGF0IHRoZSBhbWRncHUKPiBvbmUsIHNvIG1heWJlIGhlIGNhbiBleHBs
YWluIHdoYXQgZXhhY3RseSBpdCBpcyB3ZSdyZSBkb2luZyAuLi4KCmFtZGdwdSBpcyAod3Jvbmds
eSkgdXNpbmcgaG1tIGZvciBzb21ldGhpbmcsIEkgY2FuJ3QgcmVhbGx5IHRlbGwgd2hhdAppdCBp
cyB0cnlpbmcgdG8gZG8uIFRoZSBjYWxscyB0byBkbWFfZmVuY2UgdW5kZXIgdGhlCmludmFsaWRh
dGVfcmFuZ2Vfc3RhcnQgZG8gbm90IGdpdmUgbWUgYSBnb29kIGZlZWxpbmcuCgpIb3dldmVyLCBp
OTE1IHNob3dzIGFsbCB0aGUgc2lnbnMgb2YgdHJ5aW5nIHRvIGZvbGxvdyB0aGUgcmVnaXN0cmF0
aW9uCmNhY2hlIG1vZGVsLCBpdCBldmVuIGhhcyBhIG5pY2UgY29tbWVudCBpbgppOTE1X2dlbV91
c2VycHRyX2dldF9wYWdlcygpIGV4cGxhaW5pbmcgdGhhdCB0aGUgcmFjZXMgaXQgaGFzIGRvbid0
Cm1hdHRlciBiZWNhdXNlIGl0IGlzIGEgdXNlciBzcGFjZSBidWcgdG8gY2hhbmdlIHRoZSBWQSBt
YXBwaW5nIGluIHRoZQpmaXJzdCBwbGFjZS4gVGhhdCBqdXN0IHNjcmVhbXMgcmVnaXN0cmF0aW9u
IGNhY2hlIHRvIG1lLgoKU28gaXQgaXMgZmluZSB0byBydW4gSFcgdGhhdCB3YXksIGJ1dCBpZiB5
b3UgZG8sIHRoZXJlIGlzIG5vIHJlYXNvbiB0bwpmZW5jZSBpbnNpZGUgdGhlIGludmFsaWRhdGVf
cmFuZ2UgZW5kLiBKdXN0IG9ycGhhbiB0aGUgRE1BIGJ1ZmZlciBhbmQKY2xlYW4gaXQgdXAgJiBy
ZWxlYXNlIHRoZSBwYWdlIHBpbnMgd2hlbiBhbGwgRE1BIGJ1ZmZlciByZWZzIGdvIHRvCnplcm8u
IFRoZSBuZXh0IGFjY2VzcyB0byB0aGF0IFZBIHNob3VsZCBnZXQgYSBuZXcgRE1BIGJ1ZmZlciB3
aXRoIHRoZQpyaWdodCBtYXBwaW5nLgoKSW4gb3RoZXIgd29yZHMgdGhlIGludmFsaWRhdGlvbiBz
aG91bGQgYmUgdmVyeSBzaW1wbGUgd2l0aG91dApjb21wbGljYXRlZCBsb2NraW5nLCBvciB3YWl0
X2V2ZW50J3MuIExvb2sgYXQgaGZpMSBmb3IgZXhhbXBsZS4KCkphc29uCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
