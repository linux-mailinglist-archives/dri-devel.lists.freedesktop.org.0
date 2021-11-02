Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F30442DC5
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 13:23:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 489DC6E13A;
	Tue,  2 Nov 2021 12:23:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E846E0A0
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 12:23:36 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 o4-20020a1c7504000000b0032cab7473caso1466323wmc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Nov 2021 05:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RG4XcfFl99SNeOBcyKQqC0Bs57QgpcfzeSgdEVPV+9Y=;
 b=mXwkh6J03uhB0jI3X/g34Yn8qJcznjAuxyRXzam4PahlNmGvY4U+jVYqX1FYtByfhc
 dN2+I2a6nIy6n884Vpz17p0FkYssBNKjblOSwI0mG1r9Xbuqs7kuOh5EjwqAlzHhNsnp
 S7+6QtUdjAaGXJFZuAuKtsOsDjhRvcqVT7AeEQQlyNTZXH5687WEB9JbrLZ+2USq8pEW
 ZDBEctXEkV21IK08rd/dGQvvFa6j5dS24pkXLhdav/DQFfXJNpqPh0j61oFu5Xsfk//q
 kB6hGiKYEkzKlVI69+tlka+TrivhXGFGDVNNtdnfR8tV7J79IePTogU7bhBiI/FdahRy
 Kayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RG4XcfFl99SNeOBcyKQqC0Bs57QgpcfzeSgdEVPV+9Y=;
 b=cDZKWALQ77LQKq1Xe6DG52IUKWF8BAExKfFAwo321jZ5i7yUz4dxGeu3er1j0jsTIz
 +pSMZHZhTAJfrjlTAP42UcquhdKtgKa36xvM2l2mbgMU7Q1cbsiPKm9+fcBw2V/X/om7
 l1BrQFEk5BoLLWoXm1RVg4o5topx6CZgxhaa/4DbOVvvdCYbGpFte5u9R1EoEYnmoqld
 OkeDxfW+ezS3mX1hIGU98l6eCOhQHj8RGEpAyE/zX3xjjnCVvpc0vkQHJU0MK/bQjo7M
 VAtVJnkYC6lPoo+5snOQ+MxcdyVUY6fHIVK84nFKvsAk/AFsaye7Ip/w3VcUEhtFxtr9
 83Sg==
X-Gm-Message-State: AOAM5302ckYoLVhoyzu+Jw+4xBiSlNBITM6Ya3c8nVL65y5VK/kC9g+T
 os5UX+ZA9yCO4IAAF7A8kl02/w==
X-Google-Smtp-Source: ABdhPJxsDgM5ZPLfLVKJTJI3JP/w+5g7Z8xe4XK5UcWEFMmoP5kETUDrLTCVO9wue0MqXhVDKU2HKQ==
X-Received: by 2002:a05:600c:1:: with SMTP id g1mr6509614wmc.19.1635855814619; 
 Tue, 02 Nov 2021 05:23:34 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id m35sm3061260wms.2.2021.11.02.05.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 05:23:34 -0700 (PDT)
Date: Tue, 2 Nov 2021 12:23:31 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 2/3] backlight: lp855x: Add dev helper variable to
 lp855x_probe()
Message-ID: <20211102122331.2dzhskz26ean74oq@maple.lan>
References: <20211101185518.306728-1-hdegoede@redhat.com>
 <20211101185518.306728-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211101185518.306728-2-hdegoede@redhat.com>
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
Cc: Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 01, 2021 at 07:55:16PM +0100, Hans de Goede wrote:
> Add a dev local variable to the lp855x_probe(), to replace "&cl->dev"
> and "lp->dev" in various places.
> 
> Also switch to dev_err_probe() in one case which takes care of not
> printing -EPROBE_DEFER errors for us.
> 
> This is mostly a preparation for adding ACPI enumeration support which
> will use the new "dev" variable more.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
