Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FD86E822D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 21:56:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D0810E2A1;
	Wed, 19 Apr 2023 19:56:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D48C310E1F2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 19:56:30 +0000 (UTC)
Received: from mail.panix.com (localhost [127.0.0.1])
 by mailbackend.panix.com (Postfix) with ESMTPA id 4Q1s4D5cR2z48Rj;
 Wed, 19 Apr 2023 15:56:28 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
 t=1681934189; bh=+fFGEN80heOFvMCfA1mGu8Lh0yeXbVFuWYiQrtdEiBI=;
 h=In-Reply-To:References:Date:Subject:From:To:Cc;
 b=fbBVOXffQL4DH5rHXTQjy+kN0stC8gnZWluumsN5sDK9enf/B8NFDB6Y3pqzJcPL6
 LxjhVUNWX5afQJJwb/NI7BE7EeXDzN6+Z76UxAV2QzdEtqPJtTkDpxxwXaqYyE1srj
 ijBcSPgbHJpqMcx5TvF5vb6dWCZI1tszBIBE2sAg=
X-Panix-Received: from 166.84.1.1
 (SquirrelMail authenticated user pa@panix.com)
 by mail.panix.com with HTTP; Wed, 19 Apr 2023 15:56:29 -0400
Message-ID: <daef19bc1a59c0bb19fc78b2cdedf07d.squirrel@mail.panix.com>
In-Reply-To: <87bkjki8p8.fsf@minerva.mail-host-address-is-not-set>
References: <20230419044834.10816-1-pa@panix.com>
 <87bkjki8p8.fsf@minerva.mail-host-address-is-not-set>
Date: Wed, 19 Apr 2023 15:56:29 -0400
Subject: Re: [PATCH v2] firmware/sysfb: Fix VESA format selection
From: "Pierre Asselin" <pa@panix.com>
To: "Javier Martinez Canillas" <javierm@redhat.com>
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
 Hans de Goede <hdegoede@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Javier Martinez Canillas <javierm@redhat.com> writes:
> Pierre Asselin <pa@panix.com> writes:

>> Fixes: f35cd3fa7729 [firmware/sysfb: Fix EFI/VESA format selection]
>
> The convention is f35cd3fa7729 ("firmware/sysfb: Fix EFI/VESA format
> selection")

>> +		bits_per_pixel= max(bits_per_pixel, (u32)si->lfb_depth);
>
> You are missing a space here.

OK.  I'll fix that.  Thanks.

--PA

