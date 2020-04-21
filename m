Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A22DC1B381A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 08:55:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF876E9A8;
	Wed, 22 Apr 2020 06:54:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D66F6E1A2;
 Tue, 21 Apr 2020 15:54:43 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id v2so5380323plp.9;
 Tue, 21 Apr 2020 08:54:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WA9A83mNO4Jsc2bWW6Z8o2K5ouW7sqEUFm9fDXDQEic=;
 b=oNdcpG3zHXNT16mHwlNiQdoK8fASfEg0hMJCE2RAQSnZrCkV71MLAt02NjL0mZgu2a
 Ynzyi1uW1C2UUGMAnivTWVhZyr1FrWfbR+oMDPTDuxdVjptB/XnbQ/uZDkKu+yuyfgJ+
 tj3kYjkep3gaqNEiIXaNq4GjgNqfVIsrxgUm8AdINJ3LL7GuW4SrY1fdZr0Rx/DDHJox
 inSA1zoHqbw+VwYHN48V4muczE0sLofk9dm8Wr1szc1mJE9MhRnxB2bGyif8zQv/kvFZ
 AI/JHUzJQfg6sP0VAINbUteI5t8FTw+5JPCV57B7sGQ4wliTkOxBFP4xsU35inhro8pO
 EjVw==
X-Gm-Message-State: AGi0Puagp/zD7yAx4iERPcH6BQDpoHeylMy27+8cJRFHpKmrq6pxCk3r
 FdGjV8mLYIqtfRWnQF7ItYY=
X-Google-Smtp-Source: APiQypIaMU86jrFKZ3g4JB1E5/X3QoymTNnWg2UjNrJeZc8T2p7/jLVqRto/TPPKBMt8E8Ug9uLBJA==
X-Received: by 2002:a17:90a:4e81:: with SMTP id
 o1mr6125309pjh.161.1587484483049; 
 Tue, 21 Apr 2020 08:54:43 -0700 (PDT)
Received: from sultan-box.localdomain ([104.200.129.62])
 by smtp.gmail.com with ESMTPSA id x185sm2770600pfx.155.2020.04.21.08.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 08:54:42 -0700 (PDT)
Date: Tue, 21 Apr 2020 08:54:40 -0700
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v4] drm/i915: Synchronize active and retire callbacks
Message-ID: <20200421155440.GA2289@sultan-box.localdomain>
References: <20200404024156.GA10382@sultan-box.localdomain>
 <20200407064007.7599-1-sultan@kerneltoast.com>
 <20200414061312.GA90768@sultan-box.localdomain>
 <158685263618.16269.9317893477736764675@build.alporthouse.com>
 <20200414144309.GB2082@sultan-box.localdomain>
 <20200420052419.GA40250@sultan-box.localdomain>
 <158737090265.8380.6644489879531344891@jlahtine-desk.ger.corp.intel.com>
 <20200420161514.GB1963@sultan-box.localdomain>
 <158745189706.5265.10618964185012452715@saswiest-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158745189706.5265.10618964185012452715@saswiest-mobl.ger.corp.intel.com>
X-Mailman-Approved-At: Wed, 22 Apr 2020 06:54:41 +0000
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
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, stable@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld <matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 21, 2020 at 09:51:37AM +0300, Joonas Lahtinen wrote:
> Quoting Sultan Alsawaf (2020-04-20 19:15:14)
> > On Mon, Apr 20, 2020 at 11:21:42AM +0300, Joonas Lahtinen wrote:
> > > So it seems that the patch got pulled into v5.6 and has been backported
> > > to v5.5 but not v5.4.
> > 
> > You're right, that's my mistake.
> 
> Did applying the patch to v5.4 fix the issue at hand?

Of course the patch doesn't apply as-is because the code's been shuffled around,
but yes. The crashes are gone with that patch, and I don't have the motivation
to check if that patch is actually correct, so hurray, problem solved. I'm not
going to send the backport myself because I'll probably be ignored, so you can
go ahead and do that.

Sultan
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
