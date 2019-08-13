Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCD28BA91
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 15:40:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 084786E0DA;
	Tue, 13 Aug 2019 13:40:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411C06E0DA
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 13:40:18 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id m2so5803890qki.12
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 06:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/uXix37ClKT+tvsFUNGWguiFM+/73+Mp/B4lwLf0u84=;
 b=cNXhoJk293RRVHl9pefWJ+X1FuwBnjp7g1WpIu3K4gl+SnIBDoy21o8eCX61wKKEgi
 CSeAgDMgHXjt04FPGgWVr/QMGHtbhqtk9A0GgBbFYlmOpImQEwCWmS/hZD2ian11yZVJ
 ygbMB/mpF76tpR7iHIOZwKGIIScxI9cfHA9paZyqp1SjquwP8tMRLRF02FSwdmLtx3Xp
 amTYlaTaDrjDTuhEU8DeyqHRowgDJtKubD09oRmWuVrfpuLjTOsisdPcCzJMJUckO5Zh
 80URhbK8PFi5yrYZLulifC2AX4VXaCC6hijEgvwTyz38hidjuJj5do6kIHKIQcoggrUn
 oGSQ==
X-Gm-Message-State: APjAAAVN9mUrvPWqBxsezCNLqRrtBdWNvxknnosQ7qzWPmpeCXRKJOjX
 lD7aOOzdYS7mZ8paLSU8D2tnYh2SCC86O2/gTtU=
X-Google-Smtp-Source: APXvYqxf5nJUrTaAzvwJdLif3TENX3xr9UxDNpNQFLH3ZLixVu+bnz+O3k7KO8Y9aYEt+ldFlGPD+WFo1hr9qLomMq8=
X-Received: by 2002:a37:76c5:: with SMTP id
 r188mr33868639qkc.394.1565703617234; 
 Tue, 13 Aug 2019 06:40:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190809202749.742267-1-arnd@arndb.de>
 <CGME20190809202857epcas2p14ab10d8ce2e50647671ab8c0ded385a8@epcas2p1.samsung.com>
 <20190809202749.742267-10-arnd@arndb.de>
 <cc732000-a147-bec2-1082-7bf58ee8f309@samsung.com>
In-Reply-To: <cc732000-a147-bec2-1082-7bf58ee8f309@samsung.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 13 Aug 2019 15:40:00 +0200
Message-ID: <CAK8P3a0=5rmWw1vvKX3evVbpk-3Z204QZ3x-DaMs_5e9Kg-YAQ@mail.gmail.com>
Subject: Re: [PATCH 09/16] fbdev: remove w90x900/nuc900 platform drivers
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
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
Cc: soc@kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMzozMCBQTSBCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6
CjxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+IHdyb3RlOgo+Cj4KPiBPbiA4LzkvMTkgMTA6Mjcg
UE0sIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4gPiBUaGUgQVJNIHc5MHg5MDAgcGxhdGZvcm0gaXMg
Z2V0dGluZyByZW1vdmVkLCBzbyB0aGlzIGRyaXZlciBpcyBvYnNvbGV0ZS4KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+Cj4gQWNrZWQtYnk6IEJh
cnRsb21pZWogWm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KPgo+IEJU
VyB0aGVyZSBpcyBhIHZlcnkgbWlub3IgaXNzdWUgd2l0aCBpbnRlcm5hbCBiaXNlY3RhYmlsaXR5
IG9mCj4gdGhpcyBwYXRjaCBzZXJpZXMgKG5vbi1pc3N1ZSBpbiByZWFsaXR5IGJlY2F1c2UgaXQg
YWZmZWN0cyBvbmx5Cj4gY29uZmlncyB3aXRoIEFSQ0hfVzkwWDkwMD15IGFuZCBzdWNoIGFyZSBu
b3cgZ29uZSwganVzdCBGWUkpOgo+Cj4gYXJjaC9hcm0vbWFjaC13OTB4OTAwL2Rldi5jICh3aGlj
aCBzdGF5cyBpbiB0cmVlIHVudGlsIHBhdGNoICMxNgo+ICgiQVJNOiByZW1vdmUgdzkweDkwMCBw
bGF0Zm9ybSIpIHVzZXMgaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhLwo+IGZpbGVzIHJlbW92
ZWQgaW4gcGF0Y2hlcyAjNyAoc3BpKSwgIzkgKGZiZGV2KSBhbmQgIzEwIChrZXlib2FyZCkuCgpB
aCByaWdodCwgSSBhY3R1YWxseSBwbGFubmVkIHRvIGNoYW5nZSB0aGF0IG9yaWdpbmFsbHkgYnV0
IGZvcmdvdC4KQXMgeW91IHNheSwgaXQncyBub3QgYSBodWdlIGlzc3VlIGV4Y2VwdCBmb3IgYnVp
bGRpbmcgcmFuZGNvbmZpZyBvcgpudWM5MDBfZGVmY29uZmlnLgoKICAgICAgIEFybmQKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
