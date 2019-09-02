Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9A1A4F46
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 08:40:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A9F89B4D;
	Mon,  2 Sep 2019 06:40:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com
 [IPv6:2607:f8b0:4864:20::e36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ABB389B4D
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 06:40:03 +0000 (UTC)
Received: by mail-vs1-xe36.google.com with SMTP id m62so8536655vsc.8
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Sep 2019 23:40:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=6jWoULjuAw+FW+6z0fRA2bBU24PJgAmTc0uDqrBy43c=;
 b=IhLgZPsI76RpISwwu/97w0PmEz+K9SOQcANc7vxM6N7ZHEhnSriXB+LORhNwzUItsz
 nl0+dETAsC+JJ02vZhPxb9lmU/ArxXlj9/jHlgiAgMSyxuVKza5nz+8azi7bNELX5hNQ
 HATwCz7GW7g1B2BQw/JfP239fDpt590mCbf9LvO7fJXC8WQFqTgP4M6ecHv8Y6My8XbK
 HvgBsDmd//Ks4jXGPwoVI83yuVtkXmQ/ls7gfpYrlYL+F5P+ofGhfp0xasOGMB+qUd8t
 CYYYvXIif2nxq12z5ArI+vJ90z3E92T79LUeJ39bEhymyg+u4xEVuaz4QcHPR8xofuZX
 aQgQ==
X-Gm-Message-State: APjAAAXIFpZDy20jY/6FmQBUQKKy22CEcWzP97ooak1lgTikBNWb93TI
 RwBQg6X4mufv47Kw+0BbFvPfvfLJ8G69bi8sIys=
X-Google-Smtp-Source: APXvYqzMIgUVtEAPU0dr6jZw7UbyL+eVb6M2SbKc0iw57MLIVgXZaXPYNfNgtN3/SigQqazF1Qh4xsnm4BLgnne6BXQ=
X-Received: by 2002:a67:ad0f:: with SMTP id t15mr9570762vsl.204.1567406402507; 
 Sun, 01 Sep 2019 23:40:02 -0700 (PDT)
MIME-Version: 1.0
From: Ben Skeggs <skeggsb@gmail.com>
Date: Mon, 2 Sep 2019 16:39:51 +1000
Message-ID: <CACAvsv5uGLgDY8V8pWgEH0-YhkCEgvHE=NZ1W_m0gJaoFPuQ0g@mail.gmail.com>
Subject: nouveau-fixes 5.3
To: Dave Airlie <airlied@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=6jWoULjuAw+FW+6z0fRA2bBU24PJgAmTc0uDqrBy43c=;
 b=kDwDhz/MT++hG1LLmr1rk/yJQiKlxWaVf77lb1V3f08EcPk1hoQed8sGDO/Rg1Iifn
 /uUo1HZ5Q4oHQ5mYQmb1ni6wogmabnP3E9HMDkb1iIg4D1FUpzoPpFWT2Uq81/8qpi+z
 D9jM+WXKiH6JS0RYbmMJkL9GXKD1SjUDmiPjLUjwGwpaCAGjeZk2bgBnxlwXaEKttrt/
 rJVo9EzBBphDt4TVeE+kPW65MOiZVjtZl0eeys/h7lU53in99WabHAmp4OOwlPpjsVG6
 dDxi3+J53tBEQQGhw5xqhz4dF4qcI3BOehmI+Z0uLCz0IkxNsX5yN8ocpi9niml2PnhG
 IMog==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGV5IERhdmUsCgpKdXN0IGEgc2luZ2xlIGNvbW1pdCBhZGRpbmcgc29tZSBtaXNzaW5nIE1PRFVM
RV9GSVJNV0FSRSBsaW5lcwpyZXF1aXJlZCBieSBpbml0cmFtZnMgZ2VuZXJhdG9ycyB0byBwaWNr
IHVwIHRoZSBuZXdlciBmaXJtd2FyZQpyZXZpc2lvbnMuCgpUaGFua3MsCkJlbi4KClRoZSBmb2xs
b3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgYzM1OGViZjU5NjM0ZjA2ZDhlZDE3NmRhNjUxZWMx
NTBkZjNjODY4NjoKCiAgZHJtL25vdXZlYXU6IERvbid0IHJldHJ5IGluZmluaXRlbHkgd2hlbiBy
ZWNlaXZpbmcgbm8gZGF0YSBvbiBpMmMKb3ZlciBBVVggKDIwMTktMDgtMjMgMTI6NDI6NDMgKzEw
MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgZ2l0Oi8vZ2l0
aHViLmNvbS9za2VnZ3NiL2xpbnV4IGxpbnV4LTUuMwoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2Vz
IHVwIHRvIDU1ZjdlNWMzNjRkY2UyMGU2OTFmZGEzMjlmYjJhNmNjM2NiYjYzYjY6CgogIGRybS9u
b3V2ZWF1L3NlYzIvZ3AxMDI6IGFkZCBtaXNzaW5nIE1PRFVMRV9GSVJNV0FSRXMgKDIwMTktMDkt
MDIKMTY6MzU6NTEgKzEwMDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkJlbiBTa2VnZ3MgKDEpOgogICAgICBkcm0vbm91
dmVhdS9zZWMyL2dwMTAyOiBhZGQgbWlzc2luZyBNT0RVTEVfRklSTVdBUkVzCgogZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvc2VjYm9vdC9ncDEwMi5jIHwgMTIgKysrKysrKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
