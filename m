Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DB269AA2
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 20:16:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C06BD89683;
	Mon, 15 Jul 2019 18:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B800A89683
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 18:16:31 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id x25so17264712ljh.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 11:16:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NxYkT3JhQGsfdWSUR+NdZx3rfXwiwgFSiibvH8MhehY=;
 b=sGLUeYlb65UH+6hZ2ZeJEqjK44e7n3tdpNi6kqb6ekM+ISveuD9gZ3EpToYZoN+fqc
 E5pNWHB3+EfeKFX72piOs1yUC/rgECUXimkJgL9CavkXaT1O1F8zU35XFlsmxzsCtVky
 hySAzacObUC1k0zhuIubofZGI8ocrJJ0G9BrHngosl0GaFPrUbp5PGAzl+RYsS+SCdQh
 D5YAxjL/+vE5YDWLcYBxRwUL7C/YfssZ320aWEIDQKKRAw3qQ4of1HzPFT3QHoQXXQ3v
 6mzEGrbqZfPUyXq1WDTDZMJsW9c1Ixx6sLRPdWF2qmUHx+a8R1W2cl5rlUOwFI5J9LNX
 wDyA==
X-Gm-Message-State: APjAAAW2Sj+sW3fa4SS+vhHlTtfnYRpOoEPkkE89/DJTWKvaRqcgdMRh
 gJdTUuz4GUdIwlHDElWjOgr+GAzNOR0=
X-Google-Smtp-Source: APXvYqw6Y455ocLijdMG8elAvxViCDyCfP/jEv/QWdmMMzEp5njVuvXjxAVyQ7oHVyIfc+AbQ0hSmg==
X-Received: by 2002:a2e:9ec9:: with SMTP id h9mr14146211ljk.90.1563214589295; 
 Mon, 15 Jul 2019 11:16:29 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com.
 [209.85.167.41])
 by smtp.gmail.com with ESMTPSA id m21sm3236611ljj.48.2019.07.15.11.16.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jul 2019 11:16:28 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id u10so11667979lfm.12
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 11:16:28 -0700 (PDT)
X-Received: by 2002:ac2:4565:: with SMTP id k5mr12141495lfm.170.1563214587837; 
 Mon, 15 Jul 2019 11:16:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzJQ+26n_Df1eBPG1A=tXf4xNuVEjbG3aZj-aqYQ9nnAg@mail.gmail.com>
 <CAPM=9tx+CEkzmLZ-93GZmde9xzJ_rw3PJZxFu_pjZJc7KM5f-w@mail.gmail.com>
 <20190715122924.GA15202@mellanox.com>
In-Reply-To: <20190715122924.GA15202@mellanox.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 15 Jul 2019 11:16:11 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgEimwxXiDUdp9eSGZn4j6n8g-4KhdEG0kPVgKFQeAXgw@mail.gmail.com>
Message-ID: <CAHk-=wgEimwxXiDUdp9eSGZn4j6n8g-4KhdEG0kPVgKFQeAXgw@mail.gmail.com>
Subject: Re: DRM pull for v5.3-rc1
To: Jason Gunthorpe <jgg@mellanox.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=NxYkT3JhQGsfdWSUR+NdZx3rfXwiwgFSiibvH8MhehY=;
 b=ZBzyUNS0vIupXboeYgjwKoFkRb/jk6ka+zjE8/RnQvKRMhfw2/LXNtVYnSmNFznuA6
 voTqfynVSNgNjN46S3bomWqXTpTiCA/4v3/qslmuA4Sbkaq/nTy2Yf6pAhdmIkngTKYD
 UUKAXwxgKQ/rbSW7ztyfx467P8kWDRiGNyS4k=
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jerome Glisse <jglisse@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

WyBVZ2gsIEkgaGF2ZSB0aHJlZSBkaWZmZXJlbnQgdGhyZWFkcyBhYm91dCB0aGUgZHJtIHB1bGwg
YmVjYXVzZSBvZgp0aGUgc3ViamVjdCAvIGh0bWwgY29uZnVzaW9uLiBTbyBub3cgSSdtIHJlcGx5
aW5nIGluIHNlcGFyYXRlIHRocmVhZHMKYW5kIEknbSBob3BpbmcgdGhlIHBlb3BsZSBpbnZvbHZl
ZCBoYXZlIGJldHRlciB0aHJlYWRpbmcgdGhhbiBnbWFpbApkb2VzIDsvIF0KCk9uIE1vbiwgSnVs
IDE1LCAyMDE5IGF0IDU6MjkgQU0gSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPiB3
cm90ZToKPgo+IFRoZSAnaG1tJyB0cmVlIGlzIHNvbWV0aGluZyBJIHJhbiB0byB0cnkgYW5kIGhl
bHAgd29ya2Zsb3cgaXNzdWVzIGxpa2UKPiB0aGlzLCBhcyBpdCBjb3VsZCBiZSBtZXJnZWQgdG8g
RFJNIGFzIGEgdG9waWMgYnJhbmNoIC0gbWF5YmUgY29uc2lkZXIKPiB0aGlzIGZsb3cgaW4gZnV0
dXJlPwo+Cj4gTGludXMsIGRvIHlvdSBoYXZlIGFueSBhZHZpY2Ugb24gaG93IGJlc3QgdG8gaGFu
ZGxlIHNoYXJpbmcgbW0KPiBwYXRjaGVzPwoKSSBkb24ndCBoYXZlIGEgbG90IG9mIGFkdmljZSBl
eGNlcHQgZm9yICJ2ZXJ5IHZlcnkgY2FyZWZ1bGx5Ii4KCkkgdGhpbmsgdGhlIGhtbSB0cmVlIHdv
cmtlZCByZWFsbHkgd2VsbCB0aGlzIG1lcmdlIHdpbmRvdywgYXQgbGVhc3QKZnJvbSBteSBzdGFu
ZHBvaW50LgoKQnV0IGl0IGlzIG9mIGNvdXJzZSBwb3NzaWJsZSB0aGF0IG15IGhhcHBpbmVzcyBh
Ym91dCB0aGUgaG1tIHRyZWUgaXMgYQpjb21wbGV0ZSBmbHVrZSBhbmQgY2FtZSBhYm91dCBiZWNh
dXNlIHByZXR0eSBtdWNoIGFsbCB0aGUgcGF0Y2hlcyB3ZXJlCnJlbW92aW5nIG9kZGl0aWVzIGFu
ZCBjbGVhbmluZyB0aGluZ3MgdXAsIGFuZCB0aGV5IHdlcmVuJ3QgYWRkaW5nIG5ldwpvZGQgdGhp
bmdzIChvciBpZiB0aGV5IHdlcmUsIHlvdSBoaWQgaXQgYmV0dGVyIDteKS4KCkJhc2ljYWxseSwg
cGVvcGxlIHNob3VsZCBrbm93IHRoYXQgdGhlcmUgYXJlIHNvbWUgc3Vic3lzdGVtcyB0aGF0IEkK
ZW5kIHVwIGJlaW5nICptdWNoKiBtb3JlIHdvcnJpZWQgYWJvdXQgdGhhbiBvdGhlcnMuIElmIEkg
c2VlIGEgcHVsbApyZXF1ZXN0IHRoYXQgbW9kaWZpZXMgY29yZSBWTSBvZiBWRlMgY29kZSwgSSB0
ZW5kIHRvIGdvIGludG8gImNhcmVmdWwKbW9kZSIsIGluIHdheXMgdGhhdCBJIGRvbid0IGRvIHdo
ZW4gc29tZSBtYWludGFpbmVyIHNlbmRzIG1lIGEgcHVsbApyZXF1ZXN0IHRoYXQgb2J2aW91c2x5
IG9ubHkgY2hhbmdlcyBzb21lIHN1YnRyZWUgdGhhdCB0aGUgbWFpbnRhaW5lcgpvd25zLgoKV2hl
biBkcml2ZXIgbWFpbnRhaW5lcnMgc2VuZCBtZSBwYXRjaGVzIHRoYXQgdG91Y2ggdGhlaXIgZHJp
dmVycywgSQpsb29rIGF0IHRoZSBkaWZmc3RhdC4KCkJ1dCB3aGVuIGRyaXZlciBtYWludGFpbmVy
cyBzZW5kIG1lIHBhdGNoZXMgdGhhdCBjaGFuZ2UgbW0vLCBJIGxvb2sgYXQKaW5kaXZpZHVhbCBj
b21taXQgbWVzc2FnZXMgYW5kIHRoZSBhY3R1YWwgZGlmZiBpdHNlbGYsIGFuZCBpZiBJIHNlZQpj
b250ZW50aW91cyBzdHVmZiwgSSBzaW1wbHkgd29uJ3QgcHVsbC4KCkl0J3Mgd2h5IEkgbGVmdCB0
aGUgaG1tIHB1bGwgcmVxdWVzdCAod2hpY2ggY2FtZSBpbiBlYXJseSAtIHRoYW5rIHlvdSkKdW50
aWwgeWVzdGVyZGF5LCBzaW1wbHkgYmVjYXVzZSBqdXN0IGZyb20gdGhlIGRpZmZzdGF0IEkgY291
bGQgdGVsbAp0aGF0ICJvaywgdGhpcyBtZXJnZSBpc24ndCBqdXN0IG1lIG1lcmdpbmcgYW5kIGRv
aW5nIHNhbml0eSBjaGVja3MsCnRoaXMgaXMgbWUgaGF2aW5nIHRvIHNldCBhc2lkZSB0aW1lIHRv
IGRvIHJldmlld3MiLiBTbyBqdXN0IGZyb20gdGhlCmRpZmZzdGF0LCBJIGF2b2lkZWQgZXZlbiBs
b29raW5nIGF0IGl0IHdoaWxlIEkgc3RpbGwgaGFkIGEgbWFpbGJveApmdWxsIG9mIG90aGVyIHB1
bGwgcmVxdWVzdHMuCgpTbyBJIGRvIGxpa2Ugc2VlaW5nIGNvcmUgbW0gY2hhbmdlcyBjb21lIGlu
IHRocm91Z2ggYSBzZXBhcmF0ZSBicmFuY2guClRoYXQncyBwYXJ0bHkgYmVjYXVzZSB0aGF0IHdh
eSBpdCdzIGVhc2llciB0byByZXZpZXcgd2l0aG91dCBoYXZpbmcKdGhlIHBhcnRzIEkgY2FyZSBh
Ym91dCBiZSBtaXhlZCB1cCB3aXRoIG90aGVyIHBhcnRzIChpdCdzIG9uZSByZWFzb24gSQphc2tl
ZCB0aGUgc2VjdXJpdHkgbGF5ZXIgcHVsbHMgdG8gYmUgc3BsaXQgdXAsIHRvIHBpY2sgYW5vdGhl
ciBhcmVhCmVudGlyZWx5IGFzIGFuIGV4YW1wbGUpLiBCdXQgaXQncyBhbHNvIHBhcnRseSBiZWNh
dXNlIGlmIHlvdSBoYXZlIGEKc2VwYXJhdGUgYnJhbmNoIGZvciB0aGUgc3R1ZmYgdGhhdCB5b3Ug
a25vdyBpcyBjb250ZW50aW91cywgdGhhdApkb2Vzbid0IHRoZW4gaG9sZCB1cCB0aGUgcGFydHMg
dGhhdCBfYXJlbid0Xy4KCkZvciBleGFtcGxlLCByaWdodCBub3cgSSdtIG5vdCBwdWxsaW5nIF9h
bnlfIG9mIHRoZSBkcm0gdXBkYXRlcywKc2ltcGx5IGJlY2F1c2UgdGhlcmUncyBhIHBhcnQgb2Yg
aXQgdGhhdCBJIGNhbid0IHN0b21hY2guICBJdCB3b3VsZApoYXZlIGJlZW4gc28gbXVjaCBuaWNl
ciBpZiB0aGUgY29udGVudGlvdXMgdGhpbmdzIHRoYXQgbmVlZCBhIGxvdCBvZgpjYXJlIHNlcGFy
YXRlLCBhbmQgSSBjb3VsZCBoYXZlIGF0IGxlYXN0IHB1bGxlZCB0aGUgb3RoZXIgc3R1ZmYuCgog
ICAgICAgICAgICAgICAgICBMaW51cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
