Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CE141355C
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 16:30:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E5A6E99F;
	Tue, 21 Sep 2021 14:30:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E6816E99F
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 14:30:43 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id q26so39745544wrc.7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 07:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qX3le7wOgeftfqn2Wh3W0qvOcl91OK3fsnMrCfg1wOA=;
 b=a2bQ3quHcXAqfWR7bWKiuP/2m3S6kuQVdxfdIYt/w+XEt2/mqBSzj4Qcf8UzRk2Eqf
 9+yu/MgiBzXBN40/29utalH68jOG7UBAAXfpybGON6WTKfWVmTn7c50lIp0mcAvcFGrU
 40clPI9JEAEVZuR+y58976MQtGMHWXc7yJcBDm1UTW5AERn+zsqMEdto0ww8hNmoQOsy
 ev5whuXjJOPPlkJrJEsIKMJ+AFNzJuCZf+60Tm6d3QOsOR3xH26MH6YeBAtp/xRRzxES
 vHN88AgJOczyrO6luhegZWHVEzPScLv4TgdWOIDfguzQ9Tlkb2V7XoXzNhAUgONI4K4g
 7+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=qX3le7wOgeftfqn2Wh3W0qvOcl91OK3fsnMrCfg1wOA=;
 b=uTQrVL67Y0TsUaaHORdSinjhZnPwKv891rHNxc1KaEBjs3tFR0JJ/oLvP8ynsjUOL7
 G+33DjbZfPcTlhVQLNAZNYxEkX0uTRPjdd4awwdZazUWdmptY3TvDxBNkDZfA9L+XnPW
 qf5u0defZjHxISspJvubSATvdZaxQRNoboJfdgfwxgOmmeoB6VvaUyrFCvcq43m4ml4T
 C3Dpz585tt1lrsmpIRuHH/2GSj7Q/LnAyIg1SNbdPMCSsv/MbJJGirjjqhUGQIhsBSPX
 Yb5x0FW1rqqItUY58YtXl+DQHfbSft3oBUA4GieOluEecfFJtP78G+XbQev94tDdVYmj
 V4hw==
X-Gm-Message-State: AOAM531x2TVk8C+QIjSaep9d1YLjHMXzVZJOxivpa6HTxzASZKibmi4r
 WaOyTcqkt9b7S+Cig+z9z8AR+fewuNfVbzVA
X-Google-Smtp-Source: ABdhPJxCWG9Ylqms+1YIcO4oTOIslX8p5xuTX1I5380V7ogmjD3HUQIaS6R4pd7uxqilqKN4JPZfjw==
X-Received: by 2002:a7b:cbce:: with SMTP id n14mr4957433wmi.169.1632234641772; 
 Tue, 21 Sep 2021 07:30:41 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:19bb:c937:2c91:f02?
 ([2001:861:44c0:66c0:19bb:c937:2c91:f02])
 by smtp.gmail.com with ESMTPSA id i2sm18915269wrq.78.2021.09.21.07.30.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 07:30:41 -0700 (PDT)
Subject: Re: [PATCH 0/3] drm/omap: add crtc properties
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210921141654.66550-1-narmstrong@baylibre.com>
 <44ecbd74-b125-6f96-316f-c79dfc052af2@ideasonboard.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <164729eb-c491-4d0f-ce5e-8eeea89d3ece@baylibre.com>
Date: Tue, 21 Sep 2021 16:30:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <44ecbd74-b125-6f96-316f-c79dfc052af2@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

On 21/09/2021 16:28, Tomi Valkeinen wrote:
> Hi Neil,
> 
> On 21/09/2021 17:16, Neil Armstrong wrote:
>> This patchset adds the following CRTC properties:
>> - background color
>> - transparency keying property
>> - alpha blender on DSS3
>>
>> Tomi Valkeinen (3):
>>    drm/omap: add crtc background property
>>    drm/omap: add crtc transparency key property
>>    drm/omap: add alpha blender property
> 
> Nack, these don't comply with DRM uAPI rules. That's why I never sent them upstream.
> 
> https://www.kernel.org/doc/html/latest/gpu/drm-uapi.html#open-source-userspace-requirements

Thanks for the reply, I was wondering why !

Neil

> 
>  Tomi

