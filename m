Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E491D27F2
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 08:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 661E16E10B;
	Thu, 14 May 2020 06:36:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E8E6E10B
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 06:36:33 +0000 (UTC)
Date: Thu, 14 May 2020 06:36:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1589438190;
 bh=TG6q1oVn9yu9TrPo2CgKnbg1pqUklx0m8C5AyvFrsr0=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=1vCUkV73e9+2C9vkOYc1D6vdpRtlHdDeQrRHX4cHoHzn8aW/pC5hhzjarnFMWscQa
 EH2CeI6KQACny43AmtwusPMeJ0cjVuLTJawObnMDecKzs8iuotyxHqmQuz3JiX0A1b
 BmlqTDSBIMY3fYF3X4XjDxL8Yy55+HsB7E3o8na8=
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2] drm: plane: Verify that no or all planes have a zpos
 property
Message-ID: <kUdOgrEHV2CISzB4AyQ56o4qMW9CVtrVxs3SqCNbklOk6PczzNKbMnzUBIGgxtcsh4scTiOKQUUzxvca1ES1u6uYITbD1clU-lk7gMPYF-w=@emersion.fr>
In-Reply-To: <20200513225835.19361-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200513225835.19361-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, May 14, 2020 12:58 AM, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com> wrote:

> The zpos property is used by userspace to sort the order of planes.
> While the property is not mandatory for drivers to implement, mixing
> planes with and without zpos confuses userspace, and shall not be
> allowed. Clarify this in the documentation and warn at runtime if the
> drivers mixes planes with and without zpos properties.

Thanks for the patch, this looks good to me!

Acked-by: Simon Ser <contact@emersion.fr>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
