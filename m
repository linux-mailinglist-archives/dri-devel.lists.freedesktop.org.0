Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D192CD5C
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 19:14:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0CD96E27C;
	Tue, 28 May 2019 17:14:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EBD2897E0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 19:12:50 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id c24so11205016vsp.7
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 12:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DDviHOtsxusWnOlAhiLZnd4GLm6Sq0zvvnS+jtdVWoE=;
 b=meS3+3Yo++b8/8m9UWpu9SLUYFrcQjh5c+5Dm4r4nI3bYRpWrOC9vVsaNml9C2Uqq9
 Gl7em74PpP5sSF7aATzkAssRPF86WIakgNTOtN5THJFsUSnMxsV/LCib2KXaOk1OBwAV
 eEo5cybZRKKLNcslvm847KwAgwvno1lOXUoU3zuCgiJG8uExZspE+b7sB/0+2XvIWOhP
 SqlwhD289PyP2ONze/zn/YjyB2Cxhp1GLn97LBIK/DzoOvUbkdrcOPzmAJF3k/3BdiYz
 iQXjDuh6UmiYam5BhR3piVLqiK9q9W9YsNXTfR/rhRFP+hK1lyHL2g1LzTU0dmdFF+El
 J3Kw==
X-Gm-Message-State: APjAAAXM135OTnOb5DpTnzuEjwZOmtzQ9FaRzVQt3dmUXG9sfAA5ID4V
 WQseSFaaNex06QNM9hTRvAFbrg==
X-Google-Smtp-Source: APXvYqz3S6V5VX0DS9Gw1Glb0NcMYV9JcZsL2/HpeHZOKpnuHyIw3v1JrcSgwxDKXpph1YUf5NB65w==
X-Received: by 2002:a05:6102:2008:: with SMTP id
 p8mr31279114vsr.73.1558984369444; 
 Mon, 27 May 2019 12:12:49 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id s78sm5202319vke.1.2019.05.27.12.12.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 27 May 2019 12:12:48 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hVL39-0003MZ-Q1; Mon, 27 May 2019 16:12:47 -0300
Date: Mon, 27 May 2019 16:12:47 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: RFC: Run a dedicated hmm.git for 5.3
Message-ID: <20190527191247.GA12540@ziepe.ca>
References: <20190523154149.GB12159@ziepe.ca>
 <20190523155207.GC5104@redhat.com>
 <20190523163429.GC12159@ziepe.ca>
 <20190523173302.GD5104@redhat.com>
 <20190523175546.GE12159@ziepe.ca>
 <20190523182458.GA3571@redhat.com>
 <20190523191038.GG12159@ziepe.ca>
 <20190524064051.GA28855@infradead.org>
 <20190524124455.GB16845@ziepe.ca>
 <20190525155210.8a9a66385ac8169d0e144225@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190525155210.8a9a66385ac8169d0e144225@linux-foundation.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Tue, 28 May 2019 17:13:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DDviHOtsxusWnOlAhiLZnd4GLm6Sq0zvvnS+jtdVWoE=;
 b=H+MT+D+qhOc67FUjiLtXFXQ+JoPD5S1DdC7CSc4dUolQU3JyIJasuwCyeRcrJ0PgNf
 bn8Chih4N853uCVFO25N5GX7p9RL+5D0yBI23Dj3DCO1rNJy1hSLJM5Pymyb1Y7u9fCj
 wuh78HiXJf7rrFoSgLBgwngyDm7eaovdd20ZaYVrQX6zm9XfqAjJG2AUO8Dl4fs08Cdk
 yAbgDtOcJYKveAP1EhrvJE/N8b1nhAIAs1qTQ625JOgpAYRB5cQ4wmxqfMtu71CJWoVY
 /2vs/OIWvzjVWfYHCgN2L1FahPam1FZBvcupwUncDJTjYqt1OfNHBp3EgxmEX94n9d7K
 RZHw==
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
Cc: Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Doug Ledford <dledford@redhat.com>, linux-mm@kvack.org,
 linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Kaike Wan <kaike.wan@intel.com>, Christoph Hellwig <hch@infradead.org>,
 Leon Romanovsky <leonro@mellanox.com>, Jerome Glisse <jglisse@redhat.com>,
 Moni Shoua <monis@mellanox.com>, Artemy Kovalyov <artemyko@mellanox.com>,
 Dave Airlie <airlied@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBNYXkgMjUsIDIwMTkgYXQgMDM6NTI6MTBQTSAtMDcwMCwgQW5kcmV3IE1vcnRvbiB3
cm90ZToKPiBPbiBGcmksIDI0IE1heSAyMDE5IDA5OjQ0OjU1IC0wMzAwIEphc29uIEd1bnRob3Jw
ZSA8amdnQHppZXBlLmNhPiB3cm90ZToKPiAKPiA+IE5vdyB0aGF0IC1tbSBtZXJnZWQgdGhlIGJh
c2ljIGhtbSBBUEkgc2tlbGV0b24gSSB0aGluayBydW5uaW5nIGxpa2UKPiA+IHRoaXMgd291bGQg
Z2V0IHVzIHF1aWNrbHkgdG8gdGhlIHBsYWNlIHdlIGFsbCB3YW50OiBjb21wcmVoZW5zaXZlIGlu
IHRyZWUKPiA+IHVzZXJzIG9mIGhtbS4KPiA+IAo+ID4gQW5kcmV3LCB3b3VsZCB0aGlzIGJlIGFj
Y2VwdGFibGUgdG8geW91Pwo+IAo+IFN1cmUuICBQbGVhc2UgdGFrZSBjYXJlIG5vdCB0byBwZXJt
aXQgdGhpcyB0byByZWR1Y2UgdGhlIGFtb3VudCBvZgo+IGV4cG9zdXJlIGFuZCByZXZpZXcgd2hp
Y2ggdGhlIGNvcmUgSE1NIHBpZWNlcyBnZXQuCgpDZXJ0YWlubHksIHRoYW5rcyBhbGwKCkplcm9t
ZTogSSBzdGFydGVkIGEgSE1NIGJyYW5jaCBvbiB2NS4yLXJjMiBpbiB0aGUgcmRtYS5naXQgaGVy
ZToKCmdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9yZG1hL3Jk
bWEuZ2l0Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Jk
bWEvcmRtYS5naXQvbG9nLz9oPWhtbQoKUGxlYXNlIHNlbmQgYSBzZXJpZXMgd2l0aCB0aGUgaW5p
dGlhbCBjcm9zcyB0cmVlIHN0dWZmOgogLSBrY29uZmlnIGZpeGluZyBwYXRjaGVzCiAtIFRoZSBm
dWxsIHJlbW92YWwgb2YgYWxsIHRoZSAndGVtcG9yYXJ5IGZvciBtZXJnaW5nJyBBUElzCiAtIEZp
eGluZyB0aGUgQVBJIG9mIGhtbV9yYW5nZV9yZWdpc3RlciB0byBhY2NlcHQgYSBtaXJyb3IKCldo
ZW4gdGhlc2UgYXJlIHJlYWR5IEknbGwgc2VuZCBhIGhtbSBQUiB0byBEUk0gc28gZXZlcnlvbmUg
aXMgb24gdGhlCnNhbWUgQVBJIHBhZ2UuCgpJJ2xsIGFsc28gbW92ZSB0aGUgaHVnZXRsYiBwYXRj
aCB0aGF0IEFuZHJldyBwaWNrZWQgdXAgaW50byB0aGlzIGdpdApzbyB3ZSBkb24ndCBoYXZlIGEg
bWVyZ2UgY29uZmxpY3QgcmlzawoKSW4gcGFyYWxsZWwgbGV0IHVzIGFsc28gZmluaXNoIHJldmlz
aW5nIHRoZSBtaXJyb3IgQVBJIGFuZCBnb2luZwp0aHJvdWdoIHRoZSBPRFAgc3R1ZmYuCgpSZWdh
cmRzLApKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
