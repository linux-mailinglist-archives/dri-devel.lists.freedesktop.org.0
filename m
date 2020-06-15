Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 525101F9974
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 16:01:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B76C6E32D;
	Mon, 15 Jun 2020 14:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B04426E32C
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 14:01:05 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3A212207F5
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 14:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592229665;
 bh=4ZrW2imLQHEXjli9BMhglqZFIS7OW1wia511Wm26A1U=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=K/KRxrBXnu5c9C61GD1bP9YnkYAS8ruyvyXbp1IrTBwyjJw+wcLWprnxL6Pt+0wlm
 iClKngonSjFnN4GcpEb/ADtDlsiWUqvVUKQ8JDCe6hgbWqgJU1vZkvsgZoL6NfpZR3
 B5ltzhb/M60tsPAqEQpKTzCJp69GVQrDZHrDNus0=
Received: by mail-ed1-f43.google.com with SMTP id c35so11605338edf.5
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 07:01:05 -0700 (PDT)
X-Gm-Message-State: AOAM531xffFaJ3fsjvqGUzCwEoQGWhDbwXe6TmZOli4hKpb9RByjaB9T
 dqIYxWMWLHjHxxw8Ph8lRiyfBg3A+eGaDi9uWw==
X-Google-Smtp-Source: ABdhPJzhTQFzeEH1zu8mZaCAKp7pknQNSxFhk52tv3DYlzeZp7BzgLrUFynXCoEueO+cSHinJ+GV8Pn0MiN3cVMAAd0=
X-Received: by 2002:a05:6402:1247:: with SMTP id
 l7mr22777542edw.61.1592229663698; 
 Mon, 15 Jun 2020 07:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200612124007.4990-1-bernard@vivo.com>
 <48891eaf60c5e0c449e573a906894db2c3a7b72c.camel@perches.com>
In-Reply-To: <48891eaf60c5e0c449e573a906894db2c3a7b72c.camel@perches.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 15 Jun 2020 22:00:52 +0800
X-Gmail-Original-Message-ID: <CAAOTY__sSV2f4MqSLJYvSW9TGV=bCKXz+zELYREaEOFVjA6XQQ@mail.gmail.com>
Message-ID: <CAAOTY__sSV2f4MqSLJYvSW9TGV=bCKXz+zELYREaEOFVjA6XQQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: remove unnecessary conversion to bool
To: Joe Perches <joe@perches.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, opensource.kernel@vivo.com,
 David Airlie <airlied@linux.ie>, Bernard Zhao <bernard@vivo.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sm9lIFBlcmNoZXMgPGpvZUBwZXJjaGVzLmNvbT4g5pa8IDIwMjDlubQ25pyIMTXml6Ug6YCx5LiA
IOS4iuWNiDQ6NDHlr6vpgZPvvJoKPgo+IE9uIEZyaSwgMjAyMC0wNi0xMiBhdCAyMDo0MCArMDgw
MCwgQmVybmFyZCBaaGFvIHdyb3RlOgo+ID4gSW4gZnVuY3Rpb24gbXRrX2RzaV9jbGtfaHNfc3Rh
dGUsIHJlbW92ZSB1bm5lY2Vzc2FyeSBjb252ZXJzaW9uCj4gPiB0byBib29sIHJldHVybiwgdGhp
cyBjaGFuZ2UgaXMgdG8gbWFrZSB0aGUgY29kZSBhIGJpdCByZWFkYWJsZS4KPiBbXQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gW10KPiA+IEBAIC0zMTksNyArMzE5LDcgQEAgc3Rh
dGljIGJvb2wgbXRrX2RzaV9jbGtfaHNfc3RhdGUoc3RydWN0IG10a19kc2kgKmRzaSkKPiA+ICAg
ICAgIHUzMiB0bXBfcmVnMTsKPiA+Cj4gPiAgICAgICB0bXBfcmVnMSA9IHJlYWRsKGRzaS0+cmVn
cyArIERTSV9QSFlfTENDT04pOwo+ID4gLSAgICAgcmV0dXJuICgodG1wX3JlZzEgJiBMQ19IU19U
WF9FTikgPT0gMSkgPyB0cnVlIDogZmFsc2U7Cj4gPiArICAgICByZXR1cm4gKCh0bXBfcmVnMSAm
IExDX0hTX1RYX0VOKSA9PSAxKTsKPgo+IEdpdmVuOgo+Cj4gZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kc2kuYzojZGVmaW5lIExDX0hTX1RYX0VOICAgICAgICAgICAgICAgICAgQklUKDAp
Cj4KPiBUaGlzIGlzIGxpa2VseSBjbGVhcmVyIGFzCj4KPiAgICAgICAgIHJldHVybiB0bXBfcmVn
MSAmIExDX0hTX1RYX0VOOwo+Cj4gb3IgZXZlbgo+Cj4gc3RhdGljIGJvb2wgbXRrX2RzaV9jbGtf
aHNfc3RhdGUoc3RydWN0IG10a19kc2kgKmRzaSkKPiB7Cj4gICAgICAgICByZXR1cm4gcmVhZGwo
ZHNpLT5yZWdzICsgRFNJX1BIWV9MQ0NPTikgJiBMQ19IU19UWF9FTjsKPiB9CgpJIGxpa2UgdGhl
IHNlY29uZCBvbmUuCgo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
