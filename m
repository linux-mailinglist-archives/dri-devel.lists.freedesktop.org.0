Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 884633893F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 13:42:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA36589D67;
	Fri,  7 Jun 2019 11:42:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD2F89D67
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 11:42:27 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3B5C720B7C
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 11:42:27 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id h21so1766663qtn.13
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2019 04:42:27 -0700 (PDT)
X-Gm-Message-State: APjAAAVWoTXjPBBTLonEBGqrG1xMUp7qQliUTSFhTOSzLFZzhbt36wx4
 rrlcqSb4E31CGOxW91OBrzHOHDuHz2Jxjidp5H4=
X-Google-Smtp-Source: APXvYqxWsqbCLz0Gmek+Ux+/LZU2GTAjipJvu+ZO5kwQi8bahO9W8pLnNB5kCTJ5Nr+2wSq3aQ8OD5xRPfqomxaW/bI=
X-Received: by 2002:a0c:b0c6:: with SMTP id p6mr23657100qvc.225.1559907746512; 
 Fri, 07 Jun 2019 04:42:26 -0700 (PDT)
MIME-Version: 1.0
References: <1559556812-25233-1-git-send-email-dkos@cadence.com>
In-Reply-To: <1559556812-25233-1-git-send-email-dkos@cadence.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 7 Jun 2019 07:42:15 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5edxacp4JeTzgmd0_BXaFcnng9tDdjxpB5bBu8NG2esA@mail.gmail.com>
Message-ID: <CA+5PVA5edxacp4JeTzgmd0_BXaFcnng9tDdjxpB5bBu8NG2esA@mail.gmail.com>
Subject: Re: [PATCH v2] linux-firmware: update firmware for mhdp8546
To: Damian Kos <dkos@cadence.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1559907747;
 bh=y0pbFglpzzcktYdS2zUKvNuZ02VFU2zS2tIoSTs5zXU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=2B2Id+Jl4Qp26uL3emYXYxvKV65qR2wWk+Hb96tq/gRR56i32y1UTEkJcPKuGbvJh
 A5QG4JPMhR2RwHgsj8Fj9gi6sjKXIssrg9Jme4ty+goJ/PKl4o79Kv4N7KtHgAaRbb
 jMXQ/584C0prxtZyu8axWyrNM3elZnj5cmWVBKtw=
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
Cc: mparab@cadence.com, rafalc@cadence.com, jbergsagel@ti.com,
 Linux Firmware <linux-firmware@kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>, tomi.valkeinen@ti.com,
 jsarha@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMywgMjAxOSBhdCA3OjA2IEFNIERhbWlhbiBLb3MgPGRrb3NAY2FkZW5jZS5j
b20+IHdyb3RlOgo+Cj4gVGhpcyBwYXRjaCB1cGRhdGVzIG1oZHA4NTQ2IGZpcm13YXJlIGZyb20g
djEuMi4xMiB0byB2MS4yLjE1Lgo+Cj4gQWRkZWQgc3VwcG9ydCBmb3IgcGVyZm9ybWluZyBhcmJp
dHJhcnkgSTJDLW92ZXItQVVYIHRyYW5zYWN0aW9ucy4KPiBDb3JyZWN0ZWQgaGFuZGxpbmcgb2Yg
ZXJyb25lb3VzIHJlcXVlc3RzIGZvciByZWFkaW5nL3dyaXRpbmcgMCBieXRlcyBvdmVyIERQQ0Qu
Cj4gQWRkIG1haWxib3ggbWVzc2FnZSB0byBmb3JjZSB1Q1BVIGZhdGFsIGVycm9yLgo+Cj4gU2ln
bmVkLW9mZi1ieTogRGFtaWFuIEtvcyA8ZGtvc0BjYWRlbmNlLmNvbT4KPiAtLS0KPiAgV0hFTkNF
ICAgICAgICAgICAgICAgfCAgIDIgKy0KPiAgY2FkZW5jZS9taGRwODU0Ni5iaW4gfCBCaW4gMTMx
MDcyIC0+IDEzMTA3MiBieXRlcwo+ICAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCgpBcHBsaWVkIGFuZCBwdXNoZWQgb3V0LgoKam9zaApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
