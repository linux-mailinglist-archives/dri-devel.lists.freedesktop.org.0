Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED244CC291
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 20:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE1E6E30D;
	Fri,  4 Oct 2019 18:25:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F02566E30D
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 18:25:16 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.4-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txgjvF2366P7_Sj-sLdS0rjdnsyFEg7xKF35sEG7ZTXBQ@mail.gmail.com>
References: <CAPM=9txgjvF2366P7_Sj-sLdS0rjdnsyFEg7xKF35sEG7ZTXBQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txgjvF2366P7_Sj-sLdS0rjdnsyFEg7xKF35sEG7ZTXBQ@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2019-10-04
X-PR-Tracked-Commit-Id: 07bba341c99694a4fe6b07edfa4f97ca90c8784c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 768b47b7a9bca52101ff48081cfcecd3ebc5351a
Message-Id: <157021351670.30669.388731916988528975.pr-tracker-bot@kernel.org>
Date: Fri, 04 Oct 2019 18:25:16 +0000
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570213516;
 bh=I3meC0D4SSP1ojMNRT+f4wq7ynZ2JD/PYtvvsgoqGug=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=VEpXIjghWcqoA4nYUZCJg7aceyWlcAormrg0FJm4Te7Ap/kNwKkLcL+F+teoEJZcW
 dkdtRRzOb6YUMqOQhGZvzo+n4prVxB19VLZ/uImOtuz2ZO7XqYCObojJWdKOSvCa+8
 J9JHgNBbBmxRYKYC7s3nmTnJZZLjJNWRBdnLb9Uw=
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

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBGcmksIDQgT2N0IDIwMTkgMTc6NTU6MTYgKzEw
MDA6Cgo+IGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0gdGFncy9kcm0tZml4
ZXMtMjAxOS0xMC0wNAoKaGFzIGJlZW4gbWVyZ2VkIGludG8gdG9ydmFsZHMvbGludXguZ2l0Ogpo
dHRwczovL2dpdC5rZXJuZWwub3JnL3RvcnZhbGRzL2MvNzY4YjQ3YjdhOWJjYTUyMTAxZmY0ODA4
MWNmY2VjZDNlYmM1MzUxYQoKVGhhbmsgeW91IQoKLS0gCkRlZXQtZG9vdC1kb3QsIEkgYW0gYSBi
b3QuCmh0dHBzOi8va29yZy53aWtpLmtlcm5lbC5vcmcvdXNlcmRvYy9wcnRyYWNrZXIKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
