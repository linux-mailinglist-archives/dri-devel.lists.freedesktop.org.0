Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37942D07FE
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 09:13:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E247E6E8FC;
	Wed,  9 Oct 2019 07:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id D8C956E7CA
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 14:13:39 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id AA7CE8081;
 Tue,  8 Oct 2019 14:14:11 +0000 (UTC)
Date: Tue, 8 Oct 2019 07:13:35 -0700
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCHv2 7/7] drm/omap: hdmi4: fix use of uninitialized var
Message-ID: <20191008141335.GB5610@atomide.com>
References: <20190930103840.18970-1-tomi.valkeinen@ti.com>
 <20190930103840.18970-8-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190930103840.18970-8-tomi.valkeinen@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Wed, 09 Oct 2019 07:12:51 +0000
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
Cc: linux-omap@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPiBbMTkwOTMwIDEwOjM4XToK
PiBJZiB1c2VfbWNsayBpcyBmYWxzZSwgbWNsa19tb2RlIGlzIHdyaXR0ZW4gdG8gYSByZWdpc3Rl
ciB3aXRob3V0Cj4gaW5pdGlhbGl6YXRpb24uIFRoaXMgZG9lc24ndCBjYXVzZSBhbnkgaWxsIGVm
ZmVjdHMgYXMgdGhlIHdyaXR0ZW4gdmFsdWUKPiBpcyBub3QgdXNlZCB3aGVuIHVzZV9tY2xrIGlz
IGZhbHNlLgo+IAo+IFRvIGZpeCB0aGlzLCB3cml0ZSB1c2VfbWNsayBvbmx5IHdoZW4gdXNlX21j
bGsgaXMgdHJ1ZS4KCkhleSBuaWNlIGNhdGNoLiBCYXNlZCBvbiBhIHF1aWNrIHRlc3QgbG9va3Mg
bGlrZSB0aGlzIGZpeGVzIGFuCmlzc3VlIHdoZXJlIHBvd2VyIGNvbnN1bXB0aW9uIHN0YXlzIGhp
Z2hlciBhZnRlciB1c2luZyBIRE1JLgoKV291bGQgYmUgbmljZSB0byBoYXZlIG1lcmdlZCBpbiB0
aGUgdjUuNC1yYyBzZXJpZXM6CgpUZXN0ZWQtYnk6IFRvbnkgTGluZGdyZW4gPHRvbnlAYXRvbWlk
ZS5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
