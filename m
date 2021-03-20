Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F41A342B4C
	for <lists+dri-devel@lfdr.de>; Sat, 20 Mar 2021 08:52:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 220CE6EB40;
	Sat, 20 Mar 2021 07:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2254 seconds by postgrey-1.36 at gabe;
 Sat, 20 Mar 2021 03:05:37 UTC
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C456EB2B;
 Sat, 20 Mar 2021 03:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Type:MIME-Version:
 References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+sIlNzRjvkor36vVjZVUZsfBi2atAGv+9aK56Y329n8=; b=Ls2jzXgBP4KXoqGUgnIwSsxHvE
 GieDQ0S8TGF6WrEVSGpcnxQmx3jZo63BZwxvGa7sOShad+0vd+swUeXsfh5vBxL5MrekGvnPQ05da
 VxnWpHCON6doBupk9CHbd8uTxpn76usxAKaT5D35XqLtUjVn7WD4pcxnnLhB14mufvUbkuHxpyKDx
 lTfixTHy6Y9iZG1hSxcXFt/bKytP0h8g4LoL28HIdvyCVJFTPC/u/isPUmmyU+WGChNUXEOwAukAd
 eXc5wBAy/untSvcFIUPjhru4IWwpXBTgtVzuwM5ah5zuGvo8KI0d9f7aZw6bWgKy8exozcRHA/fGH
 wIvG3wxQ==;
Received: from rdunlap (helo=localhost)
 by bombadil.infradead.org with local-esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lNRLL-001etm-0F; Sat, 20 Mar 2021 02:28:00 +0000
Date: Fri, 19 Mar 2021 19:27:58 -0700 (PDT)
From: Randy Dunlap <rdunlap@bombadil.infradead.org>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: Re: [PATCH V2] drm/amdgpu: Fix a typo
In-Reply-To: <20210318202414.10547-1-unixbhaskar@gmail.com>
Message-ID: <3cc678f2-36d1-1af1-5759-37aea82f41ea@bombadil.infradead.org>
References: <20210318202414.10547-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_192759_071088_BBA1C01B 
X-CRM114-Status: GOOD (  12.85  )
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "bombadil.infradead.org", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, 19 Mar 2021,
 Bhaskar Chowdhury wrote: > s/traing/training/
 > > ...Plus the entire sentence construction for better readability. > >
 Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com> > --- > Changes from
 V1: > Alex and Randy's sugge [...] 
 Content analysis details:   (-0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 NO_RELAYS              Informational: message was not relayed via SMTP
X-Mailman-Approved-At: Sat, 20 Mar 2021 07:52:38 +0000
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
Cc: guchun.chen@amd.com, airlied@linux.ie, Bhawanpreet.Lakha@amd.com,
 tao.zhou1@amd.com, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 ray.huang@amd.com, dri-devel@lists.freedesktop.org, Jiansong.Chen@amd.com,
 alexander.deucher@amd.com, Likun.Gao@amd.com, John.Clements@amd.com,
 christian.koenig@amd.com, Hawking.Zhang@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On Fri, 19 Mar 2021, Bhaskar Chowdhury wrote:

> s/traing/training/
>
> ...Plus the entire sentence construction for better readability.
>
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
> Changes from V1:
>  Alex and Randy's suggestions incorporated.
>
> drivers/gpu/drm/amd/amdgpu/psp_v11_0.c | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
> index c325d6f53a71..bf3857867f51 100644
> --- a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
> @@ -661,10 +661,10 @@ static int psp_v11_0_memory_training(struct psp_context *psp, uint32_t ops)
>
> 	if (ops & PSP_MEM_TRAIN_SEND_LONG_MSG) {
> 		/*
> -		 * Long traing will encroach certain mount of bottom VRAM,
> -		 * saving the content of this bottom VRAM to system memory
> -		 * before training, and restoring it after training to avoid
> -		 * VRAM corruption.
> +		 * Long training will encroach a certain amount on the bottom of VRAM;
> +                 * save the content from the bottom VRAM to system memory
> +                 * before training, and restore it after training to avoid
> +                 * VRAM corruption.

These 3 new lines are indented with spaces instead of tabs. Oops.  :(

(I may be too late with this comment -- sorry about that.)

> 		 */
> 		sz = GDDR6_MEM_TRAINING_ENCROACHED_SIZE;
>
> --
> 2.26.2
>
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
