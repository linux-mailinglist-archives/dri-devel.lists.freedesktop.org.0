Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B89F75FC6B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 18:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAEFA10E33D;
	Mon, 24 Jul 2023 16:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1BDB10E339;
 Mon, 24 Jul 2023 16:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690217054; x=1721753054;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lMaCEtlky6+G2Qml4d+2fh4hc1YJEldCNV0Yg/t8zMo=;
 b=MUF9/S8xziIrwYRyjOhgwsBoRPTDzG1pX+onfQlfJi+xWmOEjmx9cK5m
 UNP4JzrozE5LZSndxSnLkpwseVr5rDSrhtsqvpvsq93BPk2tOH6PcMwkR
 SI6yKOU4oY8VAH3ACL5l5d4/sroot2UocpWZkZjh4XQ5AjV30ShzNJ8IC
 TZsAJyhtuSR+aoWitfjSOMveuLMAhsjA/ByLnoTbWbrZI5KL+XOigGixD
 WheTQnf+XKzZxBxl6sw39mGtZwMmwC87ir19s3v5Ni2UR8bf6lRav2aPJ
 KIwQZ/2rbCHJorN2dBWhG2xwAs+WU/zyiEoXzLUK/B1AroVIM5p0eo0ww g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="370160609"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="370160609"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 09:44:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="791028212"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="791028212"
Received: from gionescu-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.252.34.175])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 09:44:10 -0700
Date: Mon, 24 Jul 2023 18:44:07 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Fix an error handling path in
 igt_write_huge()
Message-ID: <ZL6qV615GmktUhMG@ashyti-mobl2.lan>
References: <7a036b88671312ee9adc01c74ef5b3376f690b76.1689619758.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a036b88671312ee9adc01c74ef5b3376f690b76.1689619758.git.christophe.jaillet@wanadoo.fr>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christophe,

> All error handling paths go to 'out', except this one. Be consistent and
> also branch to 'out' here.
> 
> Fixes: c10a652e239e ("drm/i915/selftests: Rework context handling in hugepages selftests")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Pushed to drm-intel-gt-next.

Thanks,
Andi
