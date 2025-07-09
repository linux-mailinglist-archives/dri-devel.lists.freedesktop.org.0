Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D600AFDF72
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 07:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C06A110E717;
	Wed,  9 Jul 2025 05:45:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="Z++zlc7p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4ADC10E717
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 05:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=8mQixtg1Mr09Oj1fV1YdmAgl6VShD1E1tCnIfiueisQ=; b=Z++zlc7p2qGA9D5ZRKC9YNbFY3
 yAzcvK+JZPvn1GmRb1OSjW6ozZEXI3NpFDj8dZCopEyOQ6weJXPh3i0IY9OTiAhF1rhcvUMAisBG3
 PQ1Y7sq7YCdZbqhL4sMorjXOpn+HH/Z1GSzxuTke8tVAnEpRFH8u/mP2j52XtpVrG4g8YbxAu8X4l
 XbgY1SHLIj5HwrVJxMh+TozTd/ffALgTqlQALyU9FdeU9V6vNj/MCo0DvX30Vy1OUT7kZYnF5nBTM
 ZcdzqLbfn/FljnGWqE9g6W+Sj0m0b2lm6xSnm0NqThARVN9/9yjUtvFkgI3/Buhp3+nzhdyXSdMNw
 6hFGMK7g==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
 by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uZNcB-00000002f03-2geF; Wed, 09 Jul 2025 05:45:07 +0000
Message-ID: <d1fd1efb-58d8-4387-9eb4-3f049a585459@infradead.org>
Date: Tue, 8 Jul 2025 22:45:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] drm: Add missing struct drm_wedge_task_info kernel
 doc
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, airlied@gmail.com,
 simona@ffwll.ch, Raag Jadav <raag.jadav@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com
References: <20250704190724.1159416-1-andrealmeid@igalia.com>
 <20250704190724.1159416-2-andrealmeid@igalia.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250704190724.1159416-2-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 7/4/25 12:07 PM, André Almeida wrote:
> Fix the following kernel doc warning:
> 
> include/drm/drm_device.h:40: warning: Function parameter or struct member 'pid' not described in 'drm_wedge_task_info'
> include/drm/drm_device.h:40: warning: Function parameter or struct member 'comm' not described in 'drm_wedge_task_info'
> 
> Fixes: 183bccafa176 ("drm: Create a task info option for wedge events")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/lkml/20250618151307.4a1a5e17@canb.auug.org.au/
> Reviewed-by: Raag Jadav <raag.jadav@intel.com>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
> v4: Dropped "the" from the start of the sentence
> v3: Make it consistent with drm_device member description
> v2: Add Reported-by tag
> ---
> ---
>  include/drm/drm_device.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index 08b3b2467c4c..a33aedd5e9ec 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -35,7 +35,9 @@ struct pci_controller;
>   * struct drm_wedge_task_info - information about the guilty task of a wedge dev
>   */
>  struct drm_wedge_task_info {
> +	/** @pid: pid of the task */
>  	pid_t pid;
> +	/** @comm: command name of the task */
>  	char comm[TASK_COMM_LEN];
>  };
>  


Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

-- 
~Randy
