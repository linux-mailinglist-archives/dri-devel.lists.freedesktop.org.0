Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 569932546C7
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 16:28:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 565E56E447;
	Thu, 27 Aug 2020 14:28:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2AA86E447
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 14:28:16 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id z9so5292169wmk.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 07:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FshHx+iy1bAEWzQUJ7cQEVfyx5chyaL7080CcYDwA74=;
 b=ug3i5S5j6LnxQjeobT6WJyqsDG5rSL5cjC1KdHk/XUjSQaIBdPncWBRt+R+bZVW6KZ
 Jg0GgaKv3ULjDGiVw9sabdOuplNLQzTqpyEJXwvxpftphaysJGeTARCP6zSW8hJd6xG6
 ywaMaQ7nKxpvKWjo/D4ReXw5PtX6sJLmKc42PKKETft4/apJEQliSel1wrc5nYPv1xG4
 gS6EGRFQli0bF+SWIQ3o+AqylEMwBlQ/pdD82wlr8G+ce2rsbnRRDqDjPoPDv/fjLsRE
 XQTD7XQQqNpDRwN2Hu0bNv4c7Az1RlNh9b3ZzvarBWSHqhCLVnNiHTMmuCRDeUgrCB3s
 NWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FshHx+iy1bAEWzQUJ7cQEVfyx5chyaL7080CcYDwA74=;
 b=LaYspB8CgtDgTgYRkGfYLh8grryp1KHGerdLshkIRRugkv/bIOL7a749NW7zzF0gDG
 Ierw8puImwduTSAV2AnKkhUaCbDUJpc4XC+ipxp06YznaO/5G4Bq73v3cRU/VOo4ZzD2
 enYiIrGLthZOsS4duQBZXTYb+odnWCRIO9yoDHbX7KTum1PHgA3mkPv1Z757zO67bGnj
 cvctI9GbMAqO/Hc3xkeeCsgKjzDJz+jgs805N0ES6+eFOYIuXeb2QdXwcTpx3JuoTF7o
 Eer3wi5gZQMgg6k2Fyj3dGBTkqjmShOb217iO3nEw4IJwFpKQaS6kNnYiOo7bl+SabK9
 4v8w==
X-Gm-Message-State: AOAM530MpU5ou45EPTiAMn9LauXBa4k0ClxhINiiWaIgZDLI8OhkEmOo
 aTo/xPU3n+o9dWKN+32CrIU=
X-Google-Smtp-Source: ABdhPJxXV0L3SpjuwYIyAF5JoXygB8XwFBGwdswwyGmaWnMPJCE5eUzLF2LAxUdEaplJ9f+RBeopdw==
X-Received: by 2002:a1c:6a03:: with SMTP id f3mr12772161wmc.181.1598538495430; 
 Thu, 27 Aug 2020 07:28:15 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.187])
 by smtp.gmail.com with ESMTPSA id 21sm6843823wrc.55.2020.08.27.07.28.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2020 07:28:14 -0700 (PDT)
Subject: Re: Aw: Re: [PATCH v5 3/7] drm/mediatek: disable tmds on mt2701
To: Frank Wunderlich <frank-w@public-files.de>
References: <20200819081752.4805-1-linux@fw-web.de>
 <20200819081752.4805-4-linux@fw-web.de>
 <trinity-14a1b182-38ab-4f84-bb72-94d448b05fd5-1597994235320@3c-app-gmx-bs37>
 <81276d4c-8883-8bfd-d7d0-9b9ac025ed97@gmail.com>
 <trinity-ddd51146-41eb-49ae-9456-4588450d31aa-1598535710011@3c-app-gmx-bap26>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <e0edfd9f-5916-80ee-3bef-92d7050f97db@gmail.com>
Date: Thu, 27 Aug 2020 16:28:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <trinity-ddd51146-41eb-49ae-9456-4588450d31aa-1598535710011@3c-app-gmx-bap26>
Content-Language: en-US
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
Cc: chunkuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Frank Wunderlich <linux@fw-web.de>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 27/08/2020 15:41, Frank Wunderlich wrote:
> Hi Matthias,
> 
> any opinions about the dts-changes?
> 

they look good to me.

> maybe series except the tmds-Patch get merged...so i add it only to my own repo till we find a better way?
> currently mainline does not support hdmi at all for the board. the tmds-patch is only a fix for specific resolutions which have a "flickering" without this Patch.
> 

Well let's see what CK's opinion.

Regards,
Matthias
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
