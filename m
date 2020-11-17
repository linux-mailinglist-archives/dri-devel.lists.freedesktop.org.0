Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FCA2B6E34
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 20:14:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4DF789FCC;
	Tue, 17 Nov 2020 19:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FD0589F6B
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 19:14:55 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id d12so24317972wrr.13
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 11:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=HeTcjS/dd0NEqamTnE+1Ub8o0IkKzsWK8FFem51/YMU=;
 b=Y08Epjyl0jv752OAzfMzijr+QPSBQZvxPmJB73xMBGTQ7catufmLM8vobZzdseitJ+
 mqNBHjjJhvo/8Mjajlnm+MCG5V4xVT9IP1pRMdrltgKlNaVUFL630be158TXSWqhoTaA
 7q4y8bHLolzBmRg2J/GE026V5BtEulCYFECXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=HeTcjS/dd0NEqamTnE+1Ub8o0IkKzsWK8FFem51/YMU=;
 b=KPI2vBPZ6d/3ew6ISv0hgE31FyUjL12CkzegXAHWcNPBpUdHCudQBb/dD/C+fUOOHh
 UoctNNnSa8Yfn+910mCBaFNqL0Mr0PaaGcXEGFlClttIWL2pqeVNLjmk3T1cChzUI+1U
 /ngo1WPzf8tIwoPQEpe+4TXswZruv2CsEdXv9c8zclPjWcUTe7ryvF8N9Sa4IHkn2yUR
 f1ZJc9qXYlIdWulZEOTbr7fLnXws35EPAIh3P7EREXxl58UdDg1DCCbZPGchnjeZ5qtZ
 Nv7Y5h/PfiOb0QJLTUA+pPIrbxL84zrEBfhgDKruIe6vRB7XHp2qH9+JvlWvOfGHcOHI
 ljNw==
X-Gm-Message-State: AOAM533KnE7+54xSJTPAObfoPlybXHX24tqXXewsC4x6k73T8zkwD4Sf
 Rhm318U5qIwMO4Ux/9VMSX3RgA==
X-Google-Smtp-Source: ABdhPJxwGv9J2uCXaMCQag4+rIx+29M/rQeIQQVZBJw+rPjxUyGFygtXGZEg9n2MqtBn8+E5HjCATg==
X-Received: by 2002:a5d:4d02:: with SMTP id z2mr1050907wrt.109.1605640493957; 
 Tue, 17 Nov 2020 11:14:53 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q66sm5489733wme.6.2020.11.17.11.14.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 11:14:53 -0800 (PST)
Date: Tue, 17 Nov 2020 20:14:51 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 32/42] drm/ttm/ttm_tt: Demote kernel-doc header format
 abuses
Message-ID: <20201117191451.GT401619@phenom.ffwll.local>
Mail-Followup-To: Lee Jones <lee.jones@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, Huang Rui <ray.huang@amd.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
References: <20201116174112.1833368-1-lee.jones@linaro.org>
 <20201116174112.1833368-33-lee.jones@linaro.org>
 <bcb40255-312f-8cdb-28a8-7ee2e6596f90@amd.com>
 <20201117083346.GB1869941@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117083346.GB1869941@dell>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTcsIDIwMjAgYXQgMDg6MzM6NDZBTSArMDAwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+IE9uIE1vbiwgMTYgTm92IDIwMjAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gCj4gPiBB
bSAxNi4xMS4yMCB1bSAxODo0MSBzY2hyaWViIExlZSBKb25lczoKPiA+ID4gRml4ZXMgdGhlIGZv
bGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4gPiA+IAo+ID4gPiAgIGRyaXZl
cnMvZ3B1L2RybS90dG0vdHRtX3R0LmM6NDU6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBv
ciBtZW1iZXIgJ2JvJyBub3QgZGVzY3JpYmVkIGluICd0dG1fdHRfY3JlYXRlJwo+ID4gPiAgIGRy
aXZlcnMvZ3B1L2RybS90dG0vdHRtX3R0LmM6NDU6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRl
ciBvciBtZW1iZXIgJ3plcm9fYWxsb2MnIG5vdCBkZXNjcmliZWQgaW4gJ3R0bV90dF9jcmVhdGUn
Cj4gPiA+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYzo4Mzogd2FybmluZzogRnVuY3Rp
b24gcGFyYW1ldGVyIG9yIG1lbWJlciAndHRtJyBub3QgZGVzY3JpYmVkIGluICd0dG1fdHRfYWxs
b2NfcGFnZV9kaXJlY3RvcnknCj4gPiAKPiA+IENvdWxkbid0IHdlIHJhdGhlciBkZXNjcmliZSB0
aGUgbWlzc2luZyBwYXJhbWV0ZXJzPyBTaG91bGRuJ3QgYmUgbXVjaCB3b3JrLgo+IAo+IE15IHJ1
bGUgaXM7IGlmIGEgc3Vic3RhbnRpYWwgYXR0ZW1wdCBoYXMgYmVlbiBtYWRlIHRvIGRvY3VtZW50
Cj4gc29tZXRoaW5nLCBJJ2xsIHBhdGNoIGl0IHVwLiAgSWYgbGl0dGxlIG9yIG5vIGF0dGVtcHQg
aGFzIGJlZW4gbWFkZSwKPiB0aGVuIGl0IGdldHMgZGVtb3RlZC4KPiAKPiBQbGVhc2UgZmVlbCBm
cmVlIHRvIGRvY3VtZW50IGFuZCB1cGdyYWRlIHRoZW0gb25jZSBtb3JlLgo+IAo+IEJlYXIgaW4g
bWluZCBob3dldmVyLCB0aGVyZSBpcyBhIHNjcmlwdCB0aGF0IHJlcG9ydHMgb24gYWxsIGZpbGVz
Cj4gd2hpY2ggdXRpbGlzZSBrZXJuZWwtZG9jIG5vdGF0aW9uIGJ1dCBkbyBub3QgaGF2ZSBtYXRj
aGluZyByZWZlcmVuY2VzCj4gZnJvbSB0aGUgRG9jdW1lbnRhdGlvbiBhcmVhLgo+IAo+IFNlZTog
c2NyaXB0cy9maW5kLXVudXNlZC1kb2NzLnNoCgp0dG0gZG9jcyBuZWVkIHNvbWUgc2VyaW91cyBs
b3ZlIGFueXdheSwgc28gSSB0aGluayB0aGlzIGlzIGZpbmUuIEkgYXBwbGllZAppdC4KLURhbmll
bAoKPiAKPiA+ID4gQ2M6IENocmlzdGlhbiBLb2VuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KPiA+ID4gQ2M6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+Cj4gPiA+IENjOiBEYXZp
ZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gPiA+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWxAZmZ3bGwuY2g+Cj4gPiA+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
PiA+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gPiA+
IC0tLQo+ID4gPiAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3R0LmMgfCA0ICsrLS0KPiA+ID4g
ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gPiAK
PiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3R0LmMgYi9kcml2ZXJz
L2dwdS9kcm0vdHRtL3R0bV90dC5jCj4gPiA+IGluZGV4IGNmZDYzM2M3ZTc2NDMuLmRhOWVlZmZl
MGM2ZDcgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3R0LmMKPiA+
ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYwo+ID4gPiBAQCAtMzgsNyArMzgs
NyBAQAo+ID4gPiAgICNpbmNsdWRlIDxkcm0vZHJtX2NhY2hlLmg+Cj4gPiA+ICAgI2luY2x1ZGUg
PGRybS90dG0vdHRtX2JvX2RyaXZlci5oPgo+ID4gPiAtLyoqCj4gPiA+ICsvKgo+ID4gPiAgICAq
IEFsbG9jYXRlcyBhIHR0bSBzdHJ1Y3R1cmUgZm9yIHRoZSBnaXZlbiBCTy4KPiA+ID4gICAgKi8K
PiA+ID4gICBpbnQgdHRtX3R0X2NyZWF0ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLCBi
b29sIHplcm9fYWxsb2MpCj4gPiA+IEBAIC03Myw3ICs3Myw3IEBAIGludCB0dG1fdHRfY3JlYXRl
KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sIGJvb2wgemVyb19hbGxvYykKPiA+ID4gICAJ
cmV0dXJuIDA7Cj4gPiA+ICAgfQo+ID4gPiAtLyoqCj4gPiA+ICsvKgo+ID4gPiAgICAqIEFsbG9j
YXRlcyBzdG9yYWdlIGZvciBwb2ludGVycyB0byB0aGUgcGFnZXMgdGhhdCBiYWNrIHRoZSB0dG0u
Cj4gPiA+ICAgICovCj4gPiA+ICAgc3RhdGljIGludCB0dG1fdHRfYWxsb2NfcGFnZV9kaXJlY3Rv
cnkoc3RydWN0IHR0bV90dCAqdHRtKQo+ID4gCj4gCj4gLS0gCj4gTGVlIEpvbmVzIFvmnY7nkLzm
lq9dCj4gU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCj4gTGluYXJv
Lm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCj4gRm9sbG93IExpbmFy
bzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUg
RW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
