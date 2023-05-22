Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD7E70C094
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 15:58:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F92E10E32A;
	Mon, 22 May 2023 13:58:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7D210E32A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 13:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1684763896; i=deller@gmx.de;
 bh=Gj6SxtCLT4XjmrbpvARgY0QD61pClNlc9rMn1U4PyGc=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=gEInPGZGT9oePOMURTHXC2O4V8Y3Iw6qvY0GSNYqwqALZUZkte9bjPiBLdhgrYtHw
 bTJfovIt3RP3HPLDnvwYgeN0R6ItJVZfx86Ck6NtPObWVsOTr4dtcqgcHaOSEuVaGo
 FYW0usU4Uw5+xrQP60dWnYAH1xUjwL6EP2oNIb4YCnvAh/f44/zdt8LejgeNt6gV98
 1AzXnNoRaiP3gPeg8PMw5NlCAtV0gGYK+Tfb8XB2B8/Tav16RKIP0HMSZKzNMcYeuu
 3lqQokCUW+ZQ7C9QYjK1EpnVNLGpvWFZ1ysmuEUQE873MfmTXp/X4wjy9dvv1lZ2hi
 hiFv4JB4fxIPw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ls3530.fritz.box ([94.134.144.112]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MVvL5-1pbPsz1oqD-00Rnto; Mon, 22
 May 2023 15:58:16 +0200
From: Helge Deller <deller@gmx.de>
To: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH 0/2] Fix STI console on 64-bit parisc machines
Date: Mon, 22 May 2023 15:58:13 +0200
Message-Id: <20230522135815.38949-1-deller@gmx.de>
X-Mailer: git-send-email 2.40.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MIxYWhnQw2JFYElt10g/LYCbfVYDhiADUTPTk7DhWrrcAcAqEGk
 YwBE2YafL1ATw767rfGip6Z+fMzBtDNSEPMj6fdRGuHh9ocbGXQl+yKdGpVFR4gXAEL8Gpr
 fJ98P6VRYmhwu0R+e3EHwNpU62737xv+yQkc20G1IfxSex8XCfo7kekF/NxF9oM3xf1DCza
 XbJQsxu/caTS7EBpyoKwQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nFFGy7A2r0U=;7C59aSPvM9P3//DTpFl2/45t4Gn
 Gm03l/Gg9C6TnIEjupBIyLLYtcOYL7olrbtL8fLxqm4pYsS+y1fANW6QviGniapMS3ZCxXFR1
 y6xD5wxFLpj7jFifBvoZLRl5vKJu6g8OdQlpV4Ft4xceiqKYKpKYMzT1wGSWe55FpsEGiOyug
 kxDZyDvkvDwqN7JunQwFBEIZ/dZgt4IHrPHU0wrMnYnpdqtMfdYsacYpFaW8sYFA3bcWcjcem
 NizpcNxS1+YeyzGQMsaMQUj9WRXp0DW7c/Kv6X61CsrCHyzA+X84om2knUR+z2vGTIDokaOf2
 wFWwaH/xgTT3UHQo9/bSiy+jxAR/0yXSUBeCXMrDP1aeCf0vBC52UIfFst+Z29kklF77SXi0s
 VI1fbbc3HdTrWziXm5a3Ygea9s3uKKqYFBBiEDRcVI7BcgZU6dZV4vAKFQBXjBZonoQtge4ks
 +4ZoEpalX2MOoPqx5sXBkU2Eq02Il8+G6hPIdp7Xg8IWe++J1QNWBkTLLYEHHScVFapgXctB7
 t+sMoY+KlXUO1NAd7SDF+VJto3OIvB3vtA1Qfnj2G6Z8BYyN0Ep/2ET6WwlUciIERPFf8TXQ/
 L8ADmmANvwcwTBdzi+3/xX1tUhvNeIL01Ez8IoXlmv9yoBFnG24nHf6dHDLlc1SPve+vjvc56
 V0q3r++ljs3EritbO4tkvF5zpO45uH9et4DfaMzjEK5KNoDKIy24SO+ZMbmchoxGcHipVb+ex
 Oy8/yQ2GbU5501XVK+H/YgnTCtH2KByoFq40ogDUzkfXftczFbwaim95AmHDT8Cbw12FQZDMB
 uo4c3heGTEwdEh9l+gQTSJt13SkR2E25fKbT0cquqzwVXU+ra51o6OtyWHewwL8//SQrYQGDw
 RaPgGp0uon+aHZWUPvPsVjmorruUAqZY4rK3mye33APKQVvyuAUvPKdif6Ws9I44B42DMKI4h
 ZBMXwg==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Two patches to fix the STI text console on parisc machines.

Helge Deller (2):
  sticon/parisc: Allow 64-bit STI calls in PDC firmware abstration
  sticon/parisc: Fix STI console on 64-bit only machines

 arch/parisc/include/asm/pdc.h |   4 +-
 arch/parisc/kernel/firmware.c |  21 +++--
 drivers/video/fbdev/stifb.c   |   4 +-
 drivers/video/sticore.c       | 159 ++++++++++++++++++++++------------
 include/video/sticore.h       |  42 ++++-----
 5 files changed, 143 insertions(+), 87 deletions(-)

=2D-
2.40.1

