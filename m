Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBB9EFE7C
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 14:29:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE4E6EA53;
	Tue,  5 Nov 2019 13:29:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3CA6E8BC;
 Tue,  5 Nov 2019 00:01:34 +0000 (UTC)
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 465E43E88C;
 Tue,  5 Nov 2019 00:01:30 +0000 (UTC)
Date: Mon, 4 Nov 2019 19:01:29 -0500
From: Brian Masney <masneyb@onstation.org>
To: Rob Clark <robdclark@chromium.org>
Subject: drm/msm: 'pp done time out' errors after async commit changes
Message-ID: <20191105000129.GA6536@onstation.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Tue, 05 Nov 2019 13:29:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1572912090;
 bh=taJalr9ULaeTpvFha/eSrqk1aU8+Dlc81UWCxgyIWYM=;
 h=Date:From:To:Cc:Subject:From;
 b=MAzUzpIp+9/lO1CVwmOHkttx44ezWf0vlhhd+EiWAdxYkKJN0LKriYHULJF2Xswes
 SnWdiEs2nA59BagwT9FdQesRgU8/yzg7VEkNyuMSzz/g1HeyU8aJ+Gjk7XuoasehQE
 7gBj3ClZMgqzBzP3sK24IWK4MFXGY4Gg9Ihb1SFE=
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGV5IFJvYiwKClNpbmNlIGNvbW1pdCAyZDk5Y2VkNzg3ZTMgKCJkcm0vbXNtOiBhc3luYyBjb21t
aXQgc3VwcG9ydCIpLCB0aGUgZnJhbWUKYnVmZmVyIGNvbnNvbGUgb24gbXkgTmV4dXMgNSBiZWdh
biB0aHJvd2luZyB0aGVzZSBlcnJvcnM6Cgptc20gZmQ5MDAwMDAubWRzczogcHAgZG9uZSB0aW1l
IG91dCwgbG09MAoKVGhlIGRpc3BsYXkgc3RpbGwgd29ya3MuCgpJIHNlZSB0aGF0IG1kcDVfZmx1
c2hfY29tbWl0KCkgd2FzIGludHJvZHVjZWQgaW4gY29tbWl0IDlmNmI2NTY0MmJkMgooImRybS9t
c206IGFkZCBrbXMtPmZsdXNoX2NvbW1pdCgpIikgd2l0aCBhIFRPRE8gY29tbWVudCBhbmQgdGhl
IGNvbW1pdApkZXNjcmlwdGlvbiBtZW50aW9ucyBmbHVzaGluZyByZWdpc3RlcnMuIEkgYXNzdW1l
IHRoYXQgdGhpcyBpcyB0aGUKcHJvcGVyIGZpeC4gSWYgc28sIGNhbiB5b3UgcG9pbnQgbWUgdG8g
d2hlcmUgdGhlc2UgcmVnaXN0ZXJzIGFyZQpkZWZpbmVkIGFuZCBJIGNhbiB3b3JrIG9uIHRoZSBt
ZHA1IGltcGxlbWVudGF0aW9uLgoKVGhhbmtzLAoKQnJpYW4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
