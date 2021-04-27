Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0344436C234
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 11:56:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F3BA6E199;
	Tue, 27 Apr 2021 09:56:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7150B6E199
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 09:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619517373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CqBHus7kNunXCOzNNE8SVUvJLOs32xdLfSR01IvYTjU=;
 b=BiznsfwDgMkZoZblpkOuf2XPQ5/exrMKBG3NRCL0YkusPCDnSqk/ufDpXTXIdDRjpnF2t8
 QA/bE2X3YyH0I4zLda0ht/TyaBQ1CJK6rkdIgxRhJdpgobD7Y4KLTUZScd9rSC8wT0QagO
 /VYd6WCjNpD6u1PG7SMd8BqarC3yUYQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-FkEAHZAiN6iRONCgF87vEA-1; Tue, 27 Apr 2021 05:56:09 -0400
X-MC-Unique: FkEAHZAiN6iRONCgF87vEA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C10C96D241;
 Tue, 27 Apr 2021 09:56:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 63C7D5D9C0;
 Tue, 27 Apr 2021 09:56:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4A7B61800393; Tue, 27 Apr 2021 11:56:04 +0200 (CEST)
Date: Tue, 27 Apr 2021 11:56:04 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2] drm/bochs: Add screen blanking support
Message-ID: <20210427095604.razo3nrqbfhcjrmd@sirius.home.kraxel.org>
References: <20210421080859.14869-1-tiwai@suse.de>
 <d1b1fa01-2254-f5cf-0ed0-f8e9c1c3f9ae@suse.de>
 <s5hk0oo1c9d.wl-tiwai@suse.de>
 <a557e727-d866-3dd3-ec96-741e7da7cf62@suse.de>
MIME-Version: 1.0
In-Reply-To: <a557e727-d866-3dd3-ec96-741e7da7cf62@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > I'm fine to change in any better way, of course, so feel free to
> > modify the patch.
> 
> If no one objects, I'll merge it as-is. It's somewhat wrong wrt to VGA, but
> apparently what qemu wants.

No objections.

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

FYI: cirrus is in the same situation, the modesetting works with qemu
but is possibly incomplete and might not work on cirrus real hardware
(it only binds to the qemu subsystem id for that reason).

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
