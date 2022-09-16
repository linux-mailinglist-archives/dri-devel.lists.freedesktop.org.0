Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E405BAC4E
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 13:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4524210EC42;
	Fri, 16 Sep 2022 11:23:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9990210EC1D
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 11:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663327417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ZQH9PFYSxgOPoALsHsE/rErasChde24zrfOYiDyTX0=;
 b=W6aAKTXYwfCg5/z1GhXL3v8VtR3piai/WpMjaYmnRq9XV3aVG7g00pNMxPxizCDfbHNj/d
 Wys3JS8Xuj4PTwihV1NVQ2iSvAjYHONLpVEHd9LDZl0Jrw89PV3ZwijpDcfzk7Tbz53HUC
 Ix7yNnd9Ah9fFz0tr4wGMbqA1hm7CZA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-193-QKAt1VEtMu2ojhTnzHfUaw-1; Fri, 16 Sep 2022 07:23:36 -0400
X-MC-Unique: QKAt1VEtMu2ojhTnzHfUaw-1
Received: by mail-wr1-f69.google.com with SMTP id
 m2-20020adfc582000000b0021e28acded7so5424521wrg.13
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 04:23:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=0ZQH9PFYSxgOPoALsHsE/rErasChde24zrfOYiDyTX0=;
 b=RRD8cM1Q5BBRct/Q76wIqYkCRgidTXAd2Uc7VTFsQcwhsyL1O/7F3oW4tXApFBBITE
 OB1cfZx577iBISq8JuD8mJqnszA027quV/JwhTOManJICssbq1xiEgfyHcYcAdVQnqWe
 gh1xNleWFoJJmAvd/JROqJUF2hwEPRd9IN/yXjKBKIsW+mmdd9RqXsbKd16KyZwntfq+
 Z/LTZ7mqTlakD0xBnp4B5/nh/haRwfYPyFQo0McDCSAeGrYnoTDAko3vwgN0qc4r5oGQ
 VbyINSYjb/vuDtHWAJeXLNn5PWxHD2eZm4zbEy0XR9sTUPYQoOCEey8fYLWppwz9qrfo
 7H3g==
X-Gm-Message-State: ACrzQf2lISI40B9+oexiKB9jeM/BwrdlooMX9iAHP2aT/Q5pLSBLPrAH
 EVABHAyW/a5ohrQCmQxTKaad4bTpzKdpSdpk0HRFU6JvwCD7ncMZneEqUxyNpAIeSNFdRuTAOTm
 fm73zGl/N2BrEcSPSCOfGjnkwoKTH
X-Received: by 2002:a5d:6245:0:b0:225:3e24:e5b1 with SMTP id
 m5-20020a5d6245000000b002253e24e5b1mr2594323wrv.698.1663327415720; 
 Fri, 16 Sep 2022 04:23:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6rSqpUyp7t2tSW+U9ofrvqVJDHxMOvNBeGFF95LaCwlhrl5+FPdJsu1AfyyGVP8rZkzhUPzg==
X-Received: by 2002:a5d:6245:0:b0:225:3e24:e5b1 with SMTP id
 m5-20020a5d6245000000b002253e24e5b1mr2594316wrv.698.1663327415543; 
 Fri, 16 Sep 2022 04:23:35 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q16-20020adff950000000b0022a9246c853sm4779510wrr.41.2022.09.16.04.23.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Sep 2022 04:23:35 -0700 (PDT)
Message-ID: <cf3b577b-c284-867c-8450-b791eb746176@redhat.com>
Date: Fri, 16 Sep 2022 13:23:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 3/4] drm/plane-helper: Warn if atomic drivers call
 non-atomic helpers
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com,
 laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 jyri.sarha@iki.fi, tomba@kernel.org, sam@ravnborg.org
References: <20220909105947.6487-1-tzimmermann@suse.de>
 <20220909105947.6487-4-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220909105947.6487-4-tzimmermann@suse.de>
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
Cc: linux-renesas-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/9/22 12:59, Thomas Zimmermann wrote:
> The plane update and disable helpers are only useful for non-atomic
> drivers. Print a warning if an atomic driver calls them.
> 
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

