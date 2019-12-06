Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 998DD115165
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 14:52:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B27696FA1F;
	Fri,  6 Dec 2019 13:52:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 329836FA1E
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 13:52:35 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id o63so2973192ybc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2019 05:52:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=NBHIqBYcLV6qSw7otru/5uIp0+wUdzIGpd7xl/5h2v4=;
 b=YHJYHqTtuOrodjaW6u8VrsWyFEYTVACWeiuffMncsoy/PliYBLezhmYQCKHBIFSrQ0
 iWAsmXokP2ns0P//sWpROsLNeB8A81UvwJxe10lYjRPluiTTSqfA1mZnAn2bfa7wCnZ0
 3fvVcmFC5Q7+mjUsy5No4z4sEszMJ2f2DfTcuOwVM2MYAf9G1i96WCYwJVf2PsjBEDRh
 sZpE+Y3dYI8rErGM+mBxQCfUSNplDWHGbYuPgj3o8zUtTnUt7L9tM+xmBwGe/b6p48rL
 N5wEDHiApkfnxgdpyeUHcBjTA5wKGmr0+5JTOiMoZklZhI8Hv9RQYmA0EJlQVRF3anBT
 IUEA==
X-Gm-Message-State: APjAAAUq2IkjXRBvTeTaUeoCC1VzW1e99eMByKW3qGXnsZzcGda6l2nk
 4UPfjqL3eZmQRWudYYJbWljZ1g==
X-Google-Smtp-Source: APXvYqwJCRn85C+flzIAUaTeT2nVaCt8ZU7ch+u+K4IOtqiAoXJqpzepnyLnk7iX2DvDsYXkRHrPCA==
X-Received: by 2002:a25:ab41:: with SMTP id u59mr10730301ybi.339.1575640354296; 
 Fri, 06 Dec 2019 05:52:34 -0800 (PST)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id j129sm6208881ywf.99.2019.12.06.05.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2019 05:52:33 -0800 (PST)
Date: Fri, 6 Dec 2019 08:52:33 -0500
From: Sean Paul <sean@poorly.run>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 04/11] drm/i915: Don't WARN on HDCP toggle if
 get_hw_state returns false
Message-ID: <20191206135233.GD162979@art_vandelay>
References: <20191203173638.94919-1-sean@poorly.run>
 <20191203173638.94919-5-sean@poorly.run>
 <20191205193935.GL1208@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191205193935.GL1208@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=NBHIqBYcLV6qSw7otru/5uIp0+wUdzIGpd7xl/5h2v4=;
 b=MEM9gN6gSPrc/N6IrHZezf6Ne/ldMY7JjRoH7xChKY2Or9vUIplx0FT4VPoqUvVsLi
 5hfsjkuAJB6b8EA8JYe4IvaH+lqDQSB4Mu2lz7FNCLSOaOBR8TF1nrpORem58RhkspaJ
 iq6uEeSuIbk5C22UiI9N1O8Xpp4+6Fdsu/596Eps+ajwP15ZAU2SO3/kw8zFiYzX+ILx
 aWf6Su7VpMwsDL/nU1nVHkXjsoL/1Z6NSILbFqz42PfCGLu1s6SBcyIrSMZ+tHRPQgQp
 cc64nHK/GEoQ+xDkyIdriRhfj1hfcH7JYOQlcUNjjXj/oe935Wyfw3hiSJ/WlhMDHS5c
 07OQ==
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ramalingm.c@intel.com,
 Sean Paul <seanpaul@chromium.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBEZWMgMDUsIDIwMTkgYXQgMDk6Mzk6MzVQTSArMDIwMCwgVmlsbGUgU3lyasOkbMOk
IHdyb3RlOgo+IE9uIFR1ZSwgRGVjIDAzLCAyMDE5IGF0IDEyOjM2OjI3UE0gLTA1MDAsIFNlYW4g
UGF1bCB3cm90ZToKPiA+IEZyb206IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+
ID4gCj4gPiBOb3cgdGhhdCB3ZSBjYW4gcmVseSBvbiB0cmFuc2NvZGVyIGRpc2FibGUgdG8gdG9n
Z2xlIHNpZ25hbGxpbmcgb2ZmLAo+ID4gaXQncyBsZXNzIG9mIGEgY2F0YXN0cm9waGUgaWYgZ2V0
X2h3X3N0YXRlKCkgcmV0dXJucyBmYWxzZS4KPiA+IAo+ID4gT25jZSB3ZSBlbmFibGUgTVNULCB0
aGlzIHdpbGwgYmUgYSB2YWxpZCBleGl0IHBhdGggYW5kIHdlIHdhbnQgdG8gbWFrZQo+ID4gc3Vy
ZSB3ZSdyZSBub3Qgc3BhbW1pbmcgdGhlIGxvZ3MgbmVlZGxlc3NseS4KPiA+IAo+ID4gU2lnbmVk
LW9mZi1ieTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+Cj4gPiAtLS0KPiA+ICBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RkaS5jIHwgMiArLQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYyBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMKPiA+IGluZGV4IGU4YWM5OGE4ZWU3Zi4u
Y2EyODkxM2E0YzlmIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9kZGkuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9kZGkuYwo+ID4gQEAgLTE5ODMsNyArMTk4Myw3IEBAIGludCBpbnRlbF9kZGlfdG9nZ2xlX2hk
Y3Bfc2lnbmFsbGluZyhzdHJ1Y3QgaW50ZWxfZW5jb2RlciAqaW50ZWxfZW5jb2RlciwKPiA+ICAJ
aWYgKFdBUk5fT04oIXdha2VyZWYpKQo+ID4gIAkJcmV0dXJuIC1FTlhJTzsKPiA+ICAKPiA+IC0J
aWYgKFdBUk5fT04oIWludGVsX2VuY29kZXItPmdldF9od19zdGF0ZShpbnRlbF9lbmNvZGVyLCAm
cGlwZSkpKSB7Cj4gPiArCWlmICghaW50ZWxfZW5jb2Rlci0+Z2V0X2h3X3N0YXRlKGludGVsX2Vu
Y29kZXIsICZwaXBlKSkgewo+IAo+IEhvdyBjYW4gdGhpcyBnZXQgY2FsbGVkIHdoZW4gdGhlIGVu
Y29kZXIgaXMgbm90IGVuYWJsZWQ/Cj4gRmVlbHMgbGlrZSB0aGlzIHdob2xlIHRoaW5nIGlzIHRy
eWluZyB0byBwYXBlciBvdmVyIHNvbWUKPiBiaWdnZXIgYnVnIGluIHRoZSBoZGNwIGNvZGUuCgpJ
biB0aGUgTVNUIHBhdGNoLCBJJ3ZlIGFkZGVkIGEgY2FsbCB0byBpbnRlbF9oZGNwX2Rpc2FibGUo
KSBpbiB0aGUgY29ubmVjdG9yCmRlc3Ryb3kgcGF0aC4gVXN1YWxseSB0b2dnbGluZyB3aWxsIGJl
IGRpc2FibGVkIGFzIHBhcnQgb2YgdGhlIGNoZWNrX2xpbmsgY2FsbAp0aGF0IGlzIGluaXRpYXRl
ZCBvbiB1bnBsdWcsIHNvIGluIHRoZSBkZXN0cm95IHBhdGggaXQncyBub24tZXNzZW50aWFsIHRv
IGRvCnRoaXMgYWdhaW4uCgpTZWFuCgo+IAo+ID4gIAkJcmV0ID0gLUVJTzsKPiA+ICAJCWdvdG8g
b3V0Owo+ID4gIAl9Cj4gPiAtLSAKPiA+IFNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdv
b2dsZSAvIENocm9taXVtIE9TCj4gPiAKPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+IAo+IC0tIAo+IFZpbGxlIFN5cmrDpGzDpAo+
IEludGVsCgotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21p
dW0gT1MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
