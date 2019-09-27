Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF8CC0AE9
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 20:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF316E1D3;
	Fri, 27 Sep 2019 18:19:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C9E6E1CD;
 Fri, 27 Sep 2019 18:19:14 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id y21so6540952wmi.0;
 Fri, 27 Sep 2019 11:19:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fA3AyFMETBkkXBMPLk4PEoT5pvbGmGcoWcfzer8Dpbc=;
 b=btxu6so74PHeuKrw6kL60NRnLEqjfSEQYqhRiMN0FtSI09M1SXNvb+5vTeHdm2100h
 R74/YLrPgtJgpnKpEvwXmE8Iz94pBCLhj/Wex9nWA6E3cI4lg22fPIakp0qJKVhHAfmr
 rg/ozC5tgZ/DT14AgD9Xo0G5fXZys4bu/OC2H3MJbXbydSpDjH084flDQyUufSuDdeoB
 K0Z7sjEfYzhv8LKAzJ9VLklGj9SDL184WBT9V8/ksYcKGvel5uSDVn+UxT9SNBY43gIN
 hYyVMWKq00eT040JjEi1sbiW8xn1ZX7PeKY9OMWqdYKv1UIH8yp/Cb+Kucyq4rCMAPU+
 J2bQ==
X-Gm-Message-State: APjAAAXo0szJad/RrRLpHuBdPLmen0DgkQoJtoa8sUC8uRKO8hqQ8LQk
 6cNxcAKQ0mQVA6lHVMUKVirClB+GDOxT64zKp/k=
X-Google-Smtp-Source: APXvYqzvIontBSJjr5BL4fVM0hJ1HtGC2SPpdNGFAWfGbTHRgFyZ9bG6l1I9NU1H98PJUTSkVkJLbuHhtCfMH0o7Tnc=
X-Received: by 2002:a05:600c:2308:: with SMTP id
 8mr8649051wmo.67.1569608353487; 
 Fri, 27 Sep 2019 11:19:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190926225122.31455-1-lyude@redhat.com>
 <20190926225122.31455-2-lyude@redhat.com>
 <2a1d5221-b801-44f9-c966-1163b8d67b3f@amd.com>
In-Reply-To: <2a1d5221-b801-44f9-c966-1163b8d67b3f@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 27 Sep 2019 14:18:59 -0400
Message-ID: <CADnq5_PF_aAcCADP1g3+4UFmWM7TVPmSsnaw1GaFqVzBodVE3A@mail.gmail.com>
Subject: Re: [PATCH 1/6] drm/amdgpu/dm/mst: Don't create MST topology managers
 for eDP ports
To: Harry Wentland <hwentlan@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=fA3AyFMETBkkXBMPLk4PEoT5pvbGmGcoWcfzer8Dpbc=;
 b=ZCgeDszDVj753elaOe+KWDWkEmrdRe7T8yV8JfyXUydLncuDesAt0ZOJQARb/Uvhp4
 FLU0sSyG3DwUIub9WjxnbNNXWxHBGV+ikhlPKosoZHz2TIHLHBwcXbF5sJxkYcjb/VGb
 qttKU1daTr9IxM/8FoMSHnmeI4zd+/1alWg/HJ6CwNZbUri52v/CPb7kKY7EEhnPbdDV
 78qtDAdHtdiBdPOexbUK2itMu7u0K52AfLYTo5kf0y6kVxTo9QyB4tPHntKSsGk+Rpwa
 s7mKDQ1IIFGH9NoE47TnbfXL2V9qV2qQx9WxoFM/yolTXt7cas/wuBArvtYpf6NoSyTh
 qfKg==
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
Cc: Thomas Lim <Thomas.Lim@amd.com>, "Li,
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Francis,
 David" <David.Francis@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, "Zuo, Jerry" <Jerry.Zuo@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgMTo0OCBQTSBIYXJyeSBXZW50bGFuZCA8aHdlbnRsYW5A
YW1kLmNvbT4gd3JvdGU6Cj4KPiBPbiAyMDE5LTA5LTI2IDY6NTEgcC5tLiwgTHl1ZGUgUGF1bCB3
cm90ZToKPiA+IFNpZ25lZC1vZmYtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Cj4K
PiBSZXZpZXdlZC1ieTogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+Cj4K
CkFwcGxpZWQuICBUaGFua3MhCgpBbGV4Cgo+IEhhcnJ5Cj4KPiA+IC0tLQo+ID4gIGRyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jIHwgNCAr
KysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3Rf
dHlwZXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
X21zdF90eXBlcy5jCj4gPiBpbmRleCA1ZWMxNGVmZDRkOGMuLjE4NWJmMGUyYmRhMiAxMDA2NDQK
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
X21zdF90eXBlcy5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1
X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuYwo+ID4gQEAgLTQxNyw2ICs0MTcsMTAgQEAgdm9pZCBh
bWRncHVfZG1faW5pdGlhbGl6ZV9kcF9jb25uZWN0b3Ioc3RydWN0IGFtZGdwdV9kaXNwbGF5X21h
bmFnZXIgKmRtLAo+ID4gICAgICAgZHJtX2RwX2F1eF9yZWdpc3RlcigmYWNvbm5lY3Rvci0+ZG1f
ZHBfYXV4LmF1eCk7Cj4gPiAgICAgICBkcm1fZHBfY2VjX3JlZ2lzdGVyX2Nvbm5lY3RvcigmYWNv
bm5lY3Rvci0+ZG1fZHBfYXV4LmF1eCwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICZhY29ubmVjdG9yLT5iYXNlKTsKPiA+ICsKPiA+ICsgICAgIGlmIChhY29ubmVjdG9y
LT5iYXNlLmNvbm5lY3Rvcl90eXBlID09IERSTV9NT0RFX0NPTk5FQ1RPUl9lRFApCj4gPiArICAg
ICAgICAgICAgIHJldHVybjsKPiA+ICsKPiA+ICAgICAgIGFjb25uZWN0b3ItPm1zdF9tZ3IuY2Jz
ID0gJmRtX21zdF9jYnM7Cj4gPiAgICAgICBkcm1fZHBfbXN0X3RvcG9sb2d5X21ncl9pbml0KAo+
ID4gICAgICAgICAgICAgICAmYWNvbm5lY3Rvci0+bXN0X21nciwKPiA+Cj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlz
dAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
