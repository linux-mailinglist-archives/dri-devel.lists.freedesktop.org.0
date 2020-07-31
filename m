Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A29A1234CAB
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 23:07:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 644796E0D3;
	Fri, 31 Jul 2020 21:07:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 906676E0E8
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 21:07:07 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id bo3so10098797ejb.11
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 14:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3EwKBV5HVCJGzerzyfgEJuPybhUuhHdXlz4Bwg6mYLs=;
 b=FoSL5VhkaVe4IXeEDKSV/6ydFjd7rDyGmVPMTaDlBUDmXzqBMVeu4ruT38pR3h0R3w
 ZVLgce5o9iBjrZ3S06ymwEmbEDCvalY7IIpDB4jKnPlSNVnjgkebxK0jIVvUROnB4trE
 0jQRVr7otUFPX73gzr0iDxV0kmSevJA59Q0qtZRmqkdu/q7RMyGPi7yzw5E48hNdovvP
 U3C7vd8LkIm/7DuRixp6t79ZIXLyW7JBPvaIO7IGstqDB5eoMcjBQgDkELukWxTd+LTI
 r5ZfyYtLOFpx0bKMv0oABVJ7tHytz7ZQWKDjtYApSzQARbbm3RgC5pS26j6gplBY0mI/
 HpJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3EwKBV5HVCJGzerzyfgEJuPybhUuhHdXlz4Bwg6mYLs=;
 b=pVr45TuWe1okdR+0Nu3LdAknChYOmTgnYjMyTO7Nz+Y24NFwfe+k7iBA3TqhiU/PRH
 7FpB5+PJoZxnsqnjnHptmT3QxJJC2eZKGLt619AydH3F4VP/JtQpxRxt3ctnSbc5zaiR
 izcykS9OP+7JJnKmE7TsWC4NHrkAWUk9FloMeJL3FcmVmV53xo5FOmhGptimiS/IrHfo
 MFxGEue2xGGpUMcJt8EaZ3mxOALWKeUAMyEF0/bTtFtXst857NATctByuA+gRjAZak9B
 lrP4ATFR9tZJmVkzcQi1+vzmVG1bZOkHTFummQZW7XP2OM8/FAudvGor2ivhGoLfT3xR
 6K5A==
X-Gm-Message-State: AOAM532a0qIbJdLWbWfxp8lpFLhokeo2Si6ZAl5/XG/nIcd7ZapT/zn3
 zp0BE16Y3e8kylFrzymRZQFERZOUSXyzdS9USzM=
X-Google-Smtp-Source: ABdhPJxb1flvkCh6LxbLWonqrKsoJ/zXu1IX8nSu5Np+YP0bCwfOapH+q7MaJX5P3uWDfanDp+L2QmC9QObODT8L1Uk=
X-Received: by 2002:a17:906:8782:: with SMTP id
 za2mr5788174ejb.419.1596229625938; 
 Fri, 31 Jul 2020 14:07:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200731040520.3701599-1-airlied@gmail.com>
 <20200731040520.3701599-27-airlied@gmail.com>
 <ddedce74-8269-f815-c244-38c18ea4bccd@amd.com>
In-Reply-To: <ddedce74-8269-f815-c244-38c18ea4bccd@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 1 Aug 2020 07:06:54 +1000
Message-ID: <CAPM=9txvFhsky9Zc_EiytcB4kxQJeDiEoVX6gUhQvcb_SkGGqg@mail.gmail.com>
Subject: Re: [PATCH 26/49] drm/ttm: add wrapper to get manager from bdev.
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
Cc: Roland Scheidegger <sroland@vmware.com>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAzMSBKdWwgMjAyMCBhdCAyMzoyMywgQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEFtIDMxLjA3LjIwIHVtIDA2OjA0IHNjaHJpZWIg
RGF2ZSBBaXJsaWU6Cj4gPiBGcm9tOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+
ID4KPiA+IFRoaXMgd2lsbCBhbGxvdyBkaWZmZXJlbnQgYWJzdHJhY3Rpb25zIGxhdGVyLgo+Cj4g
TWhtLCBJJ20gcXVlc3Rpb25pbmcgaWYgdGhpcyBpcyByZWFsbHkgd29ydGggaXQgYW5kIG5vdCBq
dXN0IG92ZXJraWxsLgo+Cj4gUnVubmluZyAic2VkIC1pICdzLyZiZGV2LT5tYW4vYmRldi0+bWFu
LyciIG9uIGFsbCBkcml2ZXJzIHdoZW4gd2UgbWFrZQo+IHRoZSBzd2l0Y2ggdG8gYSBwb2ludGVy
IHNob3VsZCBkbyBpdCBhcyB3ZWxsLgo+CgpJdCdzIGEgZ29vZCBwbGFjZSB0byBob29rIGRlYnVn
Z2luZyBpbiBpZiB5b3UgZ2V0IHNvbWV0aGluZyByb2d1ZQphY2Nlc3NpbmcgdW5yZWdpc3RlcmVk
IGJkZXYtPm1hbiBwdHJzIGFzIHdlbGwuCgpJJ2QgcmF0aGVyIG5vdCBzZWQgdGhlIGludGVyZmFj
ZSBsYXRlciwgaXQncyBuaWNlIHRvIHRyYW5zaXRpb24gdGhpbmdzCmNsZWFubHkgYmV0d2VlbiBz
dGF0ZXMuCgpEYXZlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
