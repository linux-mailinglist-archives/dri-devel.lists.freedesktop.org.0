Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0871315FAAC
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2020 00:33:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 825C56E88E;
	Fri, 14 Feb 2020 23:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28B76E88E
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 23:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581723201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gYgJ6y+yDMGEFggLNrMdmHbrmUq+or1djnNs8xR5Ll4=;
 b=KE/53wIWyXnsjgupgznQ340GcOQU61VCwF7lg7QMmHXzSw+SUYVlsaCiGf6GZdM4GNeZLJ
 zi244QoR+1a87gpnhT0lanaaUVg831qNpFUP4V4DZHPXMSchh3TbGpEJ2KjfxhNAn39DLz
 qS7wXaMx5KyJ9PPWsLPgx9/aYr3p/ME=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-eCQRUDN8OuqhCjt-lGLJtQ-1; Fri, 14 Feb 2020 18:33:19 -0500
Received: by mail-qv1-f70.google.com with SMTP id d7so6732376qvq.12
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 15:33:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=gYgJ6y+yDMGEFggLNrMdmHbrmUq+or1djnNs8xR5Ll4=;
 b=FZZe9Em7I7DKCrtYJP7wHmXX4nuPPp7xog8DxGWjxOjiHUZsZmhO+xSAR3PMXkz4HB
 ea1u0DqlafV5lz18/Vo9fcRmIN8dpnfO7ynXZfR3rVtTv9OdOhUunLzyZzfRjgu7W+Zu
 FJrhMibIMIa/s2E3Rl/nqFYDf//rTwdf4AP4U7QThBC/i2YNqF/Jmn+kllv++hlbJJqg
 SbUZ36fYrlMsBnUOEkIay/MO+uwyAazv+Q195Fz+4JzPX3vud6fknvEveLsGtxP/9K+j
 QduRgNw/B1Qv7s79QYZMFoR/o7SuhSnkZuT9wlirjwYdHoq0bO92ZyYYIyfEdSJEgFhB
 eBSQ==
X-Gm-Message-State: APjAAAUVpBGFLKWEbe2c0j5DMIkaQSOIrX7mmtOoaTg8jCWvjV7JmWej
 3BaFB9nu9UNkzp8Eer/B+eMFyEVuNQCbVB1RE6F3i5H2KT2wfIKb787fHS4gmF/y006k2QVIoc6
 1FFFtJnnNnShM+eRWCv+u4tYfqbN0
X-Received: by 2002:a37:a58a:: with SMTP id o132mr4755590qke.481.1581723199377; 
 Fri, 14 Feb 2020 15:33:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqzm0eXgSwuc3vb77TM+YM7Madh1v38ousgqEKqSKO5tEZ309bCFVz6JSfzZWyQHoBlgGc0qpg==
X-Received: by 2002:a37:a58a:: with SMTP id o132mr4755579qke.481.1581723199151; 
 Fri, 14 Feb 2020 15:33:19 -0800 (PST)
Received: from dhcp-10-20-1-196.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id p18sm4235702qkp.47.2020.02.14.15.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 15:33:18 -0800 (PST)
Message-ID: <b8dbe33bc62d9cd678b5af8cde2570f6c5754aeb.camel@redhat.com>
Subject: Re: [PATCH 0/3] drm/mst: Add support for simultaneous down replies
From: Lyude Paul <lyude@redhat.com>
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org
Date: Fri, 14 Feb 2020 18:33:17 -0500
In-Reply-To: <20200213211523.156998-1-sean@poorly.run>
References: <20200213211523.156998-1-sean@poorly.run>
Organization: Red Hat
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31)
MIME-Version: 1.0
X-MC-Unique: eCQRUDN8OuqhCjt-lGLJtQ-1
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
Cc: Sean Paul <seanpaul@chromium.org>, Wayne.Lin@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2020-02-13 at 16:15 -0500, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Hey all,
> Earlier this week on my 5.5 kernel (I can't seem to get a 5.6 kernel to
> behave on any of my devices), I ran into the multi-reply problem that
> Wayne fixed in January. Without realizing there was already a fix
> upstream, I went about solving it in different way. It wasn't until
> rebasing the patches on 5.6 for the list that I realized there was
> already a solution.
> 
> At any rate, I think this way of handling things might be a bit more
> performant. I'm not super happy with the cleanliness of the code, I
> think this series should make things easier to read, but I don't think I
> achieved that. So suggestions are welcome on how to break this apart.

Honestly it looks a bit cleaner to me. Sideband message parsing in MST is
pretty complex, so I'd think the code's probably always going to be messy to
some extent.

My only suggestion with cleaning things up - maybe we should stop calling it
building a sideband reply, and call it re-assembling one? Seems a little less
confusing, since we're really just taking the rx chunks and reassembling them
into a full sideband message. I know at least I constantly find myself
forgetting those functions are for rx and not tx.

So, I will give my r-b for the whole series, but...

Reviewed-by: Lyude Paul <lyude@redhat.com>

...I think we should definitely look more into what Wayne's talking about
before pushing this, and see if it's widespread enough of an issue to be a
concern. It does kind of suck how slow MST probing can be, so I'd wonder if we
could try your idea of rate limiting. My one concern there is I'm not actually
sure if there's anything in the DP MST protocol that indicates how many
messages a hub can handle at the same time - it's always supposed to just be
two iirc.

> Thanks,
> 
> Sean
> 
> Sean Paul (3):
>   drm/mst: Separate sideband packet header parsing from message building
>   drm/mst: Support simultaneous down replies
>   drm/dp_mst: Remove single tx msg restriction.
> 
>  drivers/gpu/drm/drm_dp_mst_topology.c | 196 ++++++++++++++------------
>  include/drm/drm_dp_mst_helper.h       |  65 ++++-----
>  2 files changed, 137 insertions(+), 124 deletions(-)
> 
-- 
Cheers,
	Lyude Paul (she/her)
	Associate Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
