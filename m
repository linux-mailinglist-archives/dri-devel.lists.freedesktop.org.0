Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A54246531
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 13:12:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C31B56E25B;
	Mon, 17 Aug 2020 11:12:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 836EF6E25B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 11:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597662768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ojqM6VDGywhYof5vQ0rOPdeZdR7vkZBO7fWbPCxSWII=;
 b=hlJSjXKsFnKAFcuNMEHc98NZnlIUWLg95eEPDNg1b4Kkq99eTYhgH3YMQbnyz5RJe+n+6k
 oFzazwP+DiJ64iIm+fVS7uMkdaXC7sqPMaJICiLrm4ypFJdPoU07NKmZTN6gRjf3XKPSuL
 ib4WV5ufWk2u2VaPeyins8GwrjfZRig=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-AxrCrgTLPfKBA1qS5-fhAQ-1; Mon, 17 Aug 2020 07:12:44 -0400
X-MC-Unique: AxrCrgTLPfKBA1qS5-fhAQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 184321DDE5;
 Mon, 17 Aug 2020 11:12:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-195.ams2.redhat.com
 [10.36.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91FD01002393;
 Mon, 17 Aug 2020 11:12:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6A0F29D8F; Mon, 17 Aug 2020 13:12:34 +0200 (CEST)
Date: Mon, 17 Aug 2020 13:12:34 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [virtio-dev] Re: [PATCH v5 0/3] Support virtio cross-device
 resources
Message-ID: <20200817111234.i7pqtnnk2ciw4rqb@sirius.home.kraxel.org>
References: <20200609012518.198908-1-stevensd@chromium.org>
 <20200609055021-mutt-send-email-mst@kernel.org>
 <CAD=HUj7wJfoKj_K44Cs9eEmh=OQHZ1+qz7ZHxoscHjYgOMXvZQ@mail.gmail.com>
 <20200817105008.mi3ukh6kxgi37gjs@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200817105008.mi3ukh6kxgi37gjs@sirius.home.kraxel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: virtio-dev@lists.oasis-open.org, Thomas Zimmermann <tzimmermann@suse.de>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Jason Wang <jasowang@redhat.com>, open list <linux-kernel@vger.kernel.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 alex.williamson@redhat.com, ML dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 17, 2020 at 12:50:08PM +0200, Gerd Hoffmann wrote:
> On Tue, Jun 23, 2020 at 10:31:28AM +0900, David Stevens wrote:
> > Unless there are any remaining objections to these patches, what are
> > the next steps towards getting these merged? Sorry, I'm not familiar
> > with the workflow for contributing patches to Linux.
> 
> Sorry, just have been busy and not paying as much attention to drm
> patches as usual.  Playing catch-up now.  Queued for drm-misc-next,
> unless something goes wrong in my testing the patches should land
> in linux-next soon and be merged upstream in the next merge window.

Oh, spoke too soon.  scripts/checkpatch.pl has a bunch of codestyle
warnings.  Can you fix them and resend?

thanks,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
