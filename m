Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C42F31865D3
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 08:44:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4106D6E0DB;
	Mon, 16 Mar 2020 07:44:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301FA6E0DB
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 07:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584344652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9+Ca7nx06WVVrHXuOF/wYuoPrpxcujp2mFndSp4vTV8=;
 b=TlM0MvRFnPR+jxu8fA4THxIXkzSy6JvsGIE+l0uQjueRzUAOce3jjWt8XpwADDvGE1D9Ff
 KZuAV0jnn8q+2TevKM9dnJ0zAAy3Dow0wcvy+RHYY8uYLkhDa16Y60r4LegCtFoKpr+F0X
 WSJCHC9fc1A25Dklxud1Lz70p9sLJwY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-ci0cghDfMBCDG84UXl9etQ-1; Mon, 16 Mar 2020 03:44:08 -0400
X-MC-Unique: ci0cghDfMBCDG84UXl9etQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3250718C43C4;
 Mon, 16 Mar 2020 07:44:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-117.ams2.redhat.com
 [10.36.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F17B4907F9;
 Mon, 16 Mar 2020 07:44:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9055C9D12; Mon, 16 Mar 2020 08:44:04 +0100 (CET)
Date: Mon, 16 Mar 2020 08:44:04 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [RFC PATCH 0/8] *** Per context fencing ***
Message-ID: <20200316074404.z4xbta6qyrm74oxo@sirius.home.kraxel.org>
References: <20200310010818.569-1-gurchetansingh@chromium.org>
 <20200310074302.yx6anlvqvsg37yzs@sirius.home.kraxel.org>
 <CAAfnVB=sw=u80mHnZUPf_+WDW-hGNTDSBWLfV+7y3KFN=s6beQ@mail.gmail.com>
 <20200311103609.ei446gelkvbqrdzm@sirius.home.kraxel.org>
 <CAAfnVBm1eoGZY7yB8eqEC1eLk=v4dq--O2biQOnWDHCkmguOeA@mail.gmail.com>
 <20200312092940.xioyjloil3f25ccv@sirius.home.kraxel.org>
 <CAAfnVBkTWy2pohv5kWWYwAa1yq14fRJrtN4GD7sF-h4inabH6Q@mail.gmail.com>
 <CAPaKu7SgkdBaFcDU1O7T+mMyzqO5iR8qYJxFJmcYGp_Hfe3S0g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPaKu7SgkdBaFcDU1O7T+mMyzqO5iR8qYJxFJmcYGp_Hfe3S0g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: Chad Versace <chadversary@chromium.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 David Stevens <stevensd@chromium.org>, John Bates <jbates@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> >> At virtio level it is pretty simple:  The host completes the SUBMIT_3D
> >> virtio command when it finished rendering, period.
> >>
> >>
> >> On the guest side we don't need the fence_id.  The completion callback
> >> gets passed the virtio_gpu_vbuffer, so it can figure which command did
> >> actually complete without looking at virtio_gpu_ctrl_hdr->fence_id.
> >>
> >> On the host side we depend on the fence_id right now, but only because
> >> that is the way the virgl_renderer_callbacks->write_fence interface is
> >> designed.  We have to change that anyway for per-context (or whatever)
> >> fences, so it should not be a problem to drop the fence_id dependency
> >> too and just pass around an opaque pointer instead.
> 
> I am still catching up, but IIUC, indeed I don't think the host needs
> to depend on fence_id.  We should be able to repurpose fence_id.

I'd rather ignore it altogether for FENCE_V2 (or whatever we call the
feature flag).

> On the other hand, the VIRTIO_GPU_FLAG_FENCE flag is interesting, and
> it indicates that the vbuf is on the host GPU timeline instead of the
> host CPU timeline.

Yep, we have to keep that (unless we do command completion on GPU
timeline unconditionally with FENCE_V2).

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
