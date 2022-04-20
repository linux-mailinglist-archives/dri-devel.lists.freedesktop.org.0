Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BEA508EAA
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 19:40:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C0010ED80;
	Wed, 20 Apr 2022 17:40:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A896510F1A0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 17:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650476443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N6Zu8efagxCg0qjIbj3LGsUm4V9r8EQ58X79KLBO8as=;
 b=Jh0vJuYeLXNjNvBoHmeQdiO+226CJo7QymEj1RC80qqGe6tNDcxW1wfNjbl+gSdqW+WLPX
 gj1OlJYwcuozE0iDUBOuVvYptzLt5s/2DMXe6rQrogXlbBz/qet5EeBvp5OiJLZkVC+Kw4
 Hn0gBmzTlcUw0UEnyg3rrHMzuMtkyp4=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-OidHv_iPN-eZVFeoxAlnOQ-1; Wed, 20 Apr 2022 13:40:42 -0400
X-MC-Unique: OidHv_iPN-eZVFeoxAlnOQ-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-e5bae51cefso1103761fac.2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 10:40:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=N6Zu8efagxCg0qjIbj3LGsUm4V9r8EQ58X79KLBO8as=;
 b=z4MEjm2u1PdHbtyuw7AAgAHojot7lzZG0wLdyL4+i9xXnkLbySVOlcBAvHMZ6pw1Hz
 0TEzRNFEORbKdsHyofoOQErtzx7GfCgOsgys+9u01iovXl65uvVYDccHShgGVo1EkOCM
 lGY7dOTFD3QkXHSskQXTCho7DSN0qzEswmzZDLWooJz3HXKYH7tS0Ea9wHTjHIgy+TXZ
 rbLpltuAunu/DT75VmFzaInO7OtRhSa+9ODqizkq0odoaYHJWamudViEf2RpRS7l1pIG
 0OA+c5GCFFJPiXI/qiSXAhOd4bWVcA+O6LTyMDseGs99mNd8pSDPXhojoPtmJWOj1khi
 JcvA==
X-Gm-Message-State: AOAM533bHkegDK0u54TdXKkRk2o1t404ZDEZ5iLc9DkDl2SStEFtKDF6
 f8t9d1K7iLDWaDHxqkX5TraAkj1vgpYQBMV8JXlybQjyKalKmR5bfNJw6MhNtMTgjATLMXJzDCE
 WSdI41WJPdAlUm5DyiW7e3FFhSZ8o
X-Received: by 2002:a4a:b3c5:0:b0:324:527f:8709 with SMTP id
 q5-20020a4ab3c5000000b00324527f8709mr7558543ooo.90.1650476441820; 
 Wed, 20 Apr 2022 10:40:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQODyrfz4O2ySVJfB4AMKPDpvPokiiH++tjPxvtaenmiy7ATr53rd1FOYaFbMSL0CEN6bEdQ==
X-Received: by 2002:a4a:b3c5:0:b0:324:527f:8709 with SMTP id
 q5-20020a4ab3c5000000b00324527f8709mr7558526ooo.90.1650476441569; 
 Wed, 20 Apr 2022 10:40:41 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 c8-20020a4ad788000000b0031ce69b1640sm6870564oou.10.2022.04.20.10.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 10:40:41 -0700 (PDT)
Date: Wed, 20 Apr 2022 11:40:33 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PULL v2] gvt-next
Message-ID: <20220420114033.7f8b57c7.alex.williamson@redhat.com>
In-Reply-To: <20220420164351.GC2120790@nvidia.com>
References: <5a8b9f48-2c32-8177-1c18-e3bd7bfde558@intel.com>
 <20220420164351.GC2120790@nvidia.com>
Organization: Red Hat
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 20 Apr 2022 13:43:51 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Wed, Apr 20, 2022 at 04:34:47PM +0000, Wang, Zhi A wrote:
> > Hi folks:
> > 
> > Here is the PR of gvt-next. Thanks so much for the patience.
> > 
> > Mostly it includes the patch bundle of GVT-g re-factor patches for adapting the GVT-g with the
> > new MDEV interfaces:
> > 
> > - Separating the MMIO table from GVT-g. (Zhi)
> > - GVT-g re-factor. (Christoph)
> > - GVT-g mdev API cleanup. (Jason)
> > - GVT-g trace/makefile cleanup. (Jani)
> > 
> > Thanks so much for making this happen.
> > 
> > This PR has been tested as following and no problem shows up:
> > 
> > $dim update-branches
> > $dim apply-pull drm-intel-next < this_email.eml
> > 
> > The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> > 
> >   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
> > 
> > are available in the Git repository at:
> > 
> >   https://github.com/intel/gvt-linux tags/gvt-next-2022-04-20-for-christoph
> > 
> > for you to fetch changes up to ae7875879b7c838bffb42ed6db4658e5c504032e:
> > 
> >   vfio/mdev: Remove mdev drvdata (2022-04-20 03:15:58 -0400)  
> 
> This looks well constructed now! thanks
> 
> Alex you can pull this for VFIO after Jani&co grab it
> 
> I'll respin my vfio_group series on top of this branch

Sure, so just to confirm tags/gvt-next-2022-04-20-for-christoph is
pruned down to exactly the commits we're looking for now?  Thanks,

Alex

