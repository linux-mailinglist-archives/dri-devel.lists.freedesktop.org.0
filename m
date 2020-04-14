Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8051A85C0
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 18:53:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D776E4FE;
	Tue, 14 Apr 2020 16:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 874A96E4F9
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 16:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586883177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NH9riSJWIwA5MJGEKQ1bph+dSoJ7N2LR20v9on+n36c=;
 b=DEfA6DnDToVNektqackuxJE0Xrq80DG3HGf9ipu5rPxtHVlwa3XMWz7rd/aLpJ0EMrZSX+
 gTtxuXotWmbXGfyGU2H2mT0+sL6x+aOGLcEFq1Z+Ws5khk0kGddUe16zZdNdDMCqxU7B7W
 z2nkN7nUvd8p1Sg1si8hmFikUXl1B/8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-7hAXRb9LNwmDRWHDyFJDeA-1; Tue, 14 Apr 2020 12:52:54 -0400
X-MC-Unique: 7hAXRb9LNwmDRWHDyFJDeA-1
Received: by mail-qk1-f198.google.com with SMTP id k138so12266954qke.15
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 09:52:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=NH9riSJWIwA5MJGEKQ1bph+dSoJ7N2LR20v9on+n36c=;
 b=tL99xkTUlISRzwYhmq7hveJLgQBGZ5epboA63YaxMKoLNrAuRARp2oZW1/Y1YOyJ5G
 Nwf5obfq9UU3p8pw0LJFOAKI8l5388oNggZadqSopQ6WYDsPngZ0TPOv7rwlKt7wNrbO
 3jGLSiLI37I5WVGdfwBuwSANUp4t+0FCjnbAqdAmgHIRitXPWk06znJPwclUc1cUweMl
 Y/nKKLXaTITtml2EbJC66u4da3onJ5ve5hwtCMW/JFk/O9PI4YbpPeJIUvaJqhBNYk6y
 5omo3yV8T97WP/2AhVRQW8yHRyoPHn2wSsboePwY1YsN7lGrF7ifS1UVMe6gFWl9e5yr
 Jp6w==
X-Gm-Message-State: AGi0PuYpNuM93DHO3pPok/CQkSgWUkegDtiACI+WnxJeQqKRNQoYM0YB
 nMCznZzAkfcDrvJd1EywpvaAnEpJtfsCaWvMaHQRzlIJgV8nkB1Te3Zf/PK69OgCnZs8iJuF333
 TLxLlYp+suTE7rz1/KbEmfGKKfD5b
X-Received: by 2002:aed:33a4:: with SMTP id v33mr16397039qtd.289.1586883173351; 
 Tue, 14 Apr 2020 09:52:53 -0700 (PDT)
X-Google-Smtp-Source: APiQypLJ3Yw9j9pzYkEgXk1oqksYr1eCgriQZ9BixGsOQAVs0d1y/GYfsWqxFhJ8l+Ojwa6qT9mvYQ==
X-Received: by 2002:aed:33a4:: with SMTP id v33mr16397015qtd.289.1586883173059; 
 Tue, 14 Apr 2020 09:52:53 -0700 (PDT)
Received: from Ruby.lyude.net (static-173-76-190-23.bstnma.ftas.verizon.net.
 [173.76.190.23])
 by smtp.gmail.com with ESMTPSA id c27sm11511330qte.49.2020.04.14.09.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 09:52:52 -0700 (PDT)
Message-ID: <a2d9da054ace3f0ff59373c5a6252f25e1c3df4b.camel@redhat.com>
Subject: Re: [PATCH 1/9] drm/vblank: Add vblank works
From: Lyude Paul <lyude@redhat.com>
To: Tejun Heo <tj@kernel.org>
Date: Tue, 14 Apr 2020 12:52:51 -0400
In-Reply-To: <20200413204243.GL60335@mtj.duckdns.org>
References: <20200318004159.235623-1-lyude@redhat.com>
 <20200318004159.235623-2-lyude@redhat.com>
 <20200318134657.GV2363188@phenom.ffwll.local>
 <e4fb0c39ec024d60587e5e1e70b171b99eb537f4.camel@redhat.com>
 <faf63d8a9ed23c16af69762f59d0dca6b2bf085f.camel@redhat.com>
 <96cb912809f99d04cd5cdd46c77b66b8c1163380.camel@redhat.com>
 <20200413204243.GL60335@mtj.duckdns.org>
Organization: Red Hat
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31)
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2020-04-13 at 16:42 -0400, Tejun Heo wrote:
> Hello,
> 
> On Mon, Apr 13, 2020 at 04:18:57PM -0400, Lyude Paul wrote:
> > Hi Tejun! Sorry to bother you, but have you had a chance to look at any of
> > this yet? Would like to continue moving this forward
> 
> Sorry, wasn't following this thread. Have you looked at kthread_worker?
> 

Hi, thanks for the response! And yes-I think this would actually be perfect
for what we need, I guess one question I might as well ask since I've got you
here: would patches to expose an unlocked version of kthread_queue_worker() be
accepted? With something like that I should be able to just reuse the
delayed_work_list and spinlocks that come with kthread_worker which would make
the vblank works implementation a bit easier
>  
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/kthread.h#n71
> 
> And, thanks a lot for the vblank explanation. I really enjoyed readin it. :)
> 
-- 
Cheers,
	Lyude Paul (she/her)
	Associate Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
