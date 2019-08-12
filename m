Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 631868995E
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 11:06:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF44689FC8;
	Mon, 12 Aug 2019 09:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B99489FAD;
 Mon, 12 Aug 2019 09:06:10 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id u3so69349764vsh.6;
 Mon, 12 Aug 2019 02:06:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ap4g7PZ3nPtHJSCa7QlVcwE2x1gjOKFm9Xhk4/cXrCQ=;
 b=RCsZOIGWd8OR3PAdBHC+ljNaGYTvh0kLKpJzdAnIxz+dnLTjpp6RI3mDxdGpufeWnD
 BQskklqzpPKAgWCUtmz3tAJP07O7i3FEuiXAhNcLZrUmPtypYFNVC0dMpERGIW+NzRrv
 tpZlIo3iITmIXnNDRvTGl6GAPevE84h9MB86rB1q8A2rCcU+d4GyCWJmlyVcH0cci7s9
 L4lOx0bFIAYAegl509ckAx521vCa/ZFF5xC5ZWAcInKpmbO4CKZEF+dalwrGl563jlMG
 WhrFeHJRxCTOtVHbRZ2/9FR+4BY+DZDH23N5vN+E86E7GC0/obJZwq2shI2vLRVJz8or
 uWsw==
X-Gm-Message-State: APjAAAXrrYNLEnwU7u1hnFS6/Cblx1w4Wm7qBm86Ts1CORGJAzS6eaK9
 IxTwR0iSGfuM/sj8LhIrhE4/HJN0ZYhTT08guCQ=
X-Google-Smtp-Source: APXvYqyV3L/J+mwBrmYhaxIFgdV8vOgjmLRb1N7NuJ6P053cfjdGEXgibZ7j7fq9pAs/a5XZFbogr8TaiD0Zcc5pxtQ=
X-Received: by 2002:a67:2d08:: with SMTP id t8mr11904385vst.178.1565600769122; 
 Mon, 12 Aug 2019 02:06:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190810153430.30636-1-chris@chris-wilson.co.uk>
 <20190810153430.30636-2-chris@chris-wilson.co.uk>
In-Reply-To: <20190810153430.30636-2-chris@chris-wilson.co.uk>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 12 Aug 2019 10:05:42 +0100
Message-ID: <CAM0jSHOVy0Czpr9ocQ-OZH=o9iotYArqt36V3F3DTYQtpbGdmA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 2/4] dma-fence: Report the composite sync_file
 status
To: Chris Wilson <chris@chris-wilson.co.uk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Ap4g7PZ3nPtHJSCa7QlVcwE2x1gjOKFm9Xhk4/cXrCQ=;
 b=HKf+HReYp/6Hjva+McFUBVi10ZgxpY/X8jCiVUv5oHJlizOm78kp6wBoSD5dGbtNSX
 rMIieZbcRHQgGeew2lk6jU0kC528GuEP0HHIeszeEFhfauiF1P+wInBkx3diktfFGt+T
 YMDuQu71nEiWlA37yUbQZ45/ZK5QTesmOS5p+HNH4MGI7jWGtNVdEczjFv+bvOzYkEzQ
 7cd1xW/2bXButGsvMwsq9oVuVI3HM4PJcb5z8oqMcwM6KIkmDt5bv54aEvHPkEXd54Jd
 9B2CkJPVa+Apbs9fqD9YgokhJ2/kMr6ISNWbpbpoOQoVykglM8ds7q/PFPC2LpUXv+3P
 Nx8w==
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
Cc: Gustavo Padovan <gustavo@padovan.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 christian.koenig@amd.com, ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAxMCBBdWcgMjAxOSBhdCAxNjozNiwgQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13
aWxzb24uY28udWs+IHdyb3RlOgo+Cj4gU2FtZSBhcyBmb3IgdGhlIGluZGl2aWR1YWwgZmVuY2Vz
LCB3ZSB3YW50IHRvIHJlcG9ydCB0aGUgYWN0dWFsIHN0YXR1cwo+IG9mIHRoZSBmZW5jZSB3aGVu
IHF1ZXJpZWQuCj4KPiBSZXBvcnRlZC1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBp
bnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxz
b24uY28udWs+Cj4gQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+Cj4g
Q2M6IEd1c3Rhdm8gUGFkb3ZhbiA8Z3VzdGF2b0BwYWRvdmFuLm9yZz4KPiBDYzogUGV0cmkgTGF0
dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+ClJldmlld2VkLWJ5OiBNYXR0aGV3IEF1bGQg
PG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
