Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63418B557FB
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 22:58:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C2210E1E3;
	Fri, 12 Sep 2025 20:58:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="GgYY+K7+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83DAD10E1E3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 20:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=LJHK7dsTB/ThO7Z2EP/SeNUzVk4mffiuK9Sa9a/39e4=; b=GgYY+K7+wiV+MpG4kO15w5qH+k
 2WDSXuAg5k3G6ic4OnsA5tqxqUWWIkTVHHvl/OF3XUy4DakgAE6fiiA985ifFXW6TT5faR1uLIXG8
 B6ciUprU+MM+N892Ut5ku3Ln9p15qVGYJX54q5e1j2xxS0sOVSnCx0q5FyYxZFu0RIvJlbPzW4oKL
 SGU6xNfcRf8rc9vwKjxOUOEgPgVyfma6HNa9LbmE3Dom08imHl4z3AD8eeQr4BnijnnkZZXToFOBH
 2EgfzN80emdvF98CXoiOicwkmvywStj1NrGJRChqiwg88Fgz9WtqGjF0SYkPl2H70sRRkmCr7NGrG
 OFTEQkgw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uxAqp-0000000BXIW-2wyb; Fri, 12 Sep 2025 20:58:35 +0000
Message-ID: <de409ffc-100a-4120-b6b1-f89c59a97530@infradead.org>
Date: Fri, 12 Sep 2025 13:58:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "drm: Add directive to format code in comment"
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Javier Garcia <rampxxxx@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
References: <20250912130649.27623-2-bagasdotme@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250912130649.27623-2-bagasdotme@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 9/12/25 6:06 AM, Bagas Sanjaya wrote:
> Commit 6cc44e9618f03f ("drm: Add directive to format code in comment")
> fixes original Sphinx indentation warning as introduced in
> 471920ce25d50b ("drm/gpuvm: Add locking helpers"), by means of using
> code-block:: directive. It semantically conflicts with earlier
> bb324f85f72284 ("drm/gpuvm: Wrap drm_gpuvm_sm_map_exec_lock() expected
> usage in literal code block") that did the same using double colon
> syntax instead. These duplicated literal code block directives causes
> the original warnings not being fixed.
> 
> Revert 6cc44e9618f03f to keep things rolling without these warnings.
> 
> Fixes: 6cc44e9618f0 ("drm: Add directive to format code in comment")
> Fixes: 471920ce25d5 ("drm/gpuvm: Add locking helpers")
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks!

> ---
>  drivers/gpu/drm/drm_gpuvm.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index db9b089ef62c85..86853535fb7bd7 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -2432,8 +2432,6 @@ static const struct drm_gpuvm_ops lock_ops = {
>   *
>   * The expected usage is::
>   *
> - * .. code-block:: c
> - *
>   *    vm_bind {
>   *        struct drm_exec exec;
>   *
> 
> base-commit: 9a3f210737e958c3f45a4ce0d7f1ff330af3965f

-- 
~Randy
