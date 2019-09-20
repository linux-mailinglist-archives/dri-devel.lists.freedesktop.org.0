Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D9AB94E5
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 18:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 218916FD50;
	Fri, 20 Sep 2019 16:06:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E6566FD50;
 Fri, 20 Sep 2019 16:06:17 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Sep 2019 09:06:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,529,1559545200"; d="scan'208";a="178410120"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 20 Sep 2019 09:06:12 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 20 Sep 2019 19:06:12 +0300
Date: Fri, 20 Sep 2019 19:06:12 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] video/hdmi: Fix AVI bar unpack
Message-ID: <20190920160612.GB1208@intel.com>
References: <20190919132853.30954-1-ville.syrjala@linux.intel.com>
 <20190920145853.GA10973@ulmo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190920145853.GA10973@ulmo>
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
Cc: Mauro Carvalho Chehab <mchehab@osg.samsung.com>,
 intel-gfx@lists.freedesktop.org, stable@vger.kernel.org,
 Hans Verkuil <hans.verkuil@cisco.com>, dri-devel@lists.freedesktop.org,
 Martin Bugge <marbugge@cisco.com>, Thierry Reding <treding@nvidia.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMjAsIDIwMTkgYXQgMDQ6NTg6NTNQTSArMDIwMCwgVGhpZXJyeSBSZWRpbmcg
d3JvdGU6Cj4gT24gVGh1LCBTZXAgMTksIDIwMTkgYXQgMDQ6Mjg6NTNQTSArMDMwMCwgVmlsbGUg
U3lyamFsYSB3cm90ZToKPiA+IEZyb206IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBs
aW51eC5pbnRlbC5jb20+Cj4gPiAKPiA+IFRoZSBiYXIgdmFsdWVzIGFyZSBsaXR0bGUgZW5kaWFu
LCBub3QgYmlnIGVuZGlhbi4gVGhlIHBhY2sKPiA+IGZ1bmN0aW9uIGRpZCBpdCByaWdodCBidXQg
dGhlIHVucGFjayBnb3QgaXQgd3JvbmcuIEZpeCBpdC4KPiA+IAo+ID4gQ2M6IHN0YWJsZUB2Z2Vy
Lmtlcm5lbC5vcmcKPiA+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKPiA+IENjOiBN
YXJ0aW4gQnVnZ2UgPG1hcmJ1Z2dlQGNpc2NvLmNvbT4KPiA+IENjOiBIYW5zIFZlcmt1aWwgPGhh
bnMudmVya3VpbEBjaXNjby5jb20+Cj4gPiBDYzogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZp
ZGlhLmNvbT4KPiA+IENjOiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWJAb3NnLnNhbXN1
bmcuY29tPgo+ID4gRml4ZXM6IDJjNjc2ZjM3OGVkYiAoIlttZWRpYV0gaGRtaTogYWRkZWQgdW5w
YWNrIGFuZCBsb2dnaW5nIGZ1bmN0aW9ucyBmb3IgSW5mb0ZyYW1lcyIpCj4gPiBTaWduZWQtb2Zm
LWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+ID4g
LS0tCj4gPiAgZHJpdmVycy92aWRlby9oZG1pLmMgfCA4ICsrKystLS0tCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBSZXZpZXdlZC1ieTog
VGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoYW5rcy4gUHVzaGVkIHRvIGRy
bS1taXNjLW5leHQuCgotLSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
