Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CF01B944
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 16:56:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EBB38972D;
	Mon, 13 May 2019 14:56:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B3418972D
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 14:56:30 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D8D312146F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 14:56:29 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id m32so12007764qtf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 07:56:29 -0700 (PDT)
X-Gm-Message-State: APjAAAXJrIpB/GaFO58F5LshvZ3tIMqLdKWN9Whh1dTE9z/2RZwdq5d8
 JVMSzlMzkdjLZtIrVzqpgXeC9ldENARSzo3k8g==
X-Google-Smtp-Source: APXvYqx3TUVas20VXhQI7JUnuJZgbmCUb7Ybz7s6QU0UhDpkeaoYIRp0leer5RB+/pONnGmpl5GRwQL69uTSyWDwlrU=
X-Received: by 2002:a0c:d2f2:: with SMTP id x47mr23231975qvh.90.1557759389164; 
 Mon, 13 May 2019 07:56:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190507080405.GA9436@mwanda>
 <20190509082151.8823-1-tomeu.vizoso@collabora.com>
In-Reply-To: <20190509082151.8823-1-tomeu.vizoso@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 13 May 2019 09:56:18 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ9wd73i+zc4bnF4CdC_2Aa9u7xN1PQTUNbaaT=i1BVqg@mail.gmail.com>
Message-ID: <CAL_JsqJ9wd73i+zc4bnF4CdC_2Aa9u7xN1PQTUNbaaT=i1BVqg@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Only put sync_out if non-NULL
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1557759390;
 bh=DPb0oP/MTVPYW19qM5+S/ZobSstLVv1G9/bvsnkeDh0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IQT90J1gBxETvADWSS2inwwXRWznQ68wmiBOUpXmxy+S8GGk8sVYebiGP2VIl6rEx
 bIIm0wsV5jep1nrj7BGQzqT7mBulT6ULTbUx9/fPeTYUZuMzOOvG3L9ivcQLainTj9
 Y6Olg2Lni78NM+ltXnD+030ujuRRyBkbMT6YbASs=
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgOSwgMjAxOSBhdCAzOjIyIEFNIFRvbWV1IFZpem9zbyA8dG9tZXUudml6b3Nv
QGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+Cj4gRGFuIENhcnBlbnRlcidzIHN0YXRpYyBhbmFseXNp
cyB0b29sIHJlcG9ydGVkOgo+Cj4gZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Ry
di5jOjIyMiBwYW5mcm9zdF9pb2N0bF9zdWJtaXQoKQo+IGVycm9yOiB3ZSBwcmV2aW91c2x5IGFz
c3VtZWQgJ3N5bmNfb3V0JyBjb3VsZCBiZSBudWxsIChzZWUgbGluZSAyMTYpCj4KPiBJbmRlZWQs
IHN5bmNfb3V0IGNvdWxkIGJlIE5VTEwgaWYgdXNlcnNwYWNlIGRvZXNuJ3Qgc2VuZCBhIHN5bmMg
b2JqZWN0Cj4gSUQgZm9yIHRoZSBvdXQgZmVuY2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBUb21ldSBW
aXpvc28gPHRvbWV1LnZpem9zb0Bjb2xsYWJvcmEuY29tPgo+IFJlcG9ydGVkLWJ5OiBEYW4gQ2Fy
cGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+Cj4gTGluazogaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvZHJpLWRldmVsLzIwMTktTWF5LzIxNzAxNC5odG1sCj4g
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYyB8IDMgKystCj4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCkFwcGxpZWQu
CgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
