Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0D62D3FB4
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 11:16:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6CE46E303;
	Wed,  9 Dec 2020 10:16:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 009946E303
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 10:16:00 +0000 (UTC)
Date: Wed, 09 Dec 2020 10:15:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607508958;
 bh=OE4vQLwD/6hJcxYjp7uPZqn5sCecKyeR6NjvbcfeBa0=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=GeashfkicEkpIm550Zii2F8TIePGzORBCSTrYqVFPhdCBDakr5YTUnivklaMrOihy
 5c5trEq+EpvOg5Ms29+Ygx7l+jCibSLBfAj3s2i2rxhNygd9/2uoF7S6I5vNpdkJR2
 0CSAQ3Ab/xwqG5iI/6X6VrxQBPl3M0dmT1xplxZ74P+B1EF4xAc9vTVeJKdNMif9v7
 d3qHzATo/xxL1Kwm+uzOWzPu1rv6jlX3jDWS8JgxIZVzww86Nh1NLqQNwKSCpt0Daf
 3P4Gtr5T4p24L49ZgmpJCNEe2afdzDOtuD8g8h+A8J+ts1sCzRQfYvkGRmTFmBqo3F
 qSGkDoCnNeWVw==
To: James Park <james.park@lagfreegames.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: drm_basic_types.h, DRM_FOURCC_STANDALONE
Message-ID: <XspbLN5snOHL6Tx2ucz_uV7yb1AckJjXqAm7bOJk_2mO-1ttjhZFY0KFMf5V_5Xle0J2HEeGYnA3_KlN-73_caBSI5mLUPKoIVnpQQG01ys=@emersion.fr>
In-Reply-To: <CABjik9dKMGkuZXpMbdSjz9aPxn=_mQoU4kGAd6jdBKju82e1jw@mail.gmail.com>
References: <202012080129.qAoCOovN-lkp@intel.com>
 <1607364939-640-1-git-send-email-jpark37@lagfreegames.com>
 <1607364939-640-2-git-send-email-jpark37@lagfreegames.com>
 <8GcCcwMpk0Rz_34xReIOuuL2JZBQ2P71fYo4-G8ZMcxdqu2GE7NVnsxUHIxbo7xOylM_lIO2sA6yIgI9W3MoSvErpLWFTRFJR1Om6dtN9wE=@emersion.fr>
 <CABjik9dKMGkuZXpMbdSjz9aPxn=_mQoU4kGAd6jdBKju82e1jw@mail.gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 James Park <jpark37@lagfreegames.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, December 8th, 2020 at 7:32 PM, James Park <james.park@lagfreegames.com> wrote:

> This was the message from kernel test robot.
>
> >> usr/include/linux/kfd_ioctl.h:37: found __[us]{8,16,32,64} type without #include <linux/types.h>

Interesting that the warning comes from linux/kfd_ioctl.h. I guess
keeping the linux/types.h isn't that of a big deal anyways.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
