Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBCB487EFD
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 23:35:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC70610EF52;
	Fri,  7 Jan 2022 22:35:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8598010EF52
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 22:35:28 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id u21so4841781edd.5
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jan 2022 14:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sJrTOgh1BpphQDyMp+sJajflfyJjq+t21DzU6lHdSU4=;
 b=JkyBZUD07AqOXQSj7I8GTf0fX6mcjJjXqOyObGc+r3m34mdWfoNu30bMbljR9Pf7dV
 Rv+++kSM1kEVlTak5gMIG1j3/46RspfbXH/cRfXYojy9DkYhhY7ziVjkfsrnJJVtPz9Q
 wiWrQTg0l62jPRjn80WzmAKjOWXCeEcAM7NuVj3ZTf9J3pNCUE2di6ZL76uILIOQnoEi
 SuIHrUr/veOipm4qCcmDCwsRLKI2Axtz4OrRsFqCLy8OQ4KzHSutJLcviK/r65RKhUFP
 ljjO3ZN9MTKdupmsThe7THG2LJKq1SEJ5nK5a69Cb0o4g2dYwYQcACZ6XEvaBYEORkmt
 +HnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sJrTOgh1BpphQDyMp+sJajflfyJjq+t21DzU6lHdSU4=;
 b=1cl34XoLx0FIn5hzbqZFFXkZ42rHgrsheKOR+yYH8jh/j7Gu29+lo9TLYR+Xi5DBsN
 K61QJCVsxkP55RY2oHY11BHGgpAwwP4EVg3D1aVa5Xpo3nM7vyAd8uejmVpPox/veqpY
 udNbgSXv5awB8kOhpbNU3UGqoaRLAoZO3XL1EadHACY9OwYFnzO7D9g1n7AH4Z7Bz807
 bb6rtiANICxF4inILKBFhm1MBCOokolHzeIMAhLy4rGNDGsDKYyH8S2T4BlqrVEqZCpI
 ZVm5WZ861hSFPOf2UF+4oVo4cwQAlhVVLttT/irbm4RUFAGZpt3FTmq/SdRZBOxxRwfg
 gQ3A==
X-Gm-Message-State: AOAM531sOTp6P+P59VLuPOZo7n+xClBBJR8KTHenV/cZ3Tf3i2l0LMJA
 u09lk4yHGG6YrpEH67elFXgYI2BH3Njw3VD6UmVcQit82+M=
X-Google-Smtp-Source: ABdhPJwWWj41v92H/MlW5O+b/Fbpqer/i92MXxrWRNrU7ja6rVWwWcPO1NMu7xJe2swKrRQnVOjVtheSWsg41w0MMsk=
X-Received: by 2002:a17:906:519b:: with SMTP id
 y27mr5504426ejk.649.1641594926899; 
 Fri, 07 Jan 2022 14:35:26 -0800 (PST)
MIME-Version: 1.0
References: <20220107145515.613009-1-narmstrong@baylibre.com>
 <20220107145515.613009-6-narmstrong@baylibre.com>
In-Reply-To: <20220107145515.613009-6-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 7 Jan 2022 23:35:16 +0100
Message-ID: <CAFBinCCR4zftkvJWgX4T068BRsjVp9YhRbzgdBOR+tuMcGSZ3w@mail.gmail.com>
Subject: Re: [PATCH 5/6] drm/meson: add DSI encoder
To: Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

On Fri, Jan 7, 2022 at 3:57 PM Neil Armstrong <narmstrong@baylibre.com> wrote:

[...]
> +       writel_bits_relaxed(BIT(3), BIT(3), priv->io_base + _REG(ENCL_VIDEO_MODE_ADV));
see my comment on patch #3 from this series for BIT(3)


Best regards,
Martin
