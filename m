Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D60184218
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 09:01:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB08B6EB85;
	Fri, 13 Mar 2020 08:00:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3696EAD0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 14:19:30 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id f28so6368226qkk.13
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 07:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=/PiOEjdfEsvpkbgsNHwc4L+xx9dbsNuqU5VlQ2ohpBk=;
 b=ZonOAvybTTy9G0fas0xnfVjqsxzR6h2MsglRumsufuK5H0bPkKui9zy//gFhDEujcE
 rcu2rHdhYfAKlqzxn54gEygj4/mJ4Ngx76T7ejJOuWZDBrPO6KE3IdHGDNCIEW9j3X2b
 UT4A+6Wsw1o1w0H/GgVCefRWWDgwiYoBZZjCSvUgv5DiU+0cj1M0GWCqTmfbQme+YNE3
 Sz6416+QFbJT7u+ukLN2zRp02hSOCN1mU9w7OD1FEwy/fuh+qKAwyRvO1wIe+dnKqpiL
 dXA6u1L/iEBCrPtbuc/yvKCxoUdkoJusnyaYe5CW+K4XmJ71kSUgLp+06e8eIQZa4DJn
 JwzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=/PiOEjdfEsvpkbgsNHwc4L+xx9dbsNuqU5VlQ2ohpBk=;
 b=HaU9dft6mZzUEWgTvlZdw9mLxchIvYDAAPQLaL7GuD1HSmo+GM3yvD6GE7Eo3aLbVn
 LbaH5vBr3L8qCL16dc0b2xmVu6lxcseqBUWInIbH7OSMvMQ+MAIn9IrnwfsfvcCoKSHZ
 EFLAadRhM9NAgl0eeiQuAua4INt6CpIqfvfnbfUEz+6BR5oDLz7LrqvAF2KkzCGaYjUQ
 ps2z0hT/rq7LjGkNh6DdcdhffjTlePMNvYVzMfTfRo6xkFDeMhKMQcLuzRtnHUob0Hu8
 Vlt3EMKZoTjjl4kOEPTQDDiD+enS2fOBarrr7oOFIM1D6NcTntHM1BkWKWRKpBgtgNUT
 2awA==
X-Gm-Message-State: ANhLgQ0uwAhhdCAKnS0CMTGg0d6m9+fxE5r1JJ2BP32qdIpfEUnIcW3N
 tcAOuKlDap0CwYo1uHClSae1Vw==
X-Google-Smtp-Source: ADFU+vvXg4EGGVemK34kljHZQvgXNrPxNkZ51/3+Zl/oJQuvks201klMSzaKEE/bcFqFKbGz1GRKnQ==
X-Received: by 2002:a05:620a:388:: with SMTP id
 q8mr7659390qkm.488.1584022769797; 
 Thu, 12 Mar 2020 07:19:29 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id o7sm9510761qtg.63.2020.03.12.07.19.29
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 12 Mar 2020 07:19:29 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jCOgK-0006SS-L5; Thu, 12 Mar 2020 11:19:28 -0300
Date: Thu, 12 Mar 2020 11:19:28 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 1/6] lib/scatterlist: add sg_set_dma_addr() function
Message-ID: <20200312141928.GK31668@ziepe.ca>
References: <20200311135158.3310-1-christian.koenig@amd.com>
 <20200311135158.3310-2-christian.koenig@amd.com>
 <20200311152838.GA24280@infradead.org>
 <f2b46f49-a8d0-9d43-3120-e1ed36fc3a80@gmail.com>
 <20200312101943.GA14618@infradead.org>
 <b5db44eb-1dde-1671-feb0-9e47d120f172@amd.com>
 <20200312104729.GA26031@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200312104729.GA26031@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Fri, 13 Mar 2020 08:00:36 +0000
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Logan Gunthorpe <logang@deltatee.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXIgMTIsIDIwMjAgYXQgMDM6NDc6MjlBTSAtMDcwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gVGh1LCBNYXIgMTIsIDIwMjAgYXQgMTE6MzE6MzVBTSArMDEwMCwgQ2hy
aXN0aWFuIEvDtm5pZyB3cm90ZToKPiA+IEJ1dCBob3cgc2hvdWxkIHdlIHRoZW4gZGVhbCB3aXRo
IGFsbCB0aGUgZXhpc3RpbmcgaW50ZXJmYWNlcyB3aGljaCBhbHJlYWR5Cj4gPiB0YWtlIGEgc2Nh
dHRlcmxpc3Qvc2dfdGFibGUgPwo+ID4KPiA+IFRoZSB3aG9sZSBETUEtYnVmIGRlc2lnbiBhbmQg
YSBsb3Qgb2YgZHJpdmVycyBhcmUgYnVpbGQgYXJvdW5kCj4gPiBzY2F0dGVybGlzdC9zZ190YWJs
ZSBhbmQgdG8gbWUgdGhhdCBhY3R1YWxseSBtYWtlcyBxdWl0ZSBhIGxvdCBvZiBzZW5zZS4KPiA+
IAo+IAo+IFJlcGxhY2UgdGhlbSB3aXRoIGEgc2FuZXIgaW50ZXJmYWNlIHRoYXQgZG9lc24ndCB0
YWtlIGEgc2NhdHRlcmxpc3QuCj4gQXQgdmVyeSBsZWFzdCBmb3IgbmV3IGZ1bmN0aW9uYWxpdHkg
bGlrZSBwZWVyIHRvIHBlZXIgRE1BLCBidXQKPiBlc3BlY2lhbGx5IHRoaXMgY29kZSB3b3VsZCBh
bHNvIGJlbmVmaXQgZnJvbSBhIGdlbmVyYWwgbW92ZSBhd2F5Cj4gZnJvbSB0aGUgc2NhdHRlcmxp
c3QuCgpJZiBkbWEgYnVmIGNhbiBkbyBQMlAgSSdkIGxpa2UgdG8gc2VlIHN1cHBvcnQgZm9yIGNv
bnN1bWluZyBhIGRtYWJ1ZgppbiBSRE1BLiBMb29raW5nIGF0IGhvdy4uIHRoZXJlIGlzIGFuIGV4
aXN0aW5nIHNnbCBiYXNlZCBwYXRoIHN0YXJ0aW5nCmZyb20gZ2V0X3VzZXJfcGFnZXMgdGhyb3Vn
aCBkbWEgbWFwIHRvIHRoZSBkcml2ZXJzLiAoaWJfdW1lbSkKCkkgY2FuIHJlcGxhY2UgdGhlIGRy
aXZlciBwYXJ0IHdpdGggc29tZXRoaW5nIGVsc2UgKGRtYV9zZyksIGJ1dCBub3QKdW50aWwgd2Ug
Z2V0IGEgd2F5IHRvIERNQSBtYXAgcGFnZXMgZGlyZWN0bHkgaW50byB0aGF0IHNvbWV0aGluZwpl
bHNlLi4KClRoZSBub24tcGFnZSBzY2F0dGVybGlzdCBpcyBhbHNvIGEgYmlnIGNvbmNlcm4gZm9y
IFJETUEgYXMgd2UgaGF2ZQpkcml2ZXJzIHRoYXQgd2FudCB0aGUgcGFnZSBsaXN0LCBzbyBldmVu
IGlmIHdlIGRpZCBhcyB0aGlzIHNlcmllcwpjb250ZW1wbGF0ZXMgSSdkIGhhdmUgc3RpbGwgaGF2
ZSB0byBzcGxpdCB0aGUgZHJpdmVycyBhbmQgY3JlYXRlIHRoZQpub3Rpb24gb2YgYSBkbWEtb25s
eSBTR0wuCgo+ID4gSSBtZWFuIHdlIGNvdWxkIGNvbWUgdXAgd2l0aCBhIG5ldyBzdHJ1Y3R1cmUg
Zm9yIHRoaXMsIGJ1dCB0byBtZSB0aGF0IGp1c3QKPiA+IGxvb2tzIGxpa2UgcmVpbnZlbnRpbmcg
dGhlIHdoZWVsLiBFc3BlY2lhbGx5IHNpbmNlIGRyaXZlcnMgbmVlZCB0byBiZSBhYmxlCj4gPiB0
byBoYW5kbGUgYm90aCBJL08gdG8gc3lzdGVtIG1lbW9yeSBhbmQgSS9PIHRvIFBDSWUgQkFScy4K
PiAKPiBUaGUgc3RydWN0dXJlIGZvciBob2xkaW5nIHRoZSBzdHJ1Y3QgcGFnZSBzaWRlIG9mIHRo
ZSBzY2F0dGVybGlzdCBpcwo+IGNhbGxlZCBzdHJ1Y3QgYmlvX3ZlYywgc28gZmFyIG1vc3RseSB1
c2VkIGJ5IHRoZSBibG9jayBhbmQgbmV0d29ya2luZwo+IGNvZGUuCgpJIGhhdmVuJ3QgdXNlZCBi
aW9fdmVjcyBiZWZvcmUsIGRvIHRoZXkgc3VwcG9ydCBjaGFpbmluZyBsaWtlIFNHTCBzbwp0aGV5
IGNhbiBiZSB2ZXJ5IGJpZz8gUkRNQSBkbWEgbWFwcyBnaWdhYnl0ZXMgb2YgbWVtb3J5Cgo+IFRo
ZSBzdHJ1Y3R1cmUgZm9yIGhvbGRpbmcgZG1hIGFkZHJlc3NlcyBkb2Vzbid0IHJlYWxseSBleGlz
dAo+IGluIGEgZ2VuZXJpYyBmb3JtLCBidXQgd291bGQgYmUgYW4gYXJyYXkgb2YgdGhlc2Ugc3Ry
dWN0dXJlczoKPiAKPiBzdHJ1Y3QgZG1hX3NnIHsKPiAJZG1hX2FkZHJfdAlhZGRyOwo+IAl1MzIJ
CWxlbjsKPiB9OwoKU2FtZSBxdWVzdGlvbiwgUkRNQSBuZWVkcyB0byByZXByZXNlbnQgZ2lnYWJ5
dGVzIG9mIHBhZ2VzIGluIGEgRE1BCmxpc3QsIHdlIHdpbGwgbmVlZCBzb21lIGdlbmVyaWMgd2F5
IHRvIGhhbmRsZSB0aGF0LiBJIHN1c3BlY3QgR1BVIGhhcwphIHNpbWlsYXIgbmVlZD8gQ2FuIGl0
IGJlIGFjY29taWRhdGVkIGluIHNvbWUgZ2VuZXJpYyBkbWFfc2c/CgpTbyBJJ20gZ3Vlc3Npbmcg
dGhlIHBhdGggZm9yd2FyZCBpcyBzb21ldGhpbmcgbGlrZQoKIC0gQWRkIHNvbWUgZ2VuZXJpYyBk
bWFfc2cgZGF0YSBzdHJ1Y3R1cmUgYW5kIGhlbHBlcgogLSBBZGQgZG1hIG1hcHBpbmcgY29kZSB0
byBnbyBmcm9tIHBhZ2VzIHRvIGRtYV9zZwogLSBSZXdvcmsgUkRNQSB0byB1c2UgZG1hX3NnIGFu
ZCB0aGUgbmV3IGRtYSBtYXBwaW5nIGNvZGUKIC0gUmV3b3JrIGRtYWJ1ZiB0byBzdXBwb3J0IGRt
YSBtYXBwaW5nIHRvIGEgZG1hX3NnCiAtIFJld29yayBHUFUgZHJpdmVycyB0byB1c2UgZG1hX3Nn
CiAtIFRlYWNoIHAycGRtYSB0byBnZW5lcmF0ZSBhIGRtYV9zZyBmcm9tIGEgQkFSIHBhZ2UgbGlz
dAogLSBUaGlzIHNlcmllcwoKPwoKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
