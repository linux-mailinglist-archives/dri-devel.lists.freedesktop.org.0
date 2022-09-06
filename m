Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 751E75AF527
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 21:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F78710E236;
	Tue,  6 Sep 2022 19:59:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E169210E236
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 19:59:25 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id k17so7449511wmr.2
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 12:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date; bh=VrcGAAHAFPBkHhppiEmlpx+VdwyrqvH6/RbOsQratUo=;
 b=M5h3saQs6F1UBXdjXnvlynP0tALp22uVJtMAUE8iSwB+bkrHqEOrpeStA2fQe0HZLG
 YdZDuD8LI9dc62w8cGcwf2yNtMGV2kRoFK6GdKfUXRceSGpRnCR0rRV3DTzNfjVFjuJU
 dg17JdrVDQJfVv8mYhJu6NQhnD6rI1ItsBHd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=VrcGAAHAFPBkHhppiEmlpx+VdwyrqvH6/RbOsQratUo=;
 b=Koi0L4KmUg2voCH0OcN+dc4TiFIIJvjcfQXgAs8pwNrQ5MMKSapKNglklwAaN5dcQ3
 aVkRbvo+kSk1Bd9d16yWY8iNdCYwgAToUqFT0kfsPeSZkgsAOSqXQW+L/k3Ey6VGMO+t
 RwFkAiv114yxEdK0d+esHRQjT6MO9pc8VQG2oZ4o+Hrytw8y71Mw0lAlR5pCSTzb+XwH
 wI7Lq32Kj6uonCoiC2ziVqhXpGQN15sxr+fC+fLSWtJ8LzLQsIHA7SMrKpssCfcWDrE1
 /Mw1Uy1fQTdFb1NvP6yBvxfi9Ms68xRPehSEN+0x67NMN0PWkk8y9W4Ld9nx5OIg1IxN
 7EIQ==
X-Gm-Message-State: ACgBeo3ZRG0BAO+Ws/PFyphU1LcSVkG2X+Os+ZPb7DmrerDgZofr4gEU
 rWLQqWQeyTRXf+VM6I2lGFhDrQ==
X-Google-Smtp-Source: AA6agR70xNvhnTUF/14KkJLm8rVw//b90FT680b1H6RZc3w8FRaOhwakoWInvlm1LH/O+Z8Yz4H0qw==
X-Received: by 2002:a05:600c:34c2:b0:3a5:d2f5:9d02 with SMTP id
 d2-20020a05600c34c200b003a5d2f59d02mr37123wmq.153.1662494364404; 
 Tue, 06 Sep 2022 12:59:24 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 l9-20020adfe9c9000000b00228d94931dcsm4199922wrn.116.2022.09.06.12.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 12:59:23 -0700 (PDT)
Date: Tue, 6 Sep 2022 21:59:21 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sumit Garg <sumit.garg@linaro.org>
Subject: Re: [PATCH v2 0/1] tee: Add tee_shm_register_fd
Message-ID: <YxemmVxh5F0fXEPJ@phenom.ffwll.local>
Mail-Followup-To: Sumit Garg <sumit.garg@linaro.org>,
 Olivier Masse <olivier.masse@nxp.com>, clement.faure@nxp.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jens.wiklander@linaro.org, linaro-mm-sig@lists.linaro.org,
 op-tee@lists.trustedfirmware.org, etienne.carriere@linaro.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 linux-media@vger.kernel.org
References: <20220812143055.12938-1-olivier.masse@nxp.com>
 <CAFA6WYM89+SrW2Br-fnFke4djt4GgGHXn7JS3=rxvAa7dAAY7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFA6WYM89+SrW2Br-fnFke4djt4GgGHXn7JS3=rxvAa7dAAY7w@mail.gmail.com>
X-Operating-System: Linux phenom 5.18.0-4-amd64 
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
Cc: clement.faure@nxp.com, christian.koenig@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org,
 op-tee@lists.trustedfirmware.org, Olivier Masse <olivier.masse@nxp.com>,
 etienne.carriere@linaro.org, jens.wiklander@linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 19, 2022 at 01:54:31PM +0530, Sumit Garg wrote:
> Hi Olivier,
> 
> On Fri, 12 Aug 2022 at 20:01, Olivier Masse <olivier.masse@nxp.com> wrote:
> >
> > Add a new ioctl called TEE_IOC_SHM_REGISTER_FD to register a
> > shared memory from a dmabuf file descriptor.
> > This new ioctl will allow the Linux Kernel to register a buffer
> > to be used by the Secure Data Path OPTEE OS feature.
> >
> > Please find more information here:
> > https://static.linaro.org/connect/san19/presentations/san19-107.pdf
> >
> > Patch tested on Hikey 6220.
> >
> 
> AFAIU, for the OP-TEE SDP feature to work you need to have a DMA-BUF
> heap driver for allocating secure buffers through exposed chardev:
> "/dev/dma_heap/sdp". Have you tested it with some out-of-tree driver
> as I can't find it upstream? Also, do you plan to push that upstream
> as well?
> 
> BTW, please add a changelog while sending newer patch-set versions.

Also after the huge discussion last year dma-buf are agreed to be under
the "you need an open source userspace for any new uapi using them" rule
that all gpu drivers are under.

Does this exist here?
-Daniel

> 
> -Sumit
> 
> > Etienne Carriere (1):
> >   tee: new ioctl to a register tee_shm from a dmabuf file descriptor
> >
> >  drivers/tee/tee_core.c   | 38 +++++++++++++++
> >  drivers/tee/tee_shm.c    | 99 +++++++++++++++++++++++++++++++++++++++-
> >  include/linux/tee_drv.h  | 11 +++++
> >  include/uapi/linux/tee.h | 29 ++++++++++++
> >  4 files changed, 175 insertions(+), 2 deletions(-)
> >
> > --
> > 2.25.0
> >

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
