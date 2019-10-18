Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABF2DD4F2
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2019 00:30:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BA3F89F33;
	Fri, 18 Oct 2019 22:30:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4164689F33
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 22:30:17 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id v17so7459040wml.4
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 15:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LDipa+pHzraU7AGfSCkk9cS4X3bVgRZMrlZ0/HVNYsA=;
 b=sYt3WnzxtnYQC0dfCqrC5dYcIGtZWDmBpFROtVmytgD1TfEsjWht7nX6WPFAMhcSHz
 6JA27ZilcUUdJ5Mz88N58snNKqNwTYl7+WwiWWBSBDrKyiZP1S1RtxQPTCZfLMW+6SNH
 DEzgBMzBt7E6h2YBdiOoHTEhtixH6SfgyYJjfbqV1V5/ERXb1kl3HOrdFIHZJlN53/I+
 oesA8zkFiS4GHj9+PB0MCygJaPEepsgTyqiTegDICed85gP4cBq5DbuVP5qTqLRSVghB
 593VT5jmY5K8z95ps3U1gcWhTaQayA/FiOa9vlnzIscnOxtlDPbrC2ENGDaS++wM/WNk
 qeFA==
X-Gm-Message-State: APjAAAVUK+RR9ahAD1aZDclizw0AR/jY0XlJ7HQJIZn69cQmIiNgpV6R
 DP0MjmYjM0A8Pe1xzpsqvUI=
X-Google-Smtp-Source: APXvYqx0nhZn+ANbaDKEXUF+gtPz7+Tpqlx3lB7NVJMmoz+GpA6CPYWuDTVtZ4m90EA2B7Rma8qNrQ==
X-Received: by 2002:a7b:cab1:: with SMTP id r17mr9081696wml.106.1571437815707; 
 Fri, 18 Oct 2019 15:30:15 -0700 (PDT)
Received: from debian (host-78-144-219-162.as13285.net. [78.144.219.162])
 by smtp.gmail.com with ESMTPSA id x2sm6728897wrn.81.2019.10.18.15.30.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 18 Oct 2019 15:30:15 -0700 (PDT)
Date: Fri, 18 Oct 2019 23:30:12 +0100
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: Ladislav Michl <ladis@linux-mips.org>
Subject: Re: [PATCH] omapfb: reduce stack usage
Message-ID: <20191018223012.tkpwbo3mg5mthlnz@debian>
References: <20191018163004.23498-1-sudipm.mukherjee@gmail.com>
 <20191018172728.GA11857@lenoch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191018172728.GA11857@lenoch>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=LDipa+pHzraU7AGfSCkk9cS4X3bVgRZMrlZ0/HVNYsA=;
 b=ustvlh1TIqREMXUWZS1iLAzKjUfrnCI+UqhCZkGebqu8AOs9XDDbRdrD5iy//Uguw8
 Nk4MyI/zsEE0TTz0m5dmFW/i+nrCqGXajx0D2CTeIPh4kezIOMJ/uG5BV6z9Y3KUdvib
 pFTUKcqH4cei8hyXkLhbIjQNSqo+9GarqPwRePCNQ3Kn5IiqHbl9DAZyqutkaJ3+RgVh
 W1+7pVnw+zh3yuv6kbpsZ1uC07oE4hfSeVgHUKJK/T/qOyuj41aI85J9hait2pZj0oUz
 6hZbFuY8i/MW0t7aHElaJUBHdPjy6b+9rKMXnbqr/pwuPnRUBRlEFfM7wUCUyOP/Q1X/
 2TLA==
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
Cc: linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMTgsIDIwMTkgYXQgMDc6Mjc6MjhQTSArMDIwMCwgTGFkaXNsYXYgTWljaGwg
d3JvdGU6Cj4gT24gRnJpLCBPY3QgMTgsIDIwMTkgYXQgMDU6MzA6MDRQTSArMDEwMCwgU3VkaXAg
TXVraGVyamVlIHdyb3RlOgo+ID4gVGhlIGJ1aWxkIG9mIHh0ZW5zYSBhbGxtb2Rjb25maWcgaXMg
Z2l2aW5nIGEgd2FybmluZyBvZjoKPiA+IEluIGZ1bmN0aW9uICdkc2lfZHVtcF9kc2lkZXZfaXJx
cyc6Cj4gPiB3YXJuaW5nOiB0aGUgZnJhbWUgc2l6ZSBvZiAxMTIwIGJ5dGVzIGlzIGxhcmdlciB0
aGFuIDEwMjQgYnl0ZXMKPiA+IAo+ID4gQWxsb2NhdGUgdGhlIG1lbW9yeSBmb3IgJ3N0cnVjdCBk
c2lfaXJxX3N0YXRzJyBkeW5hbWljYWxseSBpbnN0ZWFkCj4gPiBvZiBhc3NpZ25pbmcgaXQgaW4g
c3RhY2suCj4gCj4gU28gbm93IGZ1bmN0aW9uIGNhbiBmYWlsIHNpbGVudGx5LCBleGVjdXRlcyBs
b25nZXIsIGNvZGUgaXMgc2xpZ3RobHkKPiBiaWdnZXIuLi4gQW5kIGFsbCB0aGF0IHRvIHNpbGVu
dCB3YXJuaW5nIGFib3V0IGV4Y2VlZGluZyBmcmFtZSBzaXplLgo+IElzIGl0IHJlYWxseSB3b3J0
aCAiZml4aW5nIj8KClRoZSBvbmx5IHBvaW50IG9mIGZhaWx1cmUgaXMgaWYga21hbGxvYygpIGZh
aWxzIGFuZCBpZiBrbWFsbG9jKCkgZmFpbHMgdGhlbgp0aGVyZSB3aWxsIGJlIGVycm9yIHByaW50
cyBpbiBkbWVzZyB0byB0ZWxsIHRoZSB1c2VyIHRoYXQgdGhlcmUgaXMgbm8KbWVtb3J5IGxlZnQg
aW4gdGhlIHN5c3RlbS4gQWJvdXQgdGhlIHNpemUgYmlnZ2VyLCBpdCBzZWVtcwp0aGUgZHJpdmVy
cy92aWRlby9mYmRldi9vbWFwMi9vbWFwZmIvZHNzL2RzaS5vIGZpbGUgaXMgc21hbGxlciB3aXRo
IHRoZQpwYXRjaC4KVGhpcyBpcyB3aXRob3V0IHRoZSBwYXRjaDoKLXJ3LXItLXItLSAxIHN1ZGlw
IHN1ZGlwIDMxNjg1NiBPY3QgMTggMjI6MjcgZHJpdmVycy92aWRlby9mYmRldi9vbWFwMi9vbWFw
ZmIvZHNzL2RzaS5vCkFuZCB0aGlzIGlzIHdpdGggdGhlIHBhdGNoOgotcnctci0tci0tIDEgc3Vk
aXAgc3VkaXAgMzE2NDM2IE9jdCAxOCAyMDowOSBkcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29t
YXBmYi9kc3MvZHNpLm8KCkFuZCBhbHNvLCBvYmpkdW1wIHNob3dzIG1lIHRoYXQgPGRzaV9kdW1w
X2RzaWRldl9pcnFzPiB3YXMgdGFraW5nIHVwIDB4RDdECmJ5dGVzLCBhbmQgbm93IHdpdGggdGhl
IHBhdGNoIGl0IGlzIHRha2luZyB1cCAweEJFRCBieXRlcywgdGhhdHMgYSBzYXZpbmcKb2YgNDAw
IGJ5dGVzLiBJZiBpdCBoYXMgNDAwIGJ5dGVzIG9mIGxlc3MgY29kZSB0byBleGVjdXRlIHdpbGwg
aXQgbm90IGJlCmZhc3RlciBub3c/CgpCdXQsIEkgbWF5IGJlIHRvdGFsbHkgd3JvbmcgaW4gbXkg
dGhpbmtpbmcsIGFuZCBpbiB0aGF0IGNhc2UsIHBsZWFzZSBmZWVsCmZyZWUgdG8gcmVqZWN0IHRo
ZSBwYXRjaC4KCi0tClJlZ2FyZHMKU3VkaXAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
