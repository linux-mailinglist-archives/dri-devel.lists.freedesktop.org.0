Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E39841684B
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 01:00:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C6FF6E11F;
	Thu, 23 Sep 2021 23:00:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A01AC6E11F
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 23:00:41 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id b82so930327ybg.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 16:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tNi4Bos8lh7sJkc+jDcM0nJh0Q/L0O1bHURQWGbTkX4=;
 b=BSc1fqu6/Z/Rv3MnwMMeXb/jTCrjhoOWWYoqBAGDKtIkwZf5Ohw+67BmYf7iyGtKLw
 FGPyN7RfyoVb/tO3VZUYC67xDFTbdn2SvyUwiirIGqrO3ztPpmYSJ+QQoBVJAhPXsQzH
 JIgFfev54CDOz7nVU0ko5gEDaIniTuNVSzBdP3SUiz4wrhztbFrvVI617a+Qg7Q7GU2Y
 PxqWZ/Y4REdyQy8jB1fGjgCHPwZQe+RvBts8vdqPb14T84tyq1AgoglerVejtYa/hSrx
 TknyI/LcvKRi1Qa0viPfnd3bH164YUcPly4CFCQw61l9fehNp4BxbaO2AD8T1AQlkEkJ
 ygAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tNi4Bos8lh7sJkc+jDcM0nJh0Q/L0O1bHURQWGbTkX4=;
 b=UdBiTDNsCRkKR70jQm6+9Cj5z42XGtO0nG3Q3HqaC6Zv3FelzP4NYW6V1KgLlM4pYK
 y9mZPDhyXUqxQmigD+9D2xL2fVFsDI+44lNdBUy7pE+Sp2B22mj5oFqPRAoySl0N+CaD
 MgxDdZi9sklj48cDQ8gZ05sM8sNQlvLzbTuLf/P6zz14GUho7CRCtELmNKDfOH5L/35Y
 uLJHg90jlm+tLsybmhGU/Xgtk3wrqH9ziQaEfzY3i+wL1I0AC5Xc+cH+Livra+VEo2IE
 Dimy8s7GN/lE0gJ6qL48luf8Ke+agM4GGeUwjhnF8cOf+a44RF5nYWTNSaaRAAXz/Mzn
 EMRg==
X-Gm-Message-State: AOAM531W9+VTCcDYzZIc01nW0C6Z/qARfcCbfSGjNPtd6PWWh9TDjt2h
 1lF/lAYpF3tC4p6ot1GjM+EynKM0vqbmVeOVcH4IRQ==
X-Google-Smtp-Source: ABdhPJzVucE3eg4ogr+EckrLlTAcmioko3LFLfBIUNJScv90rQfbKQAJbN/ec8tKzwtaa08Bv8HD0UYl2BesVajSqx8=
X-Received: by 2002:a25:bb52:: with SMTP id b18mr9308175ybk.506.1632438040561; 
 Thu, 23 Sep 2021 16:00:40 -0700 (PDT)
MIME-Version: 1.0
References: <23aeacb6-0cd9-d10f-76bc-3c9d33905daa@amd.com>
 <ca132183-e778-4a86-c81e-4d292e9d41a7@amd.com>
 <YUzl7qywbtVHipUT@casper.infradead.org>
In-Reply-To: <YUzl7qywbtVHipUT@casper.infradead.org>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 24 Sep 2021 00:00:29 +0100
Message-ID: <CAPj87rNqCuSvSZLuF=ULCXRpbDBQC+XAA+_Awa__4dvRkckamw@mail.gmail.com>
Subject: Re: BoF at LPC: Documenting the Heterogeneous Memory Model
 Architecture
To: Matthew Wilcox <willy@infradead.org>
Cc: Felix Kuehling <felix.kuehling@amd.com>, Linux MM <linux-mm@kvack.org>, 
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>, 
 Jason Gunthorpe <jgg@mellanox.com>, Jerome Glisse <jglisse@redhat.com>, 
 Ralph Campbell <rcampbell@nvidia.com>, "Theodore Ts'o" <tytso@mit.edu>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Mel Gorman <mgorman@techsingularity.net>, 
 Peter Zijlstra <peterz@infradead.org>, "Phillips,
 Daniel" <Daniel.Phillips@amd.com>, 
 "Sierra Guiza, Alejandro (Alex)" <Alex.Sierra@amd.com>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 23 Sept 2021 at 21:40, Matthew Wilcox <willy@infradead.org> wrote:
> On Thu, Sep 23, 2021 at 04:25:08PM -0400, Felix Kuehling wrote:
> > Change of plan: Instead of a BoF, this is now a session in the "GPU/media/AI
> > buffer management and interop MC" micro conference. Thank you Daniel Stone
> > for making that happen.
> > https://linuxplumbersconf.org/event/11/contributions/1112/
> >
> > It is scheduled for tomorrow (Friday) 08:40-10:00 Pacific, 11:40-13:00
> > Eastern, 15:40-17:00 UTC.
>
> That's up against:
>
>  Direct map management
> Vlastimil Babka, Mike Rapoport, Rick Edgecombe  11:30-12:15.
>
> Seems like a lot of the same people would want to be in both sessions.
> Maybe one could be moved?

Good point, and thanks, but it's hard to keep the longer slot whilst
moving it later; I wonder if we could move direct map management to
the final slot?

Cheers,
Daniel
