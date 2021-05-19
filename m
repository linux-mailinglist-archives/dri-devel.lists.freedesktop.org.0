Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86908388DE6
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 14:21:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5DAC6ED94;
	Wed, 19 May 2021 12:21:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6CEC6ED94
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 12:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621426872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iT4YtjBsBt0s/M51Kj84dkt6amzmmMXBn/lNki8qQn0=;
 b=aadB3nSK7zJu8MLuvZBnwJIwxcvxXFffv3horplEQW35HfRM12D6zRbCkuUb1AeVSk0Nrt
 XAPy3eFD3993+UOMa2COO5RBmilwY5BRi24cg/Jkq7JGByfjJO+QUgoNqe6YhlUEDLEmI1
 JioP1UtKeJ9uyGOd6/goD5mhUaymIrs=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-ED4xbqGqPkCfhWcatOBS0A-1; Wed, 19 May 2021 08:21:10 -0400
X-MC-Unique: ED4xbqGqPkCfhWcatOBS0A-1
Received: by mail-qk1-f198.google.com with SMTP id
 d15-20020a05620a136fb02902e9e93c69c8so9624882qkl.23
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 05:21:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iT4YtjBsBt0s/M51Kj84dkt6amzmmMXBn/lNki8qQn0=;
 b=YMvElkPNlT3tiZOuAf7OnNFddGpgP241Co8Y2dSGm/+jg77T9OKb6RWpp8kN/HGetr
 3t0Ziy9Ln23zD2zTOOJrzuS2afmoVD0XUDKrm+QS5wl6gRp63RuujJH/oh/Exu/tZeLa
 7gnb4AHT6LqPL5StwcyRv1AdUr4OwR9HqteMz+XYqf3k0fm1WEeVTnmETw0mf7EPmRDJ
 ZlfpQxL3KmC0nIcMhUATH+mJepkmGoS3LfRtpKTj2L79BM+Nrn/YXjUmLmS1nj4+IB8f
 SSh1dUAUQmI3KkT/hiw2YY1drJRAtKbpE7jU4fI9tgv3GvpwX3hvDz16CI1P4n4EO7N1
 FMYw==
X-Gm-Message-State: AOAM530Uvra+wlni9a2iaLqy3YsYO5f/m6R/VocgTO72jj/B+MWlcmGh
 FnPuldjBTAQ16YEB32OkafvNV4v3k+fYqTyjbM8mL+DN1rk9BFkboIo5PpfYz9pggG5CS1JZS6p
 PGeMPQTFsrsIgnntE9zjG3w8hUOh6
X-Received: by 2002:a05:620a:818:: with SMTP id
 s24mr7432099qks.425.1621426869766; 
 Wed, 19 May 2021 05:21:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJym25A+8CZrSnha27nfGC/bkh618yND6m6b6Lo8EgcNF6Oma7UyN8ZK+yut+/9S1ILrFjJgwA==
X-Received: by 2002:a05:620a:818:: with SMTP id
 s24mr7432081qks.425.1621426869529; 
 Wed, 19 May 2021 05:21:09 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id o10sm15018668qki.72.2021.05.19.05.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 05:21:09 -0700 (PDT)
Date: Wed, 19 May 2021 08:21:08 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v8 5/8] mm: Device exclusive memory access
Message-ID: <YKUCtA4FrfmkNrn7@t490s>
References: <20210407084238.20443-1-apopple@nvidia.com>
 <47694715.suB6H4Uo8R@nvdebian> <YKP5Dj4Q/riGGc43@t490s>
 <2217153.lfGrokb94b@nvdebian>
MIME-Version: 1.0
In-Reply-To: <2217153.lfGrokb94b@nvdebian>
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
 nouveau@lists.freedesktop.org, bsingharora@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hch@infradead.org, linux-mm@kvack.org, jglisse@redhat.com, bskeggs@redhat.com,
 jgg@nvidia.com, jhubbard@nvidia.com, akpm@linux-foundation.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 19, 2021 at 09:35:10PM +1000, Alistair Popple wrote:
> I think the approach you are describing is similar to what 
> migrate_vma_collect()/migrate_vma_unamp() does now and I think it could be 
> made to work. I ended up going with the GUP+unmap approach in part because 
> Christoph suggested it but primarily because it required less code especially 
> given we needed to call something to fault the page in/break COW anyway (or 
> extend what was there to call handle_mm_fault(), etc.).

I see, thank. Would you mind add a short paragraph in the commit message
talking about these two solutions and why we choose the GUP way?

-- 
Peter Xu

