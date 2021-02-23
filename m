Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 212E53230CA
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 19:31:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE0176E853;
	Tue, 23 Feb 2021 18:31:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DAB86E853
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 18:31:38 +0000 (UTC)
Date: Tue, 23 Feb 2021 18:31:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1614105096;
 bh=SCRdqYu/X+JlKwPLq1M2s6KsWP3afb1Fv8d1g4YI73I=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=fwrch2lxzu6+I87HggMk2e5/k1ShdZAd1126+ybSfiqZskd/Yh4uy3Yghi2te8GVm
 UsuukN3EexosLfose3a38eCRNp/K0I4NTjMjexv81OP6AZmB+2talo4jQW0nefoU+5
 dqzWqa+U91TJuPKa8z9J4i07C5CgF5VKn91ay7326CfYcZBq92J45TTdHZRuDGmOcN
 73wwwkXjRCHvmjH1IVos36GKFBSC8Cm/xx9Vl4eq00bhZ/GT2vUA3xJiSoHnPKZkb7
 i6JtO06Zguq30rpxQEVtUslzzp+ebXC4hLTgUg7Db1fEW//P2zffoddCejXihU0c8s
 s0AFWL8vLyQEw==
To: Mario Kleiner <mario.kleiner.de@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: Fix HDMI_STATIC_METADATA_TYPE1 constant.
Message-ID: <hFUM25w6kC2Yk1Xpx1Dv3T1wO8r4DqgZpKpgNUbnADaszeXwD2xeS8npG0VnSps_A-Ry9aHPamnw021WZa1_J-iMotoDbSp7oRHFyfqoFWQ=@emersion.fr>
In-Reply-To: <CAEsyxyjQgAqfoVtHvq4z0okOh57+73nkh62cCixP96pW2LdV2w@mail.gmail.com>
References: <20210124044010.18678-1-mario.kleiner.de@gmail.com>
 <YA61Aa07PhDucMyG@intel.com>
 <-NvMjiGAV79IMWvTOWrb2u_SHe2U36XumXbITMgCCqpMVg-FcvGRJbeTHaiUwkBSxZS5XaXYziZnoTdXJENA-JYQWNi-28F01___0SsWvv0=@emersion.fr>
 <CAEsyxyiK+bDyLDsk-jG3GGYWBjkGZeFamutmtDiNYvJSm4qegg@mail.gmail.com>
 <7Zl9uZ-uolN1JkU8Muxro-A5gTSN2SmmxYhs9g2UYfTFCJIoZVMIdkcPBbR6nkTxb3gWSwqTAsCfnlrtNzH133HdIZ9dCYcwZchv0iXZCnA=@emersion.fr>
 <CAEsyxygB-VZHg9a68Qb3XJ+xULwEeCkUFfthN4H+sdoVRXmJ2Q@mail.gmail.com>
 <CAEsyxyiPCXVmD-StDm+ZgOvDPASzXHci9dTaOWNf+VYFDEo97A@mail.gmail.com>
 <n2gjLlZ27Z0RAqlk7YhAi09RO_MKDmgP8crN2oeu-4O8pivnXph2Awy1ArYl61paax544su5pq13634h3Pm9OGB9QKt-RZ7mfz49aj64xy0=@emersion.fr>
 <CAEsyxyjQgAqfoVtHvq4z0okOh57+73nkh62cCixP96pW2LdV2w@mail.gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Uma Shankar <uma.shankar@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pushed, thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
