Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC5E91401
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2019 03:45:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE1446E55E;
	Sun, 18 Aug 2019 01:45:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 058CD6E55E
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2019 01:45:28 +0000 (UTC)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 923072086C;
 Sun, 18 Aug 2019 01:45:27 +0000 (UTC)
Date: Sat, 17 Aug 2019 21:45:26 -0400
From: Sasha Levin <sashal@kernel.org>
To: Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH AUTOSEL 5.2 37/59] drm/vgem: fix cache synchronization on
 arm/arm64
Message-ID: <20190818014526.GD1318@sasha-vm>
References: <20190806213319.19203-1-sashal@kernel.org>
 <20190806213319.19203-37-sashal@kernel.org>
 <CAJs_Fx5rj45yJ5kh5vLHRMWLYi=qmnMJ919LKdX8icTnvLwgoA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJs_Fx5rj45yJ5kh5vLHRMWLYi=qmnMJ919LKdX8icTnvLwgoA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1566092727;
 bh=kccxG/mB4GvXNVjNuurZTDd2pbdhYO8DJzrsZ8bh8iA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NJnsiVZcGZ3piWBxkg3dm05i+1wcgv7SKqp6wK/X0TNHGRojAbp2PeQNfc5bqnvHo
 FKqt8xd3WPvQt41+cbaHpshKySjpkm6LE1J79l6DEaqzlv7X2UYjP3w6C5nKeKSX88
 KuuuVQDQaMZg8g8CFQBtk7vkwMfIRHHI6ii87wcs=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMDM6NDU6NDhQTSAtMDcwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+cGxlYXNlIGRvbid0IHF1ZXVlIHRoaXMgb25lIGZvciBzdGFibGUgYnJhbmNoZXMuLiBpdCB3
YXMgY2F1c2luZwo+cHJvYmxlbXMgaW4gaW50ZWwgQ0kKCk5vdyBkcm9wcGVkLCB0aGFuayB5b3Uu
CgotLQpUaGFua3MsClNhc2hhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
