Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D82C546848
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 16:30:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37912112FF0;
	Fri, 10 Jun 2022 14:30:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26214112FAE
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 14:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654871440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g/ATkA29NC2oD/Jp54XfWVa6EbDzgeGcRbqECMdYNQQ=;
 b=jJawV6V17jN+4Baj+0GOF0VlCJiumcDu95kndkYiX/rrkws39ublNHXrES7oj+wQrNZWwc
 7QYYBf7sFL+Zmws62SAUte1YtebfyVhEevZJVsJRhnFgvyGoTz7MNILK6b1KvbeaVqUXTz
 ozZTKUQitij0aaysMrva7JH3Mq9IE3Q=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-602-vWdzE9o4Mtu3u-Hm6h3Bdg-1; Fri, 10 Jun 2022 10:30:38 -0400
X-MC-Unique: vWdzE9o4Mtu3u-Hm6h3Bdg-1
Received: by mail-io1-f69.google.com with SMTP id
 r17-20020a0566022b9100b00654b99e71dbso13365573iov.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 07:30:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=g/ATkA29NC2oD/Jp54XfWVa6EbDzgeGcRbqECMdYNQQ=;
 b=ihF27E0NoRq3+4OYZ1jjKKCX6WT7iGwxWEwMfwV3vNHPkyddLntXsP/+XN+AujEDIX
 OAvYmXoo5DVpf6Pwj/aFd1woLXDdMuTUX8RgpONr4Epqb8t/rh8s7WoBOCxkwRs3iYzC
 AoyXHJ5Kc2J3vj5kxGfAT7KhcG1ZUrwoQ9UwekKSIQRgjKq1VQYPSuVoYI+Dv0octK9Y
 3Rt/ARr62lWj7AGi9TXLjxjnspJ7o9Hay2kEG4zrU12DDZlYTFCkY+VHChxzIxhI77mO
 GV2+KqJmsblCvTTukj7HPQiF8VR3ALo4Ufh1kkuYh9cnemdr4GEoZiKIRCXcDAx+XhFy
 IbNg==
X-Gm-Message-State: AOAM533NZ3FffhFlTh/8cyQsLGOgwyfvaee6NLRv03V4quePQJaKbpS1
 1gnM84kEbBr/bSnaC93w9DFBVLfnyoQnLQPVGwitI8xI1J1FRR8TEjf8RCdavvn/unHSdnxPady
 gyxgaaUTetR0qfck3bkO2X5o0XFdj
X-Received: by 2002:a02:9f14:0:b0:331:9195:dd3e with SMTP id
 z20-20020a029f14000000b003319195dd3emr16642780jal.0.1654871438187; 
 Fri, 10 Jun 2022 07:30:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuksuRngDSTwfthGPHYoV3J/PiHhBjlEWnHC4GjZIaz8XTqKR8K8VGTwh5fbuBCpB4djwCgg==
X-Received: by 2002:a02:9f14:0:b0:331:9195:dd3e with SMTP id
 z20-20020a029f14000000b003319195dd3emr16642758jal.0.1654871437955; 
 Fri, 10 Jun 2022 07:30:37 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 w15-20020a056e0213ef00b002d65eedd403sm4127189ilj.71.2022.06.10.07.30.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 07:30:37 -0700 (PDT)
Date: Fri, 10 Jun 2022 08:30:33 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/2] vfio/pci: Remove console drivers
Message-ID: <20220610083033.3f98beae.alex.williamson@redhat.com>
In-Reply-To: <b13d6d73-6290-92b6-d2b3-62af6efef3dc@suse.de>
References: <165453797543.3592816.6381793341352595461.stgit@omen>
 <165453800875.3592816.12944011921352366695.stgit@omen>
 <0c45183c-cdb8-4578-e346-bc4855be038f@suse.de>
 <20220608080432.45282f0b.alex.williamson@redhat.com>
 <01c74525-38b7-1e00-51ba-7cd793439f03@suse.de>
 <20220609154102.5cb1d3ca.alex.williamson@redhat.com>
 <20220609154416.676b1068.alex.williamson@redhat.com>
 <b13d6d73-6290-92b6-d2b3-62af6efef3dc@suse.de>
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
Cc: kvm@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 10 Jun 2022 09:03:15 +0200
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Hi
> 
> Am 09.06.22 um 23:44 schrieb Alex Williamson:
> > On Thu, 9 Jun 2022 15:41:02 -0600
> > Alex Williamson <alex.williamson@redhat.com> wrote:
> >   
> >> On Thu, 9 Jun 2022 11:13:22 +0200
> >> Thomas Zimmermann <tzimmermann@suse.de> wrote:  
> >>>
> >>> Please have a look at the attached patch. It moves the aperture helpers
> >>> to a location common to the various possible users (DRM, fbdev, vfio).
> >>> The DRM interfaces remain untouched for now.  The patch should provide
> >>> what you need in vfio and also serve our future use cases for graphics
> >>> drivers. If possible, please create your patch on top of it.  
> >>
> >> Looks good to me, this of course makes the vfio change quite trivial.
> >> One change I'd request:
> >>
> >> diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfig
> >> index 40c50fa2dd70..7f3c44e1538b 100644
> >> --- a/drivers/video/console/Kconfig
> >> +++ b/drivers/video/console/Kconfig
> >> @@ -10,6 +10,7 @@ config VGA_CONSOLE
> >>   	depends on !4xx && !PPC_8xx && !SPARC && !M68K && !PARISC &&  !SUPERH && \
> >>   		(!ARM || ARCH_FOOTBRIDGE || ARCH_INTEGRATOR || ARCH_NETWINDER) && \
> >>   		!ARM64 && !ARC && !MICROBLAZE && !OPENRISC && !S390 && !UML
> >> +	select APERTURE_HELPERS if (DRM || FB || VFIO_PCI)
> >>   	default y
> >>   	help
> >>   	  Saying Y here will allow you to use Linux in text mode through a
> >>
> >> This should be VFIO_PCI_CORE.  Thanks,  
> 
> I attached an updated patch to this email.
> 
> > 
> > Also, whatever tree this lands in, I'd appreciate a topic branch being
> > made available so I can more easily get the vfio change in on the same
> > release.  Thanks,  
> 
> You can add my patch to your series and merge it through vfio. You'd 
> only have to cc dri-devel for the patch's review. I guess it's more 
> important for vfio than DRM. We have no hurry on the DRM side, but v5.20 
> would be nice.

Ok, I didn't realize you were offering the patch for me to post and
merge.  I'll do that.  Thanks!

Alex

