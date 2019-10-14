Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AFFD66F6
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 18:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB35A6E527;
	Mon, 14 Oct 2019 16:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC766E0DC;
 Mon, 14 Oct 2019 16:13:18 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id y127so12233933lfc.0;
 Mon, 14 Oct 2019 09:13:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YHnMAZs14fJi1NNz2NtD+GzNSsWEq3noMLIQejJbPKU=;
 b=iwUoBG08PA8DpV5Yx8TMKqaeYrLsrSVPxVm5lPuMQjt+z+ZF6GGx5NtAWdnjWLi+9d
 pHVVQbKx/C6riCON0Z4bKbFPN4aEthdZK1GlanjYV0OCrouakxNGj+YWkKz2n6qsr5gW
 dLLBBgYC5aC2slApf9R0Zl3IhVUHze1s8h78v9wcPG5Reh1jIZGvV2YDDc4NY3Gn+bCW
 RTf0oKfhypOYk281wr+115/CboiMjt2apSbTfOt9/B5kVMS7JoGG+Tq1ygIXoLmUJrVr
 JOMUjTsbCgyKSEzChMc2VY3EdX1l8+zg7HFde/VTV/PXXm1WKChJzeyBtvpfRKtDUlUi
 iq4w==
X-Gm-Message-State: APjAAAXOAtR7iCCofTBdlaJO49AprJuL8YF6uh6j9QIh+3Dq027oxZOc
 DOPvbuZ02Rg9fis6LRXySEg=
X-Google-Smtp-Source: APXvYqwDP0lRYsp3cJGX83F+AoNpiKoRwb/MliBNk6cC6YR1rKI1uNyUAt7eBJo+pCIcoF5AbQU7Mg==
X-Received: by 2002:ac2:5a06:: with SMTP id q6mr16772533lfn.59.1571069596454; 
 Mon, 14 Oct 2019 09:13:16 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se.
 [85.224.241.81])
 by smtp.gmail.com with ESMTPSA id 126sm5526559lfh.45.2019.10.14.09.13.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 14 Oct 2019 09:13:14 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
 (envelope-from <johan@kernel.org>)
 id 1iK2yM-00051m-6W; Mon, 14 Oct 2019 18:13:26 +0200
Date: Mon, 14 Oct 2019 18:13:26 +0200
From: Johan Hovold <johan@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 0/4] treewide: fix interrupted release
Message-ID: <20191014161326.GO13531@localhost>
References: <20191010131333.23635-1-johan@kernel.org>
 <20191010135043.GA16989@phenom.ffwll.local>
 <20191011093633.GD27819@localhost>
 <20191014084847.GD11828@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191014084847.GD11828@phenom.ffwll.local>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: Al Viro <viro@zeniv.linux.org.uk>, freedreno@lists.freedesktop.org,
 Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Johan Hovold <johan@kernel.org>,
 Fabien Dessenne <fabien.dessenne@st.com>, linux-kernel@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>, dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMTQsIDIwMTkgYXQgMTA6NDg6NDdBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBGcmksIE9jdCAxMSwgMjAxOSBhdCAxMTozNjozM0FNICswMjAwLCBKb2hhbiBI
b3ZvbGQgd3JvdGU6Cj4gPiBPbiBUaHUsIE9jdCAxMCwgMjAxOSBhdCAwMzo1MDo0M1BNICswMjAw
LCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gPiBPbiBUaHUsIE9jdCAxMCwgMjAxOSBhdCAwMzox
MzoyOVBNICswMjAwLCBKb2hhbiBIb3ZvbGQgd3JvdGU6Cj4gPiA+ID4gVHdvIG9sZCBVU0IgZHJp
dmVycyBoYWQgYSBidWcgaW4gdGhlbSB3aGljaCBjb3VsZCBsZWFkIHRvIG1lbW9yeSBsZWFrcwo+
ID4gPiA+IGlmIGFuIGludGVycnVwdGVkIHByb2Nlc3MgcmFjZWQgd2l0aCBhIGRpc2Nvbm5lY3Qg
ZXZlbnQuCj4gPiA+ID4gCj4gPiA+ID4gVHVybnMgb3V0IHdlIGhhZCBhIGZldyBtb3JlIGRyaXZl
ciBpbiBvdGhlciBzdWJzeXN0ZW1zIHdpdGggdGhlIHNhbWUKPiA+ID4gPiBraW5kIG9mIGJ1ZyBp
biB0aGVtLgo+ID4gCj4gPiA+IFJhbmRvbSBmdW5ueSBpZGVhOiBDb3VsZCB3ZSBkbyBzb21lIGRl
YnVnIGFubm90YXRpb25zIChha2luIHRvCj4gPiA+IG1pZ2h0X3NsZWVwKSB0aGF0IHNwbGF0cyB3
aGVuIHlvdSBtaWdodF9zbGVlcF9pbnRlcnJ1cHRpYmxlIHNvbWV3aGVyZQo+ID4gPiB3aGVyZSBp
bnRlcnJ1cHRpYmxlIHNsZWVwcyBhcmUgZ2VuZXJhbGx5IGEgYmFkIGlkZWE/IExpa2UgaW4KPiA+
ID4gZm9wcy0+cmVsZWFzZT8KPiA+IAo+ID4gVGhlcmUncyBub3RoaW5nIHdyb25nIHdpdGggaW50
ZXJydXB0aWJsZSBzbGVlcCBpbiBmb3BzLT5yZWxlYXNlIHBlciBzZSwKPiA+IGl0J3MganVzdCB0
aGF0IGRyaXZlcnMgY2Fubm90IHJldHVybiAtRVJFU1RBUlRTWVMgYW5kIGZyaWVuZHMgYW5kIGV4
cGVjdAo+ID4gdG8gYmUgY2FsbGVkIGFnYWluIGxhdGVyLgo+IAo+IERvIHlvdSBoYXZlIGEgbGVn
aXQgdXNlY2FzZSBmb3IgaW50ZXJydXB0aWJsZSBzbGVlcHMgaW4gZm9wcy0+cmVsZWFzZT8KClRo
ZSB0dHkgbGF5ZXIgZGVwZW5kcyBvbiB0aGlzIGZvciBleGFtcGxlIHdoZW4gd2FpdGluZyBmb3Ig
YnVmZmVyZWQKd3JpdGVzIHRvIGNvbXBsZXRlIChzb21ldGhpbmcgd2hpY2ggbWF5IG5ldmVyIGhh
cHBlbiB3aGVuIHVzaW5nIGZsb3cKY29udHJvbCkuCgo+IEknbSBub3QgZXZlbiBzdXJlIGtpbGxh
YmxlIGlzIGxlZ2l0IGluIHRoZXJlLCBzaW5jZSBpdCdzIGFuIGZkLCBub3QgYQo+IHByb2Nlc3Mg
Y29udGV4dCAuLi4KCkl0IHdpbGwgYmUgcnVuIGluIHByb2Nlc3MgY29udGV4dCBpbiBtYW55IGNh
c2VzLCBhbmQgZm9yIHR0eXMgd2UncmUgZ29vZApBRkFJQ1QuCgo+ID4gVGhlIHJldHVybiB2YWx1
ZSBmcm9tIHJlbGVhc2UoKSBpcyBpZ25vcmVkIGJ5IHZmcywgYW5kIGFkZGluZyBhIHNwbGF0IGlu
Cj4gPiBfX2ZwdXQoKSB0byBjYXRjaCB0aGVzZSBidWdneSBkcml2ZXJzIG1pZ2h0IGJlIG92ZXJr
aWxsLgo+IAo+IEltZSBvbmNlIHlvdSBoYXZlIGEgaGFuZGZ1bCBvZiBpbnN0YW5jZXMgb2YgYSBi
cm9rZW4gcGF0dGVybiwgY3JlYXRpbmcgYQo+IGNoZWNrIGZvciBpdCAodW5kZXIgYSBkZWJ1ZyBv
cHRpb24gb25seSBvZmMpIGlzIHZlcnkgbXVjaCBqdXN0aWZpZWQuCj4gT3RoZXJ3aXNlIHRoZXkg
anVzdCBjb21lIGJhY2sgdG8gbGlmZSBsaWtlIHRoZSB1bmRlYWQsIGFsbCB0aGUgdGltZS4gQW5k
Cj4gdGhlcmUncyBhIF9sb3RfIG9mIGZvcHMtPnJlbGVhc2UgY2FsbGJhY2tzIGluIHRoZSBrZXJu
ZWwuCgpZZWFoLCB5b3UgaGF2ZSBhIHBvaW50LgoKQnV0IHRha2UgdHR5IGFnYWluIGFzIGFuIGV4
YW1wbGUsIHRoZSBjbG9zZSB0dHkgb3BlcmF0aW9uIGNhbGxlZCBmcm9tCnJlbGVhc2UoKSBpcyBk
ZWNsYXJlZCB2b2lkIHNvIHRoZXJlJ3Mgbm8gcHJvcGFnYXRlZCByZXR1cm4gdmFsdWUgZm9yIHZm
cwp0byBjaGVjay4KCkl0IG1heSBldmVuIGJlIGJldHRlciB0byBmaXggdXAgdGhlIDEwMCBvciBz
byBjYWxsYmFja3MgcG90ZW50aWFsbHkKcmV0dXJuaW5nIG5vbi16ZXJvIGFuZCBtYWtlIGZvcHMt
PnJlbGVhc2Ugdm9pZCBzbyB0aGF0IHRoZSBjb21waWxlcgp3b3VsZCBoZWxwIHVzIGNhdGNoIGFu
eSBmdXR1cmUgYnVncyBhbmQgYWxzbyBzZXJ2ZSBhcyBhIGhpbnQgZm9yCmRldmVsb3BlcnMgdGhh
dCByZXR1cm5pbmcgZXJybm9zIGZyb20gZm9wcy0+cmVsZWFzZSBpcyBwcm9iYWJseSBub3QKd2hh
dCB5b3Ugd2FudCB0byBkby4KCkJ1dCB0aGF0J3MgYSBsb3Qgb2YgY2h1cm4gb2YgY291cnNlLgoK
Sm9oYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
