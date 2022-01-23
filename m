Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6A34975FE
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jan 2022 23:30:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B3E10E4DB;
	Sun, 23 Jan 2022 22:30:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC1E10E4DB
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jan 2022 22:30:34 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 q9-20020a7bce89000000b00349e697f2fbso33016296wmj.0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jan 2022 14:30:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qMH3aROspB/kgllwn4/SStZwIDe9KDuajbHnkcsYmUQ=;
 b=P3tsvkj0i+sVi11M7txVIwl1u4fctLQ0kWT7oikCoWgScLDt2hqGwxxLT+490WfDwx
 eqKilKnK8rBNDg+CzEDJLzrVbQVtRtY+GWa7YPGDUuAM8ky7uvlU7zW4pdPNZ1Sghefy
 /yahHLLDEsLeOtdwhrncSfrOFuasjUu41E/QpKsR3w508tfKGw9a+6hufigzzR//wX+k
 4YgPChv6Fyl74Y6gEz1lEe8wdr5hgLW98zN1lGg75UQTwJc98LZPIjMZ7lDPtotfskUc
 +ve5Fln1O5H+JO0PZ3YaXI7ZMtQMONomV+B3egL6h62GlS4dp1xi0uQuJIHhJrYhtWj1
 ejJg==
X-Gm-Message-State: AOAM532mrQHTWenItBbprxgqaPcHtZhQ8G5UzbNroihgF630zoCVmGo6
 CZrf5gMHVqipnHk/+28eG0s=
X-Google-Smtp-Source: ABdhPJw9NDCc2PhiY0fqwi7UBdUEmkYOshWw6VstDZdEF0SSKkrBdnOtRGFJx0y/nPspBxYjZZpipw==
X-Received: by 2002:a1c:7402:: with SMTP id p2mr9217508wmc.53.1642977032623;
 Sun, 23 Jan 2022 14:30:32 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id y14sm6165356wrd.91.2022.01.23.14.30.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 14:30:32 -0800 (PST)
Date: Sun, 23 Jan 2022 22:30:30 +0000
From: Wei Liu <wei.liu@kernel.org>
To: "Michael Kelley (LINUX)" <mikelley@microsoft.com>
Subject: Re: [PATCH 1/1] video: hyperv_fb: Fix validation of screen resolution
Message-ID: <20220123223030.ijdzrunduww76jiq@liuwe-devbox-debian-v2>
References: <1642360711-2335-1-git-send-email-mikelley@microsoft.com>
 <MN2PR21MB1295CE3BD15D4EB257A158DCCA569@MN2PR21MB1295.namprd21.prod.outlook.com>
 <20220123215606.fzycryooluavtar4@liuwe-devbox-debian-v2>
 <MWHPR21MB1593ED650DA82BC3009F66CED75D9@MWHPR21MB1593.namprd21.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MWHPR21MB1593ED650DA82BC3009F66CED75D9@MWHPR21MB1593.namprd21.prod.outlook.com>
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
Cc: Wei Liu <wei.liu@kernel.org>, Wei Hu <weh@microsoft.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 Haiyang Zhang <haiyangz@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "drawat.floss@gmail.com" <drawat.floss@gmail.com>, hhei <hhei@redhat.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, KY Srinivasan <kys@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 23, 2022 at 10:27:56PM +0000, Michael Kelley (LINUX) wrote:
> From: Wei Liu <wei.liu@kernel.org> Sent: Sunday, January 23, 2022 1:56 PM
> > 
> > On Sun, Jan 16, 2022 at 09:53:06PM +0000, Haiyang Zhang wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Michael Kelley (LINUX) <mikelley@microsoft.com>
> > > > Sent: Sunday, January 16, 2022 2:19 PM
> > > > To: KY Srinivasan <kys@microsoft.com>; Haiyang Zhang
> > <haiyangz@microsoft.com>; Stephen
> > > > Hemminger <sthemmin@microsoft.com>; wei.liu@kernel.org; Wei Hu
> > <weh@microsoft.com>; Dexuan
> > > > Cui <decui@microsoft.com>; drawat.floss@gmail.com; hhei <hhei@redhat.com>;
> > linux-
> > > > kernel@vger.kernel.org; linux-hyperv@vger.kernel.org; linux-
> > fbdev@vger.kernel.org; dri-
> > > > devel@lists.freedesktop.org
> > > > Cc: Michael Kelley (LINUX) <mikelley@microsoft.com>
> > > > Subject: [PATCH 1/1] video: hyperv_fb: Fix validation of screen resolution
> > > >
> > > > In the WIN10 version of the Synthetic Video protocol with Hyper-V,
> > > > Hyper-V reports a list of supported resolutions as part of the protocol
> > > > negotiation. The driver calculates the maximum width and height from
> > > > the list of resolutions, and uses those maximums to validate any screen
> > > > resolution specified in the video= option on the kernel boot line.
> > > >
> > > > This method of validation is incorrect. For example, the list of
> > > > supported resolutions could contain 1600x1200 and 1920x1080, both of
> > > > which fit in an 8 Mbyte frame buffer.  But calculating the max width
> > > > and height yields 1920 and 1200, and 1920x1200 resolution does not fit
> > > > in an 8 Mbyte frame buffer.  Unfortunately, this resolution is accepted,
> > > > causing a kernel fault when the driver accesses memory outside the
> > > > frame buffer.
> > > >
> > > > Instead, validate the specified screen resolution by calculating
> > > > its size, and comparing against the frame buffer size.  Delete the
> > > > code for calculating the max width and height from the list of
> > > > resolutions, since these max values have no use.  Also add the
> > > > frame buffer size to the info message to aid in understanding why
> > > > a resolution might be rejected.
> > > >
> > > > Fixes: 67e7cdb4829d ("video: hyperv: hyperv_fb: Obtain screen resolution from Hyper-V
> > > > host")
> > > > Signed-off-by: Michael Kelley <mikelley@microsoft.com>
> > [...]
> > >
> > > Reviewed-by: Haiyang Zhang <haiyangz@microsoft.com>
> > >
> > 
> > Applied to hyperv-fixes. Thanks.
> 
> This fix got pulled into the fbdev/for-next tree by a new maintainer, Helge Deller.
> See https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git/commit/?h=for-next&id=bcc48f8d980b12e66a3d59dfa1041667db971d86

OK. I will drop it from hyperv-fixes. Thanks for letting me know!

> 
> Michael
