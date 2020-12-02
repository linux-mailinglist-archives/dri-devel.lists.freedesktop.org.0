Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C93A2CB799
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 09:46:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 573A26EA0B;
	Wed,  2 Dec 2020 08:46:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 150F26EA0B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Dec 2020 08:46:21 +0000 (UTC)
Date: Wed, 02 Dec 2020 08:46:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1606898778;
 bh=mp0uuYpDUByCyJjbD9wVJi+9uhm8N3qenqHcKAEkgcs=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=THrAn/IRpAIz2cZjIL4QoTAnh4pNXl3H6eOW5cJ4Xe4aiil9JuNO/1yTtkPDl9qaE
 TZjGe14s7wM/0u/OGurVasgFLtLAPsPZ4cJKYNY/Q4H+8E3u/IvXZo6fIgUUeS0gXA
 uTqrqWy06VI6eRUhw0+AJXkWmWqo8NWx0eet8y9d68dX1rzRmADFpRPFIAdqEuhZ1g
 Dfc1skHBwl4E9/il/rTeDVQ8SWp+aR2A3XExDbcWX4dBTInT2RCMK6voE/i2kwnSap
 1ji2EOzfDHB/UdQN2sXlYcebDjW9ECOy4xVlXwhMbwRg9oB+Pn8xeuJ6IK8Y16TPes
 a3+Vd14WgSRfA==
To: James Park <jpark37@lagfreegames.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: Fix drm.h uapi header for Windows
Message-ID: <xOk1dXNl1GdnDlbmgZsJHYWhW2KQB2oQCBLJ9NvRfmjr7mLqEtX2Bn85XMOWwagoS9diq7pu0EddxiiPncxxN-ZrY8KoueFO67kmqiw1CdM=@emersion.fr>
In-Reply-To: <1606816916-3724-2-git-send-email-jpark37@lagfreegames.com>
References: <1606816916-3724-1-git-send-email-jpark37@lagfreegames.com>
 <1606816916-3724-2-git-send-email-jpark37@lagfreegames.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Can you add a Signed-off-by line to your commit message? This means
you agree to the Developer Certificate of Origin [1].

[1]: https://developercertificate.org/
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
