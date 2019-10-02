Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B22C8BFC
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 16:51:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EFBF89BD4;
	Wed,  2 Oct 2019 14:51:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F3189BD4;
 Wed,  2 Oct 2019 14:51:26 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id w14so26657943qto.9;
 Wed, 02 Oct 2019 07:51:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BFBQJKcoWFEsoedh3fU5Yan3pHcHh9XjwUhZKy85y8A=;
 b=NoLOFi7fp3Q6NoCmR8Vy/jIK60hX64TiwTIK2H2EB1pnZcZbXZlxq3s37B2mZtBIk1
 dQ0JGuqWYR1T5g6PX2JD4btL5dWjpq/kMyvxNh20HVscTb23PaylMVl60e76qv4JfSwy
 QArbjnI5H2p9j4HtRASZ+WZyxfImlTvx/78/HgIiwhpNkKpoPIZTycgvOOwsAEcxNFf7
 NjSSiRxqybKVcB53cfKFuXk1kSPF45oAxAqqljFU41VJ1FkMJeISBZiYIbkqnaJKEpzy
 trBMHGDKtLw8Jc6sh0ugVH2gE/++yl77XT90Vgx2FgM/FxJ6y60E+/6Yn3v0An+7CESa
 FrUA==
X-Gm-Message-State: APjAAAUGZNL3RKfS9FUQkz5h5IUn7L6gXePvQWCE4zKrFDNedmVzREVB
 lWRzE2+P4IRwfym22ttQcLMDIfDD07Xwi2EixwU=
X-Google-Smtp-Source: APXvYqxytpKY7md+ImYxw2tgO2LdMMwX5MTobPRAkiWizRa+eDP+sDnPS94ixm658TSE7sUrUSJHRI/Q/drWU7Qw1LM=
X-Received: by 2002:ac8:4a01:: with SMTP id x1mr4410955qtq.304.1570027885656; 
 Wed, 02 Oct 2019 07:51:25 -0700 (PDT)
MIME-Version: 1.0
References: <20191002120136.1777161-1-arnd@arndb.de>
 <20191002120136.1777161-5-arnd@arndb.de>
 <CADnq5_PkTwTBbQY9JatZD2_sWjdU5_hK7V2GLfviEvMh_QB12Q@mail.gmail.com>
In-Reply-To: <CADnq5_PkTwTBbQY9JatZD2_sWjdU5_hK7V2GLfviEvMh_QB12Q@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 2 Oct 2019 16:51:09 +0200
Message-ID: <CAK8P3a0KMT437okhobg=Vzi5LRDgUO7L-x35LczBGXE2jYLg2A@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/amd/display: fix dcn21 Makefile for clang
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: clang-built-linux <clang-built-linux@googlegroups.com>,
 Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMiwgMjAxOSBhdCA0OjE3IFBNIEFsZXggRGV1Y2hlciA8YWxleGRldWNoZXJA
Z21haWwuY29tPiB3cm90ZToKPgo+IEknbSBnZXR0aW5nIGFuIGVycm9yIHdpdGggZ2NjIHdpdGgg
dGhpcyBwYXRjaDoKPiAgIENDIFtNXSAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlz
cGxheS9kYy9kY24yMS9kY24yMV9yZXNvdXJjZS5vCj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvLi4vZGlzcGxheS9kYy9kY24yMS9kY24yMV9yZXNvdXJjZS5jOiBJbgo+IGZ1bmN0aW9uIOKA
mGNhbGN1bGF0ZV93bV9zZXRfZm9yX3ZsZXZlbOKAmToKPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS8uLi9kaXNwbGF5L2RjL2RjbjIxL2RjbjIxX3Jlc291cmNlLmM6OTY0OjIyOgo+IGVycm9y
OiBTU0UgcmVnaXN0ZXIgcmV0dXJuIHdpdGggU1NFIGRpc2FibGVkCgpJIGNoZWNrZWQgYWdhaW4g
d2l0aCBnY2MtOCwgYnV0IGRvIG5vdCBzZWUgdGhhdCBlcnJvciBtZXNzYWdlLgoKPiA+IC1DRkxB
R1NfJChBTUREQUxQQVRIKS9kYy9kY24yMS9kY24yMV9yZXNvdXJjZS5vIDo9IC1taGFyZC1mbG9h
dCAtbXNzZSAtbXByZWZlcnJlZC1zdGFjay1ib3VuZGFyeT00Cj4gPiArQ0ZMQUdTXyQoQU1EREFM
UEFUSCkvZGMvZGNuMjEvZGNuMjFfcmVzb3VyY2UubyA6PSAtbWhhcmQtZmxvYXQgLW1zc2UgJChj
Y19zdGFja19hbGlnbikKCk5vdGhpbmcgc2hvdWxkIHJlYWxseSBjaGFuZ2Ugd2l0aCByZWdhcmRz
IHRvIHRoZSAtbXNzZSBmbGFnIGhlcmUsIG9ubHkKdGhlIHN0YWNrIGFsaWdubWVudCBmbGFnIGNo
YW5nZWQuIE1heWJlIHRoZXJlIHdhcyBzb21lIG90aGVyIGNoYW5nZQppbiB5b3VyIE1ha2VmaWxl
IHRoYXQgY29uZmxpY3RzIHdpdGggbXkgbXkgcGF0Y2g/CgogICAgICAgQXJuZApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
