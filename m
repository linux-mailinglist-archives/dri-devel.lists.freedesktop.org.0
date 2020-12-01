Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 651472CAD05
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 21:09:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C85436E8C0;
	Tue,  1 Dec 2020 20:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD8B46E8C0
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 20:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606853368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z9xBuIwvHlgEYVcinhRR/M3/VaorTrBcdWGpGOVdNeU=;
 b=gyAhGPYUFm8y3ewTqzGrM8kqbrOCnYdkWYFuBDiBu4KGxFky9lppc9HM+7jNgReyJAaiif
 mx9JePHQiaLOPN0jWNHIB9c0pcBmwvwHo0EtlzvkBfImZoeEYFlPbtaq7ybhZYSD62SDOU
 OEYZX3gTsJGABSsmhD6H4Zvdcjhj7QE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-iuFG615qMPK1Fc5-5Lrjvw-1; Tue, 01 Dec 2020 15:09:22 -0500
X-MC-Unique: iuFG615qMPK1Fc5-5Lrjvw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E08A158220;
 Tue,  1 Dec 2020 20:09:20 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C3077189A4;
 Tue,  1 Dec 2020 20:09:19 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 0B1K9JVF025796; Tue, 1 Dec 2020 15:09:19 -0500
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 0B1K9I7G025792; Tue, 1 Dec 2020 15:09:18 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Tue, 1 Dec 2020 15:09:18 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] fbdev: Remove udlfb driver
In-Reply-To: <alpine.LRH.2.02.2012010500310.27495@file01.intranet.prod.int.rdu2.redhat.com>
Message-ID: <alpine.LRH.2.02.2012011505060.25490@file01.intranet.prod.int.rdu2.redhat.com>
References: <20201130125200.10416-1-tzimmermann@suse.de>
 <alpine.LRH.2.02.2011300843270.29199@file01.intranet.prod.int.rdu2.redhat.com>
 <336a41ef-1e49-6799-1bfd-06fb42419fb8@suse.de>
 <alpine.LRH.2.02.2012010500310.27495@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org, geert+renesas@glider.be, corbet@lwn.net,
 daniel.vetter@ffwll.ch, linux-doc@vger.kernel.org, bernie@plugable.com,
 dri-devel@lists.freedesktop.org, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On Tue, 1 Dec 2020, Mikulas Patocka wrote:

> When I try to run Xorg (from Debian 9) with the kernel 5.10-rc6, it 
> doesn't work at all, I get this crash:

I tried to rux Xorg on another machine (with up-to-date Debian ports) and 
it didn't crash on unplug.

Mikulas

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
