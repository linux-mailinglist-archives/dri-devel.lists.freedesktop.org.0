Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 559304ABEC9
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 14:05:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21CCF10E470;
	Mon,  7 Feb 2022 13:05:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3ACC10E470
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 13:05:35 +0000 (UTC)
Date: Mon, 07 Feb 2022 13:05:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1644239133;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc;
 b=t/3NPqSqGdHWGqEW0IjQtzQyoPGYyW9BBgCehVDmhCGLMsJWiWs6PzQWbmu3BjnFF
 yCJOmStdDrKkFXvxMsJyIY/Okx1i21jbgBZ61ilzgCCc7YO7rHgRKVF2tEQv2B+g7p
 o39tG7FTJUx/ZcXWz8lKlYOt5+bSqWuWXe8XRsJ4NDq5DjYFl9DJj7tbWWHZ8QXnMh
 +Sb/esFUU8Z4glbDmTdseh2t/nO3iBHz2KquAlDns9SlMaRxnsX5dbTZeCfQpajbT/
 edbG4tB4+YMnrrl0+dHOzv/dRPMlcf1ieqNQhyZWiRJnkZDSBfD5PqN+aTEeAJMw/i
 cs2qWuqRZkyfQ==
To: Hans de Goede <hdegoede@redhat.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2] drm/privacy-screen: Fix sphinx warning
Message-ID: <l1SggV8Hq2ZSwYWLWSAAoS_xnJgRQY7FD6kkVLnd4aRDQuEcVHVNy8PGYupu4pf29tfapKZT1TSTg2wQS5XCJGoE0MzX8_fvlUYDQmCLP1c=@emersion.fr>
In-Reply-To: <20220207130407.389585-1-hdegoede@redhat.com>
References: <20220207130407.389585-1-hdegoede@redhat.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Simon Ser <contact@emersion.fr>
