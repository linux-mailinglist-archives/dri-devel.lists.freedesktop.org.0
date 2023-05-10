Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4206FE337
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 19:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3EC110E4DE;
	Wed, 10 May 2023 17:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E0E110E4DE
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 17:25:45 +0000 (UTC)
Received: from mail.panix.com (localhost [127.0.0.1])
 by mailbackend.panix.com (Postfix) with ESMTPA id 4QGhkb2WxKz3qxt;
 Wed, 10 May 2023 13:25:43 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
 t=1683739543; bh=3vzeVieXm2xf9+VzU0gVvFLlV+/iwQu/sK9Jt9RTw+4=;
 h=In-Reply-To:References:Date:Subject:From:To:Cc;
 b=EFng2gh94Y/9VT3NuRSMb7JJtBFESmkbWDHvkTjaRKkO77PfNTvMFtWX9OtexDduv
 lcMqaXgV4xe3CIoVIsyLzp1PjK5nbu1yoxlTqi4k/KD00vevyGdsS+mgqmT7EIxyhe
 Ck+x7JXvutMi2ZrO4dvEPbKg9yH8MVr05JEoZ5iQ=
X-Panix-Received: from 166.84.1.2
 (SquirrelMail authenticated user pa@panix.com)
 by mail.panix.com with HTTP; Wed, 10 May 2023 13:25:43 -0400
Message-ID: <1f2a1e8ee99fc9f0a89ad47d112728c9.squirrel@mail.panix.com>
In-Reply-To: <2f4370b6-8426-400a-8be1-36a48dadccad@suse.de>
References: <20230420155705.21463-1-pa@panix.com>
 <2f4370b6-8426-400a-8be1-36a48dadccad@suse.de>
Date: Wed, 10 May 2023 13:25:43 -0400
Subject: Re: [PATCH v3] firmware/sysfb: Fix VESA format selection
From: "Pierre Asselin" <pa@panix.com>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
User-Agent: SquirrelMail/1.4.23-p1
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
X-Priority: 3 (Normal)
Importance: Normal
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
Cc: Pierre Asselin <pa@panix.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Hans de Goede <hdegoede@redhat.com>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmerman <tzimmermann@suse.de> writes:
>
> I found this casting mess even more unreadable. I went back to v2, fixed
> the style issues and committed the patch as v4 (still under your name).
>
> https://cgit.freedesktop.org/drm/drm-tip/commit?id=1b617bc93178912fa36f87a957c15d1f1708c299

Will this patch make it into Linux 6.4 ?

--PA

