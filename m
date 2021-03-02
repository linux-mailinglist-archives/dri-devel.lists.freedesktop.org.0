Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 162E132A9B0
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 19:49:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 773536E156;
	Tue,  2 Mar 2021 18:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2678A6E156
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 18:49:07 +0000 (UTC)
Date: Tue, 02 Mar 2021 18:48:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1614710945;
 bh=RhVEIRzbjHNgG6Y030FNDmR2hiibGBW+O8tE60/5yWk=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=Xz5wbGNzbYb/XUZ9KZP+ePy3eX60/k8IKyVbbaCLwuw29iICz+0zdf0bzxiWEf+vr
 O/Ax/lk1ztoNvDMUvO4PD1Lh/KOcd0tAvdeLbEMMI1ZqQjLRhx9cOrUcT/d09y104f
 11PZyTw+zrMJuDpi2vZ7Gx0MXMG3/yNAJ26a8z7yS+DZ1sx+U15K/472NSpr7xmNDA
 LFw7UK8Kpx4B7o4IJCdJ/4ujoQw8nOHOCeeC3NZWMgTcZuxuJ6U4WV3s08PMbZbSVl
 XBy0eHDmgB3R6yUBFfRHWO3bbGplv9OQpYP5u7YOuqHn2/NAk0wlCDQx5xjgEmB+t4
 0/2dNwVirvCjQ==
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: fix drm_mode_create_blob comment
Message-ID: <Eiy9zIP90rvGFYbBWMLgx5IENCX1uayDndzSAWKt6h2qu_bIglC1qlK_8dtQ28TX2CwSpdZx8k3vKkHiRrPoY8iGjORz3C4Y3v2RMQYWoT8=@emersion.fr>
In-Reply-To: <845e5b3d-e0f8-5744-912f-451f68d75c70@intel.com>
References: <20210302184427.1301264-1-lionel.g.landwerlin@intel.com>
 <Nf4cFhlWS8f3tTL_MvE_MtW993Krf02M8R5WC-RyZ5fYosyKCej9FqPT8QgDwhCnacxn3nKd_HLWjgi47kOrQiYRXVO361sSskqgtp8FoDk=@emersion.fr>
 <845e5b3d-e0f8-5744-912f-451f68d75c70@intel.com>
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
Cc: Ben Widawsky <ben@bwidawsk.net>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, March 2nd, 2021 at 7:47 PM, Lionel Landwerlin <lionel.g.landwerlin@intel.com> wrote:

> Thanks Simon. Do you have the rights to push this patch?

Ah, since you're asking about this, it probably means you don't have the
rights. I'll push the patch now to drm-misc-next.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
