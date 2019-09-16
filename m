Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39ACBB43EA
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 00:20:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC9B6EA98;
	Mon, 16 Sep 2019 22:20:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 231496EA98
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 22:20:41 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C958C2184D
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 22:20:40 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id i78so1664608qke.11
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 15:20:40 -0700 (PDT)
X-Gm-Message-State: APjAAAXzUsNFJYyzfLszSyTObo78MALNQs9HN9Rl3s5bpHcofCWf3O/2
 dCGPLid9ie/QnDpJkMLtvSEtwVPJwFv8e7HFsg==
X-Google-Smtp-Source: APXvYqyfGBt23AbWjW4VPgpQ4hcC2Yc8a0lYSdj36CZJW3aWgIcWvkIvLRfRLdkCRxVX2jDyLzxDZM2k285/c5S5w5Y=
X-Received: by 2002:a05:620a:549:: with SMTP id
 o9mr634330qko.223.1568672439997; 
 Mon, 16 Sep 2019 15:20:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190913111748.21071-1-boris.brezillon@collabora.com>
In-Reply-To: <20190913111748.21071-1-boris.brezillon@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 16 Sep 2019 17:20:28 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLSStbn35SY9nE+SNZMnNyBZ2vP1KMH5aFjFxi6mBw2wQ@mail.gmail.com>
Message-ID: <CAL_JsqLSStbn35SY9nE+SNZMnNyBZ2vP1KMH5aFjFxi6mBw2wQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/panfrost: Allow passing extra information about
 BOs used by a job
To: Boris Brezillon <boris.brezillon@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1568672440;
 bh=9dfTMHP8nTiG5m23K8EiyqB7Q5SqBh/ukxgLPqlZNwY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=zoPY8BgmzCqIXwJP+yDsM+q9lWdKlqqi4+QYOSl5A0z1WrYTwlfSLsbjg5YxcdfQn
 LRlMd0fc7+J7ziO4rH/BAgJ9hTdGdXC7Afe9q/voZO8wD0QqRswrpl8GVFf2ybCHsm
 mNAQwov5SEleVoMZRdbMuFm9oIcJyAC/ROpHeZlw=
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgNjoxNyBBTSBCb3JpcyBCcmV6aWxsb24KPGJvcmlzLmJy
ZXppbGxvbkBjb2xsYWJvcmEuY29tPiB3cm90ZToKPgo+IFRoZSBSRUFEL1dSSVRFIGZsYWdzIGFy
ZSBwYXJ0aWN1bGFybHkgdXNlZnVsIGlmIHdlIHdhbnQgdG8gYXZvaWQKPiBzZXJpYWxpemF0aW9u
IG9mIGpvYnMgdGhhdCByZWFkIGZyb20gdGhlIHNhbWUgQk8gYnV0IG5ldmVyIHdyaXRlIHRvIGl0
LgoKQW55IGRhdGEgb24gcGVyZm9ybWFuY2UgZGlmZmVyZW5jZXM/Cgo+IFRoZSBOT19JTVBMSUNJ
VF9GRU5DRSBtaWdodCBiZSB1c2VmdWwgd2hlbiB0aGUgdXNlciBrbm93cyB0aGUgQk8gaXMKPiBz
aGFyZWQgYnV0IGpvYnMgYXJlIHVzaW5nIGRpZmZlcmVudCBwb3J0aW9ucyBvZiB0aGUgYnVmZmVy
LgoKV2h5IGRvbid0IHdlIGFkZCB0aGlzIHdoZW4gaXQgaXMgdXNlZnVsIHJhdGhlciB0aGFuIG1p
Z2h0IGJlPwoKPgo+IFNpZ25lZC1vZmYtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemls
bG9uQGNvbGxhYm9yYS5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
