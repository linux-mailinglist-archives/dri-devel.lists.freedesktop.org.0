Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6300F7F012
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 11:12:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A83266ED70;
	Fri,  2 Aug 2019 09:12:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A26A6ED6C;
 Fri,  2 Aug 2019 09:12:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4990DAFE2;
 Fri,  2 Aug 2019 09:12:47 +0000 (UTC)
Date: Fri, 2 Aug 2019 11:12:44 +0200
From: Michal Hocko <mhocko@kernel.org>
To: john.hubbard@gmail.com
Subject: Re: [PATCH 00/34] put_user_pages(): miscellaneous call sites
Message-ID: <20190802091244.GD6461@dhcp22.suse.cz>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190802022005.5117-1-jhubbard@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-fbdev@vger.kernel.org, Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1IDAxLTA4LTE5IDE5OjE5OjMxLCBqb2huLmh1YmJhcmRAZ21haWwuY29tIHdyb3RlOgpb
Li4uXQo+IDIpIENvbnZlcnQgYWxsIG9mIHRoZSBjYWxsIHNpdGVzIGZvciBnZXRfdXNlcl9wYWdl
cyooKSwgdG8KPiBpbnZva2UgcHV0X3VzZXJfcGFnZSooKSwgaW5zdGVhZCBvZiBwdXRfcGFnZSgp
LiBUaGlzIGludm9sdmVzIGRvemVucyBvZgo+IGNhbGwgc2l0ZXMsIGFuZCB3aWxsIHRha2Ugc29t
ZSB0aW1lLgoKSG93IGRvIHdlIG1ha2Ugc3VyZSB0aGlzIGlzIHRoZSBjYXNlIGFuZCBpdCB3aWxs
IHJlbWFpbiB0aGUgY2FzZSBpbiB0aGUKZnV0dXJlPyBUaGVyZSBtdXN0IGJlIHNvbWUgYXV0b21h
Z2ljIHRvIGVuZm9yY2UvY2hlY2sgdGhhdC4gSXQgaXMgc2ltcGx5Cm5vdCBtYW5hZ2VhYmxlIHRv
IGRvIGl0IGV2ZXJ5IG5vdyBhbmQgdGhlbiBiZWNhdXNlIHRoZW4gMykgd2lsbCBzaW1wbHkKYmUg
bmV2ZXIgc2FmZS4KCkhhdmUgeW91IGNvbnNpZGVyZWQgY29jY2luZWxlIG9yIHNvbWUgb3RoZXIg
c2NyaXB0ZWQgd2F5IHRvIGRvIHRoZQp0cmFuc2l0aW9uPyBJIGhhdmUgbm8gaWRlYSBob3cgdG8g
ZGVhbCB3aXRoIGZ1dHVyZSBjaGFuZ2VzIHRoYXQgd291bGQKYnJlYWsgdGhlIGJhbGFuY2UgdGhv
dWdoLgotLSAKTWljaGFsIEhvY2tvClNVU0UgTGFicwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
