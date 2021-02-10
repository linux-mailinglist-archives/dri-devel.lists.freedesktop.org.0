Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B68B731721F
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 22:14:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C1916E069;
	Wed, 10 Feb 2021 21:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C7C6E069
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 21:14:22 +0000 (UTC)
Date: Wed, 10 Feb 2021 21:14:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1612991660;
 bh=x/QFFZ4nnm+frCzG67M32HkJVKSDhD+w/dnc6LIIcRA=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=oU8BTEkMw7hYeCYYb865tOdd3/BVphhBzACqIgk5znw5cbILjOqCivb02rg6RY6Dy
 dzjXAWBHgKaG/sejJFkkOFQnws7xfIX0fD9bOGcD4nZA+d9xo5lgLdNyIpqRl3efN7
 7r/Ua9gXxQ7OHKcvBhhV5lpXG9NjUF2/u95OvG56UUXO6ry0RG1jECyz2xF6kOdBbe
 nzSy4F0l8bflKw4uZj8XLCC+7EyUBdE/3Uzb7R6aOIoAAyy/S6mwWqRuHlozH8r5kt
 CRhp7AYeer4nMspbsbaNar2cMR3VXJ0SMKlKNu7mk/ny5LR0PTD2QirMbplVyJACfd
 a2tnrGcFENkdA==
To: Mario Kleiner <mario.kleiner.de@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: Fix HDMI_STATIC_METADATA_TYPE1 constant.
Message-ID: <n2gjLlZ27Z0RAqlk7YhAi09RO_MKDmgP8crN2oeu-4O8pivnXph2Awy1ArYl61paax544su5pq13634h3Pm9OGB9QKt-RZ7mfz49aj64xy0=@emersion.fr>
In-Reply-To: <CAEsyxyiPCXVmD-StDm+ZgOvDPASzXHci9dTaOWNf+VYFDEo97A@mail.gmail.com>
References: <20210124044010.18678-1-mario.kleiner.de@gmail.com>
 <yEq1_Ipkzm_vP4BD6cKlonRVfMbfGXrlvxOG4XDkk_wg1UkPCdLj95I8pknonGjf2Bs1zYeErr1WXerrQjprE3k1vswj3E2Nzq-imF58ytM=@emersion.fr>
 <CAEsyxyhXhJohDYuDDLoQeg-QqhnWQ953GRO0Kf6Puj=f_NkU4w@mail.gmail.com>
 <YA61Aa07PhDucMyG@intel.com>
 <-NvMjiGAV79IMWvTOWrb2u_SHe2U36XumXbITMgCCqpMVg-FcvGRJbeTHaiUwkBSxZS5XaXYziZnoTdXJENA-JYQWNi-28F01___0SsWvv0=@emersion.fr>
 <CAEsyxyiK+bDyLDsk-jG3GGYWBjkGZeFamutmtDiNYvJSm4qegg@mail.gmail.com>
 <7Zl9uZ-uolN1JkU8Muxro-A5gTSN2SmmxYhs9g2UYfTFCJIoZVMIdkcPBbR6nkTxb3gWSwqTAsCfnlrtNzH133HdIZ9dCYcwZchv0iXZCnA=@emersion.fr>
 <CAEsyxygB-VZHg9a68Qb3XJ+xULwEeCkUFfthN4H+sdoVRXmJ2Q@mail.gmail.com>
 <CAEsyxyiPCXVmD-StDm+ZgOvDPASzXHci9dTaOWNf+VYFDEo97A@mail.gmail.com>
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

On Wednesday, February 10th, 2021 at 10:04 PM, Mario Kleiner <mario.kleiner.de@gmail.com> wrote:

> Ping!

I now understand the problem better.

Reviewed-by: Simon Ser <contact@emersion.fr>

I'll push to drm-misc-next in a few days if no-one complains. Ping me
again if I forget.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
