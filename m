Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CACE181780
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 12:50:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D5089FA6;
	Mon,  5 Aug 2019 10:50:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 014E189FA6;
 Mon,  5 Aug 2019 10:50:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 68AA5C051676;
 Mon,  5 Aug 2019 10:50:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-81.ams2.redhat.com
 [10.36.116.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15EC45D712;
 Mon,  5 Aug 2019 10:50:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4A79816E08; Mon,  5 Aug 2019 12:50:39 +0200 (CEST)
Date: Mon, 5 Aug 2019 12:50:39 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Frediano Ziglio <fziglio@redhat.com>
Subject: Re: [Spice-devel] [PATCH] drm/qxl: get vga ioports
Message-ID: <20190805105039.cxf2ogbzdf7hropp@sirius.home.kraxel.org>
References: <20190805085355.12527-1-kraxel@redhat.com>
 <1869747233.4556840.1564996693878.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1869747233.4556840.1564996693878.JavaMail.zimbra@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Mon, 05 Aug 2019 10:50:40 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Dave Airlie <airlied@redhat.com>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKCj4gPiArCXJldCA9IHZnYV9nZXRfaW50ZXJydXB0aWJsZShwZGV2LCBWR0FfUlNSQ19M
RUdBQ1lfSU8pOwo+ID4gKwlpZiAocmV0KSB7Cj4gPiArCQlEUk1fRVJST1IoImNhbid0IGdldCBs
ZWdhY3kgdmdhIHBvcnRzXG4iKTsKPiA+ICsJCWdvdG8gcHV0X3ZnYTsKPiAKPiBJIHN1cHBvc2Ug
dGhhdCBpZiB0aGlzIGZhaWxzIGl0J3Mgc2Vjb25kYXJ5IHNvIHNob3VsZCBjb250aW51ZS4KCkFo
LCByaWdodCwgdGhlcmUgYXJlIHNlY29uZGFyeSBxeGwgY2FyZHMgKHdpdGhvdXQgdGhlIHZnYSBj
b21wYXQgYml0cykuCldlIHNob3VsZCBza2lwIHRoZSBjYWxsIGluIHRoYXQgY2FzZSAobGlrZXdp
c2UgZm9yIHRoZSBjbGVhbnVwcykuCgo+IFdoYXQgaGFwcGVuIGNvbmZpZ3VyaW5nIDIgUVhMIGRl
dmljZXM/Cj4gT25seSBhIGNhcmQgc2hvdWxkIHByb3ZpZGUgVkdBIHJlZ2lzdGVycyBpbiB0aGUg
c3lzdGVtIHNvCj4gaWYgYW55IG90aGVyIGNhcmQgcHJvdmlkZSB0aGVtIFFYTCB3b24ndCB3b3Jr
LgoKV2VsbCwgd2l0aCBpbnRlbCB2Z3B1IGV2ZXJ5dGhpbmcgd29ya3MgZmluZSB3aXRoIHRoaXMg
cGF0Y2guICBQcm9iYWJseQppOTE1IHNraXBzIGRpcmVjdCB2Z2EgcmVnaXN0ZXIgYWNjZXNzIGlu
IGNhc2UgdmdhX2dldCBmYWlscyAoYmVjYXVzZSBxeGwKZ3JhYmVkIHRoZW0gZmlyc3QpLgoKSW4g
YW55IGNhc2UgSSdkIHByZWZlciB0byBmYWlsIHF4bCBpbml0aWFsaXphdGlvbiBvdmVyIGNvbnRp
bnVpbmcKZGVzcGl0ZSB2Z2FfZ2V0KCkgaGF2aW5nIGZhaWxlZC4gIFRoZSBmYWlsdXJlIG1vZGUg
aXMgcmF0aGVyIGF3a3dhcmQ6CnFlbXUgdGhpbmtzIHRoZSBxeGwgY2FyZCBpcyBpbiB2Z2EgbW9k
ZSB3aGlsZSB0aGUgZ3Vlc3Qga2VybmVsIHRoaW5rcwpxeGwgaXMgaW4gbmF0aXZlIG1vZGUuICBH
dWVzdCBrZWVwcyBxdWV1aW5nIGNvbW1hbmRzIHVudGlsIHRoZSByaW5nIGlzCmZ1bGwgd2hpbGUg
cWVtdSBuZXZlciB0YWtlcyB0aGVtIG91dCwgc28gYXQgc29tZSBwb2ludCB0aGUgZ3Vlc3Qga2Vy
bmVsCmJsb2NrcyBmb3JldmVyIGluIHF4bF9yaW5nX3B1c2goKS4KCmNoZWVycywKICBHZXJkCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
