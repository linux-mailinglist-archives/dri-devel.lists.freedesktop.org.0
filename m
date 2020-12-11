Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 194BF2D7230
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 09:50:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E816E1F6;
	Fri, 11 Dec 2020 08:50:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6718D6E1F6
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 08:50:01 +0000 (UTC)
Date: Fri, 11 Dec 2020 08:49:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607676598;
 bh=43kKZhQXpx8BYQYpgM1DmIFWg7Q5AE7P4o+Ci5JntgU=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=L39vdRaNBC/tDOk3wB/26b5pB2nuQDeO8XsJCJwIsTeC4AZcOtY4gMgC0pwOrC3Hn
 ae+XFxQjXGAJdPGDHYm3WVlebl0H5wjgiaCFjVNsSk92pUxqbPZEW6Iuv5GBm0R8kO
 I+oKuBK4zvsWBKCXJ0CYO3x3HNoBb/hPynE7p01rPYLYtC7FS1/0WRtvyNVc8sKJFW
 YHgeijLelIQ2K1IEWTx4G3OG53pp22UC98gv+R8Yd/dZfECad8bFn4ahRrLD+muX5M
 R4//sDwlTL9nxYSi9eVK1oqaYLbp2WbXZ/PZ8Qkoo1jCEQrMq9UAej/2qpRSV1M5V9
 cebBC5sWDs19A==
To: Tian Tao <tiantao6@hisilicon.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/drv: Remove invalid assignments
Message-ID: <o5dm3Jd8wnvSKmDYLiHQTQHOGF8-SOuGTIKA-Xapdm_xVxdzyJb0dwIwr3dge7_7QpBRkc1-x5WTrgooIU6X-66czcVVQF_ZVEitUp-aQL8=@emersion.fr>
In-Reply-To: <1607653037-37785-1-git-send-email-tiantao6@hisilicon.com>
References: <1607653037-37785-1-git-send-email-tiantao6@hisilicon.com>
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
Cc: tzimmermann@suse.de, airlied@linux.ie, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, December 11th, 2020 at 3:17 AM, Tian Tao <tiantao6@hisilicon.com> wrote:

> it's not necessary to assign a value of 0 to ret here, because if
> the previous functions were executed correctly, ret would be 0.
>
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Reviewed-by: Simon Ser <contact@emersion.fr>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
