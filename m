Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AABE539FD5
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 10:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0BDA10E25C;
	Wed,  1 Jun 2022 08:51:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E170910E25C
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 08:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654073469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HBHQYgVvAGQCOdoDn9ARukR15hBNns7Yswk58R28Ni4=;
 b=bAYf5CnuVZN+2DfB22clC0NFG3vxRYedfdpREoWxnlYdvAQz9gmQ5/lk6JlR+BqZNRkEdn
 ztgBwQ/VqqF9+oRj80PzvCvjfHKsJMgoafp4g2FOU00dHgPPtChTWP9ZxoXA/G2wbcvY14
 vYvLlWoo3YJcISn1Iv71ekkr/h1KBYw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-zQSFqVfHPB6pEsXmsARR6w-1; Wed, 01 Jun 2022 04:51:08 -0400
X-MC-Unique: zQSFqVfHPB6pEsXmsARR6w-1
Received: by mail-ed1-f70.google.com with SMTP id
 z20-20020a05640235d400b0042dfc1c0e80so354902edc.21
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 01:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HBHQYgVvAGQCOdoDn9ARukR15hBNns7Yswk58R28Ni4=;
 b=kNAlMSnBaVWggLjlbkmeoHfHqlbsBnKXqkguxZBwLAX6nenqPX9tCcWdeQkkvZoxc3
 iNOc30A3i9z3lqd1ooT+vUxKU4aD6KS7M1H4FD5AGgOg908j5b0toB/xkx+MrFkcW9LD
 EQMhhbM/OPABJH32pFiSp30y5ayEmJTWswimk/5tHjQCKaoOyPwoOz8Nhl4bTGbSgCyN
 esMoq1qEttuIlg7gNb0THpnqmRRcxf95urWQ6wMkldigoD+SktPgJiiYLsUH3BNPGLaf
 C8+b2/rApMbDxIksI7iiocy4xLSZZbQom2khcLbyHNPYNgdpdliDVslP21HTHUOTUkCY
 bk/g==
X-Gm-Message-State: AOAM530qo49BP4PPTij5f9rHF3UoQpfQbYxtGBf/0etVtqk8WC4MO8pm
 UAonwcrAADNnfOb5MYBzrtu5j/B6iUGUqabBSqaPZy2qzMdk9ZOt8BiOrWBG7ekCif9bLusayKY
 v8T8VvmAUXtcGfVP4YKOdKdIZ8u6t
X-Received: by 2002:a17:907:8a19:b0:6fe:e146:d107 with SMTP id
 sc25-20020a1709078a1900b006fee146d107mr41841297ejc.763.1654073467612; 
 Wed, 01 Jun 2022 01:51:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxz8yVDyEKGplWHg06AJJJSo0c8yw6I0zgv0YRyM+Fjpk6u4VdWfLi5qC40pTYsTW3vPqqmA==
X-Received: by 2002:a17:907:8a19:b0:6fe:e146:d107 with SMTP id
 sc25-20020a1709078a1900b006fee146d107mr41841278ejc.763.1654073467428; 
 Wed, 01 Jun 2022 01:51:07 -0700 (PDT)
Received: from [192.168.43.127] ([109.36.130.134])
 by smtp.gmail.com with ESMTPSA id
 12-20020a170906058c00b006fed787478asm444046ejn.92.2022.06.01.01.51.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 01:51:06 -0700 (PDT)
Message-ID: <6072f500-30fd-c0a4-29dc-4fde7072018a@redhat.com>
Date: Wed, 1 Jun 2022 10:51:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/8] Add a panel API to return panel orientation
To: Hsin-Yi Wang <hsinyi@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20220601081823.1038797-1-hsinyi@chromium.org>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220601081823.1038797-1-hsinyi@chromium.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 6/1/22 10:18, Hsin-Yi Wang wrote:
> Panels usually call drm_connector_set_panel_orientation(), which is
> later than drm/kms driver calling drm_dev_register(). This leads to a
> WARN()[1].
> 
> The orientation property is known earlier. For example, some panels
> parse the property through device tree during probe.
> 
> The series add a panel API drm_panel_get_orientation() for drm/kms
> drivers. The drivers can use the API to get panel's orientation, so they
> can call drm_connector_set_panel_orientation() before drm_dev_register().
> 
> Panel needs to implement .get_orientation callback to return the property.
> 
> [1] https://patchwork.kernel.org/project/linux-mediatek/patch/20220530081910.3947168-2-hsinyi@chromium.org/

Thank you for implementing this.

Patches 1-7 look good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

I've a few small remarks on patch 8, see my reply
to that patch.

Regards,

Hans


> 
> Hsin-Yi Wang (8):
>   drm/panel: Add an API drm_panel_get_orientation() to return panel
>     orientation
>   drm/panel: boe-tv101wum-nl6: Implement .get_orientation callback
>   drm/panel: panel-edp: Implement .get_orientation callback
>   drm/panel: lvds: Implement .get_orientation callback
>   drm/panel: panel-simple: Implement .get_orientation callback
>   drm/panel: ili9881c: Implement .get_orientation callback
>   drm/panel: elida-kd35t133: Implement .get_orientation callback
>   drm/mediatek: Config orientation property if panel provides it
> 
>  drivers/gpu/drm/drm_panel.c                    |  8 ++++++++
>  drivers/gpu/drm/mediatek/mtk_dsi.c             | 14 ++++++++++++++
>  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c |  8 ++++++++
>  drivers/gpu/drm/panel/panel-edp.c              |  8 ++++++++
>  drivers/gpu/drm/panel/panel-elida-kd35t133.c   |  8 ++++++++
>  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c  |  8 ++++++++
>  drivers/gpu/drm/panel/panel-lvds.c             |  8 ++++++++
>  drivers/gpu/drm/panel/panel-simple.c           |  9 +++++++++
>  include/drm/drm_panel.h                        | 10 ++++++++++
>  9 files changed, 81 insertions(+)
> 

