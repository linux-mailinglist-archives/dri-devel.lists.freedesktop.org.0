Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FCB9C301
	for <lists+dri-devel@lfdr.de>; Sun, 25 Aug 2019 13:26:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD47589FA0;
	Sun, 25 Aug 2019 11:26:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F5C6E0F3
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Aug 2019 11:26:02 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id z51so21861079edz.13
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Aug 2019 04:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=JXdKiVxOvcxDiqpCkFdo5BKKb8Sy8tRGIsQMOJGzLEw=;
 b=HQc64i3FhxAhHIOC7+vjFkOUAhqUiDiMVeS++QuJvVorJpdEo1DS1ybMgeIHl4gavP
 K/Y0ooKE7FyYUNObL8T/i2kOqcI13pMLUAmuO7fd5oF+MDHkcp1qtazcECCx3UbR4AnD
 i6ZktmSm6wV14b//J0Bk5FT+wVdsyrQipJHaZ90BHRAUB72sxHdAnDzpwnT+LtlQwtHl
 /z3v56yCM9KpK1oHaHQWOgOxYwHSzAtIx8x4vyecy/yPDqE9wo6w8/fWjwUC0ZrkZzu3
 BAxQAW9eKDZpfy9KsIejNZ0docb97b2j2pXRwtufTmQ7gPwO0ZPIoJ8niYCQEQWt5OMY
 QtIw==
X-Gm-Message-State: APjAAAUfp3dUzOeVqxKS6U+g5p/6CrTr/B5Ad11dkVJ79ynh24iMPNYP
 tuYgEiWg5Hyk0YD/ITBJDfclOW5WfgeRfl9X7TcF3A==
X-Google-Smtp-Source: APXvYqzWA7OjCmTGUgTTfOMgAxFq1cBvShuAHQFrAPXHNeOz57gu15HH7HmsrhR7Ze3fNpJMnN1C4HQx9G1JIlNJNN8=
X-Received: by 2002:a17:906:2312:: with SMTP id
 l18mr2767147eja.177.1566732361422; 
 Sun, 25 Aug 2019 04:26:01 -0700 (PDT)
MIME-Version: 1.0
From: Ivan D <ivdivd0@gmail.com>
Date: Sun, 25 Aug 2019 14:25:50 +0300
Message-ID: <CADAXeK10uN6wM2NgSxyLwr9cjBLU5qpAKzr=Ctfhv-qXkzbd1Q@mail.gmail.com>
Subject: XGI DRM driver as a practice?
To: dri-devel@lists.freedesktop.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=JXdKiVxOvcxDiqpCkFdo5BKKb8Sy8tRGIsQMOJGzLEw=;
 b=QbZMS8RTVvGYNkwPy0wuBFn4Wh/e+NXlxfv5L9FBjH7+dEGxy5pIoprBpx6fM+pe1r
 KZJrcvsFxesNaFJelSjmxBhm1tcOQZxVZSKZta+/5ZyRGkDrReDL+PqqbNuZzZMgpBgk
 pVNNesq1v1gfc0+VakH21q4gT039QONahb3ssMT8q826d5dxP55AKqUhKIbYK45Vgi0M
 dZFsLV6YM2/zsURrku69NVh52lwYfuEpvUWpdiH4dy4Rw+hf6wHyaWcnQFqgtiB4wYAp
 NrDjejsC2EZZPBqu7Qoiea8IFxCZ4IQRAYnGfy/KBJ5NFMgvVY75YwP9bfTY5OPn8/qV
 uDzA==
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
Cc: jong_lin@xgitech.com, peterhuewe@gmx.de, thomas@winischhofer.net,
 idr@freedesktop.org, aaro.koskinen@iki.fi
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSdkIGxpa2UgdG8gbGVhcm4gRFJNIHN1YnN5c3RlbSBhbmQgR1BVIGRyaXZlciBkZXZlbG9wbWVu
dCBhbmQgSSB3YXMKdGhpbmtpbmcgYWJvdXQgYWJvdXQgd3JpdGluZyBYR0kgRFJNIGRyaXZlciBh
cyBhIHByYWN0aWNlIHByb2plY3QKc2luY2U6Ci0gdGhlcmUncyAob3Igd2FzIHVudGlsIHJlY2Vu
dGx5KSBzdGFnaW5nIGZiZGV2IGRyaXZlciB0aGF0IHNob3VsZApob3BlZnVsbHkgYmUgd29ya2lu
ZwotIGl0J3Mgc3RpbGwgcG9zc2libGUgdG8gYnV5IHRoaW4gY2xpZW50IEhXIHdpdGggWEdJIFox
MSBydW5uaW5nIExpbnV4CgpEb2VzIGl0IG1ha2Ugc2Vuc2UgYXQgYWxsPyBJIGRvIGhhdmUga2Vy
bmVsIGV4cGVyaWVuY2UgYnV0IGtub3cgdmVyeQpsaXR0bGUgYWJvdXQgRFJNIGFuZCBncmFwaGlj
cy4gT25lIGlzc3VlIGlzIGFic2VuY2Ugb2YgZG9jdW1lbnRhdGlvbiwKYnV0IHRoZXJlIGNvdWxk
IGJlIGFzIHdlbGwgb3RoZXJzIEknbSBub3QgZXZlbiBhd2FyZSBvZi4KSWYgdGhlcmUncyBhIGJl
dHRlciBhcHByb2FjaCB0aGFuIHRoaXMgcGxlYXNlIGRyb3AgbWUgYSBsaW5lLgoKQWxzbyBwdXR0
aW5nIHJlbGV2YW50IHBlb3BsZSBmcm9tIGNvbW1pdCBsb2cgdG8gQ0MsIGhvcGUgaXQncyBvay4K
ClRoYW5rcywKSXZhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
