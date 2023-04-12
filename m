Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA086DFD3D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 20:12:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B807210E28B;
	Wed, 12 Apr 2023 18:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93DC110E0F1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 18:12:49 +0000 (UTC)
Received: from mail.panix.com (localhost [127.0.0.1])
 by mailbackend.panix.com (Postfix) with ESMTPA id 4PxW5q4BRMz47j8;
 Wed, 12 Apr 2023 14:12:47 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
 t=1681323167; bh=DvXrenb9Kgk8Kq1FPp3NAzT+K5TJB88dBKyeYXg0qUE=;
 h=In-Reply-To:References:Date:Subject:From:To:Cc;
 b=Ev4IV7kaTaSnTFw5fwQIMzThRKaAuB3VYooO0MwC9OxuawXKoaJywqR7JYgIrZW5S
 JY0RWMxMiMz5J32Mkp9KkxH32QjDocoLh3g1vXldMTCXnS/QiahFpWoYCo7rD96sSE
 +bLeaEp2FQz22WestWfImV7vx2o8YLRsfg0susfM=
X-Panix-Received: from 166.84.1.2
 (SquirrelMail authenticated user pa@panix.com)
 by mail.panix.com with HTTP; Wed, 12 Apr 2023 14:12:47 -0400
Message-ID: <beeff0335ab4cc244d214a7baadba371.squirrel@mail.panix.com>
In-Reply-To: <87jzyhror0.fsf@minerva.mail-host-address-is-not-set>
References: <20230412150225.3757223-1-javierm@redhat.com>
 <2e07f818ccdff7023a060e732d7c4ef6.squirrel@mail.panix.com>
 <87jzyhror0.fsf@minerva.mail-host-address-is-not-set>
Date: Wed, 12 Apr 2023 14:12:47 -0400
Subject: Re: [PATCH] firmware/sysfb: Fix wrong stride when bits-per-pixel is
 calculated
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, Pierre Asselin <pa@panix.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> Interesting. So you don't have the simplefb output that you had before ?

I do now, after a 'make clean' and "make bzImage'.

In between, I had tried CONFIG_SYSFB_SIMPLEFB=n .  That "works", by
falling back to vesafb in every case.  I restored the .config before
testing the patch, but there must have been leftover dregs in the
build tree.  1024x768x32 is garbled, others are good whether simplefb
or vesafb.

--PA


