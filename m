Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2664F5DE7E
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 09:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 570F96E0DD;
	Wed,  3 Jul 2019 07:13:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 576B089FEA
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 17:23:44 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id k8so38936332iot.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2019 10:23:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9TPe1WZsk5JII2uLTZByej7kWvrQvfzpP+5IqNRqtRY=;
 b=Kr8XVSM3bnrYf5xrtaz2QJYh7WmFNMA4poZPmC5h0igOBfFdPoT7zQPirS1WchlEtd
 UUxuMp87fH2HzhXhdQ6rl7ZaQj6n0gT0oYYP5SEFgVR3fkiINfCvRfOkptsvBa/K9z0T
 9u0QWcgo1iu1k6Y3g+CGmtv3FtZ1exeRlv3+eX9beF6uFyKApViSddE4YtqaLdRNzbww
 6NncpeN+QuZ6FaLm8bCsD8R8ZG7MAyVzfgml8RfbzbxtZDCEiOj6Mpc9EGAn222RkMfZ
 4IauoldGxnNJQSOAkgdSY7LVRu/htecVFMZ4GufzkCDbNBUXpV8JlegsV5OvQsNkLFZ6
 d8zg==
X-Gm-Message-State: APjAAAUowpdK5OlPvY5SMFgL3r+5YDuBifrS1MhLEP2XIG2GQ7F3UUQm
 00YU5eG7rysX/heoUB/DGd/ezQ5Vyuys3Fj6W28=
X-Google-Smtp-Source: APXvYqz105hEkDA6XCLEt80eTUJ3TwKxaueqvTovVQyU+1ub+0a/WHbeSrXKzUOmhNG5ooVFsfbTaMyWOHQV3/MVkyc=
X-Received: by 2002:a6b:3b89:: with SMTP id i131mr368509ioa.33.1562088223667; 
 Tue, 02 Jul 2019 10:23:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190702154419.20812-1-robdclark@gmail.com>
 <20190702154419.20812-4-robdclark@gmail.com>
 <CAOCk7NrXko8xR1Ovg6HrP2ZpS83mjZoOWdae-mq_QJMRzeENLQ@mail.gmail.com>
 <CAF6AEGsUve1NnzF2kEeW0jwgXnxZTgFaHbq-c-+CKru1jS9tWg@mail.gmail.com>
In-Reply-To: <CAF6AEGsUve1NnzF2kEeW0jwgXnxZTgFaHbq-c-+CKru1jS9tWg@mail.gmail.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Tue, 2 Jul 2019 11:23:33 -0600
Message-ID: <CAOCk7Nq91abTQ02dUNY=8_mgY_kuwU4MFxdO71AjWz1nwUkBGA@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/bridge: ti-sn65dsi86: correct dsi mode_flags
To: Rob Clark <robdclark@gmail.com>
X-Mailman-Approved-At: Wed, 03 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=9TPe1WZsk5JII2uLTZByej7kWvrQvfzpP+5IqNRqtRY=;
 b=vOcEnw18V4YTII1N0thEq0xS9oHbklSy1elc9OV680vGSJdWoikVhrHgoILnPtEH9f
 YKSjdQGRpAao5qPJP4d+sXuSorYCBgOcY21ov/B+RSj8d41QFWujdByF0nyIw+sBf3Qg
 00ZgBKqVrHOCAK7yPDDU5Qy7gx8v4c8IJnEUzyI8akPsLoNjSPO97sEKhgNUS1g8ELIs
 Plyv3w7jDLRdFpS1hY8mkjG8zREUTq+7gy3nVkhMxPl9MGpiCP8+nddagcDlcuEkJ5hh
 6TDsxcuUgk0LfORGK32UHXx6WOlxr4B0xtmXQZQIPD1WkrFmFYS7tmR8NJ47o71BxDJH
 KFKA==
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 MSM <linux-arm-msm@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMiwgMjAxOSBhdCAxMToxMiBBTSBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBKdWwgMiwgMjAxOSBhdCAxMDowOSBBTSBKZWZmcmV5
IEh1Z28gPGplZmZyZXkubC5odWdvQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gVHVlLCBK
dWwgMiwgMjAxOSBhdCA5OjQ2IEFNIFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4gd3Jv
dGU6Cj4gPiA+Cj4gPiA+IC0gICAgICAgZHNpLT5tb2RlX2ZsYWdzID0gTUlQSV9EU0lfTU9ERV9W
SURFTyB8IE1JUElfRFNJX01PREVfVklERU9fU1lOQ19QVUxTRSB8Cj4gPiA+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgTUlQSV9EU0lfTU9ERV9FT1RfUEFDS0VUIHwgTUlQSV9EU0lfTU9ERV9W
SURFT19IU0U7Cj4gPiA+ICsgICAgICAgZHNpLT5tb2RlX2ZsYWdzID0gTUlQSV9EU0lfTU9ERV9W
SURFTzsKPiA+Cj4gPiBEaWQgeW91IGNoZWNrIHRoaXMgYWdhaW5zdCB0aGUgZGF0YXNoZWV0PyAg
UGVyIG15IHJlYWRpbmcsIEVPVF9QQUNLRVQKPiA+IGFuZCBWSURFT19IU0UgYXBwZWFyIHZhbGlk
LiAgSSBkb24ndCBrbm93IGFib3V0IFZJREVPX1NZTkNfUFVMU0UuCj4KPiBUaGUgRU9UIGZsYXQg
aXMgYmFkbHkgbmFtZWQ6Cj4KPiAvKiBkaXNhYmxlIEVvVCBwYWNrZXRzIGluIEhTIG1vZGUgKi8K
PiAjZGVmaW5lIE1JUElfRFNJX01PREVfRU9UX1BBQ0tFVCAgICBCSVQoOSkKPgo+IEkgY2FuIGRv
dWJsZSBjaGVjayBvdXQgSFNFLCBidXQgdGhpcyB3YXMgb25lIG9mIHRoZSBzZXR0aW5nCj4gZGlm
ZmVyZW5jZXMgYmV0d2VlbiBib290bG9hZGVyIGFuZCBrZXJuZWwKCkFoIHllYWgsIHlvdSBhcmUg
cmlnaHQuICBNeSBleWVzIGFwcGFyZW50bHkgc2tpcHBlZCBvdmVyIHRoZSAiZGlzYWJsZSIuCgpJ
ZiB0aGUgYm9vdGxvYWRlciBpcyBub3Qgc2V0dGluZyB0aGUgSFNFLCB0aGVuIEkgY2FuJ3QgdGhp
bmsgb2YgYQpyZWFzb24gd2h5IHdlIHdvdWxkIGJlIGhhdmluZyBhbiBpc3N1ZSBhbHNvIG5vdCBz
ZXR0aW5nIGl0LgoKU2VlbXMgZ29vZCB0byBtZQoKUmV2aWV3ZWQtYnk6IEplZmZyZXkgSHVnbyA8
amVmZnJleS5sLmh1Z29AZ21haWwuY29tPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
