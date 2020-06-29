Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED6C20CE20
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 13:18:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 271F089D40;
	Mon, 29 Jun 2020 11:18:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 634ED89CF9
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 11:18:12 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id f18so8082946wrs.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 04:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gxaG8lxANBcb+8ov3CKTpo2Yo7zY7gltl8/dODTAMSk=;
 b=Jv7CtynqQkptF/3qVSf6jt3IDaOJ6z5KERRjXQxFCwSuftpQO4fcPv4n2YpupvkXNL
 E1WYU3AbWuml3T0guLyxWY3/tKRFkb9lpIkl2ElWfbFZkWzcaj3YKHBQXoKBlxOPCY/W
 hYBCOrNeNP9KjaH5MAIozXOvNwYFJdKjIm3HtXYhwATJeNkyz6Cr632//8J397BjFai1
 bsleR0JURxV+VJpzFXrTAlLZerrWnCaRQM05j9FJjB2D9V77M4VnbOzMJJTHrWnUc3WE
 vOdOFnDz3T5jAc9QAElzKVfRbk2J48tYgVCInHosPkwBPmJ/Zyymhjw8WGEok9nFC45P
 P6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gxaG8lxANBcb+8ov3CKTpo2Yo7zY7gltl8/dODTAMSk=;
 b=Z98kaJglHoLzPyqO44nbg5hXrAsOb6OGNUWhGhQK1iDm5i9tOE/nJ+j93Q53h0UDmH
 5sDe+8tgopAPd4z5I6XKk6RgpCB+0zu+oqZOKxfKTjTrNaZtDjDZMWTkfJIXnybeF8oE
 f7wtotGw7RTP+TDRG/tZhfMFoXSGyugxtu5fR87o86wfbVa7s/yJB22hPtVzDBnyLq1H
 zyqqHarEDkOA2c21G4mwOoXa9B8oQfC2+SvtonZW0kDFHzoFNuHL1Mi3ydh04nLKgMGV
 9wJ5EPetP2f4wCWSgvqBNeh1a12G57fI1AWkadk7v8izXV1HoADLTlAOn5Agdq1CPlS0
 2jQg==
X-Gm-Message-State: AOAM531ziuwC8S3ap3WLDaILoEwyuL/E+g86SoPgQ4UmMTAG/KwAgZrz
 eZ/4/pbFXB3bqe7XIWmcfTjlUQ==
X-Google-Smtp-Source: ABdhPJyCc4fkZ5kBJFi5Nbajoi9doxAyJOsBDak+PRs2jsnWEcyKdrjEXcW9F0PFa59HxlcBEQSI3g==
X-Received: by 2002:adf:f6cb:: with SMTP id y11mr15911687wrp.100.1593429491054; 
 Mon, 29 Jun 2020 04:18:11 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id d13sm37480530wrq.89.2020.06.29.04.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 04:18:10 -0700 (PDT)
Date: Mon, 29 Jun 2020 12:18:08 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] backlight: sky81452: Privatize platform data
Message-ID: <20200629111808.kn7nscqvgzyvtrrh@holly.lan>
References: <20200626203742.336780-1-linus.walleij@linaro.org>
 <20200626203742.336780-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200626203742.336780-2-linus.walleij@linaro.org>
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
Cc: Gyungoh Yoo <jack.yoo@skyworksinc.com>, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 26, 2020 at 10:37:42PM +0200, Linus Walleij wrote:
> The only way the platform data for the SKY81452 ever gets populated
> is through the device tree.
> 
> The MFD device is bothered with this for no reason at all. Just
> allocate the platform data in the driver and be happy.
> 
> Cc: Gyungoh Yoo <jack.yoo@skyworksinc.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
