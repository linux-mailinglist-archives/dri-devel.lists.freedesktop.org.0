Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D9B262F7D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 16:07:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA02F6E30C;
	Wed,  9 Sep 2020 14:07:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 163406E30C
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 14:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599660432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AyBwbPv8eeKvlLBjOakfjoLGMVOfW6zd9C67uN/maIo=;
 b=fhWsR+p//XfTzQ5VsdU/0+5yACOdj3o+PYVRrDmD+P5zjXNt8p9tVn1XBDsqMizVkpxCeK
 8Lr5k2tASEtd7rIl2ZC7RYupxujZPwbvZPssqGmQbLYey1JjgaQRTBb94NeceHFlQkRRms
 A01dxw84RMpSyNJqkc0/mCZ3waMAUoA=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-tke4mD0jPHmCskQmTA6YLg-1; Wed, 09 Sep 2020 10:07:10 -0400
X-MC-Unique: tke4mD0jPHmCskQmTA6YLg-1
Received: by mail-qv1-f71.google.com with SMTP id f21so1420554qve.9
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Sep 2020 07:07:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AyBwbPv8eeKvlLBjOakfjoLGMVOfW6zd9C67uN/maIo=;
 b=p81hA9hhq7/XPm41f6OSE69VQLfoCpFnZZEnAyGkAelF15/SuBKIeoThKkRPfA80vM
 LdQw690heeTVeyQ/f32Kwf8q9AT358JeaXo7nwG/hQFsjL5zEoFPLpB8HpNaLMC/8gL4
 6413NS9FgLMu2WGWlq3vwsmNElfWV2luRNTNfUxirVQtCB9ZgYlhnHHJB6DWiSjSKBcz
 rOZgyHlZESMltY8cqqafTuqqaFayp7LCUkf31YVmN8dBSPctWruQaSJagpkw6oEJroTK
 e8F9Pl0IfGFl9zK4v7s41KautsEzGIkdC+wtU+eDw5MIn9+V0JNLYd5swbkrFQ3tPxh7
 oLLg==
X-Gm-Message-State: AOAM531Cq41LusyU9BxUNIg3cuR/FAH7V7k8mhlEi67OAV3rJxcs0q9o
 67qyH8n5t5MyYFywu3LYBJfHdasMQ5IeanbF9vWwo0JsN2cW1T4cKaukgIt9qZoD9KqGKbaT5BY
 0JxZXmYjw8ijdFZk9Wf0eA6akHELe
X-Received: by 2002:ad4:45a6:: with SMTP id y6mr4343658qvu.8.1599660429909;
 Wed, 09 Sep 2020 07:07:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyR62IGHKCUdInJpA3KR7u+Fm1jkeugqEcJXQiLZYHdCq9aP3hWO+P2sN+mj2H1K846ayPcXg==
X-Received: by 2002:ad4:45a6:: with SMTP id y6mr4343635qvu.8.1599660429620;
 Wed, 09 Sep 2020 07:07:09 -0700 (PDT)
Received: from dev.jcline.org ([136.56.20.95])
 by smtp.gmail.com with ESMTPSA id d76sm2649240qkc.81.2020.09.09.07.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 07:07:08 -0700 (PDT)
Date: Wed, 9 Sep 2020 10:07:06 -0400
From: Jeremy Cline <jcline@redhat.com>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: Add fine-grain temperature
 reporting
Message-ID: <20200909140706.GA27322@dev.jcline.org>
References: <20200812204952.1921587-1-jcline@redhat.com>
 <CACAvsv71oxCYB1+LCAUHD5v_NGAP-DpxPY_dPz53iw2=91KAJg@mail.gmail.com>
 <CACO55tvv6REmNzZZyyRSJyRT5z-xEf38+tk9cDnft63DX5JQUw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACO55tvv6REmNzZZyyRSJyRT5z-xEf38+tk9cDnft63DX5JQUw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jcline@redhat.com
X-Mimecast-Spam-Score: 0.001
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
Cc: Ben Skeggs <skeggsb@gmail.com>, David Airlie <airlied@linux.ie>,
 ML nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 09, 2020 at 10:22:14AM +0200, Karol Herbst wrote:
> On Wed, Sep 9, 2020 at 6:06 AM Ben Skeggs <skeggsb@gmail.com> wrote:
> >
> > On Thu, 13 Aug 2020 at 06:50, Jeremy Cline <jcline@redhat.com> wrote:
> > >
> > > Commit d32656373857 ("drm/nouveau/therm/gp100: initial implementation of
> > > new gp1xx temperature sensor") added support for reading finer-grain
> > > temperatures, but continued to report temperatures in 1 degree Celsius
> > > increments via nvkm_therm_temp_get().
> > >
> > > Rather than altering nvkm_therm_temp_get() to report finer-grain
> > > temperatures, which would be inconvenient for other users of the
> > > function, a second interface has been added to line up with hwmon's
> > > native unit of temperature.
> > Hey Jeremy,
> >
> > Sorry this slipped past me until now.  I'm OK with adding support for
> > millidegree temperature reporting, but don't think we need to keep
> > both interfaces around and would rather see the existing code
> > converted to return millidegrees (even on GPUs that don't support it)
> > instead of degrees.
> >
> > Thanks!
> > Ben.
> >
> 
> just a note as I was trying something like that in the past: we have a
> lot of code which fetches the temperature and there are a lot of
> places where we would then do a divide by 1000, so having a wrapper
> function at least makes sense. If we want to keep the func pointers?
> well.. I guess the increased CPU overhead wouldn't be as bad if all
> sub classes do this static * 1000 as well either. I just think we
> should have both interfaces in subdev/therm.h so we can just keep most
> of the current code as is.
> 

Indeed. My initial plan was to change the meaning of temp_get() and
adjust all the users, but there's around a dozen of them and based on my
understanding of the users none of them cared much about such accuracy.

However, I do find having one way to do things appealing, so if there's
a strong preference for it, I'm happy to produce a somewhat more
invasive patch where all users expect millidegrees.

- Jeremy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
