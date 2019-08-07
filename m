Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 010B385BCE
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 09:46:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D4D6E797;
	Thu,  8 Aug 2019 07:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7FC96E6B6
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 11:46:35 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id d17so9006480qtj.8
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2019 04:46:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9tcMRoCrJOgypBCjgMnEianhaeJlCGMLrqGgBoLjIDU=;
 b=lfhnGpVKvXueYk9zdAdptiqs+AtIQyfeQJpAhz14FmxXPwj0hE8eaJmcYtfO+pZVwx
 QZRQzAk+/Nf2ssfE4gchzteUFzQrh1v6caOV8oyZGbBa7OuHb2iGft5lJ7US8EbXmf/F
 GL0RuAi5AeLXRa0icrWuzMhsgx/UOW7s6P89MQ+9AZm/jkUXAy0KXe/p62A25KBWFuKT
 /32WHsOjBSHrIUXpA9abdp3yKhSiRZjZcpzVhx5TDOBPQcYI4qYuo5smpLD4y7uWx7zV
 +gSiZ+3JJmNo/NhjkzFHQLX26h4+yw+mBso84ZQxpKkMo+3QPm8xz5b/sWPX77hINv7H
 mTeg==
X-Gm-Message-State: APjAAAWr7yVAxa94EM6xSGAZmI6hL4ZXCY/jNpUqwxO7xIYKPn/JLMZM
 NfsjuzJhEvUHZSq4OhjQQnELSg==
X-Google-Smtp-Source: APXvYqwgiLU0pSR3tJqkM4Nqx6SM116MNW2dWYs7m0gkaOSNuRmQOq6FVBT9RTAhBGfUW5xdKQEVPQ==
X-Received: by 2002:aed:24d9:: with SMTP id u25mr7755713qtc.111.1565178394864; 
 Wed, 07 Aug 2019 04:46:34 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id a135sm40043046qkg.72.2019.08.07.04.46.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 07 Aug 2019 04:46:34 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hvKOn-0000fJ-NF; Wed, 07 Aug 2019 08:46:33 -0300
Date: Wed, 7 Aug 2019 08:46:33 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH 15/15] amdgpu: remove CONFIG_DRM_AMDGPU_USERPTR
Message-ID: <20190807114633.GA1557@ziepe.ca>
References: <20190806160554.14046-1-hch@lst.de>
 <20190806160554.14046-16-hch@lst.de>
 <20190806174437.GK11627@ziepe.ca>
 <587b1c3c-83c4-7de9-242f-6516528049f4@amd.com>
 <CADnq5_Puv-N=FVpNXhv7gOWZ8=tgBD2VjrKpVzEE0imWqJdD1A@mail.gmail.com>
 <20190806200356.GU11627@ziepe.ca>
 <4a040a3f-8981-3e94-2436-8295a0caa534@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4a040a3f-8981-3e94-2436-8295a0caa534@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 08 Aug 2019 07:46:20 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9tcMRoCrJOgypBCjgMnEianhaeJlCGMLrqGgBoLjIDU=;
 b=U08UfgqoDECwAr2QVZQUgZK40EFADE7BB9s9xvrIZg9BnRq7d95CB83a2OkP1WEJcj
 FJHxKesZGFWoqIF2Qvx18DQ0QvKbjikgKunvpDQdaSIZ0xtKT4N7Aaxnh+uo7IY4chsI
 EfR9d/3Agjm/w1qM55xjv8+yMuR6GmpagkJuTiZ1huMV62pE12VP4QStafaX4bqEbCF5
 nKofSYhlitBlOo14ZSx+w2EM6o/0BqEsL16SZ9EMLbCiY4rRVsTQde2O8lzNMJEb+Cq/
 Vx2rLEgsoxjAWUNTBox+Ov8foZ2VXl/0VY0B4PKb+rOpSVgQBrfb34kDq3jWYLCsqCZd
 XwCA==
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMDY6NTc6MjRBTSArMDAwMCwgS29lbmlnLCBDaHJpc3Rp
YW4gd3JvdGU6Cj4gQW0gMDYuMDguMTkgdW0gMjI6MDMgc2NocmllYiBKYXNvbiBHdW50aG9ycGU6
Cj4gPiBPbiBUdWUsIEF1ZyAwNiwgMjAxOSBhdCAwMjo1ODo1OFBNIC0wNDAwLCBBbGV4IERldWNo
ZXIgd3JvdGU6Cj4gPj4gT24gVHVlLCBBdWcgNiwgMjAxOSBhdCAxOjUxIFBNIEt1ZWhsaW5nLCBG
ZWxpeCA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4gd3JvdGU6Cj4gPj4+IE9uIDIwMTktMDgtMDYg
MTM6NDQsIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiA+Pj4+IE9uIFR1ZSwgQXVnIDA2LCAyMDE5
IGF0IDA3OjA1OjUzUE0gKzAzMDAsIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+ID4+Pj4+IFRo
ZSBvcHRpb24gaXMganVzdCB1c2VkIHRvIHNlbGVjdCBITU0gbWlycm9yIHN1cHBvcnQgYW5kIGhh
cyBhIHZlcnkKPiA+Pj4+PiBjb25mdXNpbmcgaGVscCB0ZXh0LiAgSnVzdCBwdWxsIGluIHRoZSBI
TU0gbWlycm9yIGNvZGUgYnkgZGVmYXVsdAo+ID4+Pj4+IGluc3RlYWQuCj4gPj4+Pj4KPiA+Pj4+
PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiA+Pj4+PiAg
ICBkcml2ZXJzL2dwdS9kcm0vS2NvbmZpZyAgICAgICAgICAgICAgICAgfCAgMiArKwo+ID4+Pj4+
ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L0tjb25maWcgICAgICB8IDEwIC0tLS0tLS0t
LS0KPiA+Pj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgfCAg
NiAtLS0tLS0KPiA+Pj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRt
LmggfCAxMiAtLS0tLS0tLS0tLS0KPiA+Pj4+PiAgICA0IGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMjggZGVsZXRpb25zKC0pCj4gPj4+PiBGZWxpeCwgd2FzIHRoaXMgYW4gZWZmb3J0
IHRvIGF2b2lkIHRoZSBhcmNoIHJlc3RyaWN0aW9uIG9uIGhtbSBvcgo+ID4+Pj4gc29tZXRoaW5n
PyBBbHNvIGNhbid0IHNlZSB3aHkgdGhpcyB3YXMgbGlrZSB0aGlzLgo+ID4+PiBUaGlzIG9wdGlv
biBwcmVkYXRlcyBLRkQncyBzdXBwb3J0IG9mIHVzZXJwdHJzLCB3aGljaCBpbiB0dXJuIHByZWRh
dGVzCj4gPj4+IEhNTS4gUmFkZW9uIGhhcyB0aGUgc2FtZSBraW5kIG9mIG9wdGlvbiwgdGhvdWdo
IGl0IGRvZXNuJ3QgYWZmZWN0IEhNTSBpbgo+ID4+PiB0aGF0IGNhc2UuCj4gPj4+Cj4gPj4+IEFs
ZXgsIENocmlzdGlhbiwgY2FuIHlvdSB0aGluayBvZiBhIGdvb2QgcmVhc29uIHRvIG1haW50YWlu
IHVzZXJwdHIKPiA+Pj4gc3VwcG9ydCBhcyBhbiBvcHRpb24gaW4gYW1kZ3B1PyBJIHN1c3BlY3Qg
aXQgd2FzIG9yaWdpbmFsbHkgbWVhbnQgYXMgYQo+ID4+PiB3YXkgdG8gYWxsb3cga2VybmVscyB3
aXRoIGFtZGdwdSB3aXRob3V0IE1NVSBub3RpZmllcnMuIE5vdyBpdCB3b3VsZAo+ID4+PiBhbGxv
dyBhIGtlcm5lbCB3aXRoIGFtZGdwdSB3aXRob3V0IEhNTSBvciBNTVUgbm90aWZpZXJzLiBJIGRv
bid0IGtub3cgaWYKPiA+Pj4gdGhpcyBpcyBhIHVzZWZ1bCB0aGluZyB0byBoYXZlLgo+ID4+IFJp
Z2h0LiAgVGhlcmUgd2VyZSBwZW9wbGUgdGhhdCBkaWRuJ3QgaGF2ZSBNTVUgbm90aWZpZXJzIHRo
YXQgd2FudGVkCj4gPj4gc3VwcG9ydCBmb3IgdGhlIEdQVS4KPiA+ID8/IElzIHRoYXQgZXZlbiBh
IHJlYWwgdGhpbmc/IG1tdV9ub3RpZmllciBkb2VzIG5vdCBoYXZlIG11Y2gga2NvbmZpZwo+ID4g
ZGVwZW5kZW5jeS4KPiAKPiBZZXMsIHRoYXQgdXNlZCB0byBiZSBhIHZlcnkgcmVhbCB0aGluZy4K
PiAKPiBJbml0aWFsbHkgYSBsb3Qgb2YgdXNlcnMgZGlkbid0IHdhbnRlZCBtbXUgbm90aWZpZXJz
IHRvIGJlIGVuYWJsZWQgCj4gYmVjYXVzZSBvZiB0aGUgcGVyZm9ybWFuY2Ugb3ZlcmhlYWQgdGhl
eSBjb3N0cy4KClNlZW1zIHN0cmFuZ2UgdG8gaGVhciB0aGVzZSBkYXlzLCBldmVyeSBkaXN0cm8g
c2hpcHMgd2l0aCBpdCBvbiwgaXQgaXMKbmVlZGVkIGZvciBrdm0uCgo+IFRoZW4gd2UgaGFkIHRo
ZSBwcm9ibGVtIHRoYXQgSE1NIG1pcnJvciB3YXNuJ3QgYXZhaWxhYmxlIG9uIGEgbG90IG9mIAo+
IGFyY2hpdGVjdHVyZXMuCgpTb21lIHBhdGNoZXMgZm9yIGhtbSBhcmUgcmVhZHkgbm93IHRoYXQg
d2lsbCBmaXggdGhpcwoKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
