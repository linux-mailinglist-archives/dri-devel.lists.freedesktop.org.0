Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDD33335F9
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 07:44:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D0B56E9C7;
	Wed, 10 Mar 2021 06:44:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD836E9C7
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 06:44:09 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id t26so10736597pgv.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Mar 2021 22:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/L+QoKkOaRmU+ASvLNzwIcYpCDJy7YDyKr/EVlNlog0=;
 b=hxg4SSMV7xEVGPAW+t4tjP+JM78kHwcrNk681W1WE7+p1kZ+xj/MAPeulJrQLfQ1gy
 MY78f9vcxT4ACEKQGyIeTjycuHdQ+upNs2h+l9ApfTQMwjzeo4xnXbO/yblNUCKz5aZx
 uED3zpD38W8XSVH3qz/7bY0vwOBbwEphFHXZ18/jS+mMFhAJD61ZEKe9OLlY1tIoLbzx
 Hm4FOHEJG1JyndZauPZufaRXdfPMrANl50bTCqfPxEwJVDso5EgwcoE1PKQ7NJ3gcWV8
 HL/+SHNCGzQD/5Kr1tBefd59ZIOJrtnWoY+1pz4BVbPDMk6q+AkjYCS7yvPX5a8RPezL
 f9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=/L+QoKkOaRmU+ASvLNzwIcYpCDJy7YDyKr/EVlNlog0=;
 b=fUE2t+Ne2pNayAojE9Zh42OFcGbGGgEv5h0HZJ/LmyCpNRt4mqW82SvhibqgtgoQd/
 2yXSoY6jOb+KJp7o75IyjN3mmBqs7XoLIO47coMiB8b5XDyz9qa9nsh3sRqyr+kQUDRl
 fGhKa7E6jwi8n/2NsaZh0GiPtPNpG16EdOLkviOuLmOquQnMbzlXXmJRUioA9Js5rANa
 5Zo+JTLxPvX9zt/qSHhm5STAaUkKKB0wghHeVKPYfl5X+0CbFNyphxwNqKx39NCBHKt9
 wsUNTHXbhjiZvdow0Wa6PP24rA8vYe0Xjgi/VNPpLJLr4bn8H/n/rZttIS8wMpuPtdLp
 DclQ==
X-Gm-Message-State: AOAM531h/t7xW3NRiSfCGsnGygD2icsG318NBXw0MgIxsvyG5TfeI6C/
 inicGsTdks54HuTNS2ofysQ=
X-Google-Smtp-Source: ABdhPJyE9h1PLlojbu2FEG7rbWy4ivd0UsQWUfjnGqJufCi7a81cp7kJM+Xb8r/K5gK+wLcal7iYSA==
X-Received: by 2002:a63:4850:: with SMTP id x16mr1517211pgk.176.1615358648951; 
 Tue, 09 Mar 2021 22:44:08 -0800 (PST)
Received: from google.com ([2620:15c:211:201:f896:d6be:86d4:a59b])
 by smtp.gmail.com with ESMTPSA id o1sm4933251pjp.4.2021.03.09.22.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 22:44:08 -0800 (PST)
Date: Tue, 9 Mar 2021 22:44:05 -0800
From: Minchan Kim <minchan@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 9/9] zsmalloc: remove the zsmalloc file system
Message-ID: <YEhqtTEhm3BnJ7hH@google.com>
References: <20210309155348.974875-1-hch@lst.de>
 <20210309155348.974875-10-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210309155348.974875-10-hch@lst.de>
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
Cc: Jason Gunthorpe <jgg@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "VMware, Inc." <pv-drivers@vmware.com>, David Hildenbrand <david@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Alex Williamson <alex.williamson@redhat.com>, Nadav Amit <namit@vmware.com>,
 Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Nitin Gupta <ngupta@vflare.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 09, 2021 at 04:53:48PM +0100, Christoph Hellwig wrote:
> Just use the generic anon_inode file system.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Minchan Kim <minchan@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
