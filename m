Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC88494027
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 19:49:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC52689A8C;
	Wed, 19 Jan 2022 18:49:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 484A689321
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 18:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642618153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+qsGrcyTaM8HFYRYbt26Hs5PWVlx1EPqUOLucipU7Mg=;
 b=CljCLsl/LxKLLJ2O0Eqo0ks61JrNfcVBnCMXIpB6/UGZcUSqhBWrxl7darZr5psbmOUQOV
 leD0C8qCGLfDBd32CLwZEWfVDrsd0EgOi5ujMFPJ6zO8E9Yt8kMgEvQFfeOSEzi2yr5P/X
 LBLodxudeMhj2zIDpnUTb7a520Rwp4k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-p-tchsHmMJm-tBHEO2_8Jg-1; Wed, 19 Jan 2022 13:49:11 -0500
X-MC-Unique: p-tchsHmMJm-tBHEO2_8Jg-1
Received: by mail-wm1-f72.google.com with SMTP id
 l20-20020a05600c1d1400b0034c29cad547so4816534wms.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 10:49:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+qsGrcyTaM8HFYRYbt26Hs5PWVlx1EPqUOLucipU7Mg=;
 b=hV5nGl4mCaAuJJNo0TwkcjT33Gk//+F19SsMr6mn7v2My4/eN4XsG88f9cyK9JAdZt
 anCEtylSWIl9hai9ekI2p3nW0eJfKkr1pq5s4KK+lXaBAvyvRhovYlqdGnS/0RsXnPdy
 smhEVTfxZCmuTEgt14eD635xsXZBE7ATqocotX+M/BU3PrbB0OJBf5MCG6bDCYPqxldS
 IDvv/cnFgFDKIv2L41GSyO8XXbsRnIinknAXGgFJjxZAjHHXwmZ7wNbj4hLMSPYQkyze
 nOs4I0v65BGwOeBh5yGnxn1bmgddRS9l7fbkHVkN7a9rjcf5ie8d+eDpUT9rDNukU1ZQ
 w1/Q==
X-Gm-Message-State: AOAM530gDoi3uN5l5qW9vsgpQPIPNgtt8PBaA2AjRhUQRu8nnerlZ+D4
 v21MflqVuCH/RVcTkb4BfyxCJPZ9/HmeA6/1e3FEQ5rLMvsKnpPjKcqQZe781DJq+oj5cbCeLpw
 4n3j5K5R2j4X49nVJtNRBBqFTwnDD
X-Received: by 2002:a1c:a141:: with SMTP id k62mr4869511wme.172.1642618150639; 
 Wed, 19 Jan 2022 10:49:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1Kpf6+uldWTCRbZxkUHsgH8cpaLkeUTvW0fxHVDLydb9/z+nKUZFDPKeoNORBlQm9BC+hAA==
X-Received: by 2002:a1c:a141:: with SMTP id k62mr4869467wme.172.1642618150314; 
 Wed, 19 Jan 2022 10:49:10 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o3sm835397wry.30.2022.01.19.10.49.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 10:49:09 -0800 (PST)
Message-ID: <bb01c544-66aa-b470-5b09-18f6e42d941a@redhat.com>
Date: Wed, 19 Jan 2022 19:49:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 00/10] drm: Make drivers to honour the nomodeset
 parameter
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20211222082831.196562-1-javierm@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20211222082831.196562-1-javierm@redhat.com>
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
Cc: linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, virtualization@lists.linux-foundation.org,
 Gerd Hoffmann <kraxel@redhat.com>, Mihail Atanassov <mihail.atanassov@arm.com>,
 Jonathan Corbet <corbet@lwn.net>, Xinliang Liu <xinliang.liu@linaro.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 NXP Linux Team <linux-imx@nxp.com>, Dave Airlie <airlied@redhat.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chen Feng <puck.chen@hisilicon.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 linux-arm-kernel@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Tian Tao <tiantao6@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/22/21 09:28, Javier Martinez Canillas wrote:
> The nomodeset kernel command line parameter is used to prevent the KMS/DRM
> drivers to be registered/probed. But only a few drivers implement support
> for this and most DRM drivers just ignore it.
> 
> This patch series is a v3 to make DRM drivers to honour nomodeset. It is
> posted as separate patches to make easier for drivers maintainers to ack
> or pick them independently at their own pace.
> 

I've pushed this series to drm-misc-next.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

