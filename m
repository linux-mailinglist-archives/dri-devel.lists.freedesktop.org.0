Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FAE375909
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 19:14:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C6D6ECCD;
	Thu,  6 May 2021 17:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C2D6ECCD
 for <dri-devel@lists.freedesktop.org>; Thu,  6 May 2021 17:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620321257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WHt7BDD9RIfUmR/n7ErimXYampz84sK/Te7hVMTDzGg=;
 b=CRuWrRvkOCfPzXtg9ymWaw0cx/Hh/leOudnlaqXJ0Fdcg7u2jHMI+qIgapBCT9r33BkyKm
 IahmBTaO6dIpRu9yvXZPvpuG+vGZhlzmxjeA2ja3TpaGuUtAd7nIoRpiGAYEbwJt3gpZjV
 bhnvy/6rFGHBLzw226RAnLJf50UD7eA=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-GIfzUfksMbKpI4_IBYe_bw-1; Thu, 06 May 2021 13:14:14 -0400
X-MC-Unique: GIfzUfksMbKpI4_IBYe_bw-1
Received: by mail-qk1-f198.google.com with SMTP id
 d15-20020a05620a136fb02902e9e93c69c8so3915923qkl.23
 for <dri-devel@lists.freedesktop.org>; Thu, 06 May 2021 10:14:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=WHt7BDD9RIfUmR/n7ErimXYampz84sK/Te7hVMTDzGg=;
 b=fJXjp2SCY6hqWC5i6ZOMvRlBhyMazinaL4/1MBIDwrINUQhQDWEcYyCxqz75wRcj5R
 6WyykTlzbw61QNsMA8yYg7Yp9g8xfDQmQtYgJ9e4IY3xfgu4L+3ctphE69OQaNnFq6YQ
 akehs1FFOBwiP8IlPBvIhOkd/iNgdjoRJxXIZBHN2A2txzmspdW6hn/4JswKeNh5j8rx
 ZFTnx+SND+t6Soodb8RVMspmTEazDaYRLtxOfyDl1AD7Hlc+o0+05TG7wJmorEQEEUFQ
 SdaIIW8K8wIaZBf3ajvLfIr1SmJatMCgrvPPPXFKjAQhd3hg59FdM52szqWUQ7LIAN2Z
 hfQA==
X-Gm-Message-State: AOAM531IG2zQpLfzBVDOC+4RJLu10f5as+MAb/TNDMDqcVV7sxsCAEO2
 BnMsTs2BnlWJdXVqq1gG8DMwjTIMC6dugnbwhiUHB+oPClwyYZwP38D4CfVeoxHlMV9PrwZl5gf
 H69cKjPIES/f13T3xM5D4YqYTS9VR
X-Received: by 2002:ae9:dc41:: with SMTP id q62mr4943867qkf.22.1620321252599; 
 Thu, 06 May 2021 10:14:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjEwnhoBPGfrifNUIwk2RVyavP6PRLpFE5xqW6/Y3DxB14jDNDqb1w/0e5lbnPGihQCWj+RQ==
X-Received: by 2002:ae9:dc41:: with SMTP id q62mr4943844qkf.22.1620321252385; 
 Thu, 06 May 2021 10:14:12 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id f5sm2475312qkk.12.2021.05.06.10.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 10:14:11 -0700 (PDT)
Message-ID: <59cd454b3a104a3a469a94be95cc860ced7581bd.camel@redhat.com>
Subject: Re: [PATCH AUTOSEL 4.9 08/24] drm/bridge/analogix/anx78xx: Setup
 encoder before registering connector
From: Lyude Paul <lyude@redhat.com>
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
Date: Thu, 06 May 2021 13:14:10 -0400
In-Reply-To: <20210503164252.2854487-8-sashal@kernel.org>
References: <20210503164252.2854487-1-sashal@kernel.org>
 <20210503164252.2854487-8-sashal@kernel.org>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org, Robert Foss <robert.foss@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I would drop this patch for all of the stable kernel versions, it doesn't
really fix any user reported issues.

The other patches CC'd to me look fine for stable though

On Mon, 2021-05-03 at 12:42 -0400, Sasha Levin wrote:
> From: Lyude Paul <lyude@redhat.com>
> 
> [ Upstream commit 9962849d0871f5e53d0e3b3d84561f8f2847fbf4 ]
> 
> Since encoder mappings for connectors are exposed to userspace, we should
> be attaching the encoder before exposing the connector to userspace. Just a
> drive-by fix for an issue I noticed while fixing up usages of
> drm_dp_aux_init()/drm_dp_aux_register() across the tree.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> Link:
> https://patchwork.freedesktop.org/patch/msgid/20210219215326.2227596-9-lyude@redhat.com
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/gpu/drm/bridge/analogix-anx78xx.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix-anx78xx.c
> b/drivers/gpu/drm/bridge/analogix-anx78xx.c
> index eb97e88a103c..16babacb7cf0 100644
> --- a/drivers/gpu/drm/bridge/analogix-anx78xx.c
> +++ b/drivers/gpu/drm/bridge/analogix-anx78xx.c
> @@ -1045,12 +1045,6 @@ static int anx78xx_bridge_attach(struct drm_bridge
> *bridge)
>         drm_connector_helper_add(&anx78xx->connector,
>                                  &anx78xx_connector_helper_funcs);
>  
> -       err = drm_connector_register(&anx78xx->connector);
> -       if (err) {
> -               DRM_ERROR("Failed to register connector: %d\n", err);
> -               return err;
> -       }
> -
>         anx78xx->connector.polled = DRM_CONNECTOR_POLL_HPD;
>  
>         err = drm_mode_connector_attach_encoder(&anx78xx->connector,
> @@ -1060,6 +1054,12 @@ static int anx78xx_bridge_attach(struct drm_bridge
> *bridge)
>                 return err;
>         }
>  
> +       err = drm_connector_register(&anx78xx->connector);
> +       if (err) {
> +               DRM_ERROR("Failed to register connector: %d\n", err);
> +               return err;
> +       }
> +
>         return 0;
>  }
>  

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

