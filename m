Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FE31A689B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Apr 2020 17:16:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B8089B42;
	Mon, 13 Apr 2020 15:16:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2BF889A56;
 Mon, 13 Apr 2020 15:16:46 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a81so10312166wmf.5;
 Mon, 13 Apr 2020 08:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=r6UiEvbE1rjGxqv1o7W1IMkMCeQe6MTQHsxVolkgrEM=;
 b=IXyX5DqvbxY264CH/F3eNmCS/hdCeedFlfXvTbxd/Lc6eXN6Tqrswd0c/tdAPy1syl
 0UnwbezT1Uj5x0yqKoH/yms6XPU7YoCB5yw9pIms1/tVWSHyib9tx0UCNQ1ElPjOwXyJ
 dm/kMjzoBQvVd4kp2hxcJujkcgf5WVvHy+eI8etV3wfT2c3uKX7ma7cMbMoMr/uRpjmg
 apugD+5A/RMOUNdK4SbluQZIB4kewFWwdopstVUwJGg3y6r2JYhsPavopRClZsj7+e3j
 kUh3kg4LF9OEPlTt/lonVX9PeYmNHqzJ/JwWyh/+Cfy/JpHBWVwds3JE1emP6/bhvJCK
 DKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=r6UiEvbE1rjGxqv1o7W1IMkMCeQe6MTQHsxVolkgrEM=;
 b=sBUeIMucv1FWkxZo3BFS6zxzsbBtJ8kVPwrgIIf2lP3tH3kdApQXIYUWvPsulgn4Io
 0ck+ohQ0PAq9xCiy5xweY8VQamrkTAuvvjdjj+f2UiAPc4h5R5gRRvgH7BotFE8PFE7P
 ag2WWnnIftpFEwGxalaT5HOj0SShev1yNlo0Sx8nUP8l61suPtJ1XfvTtJ3QzkZOllZ4
 qejDbD3fzA31sfJVuWskLWytzK+aKcoobqEAPdY3aRVbCJb2hImwNgdsQPggVSCJdtwD
 v3+emaioDo0tzNwPSXbP1TNtisIJlqBmudSM20Ob8n7jh7LRxZmH3yu3yuHXjRwpHdnC
 rTPg==
X-Gm-Message-State: AGi0PubZkYtlEZ364qf26i3ROyh25dtQo47DNzTYO47rCsvww/EC+Wa/
 oosSOvXGD+k5A80StJVVbrEWqMXlxRtjK+M/+Sc=
X-Google-Smtp-Source: APiQypJrQBbCjYEr3VeIs/klvTlCt9CHs6CsKjldb6vT7gM4x1pA8yy3F8VwNa2km5kWAS9nF055I8Da4DqRxQfmOLM=
X-Received: by 2002:a7b:cc8e:: with SMTP id p14mr18695083wma.70.1586791005382; 
 Mon, 13 Apr 2020 08:16:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200413143245.23107-1-yanaijie@huawei.com>
In-Reply-To: <20200413143245.23107-1-yanaijie@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 13 Apr 2020 11:16:33 -0400
Message-ID: <CADnq5_P42xtD-kL6A_eZ4s_vRVTqmsCnuFmQSA_8f+7bZTfcgg@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: remove defined but not used
 'dte_data_tahiti_le'
To: Jason Yan <yanaijie@huawei.com>
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Hulk Robot <hulkci@huawei.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIHRoYW5rcyEKCkFsZXgKCk9uIE1vbiwgQXByIDEzLCAyMDIwIGF0IDEwOjA2IEFN
IEphc29uIFlhbiA8eWFuYWlqaWVAaHVhd2VpLmNvbT4gd3JvdGU6Cj4KPiBGaXggdGhlIGZvbGxv
d2luZyBnY2Mgd2FybmluZzoKPgo+IGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vc2lfZHBtLmM6MjU1
OjMzOiB3YXJuaW5nOiDigJhkdGVfZGF0YV90YWhpdGlfbGXigJkKPiBkZWZpbmVkIGJ1dCBub3Qg
dXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHNp
X2R0ZV9kYXRhIGR0ZV9kYXRhX3RhaGl0aV9sZSA9Cj4KPiBSZXBvcnRlZC1ieTogSHVsayBSb2Jv
dCA8aHVsa2NpQGh1YXdlaS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSmFzb24gWWFuIDx5YW5haWpp
ZUBodWF3ZWkuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpX2RwbS5jIHwg
MTggLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBkZWxldGlvbnMoLSkK
Pgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpX2RwbS5jIGIvZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9zaV9kcG0uYwo+IGluZGV4IDJjYjg1ZGJlNzI4Zi4uYTE2N2UxYzM2
ZDI0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vc2lfZHBtLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpX2RwbS5jCj4gQEAgLTI1MiwyNCArMjUyLDYgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBzaV9kdGVfZGF0YSBkdGVfZGF0YV90YWhpdGkgPQo+ICAgICAg
ICAgZmFsc2UKPiAgfTsKPgo+IC1zdGF0aWMgY29uc3Qgc3RydWN0IHNpX2R0ZV9kYXRhIGR0ZV9k
YXRhX3RhaGl0aV9sZSA9Cj4gLXsKPiAtICAgICAgIHsgMHgxRTg0ODAsIDB4N0ExMjAwLCAweDIx
NjBFQzAsIDB4MzkzODcwMCwgMCB9LAo+IC0gICAgICAgeyAweDdELCAweDdELCAweDRFNCwgMHhC
MDAsIDAgfSwKPiAtICAgICAgIDB4NSwKPiAtICAgICAgIDB4QUZDOCwKPiAtICAgICAgIDB4NjQs
Cj4gLSAgICAgICAweDMyLAo+IC0gICAgICAgMSwKPiAtICAgICAgIDAsCj4gLSAgICAgICAweDEw
LAo+IC0gICAgICAgeyAweDc4LCAweDdDLCAweDgyLCAweDg4LCAweDhFLCAweDk0LCAweDlBLCAw
eEEwLCAweEE2LCAweEFDLCAweEIwLCAweEI0LCAweEI4LCAweEJDLCAweEMwLCAweEM0IH0sCj4g
LSAgICAgICB7IDB4MzkzODcwMCwgMHgzOTM4NzAwLCAweDM5Mzg3MDAsIDB4MzkzODcwMCwgMHgz
OTM4NzAwLCAweDM5Mzg3MDAsIDB4MzkzODcwMCwgMHgzOTM4NzAwLCAweDM5Mzg3MDAsIDB4Mzkz
ODcwMCwgMHgzOTM4NzAwLCAweDM5Mzg3MDAsIDB4MzkzODcwMCwgMHgzOTM4NzAwLCAweDM5Mzg3
MDAsIDB4MzkzODcwMCB9LAo+IC0gICAgICAgeyAweDJBRjgsIDB4MkFGOCwgMHgyOUJCLCAweDI3
RjksIDB4MjYzNywgMHgyNDc1LCAweDIyQjMsIDB4MjBGMSwgMHgxRjJGLCAweDFENkQsIDB4MTcz
NCwgMHgxNDE0LCAweDEwRjQsIDB4REQ0LCAweEFCNCwgMHg3OTQgfSwKPiAtICAgICAgIDg1LAo+
IC0gICAgICAgdHJ1ZQo+IC19Owo+IC0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBzaV9kdGVfZGF0
YSBkdGVfZGF0YV90YWhpdGlfcHJvID0KPiAgewo+ICAgICAgICAgeyAweDFFODQ4MCwgMHgzRDA5
MDAsIDB4OTg5NjgwLCAweDI2MjVBMDAsIDB4MCB9LAo+IC0tCj4gMi4yMS4xCj4KPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGlu
ZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
