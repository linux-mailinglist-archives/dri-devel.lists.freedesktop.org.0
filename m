Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF822AC5A8
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 21:00:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E1A3892CF;
	Mon,  9 Nov 2020 20:00:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1BB0892CF
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 20:00:00 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id h62so673969wme.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 12:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=iSLk3+x7uenqlILFpaNoxyCB9G64i4wec0N4zPVtLds=;
 b=NBO0ty9u54emHjnfEXXnFOBSllklLV+aYFoqGVp5cQ9mAb56Dl+sd3zn/rP+aUSIzf
 DFCvXXhk001k2PTIsBSRdUzu2sUFlU6XVcNPdNhZsFvci9JTb2r6z/4FueX9Hq9e1MfU
 lzhOt4sbxh89rgwgXrX9BXrkVBx0pbqW9jaUjGALtGIA5+q9QPjAPt5ZWJlCD671pgeA
 bjemtpPIbR9qJ9S+0a7d+rfrgx6BcI5+GNi1mIE1yBCsZ4wudlv+S6WRhNhDnN6CH8nL
 FC8JRh+VSLieTqgZWyqK2OBEZ0sRn95k2W9ULT0oMOvw18vmnxJ4muh6Cb6rF+ToKQIv
 iOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=iSLk3+x7uenqlILFpaNoxyCB9G64i4wec0N4zPVtLds=;
 b=HcqnVGRyEj4Pjapp8pvBgwZ6CqCKm9xVrU8+azrB3GGqhgcktdJC1irHaeDbt1Vpqf
 tyrJdoWiw0IhdLT+gZ4cJDO3XX93ORl+t26e3hcJZ8Gqkk+c0Z/eII8jkFS7lEDl5n00
 qInaaKrALx9o9QY1c/6Pb0jo3a76hya0D06cPFjOc8rtYgabxIuZ+m/o7va9AXwoSqG0
 HY8U+awY8QNeVjmZqAUHnmjNi5wtbHes3j9LnUpJel+2rbx/PtJxgT73yjgrTbGlZ5n8
 KQ9uxv6cZnKhuF+n0FkfVoADHxO9iWNAxnKST8xPoLVQKeKFTR8cBaw3iZjbU7vuaq+d
 UABg==
X-Gm-Message-State: AOAM531LY2Tn7a7qCE38E7yYu3540z0px7mDVb5pnDwONUhr4OH3bIYm
 Jdc4CyeUCWVNenGm3M1FX+2LI4FypBusadaH
X-Google-Smtp-Source: ABdhPJwldywwbJ+oLDqj/fDJgp5SEWiJ5ZwxUHvawP8CtF53/49IYzNhHipfLfFh1313dpVLWLMYLg==
X-Received: by 2002:a1c:61c2:: with SMTP id v185mr839625wmb.152.1604951999546; 
 Mon, 09 Nov 2020 11:59:59 -0800 (PST)
Received: from dell ([91.110.221.139])
 by smtp.gmail.com with ESMTPSA id f23sm463349wmb.43.2020.11.09.11.59.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 11:59:58 -0800 (PST)
Date: Mon, 9 Nov 2020 19:59:57 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 17/19] drm/radeon/radeon_kms: Fix misnaming of
 'radeon_info_ioctl's dev param
Message-ID: <20201109195957.GB2063125@dell>
References: <20201106214949.2042120-1-lee.jones@linaro.org>
 <20201106214949.2042120-18-lee.jones@linaro.org>
 <CADnq5_Nys7igVo3sgzK0D4hnm=RHMrEM7Xty80jGROu_sy5svA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_Nys7igVo3sgzK0D4hnm=RHMrEM7Xty80jGROu_sy5svA@mail.gmail.com>
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
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAwOSBOb3YgMjAyMCwgQWxleCBEZXVjaGVyIHdyb3RlOgoKPiBPbiBGcmksIE5vdiA2
LCAyMDIwIGF0IDQ6NTAgUE0gTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4gd3JvdGU6
Cj4gPgo+ID4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6
Cj4gPgo+ID4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2ttcy5jOjIyNjogd2Fybmlu
ZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnZGV2JyBub3QgZGVzY3JpYmVkIGluICdy
YWRlb25faW5mb19pb2N0bCcKPiA+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9rbXMu
YzoyMjY6IHdhcm5pbmc6IEV4Y2VzcyBmdW5jdGlvbiBwYXJhbWV0ZXIgJ3JkZXYnIGRlc2NyaXB0
aW9uIGluICdyYWRlb25faW5mb19pb2N0bCcKPiA+Cj4gPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4
YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+ID4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPgo+ID4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5p
ZT4KPiA+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gPiBDYzogYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3Jn
Pgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fa21zLmMgfCAyICst
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2ttcy5jIGIvZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fa21zLmMKPiA+IGluZGV4IDBkOGZiYWJmZmNlYWQu
LjIxYzIwNjc5NWMzNjQgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3Jh
ZGVvbl9rbXMuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fa21zLmMK
PiA+IEBAIC0yMTMsNyArMjEzLDcgQEAgc3RhdGljIHZvaWQgcmFkZW9uX3NldF9maWxwX3JpZ2h0
cyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+ID4gIC8qKgo+ID4gICAqIHJhZGVvbl9pbmZvX2lv
Y3RsIC0gYW5zd2VyIGEgZGV2aWNlIHNwZWNpZmljIHJlcXVlc3QuCj4gPiAgICoKPiA+IC0gKiBA
cmRldjogcmFkZW9uIGRldmljZSBwb2ludGVyCj4gPiArICogQGRldjogcmFkZW9uIGRldmljZSBw
b2ludGVyCj4gCj4gVGhpcyBzaG91bGQgYmU6Cj4gKyAqIEBkZXY6IGRybSBkZXZpY2UgcG9pbnRl
cgoKTWFrZXMgc2Vuc2UuICBJZiB5b3UgZG9uJ3QgZmFuY3kgZml4aW5nIHRoaXMgdXAsIEknbGwg
c2VuZCBvdXQgYQpmaXgtdXAgaW4gYSBmZXcgZGF5cy4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaW
r10KU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg
4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNl
Ym9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
