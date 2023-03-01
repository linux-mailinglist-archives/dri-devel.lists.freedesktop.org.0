Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 744086A6CF6
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 14:20:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B63FE10E0D7;
	Wed,  1 Mar 2023 13:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 141B310E0D7
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 13:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677676850; x=1709212850;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gRyovYw2bincHsyBjjk5UlsS+i5hk9fN/di2Orn6DqU=;
 b=l2kPQWBpIRwx4LHDV3UiajN5o4bDFCosVhmNA3VBqgtBijmXmC6E+rIu
 4AG9iRKK+XI4zz3ErSadxoHGuM9HTWziBgDm2Tm04QoAiZYv8j36bvg1D
 99ZyZidmPGWbLY+69yKJ5vNNKRcG2kRXKREpJ2Zug2Mq7j5R5gc8TIGxW
 e5Slm34uM6NnHdRzEBJ12OxUkOJXfqECjAqAwXJLBzRCUcEcJV/kL2YsT
 xufvyvDenhyX/PFmHsczY5RlEW2BI/QP7FubyrM6uJxBL5daFDgzNRtGZ
 313hLRPqg0VF9YEYRMeYV8Ky4EbhwgJTK7LnjxpFAeQqs7EHvrG6OeIrT Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="335898456"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; d="scan'208";a="335898456"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 05:20:49 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="706981392"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; d="scan'208";a="706981392"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 05:20:48 -0800
Date: Wed, 1 Mar 2023 14:20:46 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH 1/6] habanalabs: add helper function to get vm hash node
Message-ID: <20230301132046.GE3815307@linux.intel.com>
References: <20230227111306.3985896-1-ogabbay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230227111306.3985896-1-ogabbay@kernel.org>
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
Cc: Tomer Tayar <ttayar@habana.ai>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 27, 2023 at 01:13:01PM +0200, Oded Gabbay wrote:
> From: Tomer Tayar <ttayar@habana.ai>
> 
> Add a helper function to search the vm hash for a node with a given
> virtual address.
> As opposed to the current code, this function explicitly returns NULL
> when no node is found, instead of basing on the loop cursor object's
> value.
> 
> Signed-off-by: Tomer Tayar <ttayar@habana.ai>
> Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
> Signed-off-by: Oded Gabbay <ogabbay@kernel.org>

Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

