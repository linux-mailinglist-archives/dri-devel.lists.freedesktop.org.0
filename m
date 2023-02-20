Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB7A69D0C3
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 16:39:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E6110E223;
	Mon, 20 Feb 2023 15:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C9710E223
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 15:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676907555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=blwIGNmJhagExeJthlnkpjNNfOF38rzxP15q8EfcTVM=;
 b=h+dxp8TAyqR6qXb6KJgXgbmUUKQqxxdeiK3HwbvL3bKNWiCl5WvGa+RC4pqIhYAdsmGpaF
 e83UHkK8/OLWmNspcQLpVbkNeLUk/m1wMiTofu3I7zRUC4skwdOtbw8/Yo/tHqAnijF5uR
 aFohVbNp9pxOC7Y2eCKHXAaFQqmH0ng=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-lI2gB4BFO9aCq9rkMLSXWQ-1; Mon, 20 Feb 2023 10:39:12 -0500
X-MC-Unique: lI2gB4BFO9aCq9rkMLSXWQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 46D17100F82A;
 Mon, 20 Feb 2023 15:39:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C8F20492B00;
 Mon, 20 Feb 2023 15:39:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 77451180091D; Mon, 20 Feb 2023 16:39:10 +0100 (CET)
Date: Mon, 20 Feb 2023 16:39:10 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 17/17] drm/cirrus: Use VGA macro constants to unblank
Message-ID: <20230220153910.wurtq3jpz3llq3v6@sirius.home.kraxel.org>
References: <20230215161517.5113-1-tzimmermann@suse.de>
 <20230215161517.5113-18-tzimmermann@suse.de>
 <20230216113330.rmzmkdvpxdqk2nrd@sirius.home.kraxel.org>
 <edafc067-f8f1-e45b-9b0b-da0f1cabac4b@suse.de>
MIME-Version: 1.0
In-Reply-To: <edafc067-f8f1-e45b-9b0b-da0f1cabac4b@suse.de>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
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
Cc: airlied@redhat.com, sam@ravnborg.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 20, 2023 at 03:22:03PM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 16.02.23 um 12:33 schrieb Gerd Hoffmann:
> > On Wed, Feb 15, 2023 at 05:15:17PM +0100, Thomas Zimmermann wrote:
> > > Set the VGA bit for unblanking with macro constants instead of magic
> > > values. No functional changes.
> > 
> > blank/unblank should work simliar to bochs (see commit 250e743915d4),
> > that is maybe a nice thing to add of you modernize the driver anyway.
> > 
> > take care,
> >    Gerd
> > 
> 
> Do you have comments on the other patches?

Checked briefly only, looked sane overall.  Seems the blit and format
conversions helpers improved alot since I've added them initially (don't
follow drm that closely any more, busy with other stuff), nice to see
cirrus being updated to that and getting dirty tracking support.

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

take care,
  Gerd

