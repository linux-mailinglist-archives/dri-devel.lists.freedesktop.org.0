Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F29C39A3A2
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 16:47:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E24426F490;
	Thu,  3 Jun 2021 14:47:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A876F48E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 14:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622731666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ggwAzDwYsJe761/h5KeyH0+JH3HJIdjU1YmA0yiaMkI=;
 b=c6KbUWHozjlgPRGeKkkVLjeAZIWBPqMyh56ebADi0rfZcqAJGEBYATvwEoUYnfBI9VRW8f
 Gjk4IeEfuXNd/w7x4TXUjO2lOEmf8jgt5gI0IaRTryfSZKkzbgRUPYZn0vYcMtNngguA7V
 mIztC+qrLSMk4ynNtaj0G+X5RfORWt0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-ZmA5-xT-P62-13PmBy7L0g-1; Thu, 03 Jun 2021 10:47:43 -0400
X-MC-Unique: ZmA5-xT-P62-13PmBy7L0g-1
Received: by mail-qk1-f200.google.com with SMTP id
 o14-20020a05620a130eb02902ea53a6ef80so4470723qkj.6
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 07:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ggwAzDwYsJe761/h5KeyH0+JH3HJIdjU1YmA0yiaMkI=;
 b=gZorFBwiPjgCi19W/TwhKZ0w3F0qfG9BhoymK44ID4CN+16K8w9Qxi1HQ3ySxsahnj
 FNmiyj0iIRFXgjY6t63XRfHSa7UMS4YgmzqgrkqwrNL2/Yyg3AjcHypU3DYhp3/Q+hq3
 BXk8yL5A/kO27yfcF4zaPxQLtitcZ8AGX5Q2X2bPMA4gjt8E4ofYhgQaVwPD/0YEuupd
 WrCyAOrrIEaAS8ZkvyQgXzbNSjOV06JTYOSCbGkvan3itFFnzmByyYKP3Sm+craJ4dPg
 3BUhfAox7pnAOKvGireBEoX/S7ZjKrcJ7Gi2Djm+Z3IuPcaC6apOPx5Jgzbpu7di2Lwe
 Ek4g==
X-Gm-Message-State: AOAM533znEtb0npLXiQwPWbAFsUEw+XpW0w8ItFOrln4EeUiTj/awl5R
 eIHA7JbqPXhxOv7+mLzxFu3SZqRyFK6nOFyXlb5dB5Y/deW3QVHZbtI17WMvdbmyxwzCuWag1ei
 cmgVMhqs2f5vZe17a02K/S1uQnD9D
X-Received: by 2002:a37:ae81:: with SMTP id
 x123mr31891343qke.251.1622731662880; 
 Thu, 03 Jun 2021 07:47:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8G2sTC80gzexHAH3BN9zjekxO4BROz6GuR6h2LK/qUHy5QdzjC03iGstjtnqP8uH7ytX0pw==
X-Received: by 2002:a37:ae81:: with SMTP id
 x123mr31891297qke.251.1622731662359; 
 Thu, 03 Jun 2021 07:47:42 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-61-184-147-118-108.dsl.bell.ca. [184.147.118.108])
 by smtp.gmail.com with ESMTPSA id j28sm2041208qkl.35.2021.06.03.07.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 07:47:41 -0700 (PDT)
Date: Thu, 3 Jun 2021 10:47:40 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v9 07/10] mm: Device exclusive memory access
Message-ID: <YLjrjJXMP9Y3bvej@t490s>
References: <20210524132725.12697-1-apopple@nvidia.com>
 <YLdGXSw0zdiovn4i@balbir-desktop> <YLeXqp/U0DgylI/u@t490s>
 <3853054.AI2YdRgKcH@nvdebian>
MIME-Version: 1.0
In-Reply-To: <3853054.AI2YdRgKcH@nvdebian>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, Balbir Singh <bsingharora@gmail.com>,
 hughd@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, linux-mm@kvack.org,
 jglisse@redhat.com, bskeggs@redhat.com, jgg@nvidia.com,
 John Hubbard <jhubbard@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 03, 2021 at 09:39:32PM +1000, Alistair Popple wrote:
> Reclaim won't run on the page due to the extra references from the special 
> swap entries.

That sounds reasonable, but I didn't find the point that stops it, probably due
to my limited knowledge on the reclaim code.  Could you elaborate?

-- 
Peter Xu

