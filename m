Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A15263D95
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 08:50:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4EF189FCA;
	Thu, 10 Sep 2020 06:50:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F2486E203
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 06:50:09 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id x23so4462391wmi.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Sep 2020 23:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=6K8nbSBvOysqmngdwTYc4SuAGeryD94ysxVFYA+CYNQ=;
 b=lx6Vm/zhbogm29Nsfjoo2QC11UF10KJkfCORkCabZpNESTffgQrIk4NEZVy5uNQBJ2
 BdSTzDyg8NGbuwMDzHa8GXPNRMyGRuQ2a6IqN8cdEnTU5z9gPPacr6Se2hKTjG9aHZS3
 7Eh14dxJ/Xmnx5KGgV1HL4tbryd3rxwh+GkoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=6K8nbSBvOysqmngdwTYc4SuAGeryD94ysxVFYA+CYNQ=;
 b=bbtDk/TRTJ2GhlmT1S2oQ7GJRrGE9YiUiNwNxw+hg70lI1OK6v8CH0Mh1mwuRIzEwl
 vlnj33Dr/ID6BjaWLnSKSMCyHmRCQ/pY5mTXV58eC8aZSH6gypwerwoJqrUoULJU/asd
 0eTRlUABOjwxCoP7/ba8w/22KnDknbPAk4tEsa5KRB2rq/Qq93Xq5768KHrz9fxXHGdO
 CzCtgAYhx+JAXJa9/d/ih/GD7fSdVNS9S0YScx+ugLeKDD3clbWp4MmN8KxnR2Iq8cBM
 +qL8WFGZKqiZnPxj9rrfg0yKaYiTyKlHefhy750T1xcc/OPyj3hkiTeWrkvf48Cd0A4h
 C2ZA==
X-Gm-Message-State: AOAM53369IMMtbrnvrKU0k/L3CXvZjGK5AWSswYwH/Id6wbQdDG9dK5c
 nK03BGoAiKFmpI30m/C029wGRQ==
X-Google-Smtp-Source: ABdhPJwTurRXB/NpA+DGJ+d8NsfFwEMvmjFxCd1mQhdq6VDqHkm/1nJx5Jp51b/sWVcVTI8e+ubShA==
X-Received: by 2002:a7b:c182:: with SMTP id y2mr6693155wmi.21.1599720608240;
 Wed, 09 Sep 2020 23:50:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a83sm2084506wmh.48.2020.09.09.23.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 23:50:07 -0700 (PDT)
Date: Thu, 10 Sep 2020 08:50:05 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] drm/panel: s6e63m0: Add missing MODULE_LICENSE
Message-ID: <20200910065005.GD438822@phenom.ffwll.local>
Mail-Followup-To: YueHaibing <yuehaibing@huawei.com>,
 thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 linus.walleij@linaro.org, paul@crapouillou.net,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200909134137.32284-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200909134137.32284-1-yuehaibing@huawei.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, paul@crapouillou.net,
 thierry.reding@gmail.com, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMDksIDIwMjAgYXQgMDk6NDE6MzdQTSArMDgwMCwgWXVlSGFpYmluZyB3cm90
ZToKPiBLYnVpbGQgd2FybnMgd2hlbiB0aGlzIGZpbGUgaXMgYnVpbHQgYXMgYSBsb2FkYWJsZSBt
b2R1bGU6Cj4gCj4gV0FSTklORzogbW9kcG9zdDogbWlzc2luZyBNT0RVTEVfTElDRU5TRSgpIGlu
IGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zYW1zdW5nLXM2ZTYzbTAubwo+IAo+IEFkZCB0
aGUgbWlzc2luZyBsaWNlbnNlL2F1dGhvci9kZXNjcmlwdGlvbiB0YWdzLgo+IAo+IEZpeGVzOiBi
N2IyM2U0NDc2ODcgKCJkcm0vcGFuZWw6IHM2ZTYzbTA6IEJyZWFrIG91dCBTUEkgdHJhbnNwb3J0
IikKPiBTaWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+CgpU
aGFua3MgZm9yIHlvdXIgcGF0Y2gsIHB1c2hlZCB0byBkcm0tbWlzYy1uZXh0LgotRGFuaWVsCgo+
IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2Ftc3VuZy1zNmU2M20wLmMgfCA0
ICsrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2Ftc3VuZy1zNmU2M20wLmMgYi9kcml2ZXJz
L2dwdS9kcm0vcGFuZWwvcGFuZWwtc2Ftc3VuZy1zNmU2M20wLmMKPiBpbmRleCAwNDQyOTRhYWZl
MjcuLjNlZWU2N2UyZDg2YSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFu
ZWwtc2Ftc3VuZy1zNmU2M20wLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwt
c2Ftc3VuZy1zNmU2M20wLmMKPiBAQCAtNTM0LDMgKzUzNCw3IEBAIGludCBzNmU2M20wX3JlbW92
ZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gIAlyZXR1cm4gMDsKPiAgfQo+ICBFWFBPUlRfU1lNQk9M
X0dQTChzNmU2M20wX3JlbW92ZSk7Cj4gKwo+ICtNT0RVTEVfQVVUSE9SKCJQYXdlxYIgQ2htaWVs
IDxwYXdlbC5taWtvbGFqLmNobWllbEBnbWFpbC5jb20+Iik7Cj4gK01PRFVMRV9ERVNDUklQVElP
TigiczZlNjNtMCBMQ0QgRHJpdmVyIik7Cj4gK01PRFVMRV9MSUNFTlNFKCJHUEwgdjIiKTsKPiAt
LSAKPiAyLjE3LjEKPiAKPiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJ
bnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
