Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 479EF349E83
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 02:18:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 372086E10B;
	Fri, 26 Mar 2021 01:18:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799226E10B
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 01:18:12 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 il9-20020a17090b1649b0290114bcb0d6c2so3483395pjb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 18:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=5ts/RtyuvkHpm/aA3JGUt0XeKOCBsewX4r2/UWxoyMk=;
 b=C2Hp3QTw+at15Yc0qkvzRwnuupxjw7MHsXDJcalOSP7wGEYiPYxIvuPCc3Yr+73uSs
 cgqCeUcenmI0nmkWDh8ffPJOGE4kaYM9BU8LMlONV1KuH9dK86blW4LWs5PrvHdqIP2i
 z3r2kWduHkrjU205YLglHR5krdVQipu0sahUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=5ts/RtyuvkHpm/aA3JGUt0XeKOCBsewX4r2/UWxoyMk=;
 b=S3GS+JTLBhxsmHL1emrZGdhtwODKveSrZAxP2Ewgfmg8fDvMegEykOGWsVk+mUtLPO
 OspZvX8C/Gx3IC4OKlH03R7mXUrTHu86yGAVco/SM4IPzBkOoaKGn01k4KsqpAOsAna9
 3g5RvD3Mu5A2j7fpVIjOXTbk0H/MoPjQ7F94nSyibWnsnIZrKRzLhL9S838s282FQe32
 25hevpapcnhyeQ56XZZx1A7/PlM4QUIPQJdECmChnX+C7/BD7ouYteH6WaRGSKfw5vsx
 jPFMC9lgfQTlOfDN8fC4dxVvYg2CJuBtEd3F+MfxXDrqQ7VHkOxWWANVr/osVQtmtuMN
 YSlA==
X-Gm-Message-State: AOAM533dNcHnR1H55NnxN1+qNIwtvGe2H4os+F0JVho0c5e9iUhry8ia
 2yGS34bA7Au0HkF0uepP30NZhA==
X-Google-Smtp-Source: ABdhPJzQbzhz8f8RBWBsiitzK/bL5vn/22BaGgSH1dFDjUggPfNgRexnbKOxTQvknlSNauRW7o3Eag==
X-Received: by 2002:a17:902:d486:b029:e6:f007:706 with SMTP id
 c6-20020a170902d486b02900e6f0070706mr12760096plg.83.1616721492156; 
 Thu, 25 Mar 2021 18:18:12 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:18a3:238:26c5:1521])
 by smtp.gmail.com with ESMTPSA id cv3sm6790946pjb.9.2021.03.25.18.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 18:18:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1614971839-2686-3-git-send-email-abhinavk@codeaurora.org>
References: <1614971839-2686-1-git-send-email-abhinavk@codeaurora.org>
 <1614971839-2686-3-git-send-email-abhinavk@codeaurora.org>
Subject: Re: [PATCH 3/3] drm/msm/dp: delete unnecessary debugfs error handling
From: Stephen Boyd <swboyd@chromium.org>
To: Abhinav Kumar <abhinavk@codeaurora.org>, dri-devel@lists.freedesktop.org
Date: Thu, 25 Mar 2021 18:18:10 -0700
Message-ID: <161672149027.3012082.2392067140198433025@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 khsieh@codeaurora.org, seanpaul@chromium.org, tanmay@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
 dan.carpenter@oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Abhinav Kumar (2021-03-05 11:17:19)
> Currently the error checking logic in the dp_debug module could
> pass zero to PTR_ERR and it causes the below kbot warnings:
> 
> drivers/gpu/drm/msm/dp/dp_debug.c:378 dp_debug_init()
> warn: passing zero to 'PTR_ERR'
> drivers/gpu/drm/msm/dp/dp_debug.c:387 dp_debug_init()
> warn: passing zero to 'PTR_ERR'
> drivers/gpu/drm/msm/dp/dp_debug.c:396 dp_debug_init()
> warn: passing zero to 'PTR_ERR'
> drivers/gpu/drm/msm/dp/dp_debug.c:405 dp_debug_init()
> warn: passing zero to 'PTR_ERR'
> 
> Debugfs functions are not supposed to be checked in the normal
> case so delete this code.  Also it silences the above Smatch
> warnings that we're checking for NULL when these functions only
> return error pointers.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Nice cleanup!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
