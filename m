Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 305C32B2259
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 18:28:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CDF66E5D4;
	Fri, 13 Nov 2020 17:28:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE626E5D2;
 Fri, 13 Nov 2020 17:28:53 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id u12so3548486wrt.0;
 Fri, 13 Nov 2020 09:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=C+0w2nBltIcPLOhtMLZ4S0PvakYggYrXZkCbBUTmbq0=;
 b=GrHaeW1ppx0bLiAObJsVnHiwxGBLMJkGdYRyPjzHR3pdOm7zuDvCsQJsahDDewdjr+
 iIQsy4tiGdL2sWEGJQdzgG002YgyWqyzpIdIxRwgNzz6y47GJVlsawkrckGP+I+qXOiF
 2f1y+AdYnM9scoXNsdfACnAW48roo5y4YgXQ9Oadcip29U1tcCwdfGBVqjN/YeXPWP0O
 ewwir+MKbyc1JHzUnbYoVyPjiZDY1TP3sYtSYgImzQCfm6HnDv+dy1HpthyRyBOJ43ZU
 CCFk0qeFT1hSUW2R1NhwzwwOUrg4QiV2t47PPDjMamatmBF12DxC4/YRhbMCIYv58W/0
 n4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=C+0w2nBltIcPLOhtMLZ4S0PvakYggYrXZkCbBUTmbq0=;
 b=iF9BdasLpJdxAK6HiKrbYU4C65Mp+/Ji/OQGhuPRKeuyenDIYOsktmDW+KHrMkmB9l
 l44iGbaH+H+JT2nv0rrzUL3CbpxWYq5/fZmrJUS60sV6Fx3DdWuuiWCRs1XUqzGVv/Sn
 CyYayx5iZTrKZJBxtIDg2fiYNAfAHTpFRwrbHYupdYQtwTz6yuxbiEot4ow4p7SQZ9wv
 TqFT+M3kP0Du/oLxBV1q0dXuynV2GEpsNGG2FVWGMlE3aAzR37UWxJH/uf2p6eZnIMGs
 oQUf2Ku2FspYNLWqYDAeDkMC3CE6u5JGhUzvIe8/SJOfV4AfqLXdbtOVVpQzFw5vAdyX
 +bkA==
X-Gm-Message-State: AOAM530hv8aFwlpUqPkRveiPxj5DQzk41nFSio7Gw/3Bqjl82a+7gkGv
 BAqGce7dE2neKlNYjAwQI1/tNhLMG0YpMi/0zSo=
X-Google-Smtp-Source: ABdhPJxuaa3hBBRuLvzp1t3KaqcAtdvwchrwB6YlbtVUL8bP+9zl0m9O5cz+ROgmeD2LRgIHwlg4TZND6aDOvazNpQw=
X-Received: by 2002:adf:e9c9:: with SMTP id l9mr5064718wrn.124.1605288527583; 
 Fri, 13 Nov 2020 09:28:47 -0800 (PST)
MIME-Version: 1.0
References: <20201113134938.4004947-1-lee.jones@linaro.org>
 <20201113134938.4004947-27-lee.jones@linaro.org>
In-Reply-To: <20201113134938.4004947-27-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 13 Nov 2020 12:28:36 -0500
Message-ID: <CADnq5_PzV8ZRCRCS4EP-e=wbEtEbwsTT6MKH=YHDpGJoAA7nLQ@mail.gmail.com>
Subject: Re: [PATCH 26/40] drm/amd/amdgpu/amdgpu_gmc: Demote one and fix
 another function header
To: Lee Jones <lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMTMsIDIwMjAgYXQgODo1MCBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMuYzo2
OTogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnYm8nIG5vdCBkZXNjcmli
ZWQgaW4gJ2FtZGdwdV9nbWNfcGRfYWRkcicKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2dtYy5jOjEyMTogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAn
Ym8nIG5vdCBkZXNjcmliZWQgaW4gJ2FtZGdwdV9nbWNfYWdwX2FkZHInCj4gIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMuYzoxMjE6IHdhcm5pbmc6IEV4Y2VzcyBmdW5jdGlv
biBwYXJhbWV0ZXIgJ3RibycgZGVzY3JpcHRpb24gaW4gJ2FtZGdwdV9nbWNfYWdwX2FkZHInCj4K
PiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hy
aXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWly
bGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwu
Y2g+Cj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25l
c0BsaW5hcm8ub3JnPgoKQXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCj4gLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMuYyB8IDUgKystLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZ21jLmMKPiBpbmRleCAwNTZjYjg3ZDA5ZWEzLi5mZWRlODQ1MDlkYmNh
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMuYwo+IEBAIC02MSw5
ICs2MSw4IEBAIHZvaWQgYW1kZ3B1X2dtY19nZXRfcGRlX2Zvcl9ibyhzdHJ1Y3QgYW1kZ3B1X2Jv
ICpibywgaW50IGxldmVsLAo+ICAgICAgICAgYW1kZ3B1X2dtY19nZXRfdm1fcGRlKGFkZXYsIGxl
dmVsLCBhZGRyLCBmbGFncyk7Cj4gIH0KPgo+IC0vKioKPiArLyoKPiAgICogYW1kZ3B1X2dtY19w
ZF9hZGRyIC0gcmV0dXJuIHRoZSBhZGRyZXNzIG9mIHRoZSByb290IGRpcmVjdG9yeQo+IC0gKgo+
ICAgKi8KPiAgdWludDY0X3QgYW1kZ3B1X2dtY19wZF9hZGRyKHN0cnVjdCBhbWRncHVfYm8gKmJv
KQo+ICB7Cj4gQEAgLTExMiw3ICsxMTEsNyBAQCBpbnQgYW1kZ3B1X2dtY19zZXRfcHRlX3BkZShz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdm9pZCAqY3B1X3B0X2FkZHIsCj4gIC8qKgo+ICAg
KiBhbWRncHVfZ21jX2FncF9hZGRyIC0gcmV0dXJuIHRoZSBhZGRyZXNzIGluIHRoZSBBR1AgYWRk
cmVzcyBzcGFjZQo+ICAgKgo+IC0gKiBAdGJvOiBUVE0gQk8gd2hpY2ggbmVlZHMgdGhlIGFkZHJl
c3MsIG11c3QgYmUgaW4gR1RUIGRvbWFpbgo+ICsgKiBAYm86IFRUTSBCTyB3aGljaCBuZWVkcyB0
aGUgYWRkcmVzcywgbXVzdCBiZSBpbiBHVFQgZG9tYWluCj4gICAqCj4gICAqIFRyaWVzIHRvIGZp
Z3VyZSBvdXQgaG93IHRvIGFjY2VzcyB0aGUgQk8gdGhyb3VnaCB0aGUgQUdQIGFwZXJ0dXJlLiBS
ZXR1cm5zCj4gICAqIEFNREdQVV9CT19JTlZBTElEX09GRlNFVCBpZiB0aGF0IGlzIG5vdCBwb3Nz
aWJsZS4KPiAtLQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
