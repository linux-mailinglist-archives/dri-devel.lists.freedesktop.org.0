Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A767E788FDC
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 22:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907C110E6DB;
	Fri, 25 Aug 2023 20:31:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D3710E6DB
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 20:31:53 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1bf1935f6c2so9748905ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 13:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692995513; x=1693600313;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QbK8/oWiBIVoC/jcfdbNeWkeAfPt8MN35+9MR6xg494=;
 b=SxnUxYAjr8JBfiuonQG266dkmNZ+5hxrKSEPI6Vea0liNat+HCYvAi9Sce60JmkTTS
 NkmK35yvV3w2ctId7cF5uOOTYxJncbBpHmtzNTtx2jY11mbHnkmKu+9ep3ALYca2Ryw7
 eNv610zPxC5b6fT7ht5Sbi2rsFWV6WE3Y2AWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692995513; x=1693600313;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QbK8/oWiBIVoC/jcfdbNeWkeAfPt8MN35+9MR6xg494=;
 b=Z9EsHBDuiIXyIeOqKxAHEzMm8BhYV76fDzXVcrGXGJlyM5kbmDuIokU09cmKg3+tiQ
 EhcUIlAndk6ZBGz1JRyjLqsHTd7ysktUpq9jp/dWl1E6kIm+mMNiX9fGkjLk1bPp6o+r
 FT0jA2hMuNCn05BYCZRDEM/DZJaXvOO3IeaZgzAGOd/gwEwIWzdC8vFRaXCYZrFIUebI
 MrHn96+cs4ujJv/RbxBp9o7jkxTGWG9gqY+MRETSvgcx3shgA7UtjisgJBH8fkVpx2bk
 M8PG1wLPBdGVC5Pul1EVZqUd4Sz548k592IftcykYJiIh/C8vGQSrqOPQxriCuwzOA0C
 E80Q==
X-Gm-Message-State: AOJu0Yw3C8aHRUi1arXEThhMhehkgj2Jp1Cfl77FpGwZKNVlJ2iUohLw
 ZMSswqa4fPOO7Bf7w7rqSL6C8g==
X-Google-Smtp-Source: AGHT+IFkHOomC5fDsX51fb+z+kMZfOW5mXRYL7CREwQSq5bU6xwcUnwTW+gBCrrDOo3EofQSeq3+Nw==
X-Received: by 2002:a17:902:d511:b0:1bb:55be:e198 with SMTP id
 b17-20020a170902d51100b001bb55bee198mr27660915plg.0.1692995513531; 
 Fri, 25 Aug 2023 13:31:53 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 x2-20020a170902b40200b001bba3650448sm2158060plr.258.2023.08.25.13.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 13:31:52 -0700 (PDT)
Date: Fri, 25 Aug 2023 13:31:52 -0700
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH] habanalabs/gaudi: refactor deprecated strncpy
Message-ID: <202308251321.E19D664F0@keescook>
References: <20230824-strncpy-drivers-accel-habanalabs-gaudi-gaudi-c-v1-1-a7fb9054734c@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824-strncpy-drivers-accel-habanalabs-gaudi-gaudi-c-v1-1-a7fb9054734c@google.com>
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
Cc: Oded Gabbay <ogabbay@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 24, 2023 at 08:41:26PM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> A suitable replacement is `strscpy` [2] due to the fact that it
> guarantees NUL-termination on its destination buffer argument which is
> _not_ the case for `strncpy`!

For strncpy replacements the commit log needs to always address 2 items,
and really get spelled out for reviewers since the diff context is
rarely enough information to judge the safety of the change:

1) How did you determine that the destination buffer does or does not
   require %NUL termination?

2) How did you determine that the destination buffer does or does not
   need to be %NUL padded?

> 
> Link: www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings[1]
> Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> Note: build-tested only
> ---
>  drivers/accel/habanalabs/gaudi/gaudi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/accel/habanalabs/gaudi/gaudi.c b/drivers/accel/habanalabs/gaudi/gaudi.c
> index 056e2ef44afb..f175456cdef0 100644
> --- a/drivers/accel/habanalabs/gaudi/gaudi.c
> +++ b/drivers/accel/habanalabs/gaudi/gaudi.c
> @@ -660,7 +660,7 @@ static int gaudi_set_fixed_properties(struct hl_device *hdev)
>  	prop->pcie_dbi_base_address = mmPCIE_DBI_BASE;
>  	prop->pcie_aux_dbi_reg_addr = CFG_BASE + mmPCIE_AUX_DBI;
>  
> -	strncpy(prop->cpucp_info.card_name, GAUDI_DEFAULT_CARD_NAME,
> +	strscpy(prop->cpucp_info.card_name, GAUDI_DEFAULT_CARD_NAME,
>  					CARD_NAME_MAX_LEN);
>  
>  	prop->max_pending_cs = GAUDI_MAX_PENDING_CS;
> @@ -8000,7 +8000,7 @@ static int gaudi_cpucp_info_get(struct hl_device *hdev)
>  		return rc;
>  
>  	if (!strlen(prop->cpucp_info.card_name))
> -		strncpy(prop->cpucp_info.card_name, GAUDI_DEFAULT_CARD_NAME,
> +		strscpy(prop->cpucp_info.card_name, GAUDI_DEFAULT_CARD_NAME,
>  				CARD_NAME_MAX_LEN);

When I look at this string, I see it gets copied out to userspace
directly:

static int hw_ip_info(struct hl_device *hdev, struct hl_info_args *args)
{
        struct hl_info_hw_ip_info hw_ip = {0};
	...
        memcpy(hw_ip.card_name, prop->cpucp_info.card_name,
                min(CARD_NAME_MAX_LEN, HL_INFO_CARD_NAME_MAX_LEN));
	...
        return copy_to_user(out, &hw_ip,
                min((size_t) size, sizeof(hw_ip))) ? -EFAULT : 0;
}

So if "prop" isn't zero initialized, this is now a kernel memory content
exposure, due to the lack of padding.

If I track the allocation of "hdev" all the way back, I can see it is,
however, zero initialized:

static int create_hdev(struct hl_device **dev, struct pci_dev *pdev)
...
        hdev = kzalloc(sizeof(*hdev), GFP_KERNEL);


But since it's still sent via copy_to_user(), the more defensive
replacement here should be strscpy_pad().

(Also, I think you can do all three files in the same patch -- it's
operating on the same struct and in the same way.)

-Kees

-- 
Kees Cook
