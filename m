Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E121A4988
	for <lists+dri-devel@lfdr.de>; Fri, 10 Apr 2020 19:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8D06ED2E;
	Fri, 10 Apr 2020 17:48:58 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E04B6ED31
 for <dri-devel@freedesktop.org>; Fri, 10 Apr 2020 17:48:57 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id o25so1966966oic.11
 for <dri-devel@freedesktop.org>; Fri, 10 Apr 2020 10:48:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+zNuF3LiP7kvgVV1lvcUDcmbeJ3DBvPeuSAiKMFaGnc=;
 b=qjz+4wC35l198UoTWO3s6CiDfDyXx0hzr3OxFxEAJTjty7kShHszR0ML3OcSnmY0iI
 O39oEv9gtF1Ygm5QqZx09SDOZNm50MQAhBSjZJiHaqV1+d/JIPFE4j0CC6GgjCIJxgFf
 KnyhG+Kg6djTfQGC5xbv7LQOIPVvHpn/0cM+0DQo35oiJNQL4DndomRUpNGwGcYSh4ky
 cZ8wyLpkgFPL4h/CLTzF2svsIvr06XNuQFrxWwG6bo3UujuIvTNX+Ewg5ILEpVdgwKGZ
 JD3jNE1d0psXEjhCtKVg/2EYmfv33ODOvEsLZ6nXSFFvjhsdeXuA6bllVW3nO7Z0yL23
 Iirw==
X-Gm-Message-State: AGi0PubkO8Wc1nmsjNkalizqsE3A0paFJPjyS7/sAohDafCPqkFYLq0A
 urkcRZCK1PYDELP1jwoJKQ==
X-Google-Smtp-Source: APiQypIt0cEpMExqzLdxjcdCSCFkFwJgM3Jj7xITc2xbl8Ot3NQLeW5lxcuMi7lDACDtIRWU3GO5eQ==
X-Received: by 2002:aca:3745:: with SMTP id e66mr3965165oia.153.1586540936614; 
 Fri, 10 Apr 2020 10:48:56 -0700 (PDT)
Received: from rob-hp-laptop (ip-173-126-55-226.ftwttx.spcsdns.net.
 [173.126.55.226])
 by smtp.gmail.com with ESMTPSA id u17sm1523713oiv.21.2020.04.10.10.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2020 10:48:56 -0700 (PDT)
Received: (nullmailer pid 28391 invoked by uid 1000);
 Fri, 10 Apr 2020 17:48:53 -0000
Date: Fri, 10 Apr 2020 11:48:53 -0600
From: Rob Herring <robh@kernel.org>
To: Sharat Masetty <smasetty@codeaurora.org>
Subject: Re: [PATCH 5/5] dt-bindings: drm/msm/gpu: Document OPP phandle list
 for the GPU
Message-ID: <20200410174853.GA28335@bogus>
References: <1585641353-23229-1-git-send-email-smasetty@codeaurora.org>
 <1585641353-23229-6-git-send-email-smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1585641353-23229-6-git-send-email-smasetty@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, saravanak@google.com,
 linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 linux-kernel@vger.kernel.org, mka@chromium.org, dri-devel@freedesktop.org,
 viresh.kumar@linaro.org, freedreno@lists.freedesktop.org, sibis@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 31 Mar 2020 13:25:53 +0530, Sharat Masetty wrote:
> Update the documentation for listing the multiple optional GPU and the
> DDR OPP tables to help enable DDR scaling.
> 
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
>  .../devicetree/bindings/display/msm/gpu.txt        | 63 +++++++++++++++++++++-
>  1 file changed, 61 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
