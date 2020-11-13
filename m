Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B91452B1767
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 09:39:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 315E36E47A;
	Fri, 13 Nov 2020 08:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EBEE6E2D1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 00:42:24 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id v11so5590472qtq.12
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 16:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LFBr5bRhMYEEtwJMcdar1j30ihSHzzGASTWO2ocXRlY=;
 b=lA7P5Ij5QfK4LTiI9OvCALsrz9XW4HvEmgqrPJ0M5Bk66iYxlvTlk7tYyCnpbO7Jd+
 JCjlzmFpdziTtGpdVC4JidB+yG7iKlnoNch5HoaaDWViSXNgyaAnI/CLuH7tTqoxGWSJ
 3n/s5DyJ7gMBT3f8mTQw24M7VAO1qpJK0aH6sAjC8j5w7hMAnfl/ldaJpN0dlJIMh0VY
 MxhkeZnrJJPl/B3UYtctHRauWX5O4EFvtn1pUy1xZR2WqrmdIqOwJOAfTQ+LKYZ0kO6f
 Z6E/UBnwHyPLIE+hdRB2uBWJmv4z2g2i6cWvdU4a+sdtq6Zrrbjjcf+Ky40GTUAMGVX+
 lQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LFBr5bRhMYEEtwJMcdar1j30ihSHzzGASTWO2ocXRlY=;
 b=TPp93FyfaMg6JL+iuSoij4hmS4+VOxjQTm7t6mv6aaDNmEL1PhKBn/7tYubjL8W/B5
 66Ff9yOrePnVTOsna2L8MxoUnKud0SQPorQBqanOlCoajMNb86w9n1zI/Yjl1O/L65XE
 Jtb1WY1LsnXkeQnnO/fjH+aVLJb5d5EgJ3eMwI2Mzmaj3CT1NOBsdwXgidI/nUVGlFwW
 Spb7m2hCWpw4QTRQgLC1uNYm5H+GYvXSaZKjMIDTaaJCK3A2xOuInD2TWtlP3FS3gBaf
 ZxFfkRYfOV/xGExvyrQdAPr+ZFiiOIi7Tb3p3DE8r3WGD4lM9jGslQbmnVajncCAJTcc
 uINA==
X-Gm-Message-State: AOAM530cmSR8/0x+Vh338DXM8Yr7wu8fyudM4zehu/xS4BKKn9rGBDNS
 suH4KJFhqhVj1wGzSrXmad+F9A==
X-Google-Smtp-Source: ABdhPJxg/ZtGpQNwWQTpd2nA5rfINiBe8BS/AHpPwnOe/vDl68OSm1f3CCo1gVhK5ykEOcTt5JkSMw==
X-Received: by 2002:ac8:4e24:: with SMTP id d4mr1908658qtw.271.1605228143332; 
 Thu, 12 Nov 2020 16:42:23 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id f202sm5257512qke.112.2020.11.12.16.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 16:42:22 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kdNAU-004Cdr-0S; Thu, 12 Nov 2020 20:42:22 -0400
Date: Thu, 12 Nov 2020 20:42:22 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jianxin Xiong <jianxin.xiong@intel.com>
Subject: Re: [PATCH v10 0/6] RDMA: Add dma-buf support
Message-ID: <20201113004222.GB244516@ziepe.ca>
References: <1605044477-51833-1-git-send-email-jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1605044477-51833-1-git-send-email-jianxin.xiong@intel.com>
X-Mailman-Approved-At: Fri, 13 Nov 2020 08:38:02 +0000
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
Cc: Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Doug Ledford <dledford@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 10, 2020 at 01:41:11PM -0800, Jianxin Xiong wrote:
> This is the tenth version of the patch set. Changelog:

So, really everything looks basically fine, other than some small
details.

The next step for this is to post the matching rdma-core changes and
the man page for how this new libibverbs API works. Like DRM we don't
merge kernel code without the userspace part as a matter of policy.

You have to address the "how to test" question in that submission.

This series should be posted to the linux-rdma mailing list and the
github:

https://github.com/linux-rdma/rdma-core

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
