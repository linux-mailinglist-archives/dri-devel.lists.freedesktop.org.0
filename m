Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B321004F7
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 13:01:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2841D6E4A5;
	Mon, 18 Nov 2019 12:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 313B06E4AA
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:01:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8CBC2AFDB;
 Mon, 18 Nov 2019 12:01:20 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id BE4051E4B05; Mon, 18 Nov 2019 11:16:01 +0100 (CET)
Date: Mon, 18 Nov 2019 11:16:01 +0100
From: Jan Kara <jack@suse.cz>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v5 10/24] mm/gup: introduce pin_user_pages*() and FOLL_PIN
Message-ID: <20191118101601.GF17319@quack2.suse.cz>
References: <20191115055340.1825745-1-jhubbard@nvidia.com>
 <20191115055340.1825745-11-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191115055340.1825745-11-jhubbard@nvidia.com>
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Mike Rapoport <rppt@linux.ibm.com>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1IDE0LTExLTE5IDIxOjUzOjI2LCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4gIC8qCj4gLSAq
IE5PVEUgb24gRk9MTF9MT05HVEVSTToKPiArICogRk9MTF9QSU4gYW5kIEZPTExfTE9OR1RFUk0g
bWF5IGJlIHVzZWQgaW4gdmFyaW91cyBjb21iaW5hdGlvbnMgd2l0aCBlYWNoCj4gKyAqIG90aGVy
LiBIZXJlIGlzIHdoYXQgdGhleSBtZWFuLCBhbmQgaG93IHRvIHVzZSB0aGVtOgo+ICAgKgo+ICAg
KiBGT0xMX0xPTkdURVJNIGluZGljYXRlcyB0aGF0IHRoZSBwYWdlIHdpbGwgYmUgaGVsZCBmb3Ig
YW4gaW5kZWZpbml0ZSB0aW1lCj4gLSAqIHBlcmlvZCBfb2Z0ZW5fIHVuZGVyIHVzZXJzcGFjZSBj
b250cm9sLiAgVGhpcyBpcyBjb250cmFzdGVkIHdpdGgKPiAtICogaW92X2l0ZXJfZ2V0X3BhZ2Vz
KCkgd2hlcmUgdXNhZ2VzIHdoaWNoIGFyZSB0cmFuc2llbnQuCj4gKyAqIHBlcmlvZCBfb2Z0ZW5f
IHVuZGVyIHVzZXJzcGFjZSBjb250cm9sLiAgVGhpcyBpcyBpbiBjb250cmFzdCB0bwo+ICsgKiBp
b3ZfaXRlcl9nZXRfcGFnZXMoKSwgd2hlcmUgdXNhZ2VzIHdoaWNoIGFyZSB0cmFuc2llbnQuCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgXl5eIHdoZW4geW91IHRvdWNoIHRoaXMsIHBsZWFzZSBm
aXggYWxzbyB0aGUKc2Vjb25kIHNlbnRlbnNlLiBJdCBkb2Vzbid0IHF1aXRlIG1ha2Ugc2Vuc2Ug
dG8gbWUuLi4gSSdkIHByb2JhYmx5IHdyaXRlCnRoZXJlICJ3aG9zZSB1c2FnZXMgYXJlIHRyYW5z
aWVudCIgYnV0IG1heWJlIHlvdSBjYW4gY29tZSB1cCB3aXRoIHNvbWV0aGluZwpldmVuIGJldHRl
ci4KCk90aGVyd2lzZSB0aGUgcGF0Y2ggbG9va3MgZ29vZCB0byBtZSBzbyBmZWVsIGZyZWUgdG8g
YWRkOgoKUmV2aWV3ZWQtYnk6IEphbiBLYXJhIDxqYWNrQHN1c2UuY3o+CgoJCQkJCQkJCUhvbnph
Ci0tIApKYW4gS2FyYSA8amFja0BzdXNlLmNvbT4KU1VTRSBMYWJzLCBDUgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
