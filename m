Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EF72BBF3F
	for <lists+dri-devel@lfdr.de>; Sat, 21 Nov 2020 14:30:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF6946E9A8;
	Sat, 21 Nov 2020 13:30:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D7846E9A8
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Nov 2020 13:30:00 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id b16so9339973qtb.6
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Nov 2020 05:30:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LMYkpGZPQIEZX3RblcCkU4XSLIMzz4ngLSXNIvs/ag8=;
 b=dSIfvnVgw2XmLEJ9wkv0d392HaZuuPYUxmp3LQbT3UqAKqJNB3IwFm095lmypTdTpF
 fLu5kj0YIkOKNVrXer/LyytP6dncrk6N+3obpr+BPnVr4oKuGd8ZBN/9yPbMenrZf1DO
 VIfc+M3IRGcetvSUnJqZD8gZMSXMqDhXsMRYuOk+SQEt8akkfuS4KF5o9fvZJ0cIgdx3
 ySXneeg9rOPF5px93rsLZAHjTXUUIvGYh/j+iuFFXeofIp+FrjMOuXKjzdT0T/2Wt/8b
 0i1g4YhO9L9VJh4jr/2ZtVOyAF0u3Q2iwMo1PKu566OKTz8gmwOZkn1mAC3rELlqZrWy
 khWA==
X-Gm-Message-State: AOAM533ibVIpIJcVt8i3iz7otNmf3ph/Bhd6pVopnolEvkvprtmqlv1s
 xk6W1ken/edwwAYG7L7YNg==
X-Google-Smtp-Source: ABdhPJx/wQGCEQFWfBQ9eUPjaL7l5ZoIwci2QkBaFnEVkDtVziQnW/HiaxN4icHbgUFnNWX0bTuNQQ==
X-Received: by 2002:ac8:59c5:: with SMTP id f5mr13710063qtf.192.1605965399806; 
 Sat, 21 Nov 2020 05:29:59 -0800 (PST)
Received: from xps15 ([172.58.99.237])
 by smtp.gmail.com with ESMTPSA id z23sm1164116qtq.66.2020.11.21.05.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2020 05:29:58 -0800 (PST)
Received: (nullmailer pid 2128208 invoked by uid 1000);
 Sat, 21 Nov 2020 13:29:54 -0000
Date: Sat, 21 Nov 2020 07:29:54 -0600
From: Rob Herring <robh@kernel.org>
To: Cengiz Can <cengiz@kernel.wtf>
Subject: Re: [PATCH] dt-bindings: fsl-imx-drm: fix example compatible string
Message-ID: <20201121132954.GA2128113@robh.at.kernel.org>
References: <20201113150618.417424-1-cengiz@kernel.wtf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201113150618.417424-1-cengiz@kernel.wtf>
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
Cc: devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 13 Nov 2020 18:06:19 +0300, Cengiz Can wrote:
> Example `display-subsystem` has an incorrect compatible string.
> 
> Required properties section tells that developers should use
> "fsl,imx-display-subsystem" as "compatible" string but the example
> misses 'imx-' prefix.
> 
> Change example to have correct "compatible" string.
> 
> Signed-off-by: Cengiz Can <cengiz@kernel.wtf>
> ---
>  Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
