Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E0A4446E2
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 18:18:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 921C173C87;
	Wed,  3 Nov 2021 17:18:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4AF673C87
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 17:18:01 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 a20-20020a1c7f14000000b003231d13ee3cso5189901wmd.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Nov 2021 10:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QmVc9Je73rZQ/JXi2kSeHK45robtjQUCtsTvhzPdR/Q=;
 b=f1kzxmILHxk6ryEldtMA/STMiylac96ou/kUudthn9UoTm1IWCCwnmHEwKaBbm+mrk
 qG0XG8lcutYXlOXFoi8GSwcV1qKdrVA/KNM4K2Ba2aPGJbQo38gReTEG8jt1cvhLA/3A
 uNtFn0QgRGcvb0zOkD6TQsvAcG3NDbyjcOw9XaydNhzLKEQOB4DAtxDs+BqP6N9bSmoV
 vfTiDSVUnLTyP/U5b0swS3Ih2G9wzRztSRqCTaJ4fIjtuOg5a6/0Rm8lLKITUfMZPRg8
 6KgBA8zosImuHahkRQi9Q0ecFSEw+RWytxDe9DBpsu3UFSfm1owaO+sPWVRLBF9u1ScQ
 GDBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QmVc9Je73rZQ/JXi2kSeHK45robtjQUCtsTvhzPdR/Q=;
 b=gWyTUWYp9VGdGmKFchvWOGSenh5ADLXln5FAWE6ZGTSZuz71q0NiZ3k/gQXfOhHQBZ
 m9nWcXdGALz3UnWRh18E7cpSPUn6b2kWTQbbZHOvpGqS3eEuDn0Egc6KS64W2GJEkQIA
 stwTK1zxplIy8dOli/rSzOmhspcr84CYJtXf37DscTV1oMRZSEIPNgq6Er0W8bCoXvr6
 obd4Gr+OUXHUxt75nFvpjwXd+P7gyx7VLlxLNoknQsjf2uG7+Ih6+MD4MBGk8/etyw9S
 Ghdo21k/v1iwoapvJa0HPZ7Y71KkWWBLCP8UAoq+ui+PJ7etvugf4RGBkzBIIbVAmS1u
 Cf0w==
X-Gm-Message-State: AOAM533a+IEZ5mJpObp/rGee7HdgcmTc/4Q55K0GeF5g2rMXxIlnmHzD
 tQbFcr1pTsh+wZiSAe1H0SEang==
X-Google-Smtp-Source: ABdhPJytEVA3WQjrHJG2sA/bxnMXKTuDgE7l0CN2G/o7J4Vi5JAQr4pbv0uZCl/6aR4hMNxR40Tmlg==
X-Received: by 2002:a1c:9dc7:: with SMTP id
 g190mr17055937wme.130.1635959880277; 
 Wed, 03 Nov 2021 10:18:00 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id b10sm2637233wrt.36.2021.11.03.10.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 10:17:57 -0700 (PDT)
Date: Wed, 3 Nov 2021 17:17:56 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 3/3] backlight: lp855x: Add support ACPI enumeration
Message-ID: <20211103171756.wxthncse2f4syeiz@maple.lan>
References: <20211102225504.18920-1-hdegoede@redhat.com>
 <20211102225504.18920-3-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tsuchiya Yuto <kitakar@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 02, 2021 at 11:55:04PM +0100, Hans de Goede wrote:
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

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
