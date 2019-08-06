Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66178845FD
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:29:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B116E68E;
	Wed,  7 Aug 2019 07:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 780DD88FDA
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 17:44:39 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id r6so63605142qkc.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2019 10:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2I3grgZ/J9vjahvSqFuu/xLlITG6j2k/vYLpAp6Amls=;
 b=Er4VHSW5c7ZAvX7ub+09tCPog0yW7vTzsn6nTP5j4F/CBiFuQccOkzQ/O4hAkDnCnz
 slrZBDOa8jtdS/6CdBKtKyArLBs0jJ4dFLljjPFK3Pb2t7G8vnC441ZRBTejl11aokS0
 euMgYh/0OeHM/ALzJUxI3PFqHVGPrf2I1jOO/Vt+NcMgU3g7m/K5yLi9iSPuT0LS3gsV
 fVTP+CxFCJPqhgXvLRoqQO/a3vFkIgDUljcMQBXDQs82WKhw4+OUOD/hOzu4Ixy6gyO8
 jcoG+olt/SnckLzWqXcIWMoo44cUJpl9A7VhnBoZVlIC1Ec9OFMe/13WgkVarGwA1Rip
 UXnw==
X-Gm-Message-State: APjAAAVNDq5Sbe2Jd63yZdU1j3zA7K0CdH4hbOej4z7ZCki86eI+6mg0
 5fkiA9YGu6m4Ayr4MZuGvFeEzg==
X-Google-Smtp-Source: APXvYqymlpp4BycD0qGnpnv+d7FFVmLpdZkWfIi+lh2JiL6V9IwlA24sYISFadK7zx21lftJy/jhgQ==
X-Received: by 2002:a37:4a8a:: with SMTP id x132mr4450025qka.42.1565113478452; 
 Tue, 06 Aug 2019 10:44:38 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id 2sm45957746qtz.73.2019.08.06.10.44.37
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 06 Aug 2019 10:44:37 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hv3Vl-0008VN-Do; Tue, 06 Aug 2019 14:44:37 -0300
Date: Tue, 6 Aug 2019 14:44:37 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 15/15] amdgpu: remove CONFIG_DRM_AMDGPU_USERPTR
Message-ID: <20190806174437.GK11627@ziepe.ca>
References: <20190806160554.14046-1-hch@lst.de>
 <20190806160554.14046-16-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190806160554.14046-16-hch@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 07 Aug 2019 07:26:18 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=2I3grgZ/J9vjahvSqFuu/xLlITG6j2k/vYLpAp6Amls=;
 b=a+FlUpPMj54ngc2/wzpnUtdmboVj9jOXSHKH/KtrlsaDDTF+4/b1FPDz2QFwEeg1rz
 toYHqJ4grC/Zrmy66au/tF6Xp/GKKcRCxOW4nEVINsOTZE+UABenhA41pYRrtsHlIMvp
 Nn3XoKBGu7pNa90wuuXeU6vI4KIN35sIQDY2+B49rW0uXGXipKd2iMbP0zvgC1X9Q5AA
 ElTW3gUtiOMCLtIVvCF4ky6LpJZ0pbBAQDWXAaM8GADHJRXL3Q/ScIQSuBrcNYhW/MZ4
 lFfb7gJrmnotB3O3ZucXNGj9Aoegb9k7du/Rw1dzmNZgaivujgybGTKauFX4u4s2pKkF
 9f0w==
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

T24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMDc6MDU6NTNQTSArMDMwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gVGhlIG9wdGlvbiBpcyBqdXN0IHVzZWQgdG8gc2VsZWN0IEhNTSBtaXJyb3Ig
c3VwcG9ydCBhbmQgaGFzIGEgdmVyeQo+IGNvbmZ1c2luZyBoZWxwIHRleHQuICBKdXN0IHB1bGwg
aW4gdGhlIEhNTSBtaXJyb3IgY29kZSBieSBkZWZhdWx0Cj4gaW5zdGVhZC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiAtLS0KPiAgZHJpdmVycy9n
cHUvZHJtL0tjb25maWcgICAgICAgICAgICAgICAgIHwgIDIgKysKPiAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvS2NvbmZpZyAgICAgIHwgMTAgLS0tLS0tLS0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgfCAgNiAtLS0tLS0KPiAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5oIHwgMTIgLS0tLS0tLS0tLS0tCj4gIDQgZmlsZXMgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyOCBkZWxldGlvbnMoLSkKCkZlbGl4LCB3YXMgdGhpcyBh
biBlZmZvcnQgdG8gYXZvaWQgdGhlIGFyY2ggcmVzdHJpY3Rpb24gb24gaG1tIG9yCnNvbWV0aGlu
Zz8gQWxzbyBjYW4ndCBzZWUgd2h5IHRoaXMgd2FzIGxpa2UgdGhpcy4KClJldmlld2VkLWJ5OiBK
YXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+CgpKYXNvbgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
