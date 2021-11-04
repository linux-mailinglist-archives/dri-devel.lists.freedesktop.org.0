Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CF1445050
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 09:29:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0026EC18;
	Thu,  4 Nov 2021 08:29:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712B56EC18
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 08:29:25 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id d3so7317660wrh.8
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Nov 2021 01:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ghkyarqNnDB/Y/3YhsJn3L40yfD5gAUeaEhu3iM2NF8=;
 b=McRL81hs7UZiC/3Lnw2W+WOYHQQZzX1+Q0DGYBYygh4eZ+1477NbnhDH/CMHbgxkQM
 2m9Sm1M7rW/awLEglfR/wHbnVYDmoxmLGfl4cyt0niJGVn9oZbh14urSj4mLuZVJl7JB
 NZ0xkg7nRHkdkd0w5xGlBlBeMPGn6G//AS9/HSxV8Lcuw5JjeqFPShyR00A0bBUAmD8u
 o8mu9bTc0jBOLrJn2PH8GVHFUykkpAaKmCrofKYQDZY8K64FzydkURZpUBTR/eZpBhzH
 bJqmWyNGr5CDQ6kgeah4UcE2LdiZS53UdM4DAi7Gt2V6iejD0nfUMRnJleYtsc7kfZth
 OJcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ghkyarqNnDB/Y/3YhsJn3L40yfD5gAUeaEhu3iM2NF8=;
 b=ZwdlPEA9qFo6HyBmhBFoFGlXSSVQ2AV3YBp7QVdOaQXtc7oxdltU+IyIHz0HdupJVO
 ynn9kRLV6uJHI9p1XzzIOjZU8UjVryeijbVp5pWIzQ2vfPI4Gq2x4ESVYOdKWAdgNABJ
 WeIcDgjzQJIH0CaK63MshtiOTBCvQPQfrl56ykHU7v5RHUbrBVjeQi4mVcqms5dMs363
 9FToJxjRGzrznkuHw093XJkcUqeMZzjI5YRCSGkdU5Uwk+tHSHoY1dppmQvPgX7yDjCZ
 p373X4jSmrMyJAsTzSJk9YCV9Y+uhBayw1lGOOccposnjJU/Pa1eSb7xPqPH0btQvM9F
 rSgQ==
X-Gm-Message-State: AOAM531rW4Qb6ZeFNvj3odykTgbRkfdW/A7u8OdWz7qkFjfgzJMiaKNd
 eUuIdkgP/z8jh04D1iiz0LsNjA==
X-Google-Smtp-Source: ABdhPJzjqTmlaB5EcPKJkTRmpsTFj1DHOMCUEW7CV7MprZs+xQjB/Ok02LX4XBkJ1vohpKd2+F1GdA==
X-Received: by 2002:a5d:51cb:: with SMTP id n11mr40788300wrv.278.1636014563955; 
 Thu, 04 Nov 2021 01:29:23 -0700 (PDT)
Received: from google.com ([95.148.6.174])
 by smtp.gmail.com with ESMTPSA id h18sm4597774wre.46.2021.11.04.01.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 01:29:23 -0700 (PDT)
Date: Thu, 4 Nov 2021 08:29:21 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH v2 3/3] backlight: lp855x: Add support ACPI enumeration
Message-ID: <YYOZ4TI29Oq6i6za@google.com>
References: <20211102225504.18920-1-hdegoede@redhat.com>
 <20211102225504.18920-3-hdegoede@redhat.com>
 <20211103171756.wxthncse2f4syeiz@maple.lan>
 <5d431db5-30dc-b51c-7abb-ab57a3de2f8f@redhat.com>
 <20211103173107.xlchsysme5xzpn24@maple.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211103173107.xlchsysme5xzpn24@maple.lan>
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
Cc: Hans de Goede <hdegoede@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jingoo Han <jingoohan1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 03 Nov 2021, Daniel Thompson wrote:

> On Wed, Nov 03, 2021 at 06:28:15PM +0100, Hans de Goede wrote:
> > Hi,
> > 
> > On 11/3/21 18:17, Daniel Thompson wrote:
> > > On Tue, Nov 02, 2021 at 11:55:04PM +0100, Hans de Goede wrote:
> > >> The Xiaomi Mi Pad 2 tablet uses an ACPI enumerated LP8556 backlight
> > >> controller for its LCD-panel, with a Xiaomi specific ACPI HID of
> > >> "XMCC0001", add support for this.
> > >>
> > >> Note the new "if (id)" check also fixes a NULL pointer deref when a user
> > >> tries to manually bind the driver from sysfs.
> > >>
> > >> When CONFIG_ACPI is disabled acpi_match_device() will always return NULL,
> > >> so the lp855x_parse_acpi() call will get optimized away.
> > >>
> > >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > > 
> > > Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> > 
> > Thank you.
> > 
> > So what is the process for upstreaming backlight patches,
> > do these go through drm-misc-next (in that case I can push
> > the series myself), or will you pick these up ?
> 
> Lee Jones gathers up the backlight patches and sends a PR (but, except
> in exceptional cases, treats my R-b as a pre-requisite before doing so).

Also the merge-window is open, so this is headed for v5.17.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
