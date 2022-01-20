Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C109494729
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 07:13:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 916C410E228;
	Thu, 20 Jan 2022 06:13:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E806710E35D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 06:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642659212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hsYigPxSNmav9QG9Va6TxR69+mrsv3kMIwPo8ck4XbE=;
 b=aGJ2AwbwclCc03ggDSIWSUyfuo5hod7t3o1y1cBUN4z+Iied8ygDiuF0+oYNkOJ3nTs4tH
 lMB523VjpXHYq/ebNE4blNcS60OrXaDF3V4J2YvaHPweJWcngyfBTc5mzMXavHtdxlA0ey
 Z+wHyFQTMThxHXDgbyZoUsQ3CVNMnpg=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-aC8EzcufM-q8n3_nwzd0-A-1; Thu, 20 Jan 2022 01:13:31 -0500
X-MC-Unique: aC8EzcufM-q8n3_nwzd0-A-1
Received: by mail-qv1-f70.google.com with SMTP id
 ib7-20020a0562141c8700b0040812bc4425so5230538qvb.16
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 22:13:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=hsYigPxSNmav9QG9Va6TxR69+mrsv3kMIwPo8ck4XbE=;
 b=IIxEBkluGJpQniKUxTlRofhlvwrioyotGEe+hgnGz8/Qoxr849RwWCW0ut6UmqEsOu
 mBqWd0K+jLlt+qYy0eKLTSOcIFp9T9DexcJpoUIjrwHgawC5LgdVJlxzAXnHrJDE2qw2
 j/AATPQNB3ay/c+GI+IGeztFGn1kgNionBGBNT7HJ8FDOyBFR72g2EYORdoONGXMNiI2
 /J4AAybp5t5l/CLYTequqOxUn9/bt8BuOZ0CXn8DVDBU/7SSG7JV0Jwkv3IN1m1aEzTK
 FCp2Nh7fJTqpZq+bs6qB9nftnltMVmUr3qsWglFcFw4w1fNTwB7q20IvcDWAIb+6aowc
 yhoA==
X-Gm-Message-State: AOAM533tjwNCwHHMMzFdlKNtkp5xt1GYQv7GL3qXcbm7Y9Z6uwNXI/UJ
 aF3a6XjaMPpHu5KNvGlO4C/z7C+C/4LvZ49i95pKitWGP/RDlkg45XStCgPVh+3nxCh9B+Fa+os
 hOoszi8jA9zMrl6JsBjnwoN+n0qVw
X-Received: by 2002:a05:622a:4c:: with SMTP id
 y12mr27865278qtw.335.1642659210507; 
 Wed, 19 Jan 2022 22:13:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxdxqTkVDkDn6baQ/CklmrGhqh8xjo7oY2Yip6teSrLLN3keAO+JzUCk0W9UECmWQMMI2ODlQ==
X-Received: by 2002:a05:622a:4c:: with SMTP id
 y12mr27865272qtw.335.1642659210209; 
 Wed, 19 Jan 2022 22:13:30 -0800 (PST)
Received: from [192.168.8.138] (pool-98-118-105-43.bstnma.ftas.verizon.net.
 [98.118.105.43])
 by smtp.gmail.com with ESMTPSA id j8sm992632qta.26.2022.01.19.22.13.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 22:13:29 -0800 (PST)
Message-ID: <967026f3672e48207dede86b67a5866838a36a43.camel@redhat.com>
Subject: Re: [RFC] amdgpu MST questions, and future plans
From: Lyude Paul <lyude@redhat.com>
To: amd-gfx@lists.freedesktop.org
Date: Thu, 20 Jan 2022 01:13:28 -0500
In-Reply-To: <15588b86c92b18144be1574826f38f90e9b752ba.camel@redhat.com>
References: <15588b86c92b18144be1574826f38f90e9b752ba.camel@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.2 (3.42.2-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-01-19 at 17:56 -0500, Lyude Paul wrote:
> Hi! I'm writing this email because I'm currently finishing up removing
> pretty
> much all of the non-atomic MST code in drm_dp_mst_topology_mgr.c as it's
> really made it difficult to maintain MST over time. As well, once that's
> complete it's likely I'm going to start on the (extremely overdue) task of
> moving as much of amdgpu's MST code for DSC out of amdgpu and into the DRM
> code where it's supposed to live.
> 
> This brings me to two questions. The first major one being: is anyone
> capable
> of testing the MST support in radeon.ko to figure out whether it works or
> not?
> I've already talked with hwentlan and ag5df about this and they haven't been
> able to find anyone to help with testing this. The reason I ask is because
> radeon isn't an atomic driver, and is basically the only user of any of the
> non-atomic parts of the MST helpers. If anyone want to prevent this from
> breaking in the future, I would definitely recommend they step up to try and
> help with testing it - otherwise I'm probably going to be pushing for us
> just
> to drop the code entirely.
> 
> The second question is: is anyone willing to help me figure out how much of
> the code in amdgpu related to DSC is definitely not amdgpu specific and can
> be
> moved out? I'm honestly having a lot of trouble wrapping my head around how
> some of this works, and how much of this code is even needed. As well, with
> the amount of issues I've already found in it (there's numerous spots where
> we're storing MST state outside of atomic state for instance, lots of
> duplicates of DP helper functions that should not be here, etc.) it's quite
> likely I'm going to be rewriting rather large chunks of it. If anyone would

mhhh - on second thought I think I'm starting to wrap my head around this and
it's not actually too bad :), still could use some help with the radeon
testing though!

> like to volunteer please let me know, it'd be super appreciated and likely
> will make reviewing the patches that will come out of this easier.

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

