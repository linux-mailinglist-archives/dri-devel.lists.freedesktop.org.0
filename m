Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE7113209
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 18:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B5F6E814;
	Fri,  3 May 2019 16:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C25E46E816
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 16:20:04 +0000 (UTC)
Subject: Re: [git pull] drm fixes for final
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twjCLCi0rVHeaK1CtyD=13PSFxdDTDK4LvV-w89Wr6DvA@mail.gmail.com>
References: <CAPM=9twjCLCi0rVHeaK1CtyD=13PSFxdDTDK4LvV-w89Wr6DvA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9twjCLCi0rVHeaK1CtyD=13PSFxdDTDK4LvV-w89Wr6DvA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2019-05-03
X-PR-Tracked-Commit-Id: 1daa0449d287a109b93c4516914eddeff4baff65
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a4ccb5f9dc6c4fb4d4c0a9d73a911986f20ec88a
Message-Id: <155690040459.31408.13875118131564070601.pr-tracker-bot@kernel.org>
Date: Fri, 03 May 2019 16:20:04 +0000
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1556900404;
 bh=PdQwiRjHsghdoXxNJ3/WJ9wiBAJQB1vDqM32KiE4RNc=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=p1BHXSWZyuMRt+Dh4nAvSdb/dwQ7FRlq1Ywfe5716spBnvJxwl/mYJ9V9zzhWlwJ3
 SKQXY44gKYPvs8P/vOgga3AbmaYMDArrT+qZjUXFXxaDwVLaH5Tn3NOvBy5pgKUxAV
 sVgIbwRPFWM8NX5zGFDjywyhtovXUQARG6KlB/T0=
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
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBGcmksIDMgTWF5IDIwMTkgMTE6MDE6MDcgKzEw
MDA6Cgo+IGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0gdGFncy9kcm0tZml4
ZXMtMjAxOS0wNS0wMwoKaGFzIGJlZW4gbWVyZ2VkIGludG8gdG9ydmFsZHMvbGludXguZ2l0Ogpo
dHRwczovL2dpdC5rZXJuZWwub3JnL3RvcnZhbGRzL2MvYTRjY2I1ZjlkYzZjNGZiNGQ0YzBhOWQ3
M2E5MTE5ODZmMjBlYzg4YQoKVGhhbmsgeW91IQoKLS0gCkRlZXQtZG9vdC1kb3QsIEkgYW0gYSBi
b3QuCmh0dHBzOi8va29yZy53aWtpLmtlcm5lbC5vcmcvdXNlcmRvYy9wcnRyYWNrZXIKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
