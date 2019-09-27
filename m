Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CE3C0B6A
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 20:40:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F86B6E1F5;
	Fri, 27 Sep 2019 18:40:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F326E1F5
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 18:40:24 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txTwuNKGpVGEr=GScQV1FKEJUubyM8UorvUVSHEXEJOkw@mail.gmail.com>
References: <CAPM=9txTwuNKGpVGEr=GScQV1FKEJUubyM8UorvUVSHEXEJOkw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txTwuNKGpVGEr=GScQV1FKEJUubyM8UorvUVSHEXEJOkw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2019-09-27
X-PR-Tracked-Commit-Id: 3e2cb6d89325dc36a03937a2b82fc7eb902c96b0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 289991ce1cac18e7cd489902986ef986baa49568
Message-Id: <156960962446.11345.15901598601759799024.pr-tracker-bot@kernel.org>
Date: Fri, 27 Sep 2019 18:40:24 +0000
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569609624;
 bh=BaIneuTZYOYbJBBRwvAlATUPFvjHSADgwv+Q/RkkKeA=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=NgmIwzUpb9rBp8TSRt6+EHLrvy8A0VrA8qxR0iliOcFYwGKl3foqCwedSHlmcKeyo
 9QRk381/HUs0POg7drwJHQ8evzjqitUSyccTnF2pmTF6/6FoGCeoavuWKKXbZnFJ7p
 QvYL1fN6dJTaxGbijiqEGJ2uTUF/+VzMJw5NpXwc=
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

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBGcmksIDI3IFNlcCAyMDE5IDE1OjE4OjU3ICsx
MDAwOgoKPiBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtIHRhZ3MvZHJtLW5l
eHQtMjAxOS0wOS0yNwoKaGFzIGJlZW4gbWVyZ2VkIGludG8gdG9ydmFsZHMvbGludXguZ2l0Ogpo
dHRwczovL2dpdC5rZXJuZWwub3JnL3RvcnZhbGRzL2MvMjg5OTkxY2UxY2FjMThlN2NkNDg5OTAy
OTg2ZWY5ODZiYWE0OTU2OAoKVGhhbmsgeW91IQoKLS0gCkRlZXQtZG9vdC1kb3QsIEkgYW0gYSBi
b3QuCmh0dHBzOi8va29yZy53aWtpLmtlcm5lbC5vcmcvdXNlcmRvYy9wcnRyYWNrZXIKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
