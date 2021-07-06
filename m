Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C24DC3BD5A8
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 14:23:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8434989DAB;
	Tue,  6 Jul 2021 12:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F4B89DF7
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 12:23:46 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id f17so1258653wrt.6
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jul 2021 05:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=uNyqHLQRNkYk8ghNPCyy058MytEY7ye/Hosx5rgh6L0=;
 b=I861MRXnVEJLWhlPliO+jitKdknn/PB69GvRAM/Y4b8ranu/45I6eMeXTNi9dKuJ0j
 WYk89i6CPtBnGLN6nluhfnivHJjMYYzeqUVC8YHPJKGLDAkmLUXMmITr5S5TPlVgR6z+
 pWlut4ORszisRKb8vPQRzvBskW4VntzJL5DP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=uNyqHLQRNkYk8ghNPCyy058MytEY7ye/Hosx5rgh6L0=;
 b=riCixkYLmKVm3JMq6ZpWILq5LiBCnSvV01g9eRAdQ0rw7U0YXMuxobR94fYSIPOqb8
 1PSblQgnNDpDEPTLwtZyiThs/tWPpcFRZKtDFfhjjVp5L0s0esM2jZDbaq65MDVEdQgJ
 GECtfuHssCkCu2vF9oIGh7TY3NUwM7yd3oIhXjmQMzAW2EPZGN3GmxoXEd/G5EKpYOCO
 71bXSP0DygGJ9j40c1xwhqwJdrhNtFgw7/ZW4RfTrWBzHhqBPtzcT0z/V91Fgi+hJSGO
 JBOZiUbc/XK09r0zNCr89AmAxHsHEA8O4ZCQRbeF4tduqFS9ijyLzOTgiVDqC2y2VE5n
 sQig==
X-Gm-Message-State: AOAM533TvXN9of04wZSVyuBKsVIodz2mMaGZITEQBhPd4jR3ShlTxeKu
 4u79XQmwaoeDd9hqFzo73lFNPg==
X-Google-Smtp-Source: ABdhPJxolizhwmybAQ3VsffOuvUoyS5FTxRrVw3O2VuBLsJFS1lJdSAYSr7mbyMR8j36zn3HCunCMA==
X-Received: by 2002:adf:a41e:: with SMTP id d30mr3249053wra.10.1625574225475; 
 Tue, 06 Jul 2021 05:23:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 31sm18348673wrs.79.2021.07.06.05.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 05:23:44 -0700 (PDT)
Date: Tue, 6 Jul 2021 14:23:42 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [Linaro-mm-sig] [PATCH v4 0/2] Add p2p via dmabuf to habanalabs
Message-ID: <YORLTmyoXDtoM9Ta@phenom.ffwll.local>
Mail-Followup-To: Christoph Hellwig <hch@lst.de>,
 Oded Gabbay <ogabbay@kernel.org>, linux-kernel@vger.kernel.org,
 gregkh@linuxfoundation.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, galpress@amazon.com, sleybo@amazon.com,
 dri-devel@lists.freedesktop.org, jgg@ziepe.ca,
 linux-rdma@vger.kernel.org, linux-media@vger.kernel.org,
 dledford@redhat.com, airlied@gmail.com, alexander.deucher@amd.com,
 leonro@nvidia.com, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20210705130314.11519-1-ogabbay@kernel.org>
 <YOQXBWpo3whVjOyh@phenom.ffwll.local>
 <20210706122110.GA18273@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210706122110.GA18273@lst.de>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: sleybo@amazon.com, linux-rdma@vger.kernel.org, gregkh@linuxfoundation.org,
 Oded Gabbay <ogabbay@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, galpress@amazon.com,
 linaro-mm-sig@lists.linaro.org, jgg@ziepe.ca, dledford@redhat.com,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, leonro@nvidia.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 06, 2021 at 02:21:10PM +0200, Christoph Hellwig wrote:
> On Tue, Jul 06, 2021 at 10:40:37AM +0200, Daniel Vetter wrote:
> > > Greg, I hope this will be good enough for you to merge this code.
> > 
> > So we're officially going to use dri-devel for technical details review
> > and then Greg for merging so we don't have to deal with other merge
> > criteria dri-devel folks have?
> > 
> > I don't expect anything less by now, but it does make the original claim
> > that drivers/misc will not step all over accelerators folks a complete
> > farce under the totally-not-a-gpu banner.
> > 
> > This essentially means that for any other accelerator stack that doesn't
> > fit the dri-devel merge criteria, even if it's acting like a gpu and uses
> > other gpu driver stuff, you can just send it to Greg and it's good to go.
> > 
> > There's quite a lot of these floating around actually (and many do have
> > semi-open runtimes, like habanalabs have now too, just not open enough to
> > be actually useful). It's going to be absolutely lovely having to explain
> > to these companies in background chats why habanalabs gets away with their
> > stack and they don't.
> 
> FYI, I fully agree with Daniel here.  Habanlabs needs to open up their
> runtime if they want to push any additional feature in the kernel.
> The current situation is not sustainable.

Before anyone replies: The runtime is open, the compiler is still closed.
This has become the new default for accel driver submissions, I think
mostly because all the interesting bits for non-3d accelerators are in the
accel ISA, and no longer in the runtime. So vendors are fairly happy to
throw in the runtime as a freebie.

It's still incomplete, and it's still useless if you want to actually hack
on the driver stack.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
