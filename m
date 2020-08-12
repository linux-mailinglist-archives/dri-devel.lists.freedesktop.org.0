Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70420242C47
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 17:45:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5C66E90A;
	Wed, 12 Aug 2020 15:45:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B6896E90A
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 15:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597247102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4SS0jWX/8AdP73VJgwkCVotT/hkNBUzg6SOi5kPmUG4=;
 b=VNM/XquOdrLGY2inmgsuyOlX6D6svsWBRcGg+9wIxHr+F+HgMIy3mxJ4XnWvz7BueNjiff
 RNoPb1jq9K9A0B1AkmW4p6+tDdPV+3J+5T3R20+E9Ur5E49pYVcPL65S1XBrZrs7J7QmKQ
 F0tqZo6E1tIfXB2AUOTyFq5uK5KYam4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-rjs6VlAnNOuWDnhs4XYcbQ-1; Wed, 12 Aug 2020 11:44:59 -0400
X-MC-Unique: rjs6VlAnNOuWDnhs4XYcbQ-1
Received: by mail-qv1-f71.google.com with SMTP id x4so1706342qvu.18
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 08:44:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=4SS0jWX/8AdP73VJgwkCVotT/hkNBUzg6SOi5kPmUG4=;
 b=e49pTLm8MF6gZZDKKE0xopJVmRWHnuNcOuOf5lGG92vD3kyxgrCkOGiIdxd4Hg7Tj/
 LuU1INAmH1zHnEzFEMAnjuSNvSSTsDiaz7UJwgnAcmnysfT8x9w+TA0TECI/e6tRJPor
 mClO3f1OYKxX9CJKRMG7o5/gxNQf35VpSZikqaI/BSk+U00uNFFIXFfVYraP5FQiLp9V
 FfQWk9jyzEkVVR1r8K+T5NHcXMP3l5h3uZhiZmwHF/p5qDlWgjU9WjMM67ES8fBgJ9mt
 DfElkP/vuhNbImJekXsGeCwD4Giyv5KOtVUFJC6xCP+zPiwhs/0gTr+hKsnw22bAILOv
 UN9Q==
X-Gm-Message-State: AOAM5307UDDcZskgmdUu02hxkJoXNUkqb3SwRBRlPuCMGDhGB7y/y399
 qfuwRg87Bz4InM5v4X4XT0NvjPVpWhDtwi7eo7Y0vxF3a65m2fVteWbcgA+p8P3m3CmylEQC9or
 ZSy1jBnr/wWQ1xt4rYksXuYKfwWvj
X-Received: by 2002:aed:2ca5:: with SMTP id g34mr147708qtd.337.1597247098553; 
 Wed, 12 Aug 2020 08:44:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxihC1nazXhwK6q3KqmG+xQT8vcRSFSs9qlG1xH4pBMLdf/U1hCZwc0/JtKxjg0ahn7Xo10Ug==
X-Received: by 2002:aed:2ca5:: with SMTP id g34mr147682qtd.337.1597247098320; 
 Wed, 12 Aug 2020 08:44:58 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id s4sm2809991qtn.34.2020.08.12.08.44.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 08:44:57 -0700 (PDT)
Message-ID: <a1141faf8c6a0a924d87132fb4a297cd6d47e09d.camel@redhat.com>
Subject: Re: [PATCH] drm: assure aux_dev is nonzero before using it
From: Lyude Paul <lyude@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>, Zwane Mwaikambo <zwanem@gmail.com>
Date: Wed, 12 Aug 2020 11:44:56 -0400
In-Reply-To: <CAKMK7uHxikojLQNbsnnfDfGZ3tFP9CRUTzvr+DsZghzQupaBGg@mail.gmail.com>
References: <alpine.DEB.2.21.2008101004110.27032@montezuma.home>
 <20200811085830.GZ2352366@phenom.ffwll.local>
 <alpine.DEB.2.21.2008111514210.35094@montezuma.home>
 <CAKMK7uHxikojLQNbsnnfDfGZ3tFP9CRUTzvr+DsZghzQupaBGg@mail.gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.36.4 (3.36.4-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: dkwon@redhat.com, Linux Kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, tcamuso@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2020-08-12 at 16:10 +0200, Daniel Vetter wrote:
> On Wed, Aug 12, 2020 at 12:16 AM Zwane Mwaikambo <zwanem@gmail.com> wrote:
> > On Tue, 11 Aug 2020, Daniel Vetter wrote:
> > 
> > > On Mon, Aug 10, 2020 at 10:11:50AM -0700, Zwane Mwaikambo wrote:
> > > > Hi Folks,
> > > >     I know this thread eventually dropped off due to not identifying
> > > > the underlying issue. It's still occuring on 5.8 and in my case it
> > > > happened because the udev device nodes for the DP aux devices were not
> > > > cleaned up whereas the kernel had no association with them. I can
> > > > reproduce the bug just by creating a device node for a non-existent
> > > > minor
> > > > device and calling open().
> > > 
> > > Hm I don't have that thread anymore, but generally these bugs are solved
> > > by not registering the device before it's ready for use. We do have
> > > drm_connector->late_register for that stuff. Just a guess since I'm not
> > > seeing full details here.
> > 
> > In this particular case, the physical device disappeared before the nodes
> > were cleaned up. It involves putting a computer to sleep with a monitor
> > plugged in and then waking it up with the monitor unplugged.
> 
> We also have early_unregister for the reverse, but yes this sounds
> more tricky ... Adding Lyude who's been working on way too much
> lifetime fun around dp recently.
> -Daniel
> 
Hi-I think just checking whether the auxdev is NULL or not is a reasonable
fix, although I am curious as to how exactly the aux dev's parent is getting
destroyed before it's child, which I would have thought would be the only way
you could hit this?

> > 
> > > > To me it still makes sense to just check aux_dev because the chardev
> > > > has
> > > > no way to check before calling.
> > > > 
> > > > (gdb) list *drm_dp_aux_dev_get_by_minor+0x29
> > > > 0x17b39 is in drm_dp_aux_dev_get_by_minor
> > > > (drivers/gpu/drm/drm_dp_aux_dev.c:65).
> > > > 60      static struct drm_dp_aux_dev
> > > > *drm_dp_aux_dev_get_by_minor(unsigned index)
> > > > 61      {
> > > > 62              struct drm_dp_aux_dev *aux_dev = NULL;
> > > > 63
> > > > 64              mutex_lock(&aux_idr_mutex);
> > > > 65              aux_dev = idr_find(&aux_idr, index);
> > > > 66              if (!kref_get_unless_zero(&aux_dev->refcount))
> > > > 67                      aux_dev = NULL;
> > > > 68              mutex_unlock(&aux_idr_mutex);
> > > > 69
> > > > (gdb) p/x &((struct drm_dp_aux_dev *)(0x0))->refcount
> > > > $8 = 0x18
> > > > 
> > > > static int auxdev_open(struct inode *inode, struct file *file)
> > > > {
> > > >     unsigned int minor = iminor(inode);
> > > >     struct drm_dp_aux_dev *aux_dev;
> > > > 
> > > >     aux_dev = drm_dp_aux_dev_get_by_minor(minor);
> > > >     if (!aux_dev)
> > > >         return -ENODEV;
> > > > 
> > > >     file->private_data = aux_dev;
> > > >     return 0;
> > > > }
> > > > 
> > > > 
> > > > _______________________________________________
> > > > dri-devel mailing list
> > > > dri-devel@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
> 
-- 
Cheers,
	Lyude Paul (she/her)
	Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
