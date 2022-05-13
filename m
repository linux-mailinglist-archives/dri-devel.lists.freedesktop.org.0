Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0161F5266CF
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 18:13:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5942A10E041;
	Fri, 13 May 2022 16:13:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BC4E10E041
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 16:13:27 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 j10-20020a17090a94ca00b001dd2131159aso11269490pjw.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 09:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=n4Ua5qSAHgvrptVTXpgV4jY28Fp/1ApPJcGYkkazweE=;
 b=dh+CcTt4AjCORsqV1ZODlBqFq+OvMka9auOOZykOuG9GwHD05RDvn63lEcsItiN2eH
 nH+MkFBQ8v1tdeWUMN4BRvaW+7Q1uwmQiOctS5wPsQLKRk5Ykt9si+fUFSf6n/at1dmY
 4JOHexwRERxmPXQVd5EWv4mWhFA3BXiW4pCX0ZdVzHtYoUWHmurH8uIA0uBpYInyofFZ
 pNEuW8xEgDqjAmuzWH27jn+y85YMNek74F2xgDatREWDoXEvBkL4SnO/axBiM7vQgUS4
 gbWP9yrJI2fCACw+ngKTCewWFxR85tswkrdeT3TpOZ3UiGjOL9rgao5yscsrH/9y3/bl
 VBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=n4Ua5qSAHgvrptVTXpgV4jY28Fp/1ApPJcGYkkazweE=;
 b=SZHWip5W4f8NMtefDeoTVkxN8jzewzcfUAs0HNjForkAD1ffU7p28pmT1e47CDBBQA
 wo8MMkgZJyYp7iXMsiXTVDtP09JmwqcIBVpktyOCAnl3ZXeLGOVQZDl1U8E+gBZ/i0Qv
 8YigXjC+orPFghqEYIDzJ4xtpzvg5+fPUu7OoxSyDQziniUYArW59cbBqxRt3HbbdSa8
 anCB9e+EmOSR0nJvkVDgWwmDR8XoW3dVNf0qh2mBqY5abcPnhmTiTZbGAT35BwZrHxpz
 r/WgaOUZgOa/a+WoDjDLILv0DOBUE8+I34CxU+S9nDhXK0wB7kt+SeTo4JSohiLdCvdM
 EVZA==
X-Gm-Message-State: AOAM531UYUM0tXrYcGHXUoAbRZsLksBrhhdBGDKuLXkR7v2ZWcVPOErv
 sYaTiD/UfaStWZhNacXRgkA=
X-Google-Smtp-Source: ABdhPJx/E0j2BSOqlsmETv4JaHt8kQAXKtx8000l3ywPW9tmB75Cv/mYY002CdT2AqHaPSsO5Oy1mQ==
X-Received: by 2002:a17:90b:17c4:b0:1de:c92c:ad91 with SMTP id
 me4-20020a17090b17c400b001dec92cad91mr5642606pjb.169.1652458407026; 
 Fri, 13 May 2022 09:13:27 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::4:5607])
 by smtp.gmail.com with ESMTPSA id
 ip14-20020a17090b314e00b001d81a30c437sm1796573pjb.50.2022.05.13.09.13.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 09:13:26 -0700 (PDT)
Date: Fri, 13 May 2022 06:13:25 -1000
From: Tejun Heo <tj@kernel.org>
To: "T.J. Mercier" <tjmercier@google.com>
Subject: Re: [PATCH v7 0/6] Proposal for a GPU cgroup controller
Message-ID: <Yn6DpUsoSz1/15Kc@slm.duckdns.org>
References: <20220510235653.933868-1-tjmercier@google.com>
 <3365cd1d750e84fedc8e75d646a77ffd85619d35.camel@ndufresne.ca>
 <CABdmKX3ZV6-u-oLvW_wWavAMBfrsZ=C_rCgK_Uz4VjxcRvRFew@mail.gmail.com>
 <81026ef07c1ce20f8673b75b17bab79a2b39c548.camel@ndufresne.ca>
 <CABdmKX2LxZ6zZR=fhXfnuWCB2BR+gzDd1-t1DD2A2XP24wvuGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABdmKX2LxZ6zZR=fhXfnuWCB2BR+gzDd1-t1DD2A2XP24wvuGQ@mail.gmail.com>
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
Cc: linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 Carlos Llamas <cmllamas@google.com>, dri-devel@lists.freedesktop.org,
 John Stultz <jstultz@google.com>, Zefan Li <lizefan.x@bytedance.com>,
 Kalesh Singh <kaleshsingh@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Kenny.Ho@amd.com, Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>, Martijn Coenen <maco@android.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, Laura Abbott <labbott@redhat.com>,
 kernel-team@android.com, linux-media@vger.kernel.org,
 Todd Kjos <tkjos@android.com>, linaro-mm-sig@lists.linaro.org,
 Shuah Khan <skhan@linuxfoundation.org>, cgroups@vger.kernel.org,
 Suren Baghdasaryan <surenb@google.com>, Christian Brauner <brauner@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Liam Mark <lmark@codeaurora.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Hridya Valsaraju <hridya@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Thu, May 12, 2022 at 08:43:52PM -0700, T.J. Mercier wrote:
> > I'm actually happy I've asked this question, wasn't silly after all. I think the
> > problem here is a naming issue. What you really are monitor is "video memory",
> > which consist of a memory segment allocated to store data used to render images
> > (its not always images of course, GPU an VPU have specialized buffers for their
> > purpose).
> >
> > Whether this should be split between what is used specifically by the GPU
> > drivers, the display drivers, the VPU (CODEC and pre/post-processor) or camera
> > drivers is something that should be discussed. But in the current approach, you
> > really meant Video memory as a superset of the above. Personally, I think
> > generically (to de-Andronized your work), en-globing all video memory is
> > sufficient. What I fail to understand is how you will manage to distinguished
> > DMABuf Heap allocation (which are used outside of Android btw), from Video
> > allocation or other type of usage. I'm sure non-video usage will exist in the
> > future (think of machine learning, compute, other high bandwidth streaming
> > thingy ...)
> >
> Ok thank you for pointing out the naming issue. The naming is a
> consequence of the initial use case, but I guess it's too specific.
> What I want out of this change is that android can track dmabufs that
> come out of heaps, and drm can track gpu memory. But other drivers
> could track different resources under different names. Imagine this
> were called a buffer cgroup controller instead of a GPU cgroup
> controller. Then the use component ("video memory") isn't tied up with
> the name of the controller, but it's up to the name of the bucket the
> resource is tracked under. I think this meets the needs of the two use
> cases I'm aware of now, while leaving the door open to other future
> needs. Really the controller is just enabling abstract named buckets
> for tracking and eventually limiting a type of resource.

So, there hasn't been whole lot of discussion w/ other GPU folks and what
comes up still seems to indicate that we're still long way away from having
a meaningful gpu controller. For your use case, would it make sense to just
add dmabuf as a key to the misc controller? I'm not sure it makes sense to
push "gpu controller" forward if there's no conceptual consensus around what
resources are.

Thanks.

-- 
tejun
