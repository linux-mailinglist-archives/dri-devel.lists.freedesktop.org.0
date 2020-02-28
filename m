Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D63173595
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 11:47:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F5A36EF37;
	Fri, 28 Feb 2020 10:47:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B166F3EA
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 10:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582886819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B59A79M83EwSQHOZpqp/GkLsWWIw6R7Tgo1iAbDywp0=;
 b=S04X9B9Lc+vWr9ndmISIpBQGelnF03/EDFP3JMKJTZ92XL+21klGTw5vtEdvtDiGvu5e2H
 iYrVLHcQgFhuzwRe9zRZ3Z9Tpa9U9cXuv5tdD1GbLzf4/9Njex+1lph32hZjJUegQsJAtL
 ++3ZpGh2W9IoG6mOVtKNMfwITBzs1Do=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-q7F9n6CoPqOI_cy6lJ4W4Q-1; Fri, 28 Feb 2020 05:46:55 -0500
X-MC-Unique: q7F9n6CoPqOI_cy6lJ4W4Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77382800D5E;
 Fri, 28 Feb 2020 10:46:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-150.ams2.redhat.com
 [10.36.116.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3A5610027BA;
 Fri, 28 Feb 2020 10:46:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 325A917447; Fri, 28 Feb 2020 11:46:52 +0100 (CET)
Date: Fri, 28 Feb 2020 11:46:52 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m_=28VMware=29?= <thomas_os@shipmail.org>
Subject: Re: [PATCH v5 1/3] drm/shmem: add support for per object caching
 flags.
Message-ID: <20200228104652.ev5mn3uyrca2xen6@sirius.home.kraxel.org>
References: <20200226154752.24328-2-kraxel@redhat.com>
 <f1afba4b-9c06-48a3-42c7-046695947e91@shipmail.org>
 <20200227075321.ki74hfjpnsqv2yx2@sirius.home.kraxel.org>
 <41ca197c-136a-75d8-b269-801db44d4cba@shipmail.org>
 <20200227105643.h4klc3ybhpwv2l3x@sirius.home.kraxel.org>
 <68a05ace-40bc-76d6-5464-2c96328874b9@shipmail.org>
 <20200227132137.irruicvlkxpdo3so@sirius.home.kraxel.org>
 <78eb099e-020f-91d1-672e-15176bf12cd4@shipmail.org>
 <20200228094903.g7yf73mtnbjyu4ez@sirius.home.kraxel.org>
 <99eea905-db5c-4e07-7b93-6de3482e02f7@shipmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <99eea905-db5c-4e07-7b93-6de3482e02f7@shipmail.org>
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
Cc: Guillaume.Gardet@arm.com, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 gurchetansingh@chromium.org, yuq825@gmail.com, tzimmermann@suse.de
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 28, 2020 at 10:54:54AM +0100, Thomas Hellstr=F6m (VMware) wrote:
> On 2/28/20 10:49 AM, Gerd Hoffmann wrote:
> >    Hi,
> > =

> > > > Not clue about the others (lima, tiny, panfrost, v3d).  Maybe they =
use
> > > > write-combine just because this is what they got by default from
> > > > drm_gem_mmap_obj().  Maybe they actually need that.  Trying to Cc:
> > > > maintainters (and drop stable@).
> > > > virtio-gpu needs it, otherwise the host can't show the virtual disp=
lay.
> > > > cirrus bounces everything via blits to vram, so it should be ok wit=
hout
> > > > decrypted.  I guess that implies we should make decrypted configura=
ble.
> > > Decrypted here is clearly incorrect and violates the SEV spec, regard=
less of
> > > a config option.
> > > =

> > > The only correct way is currently to use dma_alloc_coherent() and
> > > mmap_coherent() to allocate decrypted memory and then use the
> > > pgprot_decrypted flag.
> > Hmm, virtio-gpu uses the dma api to allow the host access the gem
> > object.  So I think I have to correct the statement above, if I
> > understands things correctly the dma api will use (properly allocated)
> > decrypted bounce buffers and the virtio-gpu shmem objects don't need
> > pgprot_decrypted mappings.
> =

> Yes, that sounds more correct. I wonder whether the "pgprot_decrypted()"
> perhaps remains from mapping VRAM gem buffers...

Commit 95cf9264d5f3 ("x86, drm, fbdev: Do not specify encrypted memory
for video mappings") added it, then it was kept through various changes.

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
