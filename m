Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4603E656B6E
	for <lists+dri-devel@lfdr.de>; Tue, 27 Dec 2022 14:47:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D2410E03A;
	Tue, 27 Dec 2022 13:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF0010E03A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 13:46:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A39A161146;
 Tue, 27 Dec 2022 13:46:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3148C433D2;
 Tue, 27 Dec 2022 13:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1672148780;
 bh=ZJ/ZjbGyU7VityPykEjZ8EwTiNZtNPUtoHiQvrCZAcA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UcDuSPNVh61pUWJk61BTgf3fxRIDYtBoAm3Tzbbu+ua81A1cH3txkE6ElUFgDWjoy
 9Gwbq/PZ9Igl4ezg/Xn5ybCvb8sC3fADPCeglLv+4BUbVtOfviJh9JNwl2B6/pk5hv
 L9WTo9sb85UjtR4JmoPs6UrFgxvu0oY/LkZiYC9Q=
Date: Tue, 27 Dec 2022 14:46:11 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH 1/2] habanalabs/uapi: move uapi file to drm
Message-ID: <Y6r3I5M6IQdSb5LE@kroah.com>
References: <20221226213227.26953-1-ogabbay@kernel.org>
 <Y6qeDQY+X6ZRn3bi@kroah.com>
 <CAFCwf11GO4n-nOhyLDAG9k9MSJ1xfjj6_1nH=X9vKgdbvY62yw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFCwf11GO4n-nOhyLDAG9k9MSJ1xfjj6_1nH=X9vKgdbvY62yw@mail.gmail.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 27, 2022 at 02:04:14PM +0200, Oded Gabbay wrote:
> On Tue, Dec 27, 2022 at 9:26 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Mon, Dec 26, 2022 at 11:32:26PM +0200, Oded Gabbay wrote:
> > > Move the habanalabs.h uapi file from include/uapi/misc to
> > > include/uapi/drm, and rename it to habanalabs_accel.h.
> > >
> > > This is required before moving the actual driver to the accel
> > > subsystem.
> >
> > What requires this?  Isn't this going to break userspace code?
> Yes, most definitely it will break userspace code. Moreover, the
> patches I'll send in 1-2 weeks to change the device char files will
> also break it.
> Having said that, I'm not worried because I don't believe anyone is
> working with the upstream version because there is no NIC support
> (yet).

Ok, if you are sure that no one will complain about broken builds,
that's fine to move, but be aware that if they do complain, you'll have
to back these changes out.

thanks,

greg k-h
