Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBE11E65A8
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 17:14:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 328556E526;
	Thu, 28 May 2020 15:14:54 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C07F76E526
 for <dri-devel@freedesktop.org>; Thu, 28 May 2020 15:14:52 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id v11so504170ilh.1
 for <dri-devel@freedesktop.org>; Thu, 28 May 2020 08:14:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yIDw/uV1HgHlRds6XnPkvv3A35C2qOGXIu1RjiUeb9Y=;
 b=GfmFVWhFYmKN3SMrzUUG2yc9JKIuY/oYWuwPcqZai4gbzjUboqyX3aRWs2Av+1fIxd
 jP3lVhfkARxsnvqeeLQ4Sq1xbtfhL/OEbu05o2CIyJwZRjzPYBwj0M0jjN2LiUKjZuxE
 PTo2kVf+GxdjJ/wXuEcRSvBsorgqjFzlNb+c5GXS6vFZbbZEP3iDKYgZ41U/cX97VGPJ
 4Z4/eS84igXgpxjmss3rsvOqUwuiY5JoKbJ8jUbgxCw8XO/tRVCVRC72euO9RL57smVx
 kXJlx+GLJPZSzoqljxT5dQxhf9vf8Er1jtQL5jM+HCPUfj5VMQVi+Z+Z0hFfVouHkvVp
 R0CA==
X-Gm-Message-State: AOAM530EqJLQA7T3/br4aqUf/gVDSyeSOEbeg/qevCHclLkcsQGFZfLe
 1OYoCM/nn7vdSAvNCjmlxw==
X-Google-Smtp-Source: ABdhPJxAz1lpeRppgpo6BunFloCZvsPY8jFkCiVKE8KLqTvD/f0TRuU3AhQ7Ssf3Kpzq9YR+oZzPRQ==
X-Received: by 2002:a92:d151:: with SMTP id t17mr3335382ilg.101.1590678892145; 
 Thu, 28 May 2020 08:14:52 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id i13sm3442788ill.65.2020.05.28.08.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 08:14:51 -0700 (PDT)
Received: (nullmailer pid 82662 invoked by uid 1000);
 Thu, 28 May 2020 15:14:50 -0000
Date: Thu, 28 May 2020 09:14:50 -0600
From: Rob Herring <robh@kernel.org>
To: Sharat Masetty <smasetty@codeaurora.org>
Subject: Re: [PATCH 6/6] dt-bindings: drm/msm/gpu: Document gpu opp table
Message-ID: <20200528151450.GA82632@bogus>
References: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
 <1589453659-27581-7-git-send-email-smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1589453659-27581-7-git-send-email-smasetty@codeaurora.org>
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
 linux-kernel@vger.kernel.org, mka@chromium.org, dri-devel@freedesktop.org,
 freedreno@lists.freedesktop.org, georgi.djakov@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 14 May 2020 16:24:19 +0530, Sharat Masetty wrote:
> Update documentation to list the gpu opp table bindings including the
> newly added "opp-peak-kBps" needed for GPU-DDR bandwidth scaling.
> 
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
>  .../devicetree/bindings/display/msm/gpu.txt        | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
