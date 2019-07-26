Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6092378603
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 09:16:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF1589A8C;
	Mon, 29 Jul 2019 07:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EACB6EDAE
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 15:45:35 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id d17so52924342qtj.8
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 08:45:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0XvBgQp2/E+/Ic94KFJvx3PoeHBC2K6bMN+dYGtrzrU=;
 b=DeOWqMy4GrrbZDWO1+xQsEqIpC/Wc+mY/Mr2gIi/ze4WgfjO3noKu/zNqcLodcfbP9
 Cg8d5769zkYIhjA37QsKsn1YHvfkOYsUtwrJM8Ul5VT80rDoFcMz5uelKj8FQUZv8iRC
 KfvFRyJ0eqEd1usQSFJ/gYNog8PijYecIAE4mQzsDXDCOeN+qAVFQWThKOyhrQ+v5iff
 TGlKXL0BuTZVllFGe21mRcb/a/Bq3EGHk+jvMvIJhOVrgBtjB9QcJHCRAa4W/OLCjmiq
 uMEK4hv+czruLmlHRfDM+mjmPpfiotFf3iWsSjOVKDnJMZ9JiX5hwm5S0yhP5Tl99aVz
 xl1w==
X-Gm-Message-State: APjAAAWlfun8YoOodHXc2qdgopVxsprj/5/frU9Db0V3z++KysSmZJWc
 k/P0E+0PFq7pf3oEIZYmU//InA==
X-Google-Smtp-Source: APXvYqz8sQPW4m3GzwcT9XhmjAeoy2UAD2U4rkt48bJMq/KWyyCMGm6hjyKnT+STDp46Ymz4NgJRKg==
X-Received: by 2002:aed:33e6:: with SMTP id v93mr67774336qtd.157.1564155934207; 
 Fri, 26 Jul 2019 08:45:34 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id a23sm22076094qtp.22.2019.07.26.08.45.32
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 26 Jul 2019 08:45:33 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hr2PU-0007qj-F6; Fri, 26 Jul 2019 12:45:32 -0300
Date: Fri, 26 Jul 2019 12:45:32 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH v2 0/7] mm/hmm: more HMM clean up
Message-ID: <20190726154532.GA29678@ziepe.ca>
References: <20190726005650.2566-1-rcampbell@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726005650.2566-1-rcampbell@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Mon, 29 Jul 2019 07:16:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0XvBgQp2/E+/Ic94KFJvx3PoeHBC2K6bMN+dYGtrzrU=;
 b=o+Sw+Ft9tBTCMfQnjjV7hQQHUdyNoWUSjIb4imOvsb2LbKFd1Q5NbuyDRu/AsB0VyP
 URzry2DDvBoWY/MzinDkwxqdipoU7eQxWimCd8F9Wq4pH2nxNhL0VEiztP0eXgfDnVhe
 qmeSCQ2RfaMf6HFkHqhsbZs1xw/iQNrwM9UEb0q7YJO4WRAfVYJT1pLZHckgpLWDFEW5
 ezBU84Ow58+f91moEdhmpcwYTGEj4uyoRch1AjlQz/y6ZgqBFNCIZvJUNmWtnVdWYvE1
 CtR3H87yaXERTd9RsoCTTWIViWcACY1Iwet3M5jz6s3WZSDa8csEbMTwgddUyXEsLr51
 dtdw==
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
Cc: linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgMDU6NTY6NDNQTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cj4gSGVyZSBhcmUgc2V2ZW4gbW9yZSBwYXRjaGVzIGZvciB0aGluZ3MgSSBmb3VuZCB0
byBjbGVhbiB1cC4KPiBUaGlzIHdhcyBiYXNlZCBvbiB0b3Agb2YgQ2hyaXN0b3BoJ3Mgc2V2ZW4g
cGF0Y2hlczoKPiAiaG1tX3JhbmdlX2ZhdWx0IHJlbGF0ZWQgZml4ZXMgYW5kIGxlZ2FjeSBBUEkg
cmVtb3ZhbCB2MyIuCj4gSSBhc3N1bWUgdGhpcyB3aWxsIGdvIGludG8gSmFzb24ncyB0cmVlIHNp
bmNlIHRoZXJlIHdpbGwgbGlrZWx5IGJlCj4gbW9yZSBITU0gY2hhbmdlcyBpbiB0aGlzIGN5Y2xl
Lgo+Cj4gQ2hhbmdlcyBmcm9tIHYxIHRvIHYyOgo+IAo+IEFkZGVkIEFNRCBHUFUgdG8gaG1tX3Vw
ZGF0ZSByZW1vdmFsLgo+IEFkZGVkIDIgcGF0Y2hlcyBmcm9tIENocmlzdG9waC4KPiBBZGRlZCAy
IHBhdGNoZXMgYXMgYSByZXN1bHQgb2YgSmFzb24ncyBzdWdnZXN0aW9ucy4KPiAKPiBDaHJpc3Rv
cGggSGVsbHdpZyAoMik6Cj4gICBtbS9obW06IHJlcGxhY2UgdGhlIGJsb2NrIGFyZ3VtZW50IHRv
IGhtbV9yYW5nZV9mYXVsdCB3aXRoIGEgZmxhZ3MKPiAgICAgdmFsdWUKPiAgIG1tOiBtZXJnZSBo
bW1fcmFuZ2Vfc25hcHNob3QgaW50byBobW1fcmFuZ2VfZmF1bHQKPiAKPiBSYWxwaCBDYW1wYmVs
bCAoNSk6Cj4gICBtbS9obW06IHJlcGxhY2UgaG1tX3VwZGF0ZSB3aXRoIG1tdV9ub3RpZmllcl9y
YW5nZQo+ICAgbW0vaG1tOiBhIGZldyBtb3JlIEMgc3R5bGUgYW5kIGNvbW1lbnQgY2xlYW4gdXBz
Cj4gICBtbS9obW06IHJlbW92ZSBodWdldGxiZnMgY2hlY2sgaW4gaG1tX3ZtYV93YWxrX3BtZAo+
ICAgbW0vaG1tOiByZW1vdmUgaG1tX3JhbmdlIHZtYQoKRm9yIGFsbCBvZiB0aGVzZToKClJldmll
d2VkLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+CgpJJ3ZlIGFwcGxpZWQg
dGhpcyB0byBobW0uZ2l0LCBleGNsdWRpbmc6Cgo+ICAgbW0vaG1tOiBtYWtlIGZ1bGwgdXNlIG9m
IHdhbGtfcGFnZV9yYW5nZSgpCgpQZW5kaW5nIGZ1cnRoZXIgZGlzY3Vzc2lvbi4KCkJhc2VkIG9u
IGxhc3QgY3ljbGUgSSd2ZSBkZWNpZGVkIHRvIG1vdmUgZ29vZCBwYXRjaGVzIGludG8gbGludXgt
bmV4dAplYXJsaWVyIGFuZCByZWx5IG9uIHNvbWUgcmViYXNlIGlmIG5lZWRlZC4gVGhpcyBpcyB0
byBoZWxwIEFuZHJldydzCndvcmtmbG93LgoKU28sIGlmIHRoZXJlIGFyZSBtb3JlIHRhZ3MvZXRj
IHBsZWFzZSBjb250aW51ZSB0byBzZW5kIHRoZW0sIEkgd2lsbApzb3J0IGl0Li4KClRoYW5rcywK
SmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
