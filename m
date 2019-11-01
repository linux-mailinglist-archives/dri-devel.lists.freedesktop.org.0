Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E392EC73F
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 18:10:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0191E6E25F;
	Fri,  1 Nov 2019 17:10:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 628EF6E25F
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 17:10:06 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.4-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tx7omDCD2SmOaX9H1mO8=bDZWHw8aTJbp57bGQubYaHtQ@mail.gmail.com>
References: <CAPM=9tx7omDCD2SmOaX9H1mO8=bDZWHw8aTJbp57bGQubYaHtQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tx7omDCD2SmOaX9H1mO8=bDZWHw8aTJbp57bGQubYaHtQ@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2019-11-01
X-PR-Tracked-Commit-Id: e54de91a24753da713b9bcf9fcd93eec246e45e7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 146162449186f95bf123f59fa57a2c28a8a075e5
Message-Id: <157262820616.11375.7758161907091851654.pr-tracker-bot@kernel.org>
Date: Fri, 01 Nov 2019 17:10:06 +0000
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1572628206;
 bh=NZUdxbJqX4Vuv0Q03FyiheKXm9a5jALxIO5LuoRJtes=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=DaicA6/MbeKaBOWbfsgPHJbZ2ryFxoUQSFlKhl7c7ofJgEidsVQN1/Qac9kaxL07j
 qAalu7rIG+Gm6RqIDiLTYpVWeqiGtKwcARtNzu893ywr7xutdz5H7+lAmozEophhCO
 S8gLLo+grx6b43ctrl+TGbbS/zitxyDTUFFvz33E=
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

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBGcmksIDEgTm92IDIwMTkgMTU6MjE6NDkgKzEw
MDA6Cgo+IGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0gdGFncy9kcm0tZml4
ZXMtMjAxOS0xMS0wMQoKaGFzIGJlZW4gbWVyZ2VkIGludG8gdG9ydmFsZHMvbGludXguZ2l0Ogpo
dHRwczovL2dpdC5rZXJuZWwub3JnL3RvcnZhbGRzL2MvMTQ2MTYyNDQ5MTg2Zjk1YmYxMjNmNTlm
YTU3YTJjMjhhOGEwNzVlNQoKVGhhbmsgeW91IQoKLS0gCkRlZXQtZG9vdC1kb3QsIEkgYW0gYSBi
b3QuCmh0dHBzOi8va29yZy53aWtpLmtlcm5lbC5vcmcvdXNlcmRvYy9wcnRyYWNrZXIKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
