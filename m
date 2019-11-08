Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D20F5300
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 18:55:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D8C86FA3F;
	Fri,  8 Nov 2019 17:55:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B89656FA3F
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 17:55:06 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.4-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzkQsv1s4ZXAyKDNVdXg_T0h4ZDODq68j4dLbACS_w4dw@mail.gmail.com>
References: <CAPM=9tzkQsv1s4ZXAyKDNVdXg_T0h4ZDODq68j4dLbACS_w4dw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tzkQsv1s4ZXAyKDNVdXg_T0h4ZDODq68j4dLbACS_w4dw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2019-11-08
X-PR-Tracked-Commit-Id: ff9234583d4fb53d4bcf57916ddfb16c53c81c88
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: efc61f7cbc283995bb1b3a5e925b8c7f79849f86
Message-Id: <157323570651.12598.15877507027094876707.pr-tracker-bot@kernel.org>
Date: Fri, 08 Nov 2019 17:55:06 +0000
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1573235706;
 bh=iEryZRpvUw/tQ8jgbh8KYrGH9hyKojtyeXyhEQRqsMI=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=vinX63uovrS1KImGKp8dusDV9J4ZHxB5Fstv3VNAuTc9ReQ8gkY6uVz2yemVhDDlM
 248B5JdzDZb4iSk6uTHFIpwFo3xcuAJUaaCk4TI3gmUdk4iByEnbat+/dZo3/onx41
 +sIMx0GWVOljGw9H9oejGF8bfeboZArkFqJA/pV8=
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

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBGcmksIDggTm92IDIwMTkgMTY6NTc6NTkgKzEw
MDA6Cgo+IGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0gdGFncy9kcm0tZml4
ZXMtMjAxOS0xMS0wOAoKaGFzIGJlZW4gbWVyZ2VkIGludG8gdG9ydmFsZHMvbGludXguZ2l0Ogpo
dHRwczovL2dpdC5rZXJuZWwub3JnL3RvcnZhbGRzL2MvZWZjNjFmN2NiYzI4Mzk5NWJiMWIzYTVl
OTI1YjhjN2Y3OTg0OWY4NgoKVGhhbmsgeW91IQoKLS0gCkRlZXQtZG9vdC1kb3QsIEkgYW0gYSBi
b3QuCmh0dHBzOi8va29yZy53aWtpLmtlcm5lbC5vcmcvdXNlcmRvYy9wcnRyYWNrZXIKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
