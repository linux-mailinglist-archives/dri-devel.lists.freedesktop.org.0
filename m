Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68782845BF
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:27:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 174836E628;
	Wed,  7 Aug 2019 07:26:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BECB08901E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 17:44:52 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id d23so85452734qto.2
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2019 10:44:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bZtzSRQjhSrRQjuTGnm0cayQZPAGjzejTXG905wfdw0=;
 b=k1ujGyu0EY0NYhDaE0hST0f/AVJNG9Fj6sSXzhrypt/D4d+BQFh1T/dyLuvts3PLQ6
 EAbwCUfWDDU1LzNWBAK4wLUb2c4XYmJB+fYfxMspu1atwxRLaMoMfNGofs8yrD/8/GjA
 bre5aL4RfqN82/YWqwM7rDVvcdQZi/F63Hxro1+PKIZ0Y4mZcotjrXH/Cix9ByBTSOvQ
 lJTYXAYZLwIXViRSpMmEnMAPfs6Fl9pryyRPGkKsHfVVgSaf2DL9gO3c52Cu7Ds/VDFt
 7o2xhi3FQK4NURuVkSfeVOlj69/yBQv4CPjObRbw+9T2O84k9ElbaRiAVm0b22KklSeV
 z60Q==
X-Gm-Message-State: APjAAAUp0ved/EWscAK7LR5BIUFvZMxs5+aYvDWEG4HK7IOq4GHzilOV
 Da6CFhYQUSSxSi38kPU9lumbyg==
X-Google-Smtp-Source: APXvYqyZhLDncBVUJEIu2HEUQvEmb0gPiZCNGeOuB4xFtTfpcIsHYizrdBS0HYUKqNFQSDBwyqBK0g==
X-Received: by 2002:ac8:43d8:: with SMTP id w24mr4245586qtn.25.1565113492016; 
 Tue, 06 Aug 2019 10:44:52 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id i22sm46601023qti.30.2019.08.06.10.44.51
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 06 Aug 2019 10:44:51 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hv3Vz-0008Vn-5w; Tue, 06 Aug 2019 14:44:51 -0300
Date: Tue, 6 Aug 2019 14:44:51 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 14/15] mm: make HMM_MIRROR an implicit option
Message-ID: <20190806174451.GL11627@ziepe.ca>
References: <20190806160554.14046-1-hch@lst.de>
 <20190806160554.14046-15-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190806160554.14046-15-hch@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 07 Aug 2019 07:26:18 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bZtzSRQjhSrRQjuTGnm0cayQZPAGjzejTXG905wfdw0=;
 b=kGCc9AZ3EnQ1hENpi10zxnp8FPxEY+gZ4u/zkReV8Gk0g4EsnIsOyP2vX5idcMBB+N
 VqjEaaMot6kbdFxVmOlEm3tUIYXwEQT/y/7s11UZ+8vUXizamKWn9OUzoZVObkKRPWF5
 PC2DJb3kBYP003JMyG9RuoIAMt1yp2NAIcUhv0kLoc/5yOiIHRVEpLR3JQfH/W8OKUNe
 XjpQ60F11rN9ibmfNaecBWtkVeRv7sFxnhwEglCFAfG9t9UMxDtUa5fCeFlLC9UqkNOe
 29/8m0lfjCMFnxcTMwNskT+B5FKI1Hwf/xwSEWFHQlKgvBiwTtYdYbvXxZ38LEH2twL7
 VMaQ==
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMDc6MDU6NTJQTSArMDMwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gTWFrZSBITU1fTUlSUk9SIGFuIG9wdGlvbiB0aGF0IGlzIHNlbGVjdGVkIGJ5
IGRyaXZlcnMgd2FudGluZyB0byB1c2UgaXQKPiBpbnN0ZWFkIG9mIGEgdXNlciB2aXNpYmxlIG9w
dGlvbiBhcyBpdCBpcyBqdXN0IGEgbG93LWxldmVsCj4gaW1wbGVtZW50YXRpb24gZGV0YWlsLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IC0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9LY29uZmlnIHwgIDQgKysrLQo+ICBkcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9LY29uZmlnICAgIHwgIDQgKysrLQo+ICBtbS9LY29uZmlnICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgMTQgKysrKysrLS0tLS0tLS0KPiAgMyBmaWxlcyBjaGFuZ2Vk
LCAxMiBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKClJldmlld2VkLWJ5OiBKYXNvbiBH
dW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+CgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
