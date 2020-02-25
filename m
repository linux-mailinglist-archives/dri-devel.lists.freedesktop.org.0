Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D6E16BEC0
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 11:29:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C05166EA83;
	Tue, 25 Feb 2020 10:29:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6FD26EA83
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 10:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582626573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+gE27hs44kh37C0Y1ZucV/RwxeAzFchED4c+ib97SZ8=;
 b=AHzLB2xhfi17Bd9tD7A1NAt3TtvBSQD4C02vQ6DgVA3qQuwko/g2v1cDZ25t2CVWwbLrhi
 giociAvERjt7MRWpHNSRCYlldBe9fe64M1jIcDlY/gPV9+16IlYCOHgU/+D0Rh/tPJee6t
 bEYKev97gkELKN62f6lprLdVU55X2Po=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-Fl1VIA_fPE2YuiVqAaPCwA-1; Tue, 25 Feb 2020 05:29:31 -0500
X-MC-Unique: Fl1VIA_fPE2YuiVqAaPCwA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A610C800D55;
 Tue, 25 Feb 2020 10:29:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-87.ams2.redhat.com
 [10.36.116.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D6178C069;
 Tue, 25 Feb 2020 10:29:29 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D249E17449; Tue, 25 Feb 2020 11:29:28 +0100 (CET)
Date: Tue, 25 Feb 2020 11:29:28 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Lepton Wu <ytht.net@gmail.com>
Subject: Re: RFC: drm/virtio: Dummy virtio GPU
Message-ID: <20200225102928.vnaamhecu5tnoaq2@sirius.home.kraxel.org>
References: <20200224230155.120894-1-ytht.net@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200224230155.120894-1-ytht.net@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 24, 2020 at 03:01:54PM -0800, Lepton Wu wrote:
> Hi,
> 
> I'd like to get comments on this before I polish it. This is a 
> simple way to get something similar with vkms but it heavily reuse
> the code provided by virtio-gpu. Please feel free to give me any
> feedbacks or comments.

No.

First, what is wrong with vkms?

Second, if you really want something simple with the minimal set of drm
features possible you can write a rather small but still self-contained
driver when using all the drm helpers (shmem, simple display pipe) we
have these days.  Copy cirrus, strip it down: drop modesetting code,
drop blit-from-shmem-to-vram code, drop pci probing.  Maybe add module
options for max/default video mode.  Done.

What is the use case btw?

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
