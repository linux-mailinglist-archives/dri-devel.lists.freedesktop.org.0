Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 763A64A8A96
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 18:47:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD2310E988;
	Thu,  3 Feb 2022 17:47:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC67C10E988
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 17:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643910464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qYBJlFSc4fNxPTmRERnvCFpsHEKOHeqgHz5VlYGh0P8=;
 b=NUdRHoBsXHlNjKf0rLUlbWZPyEZ7VYstW1MIcuiQh1EOUG1FMjtzyo76KNdAD0N6XzBXjv
 ETIWQYhyJ5IH1nfsYt+QI7p5pmZfqJWoRFrkXVeiJoEZMine+17P2pB7qlshLipf7wTKWy
 /N/IpXCr+RweZVfjGhpe04pyBE4LdyQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-302-WlCLQ9LQPH6U_gvYEqzdPQ-1; Thu, 03 Feb 2022 12:47:43 -0500
X-MC-Unique: WlCLQ9LQPH6U_gvYEqzdPQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 i204-20020a1c3bd5000000b00352cf8b74dcso1972667wma.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Feb 2022 09:47:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qYBJlFSc4fNxPTmRERnvCFpsHEKOHeqgHz5VlYGh0P8=;
 b=jQQaXRrcKTruh6d7mAz/p7ZWzMGlbPSqk8gPvnNjrw2DB/JRufni3CWViYpfrR7XD0
 t/hbOgDf7/N0JAcSx8CdPVBj2ABrrOhxDVRTcMXbdBsY+47mjYWgEjtQjDSyg0/X0o6y
 K/E8MY6dhZkdchVqua+cjXOitHHrTNXWuylmMnhaIA5fRSKqdiZHmMk4xucrRETzTeOv
 PFkBbap+BgeudJWdSE6CONaF5UavRmmZ7s1kQixeRCI2G5r6+EoUHIL/WwNfHBFQmWUs
 xGgkPOESDN9ACtb8Ti8/qflEScHOwH97McOyWYhtuy6VpkX9ImX3E/ewA841OAWM4ecf
 XKfQ==
X-Gm-Message-State: AOAM533mNQj3tfDBEw8oLdSJlYcSxY3Ho9iJSlTgmMwPc9EoE7rFvG+G
 Vw3/xtYSia2x0bskKSg+ySn8u1XUIgIDUAZZRP+wWZyNLeUhOHgOmTDFmtgutAR7fesaCGAcX6R
 tMAq+AG95JEpK9rWMHe5d+mZFB/oK
X-Received: by 2002:adf:efcb:: with SMTP id i11mr30752871wrp.667.1643910462683; 
 Thu, 03 Feb 2022 09:47:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwt4YvrabyPHfqup56jxqhIEhJ6tKzzPO5jqKKtyA/nAgDPmFnzovI/3WdlJ6WCEo88B06adA==
X-Received: by 2002:adf:efcb:: with SMTP id i11mr30752860wrp.667.1643910462455; 
 Thu, 03 Feb 2022 09:47:42 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id f8sm17456115wry.12.2022.02.03.09.47.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 09:47:42 -0800 (PST)
Message-ID: <fdf5652e-36c3-b488-ed79-c83725ad0656@redhat.com>
Date: Thu, 3 Feb 2022 18:47:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 7/8] drm/ast: Move DP501-based connector code into
 separate helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
 kuohsiang_chou@aspeedtech.com
References: <20220111120058.10510-1-tzimmermann@suse.de>
 <20220111120058.10510-8-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220111120058.10510-8-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: jenmin_yuan@aspeedtech.com, tommy_huang@aspeedtech.com,
 dri-devel@lists.freedesktop.org, arc_sung@aspeedtech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/11/22 13:00, Thomas Zimmermann wrote:
> Add helpers for DP501-based connectors. DP501 provides output via
> DisplayPort. This used to be handled by the VGA connector code.
> 
> If a DP501 chip has been detected, ast will now create a DisplayPort
> connector instead of a VGA connector.
> 
> Remove the DP501 code from ast_vga_connector_helper_get_modes(). Also
> remove the call to drm_connector_update_edid_property(), which is
> performed by drm_get_edid().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

