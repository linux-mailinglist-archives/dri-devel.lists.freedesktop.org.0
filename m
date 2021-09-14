Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4577540B06C
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 16:18:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 807F86E4A2;
	Tue, 14 Sep 2021 14:18:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B08276E4A2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 14:18:35 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id t8so15473721wrq.4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 07:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=kpn+M1bqQCPZctbXT2rMFocOAVoHTOH/YHoMT77kaXA=;
 b=KB4MNAxhrmlbX59MwAQZ6hLhzSFEWzYdMbFTOohpBg3/xVF58nlidY6zi0qGimEhqm
 Jl6OCNnnQMIFIqi85bkucA2jwEyap/QQOUngnGS5sFkRXOcZpJV0qG67XAOWE7gBHPBL
 dZ2GY6mBv3tc5NBbWhoYZ9ImG68TbT4LJGvgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=kpn+M1bqQCPZctbXT2rMFocOAVoHTOH/YHoMT77kaXA=;
 b=A0g0Df5qITR4bWJNnlLfAig02IA0yLc5a0ze5Yf/hnHaenmOxkvxFpN8olD/e97WNg
 4dNXWYheP6+tZcI/qyDsG2VO8NZIXhgBuJCtbWxESq4idkW5K3BKI7LPhE9n6fXcjh+O
 Ndn4NboIstevb/1Yt6x8SxXmA02s0te47NE82r1FY47JZPW1ACg5m7XOrg4alRwGl7X+
 IFde3KeC6kRMpSSbXRuxdeoLU35tltrSOWM+Rmjts2i81BKz/TNps0L7O2j5TKxFVZ+9
 2tCNFxN8MUceRM08KsTfF2MSNj5uksCo+3G/9iiE5UeaowewjTLosmKnkTw8BzEG0KvB
 iJ6g==
X-Gm-Message-State: AOAM533RUcmVPTcG42gtXlJG0Hy7Hs/chFBQRzkbs9gsV1SPJp+da4Bz
 UH7+fP97DiGm86l6iVCXSbuhuQ==
X-Google-Smtp-Source: ABdhPJwKQcZFGHqC1jw8lf4RoQcxifPnrx41rU4gRLMHuOSauY9GY+Cp86a0hl31Z0tdwkoEknt34g==
X-Received: by 2002:adf:f183:: with SMTP id h3mr13825816wro.32.1631629114235; 
 Tue, 14 Sep 2021 07:18:34 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l15sm1251759wme.42.2021.09.14.07.18.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 07:18:33 -0700 (PDT)
Date: Tue, 14 Sep 2021 16:18:31 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Oded Gabbay <ogabbay@kernel.org>
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, jgg@ziepe.ca,
 christian.koenig@amd.com, daniel.vetter@ffwll.ch,
 galpress@amazon.com, sleybo@amazon.com,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-media@vger.kernel.org, dledford@redhat.com, airlied@gmail.com,
 alexander.deucher@amd.com, leonro@nvidia.com, hch@lst.de,
 amd-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v6 0/2] Add p2p via dmabuf to habanalabs
Message-ID: <YUCvNzpyC091KeaJ@phenom.ffwll.local>
Mail-Followup-To: Oded Gabbay <ogabbay@kernel.org>,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 jgg@ziepe.ca, christian.koenig@amd.com, galpress@amazon.com,
 sleybo@amazon.com, dri-devel@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, linux-media@vger.kernel.org,
 dledford@redhat.com, airlied@gmail.com, alexander.deucher@amd.com,
 leonro@nvidia.com, hch@lst.de, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20210912165309.98695-1-ogabbay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210912165309.98695-1-ogabbay@kernel.org>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Sep 12, 2021 at 07:53:07PM +0300, Oded Gabbay wrote:
> Hi,
> Re-sending this patch-set following the release of our user-space TPC
> compiler and runtime library.
> 
> I would appreciate a review on this.

I think the big open we have is the entire revoke discussions. Having the
option to let dma-buf hang around which map to random local memory ranges,
without clear ownership link and a way to kill it sounds bad to me.

I think there's a few options:
- We require revoke support. But I've heard rdma really doesn't like that,
  I guess because taking out an MR while holding the dma_resv_lock would
  be an inversion, so can't be done. Jason, can you recap what exactly the
  hold-up was again that makes this a no-go?

- The other option I discussed is a bit more the exlusive device ownership
  model we've had for gpus in drm of the really old kind. Roughly this
  would work like this, in terms of drm_device:
  - Only the current owner (drm_master in current drm code, but should
    probably rename that to drm_owner) is allowed to use the accel driver.
    So all ioctl would fail if you're not drm_master.
  - On dropmaster/file close we'd revoke as much as possible, e.g.
    in-flight commands, mmaps, anything really that can be revoked.
  - For non-revokable things like these dma-buf we'd keep a drm_master
    reference around. This would prevent the next open to acquire
    ownership rights, which at least prevents all the nasty potential
    problems.
  - admin (or well container orchestrator) then has responsibility to
    shoot down all process until the problem goes away (i.e. until you hit
    the one with the rdma MR which keeps the dma-buf alive)

- Not sure there's another reasonable way to do this without inviting some
  problems once we get outside of the "single kernel instance per tenant"
  use-case.

Wrt implementation there's the trouble of this reinventing a bunch of drm
stuff and concepts, but that's maybe for after we've figured out
semantics.

Also would be great if you have a pull request for the userspace runtime
that shows a bit how this all gets used and tied together. Or maybe some
pointers, since I guess retconning a PR in github is maybe a bit much.

Cheers, Daniel

> 
> Thanks,
> Oded
> 
> Oded Gabbay (1):
>   habanalabs: define uAPI to export FD for DMA-BUF
> 
> Tomer Tayar (1):
>   habanalabs: add support for dma-buf exporter
> 
>  drivers/misc/habanalabs/Kconfig             |   1 +
>  drivers/misc/habanalabs/common/habanalabs.h |  22 +
>  drivers/misc/habanalabs/common/memory.c     | 522 +++++++++++++++++++-
>  drivers/misc/habanalabs/gaudi/gaudi.c       |   1 +
>  drivers/misc/habanalabs/goya/goya.c         |   1 +
>  include/uapi/misc/habanalabs.h              |  28 +-
>  6 files changed, 570 insertions(+), 5 deletions(-)
> 
> -- 
> 2.17.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
