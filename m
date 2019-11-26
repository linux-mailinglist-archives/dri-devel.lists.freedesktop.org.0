Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FF710A1F1
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 17:23:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA0E6E1AA;
	Tue, 26 Nov 2019 16:23:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD5596E1AA;
 Tue, 26 Nov 2019 16:23:52 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id 4so19916863wro.7;
 Tue, 26 Nov 2019 08:23:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SqVK1rUp5UtzJClBKJOgHqdUJMmWis3RBtvucLshmlo=;
 b=tGdijkOYLw9PLMmCxhdZvGAvI8YJ9mWgFZoBpW0V59V4mkn2JUE8anTRgqwHWMDPFi
 sW5v0CBu5wnhedCFIZXrcOdE6fhFnAmP6/ipUp4o1RZsf9Y1pMceaDxtKFc1xzCRF6qa
 V7UU7AMZ0sND/plx5AXNsQ23rcuOLJeAS8vZMPVtLpoCWfOxPfc4T4z6INPq4MWaQuFG
 d0d9TrIdOVKVEVGfAXCsUVlakJj4t9/gtwl+LMrLLLD9EDSoc0IVaVnJqedaSbIAN79P
 PfaxuukUIO3L0CKpsKYSB3yktCw1/u+YqSu621BzCaP67egjXumKqvpulnvkYmnr8K8U
 narw==
X-Gm-Message-State: APjAAAWYjcxSAkuoZ6DBdNowwnaPuMkeGxHs1ihkeB9ifMcd30Ss/57l
 v//SlDDK0x6m++HOlDLz4zLcHL9MDW9FmHlCuOjHpw==
X-Google-Smtp-Source: APXvYqx/4aCgU1TY8rQD+RRf5p+AdIHEziucqDIoe9tFBgToO/cDoZMMlHEqpWO63vySWN+i6pv+fbtjEFS2hfw3CaU=
X-Received: by 2002:adf:f54c:: with SMTP id j12mr20010569wrp.40.1574785431496; 
 Tue, 26 Nov 2019 08:23:51 -0800 (PST)
MIME-Version: 1.0
References: <20191126121029.3tye7e3gyduxryfr@kili.mountain>
In-Reply-To: <20191126121029.3tye7e3gyduxryfr@kili.mountain>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 26 Nov 2019 11:23:38 -0500
Message-ID: <CADnq5_MB-M_AdArX3Bvg765iMiTR-rJLUpJjDmA=azrXAYTa-g@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix a bug in jpeg_v1_0_start()
To: Dan Carpenter <dan.carpenter@oracle.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=SqVK1rUp5UtzJClBKJOgHqdUJMmWis3RBtvucLshmlo=;
 b=RIRHSz4A9mBUNbvlVIvad78dxTLh3dnIxYdMNyKBbqGSgJA/u9CkLt1NLqkG2YUz+x
 bZkUxzGhRiyFDr4I5Ihv699xm540fVYJx2BqiBZ8YdPg8C7Pvk1UM7AbwcTQlzr/s6Ap
 gt9s9X2jur2rG8nbuHGb1o9VLSX9kB4lFByxFpUwCl7ggPV5Ug0aA5FezG7prCvMjsAt
 bdT0PWbDBOzFFE54zP6j6d+iWDpXWYdmvH0aqN6Hx+IJKR5rFJXRUyYgL33qhroTsk8b
 WdaARZPGCTULIrAdSQxGs1y2QUTa3Ylpe9ti2QFNp/G/WHcWjMsP4sGxV3OxmMF7TjZb
 JBvw==
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Leo Liu <leo.liu@amd.com>,
 Christian K??nig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMjYsIDIwMTkgYXQgNzoxMCBBTSBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVu
dGVyQG9yYWNsZS5jb20+IHdyb3RlOgo+Cj4gT3JpZ2luYWxseSB0aGUgbGFzdCBXUkVHMzJfU09D
MTUoKSB3YXMgYSBwYXJ0IG9mIHRoZSBpZiBzdGF0ZW1lbnQgYmxvY2sKPiBidXQgdGhlIGN1cmx5
IGJyYWNlcyBhcmUgb24gdGhlIHdyb25nIGxpbmUuCj4KPiBGaXhlczogYmIwZGI3MGYzZjc1ICgi
ZHJtL2FtZGdwdTogc2VwYXJhdGUgSlBFRzEuMCBjb2RlIG91dCBmcm9tIFZDTjEuMCIpCj4gU2ln
bmVkLW9mZi1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgoKQXBw
bGllZC4gIFRoYW5rcyEKCkFsZXgKCj4gLS0tCj4gRnJvbSBzdGF0aWMgYW5hbHlzaXMgKFNtYXRj
aCkuICBOb3QgdGVzdGVkLgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2pwZWdfdjFf
MC5jIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2pwZWdfdjFf
MC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvanBlZ192MV8wLmMKPiBpbmRleCA1NTM1
MDZkZjA3N2QuLmExNDE0MDhkZmIyMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9qcGVnX3YxXzAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2pw
ZWdfdjFfMC5jCj4gQEAgLTUyMiw3ICs1MjIsOCBAQCB2b2lkIGpwZWdfdjFfMF9zdGFydChzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgaW50IG1vZGUpCj4gICAgICAgICAgICAgICAgIFdSRUcz
Ml9TT0MxNShKUEVHLCAwLCBtbVVWRF9MTUlfSlJCQ19SQl82NEJJVF9CQVJfSElHSCwgdXBwZXJf
MzJfYml0cyhyaW5nLT5ncHVfYWRkcikpOwo+ICAgICAgICAgICAgICAgICBXUkVHMzJfU09DMTUo
SlBFRywgMCwgbW1VVkRfSlJCQ19SQl9SUFRSLCAwKTsKPiAgICAgICAgICAgICAgICAgV1JFRzMy
X1NPQzE1KEpQRUcsIDAsIG1tVVZEX0pSQkNfUkJfV1BUUiwgMCk7Cj4gLSAgICAgICB9ICAgICAg
IFdSRUczMl9TT0MxNShKUEVHLCAwLCBtbVVWRF9KUkJDX1JCX0NOVEwsIFVWRF9KUkJDX1JCX0NO
VExfX1JCX1JQVFJfV1JfRU5fTUFTSyk7Cj4gKyAgICAgICAgICAgICAgIFdSRUczMl9TT0MxNShK
UEVHLCAwLCBtbVVWRF9KUkJDX1JCX0NOVEwsIFVWRF9KUkJDX1JCX0NOVExfX1JCX1JQVFJfV1Jf
RU5fTUFTSyk7Cj4gKyAgICAgICB9Cj4KPiAgICAgICAgIC8qIGluaXRpYWxpemUgd3B0ciAqLwo+
ICAgICAgICAgcmluZy0+d3B0ciA9IFJSRUczMl9TT0MxNShKUEVHLCAwLCBtbVVWRF9KUkJDX1JC
X1dQVFIpOwo+IC0tCj4gMi4xMS4wCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
