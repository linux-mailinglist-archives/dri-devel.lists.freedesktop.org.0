Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D838A26AD50
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 21:16:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE226E161;
	Tue, 15 Sep 2020 19:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C706E8F8;
 Tue, 15 Sep 2020 19:16:44 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id o5so4415531wrn.13;
 Tue, 15 Sep 2020 12:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IJulLnUZRloj+JIxnR5PX7+lFtVvSPhO7Tu13HJYnvU=;
 b=fRCUJhJt4m5HTraGhNUTJq3D90tnnrpN/PFDlbV4+tqbEBKiBKEcP6Wl7NuWpLfE5M
 Wy77VehzVtlPVhgkjxS57wgsV0Fl9kcpWzMhJLPMm8yt4x/SFcj78pifD+1ne1/HlayR
 E/uLIFoGcyP8kNjtgo8sgZx2BkyTMvj2SiPxd8XnUymK9oag9D9eKx8Yx8PoKbZY/G3U
 Ui0Wsego+cv3uxjgYrSG0oD4aD1QN8QTrSHyCjgWCfdTvVcMp8tFDEp+pIvkRpAjQjBY
 A92iiwd6syDAXMtPxPicKDD9M04/061zWRAj612iPa0dDZ4RdrYbzH3F3KOoFqfjUgRD
 qpAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IJulLnUZRloj+JIxnR5PX7+lFtVvSPhO7Tu13HJYnvU=;
 b=sXrUIPy1m9ugYCoMLh/2gJmxmZHYPHUYRZEahguI6p6HwaTVa2ofKcFwFTdGszb1mq
 MAjJAR0uvzIwMH1qJ3Gc52Sj1O5o+04iTLaLqxb2vC5l+4sagdBILDNWdGmfYVIFP9rt
 RDF9ZBHa11a6ZQNfITAmIBLhG7fLeSZFa6flgqEyfQJO32sBPAIN2nNjZHasONrx2vFR
 Ifxsl65YPnzxDWLu8O9VsDwyk8rCREeFKOq1fiQ23RXJSc3fNVyw74wn5/EFSNHpijkz
 biMpdoJOTPbv8sv5wRxevaj2QfvPyP6w7ti7o7C9UACZW7bOWjiaDXwqwGS4Ta/JR8rA
 x+OA==
X-Gm-Message-State: AOAM533PP5/29ngN/HihhE3gENm+yNon3Qax+IeGzHjCOFnt5xN8IgpD
 1vFji5whNhujVbdNnWk1wjAw5A7x7HijimVRpkE=
X-Google-Smtp-Source: ABdhPJyQUomgfLA7nRAd4EOSN4Oha3W9IbfJZwzhpRCnFkv6aM3OBZwCVVf3XV3dExbRxr/jNo1Fu1yMwERJL2QyiKQ=
X-Received: by 2002:adf:fc0a:: with SMTP id i10mr22548014wrr.111.1600197403261; 
 Tue, 15 Sep 2020 12:16:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200909130720.105234-1-zhengbin13@huawei.com>
 <1fce0f2a-3777-e6d8-5a09-30261f843cfd@amd.com>
In-Reply-To: <1fce0f2a-3777-e6d8-5a09-30261f843cfd@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 15 Sep 2020 15:16:32 -0400
Message-ID: <CADnq5_NoeFbBAMT6s_ictVXsUc2tx1U48MLxnMbAr2Sd58jyYA@mail.gmail.com>
Subject: Re: [PATCH -next 0/8] drm/amd/amdgpu: fix comparison pointer to bool
 warning
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: yi.zhang@huawei.com, Dave Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Zheng Bin <zhengbin13@huawei.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSBxdWVzdGlvbiB0aGUgdmFsdWUgb2YgdGhlc2Ugd2FybmluZ3MuICBXaHkgZXZlbiBoYXZlIGEg
Ym9vbGVhbiB0eXBlCmlmIHlvdSBhcmUgZ29pbmcgdG8gZ2V0IHdhcm5pbmdzIHdoZW4geW91IHVz
ZSB0aGVtLi4uClRoYXQgc2FpZCwgYXBwbGllZCB0byBhdm9pZCBnZXR0aW5nIHRoZXNlIHBhdGNo
ZXMgYWdhaW4gYW5kIGFnYWluCmV2ZXJ5IHRpbWUgc29tZW9uZSBzZWVzIHRoaXMuCgpBbGV4CgpP
biBXZWQsIFNlcCA5LCAyMDIwIGF0IDk6MjEgQU0gQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+IGZvciB0aGUgc2VyaWVzLgo+Cj4gQW0gMDkuMDkuMjAg
dW0gMTU6MDcgc2NocmllYiBaaGVuZyBCaW46Cj4gPiBaaGVuZyBCaW4gKDgpOgo+ID4gICAgZHJt
L2FtZC9hbWRncHU6IGZpeCBjb21wYXJpc29uIHBvaW50ZXIgdG8gYm9vbCB3YXJuaW5nIGluIGdm
eF92OV8wLmMKPiA+ICAgIGRybS9hbWQvYW1kZ3B1OiBmaXggY29tcGFyaXNvbiBwb2ludGVyIHRv
IGJvb2wgd2FybmluZyBpbiBnZnhfdjEwXzAuYwo+ID4gICAgZHJtL2FtZC9hbWRncHU6IGZpeCBj
b21wYXJpc29uIHBvaW50ZXIgdG8gYm9vbCB3YXJuaW5nIGluIHNkbWFfdjVfMC5jCj4gPiAgICBk
cm0vYW1kL2FtZGdwdTogZml4IGNvbXBhcmlzb24gcG9pbnRlciB0byBib29sIHdhcm5pbmcgaW4g
c2RtYV92NV8yLmMKPiA+ICAgIGRybS9hbWQvYW1kZ3B1OiBmaXggY29tcGFyaXNvbiBwb2ludGVy
IHRvIGJvb2wgd2FybmluZyBpbiBzaS5jCj4gPiAgICBkcm0vYW1kL2FtZGdwdTogZml4IGNvbXBh
cmlzb24gcG9pbnRlciB0byBib29sIHdhcm5pbmcgaW4gdXZkX3Y2XzAuYwo+ID4gICAgZHJtL2Ft
ZC9hbWRncHU6IGZpeCBjb21wYXJpc29uIHBvaW50ZXIgdG8gYm9vbCB3YXJuaW5nIGluCj4gPiAg
ICAgIGFtZGdwdV9hdHB4X2hhbmRsZXIuYwo+ID4gICAgZHJtL2FtZC9hbWRncHU6IGZpeCBjb21w
YXJpc29uIHBvaW50ZXIgdG8gYm9vbCB3YXJuaW5nIGluIHNkbWFfdjRfMC5jCj4gPgo+ID4gICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYXRweF9oYW5kbGVyLmMgfCA0ICsrLS0K
PiA+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgICAgICAgICAgIHwg
MiArLQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jICAgICAgICAg
ICAgfCAyICstCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jICAg
ICAgICAgICB8IDQgKystLQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y1
XzAuYyAgICAgICAgICAgfCAyICstCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Nk
bWFfdjVfMi5jICAgICAgICAgICB8IDIgKy0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvc2kuYyAgICAgICAgICAgICAgICAgIHwgMiArLQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS91dmRfdjZfMC5jICAgICAgICAgICAgfCA0ICsrLS0KPiA+ICAgOCBmaWxlcyBjaGFu
Z2VkLCAxMSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKPiA+Cj4gPiAtLQo+ID4gMi4y
Ni4wLjEwNi5nOWZhZGVkZAo+ID4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
