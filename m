Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 610472C88E2
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 17:04:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 795888925F;
	Mon, 30 Nov 2020 16:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBA868925F
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 16:04:47 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id u12so16937269wrt.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 08:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hUdKZqG+MBQgVjLX/RaYLcdlC7dw60MlnSnsYg73uFM=;
 b=e7stisBTTYgGJbftvZr2SNRlmjLaiUdzJk+7gtbklEBqb3KLnxnVQB/730BjHPFz32
 l4in8mnfA7e4XQ1wyui1plg+yD+VkdluSZHVcapEsfqqi3NSwT4HiMY2NoKrQLfKFXMr
 I0is84tZaDNoE1vE2qMMM8TCTqIatSiueURIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hUdKZqG+MBQgVjLX/RaYLcdlC7dw60MlnSnsYg73uFM=;
 b=rbufUo+z/lTQooc0qPl9LWHKS9R+BSdDIHnINmQUvtEzjsO4ef4We/WsUX6qAE3GTh
 PMjMmGtMo21uir1lrMM02rlin18OHVUYkbEHnazq+0AWwtGuqX0+4Cky3SSB4Pug18t4
 Z7tkO1Z3LXvcWirAvyj0R3OmFx+oQRy+tjZPZmzRLnP5ng3HwtyFpozkHW8WOep9xbbT
 9Ll6uuB0piiMqNNgwVSo7Egcm9yS519CeXJryY00sg7dzmjwNMHoIlvA5iti3vEaJMlI
 7UkzkMR7guSvO27h/B8X/OOWkBfO3rGoLcIDSO8F/TLlQ6U1oS0Fbg1Ju1LPf/ciGpE9
 bsWQ==
X-Gm-Message-State: AOAM533a/Jz514sG1OUQdQJDdfL+X1RnQp8G3K2pYD0ZSTB0cZyZRHdq
 wkK2GJ0lmRKbygYuyfEPVvVPEQ==
X-Google-Smtp-Source: ABdhPJx07DHU1pcxPbHRWqs6J+D07KInp20G+ns7o06Nyi2BleT3uW+cS8+DggNRhHe75Q05qkBl7w==
X-Received: by 2002:adf:f7c2:: with SMTP id a2mr28783961wrq.11.1606752286569; 
 Mon, 30 Nov 2020 08:04:46 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e3sm29276373wro.90.2020.11.30.08.04.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 08:04:45 -0800 (PST)
Date: Mon, 30 Nov 2020 17:04:43 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH rdma-core v3 4/6] pyverbs: Add dma-buf based MR support
Message-ID: <20201130160443.GV401619@phenom.ffwll.local>
References: <1606510543-45567-1-git-send-email-jianxin.xiong@intel.com>
 <1606510543-45567-5-git-send-email-jianxin.xiong@intel.com>
 <20201130145741.GP401619@phenom.ffwll.local>
 <20201130155544.GA5487@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201130155544.GA5487@ziepe.ca>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
 Christian Koenig <christian.koenig@amd.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 30, 2020 at 11:55:44AM -0400, Jason Gunthorpe wrote:
> On Mon, Nov 30, 2020 at 03:57:41PM +0100, Daniel Vetter wrote:
> > > +	err = ioctl(dri->fd, DRM_IOCTL_AMDGPU_GEM_CREATE, &gem_create);
> > > +	if (err)
> > > +		return err;
> > > +
> > > +	*handle = gem_create.out.handle;
> > > +	return 0;
> > > +}
> > > +
> > > +static int radeon_alloc(struct dri *dri, size_t size, uint32_t *handle)
> > 
> > Tbh radeon chips are old enough I wouldn't care. Also doesn't support p2p
> > dma-buf, so always going to be in system memory when you share. Plus you
> > also need some more flags like I suggested above I think.
> 
> What about nouveau?

Reallistically chances that someone wants to use rdma together with the
upstream nouveau driver are roughly nil. Imo also needs someone with the
right hardware to make sure it works (since the flags are all kinda arcane
driver specific stuff testing is really needed).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
