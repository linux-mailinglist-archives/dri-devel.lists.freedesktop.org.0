Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A443431DD36
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 17:22:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52D1089DC1;
	Wed, 17 Feb 2021 16:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D7C89B46
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Feb 2021 16:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613578920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zuOtIRKbYuj2Xd7iVcnrNwE+xcVixB8X3bMZPpVqG1k=;
 b=Cg8JMYC3PV8cBNK9Y1pnkCLO51CSwyMSZWlJiKElshxy9FjyMLs8fKLuXKn1KULb0EpQsW
 0bYdYS3osnKis0tnn6AI7MedsHgTwyVNJDOiQ6fRDYx0ggqUBheDiWBJQzm3dvSGxDC2Ot
 A5aM+0Xxny7ehQoJDSGejJAbg76Cy/o=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-3aJCElPFPZWNDVz_BkS1zg-1; Wed, 17 Feb 2021 11:21:58 -0500
X-MC-Unique: 3aJCElPFPZWNDVz_BkS1zg-1
Received: by mail-ed1-f71.google.com with SMTP id u2so9017649edj.20
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Feb 2021 08:21:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=zuOtIRKbYuj2Xd7iVcnrNwE+xcVixB8X3bMZPpVqG1k=;
 b=LFHMHgWrhc/WbazjpVKN3S8qxCPhxVSehZ1/XKV7LVVjh2G9RudZ3TmwI2EepMXSpU
 EiBBO0CapZ8bvR0j0qoKc5EVbzfd4D0n9chz4kSLEMJyA/29BcB/W+Pm99fYag7r406E
 5i3gPc1fMMsTJOpYkpxXxAYrTyIENkrUq/p9wxQc+L6QOG/MU6EBjgAiwJYE3TA3txib
 p9uBpKFSU+2UD2riWx0px8eNyAM+NRYXC5lC2oQnMq2DZjr+z0F2lU9yYa52O4Vgv31U
 esk7dQcnAL/9ofGZ96SLNiuo/1bxXVVLcPb1qib0H3hy7vYGQCmYdl4Hw/HrnogXTqB1
 BkOw==
X-Gm-Message-State: AOAM533dKrfw7A4Tcxtr+YxrAjy+/iAx6VDhGOtxsIfvIaOAGsdT2ROI
 puAg2X9Or4876Kf+Nwksa/f98lN6oAAdHn6JeUgwxHDCg2MZ7t+n6xAeeZY/8zhYl3tN++GhFBD
 l41nZ39HZT9B8zvlne8UwjhxgyjGu
X-Received: by 2002:a17:907:9d6:: with SMTP id
 bx22mr7133363ejc.331.1613578917354; 
 Wed, 17 Feb 2021 08:21:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQ1Ki1oJA1qfHwYHXxMOTvEPU2QJDOhm6xJnFyYpk+Q9lA7Rish8CnAdi9jZPvrrxRWt75yw==
X-Received: by 2002:a17:907:9d6:: with SMTP id
 bx22mr7133343ejc.331.1613578917141; 
 Wed, 17 Feb 2021 08:21:57 -0800 (PST)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id i10sm1203519ejy.64.2021.02.17.08.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 08:21:56 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Deepak Rawat <drawat.floss@gmail.com>, linux-hyperv@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 1/2] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
In-Reply-To: <20aead71c4aa3f640e19660875f807deae92f8d8.camel@gmail.com>
References: <20210216003959.802492-1-drawat.floss@gmail.com>
 <87k0r6kicg.fsf@vitty.brq.redhat.com>
 <20aead71c4aa3f640e19660875f807deae92f8d8.camel@gmail.com>
Date: Wed, 17 Feb 2021 17:21:55 +0100
Message-ID: <87h7mak6l8.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
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
Cc: Wei Hu <weh@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Dexuan Cui <decui@microsoft.com>, Michael Kelley <mikelley@microsoft.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Deepak Rawat <drawat.floss@gmail.com> writes:

> On Wed, 2021-02-17 at 13:07 +0100, Vitaly Kuznetsov wrote:
>> > +++ b/drivers/gpu/drm/hyperv/hyperv_drm.h
>> > @@ -0,0 +1,51 @@
>> > +/* SPDX-License-Identifier: GPL-2.0 */
>> > +/*
>> > + * Copyright 2012-2021 Microsoft
>> 
>> Out of pure curiosity, where does '2012' come from or what does it
>> mean?
>> 
>
> Thanks Vitaly for the review. Actually some of the code is derived from
> hyperv_fb, which has copyright 2012. Not sure if I should remove here
> or not?
>

I'm definitely not an expert (and couldn't quickly find a good
reference) here but I was under the impression that in such cases you
can just add a note like "based on 'hyperv_fb' driver" (if really
needed, if you just borrow a few things then it's even superfluous I
believe). Anyway, I was just a bit surprised to see '2012' in a new file
:-)

-- 
Vitaly

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
