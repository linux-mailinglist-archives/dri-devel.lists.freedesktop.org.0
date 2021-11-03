Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3CE444719
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 18:31:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 469A673CCE;
	Wed,  3 Nov 2021 17:31:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E34173CCE
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 17:31:11 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id d5so4760011wrc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Nov 2021 10:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FbRhYZ6lLMWqngWf2cqxRUv8emxiI2fe6YSOeSSY8HY=;
 b=nvJNc3kB/aIJ8WA5Xc4dAfyJGXOUT9mCxG5OAo8haBSVue2iRvfBP+hqB6ahbX+ezi
 zqI15/N++dSJ6NlXr5VpwmG2D9my+DL6ow3oHvtGg8YATWsixC12aBHCHzV5MJ/3zA8U
 YiC82fphylyv3ro6WIM8eFAA/MzyMKQ28xkj9DUimMQBRmZ9ORq+fhracfulrKJXv6/a
 fLYj2Q/NRYDMZ6oG5j8v9ccvHrdJChuEY+bKa8Gc3SOOX17C/uToTT8RmeNkyfelbGJs
 TBz5ikILIVWAIYpHxulkY9g83YALDcES29WGuLv7K2d8cVrVi2/OdRJSBq4IZ0p5NSKZ
 uTgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FbRhYZ6lLMWqngWf2cqxRUv8emxiI2fe6YSOeSSY8HY=;
 b=T5mMiLbEmIgRNrk1bF/9+1ns/wKnnoSv4yvSlH3a7ppDfAectOQ9maoR4qbt2J0wFq
 e0gkZpxOYv9lob1c57I/UWzb5HLRyG2+aypI5L/doPxVIX3yfj8LTZYNX5SdrVtkn/lJ
 uSQihmk1S+H97N4DdsFRoQ3sTpWiGhwm4nQHmCChHLZXiO9EnH45DM3mifiLsjSuYHe1
 W98y7iwVk4gk22uS5PsxtoLpYIS7ML0qtHV7LlYmKyzmrlyT29WFf5qwE5PiC2V29dUA
 98vyNZvcmV4QVKdJtswhxD4ibLYfQwXYOjwkdvxKhEkYvokM/ftSPY9QNbujGyEQH05B
 tB5g==
X-Gm-Message-State: AOAM53167ipDGyO4/t001sy20F0a2wL6PKEdfN/pQvhCYrywFkB0kdPy
 NIRN7/CeeKs1CUhGFTQvjavyJA==
X-Google-Smtp-Source: ABdhPJy6rnwrTz9baM7+pLMjNFPj2w5GZHKSc6LlHvcgadsD8ViZl7qmm+hRQaAogHkXjOwtekBfig==
X-Received: by 2002:adf:d4c2:: with SMTP id w2mr40778374wrk.225.1635960670132; 
 Wed, 03 Nov 2021 10:31:10 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id a9sm2575261wrt.66.2021.11.03.10.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 10:31:09 -0700 (PDT)
Date: Wed, 3 Nov 2021 17:31:07 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 3/3] backlight: lp855x: Add support ACPI enumeration
Message-ID: <20211103173107.xlchsysme5xzpn24@maple.lan>
References: <20211102225504.18920-1-hdegoede@redhat.com>
 <20211102225504.18920-3-hdegoede@redhat.com>
 <20211103171756.wxthncse2f4syeiz@maple.lan>
 <5d431db5-30dc-b51c-7abb-ab57a3de2f8f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d431db5-30dc-b51c-7abb-ab57a3de2f8f@redhat.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tsuchiya Yuto <kitakar@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 03, 2021 at 06:28:15PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 11/3/21 18:17, Daniel Thompson wrote:
> > On Tue, Nov 02, 2021 at 11:55:04PM +0100, Hans de Goede wrote:
> >> The Xiaomi Mi Pad 2 tablet uses an ACPI enumerated LP8556 backlight
> >> controller for its LCD-panel, with a Xiaomi specific ACPI HID of
> >> "XMCC0001", add support for this.
> >>
> >> Note the new "if (id)" check also fixes a NULL pointer deref when a user
> >> tries to manually bind the driver from sysfs.
> >>
> >> When CONFIG_ACPI is disabled acpi_match_device() will always return NULL,
> >> so the lp855x_parse_acpi() call will get optimized away.
> >>
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > 
> > Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> 
> Thank you.
> 
> So what is the process for upstreaming backlight patches,
> do these go through drm-misc-next (in that case I can push
> the series myself), or will you pick these up ?

Lee Jones gathers up the backlight patches and sends a PR (but, except
in exceptional cases, treats my R-b as a pre-requisite before doing so).


Daniel.
