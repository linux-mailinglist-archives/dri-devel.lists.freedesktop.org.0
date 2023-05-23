Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A955670DAF4
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 12:54:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 820B310E426;
	Tue, 23 May 2023 10:54:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9418410E426
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 10:54:51 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f42d937d2eso45692875e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 03:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684839289; x=1687431289;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/3WjXgsNuqa7/WDZdFims98+tDEhGOYyjkquS66fJPs=;
 b=GRPH6+30lAf//AJM9pWiPwjzF5resuZuGFlvxrJZigGSKauVKhCG67QuBSxJIpJm9U
 UqO8OPb6Abqjc4UsG8oYtlAIVKSqo2vxyuSfQyWCumvIMPaR4MwQJ7Z0Ju+VoZTxeBkO
 EVsOiQ08u3o1NpB8UMrRYa9vZDkXWkoowif5QStMG5MDDhTyatuwZIjDeaUeaXd+LFPl
 WGsxrky31gmDvppGRukw6KgXVPFf1ZjQBRuky5u4p7SmyiU17zYITeNa/9JloaRpIv9d
 v5SgyDMHDqwKmIQG8gD3aogHnsCvpF1NiJ+OODHOl7+VXJvQ8iCL3fFJ+AZeaMK0d+1H
 UrbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684839289; x=1687431289;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/3WjXgsNuqa7/WDZdFims98+tDEhGOYyjkquS66fJPs=;
 b=CD4+EJfgpaSwHuCFAbmKE/vPSWk9LY4iwFJQ9p6H2yG171a6qVhVuiGMw/uzKoRdqx
 gnfeTGwv/wQuaRVYkTUhGCt6LwSfQlW/TYmklDzOILhLWG3u3YzyPODEb7g8E1VjeCIR
 KY37qcwmTnSok4P1RaF5ouc7wnDEZCTnFk1zQdfh7yHeO0z8u9MQ82uF0+rcq+Jf+/WD
 VaNaiAbDz0/FdW1n89nUE/Di2OFZfIyYMwE66RiMjEX6foK4noTLuL7mXPf1M5GO2AjX
 Kd85m2GVbcUreA1qoHFnH9UVgnPuAN5HGOYaqm9YgC6Q60UDPHItr9T+EhTMT8srpwBN
 BOPQ==
X-Gm-Message-State: AC+VfDyHBX3MZbpX2aSaZ7BLB4ULAfEEh3+b22vlZq4Dna4lERStO8UH
 kaK9TcUZ+fp7uDS5xszCcz7bXQ==
X-Google-Smtp-Source: ACHHUZ6b5/OXboW+vGmX4shXePUEyDe7NDvlwNpoxezhMOSU58x9BGVbiVKV8bYmalzS4dohoNrkqQ==
X-Received: by 2002:a05:600c:2152:b0:3f6:938:1001 with SMTP id
 v18-20020a05600c215200b003f609381001mr2059704wml.8.1684839289624; 
 Tue, 23 May 2023 03:54:49 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 n22-20020a1c7216000000b003f60482024fsm6072367wmc.30.2023.05.23.03.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 03:54:48 -0700 (PDT)
Date: Tue, 23 May 2023 13:54:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH] drm/msm/dpu: signedness bug in
 dpu_encoder_phys_cmd_tearcheck_config()
Message-ID: <4abf38cc-20ab-4606-bc39-85255b8bdee8@kili.mountain>
References: <897779a0-1a1f-4193-9dd3-bc4f87e73e3c@kili.mountain>
 <wxfpgm77uxae5mhpht35m4kgrcx2givdp2duncxduz7hrlcofz@sp5wxfqx63fg>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wxfpgm77uxae5mhpht35m4kgrcx2givdp2duncxduz7hrlcofz@sp5wxfqx63fg>
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
Cc: Archit Taneja <architt@codeaurora.org>, Sean Paul <sean@poorly.run>,
 kernel-janitors@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Jordan Crouse <jordan@cosmicpenguin.net>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 22, 2023 at 10:47:50AM +0200, Marijn Suijten wrote:
> On 2023-05-22 10:48:01, Dan Carpenter wrote:
> > The "vsync_hz" variable is used to store negative error codes so it
> > needs to be signed for the error checking to work correctly.
> 
> Nicely spotted, but it it looks like we have more to fix then.  The type
> returned by dpu_kms_get_clk_rate() is u64:
> 

That's a good point.  Although the type of clk_get_rate() is unsigned
long so probably unsigned long is enough.

> - Perhaps the int used in this patch is too small (though 19.2MHz vsync
>   clock ought to fit);
> - That function should also return a signed number as part of this
>   contract.

What about if we just return 0 instead of -EINVAL?  That would match
what clk_get_rate() does.  Also let me change the type to unsigned long.

regards,
dan carpenter
