Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D21F410DEA3
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2019 19:40:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 688B26E176;
	Sat, 30 Nov 2019 18:40:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFCD66E176
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2019 18:40:14 +0000 (UTC)
Subject: Re: [git pull] mm + drm vmwgfx coherent
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txVpjxR1UAOPpXn-ZqMamAUdzfq_HOEav99A0A0sfFBUw@mail.gmail.com>
References: <CAPM=9txVpjxR1UAOPpXn-ZqMamAUdzfq_HOEav99A0A0sfFBUw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txVpjxR1UAOPpXn-ZqMamAUdzfq_HOEav99A0A0sfFBUw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-vmwgfx-coherent-2019-11-29
X-PR-Tracked-Commit-Id: 0a6cad5df541108cfd3fbd79eef48eb824c89bdc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d5bb349dbbe27537e90a03b9597deeb07723a86d
Message-Id: <157513921458.25154.3957731534983081875.pr-tracker-bot@kernel.org>
Date: Sat, 30 Nov 2019 18:40:14 +0000
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1575139214;
 bh=HNyvNjPP8I7M7Zzgdj8BUUs4Bi4yHGX2THFPNKA6RUg=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=S/ACLge4+Q11OtN9Gnu7hsqxo9Pw7vSsOLKHVuSzy+IM98LGKJlCPVnM/FGKJ2uF3
 Zls+4564gGkoeJ3lOGgPVSxVhuffjdL7JQToCl+zsheevyPHAE1HerreCUB/GfFWcv
 uQFmZj6z73c+HVUVF3+qekENpQQ0nakmP8BN6V/E=
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas@shipmail.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBGcmksIDI5IE5vdiAyMDE5IDExOjE1OjEzICsx
MDAwOgoKPiBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtIHRhZ3MvZHJtLXZt
d2dmeC1jb2hlcmVudC0yMDE5LTExLTI5CgpoYXMgYmVlbiBtZXJnZWQgaW50byB0b3J2YWxkcy9s
aW51eC5naXQ6Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvdG9ydmFsZHMvYy9kNWJiMzQ5ZGJiZTI3
NTM3ZTkwYTAzYjk1OTdkZWViMDc3MjNhODZkCgpUaGFuayB5b3UhCgotLSAKRGVldC1kb290LWRv
dCwgSSBhbSBhIGJvdC4KaHR0cHM6Ly9rb3JnLndpa2kua2VybmVsLm9yZy91c2VyZG9jL3BydHJh
Y2tlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
