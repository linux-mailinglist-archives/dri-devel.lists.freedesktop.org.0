Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BE647D095
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 12:14:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 139B110E65B;
	Wed, 22 Dec 2021 11:14:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7EAE10E65B
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 11:14:33 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 b186-20020a1c1bc3000000b00345734afe78so1292350wmb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 03:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Cd1oRTIvwdGBHC6TEDJuIJm0PK6V5jA3CCVieKSuuq4=;
 b=vVP/FeBuhlKPzT3WjXBViNmWcE5F3nEUxQCRVvwT3aIq1AxK5CigWeoTZ2QCTa4SH/
 /vSs/vtdgCHXNmockXwPcOJ4daXj07sMJmSt78nDTOpji096+ncRzojSxPw35TculbCD
 birRxpjqogPnZwZWspMl2NTHkYQ0TbJk0huJkcY8W1Dt0hTqBNafgb2Rb52fkBerLz3k
 FxpU6azkEsTDXZrazvBdTE8uJ7Q17heX20EFkMBJmwQTrrpb4HVYGP7qUHEPio/4h8N5
 nAaDkREiwGqUERLO1+430rJW2wTyJzxXEE+hykKeiuaHk1yUW7m8I/WKvRyNq3z+cwGm
 T6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Cd1oRTIvwdGBHC6TEDJuIJm0PK6V5jA3CCVieKSuuq4=;
 b=boEbG86QmXqLKG1fXLQUoUDjQfer4gMw9PltE2QOdnGDmiVFlNB+LlHGoRYYbxiVx2
 iKdn4qxQzrSgv0sWLbyOfDEcJF0siyREMZHRSWPN7VVodqi5gTjTKzb6uGS+M11gz74l
 Pt1p2oH5iilhvAr/JAb/tAxxleR9+ZqHwTIvvdFelrllyaZwTjYGbn+yxEOeEBTi+MtT
 DmoqVO0F2i2hWOJ53Zic4g8wrtyz6cPe/i73pF1TPfBNzyl0HJQkVoy59XWsKU03fB8P
 4ifwo/t/q+VpoGYLX7KJ92ScAvBRuyMpjwu7uK63wbW1U63/9/ugaDoDDfriFwLqz/Vg
 cFCA==
X-Gm-Message-State: AOAM533ehMEPQbPaRF8I82ecG7MGP2RsfUkAW+PzF++14f4Tgh0at/PW
 0i7rn5xBw3W9vdBujrajnC2ohw==
X-Google-Smtp-Source: ABdhPJxw6Au4zCsVQB1P8Fug+BOKFnnH6HevD4tlaqZlf4fk1F/xSnPxsmdMq8YgsIVOTV2XogB4rA==
X-Received: by 2002:a1c:e915:: with SMTP id q21mr638905wmc.94.1640171672214;
 Wed, 22 Dec 2021 03:14:32 -0800 (PST)
Received: from google.com ([2.31.167.18])
 by smtp.gmail.com with ESMTPSA id t12sm1858209wrs.72.2021.12.22.03.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 03:14:31 -0800 (PST)
Date: Wed, 22 Dec 2021 11:14:30 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 3/3] backlight: lp855x: Add support ACPI enumeration
Message-ID: <YcMIlkou9OCGIElk@google.com>
References: <20211102225504.18920-1-hdegoede@redhat.com>
 <20211102225504.18920-3-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211102225504.18920-3-hdegoede@redhat.com>
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tsuchiya Yuto <kitakar@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 02 Nov 2021, Hans de Goede wrote:

> The Xiaomi Mi Pad 2 tablet uses an ACPI enumerated LP8556 backlight
> controller for its LCD-panel, with a Xiaomi specific ACPI HID of
> "XMCC0001", add support for this.
> 
> Note the new "if (id)" check also fixes a NULL pointer deref when a user
> tries to manually bind the driver from sysfs.
> 
> When CONFIG_ACPI is disabled acpi_match_device() will always return NULL,
> so the lp855x_parse_acpi() call will get optimized away.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> - Remove `lp->pdata = pdata` assignment from lp855x_parse_dt()
> - Add "and is in register mode" to the comment in
>   lp855x_parse_acpi()
> ---
>  drivers/video/backlight/lp855x_bl.c | 73 ++++++++++++++++++++++++-----
>  1 file changed, 61 insertions(+), 12 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
