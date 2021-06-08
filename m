Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F6C39FA27
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 17:17:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 224856EC1A;
	Tue,  8 Jun 2021 15:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B3EF6EC18
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 15:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623165418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o58aRI1nAkDOuKYCfrK2Zy/zY+ckaGTYEPwd2qo+nAA=;
 b=Qc9SmbxYomsq8bP8kf4krIyE+T+1AIrndT9DBXrR5Ot/KzZBIVLSeBlqUzPDRkIo8A7WI+
 pZj+ij/p5SL64dFmHTEcnJtR5VC8D/+PGXO4Ni7uwQrARyLboYfjpjwXiU8fmKnRssmugP
 Spa5vJYSrPXdlJvutoCG/yH90Sec96M=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-V0J5N6DxPgm-Cn--57SljA-1; Tue, 08 Jun 2021 11:16:55 -0400
X-MC-Unique: V0J5N6DxPgm-Cn--57SljA-1
Received: by mail-qv1-f72.google.com with SMTP id
 v7-20020a0ccd870000b0290219d3e21c4eso15769649qvm.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 08:16:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=o58aRI1nAkDOuKYCfrK2Zy/zY+ckaGTYEPwd2qo+nAA=;
 b=sOo/g8hHCIibO0qNWfhRYfUfYO6OMb0jB7EBf+QS4Ge0D79rb60zSYA59LZaTBaTdv
 53Zff1B9XZgIhzV+fz44oZNxyfERG+9UgrcgmOODsrOR9etzwvMeHdNBFcuwdlilH0vB
 QZwAlUwbmJfdTzlj5gDfaq153D1lgpoqsIKb9fUkgQvgbQV8XoCLAWKuK9qhE5u37uSV
 7Hef+/aQRqOsEw1WL5Pawamj785h3q3B6rpn9tl2hvPhfyEfIDfPnVvMPUv6vgP52KFL
 msACav56n0uv2ZrpXDAvOe3mJR0TziHXF7/7kpITsCGldTljiMxKfx4W1uN4N/cTcq1a
 Gdcg==
X-Gm-Message-State: AOAM533IwBte8N0A1LA64dOd0PDnRvrEtLsP0eul3+6tUSmjyQzc5GPB
 5LIRD+U5q+LLoJbcMU+JBHQm1Mpu7hppRD8Jv0aOMbAX8/SZaChRFVdO9bFuHaKi+032cwp7IGE
 0ip16e08GJCCz35aL0v/1D9Yzwz/c
X-Received: by 2002:a05:620a:408f:: with SMTP id
 f15mr21924738qko.398.1623165414858; 
 Tue, 08 Jun 2021 08:16:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBLlJH23DxgLDX/p84+mzCKOsdataYBzhyEZq9wfQJJoaRz9EMetGKzWGtOqIiIcaJr3BbOg==
X-Received: by 2002:a05:620a:408f:: with SMTP id
 f15mr21924712qko.398.1623165414615; 
 Tue, 08 Jun 2021 08:16:54 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-88-174-93-75-200.dsl.bell.ca.
 [174.93.75.200])
 by smtp.gmail.com with ESMTPSA id e20sm121010qtr.55.2021.06.08.08.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 08:16:53 -0700 (PDT)
Date: Tue, 8 Jun 2021 11:16:52 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v10 05/10] mm: Rename migrate_pgmap_owner
Message-ID: <YL+J5NN2yRKjyEeq@t490s>
References: <20210607075855.5084-1-apopple@nvidia.com>
 <20210607075855.5084-6-apopple@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20210607075855.5084-6-apopple@nvidia.com>
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
 nouveau@lists.freedesktop.org, hughd@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, linux-mm@kvack.org,
 shakeelb@google.com, bskeggs@redhat.com, jgg@nvidia.com, jhubbard@nvidia.com,
 akpm@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 07, 2021 at 05:58:50PM +1000, Alistair Popple wrote:
> MMU notifier ranges have a migrate_pgmap_owner field which is used by
> drivers to store a pointer. This is subsequently used by the driver
> callback to filter MMU_NOTIFY_MIGRATE events. Other notifier event types
> can also benefit from this filtering, so rename the
> 'migrate_pgmap_owner' field to 'owner' and create a new notifier
> initialisation function to initialise this field.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Suggested-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

