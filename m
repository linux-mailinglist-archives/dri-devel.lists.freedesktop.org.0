Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADDC47541
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 16:43:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD98890E9;
	Sun, 16 Jun 2019 14:43:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.skrimstad.net (mail.skrimstad.net [139.162.145.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F072A890E9;
 Sun, 16 Jun 2019 14:43:16 +0000 (UTC)
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
 by mail.skrimstad.net (Postfix) with ESMTPA id 9B3DEDE093;
 Sun, 16 Jun 2019 14:43:12 +0000 (UTC)
Date: Sun, 16 Jun 2019 16:43:10 +0200
From: Yrjan Skrimstad <yrjan@skrimstad.net>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/amd/powerplay/smu7_hwmgr: replace blocking delay
 with non-blocking
Message-ID: <20190616144309.GA8174@obi-wan>
References: <20190530000819.GA25416@obi-wan> <20190604202149.GA20116@obi-wan>
 <CADnq5_OqVSz7Vfo0zP88i=wJur=wtz6Jd99ZTiQSbFNBcc3j7w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_OqVSz7Vfo0zP88i=wJur=wtz6Jd99ZTiQSbFNBcc3j7w@mail.gmail.com>
X-Spamd-Bar: /
X-Mailman-Original-Authentication-Results: mail.skrimstad.net;
 auth=pass smtp.auth=yrjan@skrimstad.net smtp.mailfrom=yrjan@skrimstad.net
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Rex Zhu <rex.zhu@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDk6NTc6MjRBTSAtMDQwMCwgQWxleCBEZXVjaGVyIHdy
b3RlOgo+IFRoZSBwYXRjaCBpcyBmaW5lIGFuZCBJIGNhbiBhcHBseSBpdCAoSSBkb24ndCB0aGlu
ayB0aGVyZSBhcmUgYW55Cj4gcmVzdHJpY3Rpb25zIG9uIHNsZWVwaW5nIGluIHN5c2ZzKSwgYnV0
IHRoaXMgY29kZSBvbmx5IGdldHMgZXhlY3V0ZWQKPiB3aGVuIHlvdSBhY3R1YWxseSByZWFkIHRo
ZSBwb3dlciBzdGF0dXMgZnJvbSB0aGUgY2FyZCAoZS5nLiwgdmlhIHN5c2ZzCj4gb3IgZGVidWdm
cykuICBQcmVzdW1hYmx5IHlvdSBoYXZlIHNvbWV0aGluZyBpbiB1c2Vyc3BhY2UgcG9sbGluZyBv
bmUKPiBvZiB0aG9zZSBmaWxlcyBvbiBhIHJlZ3VsYXIgYmFzaXM/Cj4gCj4gQWxleAoKVGhhdCBp
cyBhbiBpbnRlcmVzdGluZyBvYnNlcnZhdGlvbiB0byBtZS4gSSBhbSBhY3R1YWxseSBydW5uaW5n
CmxtLXNlbnNvcnMsIGFsdGhvdWdoIG9ubHkgZXZlcnkgMTUgc2Vjb25kcy4gSSBzdXBwb3NlIHRo
YXQgdGhpcyBtaWdodApiZSB0aGUgcmVhc29uIHRoaXMgaGFwcGVucyB0byBtZS4KCi0gWXJqYW4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
