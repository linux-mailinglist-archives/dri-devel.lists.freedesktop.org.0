Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E7C1C7145
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 15:01:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2FB66E1E5;
	Wed,  6 May 2020 13:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39FB76E1E5
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 13:01:45 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CECB5206DB
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 13:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588770105;
 bh=sQPtx1IaJT17mYcGEwphgUj7Th54XCa2l0rTr5A6suc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=d4dRvoo6myiw+4TGn6t+D3ZiwSj4ULil+cbsBGYjE7NzgGwmn3LSudeZGa3rVUVNo
 Q/7BO5jc29DtgPLDymu8hPMrA9iuC6YfpUjlC4oB/2X/ujB6bqKCPg+nIxR2+eeW0X
 8wpt+LXVS+Vn8MlY294ANKu5qUATl6utH+qt9y8w=
Received: by mail-ej1-f41.google.com with SMTP id s3so1239866eji.6
 for <dri-devel@lists.freedesktop.org>; Wed, 06 May 2020 06:01:44 -0700 (PDT)
X-Gm-Message-State: AGi0PuYXlFoPPvcpOiTqVhKFZP2dxXr+omrWv13P7z/XcrqW1yltL7IJ
 +fm1Ym4Ut/ZDeyPIbgxUWalYUixDLZbMzD5/LQ==
X-Google-Smtp-Source: APiQypIHqZadC3nzIvFXNOEse7bTp7FzDlJqNyxZvrk+cHMRB9Tyvtfrxw7SwuI3j/qcSFHHZBwidZxx5VwL3Ns5Qwg=
X-Received: by 2002:a17:906:2503:: with SMTP id
 i3mr6776180ejb.293.1588770103283; 
 Wed, 06 May 2020 06:01:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200506123356.9147-1-bernard@vivo.com>
In-Reply-To: <20200506123356.9147-1-bernard@vivo.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 6 May 2020 21:01:32 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9Cuc40zaDF83m7sJiok35x3oqDCr4JQRJyvLCBZ4U_FA@mail.gmail.com>
Message-ID: <CAAOTY_9Cuc40zaDF83m7sJiok35x3oqDCr4JQRJyvLCBZ4U_FA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: cleanup coding style in mediatek a bit
To: Bernard Zhao <bernard@vivo.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, opensource.kernel@vivo.com,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEJlcm5hcmQ6CgpCZXJuYXJkIFpoYW8gPGJlcm5hcmRAdml2by5jb20+IOaWvCAyMDIw5bm0
NeaciDbml6Ug6YCx5LiJIOS4i+WNiDg6MzTlr6vpgZPvvJoKPgo+IFRoaXMgY29kZSBjaGFuZ2Ug
aXMgdG8gbWFrZSBjb2RlIGJpdCBtb3JlIHJlYWRhYmxlLgo+CgpSZXZpZXdlZC1ieTogQ2h1bi1L
dWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+IFNpZ25lZC1vZmYtYnk6IEJlcm5h
cmQgWmhhbyA8YmVybmFyZEB2aXZvLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19oZG1pLmMgfCAxMiArKysrLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRt
aS5jCj4gaW5kZXggZmY0M2EzZDgwNDEwLi40M2U5ODc2ZmQ1MGMgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2hkbWkuYwo+IEBAIC0zMTEsMTQgKzMxMSwxMCBAQCBzdGF0aWMgdm9pZCBt
dGtfaGRtaV9od19zZW5kX2luZm9fZnJhbWUoc3RydWN0IG10a19oZG1pICpoZG1pLCB1OCAqYnVm
ZmVyLAo+ICAgICAgICAgdTggY2hlY2tzdW07Cj4gICAgICAgICBpbnQgY3RybF9mcmFtZV9lbiA9
IDA7Cj4KPiAtICAgICAgIGZyYW1lX3R5cGUgPSAqYnVmZmVyOwo+IC0gICAgICAgYnVmZmVyICs9
IDE7Cj4gLSAgICAgICBmcmFtZV92ZXIgPSAqYnVmZmVyOwo+IC0gICAgICAgYnVmZmVyICs9IDE7
Cj4gLSAgICAgICBmcmFtZV9sZW4gPSAqYnVmZmVyOwo+IC0gICAgICAgYnVmZmVyICs9IDE7Cj4g
LSAgICAgICBjaGVja3N1bSA9ICpidWZmZXI7Cj4gLSAgICAgICBidWZmZXIgKz0gMTsKPiArICAg
ICAgIGZyYW1lX3R5cGUgPSAqYnVmZmVyKys7Cj4gKyAgICAgICBmcmFtZV92ZXIgPSAqYnVmZmVy
Kys7Cj4gKyAgICAgICBmcmFtZV9sZW4gPSAqYnVmZmVyKys7Cj4gKyAgICAgICBjaGVja3N1bSA9
ICpidWZmZXIrKzsKPiAgICAgICAgIGZyYW1lX2RhdGEgPSBidWZmZXI7Cj4KPiAgICAgICAgIGRl
dl9kYmcoaGRtaS0+ZGV2LAo+IC0tCj4gMi4yNi4yCj4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
