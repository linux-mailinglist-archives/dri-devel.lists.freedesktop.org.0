Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C9D153B8D
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 23:58:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE076F972;
	Wed,  5 Feb 2020 22:58:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1707C6F973
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 22:58:22 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 92A8D5C406B;
 Wed,  5 Feb 2020 23:58:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1580943500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3VcufrJgxcsnT3S/lhbayM64sOm4ET3fTVcPeVl2zZQ=;
 b=ZFeVZv5CBiTvPjv/SoNT0kqhSe8GHIQRwoODxqFs1CRGLHTi1oJPSx5IzsHc0HMAY3YuKg
 47L9FkQvz7oqUDbthAyrbKSI3/dYX2BKNGGeLPDZNhzqWSt8+lIZLZqkK95qmgooY8HaeR
 J0M99Jpg9b3v94QFpK0P4vJyCFZyZTc=
MIME-Version: 1.0
Date: Wed, 05 Feb 2020 23:58:20 +0100
From: Stefan Agner <stefan@agner.ch>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] drm: Add missing newline after comment
In-Reply-To: <5a14078affad5e26330627d91df394da990ba301.camel@perches.com>
References: <586aab08af596120f48858005bb6784c83035d59.1580941448.git.stefan@agner.ch>
 <5a14078affad5e26330627d91df394da990ba301.camel@perches.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <75de5f45061e2d13268479d43cb84625@agner.ch>
X-Sender: stefan@agner.ch
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
Cc: airlied@linux.ie, daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-02-05 23:50, Joe Perches wrote:
> On Wed, 2020-02-05 at 23:26 +0100, Stefan Agner wrote:
>> Clang prints a warning:
>> drivers/gpu/drm/drm_lock.c:363:6: warning: misleading indentation;
>> statement is not part of the previous 'if' [-Wmisleading-indentation]
>>          */     mutex_lock(&dev->struct_mutex);
>>                 ^
>> drivers/gpu/drm/drm_lock.c:357:2: note: previous statement is here
>>         if (!drm_core_check_feature(dev, DRIVER_LEGACY))
>>         ^
>>
>> Fix this by adding a newline after the multi-line comment.
> 
> Thanks, already in -next

Whoops, sorry for the duplication. Searched for "indentation" which did
not bring that one up.

--
Stefan

> 
> commit 5b99cad6966b92f757863ff9b6688051633fde9a
> Author: Dan Carpenter <dan.carpenter@oracle.com>
> Date:   Wed Jan 8 08:43:12 2020 +0300
> 
>     gpu/drm: clean up white space in drm_legacy_lock_master_cleanup()
>     
>     We moved this code to a different file and accidentally deleted a
>     newline.
>     
>     Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>     Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>     Link:
> https://patchwork.freedesktop.org/patch/msgid/20200108054312.yzlj5wmbdktejgob@kili.mountain
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
