Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DF95FB473
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 16:21:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E4010E54C;
	Tue, 11 Oct 2022 14:21:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E8A310E54C
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 14:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665498108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XC8meWqwPS+afhwut/KUbYG+4N/Pzp1T/iR/ntr3aXM=;
 b=YlDoqnxlUuxZ2DqUizJq20zsRAD71S2oe/SPnscJrURqYT+0yTEK25Fiqcvq5VgH+rxVfF
 bMhtg0OaWH9eV0/93P5sW2wkQ1AKBGTjWfyt7Undd6I2ORgXPeok5FlpR7HnGswfrQmool
 z4ROq8SygWbA6yEtYHZASYrdlh2l3Fc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-257-BXGbFm6COTeX2m0u2_U8tw-1; Tue, 11 Oct 2022 10:21:47 -0400
X-MC-Unique: BXGbFm6COTeX2m0u2_U8tw-1
Received: by mail-wr1-f72.google.com with SMTP id
 i1-20020adfa501000000b0022cd1e1137bso3881428wrb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 07:21:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XC8meWqwPS+afhwut/KUbYG+4N/Pzp1T/iR/ntr3aXM=;
 b=5hGv7bGKw+7xiQTFD0kKOD4GT6Xm748uAcSaWh9UsRMQQXXfaVf3EDEUSGtLPYjXfd
 HrBUsR1sP21D0w0Rptl2I0o2iNmYNdan0/0xPu1I3jxLnvo8lut09bAbesw2/KM8d9GP
 4iBKEQhfAC1do6JJ6vCRmCrvXbfP75QCJrH14ByNJ7aX5G6Zy3ecghdvgruGDL/ysWPk
 a1p0RNpz+2byDMudm6XvhdeaJnbcue6kpbjxJL5Np6OCR7Yi5ZMOgjpbSM9FjqcpCVWG
 dI4GNFwCdxXZkEmLt4fFM4uV+hc+Uk7w/TO3HUOhekjTpdBULTzjLo+6iBiMG5/fjDPq
 Gf8g==
X-Gm-Message-State: ACrzQf2M7PUmkaYeTFy+pEOvFTaTzO3gYsO13celEWBxjfjlNBFaMbj5
 krDASTzxm8aRmS5rsh0krLro6idzQMJoX0knZkUchLFRsEQrgPspjNSrzx8dOQZCQqYvoDFYhkT
 v9fcBmVHEyw9D47tGQQu/d8SAdTSe
X-Received: by 2002:a5d:6d8a:0:b0:22f:1ade:de87 with SMTP id
 l10-20020a5d6d8a000000b0022f1adede87mr12133962wrs.3.1665498106440; 
 Tue, 11 Oct 2022 07:21:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Nbs/3jnXiiDVg8h+6qhWOZ4i2UObBq+E6Q2LTpAN3ptNTu3e66fwjmJF2Qj0rw3dS0LoMrw==
X-Received: by 2002:a5d:6d8a:0:b0:22f:1ade:de87 with SMTP id
 l10-20020a5d6d8a000000b0022f1adede87mr12133954wrs.3.1665498106165; 
 Tue, 11 Oct 2022 07:21:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a5d4711000000b0022e47b57735sm11286382wrq.97.2022.10.11.07.21.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 07:21:45 -0700 (PDT)
Message-ID: <73eb1f19-5900-a758-bf80-38cbd69395e6@redhat.com>
Date: Tue, 11 Oct 2022 16:21:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 8/8] drm/ast: Avoid reprogramming primary-plane scanout
 address
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 daniel@ffwll.ch, kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com,
 ilpo.jarvinen@cs.helsinki.fi
References: <20221010103625.19958-1-tzimmermann@suse.de>
 <20221010103625.19958-9-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20221010103625.19958-9-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/10/2022 12:36, Thomas Zimmermann wrote:
> Some AST-based BMCs stop display output for up to 5 seconds after
> reprogramming the scanout address. As the address is fixed, avoid
> re-setting the address' value.
> 
> Reported-by: Jocelyn Falempe <jfalempe@redhat.com>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_mode.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 1b991658290b..54a9643d86ce 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -672,9 +672,17 @@ static void ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
>   	}
>   
>   	ast_set_offset_reg(ast, fb);
> -	ast_set_start_address_crt1(ast, (u32)ast_plane->offset);
>   
> -	ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x1, 0xdf, 0x00);
> +	/*
> +	 * Some BMCs stop scanning out the video signal after the driver
> +	 * reprogrammed the scanout address. This stalls display output
> +	 * for several seconds and makes the display unusable. Therefore
> +	 * only reprogram the address after enabling the plane.
> +	 */
> +	if (!old_fb && fb) {
> +		ast_set_start_address_crt1(ast, (u32)ast_plane->offset);
> +		ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x1, 0xdf, 0x00);
> +	}
>   }

I've tested the series, and BMC is still very slow with Gnome/Wayland.

It's because ast_set_offset_reg() also trigger a 5s freeze of the BMC.

I added this, and it works well:

if (!old_fb || old_fb->pitches[0] != fb->pitches[0])
     ast_set_offset_reg(ast, fb);


>   
>   static void ast_primary_plane_helper_atomic_disable(struct drm_plane *plane,




-- 

Jocelyn

