Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E63932627AE
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 09:04:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21DDA6E9C2;
	Wed,  9 Sep 2020 07:04:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CFE16E9C2
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 07:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599635041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BmoilYUW2IczIUBHKVecyAuGDS0ktP0Mp/D5yvQmOpo=;
 b=Hf53X5MW7T5zLov0Ghi2e3P26gTF7PkVxk317eyuRLgvIEJ7UMvuqOXonFwRRVaeof15Pc
 LoHqqNnhIQnzQJRv8qB5UFSEHBQjs72VAzU/2qAlL9914mRix613UMJBVczEp56zkJ5CUf
 HlsnurJKICFGR0Gl7n7FEKHoLrWAm/E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-lrORURhaMpe3yjyXXAFi4Q-1; Wed, 09 Sep 2020 03:03:57 -0400
X-MC-Unique: lrORURhaMpe3yjyXXAFi4Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DC491DDE4;
 Wed,  9 Sep 2020 07:03:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC98A27BCD;
 Wed,  9 Sep 2020 07:03:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 00FC99ACF; Wed,  9 Sep 2020 09:03:49 +0200 (CEST)
Date: Wed, 9 Sep 2020 09:03:49 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v2 04/23] virtio: Add get_shm_region method
Message-ID: <20200909070349.uyvg44xakdftibxh@sirius.home.kraxel.org>
References: <20200902210847.2689-1-gurchetansingh@chromium.org>
 <20200902210847.2689-5-gurchetansingh@chromium.org>
 <20200902221514.GE1263242@redhat.com>
 <CAAfnVBnfbwc07au1OMec8g5yHC0D3yXc88nOtTopO4sitYf8ig@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAfnVBnfbwc07au1OMec8g5yHC0D3yXc88nOtTopO4sitYf8ig@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
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
Cc: virtio-dev@lists.oasis-open.org, Miklos Szeredi <miklos@szeredi.hu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>, Vivek Goyal <vgoyal@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 02, 2020 at 05:00:25PM -0700, Gurchetan Singh wrote:
> On Wed, Sep 2, 2020 at 3:15 PM Vivek Goyal <vgoyal@redhat.com> wrote:
> 
> > Hi Gurchetan,
> >
> > Now Miklos has queued, these tree virtio patches for shared memory
> > region in his tree as part of virtiofs dax patch series.
> >
> > I am hoping this will get merged in 5.10 through his tree.
> >
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git/log/?h=dax
> 
> 
> Terrific ... !  Maybe we can queue the version Miklos has in drm-misc-next
> to avoid merge conflicts ?!?

I guess it would either be merging the fuse tree into drm-misc-next,
or cherry-picking the three virtio shm patches from the fuse tree.

Daniel?  What is the usual way to handle this?

thanks,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
