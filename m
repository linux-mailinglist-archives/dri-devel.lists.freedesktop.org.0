Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4489331886E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 11:44:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5713C6E1BC;
	Thu, 11 Feb 2021 10:44:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 148FE6E1BC
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 10:44:30 +0000 (UTC)
Date: Thu, 11 Feb 2021 10:44:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1613040267;
 bh=TiejeRaZQWyg1RPQIBLyHW4IBn+RhTGA6PzWxdVHgkE=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=iXbH4Byjg/9vVEbPzaG8iLt4rlJ/u46F0yARneenfUQDL9CBlc4+Mu9oAFU69xVEJ
 L7VJVRZed61GopwiFPbouSyZjsF5WUAHbPHKTHWOReaNUX9tKrBLMhU++MSZf3CT+Z
 lmc5wwPKwTUssA6RwI1xSeAiZfB5EELzYlDlXsJZkUPegV9E4vlU1WwMEwWvu8OiD2
 Eg9k+2eV1u3mOxaqN296R1QDxYNQutJJcf+ZchuOvrITzxEM3SlurJn3vGoxOgqH+9
 fXodmCmC4BRJ0on7g4yXtyqkH90ei4YIAdrqv85x49U+ZGdKxMiYoxmgQz9t4TRXnX
 Z32adNsIMEJEw==
To: Mario Kleiner <mario.kleiner.de@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: Fix HDMI_STATIC_METADATA_TYPE1 constant.
Message-ID: <i1dksO6waKRbZE3gZaRpbDVEqdzpI10SrgvB9bEO2fbDeKQXUonBwCNEgtFHDn-lirZN52seQQusGiKDtRUGKRxG8WY2x46QnNRw_cd2FKg=@emersion.fr>
In-Reply-To: <CAEsyxyjxdqKrxkd=J9Tvi8wKQDLBMHv3yhgdu-eOQx5GXuWdbA@mail.gmail.com>
References: <20210124044010.18678-1-mario.kleiner.de@gmail.com>
 <YA61Aa07PhDucMyG@intel.com>
 <-NvMjiGAV79IMWvTOWrb2u_SHe2U36XumXbITMgCCqpMVg-FcvGRJbeTHaiUwkBSxZS5XaXYziZnoTdXJENA-JYQWNi-28F01___0SsWvv0=@emersion.fr>
 <CAEsyxyiK+bDyLDsk-jG3GGYWBjkGZeFamutmtDiNYvJSm4qegg@mail.gmail.com>
 <7Zl9uZ-uolN1JkU8Muxro-A5gTSN2SmmxYhs9g2UYfTFCJIoZVMIdkcPBbR6nkTxb3gWSwqTAsCfnlrtNzH133HdIZ9dCYcwZchv0iXZCnA=@emersion.fr>
 <CAEsyxygB-VZHg9a68Qb3XJ+xULwEeCkUFfthN4H+sdoVRXmJ2Q@mail.gmail.com>
 <CAEsyxyiPCXVmD-StDm+ZgOvDPASzXHci9dTaOWNf+VYFDEo97A@mail.gmail.com>
 <n2gjLlZ27Z0RAqlk7YhAi09RO_MKDmgP8crN2oeu-4O8pivnXph2Awy1ArYl61paax544su5pq13634h3Pm9OGB9QKt-RZ7mfz49aj64xy0=@emersion.fr>
 <CAEsyxyjxdqKrxkd=J9Tvi8wKQDLBMHv3yhgdu-eOQx5GXuWdbA@mail.gmail.com>
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

On Wednesday, February 10th, 2021 at 11:02 PM, Mario Kleiner <mario.kleiner.de@gmail.com> wrote:

> I'll prepare patches with the same fix for libdrm and igt as well soon.

Please don't submit patches for drm_fourcc.h to downstream if they vendor the
whole file. Instead, update it from the kernel once your patch is merged to
drm-next. For instance, see [1] for libdrm.

Simon

[1]: https://gitlab.freedesktop.org/mesa/drm/-/blob/master/include/drm/README
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
