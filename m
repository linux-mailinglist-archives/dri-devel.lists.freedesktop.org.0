Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 418951076AE
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 18:45:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 659346E43D;
	Fri, 22 Nov 2019 17:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C156E421
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2019 17:45:04 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txZ7F80TCRMtgRbkCGcv=gCp9_+YoZLZRBo2N7H09jN=Q@mail.gmail.com>
References: <CAPM=9txZ7F80TCRMtgRbkCGcv=gCp9_+YoZLZRBo2N7H09jN=Q@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txZ7F80TCRMtgRbkCGcv=gCp9_+YoZLZRBo2N7H09jN=Q@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2019-11-22
X-PR-Tracked-Commit-Id: 51658c04c338d7ef98d6c2c19009e4814632db50
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5d867ab037e58da3356b95bd1a7cb8efe3501958
Message-Id: <157444470451.7762.2473889646692778156.pr-tracker-bot@kernel.org>
Date: Fri, 22 Nov 2019 17:45:04 +0000
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1574444704;
 bh=kQYKiTk7zb6jNlv5eVIlG9ohIWg/3K5a0IpZFhJDlSo=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=JhePflTCymCOIzX8FRr+WcY8U4aAGNvdY4a3rsXVAeJGsa5HmPakqpJ127p3SRBpK
 5xbhZR6SS5MTklbsxazgHL1P/kU3x3r2iEyUPIqvimAuBzpRprjqeGVWCV3XSnUwLH
 eF1J5OQfPFelplTGl0ratmL3yKvzrlpiCUQhkCrw=
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

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBGcmksIDIyIE5vdiAyMDE5IDEwOjQzOjI4ICsx
MDAwOgoKPiBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtIHRhZ3MvZHJtLWZp
eGVzLTIwMTktMTEtMjIKCmhhcyBiZWVuIG1lcmdlZCBpbnRvIHRvcnZhbGRzL2xpbnV4LmdpdDoK
aHR0cHM6Ly9naXQua2VybmVsLm9yZy90b3J2YWxkcy9jLzVkODY3YWIwMzdlNThkYTMzNTZiOTVi
ZDFhN2NiOGVmZTM1MDE5NTgKClRoYW5rIHlvdSEKCi0tIApEZWV0LWRvb3QtZG90LCBJIGFtIGEg
Ym90LgpodHRwczovL2tvcmcud2lraS5rZXJuZWwub3JnL3VzZXJkb2MvcHJ0cmFja2VyCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
