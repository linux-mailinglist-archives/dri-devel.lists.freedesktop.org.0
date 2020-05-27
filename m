Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5037B1E3CC0
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 10:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B5B56E2B6;
	Wed, 27 May 2020 08:55:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17FC86E2B6
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 08:55:38 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id c71so2264046wmd.5
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 01:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ADwlJrCHdZnIX7JDuyxY15uvLUj9vVGL+atMNe90Lqo=;
 b=PxrNQyFiaMckedUXORr8I6DVOrt+Jds339YXscSOvGLAmFOIMMPS5sqeKCndFYwBCN
 PUfqbJKa7W3W52o3oxALhEzjl36E1XkpoE8O6u01KGSuojMj5lSRNmVwybq7NOuv+HOx
 XemWJ7ucoVPDfzhyFE3/HIF9u/8NtvzXqG0i4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ADwlJrCHdZnIX7JDuyxY15uvLUj9vVGL+atMNe90Lqo=;
 b=Cqn+XFo5W1+of7ljlow71YkGfpMyPS5yCEE0RQ6mfkXF0hosJus+Bd8hOQwVuexCwW
 /x67CcOAcevHUYirW/BsrJn4iK1mu+ajm8ye2d96DRQWq1F+DQzPzyZ7ZFMXbF2eTEv9
 J3a8NIFTMkmTMJQmwp8YwscVMifdo76XCW4VLl4sR/uvYHBokU+W31YaX/nSPAk+LRNy
 dNs7iBGIDeozYHd1KF2LIYfNVdX2Rvi5imKQzg1y+V6AIQ0cHba3lzsbxMsYjLdOokbj
 MLKIVZY18VrJ5dv0MBphBSlJTEiEKzo+74Ye3PwVVXjbkRcvAHdlcHjGPThoIAUxA3Lo
 EELw==
X-Gm-Message-State: AOAM5307ppbNe1p/TeLK39JaOo1GNq9XdoKXfAH2F10m5sGiRBVWwlJd
 SlkWGdmX5R0pTbXAuRL1acGZ/L/y6MI=
X-Google-Smtp-Source: ABdhPJynvYyNmC0zHPESIZi76bMoX6DP5lz+WK68Qpa/v/xK7shbmliteMK57Tq3w5A8d8Vt1AUOqw==
X-Received: by 2002:a7b:c005:: with SMTP id c5mr3269386wmb.22.1590569736706;
 Wed, 27 May 2020 01:55:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v7sm2268218wre.93.2020.05.27.01.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2020 01:55:35 -0700 (PDT)
Date: Wed, 27 May 2020 10:55:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/fourcc: document modifier uniqueness requirements
Message-ID: <20200527085534.GP206103@phenom.ffwll.local>
References: <oiOTNO-CVtaRiMyv-cHHP3CGvE4-9eSZRMmmdzXMb56vWw6CppnmT95NRUStbuV_RJLF-G_7usijW0kXKm64IuTJK9g49DycnAuE80yGlyo=@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <oiOTNO-CVtaRiMyv-cHHP3CGvE4-9eSZRMmmdzXMb56vWw6CppnmT95NRUStbuV_RJLF-G_7usijW0kXKm64IuTJK9g49DycnAuE80yGlyo=@emersion.fr>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjcsIDIwMjAgYXQgMDg6NTI6MDBBTSArMDAwMCwgU2ltb24gU2VyIHdyb3Rl
Ogo+IFRoZXJlIGhhdmUgc3VnZ2VzdGlvbnMgdG8gYmFrZSBwaXRjaCBhbGlnbm1lbnQsIGFkZHJl
c3MgYWxpZ25lbWVudCwKPiBjb250aWd1b3VzIG1lbW9yeSBvciBvdGhlciBwbGFjZW1lbnQgKGhp
ZGRlbiBWUkFNLCBHVFQvQkFSLCBldGMpCj4gY29uc3RyYWludHMgaW50byBtb2RpZmllcnMuIExh
c3QgdGltZSB0aGlzIHdhcyBicm91Z2h0IHVwIGl0IHNlZW1lZAo+IGxpa2UgdGhlIGNvbnNlbnN1
cyB3YXMgdG8gbm90IGFsbG93IHRoaXMuIERvY3VtZW50IHRoaXMgaW4gZHJtX2ZvdXJjYy5oLgo+
IAo+IFRoZXJlIGFyZSBzZXZlcmFsIHJlYXNvbnMgZm9yIHRoaXMuCj4gCj4gLSBFbmNvZGluZyBh
bGwgb2YgdGhlc2UgY29uc3RyYWludHMgaW4gdGhlIG1vZGlmaWVycyB3b3VsZCBleHBsb2RlIHRo
ZQo+ICAgc2VhcmNoIHNwYWNlIHByZXR0eSBxdWlja2x5ICh3ZSBvbmx5IGhhdmUgNjQgYml0cyB0
byB3b3JrIHdpdGgpLgo+IC0gTW9kaWZpZXJzIG5lZWQgdG8gYmUgdW5hbWJpZ3VvdXM6IGEgYnVm
ZmVyIGNhbiBvbmx5IGhhdmUgYSBzaW5nbGUKPiAgIG1vZGlmaWVyLgo+IC0gTW9kaWZpZXIgdXNl
cnMgYXJlbid0IGV4cGVjdGVkIHRvIHBhcnNlIG1vZGlmaWVycy4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBTaW1vbiBTZXIgPGNvbnRhY3RAZW1lcnNpb24uZnI+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRh
bmllbEBmZndsbC5jaD4KPiBDYzogRGFuaWVsIFN0b25lIDxkYW5pZWxAZm9vaXNoYmFyLm9yZz4K
PiBDYzogQmFzIE5pZXV3ZW5odWl6ZW4gPGJhc0BiYXNuaWV1d2VuaHVpemVuLm5sPgo+IENjOiBE
YXZlIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+Cj4gQ2M6IE1hcmVrIE9sxaHDoWsgPG1hcmFl
b0BnbWFpbC5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oIHwgMTEg
KysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKPiAKPiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmggYi9pbmNsdWRlL3VhcGkvZHJt
L2RybV9mb3VyY2MuaAo+IGluZGV4IDQ5MDE0MzUwMGE1MC4uOTdlYjBmMWNmOWY4IDEwMDY0NAo+
IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oCj4gKysrIGIvaW5jbHVkZS91YXBp
L2RybS9kcm1fZm91cmNjLmgKPiBAQCAtNTgsNiArNTgsMTcgQEAgZXh0ZXJuICJDIiB7Cj4gICAq
IG1heSBwcmVzZXJ2ZSBtZWFuaW5nIC0gc3VjaCBhcyBudW1iZXIgb2YgcGxhbmVzIC0gZnJvbSB0
aGUgZm91cmNjIGNvZGUsCj4gICAqIHdoZXJlYXMgb3RoZXJzIG1heSBub3QuCj4gICAqCj4gKyAq
IE1vZGlmaWVycyBtdXN0IHVuaXF1ZWx5IGVuY29kZSBidWZmZXIgbGF5b3V0LiBJbiBvdGhlciB3
b3JkcywgYSBidWZmZXIgbXVzdAo+ICsgKiBtYXRjaCBvbmx5IGEgc2luZ2xlIG1vZGlmaWVyLiBB
IG1vZGlmaWVyIG11c3Qgbm90IGJlIGEgc3Vic2V0IG9mIGxheW91dHMgb2YKPiArICogYW5vdGhl
ciBtb2RpZmllci4gRm9yIGluc3RhbmNlLCBpdCdzIGluY29ycmVjdCB0byBlbmNvZGUgcGl0Y2gg
YWxpZ25tZW50IGluCj4gKyAqIGEgbW9kaWZpZXI6IGEgYnVmZmVyIG1heSBtYXRjaCBhIDY0LXBp
eGVsIGFsaWduZWQgbW9kaWZpZXIgYW5kIGEgMzItcGl4ZWwKPiArICogYWxpZ25lZCBtb2RpZmll
ci4gVGhhdCBzYWlkLCBtb2RpZmllcnMgY2FuIGhhdmUgaW1wbGljaXQgbWluaW1hbAo+ICsgKiBy
ZXF1aXJlbWVudHMuCgpJIHRoaW5rIHdlIHNob3VsZCBhbHNvIGFkZCB0aGUgYWxpYXNpbmcgd2hl
biB0aGUgZm91cmNjIGNvZGVzIGFyZQppbnZvbHZlZCwgd2l0aCBhZmJjIGFzIGV4YW1wbGUuIE1h
eWJlOgoKRm9yIG1vZGlmaWVycyB3aGVyZSB0aGUgY29tYmluYXRpb24gb2YgZm91cmNjIGNvZGUg
YW5kIG1vZGlmaWVyIGNhbiBhbGlhcywKYSBjYW5vbmljYWwgcGFpciBuZWVkcyB0byBiZSBkZWZp
bmVkIGFuZCB1c2VkIGJ5IGFsbCBkcml2ZXJzLiBBbiBleGFtcGxlCmlzIGFmYmMsIHdoZXJlIGJv
dGggYXJnYiBhbmQgYWJnciBoYXZlIHRoZSBleGFjdCBzYW1lIGNvbXByZXNzZWQgbGF5b3V0LgoK
V2l0aCBzb21ldGhpbmcgbGlrZSB0aGF0IGFkZGVkOgoKUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0
ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+CgoKPiArICoKPiArICogVXNlcnMgc2VlIG1vZGlm
aWVycyBhcyBvcGFxdWUgdG9rZW5zIHRoZXkgY2FuIGNoZWNrIGZvciBlcXVhbGl0eSBhbmQKPiAr
ICogaW50ZXJzZWN0LiBVc2VycyBtdXNuJ3QgbmVlZCB0byBrbm93IHRvIHJlYXNvbiBhYm91dCB0
aGUgbW9kaWZpZXIgdmFsdWUKPiArICogKGkuZS4gdXNlcnMgYXJlIG5vdCBleHBlY3RlZCB0byBl
eHRyYWN0IGluZm9ybWF0aW9uIG91dCBvZiB0aGUgbW9kaWZpZXIpLgo+ICsgKgo+ICAgKiBWZW5k
b3JzIHNob3VsZCBkb2N1bWVudCB0aGVpciBtb2RpZmllciB1c2FnZSBpbiBhcyBtdWNoIGRldGFp
bCBhcwo+ICAgKiBwb3NzaWJsZSwgdG8gZW5zdXJlIG1heGltdW0gY29tcGF0aWJpbGl0eSBhY3Jv
c3MgZGV2aWNlcywgZHJpdmVycyBhbmQKPiAgICogYXBwbGljYXRpb25zLgo+IC0tIAo+IDIuMjYu
Mgo+IAo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBv
cmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
