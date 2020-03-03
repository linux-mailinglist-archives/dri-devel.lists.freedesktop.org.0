Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DED1770E4
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 09:13:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 930266E9D4;
	Tue,  3 Mar 2020 08:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D596E9D4
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 08:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583223184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pS2kujS6GdIL8pBalibfKZgXPCfASWGXYOeelvtWEBA=;
 b=Dh/TMLK/TPVeI7E9v4bBtZK8K58EGXktIggS4Aej0V2bwl0jo9p6hnc7QuOMG5g822XmfK
 LPSGdr3qonk7Gnb1eF5EUX8bMBr70y6PhtIwMWALuKWaxkxOdhbl7OEnprKUuyC44GRux4
 53Zu3DH4Me4TsdBpehW61YzieiPRAKM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-tSbED5ArOIO2yUkDzSnD2Q-1; Tue, 03 Mar 2020 03:13:00 -0500
X-MC-Unique: tSbED5ArOIO2yUkDzSnD2Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DF3A8017CC;
 Tue,  3 Mar 2020 08:12:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-150.ams2.redhat.com
 [10.36.116.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 901AF5C1D6;
 Tue,  3 Mar 2020 08:12:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7C7A617535; Tue,  3 Mar 2020 09:12:57 +0100 (CET)
Date: Tue, 3 Mar 2020 09:12:57 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [PATCH 2/2] [RFC] drm/virtgpu: modify uapi with
 stride/layer_stride fix
Message-ID: <20200303081257.hhmdskqa5joh627x@sirius.home.kraxel.org>
References: <20191002014935.33171-1-gurchetansingh@chromium.org>
 <20191002014935.33171-2-gurchetansingh@chromium.org>
 <20191002084942.jnm6brnuadwztonh@sirius.home.kraxel.org>
 <CAAfnVB=NBvsAsFX_iDuqfyS12jp=S=1kXDjvWr8-tFAaN5aEMQ@mail.gmail.com>
 <CAPaKu7TwKx+0QCyu4orDD1fmEhsNSUn_ab7-QhQNsOyg3bzApQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPaKu7TwKx+0QCyu4orDD1fmEhsNSUn_ab7-QhQNsOyg3bzApQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: David Airlie <airlied@linux.ie>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 28, 2020 at 01:01:49PM -0800, Chia-I Wu wrote:
> On Wed, Oct 2, 2019 at 5:18 PM Gurchetan Singh
> <gurchetansingh@chromium.org> wrote:
> >
> > On Wed, Oct 2, 2019 at 1:49 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > >
> > > On Tue, Oct 01, 2019 at 06:49:35PM -0700, Gurchetan Singh wrote:
> > > > This doesn't really break userspace, since it always passes down
> > > > 0 for stride/layer_stride currently. We could:
> > > >
> > > > (1) modify UAPI now and add a VIRTGPU_PARAM_STRIDE_FIX feature
> > >
> > > This I think.
> > > But IMO it's not a fix, it is an added feature ...
> > >
> > > Also missing the big picture here.  Why do we need this?
> >
> > Two reasons:
> I don't fully get the picture, but drm_virtgpu_resource_create has
> stride.  Can we send that down in transfers?

It's unused and suddenly caring about it has a good chance to break
stuff ...

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
