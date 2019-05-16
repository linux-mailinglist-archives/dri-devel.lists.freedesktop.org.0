Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D27F020E15
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 19:39:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6EF1896FA;
	Thu, 16 May 2019 17:39:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19BA9896FA
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 17:39:37 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id r19so1005027uap.5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 10:39:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=btkYXyszYOl4enkQNj6rF85Z8K5s124rQC98XbJLKTg=;
 b=I1tAS32gPn0O5S3RSecqfqC+qOw0t0seLAClbICRMkk7RJ1rSy8SqR4oOLvI6vd6hP
 N0/n0akPkR1WAW8aTD/nVmjXFzvpjdj8ZMX/b3LzixFJNH5PoNHv0sJIY+yYNfcaNJ6P
 PFt4qYbZa9qGawPV4c2FTx4xtCgFZt0w6ENlvcKpFor387Kg48otL4CYvWbuBDEEBiKx
 uLukW4wlTTfcTW+F9bovJIcUseDzEFOYeMgM2DULyO/71fRAzr//oWrsF2RdfwbsepQe
 rf9muCNUpAIVCom3X/MmSM4e8Pjg7oL+BSspW+We9kgFOoDnR2toSxyB0it1GIMTNBRO
 97kQ==
X-Gm-Message-State: APjAAAURugiBRtR0fcUDLcPfTXXgxJjtzwDT/h+49PoS5RP7RnVjwQec
 Kwu2J8KZ+4zXywjCMcmSXb7U47yOC9Y=
X-Google-Smtp-Source: APXvYqxDBFlds7uiWi9LJ+KWZjjKyYMFpnHmmwdN3SP74xp4P+yAbMzGOky5mqdUaf9u8ojNriEBaA==
X-Received: by 2002:ab0:5506:: with SMTP id t6mr17591689uaa.88.1558028375650; 
 Thu, 16 May 2019 10:39:35 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com.
 [209.85.221.181])
 by smtp.gmail.com with ESMTPSA id c204sm2994913vkd.14.2019.05.16.10.39.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 May 2019 10:39:34 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id o187so1259165vkg.4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 10:39:32 -0700 (PDT)
X-Received: by 2002:a1f:1e48:: with SMTP id e69mr23173110vke.16.1558028371386; 
 Thu, 16 May 2019 10:39:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190516172510.181473-1-mka@chromium.org>
 <20190516172510.181473-3-mka@chromium.org>
In-Reply-To: <20190516172510.181473-3-mka@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 16 May 2019 10:39:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wk0EFO2+c=KAfemo0_w+QEA8==KzOdN-niD0mA_myh=Q@mail.gmail.com>
Message-ID: <CAD=FV=Wk0EFO2+c=KAfemo0_w+QEA8==KzOdN-niD0mA_myh=Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: rockchip: Use GPU as cooling device for
 the GPU thermal zone of the rk3288
To: Matthias Kaehlcke <mka@chromium.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=btkYXyszYOl4enkQNj6rF85Z8K5s124rQC98XbJLKTg=;
 b=Jb1d/6dTS1pvv/Mc3sngMU2XidRneSla0eokNz7UyBI0yOzrq5vCgombW1gG1LdKUz
 Z5kTaogiXfzaxz4CCpB/AezBDqTNpXyLbqEZlHFmcTaBm69PYrg8A59ElJe/LJnc4gz6
 GygFEMTkuX9hdSY7oSVpDZbJJBD05Vgp574Ec=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBUaHUsIE1heSAxNiwgMjAxOSBhdCAxMDoyNSBBTSBNYXR0aGlhcyBLYWVobGNrZSA8
bWthQGNocm9taXVtLm9yZz4gd3JvdGU6Cgo+IEN1cnJlbnRseSB0aGUgQ1BVcyBhcmUgdXNlZCBh
cyBjb29saW5nIGRldmljZXMgb2YgdGhlIHJrMzI4OCBHUFUKPiB0aGVybWFsIHpvbmUuIFRoZSBD
UFVzIGFyZSBhbHNvIGNvbmZpZ3VyZWQgYXMgY29vbGluZyBkZXZpY2VzIGluIHRoZQo+IENQVSB0
aGVybWFsIHpvbmUsIHdoaWNoIGluZGlyZWN0bHkgaGVscHMgd2l0aCBjb29saW5nIHRoZSBHUFUg
dGhlcm1hbAo+IHpvbmUsIHNpbmNlIHRoZSBDUFUgYW5kIEdQVSB0ZW1wZXJhdHVyZXMgYXJlIGNv
cnJlbGF0ZWQgb24gdGhlIHJrMzI4OC4KPgo+IENvbmZpZ3VyZSB0aGUgQVJNIE1hbGkgTWlkZ2Fy
ZCBHUFUgYXMgY29vbGluZyBkZXZpY2UgZm9yIHRoZSBHUFUKPiB0aGVybWFsIHpvbmUgaW5zdGVh
ZCBvZiB0aGUgQ1BVcy4KPgo+IFNpZ25lZC1vZmYtYnk6IE1hdHRoaWFzIEthZWhsY2tlIDxta2FA
Y2hyb21pdW0ub3JnPgo+IC0tLQo+IENoYW5nZXMgaW4gdjI6Cj4gLSBwYXRjaCBhZGRlZCB0byB0
aGUgc2VyaWVzCj4gLS0tCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL3JrMzI4OC5kdHNpIHwgNSArLS0t
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDQgZGVsZXRpb25zKC0pCgpUaGlz
IG1ha2VzIHNlbnNlIHRvIG1lIHVubGVzcyB0aGVyZSBpcyBzb21lIGJldHRlciB3YXkgdG8gbW9k
ZWwgdGhlCmludGVydHdpbmVkIG5hdHVyZSBvZiB0aGUgQ1BVIGFuZCBHUFUgdGVtcGVyYXR1cmUu
ICBJdCdzIG15CnVuZGVyc3RhbmRpbmcgdGhhdCB0aGUgb3JpZ2luYWwgZGV2aWNlIHRyZWUgc25p
cHBldCB3YXMgdGhlcmUgYmVjYXVzZQppdCB3YXMgYWRkZWQgYmVmb3JlIHRoZSBncHUgbm9kZSBl
eGlzdGVkIGluIHRoZSBkZXZpY2UgdHJlZSBzbyB0aGUKYmVzdCB3ZSBjb3VsZCBkbyBpcyB0byBz
dWdnZXN0IHRoYXQgdGhlIGNwdSBjb3VsZCBjb29sIHRoaW5ncyBkb3duLgoKUmV2aWV3ZWQtYnk6
IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
