Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBB12279A0
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 09:42:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8BCB6E4AE;
	Tue, 21 Jul 2020 07:42:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3A16E4AA
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 07:42:01 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id j18so1794514wmi.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 00:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=8I4d3yfRPKUddAXMH4OKFOkQh1gH0jweTktqrHFJPqI=;
 b=SVvv7WmMU/Y5r7Bz1LS9CJ5KZudcoOtUtpIHe4inw8Fdgpk0vWbt2aZSxRVvT1RbGP
 +dIqAIlwAMOTZjCAL5PJnhSHjxfyl5xPlAcgOiAUQtvZYQZ1VAnxWN3lgsNyuZh9PE+7
 ShZBr3S4wXdEzKLr/G5+xzpOoA5vtHu1FCB8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=8I4d3yfRPKUddAXMH4OKFOkQh1gH0jweTktqrHFJPqI=;
 b=J9SFtFbqMgSsQXXbtDw861Ia7J3qXN2vONcF0/4wL/C5HgkdkF+MepCCiPX5xzUIOk
 iPQP4imEUjipRsBSQqRuC5xUbY9/DHlSVQ+DYjqbHnVKsbStmRyeCnoHO7OYbAt65Cuq
 4KFZ/WgWzbUF+yknbAz3iUBC+Hhk/rq+Ai3hm8PvQ+3FwOdBGqJJeS1a8zSYphW6HnYg
 A2VYW8DdkRfjGIRCKQqK/dSOjt9lFulhdPsYEgYQYrKjmuB359yXNUdo6tKVbj0C0a+P
 MIKU2MluQuAsBhfMHdiLHFaGavwzisFQsNpkxVHGj3GAAj4BakZB9GPS0z2IpDsHuF7b
 MiDw==
X-Gm-Message-State: AOAM532jgZdPGELXDK6SSQA1to8iD0wr2NRRu9bOa89YYVPVpw5Kun47
 Hg5ebWQtwQ2JZVQRHuvt72S61w==
X-Google-Smtp-Source: ABdhPJwELMZ3FDmnBcjPCFuUIAq0UQy6OzxYenXzQ86GtS8M6350pulmMr/zJSvRpUKbu1kZupVbTQ==
X-Received: by 2002:a1c:2349:: with SMTP id j70mr2752286wmj.22.1595317320339; 
 Tue, 21 Jul 2020 00:42:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w1sm5246860wra.73.2020.07.21.00.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 00:41:59 -0700 (PDT)
Date: Tue, 21 Jul 2020 09:41:57 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf.rst: Document why indefinite
 fences are a bad idea
Message-ID: <20200721074157.GB3278063@phenom.ffwll.local>
References: <20200707201229.472834-4-daniel.vetter@ffwll.ch>
 <20200709123339.547390-1-daniel.vetter@ffwll.ch>
 <93b673b7-bb48-96eb-dc2c-bd4f9304000e@shipmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <93b673b7-bb48-96eb-dc2c-bd4f9304000e@shipmail.org>
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
Cc: Daniel Stone <daniels@collabora.com>, linux-rdma@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Steve Pronovost <spronovo@microsoft.com>,
 amd-gfx@lists.freedesktop.org, Jason Ekstrand <jason@jlekstrand.net>,
 Jesse Natalie <jenatali@microsoft.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 20, 2020 at 01:15:17PM +0200, Thomas Hellstr=F6m (Intel) wrote:
> Hi,
> =

> On 7/9/20 2:33 PM, Daniel Vetter wrote:
> > Comes up every few years, gets somewhat tedious to discuss, let's
> > write this down once and for all.
> > =

> > What I'm not sure about is whether the text should be more explicit in
> > flat out mandating the amdkfd eviction fences for long running compute
> > workloads or workloads where userspace fencing is allowed.
> =

> Although (in my humble opinion) it might be possible to completely untang=
le
> kernel-introduced fences for resource management and dma-fences used for
> completion- and dependency tracking and lift a lot of restrictions for the
> dma-fences, including prohibiting infinite ones, I think this makes sense
> describing the current state.

Yeah I think a future patch needs to type up how we want to make that
happen (for some cross driver consistency) and what needs to be
considered. Some of the necessary parts are already there (with like the
preemption fences amdkfd has as an example), but I think some clear docs
on what's required from both hw, drivers and userspace would be really
good.
>
> Reviewed-by: Thomas Hellstrom <thomas.hellstrom@intel.com>

Thanks for taking a look, first 3 patches here with annotations and docs
merged to drm-misc-next. I'll ask Maarten/Dave whether another pull is ok
for 5.9 so that everyone can use this asap.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
