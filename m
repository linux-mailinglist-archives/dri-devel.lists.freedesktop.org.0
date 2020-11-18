Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8582B813D
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 16:55:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49DF56E44B;
	Wed, 18 Nov 2020 15:55:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9266E44B
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 15:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605714941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZLN1tZregskgxwlKFqOaGth3vex0IE1qIiMAj435Rls=;
 b=SPPBDMNW625r31jYT3iCyqgufHGXn0DWxf46S6kRJDuPjTR2cSDvlEidGHhbvgnNgwu8Na
 0hokT1TUylz8fY1aFjqMQdsHMiJNm4vz+IXAhk1p30AQhr8edD3toqQnpWrtQZiN8ISLEz
 UAY1ArPlrlHFcGJdVEZxaX22hwCsxGI=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-bpdoeFP-Pl2ImTv0iE_ZAQ-1; Wed, 18 Nov 2020 10:55:40 -0500
X-MC-Unique: bpdoeFP-Pl2ImTv0iE_ZAQ-1
Received: by mail-vk1-f200.google.com with SMTP id j129so892470vkb.15
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 07:55:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZLN1tZregskgxwlKFqOaGth3vex0IE1qIiMAj435Rls=;
 b=bpIsbKssreqnIzGfM3zWxxR5fP4vdKCR2AqBLfepO98mQZL0EuDkynllRTWL+TIxWS
 VG3DaZf0c57ImjagrDNvjqJAXYzbjLaAl2vWNPUM8ly0w0yWJbzqRS75JeNiqFxHcvcQ
 WMciSsWSsA8hpRNkZZBy7Gc1cqqX9rmZy+720m0/sqFNkLvaEgF/nJK8h6c9MdUCse4B
 0d+ArY4XkIETIxS66kR5x0QwdwcCv36qxv7QuOWbPxMlb9CriMdesPLNO2MlyMCoYDgs
 5kIqNgC474UIdy2Py7mcQ2Y8aCjClPTllWhM8Fxmx06/Fh/xjXlSrVvjmadnX0OHZihm
 S0yw==
X-Gm-Message-State: AOAM5331lEY+Lflwh5/DKEdxM171hH40WtQ9AAvQwqsg5chnJ7cebLmH
 qBvA8jwhabN7iuBXYe344Fs0qegJju+t5zlT+Ysp0HGNbCweYZbgx1LD4qc3gTvZznwKMLTj/XW
 R8cCbEiNkNv8plxqoiofSIK+9foQInLyEJCXk7Hv1oY+M
X-Received: by 2002:a67:b143:: with SMTP id z3mr4003390vsl.29.1605714939930;
 Wed, 18 Nov 2020 07:55:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwxoyKsHf/ugxq3PnxOBDsnZmz/fYDbLI6wAsIkP8WrdfLRX1rhz9mf9mFKyKCWRW8sqSpdIy9ChuJT3NyTZA4=
X-Received: by 2002:a67:b143:: with SMTP id z3mr4003376vsl.29.1605714939757;
 Wed, 18 Nov 2020 07:55:39 -0800 (PST)
MIME-Version: 1.0
References: <20201117214029.591896-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20201117214029.591896-1-daniel.vetter@ffwll.ch>
From: Adam Jackson <ajax@redhat.com>
Date: Wed, 18 Nov 2020 10:55:27 -0500
Message-ID: <CAD_bs+ouZZEREo4irNEgb5VBrFJaMPfLhWQG0mnLNMshQac9uA@mail.gmail.com>
Subject: Re: [PATCH] char/agp: Disable frontend without CONFIG_DRM_LEGACY
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ajackson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 17, 2020 at 4:40 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> It's probably full of bugs ready for exploiting by userspace. And
> there's not going to be any userspace for this without any of the drm
> legacy drivers enabled too. So just couple it together.

Not quite true. The only UMS driver using this is i810, which needs it
even with DRI disabled. I have difficulty caring though.

In related news, since i810 is only ever attached to 32-bit x86 we
could disable the frontend unconditionally on amd64 (and everything
else tbh).

Acked-by: Adam Jackson <ajax@redhat.com>

- ajax

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
