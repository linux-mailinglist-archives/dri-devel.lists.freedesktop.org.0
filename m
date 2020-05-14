Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C19721D2FCA
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 14:31:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C12106EB28;
	Thu, 14 May 2020 12:31:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BCB86EB28
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 12:31:15 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id l11so3861958wru.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 05:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=5L3ztVTSKOLB244G65ZSGtUQqMEEP8hy+Z9x9uH8zas=;
 b=XP2/KMs+gTj7Eg8apXs3bcyaa/CJ9Cg2niFlnTGlqvE5RTQdQT7MpwKkBEqB+JQ8aL
 4UuBD6l5ST1XjJm02s9KnqjR8A0Y1UzmK1O1Om0k1jpP0vfs6D62Kyro76gDWMWI47HK
 HLOKTGmtd6jGITv2+c5urjo14QMTiHh/Mwycg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=5L3ztVTSKOLB244G65ZSGtUQqMEEP8hy+Z9x9uH8zas=;
 b=SoSdn2w3qt6NOL2YKVDwflVa+R0VgD7ttQlevWiD4PoNKbJ2n3vLZWNmdYpD2+Biyr
 RkanMqHtLDvdyREhJpJvc5kG6yt5RhaXepfs6nqHEgGBtCAMDaXmcgLuBytvs/AWp9e5
 dS2hFH5GkLJCWAet0nuEKYzyJSY/0Gpt1abzuqAT4kmVH6w72jUdsDpb7olqlllMpRvj
 HGE1NYt55f6lQfnPwzC0JKZfLJm0JMz83NNCWgy4aKQlPzcIMtXY8sdRrwddFdjQaM0R
 3W17wgm4hS0I2S5KwK6JvyByWeWQqMgaUS7x9CWBVb2wcKpLiDllm3AH/8gXNj2q5IYp
 Y8/Q==
X-Gm-Message-State: AOAM531H3yq+ZFQI1aLYfEY25aaKuTc5iXDkx9qB+RqRdTjeckMAVSk4
 B+H8eQ8tPmNRZmbSxypuAZDECg==
X-Google-Smtp-Source: ABdhPJzO26HExPt8oSSN1CG6GZWaJbzzOwmK5nuzbTE+eMp+2gFxCEKVNXKRppRj4egecVynUjKUXg==
X-Received: by 2002:adf:f1c4:: with SMTP id z4mr5670993wro.25.1589459474052;
 Thu, 14 May 2020 05:31:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o15sm3194658wrw.65.2020.05.14.05.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 05:31:13 -0700 (PDT)
Date: Thu, 14 May 2020 14:31:11 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 1/4] dma-buf: add support for virtio exported objects
Message-ID: <20200514123111.GQ206103@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 David Stevens <stevensd@chromium.org>,
 Tomasz Figa <tfiga@chromium.org>, David Airlie <airlied@linux.ie>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO CORE, NET..." <virtualization@lists.linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 virtio-dev@lists.oasis-open.org
References: <20200311112004.47138-1-stevensd@chromium.org>
 <20200311112004.47138-2-stevensd@chromium.org>
 <CAKMK7uHFgiHLe9oiFBr-VR-6rU9-hLTpBTEVNh0ezyj54u70jw@mail.gmail.com>
 <20200514075952.zuc3zjtmasaqrw75@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200514075952.zuc3zjtmasaqrw75@sirius.home.kraxel.org>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 virtio-dev@lists.oasis-open.org, Thomas Zimmermann <tzimmermann@suse.de>,
 "Michael S . Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Jason Wang <jasowang@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 David Stevens <stevensd@chromium.org>, "open list:VIRTIO CORE,
 NET..." <virtualization@lists.linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 14, 2020 at 09:59:52AM +0200, Gerd Hoffmann wrote:
>   Hi,
> 
> > - for the runtime upcasting the usual approach is to check the ->ops
> > pointer. Which means that would need to be the same for all virtio
> > dma_bufs, which might get a bit awkward. But I'd really prefer we not
> > add allocator specific stuff like this to dma-buf.
> 
> This is exactly the problem, it gets messy quickly, also when it comes
> to using the drm_prime.c helpers ...

drm_prime.c helpers (not the core bits) exist becaues nvidia needed
something that wasnt EXPORT_SYMBOL_GPL.

I wouldn't shed a big tear if they don't fit anymore, they're kinda not
great to begin with. Much midlayer, not much of valued added, but at least
the _GPL is gone.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
