Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A42B19EF30
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 17:42:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 400F589AAD;
	Tue, 27 Aug 2019 15:41:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 094D889A9F;
 Tue, 27 Aug 2019 15:41:55 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c3so19287966wrd.7;
 Tue, 27 Aug 2019 08:41:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Bxn2QHPQaoLTHaLh1S1+V6Gu5XpRhaWezO35cut4r8Q=;
 b=TlIoglJNgJHkhEfmq9stSLL7jrjVD3qZUvUzv0UmAYXzbUA6iyEW2WK4g60LDe/uG8
 Lvn4iKgd9B53UZIMegJJF13u5O29+I6YJKL85eusCHaX16UrvpQcT3e5pZJ97Xe6sMiO
 zti/KDDyGCVpdofFhPW5GbHOOomImXWii9QluZ9fnkRLRIgXt/FIjgvyOW8kiRjGqQrR
 b4RjpGWjX1qr7719FrsZNn5so+zsY2E/2q+w1Mbw2a8VegAWTt0lK4SzNKmb+lCdX3/J
 G1N16srymjdw+PGc1wZ2FrzoCBVxjFBnOuRK625RMXMK68v0uQOX87ud56aeg5wUdRI1
 +9oA==
X-Gm-Message-State: APjAAAWVpGCmWjMfSyplqQvpVx/57GtLSojr6a/XyJcZ89AHo5EcbPub
 E9sDwPSP1Rjjl359rivgxgf1oO5HbihgbT9n2KA=
X-Google-Smtp-Source: APXvYqwKyiFqrPlh5yDoI88FFfW2D35INgtoq/jJAH8Hvv3vnTy27JdzrBLkWuV/hqW+iv91wYtkEr18W0/Cd+GtVG4=
X-Received: by 2002:a5d:6ccd:: with SMTP id c13mr8239699wrc.4.1566920513497;
 Tue, 27 Aug 2019 08:41:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190827190526.6f27e763@canb.auug.org.au>
 <3b5936f1-e471-846a-d133-0e17d290d2f3@infradead.org>
In-Reply-To: <3b5936f1-e471-846a-d133-0e17d290d2f3@infradead.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 27 Aug 2019 11:41:41 -0400
Message-ID: <CADnq5_NBnovQGuhsoEsw+S-LBDU-CbWXKm=mJ3Oy6PcgUeiOQw@mail.gmail.com>
Subject: Re: linux-next: Tree for Aug 27 (amdgpu)
To: Randy Dunlap <rdunlap@infradead.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Bxn2QHPQaoLTHaLh1S1+V6Gu5XpRhaWezO35cut4r8Q=;
 b=m0wMJypz/tc4k1Ou0Ldau4jp2J1H1jOI6WoNCDkVdCxF+Csdl+8WkWLs44l9DRZkMf
 acBefESXpA/28xRsiFZaLkb3/N2Qi3agh+kqbWzy73VABGuQrT74ouU+JHsx66g6yzZG
 LSZqOkiezFpiNNpAh/gIg291QBhVNaAVfiagkbNiPmgq7ZO3YbqkAEtU05bI1AmZ9Cr/
 Aq/0YkrProxOmI9BPqvo8AKQhVWTOHYyTcyEyOe+YnLGYbgrMJdwhnPCGlsIB4oeP4kG
 EJT0QMPMWeEzoeqDjFEAfp/MKtz6URt/q6+jUAcBxNkQ0huvjplA4cGEi9SZf5lBJKpC
 pTQQ==
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMTE6MzEgQU0gUmFuZHkgRHVubGFwIDxyZHVubGFwQGlu
ZnJhZGVhZC5vcmc+IHdyb3RlOgo+Cj4gT24gOC8yNy8xOSAyOjA1IEFNLCBTdGVwaGVuIFJvdGh3
ZWxsIHdyb3RlOgo+ID4gSGkgYWxsLAo+ID4KPiA+IENoYW5nZXMgc2luY2UgMjAxOTA4MjY6Cj4g
Pgo+Cj4gb24gaTM4NjoKPgo+IC4uL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3Bs
YXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYzogSW4gZnVuY3Rpb24g4oCYZGNuMjBfaHdfc2VxdWVu
Y2VyX2NvbnN0cnVjdOKAmToKPiAuLi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNw
bGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmM6MjEyNzoyODogZXJyb3I6IOKAmGRjbjIwX2RzY19w
Z19jb250cm9s4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZGlk
IHlvdSBtZWFuIOKAmGRjbjIwX2RwcF9wZ19jb250cm9s4oCZPwo+ICAgZGMtPmh3c3MuZHNjX3Bn
X2NvbnRyb2wgPSBkY24yMF9kc2NfcGdfY29udHJvbDsKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn4KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZGNuMjBfZHBwX3BnX2NvbnRyb2wKPgo+Cj4gRnVsbCByYW5kY29uZmlnIGZpbGUgaXMgYXR0YWNo
ZWQuCgpGaXhlZDoKaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9+YWdkNWYvbGludXgvY29t
bWl0Lz9oPWRybS1uZXh0JmlkPWRhMjZkZWQzYjJmZmY2NDZkMjg1NTkwMDQxOTVhYmUzNTNiY2U0
OWIKCkFsZXgKCj4KPiAtLQo+IH5SYW5keQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
