Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBCE492341
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 10:54:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052F710E486;
	Tue, 18 Jan 2022 09:54:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6098B10E486
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 09:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642499641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XDuwTuoJ9YB+ODFSUsA012oaBLCLX1OTiYl269u+isg=;
 b=arOdvwWHy4kJOh1rizv+F/bHVdVX8Gfsjm1QBX+kvfKJjkdDv82Jy12di+ZIjth6zomnS6
 BQzodwJqNlaznfHqLW4m4H/xYcDX2VP80C44aCWNKNuzi53urHIWxIm/WRHhbaraWkEQij
 QYTgbNWeminCgv9u7lO7oKqCCdAYYSg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-pOEjfmZ9PQSzXe8hW18vow-1; Tue, 18 Jan 2022 04:53:56 -0500
X-MC-Unique: pOEjfmZ9PQSzXe8hW18vow-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B944B3E743;
 Tue, 18 Jan 2022 09:53:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E38F6F129;
 Tue, 18 Jan 2022 09:53:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B94AD18000A6; Tue, 18 Jan 2022 10:53:52 +0100 (CET)
Date: Tue, 18 Jan 2022 10:53:52 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
Message-ID: <20220118095352.xsb6fqacw4p276c5@sirius.home.kraxel.org>
References: <YeG8ydoJNWWkGrTb@ls3530>
 <c48ad8ae-aea5-43fa-882f-dccb90dde9a4@suse.de>
 <87bl0amc6s.fsf@x1.stackframe.org>
 <20220118103323.4bae3a7d@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220118103323.4bae3a7d@eldfell>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Sven Schnelle <svens@stackframe.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 18, 2022 at 10:33:23AM +0200, Pekka Paalanen wrote:
> On Mon, 17 Jan 2022 19:47:39 +0100
> Sven Schnelle <svens@stackframe.org> wrote:
> 
> > I also tested the speed on my Thinkpad X1 with Intel graphics, and there
> > a dmesg with 919 lines one the text console took about 2s to display. In
> > x11, i measure 22ms. This might be unfair because encoding might be
> > different, but i cannot confirm the 'memcpy' is faster than hardware
> > blitting' point. I think if that would be the case, no-one would care
> > about 2D acceleration.
> 
> I think that is an extremely unfair comparison, because a graphical
> terminal app is not going to render every line of text streamed to it.
> It probably renders only the final view alone if you simply run
> 'dmesg', skipping the first 800-900 lines completely.

Probably more like "render on every vblank", but yes, unlike fbcon it
surely wouldn't render every single character sent to the terminal.

Also acceleration on modern hardware is more like "compose window
content using the 3d engine" than "use 2d blitter to scroll the window".

> Maybe fbcon should do the same when presented with a flood of text,
> but I don't know how or why it works like it works.

fbcon could do the same, i.e. render to fbdev in a 60Hz timer instead of
doing it synchronously.

take care,
  Gerd

