Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFCE488401
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jan 2022 15:41:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D50CC10E78E;
	Sat,  8 Jan 2022 14:41:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27FF410F43B
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 17:43:29 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id p14so5406360plf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jan 2022 09:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=g30nKtOg1oeqH8IqiezmzUi5A0C1r6MR6z8qoYYRJG0=;
 b=noyvDUT/nbivAF0rT4dfV9xn454IPhiHu8WTlgdT6oRJhgftL0NuoSgAlbZV5RJIu9
 nTN/iiRSBTxIP1KcsGuJek5zEuhhmvJdOkyteusKA3jjzOFtRc9NkCps2T0D/VkSHO+w
 sx3YC9DckzmiUFjpY6leFfzIBYvLiM0e9EBP861h3wrCS5IGmu9OLi30S5+j9VfmCfkJ
 6jbgNM0yNeieKo9HV/lzjqJeZ6bwyhFYTcSF518jb7VMNpDWgoYxMNgIV9YC1e04MEjH
 PIJVNX+5v84rv15o728J8YW2ck+rZEDWYPlQSpJTnbu9Euk41vqTxb88DmpTmOiX9WYu
 oBhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=g30nKtOg1oeqH8IqiezmzUi5A0C1r6MR6z8qoYYRJG0=;
 b=zvDMJsbVIsHE2Sk8cTvGylBQrieKfUTgJYaGMCw5LeJApc4/62k/Nuglhqa8YmK8cJ
 ezpzjEEHtAjIs7V+5lw2FbPcr4yMWQjz15JPhiK5ndVoaa5AcXh+F32S7iuKn61SQJWk
 iAIAyRgGwlLVZB2bVsQSvXzOapb7mYpUYXjvNkbmMo1uygDsrTZjbifx9/suM7877X6C
 DiP7TOmh2VHVB6/7NMSgNnrGxKwfRB4Zx7oUngrod/nsnrd23Y0cq7oty4Z2uD6TzGRu
 NB/DE31I1006qHZl6GdYrSSnupHmryxPp3XWBBp/TagsKES8pEYFwF0USgSaWwMEvNZz
 DiJg==
X-Gm-Message-State: AOAM530XlO4mEzmGONFbRQXPPu2Y9xvKWi0QcMIZBCm6GQDXL+xpDsvj
 PLDZ9ajgR3GEz/ot7TQP21NUhcAf0X8=
X-Google-Smtp-Source: ABdhPJwKY32mIfyYWhl9RZtln0aNIwFsoDt8YrT/vnaJUStlVNedJ3mNTbWr7JM9VrRLn5ydISU7aQ==
X-Received: by 2002:a17:902:f54a:b0:14a:147b:6036 with SMTP id
 h10-20020a170902f54a00b0014a147b6036mr907495plf.154.1641577408541; 
 Fri, 07 Jan 2022 09:43:28 -0800 (PST)
Received: from google.com ([2620:15c:202:201:4a85:a3d:72a9:2009])
 by smtp.gmail.com with ESMTPSA id z12sm6690164pfe.110.2022.01.07.09.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 09:43:27 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
X-Google-Original-From: Dmitry Torokhov <dtor@google.com>
Date: Fri, 7 Jan 2022 09:43:23 -0800
To: Rajat Jain <rajatja@google.com>
Subject: Re: [PATCH v4 2/3] platform/chrome: Add driver for ChromeOS
 privacy-screen
Message-ID: <Ydh7u1kuXSMzwmW0@google.com>
References: <20211222001127.3337471-1-rajatja@google.com>
 <20211222001127.3337471-2-rajatja@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211222001127.3337471-2-rajatja@google.com>
X-Mailman-Approved-At: Sat, 08 Jan 2022 14:41:31 +0000
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
Cc: gwendal@google.com, marcheu@google.com,
 Thomas Zimmermann <tzimmermann@suse.de>, seanpaul@google.com,
 ibm-acpi-devel@lists.sourceforge.net, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 dri-devel@lists.freedesktop.org, Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 rajatxjain@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rajat,

On Tue, Dec 21, 2021 at 04:11:26PM -0800, Rajat Jain wrote:
> +static int chromeos_privacy_screen_remove(struct acpi_device *adev)
> +{
> +	struct drm_privacy_screen *drm_privacy_screen =	acpi_driver_data(adev);

Please add an empty line here:

WARNING: Missing a blank line after declarations
#292: FILE: drivers/platform/chrome/chromeos_privacy_screen.c:129:
+       struct drm_privacy_screen *drm_privacy_screen = acpi_driver_data(adev);
+       drm_privacy_screen_unregister(drm_privacy_screen);

> +	drm_privacy_screen_unregister(drm_privacy_screen);
> +	return 0;
> +}
> +
> +static const struct acpi_device_id chromeos_privacy_screen_device_ids[] = {
> +	{"GOOG0010", 0}, /* Google's electronic privacy screen for eDP-1 */
> +	{}
> +};
> +MODULE_DEVICE_TABLE(acpi, chromeos_privacy_screen_device_ids);
> +
> +static struct acpi_driver chromeos_privacy_screen_driver = {
> +	.name = "chromeos_privacy_screen_drvr",

Could I buy 2 move vowels? ;)

> +	.class = "ChromeOS",
> +	.ids = chromeos_privacy_screen_device_ids,
> +	.ops = {
> +		.add = chromeos_privacy_screen_add,
> +		.remove = chromeos_privacy_screen_remove,
> +	},
> +};
> +
> +module_acpi_driver(chromeos_privacy_screen_driver);
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("ChromeOS ACPI Privacy Screen driver");
> +MODULE_AUTHOR("Rajat Jain <rajatja@google.com>");

Otherwise

Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry
