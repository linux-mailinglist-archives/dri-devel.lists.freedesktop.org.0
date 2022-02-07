Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB134AC118
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 15:26:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6047010F6E8;
	Mon,  7 Feb 2022 14:26:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2438C10F39A
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 14:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644243977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MYWw9JSK8dC8TLycFWHHSNILrTkpbiMveBkAqZT9sJc=;
 b=e6T2gfW+Y5CWUzMhFUQXxCis5t7c11ONHdTbaJ2ebuHwAiXMbxEwtdbxVVS01ONf+HxT+y
 H4MsBs0WqTw03PmDghmwu0tzPJdI24bIQ5SkJDra0bKzWG5GdMiq4FUJqNKPHwQlrOdSmT
 1pai0R0KiQoBc0rfhned4SXWZ2BLlT4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-hffexmgFMja3an2P6a91AA-1; Mon, 07 Feb 2022 09:26:15 -0500
X-MC-Unique: hffexmgFMja3an2P6a91AA-1
Received: by mail-wm1-f71.google.com with SMTP id
 n3-20020a05600c294300b0037bc685b717so1627429wmd.8
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 06:26:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MYWw9JSK8dC8TLycFWHHSNILrTkpbiMveBkAqZT9sJc=;
 b=OrZnxHA2SMRc/inDIqNwmBKZAQzOE/Fe/xPOJB7DGLtV9mrmEf7Spiysip3zRHtkH+
 asx9f8fx41cmc27BTutwIMKLPFFW/Wm2OqLVLDcblmyM+g4x/C+d+I94TKAMBMRZVht1
 quScvIxwe25pk4upfFuSykBUkNi7tb0P/DQcLoyoJ7n/Uf6f+vxVe3/vCIt/rx0r8E2H
 UPdwg9b1tBFEYZTpMzeuvq/n+ZPBpxMqp808S4ebmGGtQK8zISiLRMDoal1/sT9vo6tU
 8BwJMLD39nziSePdP3tB0USq9mED37HJxYFyFmJfVpsYX7Qi5S1PBry7MxoIjzu0hTeO
 YXMA==
X-Gm-Message-State: AOAM531fmHTSDAQxq4F51/pr509xbXY+wrIZwWqmMnrtGWTMbD81ECoO
 ER3h808Tzi6Tj1VVkROmvzx6kUrflXmhisMjFIbbOdXztfLexoMAPk2a/h4l8+xr5FfiAAosT0b
 Ie/pUJF8LVTZreBrG19EEj4R1vmh5
X-Received: by 2002:a05:600c:3488:: with SMTP id
 a8mr11385419wmq.173.1644243973877; 
 Mon, 07 Feb 2022 06:26:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznPz95sIejip6l55SG7RMOmuzBWyk76nqPHWGO3JUh0IyIGeYycw1WvUd8LWJRJUYMLFbmJQ==
X-Received: by 2002:a05:600c:3488:: with SMTP id
 a8mr11385406wmq.173.1644243973690; 
 Mon, 07 Feb 2022 06:26:13 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id u14sm11761349wmq.41.2022.02.07.06.26.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 06:26:13 -0800 (PST)
Message-ID: <592b3e9f-4b9d-947e-cd65-1de3a85a2d34@redhat.com>
Date: Mon, 7 Feb 2022 15:26:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 7/9] drm/ast: Read encoder possible-CRTC mask from
 drm_crtc_mask()
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
 kuohsiang_chou@aspeedtech.com, tommy_huang@aspeedtech.com,
 jenmin_yuan@aspeedtech.com, arc_sung@aspeedtech.com
References: <20220207141544.30015-1-tzimmermann@suse.de>
 <20220207141544.30015-8-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220207141544.30015-8-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/7/22 15:15, Thomas Zimmermann wrote:
> Read the encoder's possible-CRTC mask from the involved CRTC instead
> of hard-coding it.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

