Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35914CE7A4
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 17:33:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D3956E153;
	Mon,  7 Oct 2019 15:33:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 883566E153
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 15:33:43 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id n14so15822028wrw.9
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2019 08:33:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=quR8Kb6GAk4jYImEGkDjHBYeMyfZIdQBv2DrxYLvF70=;
 b=bvudQi0XolX1KM3VRF1B8aLLUZ3igTNeJhb9kSlIwyqU+OXYW2bviP7JPH8Vp0y67H
 1sLisNqBTN4fmf5ymDEsYpeeudh1e2c3sElYCpCS2sTrX9/y0p4NgzyoeC8b8a7s2o5O
 n/CKxbtW1Wvq+U6HBCQAZNJCWXrB1NDaYfY/ty5YCZgVTcb2fqgLTxe2pSZOHwlDyqYh
 jR9oRD5Q/R+8AilQo/zXy+p8ryBUrb3HjIYQFfyQXWdF8urt1PTtbSM0lqAyToEC8yI6
 2+0y5kQNJH2/31PQjXDGiMVtJG0n6taQFOcK8DaHDVJEid2StIY6+NvexBufaQYWAAx8
 hYUQ==
X-Gm-Message-State: APjAAAW90A04Z8tnHE6wk3A/+RafR4qw4XSUnBoSzLmTvL8i5STcYqeV
 Oj6UKIG6pvx6iI/3DuDQYDA=
X-Google-Smtp-Source: APXvYqz1lvbhYIE/Ji8FSRU355cLZvKRKQCsmcdWrQVr8/9Glty+Il7foi680QdDddETmlMfQpbxHQ==
X-Received: by 2002:adf:dcd2:: with SMTP id x18mr22950157wrm.220.1570462422220; 
 Mon, 07 Oct 2019 08:33:42 -0700 (PDT)
Received: from gmail.com (2E8B0CD5.catv.pool.telekom.hu. [46.139.12.213])
 by smtp.gmail.com with ESMTPSA id a2sm21763670wrt.45.2019.10.07.08.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 08:33:41 -0700 (PDT)
Date: Mon, 7 Oct 2019 17:33:39 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Davidlohr Bueso <dave@stgolabs.net>
Subject: Re: [PATCH 11/11] x86/mm, pat: convert pat tree to generic interval
 tree
Message-ID: <20191007153339.GA95072@gmail.com>
References: <20191003201858.11666-1-dave@stgolabs.net>
 <20191003201858.11666-12-dave@stgolabs.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191003201858.11666-12-dave@stgolabs.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=quR8Kb6GAk4jYImEGkDjHBYeMyfZIdQBv2DrxYLvF70=;
 b=c7lu6Yh4SW2Tvuh1xafLP92jKbiNAvuBg/Km9vd0KvZU2E11+TBSVwgc3WkiZ/6GeG
 OMD89f1fH4nrgXTqmewRdrimBHyGFLGFKhNTmCzVClKy/HbvAwz5w4mlL+IVRMQCTz10
 w1XeN9pM4v/P9F0cC5BAE38SgX/rmuGkKEvFK0M0wDbKCr9fMFJduL5aLgwtmJu/HCUD
 6DJot7eTO+zB+slgYRwaG30RBBGpQ0NcW0wtW6b4Io3NSOS7ho1aA/VKEQHq8ltDWgzX
 13XSYOlp6u4QQ1/acZA8CeqSwl21x9EWYa2o7ghUB8UqvfmxtfQrxYgm+rBDK4NY3Ew1
 iafA==
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
Cc: Davidlohr Bueso <dbueso@suse.de>, peterz@infradead.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, akpm@linux-foundation.org, walken@google.com,
 Thomas Gleixner <tglx@linutronix.de>, linux-rdma@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CiogRGF2aWRsb2hyIEJ1ZXNvIDxkYXZlQHN0Z29sYWJzLm5ldD4gd3JvdGU6Cgo+IFdpdGggc29t
ZSBjb25zaWRlcmF0aW9ucywgdGhlIGN1c3RvbSBwYXRfcmJ0cmVlIGltcGxlbWVudGF0aW9uIGNh
biBiZQo+IHNpbXBsaWZpZWQgdG8gdXNlIG1vc3Qgb2YgdGhlIGdlbmVyaWMgaW50ZXJ2YWxfdHJl
ZSBtYWNoaW5lcnkuCj4gCj4gbyBUaGUgdHJlZSBpbm9yZGVyIHRyYXZlcnNhbCBjYW4gc2xpZ2h0
bHkgZGlmZmVyIHdoZW4gdGhlcmUgYXJlIGtleQo+ICgnc3RhcnQnKSBjb2xsaXNpb25zIGluIHRo
ZSB0cmVlIGR1ZSB0byBvbmUgZ29pbmcgbGVmdCBhbmQgYW5vdGhlciByaWdodC4KPiBUaGlzLCBo
b3dldmVyLCBvbmx5IGFmZmVjdHMgdGhlIG91dHB1dCBvZiBkZWJ1Z2ZzJyBwYXRfbWVtdHlwZV9s
aXN0IGZpbGUuCj4gCj4gbyBHZW5lcmljIGludGVydmFsIHRyZWVzIGFyZSBub3cgc2VtaSBvcGVu
IFthLGIpLCB3aGljaCBzdWl0cyB3ZWxsIHdpdGgKPiB3aGF0IHBhdCB3YW50cy4KPiAKPiBvIEVy
YXNpbmcgbG9naWMgbXVzdCByZW1haW4gdW50b3VjaGVkIGFzIHdlbGwuCj4gCj4gSW4gb3JkZXIg
Zm9yIHRoZSB0eXBlcyB0byByZW1haW4gdTY0LCB0aGUgJ21lbXR5cGVfaW50ZXJ2YWwnIGNhbGxz
IGFyZQo+IGludHJvZHVjZWQsIGFzIG9wcG9zZWQgdG8gc2ltcGx5IHVzaW5nIHN0cnVjdCBpbnRl
cnZhbF90cmVlLgo+IAo+IEluIGFkZGl0aW9uLCBwYXQgdHJlZSBtaWdodCBwb3RlbnRpYWxseSBh
bHNvIGJlbmVmaXQgYnkgdGhlIGZhc3Qgb3ZlcmxhcAo+IGRldGVjdGlvbiBmb3IgdGhlIGluc2Vy
dGlvbiBjYXNlIHdoZW4gbG9va2luZyB1cCB0aGUgZmlyc3Qgb3ZlcmxhcHBpbmcgbm9kZQo+IGlu
IHRoZSB0cmVlLgo+IAo+IEZpbmFsbHksIEkndmUgdGVzdGVkIHRoaXMgb24gdmFyaW91cyBzZXJ2
ZXJzLCB2aWEgc2FuaXR5IHdhcm5pbmdzLCBydW5uaW5nCj4gc2lkZSBieSBzaWRlIHdpdGggdGhl
IGN1cnJlbnQgdmVyc2lvbiBhbmQgc28gZmFyIHNlZSBubyBkaWZmZXJlbmNlcyBpbiB0aGUKPiBy
ZXR1cm5lZCBwb2ludGVyIG5vZGUgd2hlbiBkb2luZyBtZW10eXBlX3JiX2xvd2VzdF9tYXRjaCgp
IGxvb2t1cHMuCj4gCj4gQ2M6IFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4K
PiBDYzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+Cj4gQ2M6IEluZ28gTW9s
bmFyIDxtaW5nb0ByZWRoYXQuY29tPgo+IENjOiBCb3Jpc2xhdiBQZXRrb3YgPGJwQGFsaWVuOC5k
ZT4KPiBDYzogeDg2QGtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZGxvaHIgQnVlc28g
PGRidWVzb0BzdXNlLmRlPgo+IC0tLQo+ICBhcmNoL3g4Ni9tbS9wYXQuYyAgICAgICAgfCAgMjIg
KysrLS0tLQo+ICBhcmNoL3g4Ni9tbS9wYXRfcmJ0cmVlLmMgfCAxNTEgKysrKysrKysrKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA0MyBp
bnNlcnRpb25zKCspLCAxMzAgZGVsZXRpb25zKC0pCgpJIHN1cHBvc2UgdGhpcyB3aWxsIGJlIGNh
cnJpZWQgaW4gLW1tPwoKSWYgc28gYW5kIGlmIHRoaXMgcGF0Y2ggaXMgcmVncmVzc2lvbiBmcmVl
LCB0aGVuOgoKICBBY2tlZC1ieTogSW5nbyBNb2xuYXIgPG1pbmdvQGtlcm5lbC5vcmc+CgpUaGFu
a3MsCgkKCUluZ28KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
