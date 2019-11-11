Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F86F7A6B
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 19:01:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 936FD6E9B4;
	Mon, 11 Nov 2019 18:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34586E9B2;
 Mon, 11 Nov 2019 18:01:25 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id z19so225325wmk.3;
 Mon, 11 Nov 2019 10:01:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LZm0O+9adBfpx+ovnSPJOcOY1JX1dPWpztVmEz4llkE=;
 b=agd0ztKbuwi6fJF4++Wx5CpvwgAANS0swSxRA7aW9+bRjGHPTzCvdZrr5lpdqAtLHz
 opKZkNKJ26pstunu6X3E6HeNhzQC+uzokGU7D262Vy01AY8LSPeis6Y/EDWXR+cr4Hne
 F09yzDXHFh3YluBEBMNDotBp7ayCYAmAMd26aJnlf/bOPpFy7RbGybIObqdDzeTsZgmX
 o4xzdpiK9D9CDRXxJAEZvZrY07nzL5tyJ/wPDeDgbaTjbITk2RBBhFY5mfuYhA28eDL1
 baTpHbAorObRfjpitv3gQuy3B/d17vkRlHTQgRyQ6u1c/sIreWJK39MKdQjInmg3ETjX
 MYeA==
X-Gm-Message-State: APjAAAVcxxQg6dZF0zf+PHDiH+yObEyeEYrA3pLYgoUyMYiCchDrchfE
 q6AOJTtu+EUtk6IFwrASTK8CnmcrnkCuIm7wr5E=
X-Google-Smtp-Source: APXvYqx3F2xEQnEwJIJbF32491P4OsB8Wm3WOoRDkOVtWpzT+0v4cABkBIFm0/KZ3L3bKl0dq1GLJiYXU85t9P2VkwI=
X-Received: by 2002:a1c:790b:: with SMTP id l11mr200549wme.127.1573495284364; 
 Mon, 11 Nov 2019 10:01:24 -0800 (PST)
MIME-Version: 1.0
References: <20191109093538.23964-1-yuehaibing@huawei.com>
In-Reply-To: <20191109093538.23964-1-yuehaibing@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 11 Nov 2019 13:01:11 -0500
Message-ID: <CADnq5_O7JwQd4+ncEe+KusqNqPBGXgkcUBX6VHP5OjhNwUseWg@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: remove set but not used variable
 'bpc'
To: YueHaibing <yuehaibing@huawei.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=LZm0O+9adBfpx+ovnSPJOcOY1JX1dPWpztVmEz4llkE=;
 b=Csn/2IzCJ6MEF+fyZKlzifXzPAy8ny1P4ICBVPnPsRGKuub7/rNPpw/Qn3CGNuuxy5
 WtxeQ+DpHHi1LRluKoais2+875spWmUBYjiSIqIbluzGGNliVcglPlVSR46ebYq76qAc
 BcyVjUlIWB9KPVe5mWhY8rRxEIG2ZD/KiSvIBmEGVxQBqa1koidTmQ6V3yXmH0aigPSF
 Jq+AY0MRvqSBxIW8ZOSGQLOWNbhMcnW1i/SlF47dc4bnPvjvFGMPOG0wdcuUa71RLpGF
 oMqKEmjNCin2r9u4BYC2Gorsi/pDfgPb2JCpbApUeu2+KOJ1tHcbXk4M/fUGmWNgauDO
 FbpA==
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
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Zhan Liu <Zhan.Liu@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIFN1biwgTm92IDEwLCAyMDE5IGF0IDk6MzAgUE0g
WXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPiB3cm90ZToKPgo+IEZpeGVzIGdjYyAn
LVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZScgd2FybmluZzoKPgo+IGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmM6IEluIGZ1bmN0aW9uIGdldF9w
Ym5fZnJvbV90aW1pbmc6Cj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9k
Yy9jb3JlL2RjX2xpbmsuYzoyMzY0OjExOiB3YXJuaW5nOgo+ICB2YXJpYWJsZSBicGMgc2V0IGJ1
dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPgo+IEl0IGlzIG5vdCB1c2Vk
IHNpbmNlIGNvbW1pdCBlNDlmNjkzNjNhZGYgKCJkcm0vYW1kL2Rpc3BsYXk6IHVzZQo+IHByb3Bl
ciBmb3JtdWxhIHRvIGNhbGN1bGF0ZSBiYW5kd2lkdGggZnJvbSB0aW1pbmciKQo+Cj4gU2lnbmVk
LW9mZi1ieTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgo+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMgfCAyIC0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9jb3JlL2RjX2xpbmsuYwo+IGluZGV4IGJkYzhiZTMuLjUzMzk0ZTIgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jCj4gQEAgLTI2
NTMsMTMgKzI2NTMsMTEgQEAgc3RhdGljIGludCBnZXRfY29sb3JfZGVwdGgoZW51bSBkY19jb2xv
cl9kZXB0aCBjb2xvcl9kZXB0aCkKPgo+ICBzdGF0aWMgc3RydWN0IGZpeGVkMzFfMzIgZ2V0X3Bi
bl9mcm9tX3RpbWluZyhzdHJ1Y3QgcGlwZV9jdHggKnBpcGVfY3R4KQo+ICB7Cj4gLSAgICAgICB1
aW50MzJfdCBicGM7Cj4gICAgICAgICB1aW50NjRfdCBrYnBzOwo+ICAgICAgICAgc3RydWN0IGZp
eGVkMzFfMzIgcGVha19rYnBzOwo+ICAgICAgICAgdWludDMyX3QgbnVtZXJhdG9yOwo+ICAgICAg
ICAgdWludDMyX3QgZGVub21pbmF0b3I7Cj4KPiAtICAgICAgIGJwYyA9IGdldF9jb2xvcl9kZXB0
aChwaXBlX2N0eC0+c3RyZWFtX3Jlcy5waXhfY2xrX3BhcmFtcy5jb2xvcl9kZXB0aCk7Cj4gICAg
ICAgICBrYnBzID0gZGNfYmFuZHdpZHRoX2luX2ticHNfZnJvbV90aW1pbmcoJnBpcGVfY3R4LT5z
dHJlYW0tPnRpbWluZyk7Cj4KPiAgICAgICAgIC8qCj4gLS0KPiAyLjcuNAo+Cj4KPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
