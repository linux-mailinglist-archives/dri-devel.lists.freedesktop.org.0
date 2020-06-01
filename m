Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 825761EA656
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 16:57:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA1189FD7;
	Mon,  1 Jun 2020 14:56:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 393FF89F35;
 Mon,  1 Jun 2020 14:56:58 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id p5so127384wrw.9;
 Mon, 01 Jun 2020 07:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=A7yLjJWQgA05QMveHPi8wozWe+k7dJWGf4g6dTMQ8rU=;
 b=KSRvXnjjrHf+uxJm9FU6yGqDPni7Pg//A4Io5VPd7T6LTd82/Pm7IhoUiQCCTelvEi
 1cNUclf7i8YKLk002jk9xmtM93n11Snuq6PO+ptR+u7KdSmW9xRzBq7dHQnJPr45H1Ah
 RBll3fXySMVJZ5NsAXtE4Z3BnYyQz3VEGZXf4gTQECNn6S/oshU1bi/BoNm2FJ9pCwEq
 8q45+5GTU11lBEnUg3tC8gh6OQwsv/oIXdDL6q61NY4uUvhIGCtfmWlD7N9wFZzRnbg0
 DBuHZdVxAZy/ybZm07ingwTi7NVe2sYvU958af0urri2tm/NdmwhLo+IECU13axb1KiS
 IQ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=A7yLjJWQgA05QMveHPi8wozWe+k7dJWGf4g6dTMQ8rU=;
 b=TpFOMNh56U/KfWx4+69taRovDrnpoePtbHN7rQSdXkzVf43HzaFLwCcU9N9nqfO7zi
 uv/wo7sU4YgH357KV4nVS+nNjcDRDBOteRyetOnDL4MfQCh2LwfWIsET6Ic0gtYNIBk/
 vih7kH4y5Yv7uwVWRIitcCdoCXtC6cY0N+JwHDemkZ08fzhQNG+LsCx89ZtJvz0TlLAb
 /gCAJBjiXaTgP+oFSvGsIaxtyZDuBfIqfQ16eeAxolE4hzZBf6FQiuDUqgAHRcDcBosx
 qc1pjlG/IdbtS1wWFv2b3pfakJyBy8QnDWmQugtUzBprArbuujAaPMEPefPTCBRI++UK
 9EgQ==
X-Gm-Message-State: AOAM533+acE/7Vrctba5DQ1mb5+EHRBAZOSeukuYOybVxj+tMXVL5QQL
 YJOfL7UDB5AmCsMjMTLPZ5YfyyT0pR4pZIGlUO0=
X-Google-Smtp-Source: ABdhPJxZb2JmhspJRIIEmegma1cJohuxLr8qrbjEfeMvqfPprKASUFYGMbbhRBJofFgITyEYn/snZ/Rf6BUupj2dXJU=
X-Received: by 2002:adf:fd41:: with SMTP id h1mr23162411wrs.374.1591023416802; 
 Mon, 01 Jun 2020 07:56:56 -0700 (PDT)
MIME-Version: 1.0
References: <etPan.5ed3b524.19a55007.762@yurikoles.com>
In-Reply-To: <etPan.5ed3b524.19a55007.762@yurikoles.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 1 Jun 2020 10:56:45 -0400
Message-ID: <CADnq5_PsXdPv1xL4swHqLQX5DPpWMPNV0aoSGmAgwEQpUoo=zg@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_Current_drm=2Dtip_doesn=E2=80=99t_build_with_gcc10_=2D_err?=
 =?UTF-8?Q?or_in_amdgpu=5Famdkfd=5Fgpuvm=2Ec?=
To: Yurii Kolesnykov <root@yurikoles.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, jghodd@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBNYXkgMzEsIDIwMjAgYXQgOTo0NiBBTSBZdXJpaSBLb2xlc255a292IDxyb290QHl1
cmlrb2xlcy5jb20+IHdyb3RlOgo+Cj4gT3JpZ2luYWxseSByZXBvcnRlZCBieSBqZ2hvZGRbMV0g
aW4gbGludXgtZHJtLXRpcC1naXQgQVVSIHBhY2thZ2UgWzJdLCBhbHNvIHJlcG9ydGVkIG9uIGRy
bS9hbWQgb24gRnJlZWRlc2t0b3AgR2l0TGFiIFszXS4KPgo+IGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYzogSW4gZnVuY3Rpb24g4oCYYW1kZ3B1X2FtZGtm
ZF9ncHV2bV9mcmVlX21lbW9yeV9vZl9ncHXigJk6IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYzoxMzU3OjI6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlv
biBvZiBmdW5jdGlvbiDigJhkcm1fZ2VtX29iamVjdF9wdXRfdW5sb2NrZWTigJk7IGRpZCB5b3Ug
bWVhbiDigJhkcm1fZ2VtX29iamVjdF9wdXRfbG9ja2Vk4oCZPyBbLVdlcnJvcj1pbXBsaWNpdC1m
dW5jdGlvbi1kZWNsYXJhdGlvbl0gMTM1NyB8ICBkcm1fZ2VtX29iamVjdF9wdXRfdW5sb2NrZWQo
Jm1lbS0+Ym8tPnRiby5iYXNlKTsgfCAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+IHwgIGRy
bV9nZW1fb2JqZWN0X3B1dF9sb2NrZWQgY2MxOiBzb21lIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQg
YXMgZXJyb3JzIG1ha2VbNF06ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5idWlsZDoyNjc6IGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0ub10gRXJyb3IgMSBtYWtl
WzNdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6NDg4OiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdV0gRXJyb3IgMiBtYWtlWzJdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6NDg4
OiBkcml2ZXJzL2dwdS9kcm1dIEVycm9yIDIgbWFrZVsxXTogKioqIFtzY3JpcHRzL01ha2VmaWxl
LmJ1aWxkOjQ4ODogZHJpdmVycy9ncHVdIEVycm9yIDIgbWFrZTogKioqIFtNYWtlZmlsZToxNzI5
OiBkcml2ZXJzXSBFcnJvciAyID09PiBFUlJPUjogQSBmYWlsdXJlIG9jY3VycmVkIGluIGJ1aWxk
KCkuIEFib3J0aW5n4oCmCj4KCkl0J3MgYW4gQVBJIGNoYW5nZSBpbiBkcm0tbWlzYy4gIFdoZW4g
bXkgdHJlZSBnZXRzIGNvbWJpbmVkIHdpdGgKZHJtLW1pc2MsIHRoZXJlIGlzIGEgY29uZmxpY3Qu
ICBJdCB3aWxsIGdldCByZXNvbHZlZCBvbmNlIHRoZSB0cmVlcwphcmUgaW4gc3luYyBhZ2Fpbi4K
CkFsZXgKCj4gWzFdIGh0dHBzOi8vYXVyLmFyY2hsaW51eC5vcmcvYWNjb3VudC9qZ2hvZGQKPiBb
Ml0gaHR0cHM6Ly9hdXIuYXJjaGxpbnV4Lm9yZy9wa2diYXNlL2xpbnV4LWRybS10aXAtZ2l0Cj4g
WzNdIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vYW1kLy0vaXNzdWVzLzExNTYK
Pgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBk
cmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
