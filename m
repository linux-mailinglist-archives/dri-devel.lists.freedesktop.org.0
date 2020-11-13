Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A952B2221
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 18:25:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C266E5C0;
	Fri, 13 Nov 2020 17:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC4A6E4E6;
 Fri, 13 Nov 2020 17:24:59 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id k2so10795295wrx.2;
 Fri, 13 Nov 2020 09:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uBRhPERLFwM9kVQueXTDW4VzWLQKorMvtcJ1DKfFCr8=;
 b=gbibu0MT1eCJuXVDo5/wiV3XKB65YBnbQ1ZN+z8148AhZ+PoypqBMpT/ghUmb5r6uF
 VEb8iLpHG7oZw7PTew5daLieAieoISp/P9NhxPZdI5hJC/Dgq8/6vwcF0ZRXnTYYjfgC
 /ZS+DuxHiONLTjpX2BNn3PJFShJfck9CZLqlw/PvtmvFLFcJR8Ao+CXaafdfGoS/Parm
 6luXFr/SxpPzLRjcX0MAbFIouieeFFC1VOQtH8JE3RaS0qEdKGHeS8EBx470tyxjMlW6
 5YQAIVbd/MF3AAq3ApGHpZ8dqaevXSzq6M9jQX13whxrx34ARrURpJYO1EQ8UO6vYhR8
 qb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uBRhPERLFwM9kVQueXTDW4VzWLQKorMvtcJ1DKfFCr8=;
 b=Es3Qflg+xCHH1YZfNhZUk4JK+o95hbVVZVTi9fHtuxAtImt8Ychaw9GvqNPk8pqyeA
 hi0ErGEoPppNlA5ylENJYf/rr0OIorS6FJgJ4Zqd7GraTXD9X6htO1b5uqdb0RKEX8AX
 u3+mzp1MW+4HjImMj1XKmuMsZti4QcdAK1fgXmOTXPEzgCmemwqwiTPY6v/08P5z0eh/
 bXfxz5tW5sTmH+63kks+16vH9JbyI46Ks25gOGxPh0PE0TZLB7gCghXFeXn7DTu03xYh
 HbHCPivpPgdYvxbd3eWWtILJhuCHyu7acYP7XI7T8MNO06zohIFK5HWHCre9lsLEfidv
 Sa+g==
X-Gm-Message-State: AOAM530U/0zLAOmGfiAI+4YxvUSXLbQRBRLbG6AkecBCtn/dFJzaSKC/
 bEru3qwu9clQrARY4IQ/srcp1yHP7tf9QKxCLYNu22lN
X-Google-Smtp-Source: ABdhPJxtNQRZV0jj9joYdWfh3kfNhGsqnXi4N5xFBsTJ5f47wweNLoUMzJSeS0o2sdUa4Fnt9rH9xeb73/U4vUysprM=
X-Received: by 2002:adf:e9c9:: with SMTP id l9mr5043675wrn.124.1605288298092; 
 Fri, 13 Nov 2020 09:24:58 -0800 (PST)
MIME-Version: 1.0
References: <20201113134938.4004947-1-lee.jones@linaro.org>
 <20201113134938.4004947-23-lee.jones@linaro.org>
In-Reply-To: <20201113134938.4004947-23-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 13 Nov 2020 12:24:46 -0500
Message-ID: <CADnq5_OmY=tfLL9zsr9wMrMjTkHBWeeRvkui4wqEut=UUwyNBg@mail.gmail.com>
Subject: Re: [PATCH 22/40] drm/amd/amdgpu/amdgpu_sched: Consume our own header
 containing prototypes
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Andres Rodriguez <andresx7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMTMsIDIwMjAgYXQgODo1MCBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9zY2hlZC5j
OjM1OjU6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYYW1kZ3B1X3RvX3Nj
aGVkX3ByaW9yaXR54oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPiAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3NjaGVkLmM6MTIyOjU6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHBy
b3RvdHlwZSBmb3Ig4oCYYW1kZ3B1X3NjaGVkX2lvY3Rs4oCZIFstV21pc3NpbmctcHJvdG90eXBl
c10KPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6
ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZp
ZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBm
ZndsbC5jaD4KPiBDYzogTHViZW4gVHVpa292IDxsdWJlbi50dWlrb3ZAYW1kLmNvbT4KPiBDYzog
QW5kcmVzIFJvZHJpZ3VleiA8YW5kcmVzeDdAZ21haWwuY29tPgo+IENjOiBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
U2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCkFwcGxpZWQu
ICBUaGFua3MhCgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfc2NoZWQuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3NjaGVkLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfc2NoZWQuYwo+
IGluZGV4IDBkYTBhMGQ5ODY3MjAuLmI3ZDg2MWVkNTI4NDkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3NjaGVkLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfc2NoZWQuYwo+IEBAIC0yOSw3ICsyOSw3IEBACj4gICNpbmNs
dWRlIDxkcm0vYW1kZ3B1X2RybS5oPgo+Cj4gICNpbmNsdWRlICJhbWRncHUuaCIKPiAtCj4gKyNp
bmNsdWRlICJhbWRncHVfc2NoZWQuaCIKPiAgI2luY2x1ZGUgImFtZGdwdV92bS5oIgo+Cj4gIGlu
dCBhbWRncHVfdG9fc2NoZWRfcHJpb3JpdHkoaW50IGFtZGdwdV9wcmlvcml0eSwKPiAtLQo+IDIu
MjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
