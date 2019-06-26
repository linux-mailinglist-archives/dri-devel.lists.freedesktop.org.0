Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06356561D7
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 07:46:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C34BB6E282;
	Wed, 26 Jun 2019 05:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA546E282;
 Wed, 26 Jun 2019 05:46:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B5BEDAF03;
 Wed, 26 Jun 2019 05:46:46 +0000 (UTC)
Date: Wed, 26 Jun 2019 07:46:45 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH 05/22] mm: export alloc_pages_vma
Message-ID: <20190626054645.GB17798@dhcp22.suse.cz>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-6-hch@lst.de>
 <20190620191733.GH12083@dhcp22.suse.cz>
 <CAPcyv4h9+Ha4FVrvDAe-YAr1wBOjc4yi7CAzVuASv=JCxPcFaw@mail.gmail.com>
 <20190625072317.GC30350@lst.de>
 <20190625150053.GJ11400@dhcp22.suse.cz>
 <CAPcyv4j1e5dbBHnc+wmtsNUyFbMK_98WxHNwuD_Vxo4dX9Ce=Q@mail.gmail.com>
 <20190625190038.GK11400@dhcp22.suse.cz>
 <CAPcyv4hU13v7dSQpF0WTQTxQM3L3UsHMUhsFMVz7i4UGLoM89g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPcyv4hU13v7dSQpF0WTQTxQM3L3UsHMUhsFMVz7i4UGLoM89g@mail.gmail.com>
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
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>, nouveau@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 linux-pci@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlIDI1LTA2LTE5IDEyOjUyOjE4LCBEYW4gV2lsbGlhbXMgd3JvdGU6ClsuLi5dCj4gPiBE
b2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3RhYmxlLWFwaS1ub25zZW5zZS5yc3QKPiAKPiBUaGF0IGRv
Y3VtZW50IGhhcyBmYWlsZWQgdG8gcHJlY2x1ZGUgc3ltYm9sIGV4cG9ydCBmaWdodHMgaW4gdGhl
IHBhc3QKPiBhbmQgdGhlcmUgaXMgYSByZWFzb25hYmxlIGFyZ3VtZW50IHRvIHRyeSBub3QgdG8g
cmV0cmFjdCBmdW5jdGlvbmFsaXR5Cj4gdGhhdCBoYWQgYmVlbiBwcmV2aW91c2x5IGV4cG9ydGVk
IHJlZ2FyZGxlc3Mgb2YgdGhhdCBkb2N1bWVudC4KCkNhbiB5b3UgcG9pbnQgbWUgdG8gYW55IHNw
ZWNpZmljIGV4YW1wbGUgd2hlcmUgdGhpcyB3b3VsZCBiZSB0aGUgY2FzZQpmb3IgdGhlIGNvcmUg
a2VybmVsIHN5bWJvbHMgcGxlYXNlPwotLSAKTWljaGFsIEhvY2tvClNVU0UgTGFicwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
