Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D542A500
	for <lists+dri-devel@lfdr.de>; Sat, 25 May 2019 16:56:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 320D089ED6;
	Sat, 25 May 2019 14:56:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F1F89ED6
 for <dri-devel@lists.freedesktop.org>; Sat, 25 May 2019 14:56:51 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id z5so11101247lji.10
 for <dri-devel@lists.freedesktop.org>; Sat, 25 May 2019 07:56:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/X+8YB2j/JqfHhLDF3OiGnGgSAUQclrWd6VzxGsSk7I=;
 b=tHvhZ0bz1adsoO+9IUePGOeqgsmfKrIPSfOSYHcIst5ngbFxqS0fSKwrjWt0Y0Amgw
 9TvwPgmCnn2+2JA4SCAh6etVVt8iIKHkwAXDQNLO9mqQMb74GH3Wmt7LN02kyDa+xtop
 SzKL4OqqN146eY74HbpBiGLwIqMopVlxOpCNsBZhN1RbHCtjaD6fBQZWuVNlyux0wqDw
 WZstngkhh7tIq1DAcn6jREUI6vct98nNKP/Hvc85mQrGzRJB9slqaCizBahoy9+z/Wb0
 UaeLQCcDjShpRTwvrJNnc5SolGsxym3iuijBW7Tjn9uLyKObVSQJShX2ASepb+Qd3tXa
 1/AA==
X-Gm-Message-State: APjAAAWjRWH0K8VkQz7y8N3W3LD05+fykRvIEy3TMEN8YluH0HQuMNX5
 zLCh00KAKss7X01u8e9qo3g1Z8Y4hBIpcJy2h5Dvtw==
X-Google-Smtp-Source: APXvYqy/C4aHpdudpJGrMgEHpV92vAqgewvnVpa6r5ORKNXVBwmpANtU+dFdH1pIoknedidtAj9htXb5M+c3Lt/tv20=
X-Received: by 2002:a05:651c:1056:: with SMTP id
 x22mr34854028ljm.45.1558796210112; 
 Sat, 25 May 2019 07:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190525073026.GA7114@hari-Inspiron-1545>
In-Reply-To: <20190525073026.GA7114@hari-Inspiron-1545>
From: Matteo Croce <mcroce@redhat.com>
Date: Sat, 25 May 2019 16:56:14 +0200
Message-ID: <CAGnkfhzauQGgGdvPtkNcdGkjvo1BsORxZ6f3SzGzQYuYCDetUg@mail.gmail.com>
Subject: Re: [PATCH] drm/omapdrm: fix warning PTR_ERR_OR_ZERO can be used
To: Hariprasad Kelam <hariprasad.kelam@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBNYXkgMjUsIDIwMTkgYXQgOTozMCBBTSBIYXJpcHJhc2FkIEtlbGFtCjxoYXJpcHJh
c2FkLmtlbGFtQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBmaXggYmVsb3cgd2FybmluZ3MgcmVwb3J0
ZWQgYnkgY29jY2ljaGVjawo+CgpIaSwKCmEgc2ltaWxhciBwYXRjaCB3YXMgbmFja2VkIGJlY2F1
c2UgaXQgbWFrZXMgYmFja3BvcnRzIG1vcmUgZGlmZmljdWx0OgoKaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGttbC8zZGVjNDA5My04MjRlLWIxM2QtZDcxMi0yZGVkZDQ0NWE3YjdAdGkuY29tLwoK
VG9taSwgd2hhdCdzIHlvdXIgdGhvdWdodD8KCi0tIApNYXR0ZW8gQ3JvY2UKcGVyIGFzcGVyYSBh
ZCB1cHN0cmVhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
