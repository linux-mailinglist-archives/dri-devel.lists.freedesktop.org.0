Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 902DA91192
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:27:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B75D16EB52;
	Sat, 17 Aug 2019 15:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E066E96C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 17:28:48 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id w18so4641773qki.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 10:28:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=F45QDEu01tuosMxeBXshNdQV0qdzUW+A54VgIcKeIPQ=;
 b=BSJDrkX/nZvOccBGemj0hFb8h5oZuYhkowSXDkuhpfZuIOO4iy/QXXqFiiXpnMMcEQ
 k6jQhnwYqR6KJZrGqBpOXFmEaHwpLpqBpMZSHH4tcc2Gyyc7H8qhg8PN6gDiGsyoTVYv
 hdky1zGw2ZS5IhLu2zI3JGSG7K1fNdvGP5FGWWyr0SGzKtbHjI35QYzO7dyJIMiltuFI
 hdGLovGCEKkvI/nfMbrsyqiQTxc/li2PkkVBYnsfoO+iAzBEz9u+O10xTtLB6y8eGsxe
 vMv2d/XojR2nM+/AdEPUDQ6WNKY2xkNQS/qVkppDD08W7ImWrYA7Vsj6VeYMxPtdYW+d
 lMyA==
X-Gm-Message-State: APjAAAVZiyUSblL9NHU1XTPvCtD5SsywnEKOaBtjV5TqV+opdJEJjf9/
 Xp/oWBCgmQeBJ5lLtDq+tjlg3VQrSSs=
X-Google-Smtp-Source: APXvYqz4MWjmBxvJTbbDEud8Nxfi8cYWfH0bH7syzSPmrbjXevX053Df4aHxdDIIl0mAsdz2AlYJ2Q==
X-Received: by 2002:a05:620a:143b:: with SMTP id
 k27mr9740698qkj.426.1565976527486; 
 Fri, 16 Aug 2019 10:28:47 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id t26sm3867534qtc.95.2019.08.16.10.28.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 16 Aug 2019 10:28:47 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hyg1u-0000vn-Jo; Fri, 16 Aug 2019 14:28:46 -0300
Date: Fri, 16 Aug 2019 14:28:46 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH 04/15] mm: remove the pgmap field from struct hmm_vma_walk
Message-ID: <20190816172846.GJ5398@ziepe.ca>
References: <CAPcyv4g4hzcEA=TPYVTiqpbtOoS30ahogRUttCvQAvXQbQjfnw@mail.gmail.com>
 <20190815194339.GC9253@redhat.com>
 <CAPcyv4jid8_=-8hBpn_Qm=c4S8BapL9B9RGT7e9uu303yH=Yqw@mail.gmail.com>
 <20190815203306.GB25517@redhat.com>
 <20190815204128.GI22970@mellanox.com>
 <CAPcyv4j_Mxbw+T+yXTMdkrMoS_uxg+TXXgTM_EPBJ8XfXKxytA@mail.gmail.com>
 <20190816004053.GB9929@mellanox.com>
 <CAPcyv4gMPVmY59aQAT64jQf9qXrACKOuV=DfVs4sNySCXJhkdA@mail.gmail.com>
 <20190816122414.GC5412@mellanox.com>
 <CAPcyv4jgHF05gdRoOFZORqeOBE9Z7PhagsSD+LVnjH2dc3mrFg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPcyv4jgHF05gdRoOFZORqeOBE9Z7PhagsSD+LVnjH2dc3mrFg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=F45QDEu01tuosMxeBXshNdQV0qdzUW+A54VgIcKeIPQ=;
 b=Ixj/SoRJ+JjSkgtbnuAlNvEeswSUCwNKuaFLHbk074FCSMAJ0pzN8tT5ReRltjL3Gf
 RXaC7Ipl87f6oMqTWoY3dK/rv/Ebn3jzmPoC+B9dSW991uhIw2U1xamLQQ3fvpz00edL
 a1Qocl++KZdMEzFneehLs3O2p4g22HJREvBTuudS9ss8+VoG+YpK0ZFVhPwXCQgOxb6j
 l6IQtFd6edwrjdoeNrOu2K5jjVrdqOXCbrbFGIwZVckM7s7BYM9XDbDzPSyLrnPtV7PI
 DEyvAFgALyQTa6Ip+Z3b1PmCilg+vCouLsoy7GiMDwRlevDCUcK2g+VvO1oDcMgFgFEI
 aK0A==
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
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMTA6MjE6NDFBTSAtMDcwMCwgRGFuIFdpbGxpYW1zIHdy
b3RlOgoKPiA+IFdlIGNhbiBkbyBhIGdldF9kZXZfcGFnZW1hcCBpbnNpZGUgdGhlIHBhZ2Vfd2Fs
ayBhbmQgdG91Y2ggdGhlIHBnbWFwLAo+ID4gb3Igd2UgY2FuIGRvIHRoZSAnZGV2aWNlIG11dGV4
ICYmIHJldHJ5JyBwYXR0ZXJuIGFuZCB0b3VjaCB0aGUgcGdtYXAKPiA+IGluIHRoZSBkcml2ZXIs
IHVuZGVyIHRoYXQgbG9jay4KPiA+Cj4gPiBIb3dldmVyIGluIGFsbCBjYXNlcyB0aGUgY3VycmVu
dCBnZXRfZGV2X3BhZ2VtYXAoKSdzIGluIHRoZSBwYWdlIHdhbGsKPiA+IGFyZSBub3QgbmVjZXNz
YXJ5LCBhbmQgd2UgY2FuIGRlbGV0ZSB0aGVtLgo+IAo+IFllcywgYXMgbG9uZyBhcyAnc3RydWN0
IHBhZ2UnIGluc3RhbmNlcyByZXN1bHRpbmcgZnJvbSB0aGF0IGxvb2t1cCBhcmUKPiBub3QgcGFz
c2VkIG91dHNpZGUgb2YgdGhhdCBsb2NrLgoKSW5kZWVkLgoKQWxzbywgSSB3YXMgcmVmbGVjdGlu
ZyBvdmVyIGx1bmNoIHRoYXQgdGhlIGhtbV9yYW5nZV9mYXVsdCBzaG91bGQgb25seQpyZXR1cm4g
REVWSUNFX1BSSVZBVEUgcGFnZXMgZm9yIHRoZSBjYWxsZXIncyBkZXZpY2UgKHNlZSBvdGhlciB0
aHJlYWQKd2l0aCBIQ0gpLCBhbmQgaW4gdGhpcyBjYXNlLCB0aGUgY2FsbGVyIHNob3VsZCBhbHNv
IGJlIHJlc3BvbnNpYmxlIHRvCmVuc3VyZSB0aGF0IHRoZSBkcml2ZXIgaXMgbm90IGNhbGxpbmcg
aG1tX3JhbmdlX2ZhdWx0IGF0IHRoZSBzYW1lIHRpbWUKaXQgaXMgZGVsZXRpbmcgaXQncyBvd24g
REVWSUNFX1BSSVZBVEUgbWFwcGluZyAtIGllIGJ5IGZlbmNpbmcgaXRzCnBhZ2UgZmF1bHQgaGFu
ZGxlci4KClRoaXMgZG9lcyBub3QgYXBwbHkgdG8gUENJX1AyUERNQSwgYnV0LCBsZXRzIHNlZSBo
b3cgdGhhdCBsb29rcyB3aGVuCndlIGdldCB0aGVyZS4KClNvIHRoZSB3aG9sZSB0aGluZyBzZWVt
cyBwcmV0dHkgc2FmZS4KCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
