Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1B7496812
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jan 2022 00:05:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB23410E50A;
	Fri, 21 Jan 2022 23:05:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B4B10E4E0;
 Fri, 21 Jan 2022 23:05:48 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id s22so15663681oie.10;
 Fri, 21 Jan 2022 15:05:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RN1PlPeJHCI4F7ORlXAuoTAl+I+ftCy1+niCC1rlCkY=;
 b=pfJPT3EGTVSEv4DOMZ1GU4TBJlDtbKcOL12KvnlrIHtxJeRB3pGoYlTuJsGnS7pD3L
 33IQ8NwJP1ef4Dy3+YBFZHI4RMedDLtea/9qm3DI4RrcObVIeJtvqkNJBv+GXcHewI9k
 Iu49L9v6u2+bCl9XDz8jyrPZZobEL5NqivfrtRNdoahJZsk0qT2u+CoHUHwsNFHwQiFl
 HEKPzYsXpHkaRE9GM91uhOABHTCptnD5PTNW0MEXdaq2jduelAsdtDzF1jBrCy+rkNU7
 ToljjbYO00J/47LE3U1mqcPoei+ssGKRDdXWewg0rFjepACM1bX0JB3ENUCe0TG5Iu9D
 dITw==
X-Gm-Message-State: AOAM533jiZYgrqu67mZNPT1hsW+zppeYp3TIMvgI/zfLpCfXR0qamBif
 axnQgLuMe90ybp44sbbtcA==
X-Google-Smtp-Source: ABdhPJxg+kJTfrdEMoJ2RPhH4/awPHWoZgmR50vnrKMk9V6UVZeKVUfwcfBU0Ncf2zWIBlgjnHORJA==
X-Received: by 2002:a05:6808:158e:: with SMTP id
 t14mr2315268oiw.31.1642806348159; 
 Fri, 21 Jan 2022 15:05:48 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bo13sm1605874oib.43.2022.01.21.15.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 15:05:47 -0800 (PST)
Received: (nullmailer pid 1775815 invoked by uid 1000);
 Fri, 21 Jan 2022 23:05:46 -0000
Date: Fri, 21 Jan 2022 17:05:46 -0600
From: Rob Herring <robh@kernel.org>
To: David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH] dt-bindings: msm/mdp4: convert to yaml format
Message-ID: <Yes8SiV9SBF+S3OH@robh.at.kernel.org>
References: <20220109171814.16103-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220109171814.16103-1-david@ixit.cz>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, ~okias/devicetree@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 09 Jan 2022 18:18:13 +0100, David Heidelberg wrote:
> Convert mdp4 binding into yaml format.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../devicetree/bindings/display/msm/mdp4.txt  | 114 ----------------
>  .../devicetree/bindings/display/msm/mdp4.yaml | 124 ++++++++++++++++++
>  2 files changed, 124 insertions(+), 114 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/mdp4.txt
>  create mode 100644 Documentation/devicetree/bindings/display/msm/mdp4.yaml
> 

Applied, thanks!
