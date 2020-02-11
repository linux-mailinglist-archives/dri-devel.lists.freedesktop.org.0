Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5C1158D56
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 12:13:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 407266EE20;
	Tue, 11 Feb 2020 11:13:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 247B96EE20
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 11:13:25 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id w12so11838159wrt.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 03:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=VJKGXshv9im8n13J7VytMlLDWj4BKc4K3gpa1jG75HI=;
 b=UAQMn31BcN1FYJQphT3Z1jWaUYxyNoQ/7W9yMdfDUE7ZQMDi3DL2IgDzoNBhEF2k4F
 R4RyRP3q8epWYD3TYWwR4c0lxVX1TZMoheFYmMHITJ4lBDFiFSufmE5D7Tc0BNp/GIKP
 BWAEqaIA+PH6xrGpT6ItmsBl8V6fkq86oDg7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=VJKGXshv9im8n13J7VytMlLDWj4BKc4K3gpa1jG75HI=;
 b=lefnlkcBIjpWtmp2nWZAyJyL6529+k9gm9OCpddYsc68QYU8urZYfBxAkfxf9S+Kh7
 l+GWuQoAgKM3Ys1SMbCaVFABUWWlr/qrIecJ+57wTlG0QOGTOq/YWboihlYyxeMEn2Ue
 to5OIWlyTcCroJh+nhDWKlTwXxvsX/XYQ/D6NB2Gdre0cGK4yrFGesGXpGQxeLyGItu0
 rI+SnkyhWQO1lhmWmSEMLwfD/LIbAivrq7kmKD4X38MDcdyv4X8mk57apZymeE3djpEj
 TPYcNHAdP0IGxRjOelFzvGS+B9X+DmZGh+6pPAp4mq9/ORbYItAybdpE5OXLD/fXIo6M
 g3jQ==
X-Gm-Message-State: APjAAAXAgZ6SGqzrIHw1a9qtR++fEOZMv8N65XB5ExGIh0B9OkNjmh5R
 d9YdHfv+ODrDvo1DX3RGtYpIfw==
X-Google-Smtp-Source: APXvYqzBeoe5MDEk4TQ0c7WoQXjrim/UKU53DgPdywGq1OhC4Zg1bB98YZMoMTrAIIEPd5hkOrprmw==
X-Received: by 2002:a5d:67c7:: with SMTP id n7mr7907527wrw.319.1581419603822; 
 Tue, 11 Feb 2020 03:13:23 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b10sm4721660wrw.61.2020.02.11.03.13.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 03:13:23 -0800 (PST)
Date: Tue, 11 Feb 2020 12:13:21 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Subject: Re: Cleanup TTMs delayed delete handling
Message-ID: <20200211111321.GY43062@phenom.ffwll.local>
References: <20200210150907.20616-1-christian.koenig@amd.com>
 <SN6PR12MB2800BAF6444C0BC373C13E9087180@SN6PR12MB2800.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SN6PR12MB2800BAF6444C0BC373C13E9087180@SN6PR12MB2800.namprd12.prod.outlook.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 11, 2020 at 11:06:53AM +0000, Pan, Xinhui wrote:
> [AMD Official Use Only - Internal Distribution Only]

Uh might want to fix your email setup.
-Daniel

> =

> For patch 1/2/3/5/6
> Reviewed-by: xinhui pan <xinhui.pan@amd.com>
> ________________________________
> From: Christian K=F6nig <ckoenig.leichtzumerken@gmail.com>
> Sent: Monday, February 10, 2020 11:09:01 PM
> To: Pan, Xinhui <Xinhui.Pan@amd.com>; amd-gfx@lists.freedesktop.org <amd-=
gfx@lists.freedesktop.org>; dri-devel@lists.freedesktop.org <dri-devel@list=
s.freedesktop.org>
> Subject: Cleanup TTMs delayed delete handling
> =

> This series of patches cleans up TTMs delayed delete handling.
> =

> The core of the new handling is that we new only have a single reference =
counter instead of two and use kref_get_unless_zero() to grab BOs from the =
LRU during eviction.
> =

> This reduces the overhead of LRU moves and allows us to properly individu=
alize the BOs reservation object during deletion to allow adding BOs for cl=
earing memory, unmapping page tables etc..
> =

> Please review and comment,
> Christian.
> =

> =


> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
