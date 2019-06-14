Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B96445680
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D38899E6;
	Fri, 14 Jun 2019 07:36:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B8E5899DB;
 Fri, 14 Jun 2019 07:36:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jun 2019 00:36:56 -0700
X-ExtLoop1: 1
Received: from mtayar-mobl.ger.corp.intel.com (HELO [10.252.34.38])
 ([10.252.34.38])
 by orsmga002.jf.intel.com with ESMTP; 14 Jun 2019 00:36:50 -0700
Subject: Re: [PATCH] drm/amdgpu: Fix connector atomic_check compilation fail
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org
References: <20190614002713.141340-1-sean@poorly.run>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <5e864c26-d106-c947-3047-d45048d5f327@linux.intel.com>
Date: Fri, 14 Jun 2019 09:36:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614002713.141340-1-sean@poorly.run>
Content-Language: en-US
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Ben Skeggs <bskeggs@redhat.com>, Leo Li <sunpeng.li@amd.com>,
 intel-gfx@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Karol Herbst <karolherbst@gmail.com>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T3AgMTQtMDYtMjAxOSBvbSAwMjoyNyBzY2hyZWVmIFNlYW4gUGF1bDoKPiBGcm9tOiBTZWFuIFBh
dWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KPgo+IEkgbWlzc2VkIGFtZGdwdSBpbiBteSBjb25u
bmVjdG9yX2hlbHBlcl9mdW5jcy0+YXRvbWljX2NoZWNrIGNvbnZlcnNpb24sCj4gd2hpY2ggaXMg
dW5kZXJzdGFuZGFibHkgY2F1c2luZyBjb21waWxhdGlvbiBmYWlsdXJlcy4KPgo+IEZpeGVzOiA2
ZjNiNjI3ODFiYmQgKCJkcm06IENvbnZlcnQgY29ubmVjdG9yX2hlbHBlcl9mdW5jcy0+YXRvbWlj
X2NoZWNrIHRvIGFjY2VwdCBkcm1fYXRvbWljX3N0YXRlIikKPiBDYzogRGFuaWVsIFZldHRlciA8
ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGlu
dXguaW50ZWwuY29tPgo+IENjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAbGludXguaW50ZWwu
Y29tPgo+IENjOiBKb29uYXMgTGFodGluZW4gPGpvb25hcy5sYWh0aW5lbkBsaW51eC5pbnRlbC5j
b20+Cj4gQ2M6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4KPiBDYzogQmVu
IFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgo+IENjOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVy
ZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gQ2M6IEtpZXJhbiBCaW5naGFtIDxraWVy
YW4uYmluZ2hhbStyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+Cj4gQ2M6IEVyaWMgQW5ob2x0IDxl
cmljQGFuaG9sdC5uZXQ+Cj4gQ2M6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRA
aWRlYXNvbmJvYXJkLmNvbT4gW2ZvciByY2FyIGx2ZHNdCj4gQ2M6IFNlYW4gUGF1bCA8c2VhbnBh
dWxAY2hyb21pdW0ub3JnPgo+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9y
c3RAbGludXguaW50ZWwuY29tPgo+IENjOiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJv
b3RsaW4uY29tPgo+IENjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KPiBDYzogRGF2aWQg
QWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQu
Y29tPgo+IENjOiBLYXJvbCBIZXJic3QgPGthcm9saGVyYnN0QGdtYWlsLmNvbT4KPiBDYzogSWxp
YSBNaXJraW4gPGltaXJraW5AYWx1bS5taXQuZWR1Pgo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gQ2M6IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzog
bGludXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnCj4gUmVwb3J0ZWQtYnk6IENocmlzIFdp
bHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+IFNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1
bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgNSArKystLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCj4gaW5kZXggM2E3MjNlNTUzYTE5
My4uM2Q1ZTgyOGMzZDI4NCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwo+IEBAIC0zOTUzLDkgKzM5NTMsMTAgQEAgaXNfaGRy
X21ldGFkYXRhX2RpZmZlcmVudChjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZSAqb2xk
X3N0YXRlLAo+ICAKPiAgc3RhdGljIGludAo+ICBhbWRncHVfZG1fY29ubmVjdG9yX2F0b21pY19j
aGVjayhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubiwKPiAtCQkJCSBzdHJ1Y3QgZHJtX2Nvbm5l
Y3Rvcl9zdGF0ZSAqbmV3X2Nvbl9zdGF0ZSkKPiArCQkJCSBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0
ZSAqc3RhdGUpCj4gIHsKPiAtCXN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSA9IG5ld19j
b25fc3RhdGUtPnN0YXRlOwo+ICsJc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKm5ld19jb25f
c3RhdGUgPQo+ICsJCWRybV9hdG9taWNfZ2V0X25ld19jb25uZWN0b3Jfc3RhdGUoc3RhdGUsIGNv
bm4pOwo+ICAJc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKm9sZF9jb25fc3RhdGUgPQo+ICAJ
CWRybV9hdG9taWNfZ2V0X29sZF9jb25uZWN0b3Jfc3RhdGUoc3RhdGUsIGNvbm4pOwo+ICAJc3Ry
dWN0IGRybV9jcnRjICpjcnRjID0gbmV3X2Nvbl9zdGF0ZS0+Y3J0YzsKClRoYW5rcywgYXBwbGll
ZC4gOikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
