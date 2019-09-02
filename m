Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CD8A5C02
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 20:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5369898FD;
	Mon,  2 Sep 2019 18:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96097898FD
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 18:03:19 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id u15so13617714ljl.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 11:03:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+GlDOt+o+HD+HxVwzY+bzh9aqRjhXGkMbhwzNqAT4+Q=;
 b=c2YGGZ2r6Pxzg3scNwdStgBFmB7HnVNIrS1UqME/q2GEwyVInmwTpih6MLtuVWBrSK
 RSoLIPUyx3hYk2zjXErmnYipvU5jEXT4UWh/srjLXyQIFruVHc0lTyBVUJCg7DWjRazJ
 qXHoYQJZcJfg4glz/yYGQ8CBwWrEOEj/iUd5vP5o2dso3EnzFmWDNWdlH3vexZ0nWQOm
 3ylC1shA7cEGJ49Csv3UgW5eYYNeSQZ4JhEZcxAGdhMUyjvK2fCSWBu5u8sNZYBsTLWB
 7cbWsfwnMBCfPBiAsN0jr6YvsA2pFI8wn31KfZbttQgGiPOmLut0fEXvQKMIJGgUtppr
 Apiw==
X-Gm-Message-State: APjAAAXkK1/LYbyMVwNqfokx5H1Cg+cYmylagElAkbsfTxvwLPeTTeH4
 nWyMrLEykqV8aCXJJjyl1n2Zzpn4OdWESCU8JKk=
X-Google-Smtp-Source: APXvYqw3uGqCC/Aeh6KW9aj7n/ZyCM5bZzzeP3XTs4AwaMgSeLywg3Vw9blMfQI0s/+b7MQ/wckDEG98AdeHGsE/ouc=
X-Received: by 2002:a2e:89da:: with SMTP id c26mr11185585ljk.214.1567447397913; 
 Mon, 02 Sep 2019 11:03:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5Cuk+t16bNFA+sm5=ZEdf+BNRtSpX27OCoQ==DbEyBtCw@mail.gmail.com>
 <ec11a377-fca3-ed12-2a05-abb3de936f8b@arm.com>
In-Reply-To: <ec11a377-fca3-ed12-2a05-abb3de936f8b@arm.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 2 Sep 2019 15:03:12 -0300
Message-ID: <CAOMZO5BK0CJ8aA0CdBrYF75FRRHjqm0aOM4TpS9C+nHVuD8M_w@mail.gmail.com>
Subject: Re: Adreno crash on i.MX53 running 5.3-rc6
To: Robin Murphy <robin.murphy@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=+GlDOt+o+HD+HxVwzY+bzh9aqRjhXGkMbhwzNqAT4+Q=;
 b=H0Z8LDCqvri1PKKUyczT8H+I5JfLKHMsjAVO8D/KMzAUAiG+SV3MflpbAstHOYdPJv
 WSkqGlJTibqg/vCTIT/EQzdC9ndGMriiTdJ85QU73gOnK0XhE+bKys7wAL5W0iW6Kk6G
 hjGRj7Wxr1s59hgroDwEoQZ7EA3ilh8uIActHt+0Fs88IS8i39dsA9WoLqiK6b5u1M50
 FMvjP3UOCazneAT6Kc9ivoCo+d3kCUSt/TPR/IQcf4P6087Yl0mH2DNNmsiRoi66AIR+
 V/vZzU/K45KYWLVtcgYuvmVceyurhFGYs+dj8NZXRkz+N9QrB0WqDdpf7g1Ge1Nld67O
 YwhA==
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
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>,
 Chris Healy <cphealy@gmail.com>, Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iaW4sCgpPbiBNb24sIFNlcCAyLCAyMDE5IGF0IDExOjQ1IEFNIFJvYmluIE11cnBoeSA8
cm9iaW4ubXVycGh5QGFybS5jb20+IHdyb3RlOgoKPiBUcnkgMDAzNmJjNzNjY2JlIC0gdGhhdCBs
b29rcyBsaWtlIHNvbWV0aGluZyB0aGF0IENPTkZJR19ETUFfQVBJX0RFQlVHCj4gc2hvdWxkIGhh
dmUgYmVlbiBzY3JlYW1pbmcgYWJvdXQgYW55d2F5LgoKVGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rp
b24uCgpJIGNhbiBzdWNjZXNzZnVsbHkgYm9vdCBhZnRlciByZXZlcnRpbmcgdGhlIGZvbGxvd2lu
ZyBjb21taXRzOgoKY29tbWl0IDE0MWRiNTcwM2M4ODdmNDY5NTc2MTVjZDY2MTZjYTI4ZmU0Njkx
ZTAgKEhFQUQpCkF1dGhvcjogRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPgpEYXRl
OiAgIE1vbiBTZXAgMiAxNDo1ODoxOCAyMDE5IC0wMzAwCgogICAgUmV2ZXJ0ICJkcm0vbXNtOiBz
dG9wIGFidXNpbmcgZG1hX21hcC91bm1hcCBmb3IgY2FjaGUiCgogICAgVGhpcyByZXZlcnRzIGNv
bW1pdCAwMDM2YmM3M2NjYmU3ZTYwMGEzNDY4YmY4ZTg4NzliMTIyMjUyMjc0LgoKY29tbWl0IGZh
NWIxZjYyMGYyOTg0YzI1NDg3N2Q2MDQ5MjE0YzM5YzI0YzgyMDcKQXV0aG9yOiBGYWJpbyBFc3Rl
dmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+CkRhdGU6ICAgTW9uIFNlcCAyIDE0OjU2OjAxIDIwMTkg
LTAzMDAKCiAgICBSZXZlcnQgImRybS9tc206IFVzZSB0aGUgY29ycmVjdCBkbWFfc3luYyBjYWxs
cyBpbiBtc21fZ2VtIgoKICAgIFRoaXMgcmV2ZXJ0cyBjb21taXQgM2RlNDMzYzViMzhhZjQ5YTVm
Yzc2MDI3MjFlMmFiNWQzOWYxZTY5Yy4KClJvYiwKCldoYXQgd291bGQgYmUgdGhlIHJlY29tbWVu
ZGVkIGFwcHJvYWNoIGZvciBmaXhpbmcgdGhpcz8KClRoYW5rcwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
