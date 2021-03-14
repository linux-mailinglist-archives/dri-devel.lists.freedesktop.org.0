Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A45E33A333
	for <lists+dri-devel@lfdr.de>; Sun, 14 Mar 2021 06:56:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F7F89E3F;
	Sun, 14 Mar 2021 05:56:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6113F89E3F;
 Sun, 14 Mar 2021 05:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=Xefqu3vKkF6QxL4rotZMwFoLVYhsZK1Asts4uTOyJk8=; b=Bfhvt6lRYJ1q74kvEcx8wTyFoE
 LnZkEEeQ6mvIgM6Il3sBuRnVIKman37MEzTk9a3uBSNZtZJmCY38/wTP9B93YN0n7u5by6NGMI79f
 eIAeLpvh+zxbj6g6ukwGWLu5XLXhSAZj/PfMiP97obLF0Py3PIxwVmhwIB6V9VB/y0TV1ZdtcNdH5
 cJ+UzMPuodIvEgONGcmp3SBsLal2XohLt2oZXwiltlO+7eu1bs6dHRoPwj0zhCKYuklN/quCzj6Ia
 Gp06/XAF/4xV9cT+E79ZtXgp9hisYbfmRgN01pzyyUJrxkyh2SguTXWNFY++QNBIYZwLQTGSHD11g
 B7ZKOc8w==;
Received: from merlin.infradead.org ([2001:8b0:10b:1234::107])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLJk0-00DwJe-Gx; Sun, 14 Mar 2021 05:56:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=Xefqu3vKkF6QxL4rotZMwFoLVYhsZK1Asts4uTOyJk8=; b=XPThki4oj5XZ/Ldj9sJKNOZUs5
 R2hzmrSuXfIbd7dL6vAp7G2vTuVpjRfMghkAGqmz20Gl19LAzbKvPBXqdp19qPiofOqSB2YkRXUhx
 Kn9Pl/ZbCazdZAjSlJli+ZfJdlqoxVfGI018IJ23g+qmUkkmaRSaabhRE6I7ZVY6d67F+iU+ftqYV
 iGHAeOsoq2L0AOcFnNCw57gUeyiRtb9u+VeCJ1LiJ0ZtnS6bskQzaJ2zXX0r7D/DvWkogUAFcJgaJ
 alr86IhbXZmIWXeJWyxGil8gmotozfwTxO6pLmSkOMBF2pbDXNtc9W4RmDAt8NIHP2YjSSjENVKOj
 pAtzlrXg==;
Received: from [2601:1c0:6280:3f0::9757]
 by merlin.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lLJjW-001B1C-G6; Sun, 14 Mar 2021 05:56:10 +0000
Subject: Re: [PATCH] gpu: drm: i915: gt: Rudimentary typo fix in the file
 intel_timeline.c
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, airlied@linux.ie,
 daniel@ffwll.ch, chris@chris-wilson.co.uk, tvrtko.ursulin@intel.com,
 mika.kuoppala@linux.intel.com, maarten.lankhorst@linux.intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20210314044303.9220-1-unixbhaskar@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <26e08f86-47a9-fd3d-2d68-5b53c2e1d692@infradead.org>
Date: Sat, 13 Mar 2021 21:56:05 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210314044303.9220-1-unixbhaskar@gmail.com>
Content-Language: en-US
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/13/21 8:43 PM, Bhaskar Chowdhury wrote:
> 
> s/bariers/barriers/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  drivers/gpu/drm/i915/gt/intel_timeline.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_timeline.c b/drivers/gpu/drm/i915/gt/intel_timeline.c
> index 8015964043eb..2b921c1796dc 100644
> --- a/drivers/gpu/drm/i915/gt/intel_timeline.c
> +++ b/drivers/gpu/drm/i915/gt/intel_timeline.c
> @@ -416,7 +416,7 @@ void intel_timeline_exit(struct intel_timeline *tl)
>  	spin_unlock(&timelines->lock);
> 
>  	/*
> -	 * Since this timeline is idle, all bariers upon which we were waiting
> +	 * Since this timeline is idle, all barriers upon which we were waiting
>  	 * must also be complete and so we can discard the last used barriers
>  	 * without loss of information.
>  	 */
> --


-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
