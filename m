Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A10B36B212
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 13:10:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A9C6E7D3;
	Mon, 26 Apr 2021 11:10:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51DA96E7D3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 11:10:21 +0000 (UTC)
Received: from mail-lj1-f199.google.com ([209.85.208.199])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1laz87-0002B0-Uw
 for dri-devel@lists.freedesktop.org; Mon, 26 Apr 2021 11:10:20 +0000
Received: by mail-lj1-f199.google.com with SMTP id
 a14-20020a2e7f0e0000b02900b9011db00cso14324308ljd.8
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 04:10:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xiDFWZDIwVOWhDf8JIJtdA0vE7Qg4WZABGwJr1mglyw=;
 b=gThtnKm4/jsOwdZ6MkBnl9zDWeVC4bQJ3TvqxX0URH9Gz0GFlmUO0wXkEoPxlD/eQ2
 xKprRPS4+6q0Gi5tW00C79QBSXdoQmxnKX+ox08L0suQJWac6/RZpB41tasli+X1CIBz
 UfcxorJcl1oGVU261cvmIseTHG/Xn4p6/4ioHaYIG6CtlcJWDUHZXUpVVDiCKE8HCino
 eeaHo3uJK5sicdH9tE06v/6Zs2IZKwv4jzInZAfWlxaJdcMw9qfakTkw0/sfLz+eAzR4
 E6hhbm755jc8NZzbDEKGFTciGHprACWkkRwwcd2IoVSfi6qPnT0le3CoX6uUzgnCJpeL
 VDyw==
X-Gm-Message-State: AOAM5303P1A4bnRLVmBgIoD03xnoBHUl358NtHjiCkaHujv8XR41GdQG
 ptYF71GBvXpD0Jt8uDuCAo+3iV3Cy3YyFhLNP7vmdLkU7Xoa1lBncYs4s/NlnNV56m2tnlOB8m/
 pC6QvVnbTt+uIQtkY4w7/ngvC7CDXELC8j1B/VoWvq0FrwKitUSX4jq8gi4wLcw==
X-Received: by 2002:ac2:4546:: with SMTP id j6mr307077lfm.290.1619435419365;
 Mon, 26 Apr 2021 04:10:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2HuOs7hsFQWQ6DpfjtFI/lGLMD7R4zW0qG+mZ1QM088Bg0L5h31Ae1gJG1TKdvDNzcal21ao43zQupwhBKww=
X-Received: by 2002:ac2:4546:: with SMTP id j6mr307063lfm.290.1619435419143;
 Mon, 26 Apr 2021 04:10:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210423044700.247359-1-kai.heng.feng@canonical.com>
 <YILAc6EhoWWhENq8@intel.com>
In-Reply-To: <YILAc6EhoWWhENq8@intel.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Mon, 26 Apr 2021 19:10:06 +0800
Message-ID: <CAAd53p72Y8Rda0Hk3WReLKPGJe8rwc5X-Pi5cyCpRPAm8sVEzg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/i915: Invoke BXT _DSM to enable MUX on HP
 Workstation laptops
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
Cc: David Airlie <airlied@linux.ie>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBcHIgMjMsIDIwMjEgYXQgODo0MSBQTSBWaWxsZSBTeXJqw6Rsw6QKPHZpbGxlLnN5
cmphbGFAbGludXguaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgQXByIDIzLCAyMDIxIGF0
IDEyOjQ2OjU0UE0gKzA4MDAsIEthaS1IZW5nIEZlbmcgd3JvdGU6Cj4gPiBPbiBIUCBGdXJ5IEc3
IFdvcmtzdGF0aW9ucywgZ3JhcGhpY3Mgb3V0cHV0IGlzIHJlLXJvdXRlZCBmcm9tIEludGVsIEdG
WAo+ID4gdG8gZGlzY3JldGUgR0ZYIGFmdGVyIFMzLiBUaGlzIGlzIG5vdCBkZXNpcmFibGUsIGJl
Y2F1c2UgdXNlcnNwYWNlIHdpbGwKPiA+IHRyZWF0IGNvbm5lY3RlZCBkaXNwbGF5IGFzIGEgbmV3
IG9uZSwgbG9zaW5nIGRpc3BsYXkgc2V0dGluZ3MuCj4gPgo+ID4gVGhlIGV4cGVjdGVkIGJlaGF2
aW9yIGlzIHRvIGxldCBkaXNjcmV0ZSBHRlggZHJpdmVzIGFsbCBleHRlcm5hbAo+ID4gZGlzcGxh
eXMuCj4gPgo+ID4gVGhlIHBsYXRmb3JtIGluIHF1ZXN0aW9uIHVzZXMgQUNQSSBtZXRob2QgXF9T
Qi5QQ0kwLkhHTUUgdG8gZW5hYmxlIE1VWC4KPiA+IFRoZSBtZXRob2QgaXMgaW5zaWRlIHRoZSBC
WFQgX0RTTSwgc28gYWRkIHRoZSBfRFNNIGFuZCBjYWxsIGl0Cj4gPiBhY2NvcmRpbmdseS4KPiA+
Cj4gPiBJIGFsc28gdGVzdGVkIHNvbWUgTVVYLWxlc3MgYW5kIGlHUFUgb25seSBsYXB0b3BzIHdp
dGggdGhlIEJYVCBfRFNNLCBubwo+ID4gcmVncmVzc2lvbiB3YXMgZm91bmQuCj4gPgo+ID4gdjI6
Cj4gPiAgLSBGb3J3YXJkIGRlY2xhcmUgc3RydWN0IHBjaV9kZXYuCj4gPgo+ID4gQ2xvc2VzOiBo
dHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2ludGVsLy0vaXNzdWVzLzMxMTMKPiA+
IFJlZmVyZW5jZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2ludGVsLWdmeC8xNDYwMDQwNzMy
LTMxNDE3LTQtZ2l0LXNlbmQtZW1haWwtYW5pbWVzaC5tYW5uYUBpbnRlbC5jb20vCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBLYWktSGVuZyBGZW5nIDxrYWkuaGVuZy5mZW5nQGNhbm9uaWNhbC5jb20+Cj4g
PiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FjcGkuYyB8IDE3
ICsrKysrKysrKysrKysrKysrCj4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9hY3BpLmggfCAgMyArKysKPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5jICAg
ICAgICAgICB8ICA1ICsrKysrCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCsp
Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
YWNwaS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hY3BpLmMKPiA+IGlu
ZGV4IDgzM2QwYzFiZTRmMS4uYzdiNTdjMjJkY2UzIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hY3BpLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWNwaS5jCj4gPiBAQCAtMTQsMTEgKzE0LDE2IEBACj4gPgo+
ID4gICNkZWZpbmUgSU5URUxfRFNNX1JFVklTSU9OX0lEIDEgLyogRm9yIENhbHBlbGxhIGFueXdh
eS4uLiAqLwo+ID4gICNkZWZpbmUgSU5URUxfRFNNX0ZOX1BMQVRGT1JNX01VWF9JTkZPIDEgLyog
Tm8gYXJncyAqLwo+ID4gKyNkZWZpbmUgSU5URUxfRFNNX0ZOX1BMQVRGT1JNX0JYVF9NVVhfSU5G
TyAwIC8qIE5vIGFyZ3MgKi8KPiA+Cj4gPiAgc3RhdGljIGNvbnN0IGd1aWRfdCBpbnRlbF9kc21f
Z3VpZCA9Cj4gPiAgICAgICBHVUlEX0lOSVQoMHg3ZWQ4NzNkMywgMHhjMmQwLCAweDRlNGYsCj4g
PiAgICAgICAgICAgICAgICAgMHhhOCwgMHg1NCwgMHgwZiwgMHgxMywgMHgxNywgMHhiMCwgMHgx
YywgMHgyYyk7Cj4gPgo+ID4gK3N0YXRpYyBjb25zdCBndWlkX3QgaW50ZWxfYnh0X2RzbV9ndWlk
ID0KPiA+ICsgICAgIEdVSURfSU5JVCgweDNlNWI0MWM2LCAweGViMWQsIDB4NDI2MCwKPiA+ICsg
ICAgICAgICAgICAgICAweDlkLCAweDE1LCAweGM3LCAweDFmLCAweGJhLCAweGRhLCAweGU0LCAw
eDE0KTsKPiA+ICsKPgo+IEkgdGhpbmsgdGhpcyBkc20gaXMganVzdCBzdXBwb3NlZCB0byBiZSBt
b3JlIG9yIGxlc3MgYW4KPiBhbHRlcm5hdGl2ZSB0byB0aGUgb3ByZWdpb24gU0NJIHN0dWZmLiBX
aHkgdGhlcmUgYXJlIHR3bwo+IHdheXMgdG8gZG8gdGhlIHNhbWUgdGhpbmdzIEkgaGF2ZSBubyBp
ZGVhLiBUaGUgb3ByZWdpb24KPiBzcGVjIGRvZXMgbm90IHRlbGwgdXMgc3VjaCBtdW5kYW5lIGRl
dGFpbHMuCgpSaWdodCBub3cgSSB0aGluayBpdCdzIEhQIHNwZWNpZmljIGFuZCBmcm9tIHdoYXQg
SSBjYW4gc2VlIGl0IGRvZXNuJ3QKdG91Y2ggb3ByZWdpb24uCgo+Cj4gSXQncyBhbHNvIG5vdCBk
b2N1bWVudGVkIHRvIGRvIGFueXRoaW5nIGV4Y2VwdCBsaXN0IHRoZQo+IHN1cHBvcnRlZCBmdW5j
dGlvbnM6Cj4gIkdldCBCSU9TIERhdGEgRnVuY3Rpb25zIFN1cHBvcnRlZCDigJxGdW5jdGlvbiAj
MCIKPiAgVGhpcyBmdW5jdGlvbiBjYW4gYmUgY2FsbGVkIHRvIGRpc2NvdmVyIHdoaWNoIOKAnF9E
U03igJ0gRnVuY3Rpb25zIGFyZQo+ICBzdXBwb3J0ZWQuIEl0IG1heSBvbmx5IHJldHVybiBzdWNj
ZXNzIGlmIHRoZSByZXR1cm4gdmFsdWUgYWNjdXJhdGVseQo+ICBsaXN0cyBzdXBwb3J0ZWQgRnVu
Y3Rpb25zLiIKPgo+IEJ1dCB3aGF0IHlvdSdyZSBhcHBhcmVudGx5IHNheWluZyBpcyB0aGF0IGNh
bGxpbmcgdGhpcyBjaGFuZ2VzCj4gdGhlIGJlaGF2aW91ciBvZiB0aGUgc3lzdGVtIHNvbWVob3c/
IFRoYXQgaXMgdHJvdWJsaW5nLgoKSXQgZmxpcHMgYSBiaXQgaW4gQklPUy1yZXNlcnZlZCBJbnRl
bCBHUElPLCBhbmQgRUMvaGFyZHdhcmUgd2lsbApjaGFuZ2UgdGhlIE1VWCBiYXNlZCBvbiB0aGUg
R1BJTyBiaXQuCgpXZSBjYW4gYWRkIGEgRE1JIGNoZWNrIHRvIG1hdGNoICJIUCIgdG8gbWluaW1p
emUgdGhlIHBvdGVudGlhbApyZWdyZXNzaW9uIGZhY3Rvci4KCkthaS1IZW5nCgo+Cj4gLS0KPiBW
aWxsZSBTeXJqw6Rsw6QKPiBJbnRlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
