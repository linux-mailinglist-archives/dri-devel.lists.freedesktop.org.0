Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C92429898E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 04:42:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0446EA54;
	Thu, 22 Aug 2019 02:42:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1750E6EA54;
 Thu, 22 Aug 2019 02:42:35 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c3so3858791wrd.7;
 Wed, 21 Aug 2019 19:42:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TZTqUkxfZYE8+T40PWA8Sviu0JhKS/WcBoRu0Cn0BrM=;
 b=cTKUk0QzCjUw0FDupoxwvWX3A9+KwR8iGouHa5gDQxuF/8YBY8Fz2mQaVjnVWoR5/L
 arUqjqbakQ40QMGmJA3czykzxz0J724uxW5gkyk/SHgt8C3TGhb28WVBjBwNTqtpUCof
 q/uRmjsNzsp1o6PdlMTBkDQbGaJ2wyvspS/rjCPm9wbWY+HKyMRiRzHkUCknih27HGNI
 nAoAbWd3yBFg+QhQfo6FoeviV0p/+rnPCpoDywVFJM4g1k5BsPrcy1XN5EaLnd1YEflS
 xRt3PKbJzqsgSuAz9vyHY32SJeoQdetUkaZufKtJAPmni3naYobWZAi0mcv1Pljk/iaw
 JfCA==
X-Gm-Message-State: APjAAAUO14pny9gMA7mJBLPtYh2JfWZ3xm32kg6sR5XXBc9xfdcuTcIK
 q6fpd9wer/cSDYIxi+aNXGpLwuMDVm4XNnMqt+E=
X-Google-Smtp-Source: APXvYqxSqm3tWIWgCc/6KxQxwfATvNMi8h6Sxb5iMQ/oDJF0Re6IhFTmtGx5rG71zlRanlu/EWaTgaaMoJ/HYJ5KVOU=
X-Received: by 2002:a5d:6ccd:: with SMTP id c13mr37920862wrc.4.1566441753566; 
 Wed, 21 Aug 2019 19:42:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190726075131.14688-1-yuehaibing@huawei.com>
In-Reply-To: <20190726075131.14688-1-yuehaibing@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 21 Aug 2019 22:42:21 -0400
Message-ID: <CADnq5_PNA5L=O2=r22JGZ=HU4V5F_D6LMeo85mW+3KvvY1=QeQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: remove duplicated include from dc_link.c
To: YueHaibing <yuehaibing@huawei.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=TZTqUkxfZYE8+T40PWA8Sviu0JhKS/WcBoRu0Cn0BrM=;
 b=mc6wu6La8/4N/vQ/oGhBjfkxaO0ZCMtFFiLDtkCyj7U5FVSV5+dN9NaY5PO9Il5wk5
 TU3LAGPC6vYjU8+3nAVhF8ITJC6ap5ALHDs6MXIJ9VbYawneMwqAxE/I0Vzmw9Ou70fx
 MhWbDwOFYVgHAeVoTodS4nb4F9gon/cnu85XusFz2tnUjLPE7Fg2TL/Xdvqf3QrnhTIP
 CVDH6HLy4/aCWJJbj6CM+a2u3YcqxqFdFmC1gx05144uk1xPCEMyL6a36wYpPaoNmr6U
 Aq11tSItE1YzqzBImzTNQe015vQK0I4J1yvAdhx4k8Yx94yMdNWhgriyMaxvTPhr+lr8
 gMvQ==
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
Cc: "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gdGhhbmtzIQoKQWxleAoKT24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgNTo0MiBBTSBZ
dWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+IHdyb3RlOgo+Cj4gUmVtb3ZlIGR1cGxp
Y2F0ZWQgaW5jbHVkZS4KPgo+IFJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2Vp
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+
Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYyB8
IDQgLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMKPiBpbmRleCAxOTNkNmYxLi5h
MTQ3ODVkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3Jl
L2RjX2xpbmsuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2Rj
X2xpbmsuYwo+IEBAIC00NSwxMCArNDUsNiBAQAo+ICAjaW5jbHVkZSAiZHBjZF9kZWZzLmgiCj4g
ICNpbmNsdWRlICJkbWN1LmgiCj4gICNpbmNsdWRlICJody9jbGtfbWdyLmgiCj4gLSNpZiBkZWZp
bmVkKENPTkZJR19EUk1fQU1EX0RDX0RDTjJfMCkKPiAtI2luY2x1ZGUgInJlc291cmNlLmgiCj4g
LSNlbmRpZgo+IC0jaW5jbHVkZSAiaHcvY2xrX21nci5oIgo+Cj4gICNkZWZpbmUgRENfTE9HR0VS
X0lOSVQobG9nZ2VyKQo+Cj4gLS0KPiAyLjcuNAo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
