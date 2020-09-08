Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7F9260F3E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 12:04:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 436646E1BA;
	Tue,  8 Sep 2020 10:04:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ABAB6E1BA
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 10:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599559445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=huJspaVKs2soWVBG7ypNpD3pCie9PJMElLgmWSCDlpg=;
 b=a21ge73a+K2tyqzseUotrHh9nSmODO5C1KDJ+VeD6kG6tHom+G4cqUymsgLxk2+9jPvGkD
 czuFQziGjuFz0zhOIqCsSYF0fhYApXsHSCMOQNh1QGBK+P7VoIouCp9as2iSdouiWmVo13
 mUoY7fKTdOkI3tJdB0grKFBdsS/h5Ls=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-1GwrGC8JO-KOM_F9MMjh6g-1; Tue, 08 Sep 2020 06:04:03 -0400
X-MC-Unique: 1GwrGC8JO-KOM_F9MMjh6g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B5A8801AE0;
 Tue,  8 Sep 2020 10:04:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 32E505C1BB;
 Tue,  8 Sep 2020 10:04:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 41EEF1FCF5; Tue,  8 Sep 2020 12:04:01 +0200 (CEST)
Date: Tue, 8 Sep 2020 12:04:01 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/virtio: drop quirks handling
Message-ID: <20200908100401.q7quz5m7m42wvobj@sirius.home.kraxel.org>
References: <20200908064741.1010-1-kraxel@redhat.com>
 <20200908085721.GJ2352366@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200908085721.GJ2352366@phenom.ffwll.local>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 08, 2020 at 10:57:21AM +0200, Daniel Vetter wrote:
> On Tue, Sep 08, 2020 at 08:47:41AM +0200, Gerd Hoffmann wrote:
> > These days dma ops can be overridden per device, and the virtio core
> 
> "can be overridden" or "are"?

Didn't happen yet, so scratch this one for now ...

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
