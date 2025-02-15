Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03282A36A84
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2025 02:04:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78AD410E4A1;
	Sat, 15 Feb 2025 01:04:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="C70GVRxL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD82210E4A1
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2025 01:04:46 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-6e66d4f3be2so4014376d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 17:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739581486; x=1740186286; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=H0rdqHP/xy8Y48PASntQbtLjxTNmbd/zBO/7fvkhPws=;
 b=C70GVRxLRq++EM2S4XW6OYvGK7xlwhV69AxKBAweCMVxzbACpVSgGvBdnlMXRencH0
 7ztTQiU+BZALVb06GpDktsIiW+jTd38lU/kefvLbiiRT04K89vWVx2QpG27KSnhasSJG
 oeu+LlbRiIvLRkUtg3sIq9EhmfKgVN66zmgcnH9gFs2LPQRkk4AuQRY5MZek5VM4ZaD5
 cWrBxtFQcW9YFz7sZj/yByyRldRzBmTzZh1VWlMhjyBekvVOSaxgyc3MHLbbE8tSFlx6
 c928R7mXrGbJSD8ymD/EUIbsIERciXGUZuPC6qAwbsFJK+p/pe3fqpwIKd1ow8RQ+h+N
 qj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739581486; x=1740186286;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H0rdqHP/xy8Y48PASntQbtLjxTNmbd/zBO/7fvkhPws=;
 b=s4q66dqh35OPjrQ/k0sT+Y1UOT7HM1J6DxWUjNH25UwfUxfrBCjLZsrmyLKEBnNa5s
 IQYRIz+9F9q8OIU04P2JQqJEOLNZhkWR9ECPzJjTB2WkVDoxntjJcIvBUiXERFJMiOrG
 p/m9IQT3BENHMRb/Or3lqwHZOtZvvbz7qLDmk5VyWooN3FPd8UHo4FUHWPd+LgDT1VSI
 0aRbKYCOVNRtrTqKogoYDZHbRgmer+gJHpOeVA8hMylFqMvrQBVUsEsCWw6VfZmmVVpS
 sqyRpQHA80teeS+ShODnLjXkMlRSALdU2w6Gm7H4Z/gxzfzeKv6tk/0eY5yySKuKnqaj
 pZFA==
X-Gm-Message-State: AOJu0YwGEgFsXPHDhoGQmNow54MmoDlYIRnp2agYHCyD9XrJjtqriUId
 IYXi0wQCyJJvpG+AEXdxEh6DCBXEaMLdrAjenxuVvVog496AgtVr1UFiqg==
X-Gm-Gg: ASbGncsVwPylbV4DljeBB+2ODQr4Y4u6o7O6vSbQfCE+HNjXWkDNd4usGIslcDVGuIG
 VRkmrwB8TvD3pD6/yT6vzl1MAjBgOAVDm/QIzD/dmzmyDt+gLsWGHaNNvvTI9BDZFdvxwLHINeA
 Ppi2Cb82lnX1pk3vLHf1vvQxFizwihjlzLK+OEHTwtt9KHR/B+C2idwxSPyRdwl8m2Wdjn37cGy
 WTfPfs1BeNSN1nm6UlC/uWGff/EIJMq09+esC7iazn9oP8sKvXF7T2PehU/pXlzSteY56NzLp4T
 XIHGiMS/PxhAIoJ90JOdjfAsrjCSAphWyJNuROYFQ8sCTvTij4qU
X-Google-Smtp-Source: AGHT+IE4kubTuRAtJxEGW7wOox/awPLdq7wUqN1GZDgexa6BQu2kzJ/5uk4tGL6MYnbZSoFe0NxuuQ==
X-Received: by 2002:a05:6214:f29:b0:6e4:2e88:c0e3 with SMTP id
 6a1803df08f44-6e66ccabef4mr25154026d6.13.1739581485949; 
 Fri, 14 Feb 2025 17:04:45 -0800 (PST)
Received: from VM-Arch (ool-1826d901.dyn.optonline.net. [24.38.217.1])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e65d779201sm27325866d6.2.2025.02.14.17.04.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 17:04:45 -0800 (PST)
Date: Fri, 14 Feb 2025 20:04:41 -0500
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Josef =?utf-8?B?THXFoXRpY2vDvQ==?= <josef.lusticky@braiins.cz>
Cc: dri-devel@lists.freedesktop.org, noralf@tronnes.org
Subject: Re: drm: mipi_dbi_hw_reset() keeps display in reset
Message-ID: <n7qaikyyisdq3m74buqjfxzyi5lgntnsmtirrmw5vi2nkf7izl@6coklitzp3uc>
References: <CACnTymYtkLJ=EfZK-c1nCW+bLSKAaq2sTW1x+Bj-_ve7hfAdKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACnTymYtkLJ=EfZK-c1nCW+bLSKAaq2sTW1x+Bj-_ve7hfAdKA@mail.gmail.com>
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

On Fri, Feb 14, 2025 at 10:29:29AM +0100, Josef Luštický wrote:
> Hello Alex,
> there is a bug in mipi_dbi_hw_reset() function that implements the logic of
> display reset contrary.
> It keeps the reset line activated which keeps displays in reset state.
> 
> I reported the bug to
> https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/63
> 
> Unfortunately, fixing the bug would mean current DTB-ABI breakage and
> device-trees modification would be needed.
> I mainly write this email to let you and other people know about it, so
> hopefully it can be found easier.
> What are your thoughts?
Thanks for making me aware. I'll dig into over the weekend and get back
to you

Best regards,
Alex
