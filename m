Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CC84D03E9
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 17:20:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E357010E00B;
	Mon,  7 Mar 2022 16:20:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2338010E00B
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 16:20:10 +0000 (UTC)
Date: Mon, 07 Mar 2022 16:20:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1646670007;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=r1/KpanmU9cvWAcneAsbLN1V/b7akfLI9dgGIB0NyhtYoixQLyuyZtNKHewDBy9wL
 TDvHmj8hAwVteUXaU15aET3ZKCIPcTbbE2CgafSX0Kglo1mY1awn3gDQrJY5o20CPu
 MLigXFTsQcZDy2JCLFeDiLESDt1u6PJSUiZ2knnAv+8KUhdI0vmAPAa7T+8yyPBE0i
 jNbN5aSuQ4q4u+J3MrCUaIuy/OVvvn+vUU1A4YBx5E4ZhHAUYpeVZ91q/VL8eiIXx8
 zUnebfa9nyD8Nm42YvuKIFK2TlO4J1iKQFDfMQr1y3QgPWI9SY1i6HPmEyAkY8FMGi
 cpCid116LUHvA==
To: Geert Uytterhoeven <geert+renesas@glider.be>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2] drm/mode: Improve drm_mode_fb_cmd2 documentation
Message-ID: <wi7puUBjxYi2n3_K5850BfbvBQ7JThuvbqYkNbgV_Sdykr8C1f-6Bpm-_17IjAdXNh1qIzKmf_se86taXZSjjN_glv5c9FcG7fJtiT1rr1s=@emersion.fr>
In-Reply-To: <20220307160823.698692-1-geert+renesas@glider.be>
References: <20220307160823.698692-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,T_SCC_BODY_TEXT_LINE
 shortcircuit=no autolearn=disabled version=3.4.4
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Simon Ser <contact@emersion.fr>
