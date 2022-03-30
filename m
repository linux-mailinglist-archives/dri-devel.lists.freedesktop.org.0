Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4BA4ECED6
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 23:29:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CD2B10EB3E;
	Wed, 30 Mar 2022 21:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D9BA10EB3E;
 Wed, 30 Mar 2022 21:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Zg8QPhUnRt/Hkzrm5cK28VQZtjF5KNBpCqCGW4kGEzU=; b=gp2AC7YFCqYvCrXLC6M96E8zJ/
 wdbCazu0QWFmo2yWhiwDbt3O0LjagGcn4IuiW3kKlxDkIAICH5QTHAPGTzAm5iufn2OXW7f6V7uUC
 ovTtJo90zGzlnzULvissA0T9mkrV+FgN3y5UukAnIkPA+2NW0mXIwC3z4AQSFzN7ArhKnHg2jrfLk
 5SmSXpGlRFRJA448QClwxbyejE3sJeyc7xXl+PwT+mdAJz5h4qSdzSF9Z0D4C0yzyyTUFpUsuFQnE
 HoorQOmrMhmn0sA8AKOlwOZznwnrRNuDhI/FZv1otAO07OJQgnEpqYVTBdF0wrcNLrRpqol7lcMAb
 TfMfNV/A==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nZfsH-001ah9-Na; Wed, 30 Mar 2022 21:29:05 +0000
Date: Wed, 30 Mar 2022 22:29:05 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Alex Sierra <alex.sierra@amd.com>
Subject: Re: [PATCH] drm/amdkfd: Add SVM API support capability bits
Message-ID: <YkTLoQNBEOlkJ1tV@casper.infradead.org>
References: <20220330212420.12003-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220330212420.12003-1-alex.sierra@amd.com>
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
Cc: rcampbell@nvidia.com, david@redhat.com, Felix.Kuehling@amd.com,
 apopple@nvidia.com, amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, dri-devel@lists.freedesktop.org,
 jgg@nvidia.com, akpm@linux-foundation.org, linux-ext4@vger.kernel.org,
 hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 30, 2022 at 04:24:20PM -0500, Alex Sierra wrote:
> From: Philip Yang <Philip.Yang@amd.com>
> 
> SVMAPISupported property added to HSA_CAPABILITY, the value match
> HSA_CAPABILITY defined in Thunk spec:
> 
> SVMAPISupported: it will not be supported on older kernels that don't
> have HMM or on systems with GFXv8 or older GPUs without support for
> 48-bit virtual addresses.
> 
> CoherentHostAccess property added to HSA_MEMORYPROPERTY, the value match
> HSA_MEMORYPROPERTY defined in Thunk spec:
> 
> CoherentHostAccess: whether or not device memory can be coherently
> accessed by the host CPU.

Could you translate this commit message into English?  Reviewing
Documentation/process/5.Posting.rst might be helpful.
