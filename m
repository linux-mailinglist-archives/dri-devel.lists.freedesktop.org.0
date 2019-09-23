Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B12BADEA
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 08:38:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EEF96E0E0;
	Mon, 23 Sep 2019 06:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F5536E0E0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 06:38:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CF375883CA;
 Mon, 23 Sep 2019 06:38:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1997B5D713;
 Mon, 23 Sep 2019 06:38:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E120F9D6A; Mon, 23 Sep 2019 08:38:03 +0200 (CEST)
Date: Mon, 23 Sep 2019 08:38:03 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: Kernel panic during drm/nouveau init 5.3.0-rc7-next-20190903
Message-ID: <20190923063803.c7zpqwcqq5f2acq5@sirius.home.kraxel.org>
References: <20190907090534.GB1712@pc-sasha.localdomain>
 <20190920194450.GA3970@pc-sasha.localdomain>
 <CAKMK7uECOW2YigBe7aeCDPYXoXJ8TVh65xvKBjJXXRt5Y7HngA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uECOW2YigBe7aeCDPYXoXJ8TVh65xvKBjJXXRt5Y7HngA@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Mon, 23 Sep 2019 06:38:09 +0000 (UTC)
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
Cc: Alexander Kapshuk <alexander.kapshuk@gmail.com>,
 Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-next <linux-next@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Sean Paul <sean@poorly.run>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiA+ICdHaXQgYmlzZWN0JyBoYXMgaWRlbnRpZmllZCB0aGUgZm9sbG93aW5nIGNvbW1pdHMgYXMg
YmVpbmcgJ2JhZCcuCj4gPgo+ID4gYjk2ZjNlN2M4MDY5Yjc0OWE0MGNhM2EzM2M5NzgzNWQ1N2Rk
NDVkMiBpcyB0aGUgZmlyc3QgYmFkIGNvbW1pdAo+ID4gY29tbWl0IGI5NmYzZTdjODA2OWI3NDlh
NDBjYTNhMzNjOTc4MzVkNTdkZDQ1ZDIKPiA+IEF1dGhvcjogR2VyZCBIb2ZmbWFubiA8a3JheGVs
QHJlZGhhdC5jb20+Cj4gPiBEYXRlOiAgIE1vbiBBdWcgNSAxNjowMToxMCAyMDE5ICswMjAwCj4g
Pgo+ID4gICAgIGRybS90dG06IHVzZSBnZW0gdm1hX25vZGUKPiA+Cj4gPiAgICAgRHJvcCB2bWFf
bm9kZSBmcm9tIHR0bV9idWZmZXJfb2JqZWN0LCB1c2UgdGhlIGdlbSBzdHJ1Y3QKPiA+ICAgICAo
YmFzZS52bWFfbm9kZSkgaW5zdGVhZC4KPiA+Cj4gPiAgICAgU2lnbmVkLW9mZi1ieTogR2VyZCBI
b2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Cj4gPiAgICAgUmV2aWV3ZWQtYnk6IENocmlzdGlh
biBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiA+ICAgICBMaW5rOiBodHRwOi8v
cGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8yMDE5MDgwNTE0MDExOS43MzM3
LTkta3JheGVsQHJlZGhhdC5jb20KCj4gPiBUb2RheSwgSSB1cGdyYWRlZCB0aGUga2VybmVsIHRv
IDUuMy4wLW5leHQtMjAxOTA5MTksIHdoaWNoIGJvb3RlZCBmaW5lCj4gPiB3aXRoIG5vIFhvcmcg
cmVncmVzc2lvbnMgdG8gcmVwb3J0Lgo+ID4KPiA+IEp1c3Qgd29uZGVyaW5nIGlmIHRoZSBlYXJs
aWVyIGtlcm5lbHMgd291bGQgbm90IGJvb3QgZm9yIG1lIGJlY2F1c2Ugb2YKPiA+IHRoZSBjaGFu
Z2VzIGludHJvZHVjZWQgYnkgdGhlICdiYWQnIGNvbW1pdHMgYmVpbmcgcGVyaGFwcyBpbmNvbXBs
ZXRlPwoKWWVzLCB3ZSBoYWQgYSByZWdyZXNzaW9uIGluIG5vdXZlYXUsIGZpeGVkIGJ5IHRoaXMg
cGF0Y2ggKGluIGRybS1taXNjLW5leHQpOgoKY29tbWl0IDAxOWNiZDRhNGZlYjNhYTNhOTE3ZDc4
ZTcxMTBlMzAxMWJiZmY2ZDUKQXV0aG9yOiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEu
Y29tPgpEYXRlOiAgIFdlZCBBdWcgMTQgMTE6MDA6NDggMjAxOSArMDIwMAoKICAgIGRybS9ub3V2
ZWF1OiBJbml0aWFsaXplIEdFTSBvYmplY3QgYmVmb3JlIFRUTSBvYmplY3QKICAgIAogICAgVFRN
IGFzc3VtZXMgdGhhdCBkcml2ZXJzIGluaXRpYWxpemUgdGhlIGVtYmVkZGVkIEdFTSBvYmplY3Qg
YmVmb3JlCiAgICBjYWxsaW5nIHRoZSB0dG1fYm9faW5pdCgpIGZ1bmN0aW9uLiBUaGlzIGlzIG5v
dCBjdXJyZW50bHkgdGhlIGNhc2UKICAgIGluIHRoZSBOb3V2ZWF1IGRyaXZlci4gRml4IHRoaXMg
Ynkgc3BsaXR0aW5nIHVwIG5vdXZlYXVfYm9fbmV3KCkKICAgIGludG8gbm91dmVhdV9ib19hbGxv
YygpIGFuZCBub3V2ZWF1X2JvX2luaXQoKSBzbyB0aGF0IHRoZSBHRU0gY2FuCiAgICBiZSBpbml0
aWFsaXplZCBiZWZvcmUgVFRNIEJPIGluaXRpYWxpemF0aW9uIHdoZW4gbmVjZXNzYXJ5LgogICAg
CiAgICBGaXhlczogYjk2ZjNlN2M4MDY5ICgiZHJtL3R0bTogdXNlIGdlbSB2bWFfbm9kZSIpCiAg
ICBBY2tlZC1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+CiAgICBBY2tlZC1i
eTogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgogICAgU2lnbmVkLW9mZi1ieTogVGhp
ZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KICAgIExpbms6IGh0dHBzOi8vcGF0Y2h3
b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8yMDE5MDgxNDA5MzUyNC5HQTMxMzQ1QHVs
bW8KCkhUSCwKICBHZXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
