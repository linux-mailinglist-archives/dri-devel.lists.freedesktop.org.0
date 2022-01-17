Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D53490912
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 13:57:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E63A910E24E;
	Mon, 17 Jan 2022 12:57:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D558510E1A1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 12:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642424245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sFtW5j5+VVKOnv4SvkQZxdJ10EG3/bDXd5xR/QAYVgI=;
 b=Taq7jQnBKN8x1DNz1K0+TKDlvSjYC5fsOOCNDwdZsu+Ob2Mm4osVULZAwurRw0T8NC3cRW
 5nmwcfnRMYl1yTC1sstJ2WJ8D/9pLEDRl7bCf7chgLp7UCgN9UzKZmogB/Gb36fhNnd53n
 vGrzzBzmxnzNsoVAOephTDwQtc3k51k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-5nhe9x8AO5uAzsdZdyfyQQ-1; Mon, 17 Jan 2022 07:57:20 -0500
X-MC-Unique: 5nhe9x8AO5uAzsdZdyfyQQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00CA11006AB7;
 Mon, 17 Jan 2022 12:57:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A80AC74EAE;
 Mon, 17 Jan 2022 12:57:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C4BE318003BF; Mon, 17 Jan 2022 13:57:16 +0100 (CET)
Date: Mon, 17 Jan 2022 13:57:16 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
Message-ID: <20220117125716.yjwxsze35j2ndn2i@sirius.home.kraxel.org>
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
 <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
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
Cc: linux-fbdev@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> b) to include new drivers (for old hardware) if they arrive (probably happens rarely but there can be).
>    I know of at least one driver which won't be able to support DRM....

Hmm?  I seriously doubt that.  There is always the option to use a
shadow framebuffer, then convert from standard drm formats to whatever
esoteric pixel format your hardware expects.

Been there, done that.  Have a look at the cirrus driver.  The physical
hardware was designed in the early 90-ies, almost 30 years ago.  These
days it exists in virtual form only (qemu emulates it).  Thanks to the
drm driver it runs wayland just fine even though it has a bunch of
constrains dictated by the hardware design.

take care,
  Gerd

