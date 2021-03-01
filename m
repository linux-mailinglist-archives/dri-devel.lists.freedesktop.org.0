Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7C4327A2D
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 09:58:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1280D6E519;
	Mon,  1 Mar 2021 08:58:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C07B6E50B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 08:58:46 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id n22so2861430wmc.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Mar 2021 00:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=P3UdnxtAWHNx69cmvBpJOsPYrv9Sop0lGmWdQXeDDkU=;
 b=dOUQQoWIEtia66CcRBz8dIwxj0hzbFDyfxUcEn3xHPRMm0Od8qZZictP9fuXeOhPqV
 /q9C5INDJbkj9+oHc47Vvdc5O6vWn4Z8B4v305i3bounp0BxGOSNTs9Y4Fx5d5Ujy57A
 O29Jp4bewesQuz7AgYfVCDgEe9jhNxXVqDuqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=P3UdnxtAWHNx69cmvBpJOsPYrv9Sop0lGmWdQXeDDkU=;
 b=O+4b/roKWPbXTaUomQdAcJE1WgNdRqaob58l6yRrBo3g49hqrNOyDErJDhq0f80z7a
 ILFD1Wst4Hh3ha5D951DoBhEp4DqcQ04klqEJUTmsTooNq7twpXxCCTvmqoFkOf29dPJ
 m2yxxNFgQYqMLf6pdwkJa7onudhZKZAvz1XXJTDahrbUULRlxibecNXWjbKLELiiKXED
 oxMy8W1eAchPS++BH782CTkv45fZ7dtzgp83GXRRg7kcciFJOQJFp7VkUnyNwDWJefbP
 CoQQLtd5LbDuwBjSqb57MFiGsMBwhWSL2MNKL7nfBWzPhSpH68u3hVf5hwA+MwpGuZxd
 6fqA==
X-Gm-Message-State: AOAM530N/ZobprLeB94lfu1jATTIVh4Dw1nQMaV+bDVzUslG35tpfGsU
 zuo32hL2tkJDFai+dLw7MrwnGkIJLV6ISw==
X-Google-Smtp-Source: ABdhPJzbaWVhbPoJjVsCnUtEgLJaYBKmDFSDTWv8H2gN3h9K/eZEJExj+pyhlXiCS+zIa+9aPoHh9w==
X-Received: by 2002:a05:600c:290a:: with SMTP id
 i10mr7065094wmd.91.1614589125322; 
 Mon, 01 Mar 2021 00:58:45 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 6sm26596038wra.63.2021.03.01.00.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 00:58:44 -0800 (PST)
Date: Mon, 1 Mar 2021 09:58:43 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>
Subject: Re: [PATCH 17/35] drm/amdkfd: register HMM device private zone
Message-ID: <YDyswwICD3KmsBrf@phenom.ffwll.local>
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
 <20210107030127.20393-18-Felix.Kuehling@amd.com>
 <CAKMK7uEd9KZAmeNd9Z9GF9p0yUButHc+8_PERRuNR79+uqAhbQ@mail.gmail.com>
 <7f837938-3ad8-6ecf-d2b7-952b177cffb8@shipmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7f837938-3ad8-6ecf-d2b7-952b177cffb8@shipmail.org>
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
Cc: Alex Sierra <alex.sierra@amd.com>, Philip Yang <Philip.Yang@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 01, 2021 at 09:46:44AM +0100, Thomas Hellstr=F6m (Intel) wrote:
> On 3/1/21 9:32 AM, Daniel Vetter wrote:
> > On Wed, Jan 06, 2021 at 10:01:09PM -0500, Felix Kuehling wrote:
> > > From: Philip Yang <Philip.Yang@amd.com>
> > > =

> > > Register vram memory as MEMORY_DEVICE_PRIVATE type resource, to
> > > allocate vram backing pages for page migration.
> > > =

> > > Signed-off-by: Philip Yang <Philip.Yang@amd.com>
> > > Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
> > So maybe I'm getting this all wrong, but I think that the current ttm
> > fault code relies on devmap pte entries (especially for hugepte entries)
> > to stop get_user_pages. But this only works if the pte happens to not
> > point at a range with devmap pages.
> =

> I don't think that's in TTM yet, but the proposed fix, yes (see email I j=
ust
> sent in another thread),
> but only for huge ptes.
> =

> > =

> > This patch here changes that, and so probably breaks this devmap pte ha=
ck
> > ttm is using?
> > =

> > If I'm not wrong here then I think we need to first fix up the ttm code=
 to
> > not use the devmap hack anymore, before a ttm based driver can register=
 a
> > dev_pagemap. Also adding Thomas since that just came up in another
> > discussion.
> =

> It doesn't break the ttm devmap hack per se, but it indeed allows gup to =
the
> range registered, but here's where my lack of understanding why we can't
> allow gup-ing TTM ptes if there indeed is a backing struct-page? Because
> registering MEMORY_DEVICE_PRIVATE implies that, right?

We need to keep supporting buffer based memory management for all the
non-compute users. Because those require end-of-batch dma_fence semantics,
which prevents us from using gpu page faults, which makes hmm not really
work.

And for buffer based memory manager we can't have gup pin random pages in
there, that's not really how it works. Worst case ttm just assumes it can
actually move buffers and reallocate them as it sees fit, and your gup
mapping (for direct i/o or whatever) now points at a page of a buffer that
you don't even own anymore. That's not good. Hence also all the
discussions about preventing gup for bo mappings in general.

Once we throw hmm into the mix we need to be really careful that the two
worlds don't collide. Pure hmm is fine, pure bo managed memory is fine,
mixing them is tricky.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
