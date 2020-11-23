Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DED2C1F96
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 09:09:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9278B6E270;
	Tue, 24 Nov 2020 08:09:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30FFA6E071
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 18:05:07 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id 7so14048326qtp.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 10:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Jr0GsxZsKmH5CvHfsmjJ1pm9nJzHVLL7xeqa5rwPMcU=;
 b=MCVyAoIMs2fBUjA1kgLBb3fyJSMltRxLstPY1Npd2TGqUi3BmylKKlhQx9yXCLYejk
 IbcBiOPK/Oau3CTnHox4Ij3jdGCU5ioO6226OvsHokjbyPho91R74bsGG7smwLcursHM
 P0mHZ4IGiO8+XEgi9Y+VaJ9oE1OoZk8HxO8J2s6oF5zHaNCtXABikghIgrRdaoEBSa/X
 9LpAXRyU/z+LEgstZe2LtWBpv0YBFLG8IPFj6VvHukVhVum558NW8pa5/uy9J+Tb4hA9
 6idV4qVXj9hRjy/m7aPX9rIqv56lV1NgMRZaihncfjTkadejxcPJ5POv15e4zhiEcI5a
 SntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Jr0GsxZsKmH5CvHfsmjJ1pm9nJzHVLL7xeqa5rwPMcU=;
 b=Msb8F1/mATU0kBjQL9sv3oS57qoqcAnudWiPofLQIILOL8GXrIHMSK42ew9cGP//cl
 wQJhkvsU4+dvDGPPQqhdWd7xJyPylLtOj1CmvN31l9kVt4zGfAMolKZCs3ZY2oKYzzqp
 QuSePtYpy6LiVXJWQOXKl4R94lpHv+uAVh0W09b24+TTeRI3c3nH6alCBP3WuNPRgoBT
 dHcmRzyczHd7UvdTgbRPyOInp/qWQ8G0vz/xA4wywVF+oicGVJqgeXl+uyetreNLAsu4
 Rl33fsnAZNolNfSsW70Dt+pcRCnpw/r0XjxirtzGcZOQfEB5Rw4vDsEVR77jcNrX2Qs7
 BiAQ==
X-Gm-Message-State: AOAM530wMYG1j3ICKXsTlolFXNdOOXR5dx5JZ2AvFFlsjj2zbXRT1SLQ
 nQdpw4irtwCF2yXYkicPoTPX0g==
X-Google-Smtp-Source: ABdhPJzCSu1k1ObRkVVik921t47hSdFUMnCL/IpfhPmDZOyMONADZqPpDPvBnsKEgLMYAxxH5tO5BQ==
X-Received: by 2002:aed:31c5:: with SMTP id 63mr297760qth.367.1606154706309;
 Mon, 23 Nov 2020 10:05:06 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id y3sm3659532qkl.110.2020.11.23.10.05.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 10:05:05 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1khGD3-00AEXU-0H; Mon, 23 Nov 2020 14:05:05 -0400
Date: Mon, 23 Nov 2020 14:05:04 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jianxin Xiong <jianxin.xiong@intel.com>
Subject: Re: [PATCH rdma-core 3/5] pyverbs: Add dma-buf based MR support
Message-ID: <20201123180504.GA244516@ziepe.ca>
References: <1606153984-104583-1-git-send-email-jianxin.xiong@intel.com>
 <1606153984-104583-4-git-send-email-jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1606153984-104583-4-git-send-email-jianxin.xiong@intel.com>
X-Mailman-Approved-At: Tue, 24 Nov 2020 08:08:40 +0000
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
Cc: Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Doug Ledford <dledford@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 23, 2020 at 09:53:02AM -0800, Jianxin Xiong wrote:

> +cdef class DmaBuf:
> +    def __init__(self, size, unit=0):
> +        """
> +        Allocate DmaBuf object from a GPU device. This is done through the
> +        DRI device interface (/dev/dri/card*). Usually this requires the
> +        effective user id being root or being a member of the 'video' group.
> +        :param size: The size (in number of bytes) of the buffer.
> +        :param unit: The unit number of the GPU to allocate the buffer from.
> +        :return: The newly created DmaBuf object on success.
> +        """
> +        self.dmabuf_mrs = weakref.WeakSet()
> +        self.dri_fd = open('/dev/dri/card'+str(unit), O_RDWR)
> +
> +        args = bytearray(32)
> +        pack_into('=iiiiiiq', args, 0, 1, size, 8, 0, 0, 0, 0)
> +        ioctl(self.dri_fd, DRM_IOCTL_MODE_CREATE_DUMB, args)
> +        a, b, c, d, self.handle, e, self.size = unpack('=iiiiiiq', args)
> +
> +        args = bytearray(12)
> +        pack_into('=iii', args, 0, self.handle, O_RDWR, 0)
> +        ioctl(self.dri_fd, DRM_IOCTL_PRIME_HANDLE_TO_FD, args)
> +        a, b, self.fd = unpack('=iii', args)
> +
> +        args = bytearray(16)
> +        pack_into('=iiq', args, 0, self.handle, 0, 0)
> +        ioctl(self.dri_fd, DRM_IOCTL_MODE_MAP_DUMB, args);
> +        a, b, self.map_offset = unpack('=iiq', args);

Wow, OK

Is it worth using ctypes here instead? Can you at least add a comment
before each pack specifying the 'struct XXX' this is following?

Does this work with normal Intel GPUs, like in a Laptop? AMD too?

Christian, I would be very happy to hear from you that this entire
work is good for AMD as well

Edward should look through this, but I'm glad to see something like
this

Thanks,
Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
