Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C42D5683A80
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 00:31:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B344310E05D;
	Tue, 31 Jan 2023 23:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E9A610E05D;
 Tue, 31 Jan 2023 23:31:42 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 s41-20020a05683043a900b0068bd63d34d0so1816115otv.6; 
 Tue, 31 Jan 2023 15:31:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oZpJmY/vAV7sw0j3Od6zi4sNY3jQ6TPDxOUi/nS8wLk=;
 b=xuW1U9qEkoDOAL5vBs7S5d06gQKvr0rK+ebGqgCTc6apU2eQ390qoAy935Cmk9yRVc
 6SnJE+wWMIMFl8DCK0YuY5JVn2jceI50D7yjqdFjc0ZxurOYqZck0Y3+sQOIGNfeDnez
 FiV1BbSoQpiFVuoM2Ti0mtoVh46GAYol9qrkszDCOeZIjLxIQJMfYixexZe1bSRXmnoN
 Aq8UmBCbAswkv6IW1wQP0suhwt/rnoBiE7TSvx8zk/33/SJm1LdZt/fZWPvK6j0uYp0u
 suHoSIyCXLaPFPp3oL5zNMrD7YKXSL3wXMLG3i/5vW4i/CcaeUNFBbqjZ/CLxcnucUMd
 6zEg==
X-Gm-Message-State: AO0yUKUSVxewXO/ZzTla+9HhO2ziiOkPVkRZ5oCM7Z1KzSLE7u6jr9AO
 Li5tmLZbNjmNXu3ZRvXUTQ==
X-Google-Smtp-Source: AK7set+BBz0gJ5CqmiuWeP3KhWKRo8i/jf4fw+lWqawuBRxcBnA1EmuHreG3qjsJ/5nSau954Woy3A==
X-Received: by 2002:a9d:1283:0:b0:68b:ca10:4ad with SMTP id
 g3-20020a9d1283000000b0068bca1004admr210144otg.31.1675207901843; 
 Tue, 31 Jan 2023 15:31:41 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 j14-20020a056830014e00b0068bce2c3e9esm3407206otp.14.2023.01.31.15.31.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 15:31:41 -0800 (PST)
Received: (nullmailer pid 2150609 invoked by uid 1000);
 Tue, 31 Jan 2023 23:31:40 -0000
Date: Tue, 31 Jan 2023 17:31:40 -0600
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: msm: Drop type from 'memory-region'
Message-ID: <167520789076.2150394.10201291390999389232.robh@kernel.org>
References: <20230125221357.3057655-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230125221357.3057655-1-robh@kernel.org>
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 25 Jan 2023 16:13:56 -0600, Rob Herring wrote:
> 'memory-region' is a common property and already has a type.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!

