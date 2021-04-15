Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CC1360A27
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 15:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E276E509;
	Thu, 15 Apr 2021 13:08:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A5F6EA70
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 13:08:58 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id j3so11605233qvs.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 06:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Av9lBh4ytQJLZDgCvCumBBm678aTIHFLWXFB6bVJiGk=;
 b=MjHrmHj3CxKqGBd/wHR9VR1eOkob2QYJ9Aeq0rkN3vePFB+JTxwCpU8ycDTeFNwpUZ
 t7JcUD3aKSEM1MTXPKb7eliUDURUr0m7JkhZTnCQ+QggTWSHzPT15NLUiMoFRvLsvTcp
 MujH3kN7+0dHS3pvIhfruu731O3qCDMiNH5zLY0q+lHp1ki7z7UJTI8WYoNXe5gESNrA
 miDO6KrL0zb2AMzSf7cG2g17pL+kj6Eri7EWR9XKqg7rc8sYsyIyaJqwnbH4fHuYzuN8
 yDLUup0nMkjt6ALnPeExIWExt0Y+B/bNa/A44hKD/B09wIPf27z3NhhTXp+IX7XC5SYl
 WH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Av9lBh4ytQJLZDgCvCumBBm678aTIHFLWXFB6bVJiGk=;
 b=Ya4p2TbGkalvpFQxD7s8+YlzpDdgNKFGZvVb0vdx00smstYthspoCjhROEvvSEIzxQ
 1G+rO/jiGTITaO4w7C1UBIKPt4PEhzrTISA/yORKXdZ4kyXHrpoSExkw2zpCrTgNrZzf
 wKs277mcImH3tz2WL2hcHfcdN/PvhwebkBs72si97ATcp5Yajd8juo0+ArllqdYmnh49
 eLsuGVDyD6peY9sol7VAOQhziA40LRZdImR0yK22v48H6CFsvZPUERgOPsmGqrkak6h6
 VeqEEUWIUQ7apmYbTUURkk1AjjYockwyZeCihHwtEZD+iGuQE6jUi61jKPqfNgwO7AJv
 Ikuw==
X-Gm-Message-State: AOAM533MwNUAqLml5PycJdsd3K9/bBK6ana9rMeQ+FJALbT9K6PtOlW+
 SCIOfqzYzpZad0TKoYCz3PcmEA==
X-Google-Smtp-Source: ABdhPJwBZbvTOtQ7JrjyHedhunLhY1PtV+CdCC/35yHj+3yXUnmSXDK4vTITiMNWCEVv9JExSNyNAg==
X-Received: by 2002:a05:6214:4b0:: with SMTP id
 w16mr2924175qvz.54.1618492137741; 
 Thu, 15 Apr 2021 06:08:57 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.115.133])
 by smtp.gmail.com with ESMTPSA id l24sm1755539qtp.18.2021.04.15.06.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 06:08:56 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1lX1jr-006k2Q-Q4; Thu, 15 Apr 2021 10:08:55 -0300
Date: Thu, 15 Apr 2021 10:08:55 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the vfio tree with the drm tree
Message-ID: <20210415130855.GR227011@ziepe.ca>
References: <20210415164734.1143f20d@canb.auug.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210415164734.1143f20d@canb.auug.org.au>
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
Cc: Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 15, 2021 at 04:47:34PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the vfio tree got a conflict in:
> 
>   drivers/gpu/drm/i915/gvt/gvt.c
> 
> between commit:
> 
>   9ff06c385300 ("drm/i915/gvt: Remove references to struct drm_device.pdev")
> 
> from the drm tree and commit:
> 
>   383987fd15ba ("vfio/gvt: Use mdev_get_type_group_id()")
> 
> from the vfio tree.
> 
> I fixed it up (I used the latter version) and can carry the fix as
> necessary.

Yes that is right, thank you

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
