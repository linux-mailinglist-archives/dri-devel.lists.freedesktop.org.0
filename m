Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 507A996A19F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 17:08:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B78BF10E5CB;
	Tue,  3 Sep 2024 15:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="K8nB9es1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D886B10E5CB
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 15:08:23 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a89c8db505bso345740566b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 08:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725376101; x=1725980901; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+/YB2+Y2RTNoAqkefvNT5hKFDnmavnPCrMBY69xdSg4=;
 b=K8nB9es1pUyPrI15IGEVR+v2AXcjs1Y+mov7A9sPY7RA0UK8akoMA1A+/SlQtrIjDe
 8iT4GK7UkByEwq22G7K3qmivznj6FyPUXdG+DKwseb+dk+InPqcn6wPxG/KDp9Xgj5Al
 SiCUj74hPFtvQ+EQ/IcYrBCkj46PzgzYudy8PqlCPEcnXWo+AwcUIHNOoLFdGbd2pG2w
 VmPXL1z4szBPp+JvsFtfP6zNKclOm9frSbWnNxQTS/FosRDY9x1oqhU0E+xnzroNap90
 LL/w7j3jsfidGvDxWKrffkEzLDwNbXEd3H0OIsBYEhsMW7YsBKJPCPNbMQj0JxzyzYav
 qlkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725376101; x=1725980901;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+/YB2+Y2RTNoAqkefvNT5hKFDnmavnPCrMBY69xdSg4=;
 b=JUeqiP9BSOdwREss3OIbIXuUTvL/aOYmTsVBz1DUZXY5L+RKg4RadJz2FbXLqmBjNi
 fXDYuI/ZWGZBtDY7naV+U1x8JpZDU+nI76IK1XPfrrjKHp5fwN3DSSTO/I5gfQ3wIyj9
 L+GbOc6FdhAI6tpyGxobhx4V2wjWUOx5k23t7vZo9OQnSxRypVvn1J0fLEDxtox2LdPZ
 eze9M+M+FkMl4bhhuFCvhnouMRFxF3YGRL2/1LVH9kl99v2Um0qUh3obu7MCBgrYI0Lj
 6Vn0bIc4oSLUDO+Ziy56yyVVntf0JowyZc3ydx70hWQX5BajMwsUiFylCqolHwjrtrkA
 H+CA==
X-Forwarded-Encrypted: i=1;
 AJvYcCURscCzuXisJlQEq22leHLlURJpo/6vqNt2IWv1azefGcOUtOrFSLBVTJrs9N7K9y3C2D5kFhHZsSM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYVXxixjiQXz93Sw3Eto6RsSHAkJ254ZnqLVwHmX2NYvfxA3aP
 uT+rdW+pjdHV/M+g9nGIl0spjFLjsxEC/3h8Fw065erhoZrXkfE6SEO7TezmS7c=
X-Google-Smtp-Source: AGHT+IFdcjzbRsjvKuQu7pSzCjABoL04Be+IgB9GA7AMbTetDo/vMeHHYWeH2GCc9JDbYQ9yzK8+2w==
X-Received: by 2002:a17:907:d90:b0:a86:b504:42ea with SMTP id
 a640c23a62f3a-a8a32fa1085mr83163866b.45.1725376101351; 
 Tue, 03 Sep 2024 08:08:21 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988ff0465sm694539766b.29.2024.09.03.08.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 08:08:21 -0700 (PDT)
Date: Tue, 3 Sep 2024 16:08:19 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: lee@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] backlight: 88pm860x_bl: Simplify with scoped for
 each OF child loop
Message-ID: <20240903150819.GF12939@aspen.lan>
References: <20240822062546.3490076-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822062546.3490076-1-ruanjinjie@huawei.com>
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

On Thu, Aug 22, 2024 at 02:25:46PM +0800, Jinjie Ruan wrote:
> Use scoped for_each_child_of_node_scoped() when iterating over device
> nodes to make code a bit simpler.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
