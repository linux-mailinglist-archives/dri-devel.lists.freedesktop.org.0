Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A58A40BFA5
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 08:29:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9923A6E8D0;
	Wed, 15 Sep 2021 06:29:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D9F6E8D0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 06:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631687387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+C6oOXnSiXCMxV5e9+CpUPoeNdMOGB3oYk9FF4IqK+A=;
 b=Bb5yZdOHp0aLqXvbVhb52ZaGAH26MO7sFuX1C257089zdMFPObp/6KdxBigYKy8jOp0+b9
 oQAoBpyPP8RaxJEnM/5EEej40BNUz3o4N69hxSRYrASGoueaw902iTBRHOIlsN0Rtzzw7V
 bUcwkHKj/rWOWafgjcF8wd+07xxHlZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-PpDkW-RaNMSdhiRoBpC_4w-1; Wed, 15 Sep 2021 02:29:44 -0400
X-MC-Unique: PpDkW-RaNMSdhiRoBpC_4w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3146824FAF;
 Wed, 15 Sep 2021 06:29:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A68666D982;
 Wed, 15 Sep 2021 06:29:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DF43618003BF; Wed, 15 Sep 2021 08:29:40 +0200 (CEST)
Date: Wed, 15 Sep 2021 08:29:40 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "H. Peter Anvin (Intel)" <hpa@zytor.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 virtualization@lists.linux-foundation.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bochs: add Bochs PCI ID for Simics model
Message-ID: <20210915062940.m3q2fwbipkq7ki6s@sirius.home.kraxel.org>
References: <20210910010655.2356245-1-hpa@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210910010655.2356245-1-hpa@zytor.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 09, 2021 at 06:06:55PM -0700, H. Peter Anvin (Intel) wrote:
> Current (and older) Simics models for the Bochs VGA used the wrong PCI
> vendor ID (0x4321 instead of 0x1234).  Although this can hopefully be
> fixed in the future, it is a problem for users of the current version,
> not the least because to update the device ID the BIOS has to be
> rebuilt in order to see BIOS output.
> 
> Add support for the 4321:1111 device number in addition to the
> 1234:1111 one.
> 
> Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>

Pusged to drm-misc-next.

thanks,
  Gerd

