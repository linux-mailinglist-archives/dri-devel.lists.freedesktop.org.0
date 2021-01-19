Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7084A2FC4F7
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 00:42:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3D06E040;
	Tue, 19 Jan 2021 23:42:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC77C6E040
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 23:42:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6DBB02310D
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 23:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611099764;
 bh=vfWq8ORmisMymcb7jEgSy/+PLX1UbYJNGh+DIqiVZ3c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cYz2SiA7iMr/9YcqooJQXawqQMzYzYTU3o97XUGd//h1JT+reDI5GVwdi8mDqCnB9
 871S2NE8UrbERiInElunFQYPil6LVsNZEatFEYXrLZWRH6OtHMVUpq9r86iX3PIIoG
 Q0Fq7sExupofbMKTPeBCpLwHGhalDrNDVv2iiWMP/IcIgCqalcet3yh5YmX/X1b2Qy
 IeIKEADLH+L5ezQuqMyVlJ/BxVXNTVLTb7XmbVnSxX39Y1xYfN41ThRbZbYUbRnMb6
 9vdfg4G9kPSGeJbLpfycTgh8ox85Tc2msxKaVD4OLuNxQL+t8rsquKQc309aYB183N
 /6V8hKOsw50qQ==
Received: by mail-ej1-f47.google.com with SMTP id g12so31005104ejf.8
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 15:42:44 -0800 (PST)
X-Gm-Message-State: AOAM531PYEZL+r+RpfbaVdXFXHS5cVWA7YbQpOFSxZ0i7PKBDZxi+87s
 JgVfiM6prGOVNDdBv3SF8VgP++ac0SM6BFwgWA==
X-Google-Smtp-Source: ABdhPJy5pH3VJgW9xcAFQp76ROjf3pDBkBxpmVLZMF92SXietZmMe2rKOGmeI13Kif0jfu6KtXkSobYRfIp0pn/TCb8=
X-Received: by 2002:a17:907:d8b:: with SMTP id
 go11mr4451807ejc.303.1611099762927; 
 Tue, 19 Jan 2021 15:42:42 -0800 (PST)
MIME-Version: 1.0
References: <20210106231729.17173-1-chunkuang.hu@kernel.org>
In-Reply-To: <20210106231729.17173-1-chunkuang.hu@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 20 Jan 2021 07:42:31 +0800
X-Gmail-Original-Message-ID: <CAAOTY__OmMnXL5gvso4meUfQS-xnKA6EErhM3bL3HE4zh6JMcQ@mail.gmail.com>
Message-ID: <CAAOTY__OmMnXL5gvso4meUfQS-xnKA6EErhM3bL3HE4zh6JMcQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Share mtk mutex driver for both DRM and MDP
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaWvCAyMDIx5bm0MeaciDfm
l6Ug6YCx5ZubIOS4iuWNiDc6MTflr6vpgZPvvJoKPgo+IG10ayBtdXRleCBpcyBhIGRyaXZlciB1
c2VkIGJ5IERSTSBhbmQgTURQIFsxXSwgc28gdGhpcyBzZXJpZXMgbW92ZQo+IG10ayBtdXRleCBk
cml2ZXIgZnJvbSBEUk0gZm9sZGVyIHRvIHNvYyBmb2xkZXIsIHNvIGl0IGNvdWxkIGJlIHVzZWQK
PiBieSBEUk0gYW5kIE1EUC4KCkFwcGxpZWQgWzEvNV0gfiBbNC81XSB0byBtZWRpYXRlay1kcm0t
bmV4dCBbMV0uCgpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvY2h1bmt1YW5nLmh1L2xpbnV4LmdpdC9sb2cvP2g9bWVkaWF0ZWstZHJtLW5leHQKClJl
Z2FyZHMsCkNodW4tS3VhbmcuCgo+Cj4gQ2hhbmdlcyBpbiB2MjoKPiAxLiBSZWJhc2Ugb250byBt
ZWRpYXRlay1kcm0tbmV4dCBbMl0uCj4gMi4gRXhwb3J0IHN5bWJvbCBmb3IgbXRrLW11dGV4IEFQ
SS4KPgo+IFsxXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExMTQwNzUxLwo+
IFsyXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaHVu
a3VhbmcuaHUvbGludXguZ2l0L2xvZy8/aD1tZWRpYXRlay1kcm0tbmV4dAo+Cj4gQ0sgSHUgKDUp
Ogo+ICAgZHJtL21lZGlhdGVrOiBSZW1vdmUgcmVkdW5kYW50IGZpbGUgaW5jbHVkaW5nCj4gICBk
cm0vbWVkaWF0ZWs6IFJlbmFtZSBmaWxlIG10a19kcm1fZGRwIHRvIG10a19tdXRleAo+ICAgZHJt
L21lZGlhdGVrOiBDaGFuZ2UgZGlzcC9kZHAgdGVybSB0byBtdXRleCBpbiBtdGsgbXV0ZXggZHJp
dmVyCj4gICBkcm0vbWVkaWF0ZWs6IEF1dG9tYXRpY2FsbHkgc2VhcmNoIHVuY2xhaW1lZCBtdGsg
bXV0ZXggaW4KPiAgICAgbXRrX211dGV4X2dldCgpCj4gICBzb2MgLyBkcm06IG1lZGlhdGVrOiBN
b3ZlIG10ayBtdXRleCBkcml2ZXIgdG8gc29jIGZvbGRlcgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9NYWtlZmlsZSAgICAgICAgICAgICB8ICAgMSAtCj4gIGRyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2NydGMuYyAgICAgICB8ICAzMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9kZHAuaCAgICAgICAgfCAgMjggLS0KPiAgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fZHJ2LmMgICAgICAgIHwgICAzIC0KPiAgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fZHJ2LmggICAgICAgIHwgICAxIC0KPiAgZHJpdmVycy9zb2MvbWVk
aWF0ZWsvTWFrZWZpbGUgICAgICAgICAgICAgICAgIHwgICAxICsKPiAgLi4uL21lZGlhdGVrL210
ay1tdXRleC5jfSAgICAgICAgICAgICAgICAgICAgIHwgMzI4ICsrKysrKysrKy0tLS0tLS0tLQo+
ICBpbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstbXV0ZXguaCAgICAgICAgfCAgMjYgKysK
PiAgOCBmaWxlcyBjaGFuZ2VkLCAyMTIgaW5zZXJ0aW9ucygrKSwgMjA4IGRlbGV0aW9ucygtKQo+
ICBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRw
LmgKPiAgcmVuYW1lIGRyaXZlcnMve2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYyA9PiBz
b2MvbWVkaWF0ZWsvbXRrLW11dGV4LmN9ICg1MyUpCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNs
dWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstbXV0ZXguaAo+Cj4gLS0KPiAyLjE3LjEKPgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
