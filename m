Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83ED063A9C1
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 14:39:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0352910E1C8;
	Mon, 28 Nov 2022 13:39:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A73BB10E1C8
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 13:39:14 +0000 (UTC)
Date: Mon, 28 Nov 2022 13:39:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1669642752; x=1669901952;
 bh=j6kZeSNa5n4OY2B5LtGRcQE9SBFPnH8Ye3e9Fe3mcQk=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=aDeOmgSiSt4z7wm7r8jKuoPazKnguig03wwkJIauTIrVw1BEOyFFTzABHig7fMzQS
 XLEC7GbqCZ5YSDQLqzSpo8LPGdlWpbHU8gDldhl5QnUYtc3I44rGjgHtHq4y/uSOA4
 KPAz4rOw1FvSYUcWpqsoT2fQpwvZweS/8MkQEc3xZ+pmxweQk52Uo/qBJcq0Hkq6v7
 WPT8HlozCfnR2AyDR5EGSEtqq0yDzLFg0qgFT5KPzMwBUVt1XxiGF91/z4bQd/cCYW
 8a87PxZwMpsrOMB9/ldCKeL6ABrcrAkeaO9+i6S+bYWR0DjZhfxMqbyk7DaO9OZ79g
 NqbaLxmEv72sQ==
To: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] doc: add dma-buf IOCTL code to table
Message-ID: <20221128133853.355645-1-contact@emersion.fr>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The code 'b' is used for dma-buf IOCTLs.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
---
 Documentation/userspace-api/ioctl/ioctl-number.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documenta=
tion/userspace-api/ioctl/ioctl-number.rst
index 5f81e2a24a5c..184a7a222701 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -221,6 +221,7 @@ Code  Seq#    Include File                             =
              Comments
 'a'   00-0F  drivers/crypto/qat/qat_common/adf_cfg_common.h          confl=
ict! qat driver
 'b'   00-FF                                                          confl=
ict! bit3 vme host bridge
                                                                      <mail=
to:natalia@nikhefk.nikhef.nl>
+'b'   00-0F  linux/dma-buf.h                                         confl=
ict!
 'c'   all    linux/cm4000_cs.h                                       confl=
ict!
 'c'   00-7F  linux/comstats.h                                        confl=
ict!
 'c'   00-7F  linux/coda.h                                            confl=
ict!
--=20
2.38.1


