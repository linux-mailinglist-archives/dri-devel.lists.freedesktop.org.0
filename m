Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9F929F66A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 21:48:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B857A6E901;
	Thu, 29 Oct 2020 20:48:45 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774636E901
 for <dri-devel@freedesktop.org>; Thu, 29 Oct 2020 20:48:44 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id o3so3317313pgr.11
 for <dri-devel@freedesktop.org>; Thu, 29 Oct 2020 13:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7jTNHive/FLwf9ZZT3i6CSw/O2mDxcoGdERzu325nls=;
 b=S1eLSOvxPle2SWTXmcWkjdxAG8gKeMEQNERefUSZtQOj35IZKWi6zQ3XA/x7yozwz8
 SuJqxRhbB4i6YZ/pUVv4PdoQ6A/WOXxwmF1BPT1/90DX/CA1WzuJ0SBOp9PqwSiCKXSH
 F0G3QbbwVleLe5Wk2wNrW1vW/731JkCOacLvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7jTNHive/FLwf9ZZT3i6CSw/O2mDxcoGdERzu325nls=;
 b=DU2IlE5HKhcbuOTGQ67B0VWBUXGBjU1z3KUFCx0Y4kg3VE64jS0eTTt9md63wiu4B0
 HlOpLsGgwRlScC9GKncaFcfNBxp7Gm367rJrmGUqfAbxHyuU/ELTdd0TLM62zOoFAfAa
 D+yJ3+QgPCyGXRWO/EE7tmrGkBpqq1eR9UUXYOiAOgXXScHXXbUjWY3E6/0kjqVM1gl9
 O/Jl2UoITXfuZs5utGHtUJ3/Q7UjTrOYgEPoRrUGyjj5z0ms3StY9jo3Q5WZ4Q7H2KFk
 A2WlRmBcdpsb6DzeOJkpfX+M3KIx3oQhw1zEUyE9OHumqZO8CGPVnc6K7TidrmlTiXDw
 Tgtw==
X-Gm-Message-State: AOAM532ApsphjsrSq2b8HwYv3bsmE7uVxFbIbfz6tAMkL6erVast58IV
 mVy1w2+oTq/mh5J3ccWH2ej1Ww==
X-Google-Smtp-Source: ABdhPJyNFMcPbWUco+Y+QNwEzgo/c6cxhTHy+B3buEgXZaS5imhK9G19CfKi/1d1jqh/zqA5P53RtQ==
X-Received: by 2002:a17:90a:6984:: with SMTP id
 s4mr1082688pjj.206.1604004524081; 
 Thu, 29 Oct 2020 13:48:44 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
 by smtp.gmail.com with ESMTPSA id e5sm808565pjd.0.2020.10.29.13.48.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2020 13:48:43 -0700 (PDT)
Date: Thu, 29 Oct 2020 13:48:42 -0700
From: mka@chromium.org
To: Akhil P Oommen <akhilpo@codeaurora.org>
Subject: Re: [v4,1/3] drm/msm: Add support for GPU cooling
Message-ID: <20201029204842.GC1855806@google.com>
References: <1603958841-20233-1-git-send-email-akhilpo@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1603958841-20233-1-git-send-email-akhilpo@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dianders@chromium.org, linux-kernel@vger.kernel.org, dri-devel@freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 29, 2020 at 01:37:19PM +0530, Akhil P Oommen wrote:
> Register GPU as a devfreq cooling device so that it can be passively
> cooled by the thermal framework.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>

Wait, I did not post a 'Reviewed-by' tag for this patch!

I think the patch should be ok, but I'm still not super happy
about the resource management involving devfreq in general (see
discussion on https://patchwork.freedesktop.org/patch/394291/?series=82476&rev=1).
It's not really something introduced by this patch, but if it ever
gets fixed releasing the cooling device at the end of
msm_gpu_cleanup() after everything else might cause trouble.

In summary, I'm supportive of landing this patch, but reluctant to
'sign it off' because of the above.

In any case:

Tested-by: Matthias Kaehlcke <mka@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
