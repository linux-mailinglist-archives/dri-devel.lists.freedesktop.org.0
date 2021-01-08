Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE552EFA23
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 22:18:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEE8F6E8E7;
	Fri,  8 Jan 2021 21:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 849C76E8DE;
 Fri,  8 Jan 2021 21:18:05 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id q25so11044174otn.10;
 Fri, 08 Jan 2021 13:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4ELcB1n16HnyQ+PPet2qQqyGcOAAV6Ox4dEHeBx+UOQ=;
 b=hLIj/KKW2I5OAEqC6oizpKmGpdvX7cKwHI5APTXltw2iaT5tY6p8sBnNeSQxT/CgdA
 Qfsni1x/hVSULOp2KDdVHyNLIYaxWqHl+YXO27uZGMvgy2Eao3KxJ5t17ssqz27qOHvY
 DSQZ4Km+A5F/spGhUpzPQY0tp2/0rUYEeKXo5ISyBUf7nXeeKEyWhmxf6GGdo8O4gJSe
 v1lU1rxVJaaR8/SWtbD5NQcGN9xFvReg+63xlDf6febIC+/ubMWO9WMl1FGEbNL1faD6
 MKP5nPLcMBCrKyNfhehpf8NhjQENNLlnmLItBK8w6FBqdVMiUJCjdyB8IVkV5Hqozw4e
 uasg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4ELcB1n16HnyQ+PPet2qQqyGcOAAV6Ox4dEHeBx+UOQ=;
 b=JysOG1Qr140cRMg59hMGBUfufe5TuxbUElutGFtXn+veOMECb95Qvb4IP6W9zb1hCO
 BUw3/tAiNspFkNH+uGuFSeu0vx4he+0EeH59WEhpv6wqaiQd6yvZUaUuHgFlCgQ3fqU0
 BUWkeCqCVcngG6XnmdIESgQjgnqUQ3X4iY3WcN93/IIm28PrsH/tnL7TktZYqoDj8Tp8
 kzg2m31U94bWAEa8R4AWlO55jV5urVvIulQXePpc4KK8KBPKyKPr7rIpQ4ryupD4O4+G
 ak0A8qzAGOyn3idB7qLYkvikYfm9n3E0eI+vT4aVDQ/1XDQrbnbf2gO6dXkjhQX4IXRk
 ygYA==
X-Gm-Message-State: AOAM531E3laVqAqUE0ZvJn6OweNQScMoj1zI94oT5lMq+wI4kzX4n6F9
 muzVB9PSa0T43XQQ7LN5VlYXGiX8uLnvWsuVboU=
X-Google-Smtp-Source: ABdhPJxd7NOc/UlrlgEgpRKqoSLeq73YHde4TXgizOSPJ8EDuVrpVjMNAVnFEuJ8yS4fnR/Ur8lHAt4/tg1lidDpyBY=
X-Received: by 2002:a05:6830:1d66:: with SMTP id
 l6mr3890500oti.23.1610140684949; 
 Fri, 08 Jan 2021 13:18:04 -0800 (PST)
MIME-Version: 1.0
References: <20210108201457.3078600-1-lee.jones@linaro.org>
 <20210108201457.3078600-30-lee.jones@linaro.org>
In-Reply-To: <20210108201457.3078600-30-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Jan 2021 16:17:53 -0500
Message-ID: <CADnq5_PT6StMHY-cQUMxKO+yFEZ9g4TUS6Ho2GoxDRfSPXW5=Q@mail.gmail.com>
Subject: Re: [PATCH 29/40] drm/amd/display/dc/dce/dce_dmcu: Staticify local
 function call 'dce_dmcu_load_iram'
To: Lee Jones <lee.jones@linaro.org>
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
Cc: Krunoslav Kovac <Krunoslav.Kovac@amd.com>, Leo Li <sunpeng.li@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKYW4gOCwgMjAyMSBhdCAzOjE1IFBNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+IHdyb3RlOgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdh
cm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9k
Y2UvZGNlX2RtY3UuYzo3NDo2OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKA
mGRjZV9kbWN1X2xvYWRfaXJhbeKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4gIEluIGZpbGUg
aW5jbHVkZWQgZnJvbSBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2Rj
ZS9kY2VfZG1jdS5jOjMxOgo+Cj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBh
bWQuY29tPgo+IENjOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KPiBDYzogQWxleCBEZXVj
aGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxp
bnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IEtydW5v
c2xhdiBLb3ZhYyA8S3J1bm9zbGF2LktvdmFjQGFtZC5jb20+Cj4gQ2M6IGFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBT
aWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBwbGllZC4g
IFRoYW5rcyEKCkFsZXgKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y2UvZGNlX2RtY3UuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjZS9kY2VfZG1jdS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9k
Y2VfZG1jdS5jCj4gaW5kZXggZjNlZDhiNjE5Y2FmZC4uZmEyYjQ3ZDQxZWUyZiAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9kbWN1LmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9kbWN1LmMKPiBAQCAtNzEs
NyArNzEsNyBAQCBzdGF0aWMgYm9vbCBkY2VfZG1jdV9pbml0KHN0cnVjdCBkbWN1ICpkbWN1KQo+
ICAgICAgICAgcmV0dXJuIHRydWU7Cj4gIH0KPgo+IC1ib29sIGRjZV9kbWN1X2xvYWRfaXJhbShz
dHJ1Y3QgZG1jdSAqZG1jdSwKPiArc3RhdGljIGJvb2wgZGNlX2RtY3VfbG9hZF9pcmFtKHN0cnVj
dCBkbWN1ICpkbWN1LAo+ICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgc3RhcnRfb2Zmc2V0
LAo+ICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpzcmMsCj4gICAgICAgICAgICAgICAgIHVu
c2lnbmVkIGludCBieXRlcykKPiAtLQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
