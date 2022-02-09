Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5564AFC86
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 20:00:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A1CC10E485;
	Wed,  9 Feb 2022 19:00:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A82AB10E468;
 Wed,  9 Feb 2022 19:00:09 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id 4so3441765oil.11;
 Wed, 09 Feb 2022 11:00:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fDo1r/oAxqHfurPzGBlPl/YM20/6x7pAbjkKdww5OT0=;
 b=xGvWpf/VzcLmuA04cGCXdKM45gQZY/tE8YtuQeRaVPXE2BIWyKqlqc3e7tKuUFuyQS
 JUHb+qH+8WKvDe+P6UGdb6xh1SMJmBLmRft1XkRWDTBOEv+sSpF1AVr4GyIQz19POp5b
 yEtMDYjUerQvfLPo2Sm/08b4fEHNfx54eJYK1Au+XTDnspnrqGNawGPdGdVNL83H9hUv
 oY8GAktVuRzv5UUeIzlTIxktFi1DzWn38FVnm0zCk3CoH0ML9yRqya64DyTnetDqhpwI
 YUspRVXObwPJ0UorfEGht4hV13gWw3d5UsSfo3saQJjEa6hUAils7XTUYrbl0RxzFU1k
 jlFg==
X-Gm-Message-State: AOAM533iLz4QnZE70PwQjfCRCs3LWgYSif2ft80bBWqDpB7Z+pPTgGNH
 1Z5UHYNmCm3haTtFaIPEOw==
X-Google-Smtp-Source: ABdhPJxY15c+Da0fY768XqjzQDsA/HiWOQkQlmhD90QefobfGlPxX1T6V1OdfxBgFpFqi87Fbg1h3Q==
X-Received: by 2002:a05:6808:120c:: with SMTP id
 a12mr2145418oil.118.1644433208827; 
 Wed, 09 Feb 2022 11:00:08 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id a128sm7069142oob.17.2022.02.09.11.00.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 11:00:07 -0800 (PST)
Received: (nullmailer pid 695621 invoked by uid 1000);
 Wed, 09 Feb 2022 19:00:06 -0000
Date: Wed, 9 Feb 2022 13:00:06 -0600
From: Rob Herring <robh@kernel.org>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: display: simple: Add sharp
 LQ140M1JW46 panel
Message-ID: <YgQPNlBtHNbu7FKG@robh.at.kernel.org>
References: <1644396932-17932-1-git-send-email-quic_sbillaka@quicinc.com>
 <1644396932-17932-2-git-send-email-quic_sbillaka@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1644396932-17932-2-git-send-email-quic_sbillaka@quicinc.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, thierry.reding@gmail.com, quic_mkrishn@quicinc.com,
 sam@ravnborg.org, krzysztof.kozlowski@canonical.com, quic_khsieh@quicinc.com,
 agross@kernel.org, devicetree@vger.kernel.org, quic_vproddut@quicinc.com,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com, swboyd@chromium.org,
 robh+dt@kernel.org, seanpaul@chromium.org, quic_kalyant@quicinc.com,
 dianders@chromium.org, linux-kernel@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 09 Feb 2022 14:25:29 +0530, Sankeerth Billakanti wrote:
> Add support for sharp LQ140M1JW46 display panel. It is a 14" eDP panel
> with 1920x1080 display resolution.
> 
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
> 
> Changes in v3:
>   None
> 
>  Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
