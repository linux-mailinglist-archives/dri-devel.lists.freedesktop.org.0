Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 630A5341ECD
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 14:52:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0776A6EA0B;
	Fri, 19 Mar 2021 13:52:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A4746EA0A
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 13:52:48 +0000 (UTC)
IronPort-SDR: RS8yMRcMtyFz3isyhuWrDzDvIPPySS44xakbpPwsoypHsAr/gEdj7AMQuQ6m6N7EtwVTp7N5++
 AGy3KbLrCtfg==
X-IronPort-AV: E=McAfee;i="6000,8403,9928"; a="209919569"
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; d="scan'208";a="209919569"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 06:52:47 -0700
IronPort-SDR: YNF8CPXV+IYFng1K1eaVAQh11SNitPCITE3gei6N+X9otQaAOBt9/124pzpgd5+3jTxljWpScR
 J/Bl7zhD4W5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; d="scan'208";a="374956703"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga006.jf.intel.com with SMTP; 19 Mar 2021 06:52:44 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 19 Mar 2021 15:52:43 +0200
Date: Fri, 19 Mar 2021 15:52:43 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 04/19] include: drm: drm_atomic: Make use of
 'new_plane_state'
Message-ID: <YFSsq745gswwET6A@intel.com>
References: <20210319082428.3294591-1-lee.jones@linaro.org>
 <20210319082428.3294591-5-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210319082428.3294591-5-lee.jones@linaro.org>
X-Patchwork-Hint: comment
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXIgMTksIDIwMjEgYXQgMDg6MjQ6MTNBTSArMDAwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+IEluIHRoZSBtYWNybyBmb3JfZWFjaF9vbGRuZXdfcGxhbmVfaW5fc3RhdGUoKSAnbmV3X3Bs
YW5lX3N0YXRlJyBpcyBwcm92aWRlZAo+IGFzIGEgY29udGFpbmVyIGZvciBzdGF0ZS0+cGxhbmVz
W2ldLm5ld19zdGF0ZSwgYnV0IGlzIG5vdCB1dGlsaXNlZCBpbgo+IHNvbWUgdXNlLWNhc2VzLCBz
byB3ZSBmYWtlLXVzZSBpdCBpbnN0ZWFkLgo+IAo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtl
cm5lbCBidWlsZCB3YXJuaW5nKHMpOgo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8u
Li9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYzogSW4gZnVuY3Rpb24g4oCYYW1kZ3B1X2Rt
X2NvbW1pdF9jdXJzb3Jz4oCZOgo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNw
bGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYzo3NjQ5OjQ0OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhu
ZXdfcGxhbmVfc3RhdGXigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJp
YWJsZV0KPiAKPiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4
LmludGVsLmNvbT4KPiBDYzogTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPgo+IENj
OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiBDYzogRGF2aWQgQWly
bGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwu
Y2g+Cj4gQ2M6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4KPiBDYzogZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpv
bmVzQGxpbmFyby5vcmc+Cj4gLS0tCj4gIGluY2x1ZGUvZHJtL2RybV9hdG9taWMuaCB8IDMgKyst
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2F0b21pYy5oIGIvaW5jbHVkZS9kcm0vZHJtX2F0
b21pYy5oCj4gaW5kZXggYWM1YTI4ZWZmMmM4Ni4uMjU5ZTY5NzBkYzgzNiAxMDA2NDQKPiAtLS0g
YS9pbmNsdWRlL2RybS9kcm1fYXRvbWljLmgKPiArKysgYi9pbmNsdWRlL2RybS9kcm1fYXRvbWlj
LmgKPiBAQCAtODcxLDcgKzg3MSw4IEBAIHZvaWQgZHJtX3N0YXRlX2R1bXAoc3RydWN0IGRybV9k
ZXZpY2UgKmRldiwgc3RydWN0IGRybV9wcmludGVyICpwKTsKPiAgCQkJICAgICAoKHBsYW5lKSA9
IChfX3N0YXRlKS0+cGxhbmVzW19faV0ucHRyLAlcCj4gIAkJCSAgICAgICh2b2lkKShwbGFuZSkg
LyogT25seSB0byBhdm9pZCB1bnVzZWQtYnV0LXNldC12YXJpYWJsZSB3YXJuaW5nICovLCBcCj4g
IAkJCSAgICAgIChvbGRfcGxhbmVfc3RhdGUpID0gKF9fc3RhdGUpLT5wbGFuZXNbX19pXS5vbGRf
c3RhdGUsXAo+IC0JCQkgICAgICAobmV3X3BsYW5lX3N0YXRlKSA9IChfX3N0YXRlKS0+cGxhbmVz
W19faV0ubmV3X3N0YXRlLCAxKSkKPiArCQkJICAgICAgKG5ld19wbGFuZV9zdGF0ZSkgPSAoX19z
dGF0ZSktPnBsYW5lc1tfX2ldLm5ld19zdGF0ZSwgXAo+ICsJCQkgICAgICAodm9pZCkobmV3X3Bs
YW5lX3N0YXRlKSAvKiBPbmx5IHRvIGF2b2lkIHVudXNlZC1idXQtc2V0LXZhcmlhYmxlIHdhcm5p
bmcgKi8sIDEpKQoKSW4gdGhpcyBjYXNlIHlvdSBjYW4ganVzdCBzd2l0Y2ggdGhlIGNvZGUgdG8g
dXNlCmZvcl9lYWNoX29sZF9wbGFuZV9pbl9zdGF0ZSgpIGluc3RlYWQuCgo+ICAKPiAgLyoqCj4g
ICAqIGZvcl9lYWNoX29sZG5ld19wbGFuZV9pbl9zdGF0ZV9yZXZlcnNlIC0gaXRlcmF0ZSBvdmVy
IGFsbCBwbGFuZXMgaW4gYW4gYXRvbWljCj4gLS0gCj4gMi4yNy4wCj4gCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBs
aXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgotLSAKVmlsbGUgU3lyasOk
bMOkCkludGVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
