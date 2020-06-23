Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0626204BA3
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 09:49:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F6996E963;
	Tue, 23 Jun 2020 07:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 428196E935
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 00:02:34 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id d27so14128639qtg.4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 17:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fL1wENgZCNwSv3s/JTNbtGHYfJcNOvZphPgobRgCX+0=;
 b=jOiz5xhY4H9RrA31ewUoMb6lWoSEJluMNJ4pFLIyuL2C/PAw2cU4NhHZPSbOtneWmY
 ozUMm9lxePnw9yOjxx4YXvXCK3kITgyY6VI+mhuSl9fkmcyIppyhy/Jz6vVv/4LKzuRn
 Gb8qhMwxyR4RKm7f3IBCU6P9IiqbHgwNX0yoHpJ3PAkHDvus22DcgqWtCXRMKvuPd80+
 GtMIE29iM9uSkrK/mkJM41mZz+r3jtg9ekirUsyx5erxi/e/W0HuUH+SRS8iBijVSbYY
 gVUrM+bjvjO7k15tkl2NlzpoPMdsvYPWVTdqh0sfLGGUDdoylYfcONvUD2B6N+OO84GZ
 lj3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fL1wENgZCNwSv3s/JTNbtGHYfJcNOvZphPgobRgCX+0=;
 b=FqXClXQvicuenPFk6ahme3Ctc/nY5yy7OZDTEJI0ym7+G+yvQAuz5nHy7J6GuyK/1j
 dpRxwZi0bDoFBxmJc/fmDnj+PNP4oUXfWq7ZYjNHivmmhvWTT5fsO5QSJBww6C8fd0yf
 CvHjW4fLEba6ke33DcT4x5M/Q09HZMa91KuCIBPXM+4obxZjQdM6RYyp5WH1iGm7Uetg
 q+sbMc0D6NsBHBiOxm4zZWeOG+dfhGZa0Amv1OA3VprSZ6nvEleFlroGTUYkEN2R969h
 fEcW3ecQpMIyBR5bPe0HRXO1CXOsHhEKRllL7BbVHfUODs6zX/1gURXl7QVs0YmqkuvH
 qJ6w==
X-Gm-Message-State: AOAM5320ffTxyCYn3+qPRXovm7meIPs5gI+GXb6qi1LymXHGNBttZBWd
 WoxW+VIVqw+WMSBmjbDh1mGwCg==
X-Google-Smtp-Source: ABdhPJyCyWWM03fNzzwWcrkorPAde8ZwkJyT1NwEy7u+QyW/bvUE+EE8dkCWV5n1HdRyI+PQxXYPRQ==
X-Received: by 2002:ac8:70da:: with SMTP id g26mr17916678qtp.333.1592870553204; 
 Mon, 22 Jun 2020 17:02:33 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
 by smtp.gmail.com with ESMTPSA id d186sm6145604qkb.110.2020.06.22.17.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 17:02:32 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.93) (envelope-from <jgg@ziepe.ca>)
 id 1jnWOV-00CHMM-GL; Mon, 22 Jun 2020 21:02:31 -0300
Date: Mon, 22 Jun 2020 21:02:31 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>
Subject: Re: [Linaro-mm-sig] [PATCH 04/18] dma-fence: prime lockdep annotations
Message-ID: <20200623000231.GW6578@ziepe.ca>
References: <20200619151551.GP6578@ziepe.ca>
 <CAKMK7uEvkshAM6KUYZu8_OCpF4+1Y_SM7cQ9nJWpagfke8s8LA@mail.gmail.com>
 <20200619172308.GQ6578@ziepe.ca>
 <20200619180935.GA10009@redhat.com>
 <20200619181849.GR6578@ziepe.ca>
 <56008d64-772d-5757-6136-f20591ef71d2@amd.com>
 <20200619195538.GT6578@ziepe.ca>
 <20200619203147.GC13117@redhat.com>
 <20200622114617.GU6578@ziepe.ca> <20200622201540.GB9708@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200622201540.GB9708@redhat.com>
X-Mailman-Approved-At: Tue, 23 Jun 2020 07:48:47 +0000
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
Cc: linux-rdma <linux-rdma@vger.kernel.org>,
 Felix Kuehling <felix.kuehling@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Thomas =?utf-8?B?SGVsbHN0csO2bSAoSW50ZWwp?= <thomas_os@shipmail.org>,
 Mika Kuoppala <mika.kuoppala@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 22, 2020 at 04:15:40PM -0400, Jerome Glisse wrote:
> On Mon, Jun 22, 2020 at 08:46:17AM -0300, Jason Gunthorpe wrote:
> > On Fri, Jun 19, 2020 at 04:31:47PM -0400, Jerome Glisse wrote:
> > > Not doable as page refcount can change for things unrelated to GUP, with
> > > John changes we can identify GUP and we could potentialy copy GUPed page
> > > instead of COW but this can potentialy slow down fork() and i am not sure
> > > how acceptable this would be. Also this does not solve GUP against page
> > > that are already in fork tree ie page P0 is in process A which forks,
> > > we now have page P0 in process A and B. Now we have process A which forks
> > > again and we have page P0 in A, B, and C. Here B and C are two branches
> > > with root in A. B and/or C can keep forking and grow the fork tree.
> > 
> > For a long time now RDMA has broken COW pages when creating user DMA
> > regions.
> > 
> > The problem has been that fork re-COW's regions that had their COW
> > broken.
> > 
> > So, if you break the COW upon mapping and prevent fork (and others)
> > from copying DMA pinned then you'd cover the cases.
> 
> I am not sure we want to prevent COW for pinned GUP pages, this would
> change current semantic and potentialy break/slow down existing apps.

Isn't that basically exactly what 17839856fd588 does? It looks like it
uses the same approach RDMA does by sticking FOLL_WRITE even though it
is a read action.

After that change the reamining bug is that fork can re-establish a
COW./

> Anyway i think we focus too much on fork/COW, it is just an unfixable
> broken corner cases, mmu notifier allows you to avoid it. Forcing real
> copy on fork would likely be seen as regression by most people.

If you don't copy the there are data corruption bugs though. Real apps
probably don't hit a problem here as they are not forking while GUP's
are active (RDMA excluded, which does do this)

I think that implementing page pinning by blocking mmu notifiers for
the duration of the pin is a particularly good idea either, that
actually seems a lot worse than just having the pin in the first
place.

Particularly if it is only being done to avoid corner case bugs that
already afflict other GUP cases :(

> > What do you mean 'GUP fast is still succeptible to this' ?
> 
> Not all GUP fast path are updated (intentionaly) __get_user_pages_fast()

Sure, that is is the 'raw' accessor

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
