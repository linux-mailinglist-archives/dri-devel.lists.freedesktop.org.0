Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D719B11D61
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 13:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 925CE10E9DD;
	Fri, 25 Jul 2025 11:22:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kde.org header.i=@kde.org header.b="kGNq3qwR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D1E10E9DB;
 Fri, 25 Jul 2025 11:22:14 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42]) (Authenticated sender: zamundaaa)
 by letterbox.kde.org (Postfix) with ESMTPSA id 50FC53387C3;
 Fri, 25 Jul 2025 12:22:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1753442532; bh=XsQTZwistOHF7O8f26CcjmTuyvAe/g+tgG/l6IWHk90=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kGNq3qwRLGLI+ZvSe1IYo6t/O29NgqVb4O2sVr1pXc+iKyxSyK3V7TGspGobkznq7
 DPJVol26Yq6KHhNaWzzAzeZhHx7X34WfGtWQrhyPovbGxl3WO88WzTvJ+Suo4ukEMr
 nI55ArRIZFV/KutaZiR/U7nLcawdm5l1uKzFOZJwJSVz4hshsNi63CCLvabmVcdrbR
 uRHdnkYLd3ie6MqJAAuJPCTj/7DjxwO8AOGZSUl3QZsKD3EUW5yjjCHBCAqKNU4rH+
 PurhFnWeSWYf9VGAPPrEUDT5AvPaf60UWclT6i4msQm5brNdZC6f1+xaon4fS56n8y
 QU8RY9JcnpJqg==
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-ae0df6f5758so318558166b.0; 
 Fri, 25 Jul 2025 04:22:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVkhlZOKYkrXqe2mui9p6bDs17ivVfdh7Grsct3ZhT1v/hhuDB3z6rxNgAE3AbjfUttdSlGFxpXC+k=@lists.freedesktop.org,
 AJvYcCXlhhLVZc9oq7W1oVNb5Wp9glxMj13x2hRCGJoLWCaip3dcKIoTQUNbaogU6JBQg6dCd0IvAeqfEl0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yybh5STcwll7yLTfZIH7qB7HkcUaBeJ2E7M2gOmXr2mzrLgEZTT
 e/PM2F+ypaxLYlSRT2pifhJV5D3562KdfqD/RTZ1pMtCNG6VB7ZRoxiVWnVTpW5SHqRka4Ev+3A
 Cia3jgIfyCM5LPy/K0xxWrvOJjwL5LRA=
X-Google-Smtp-Source: AGHT+IG/UGNT7TcvpSPiZpGkBkoEphXHlzBBGgFql1E53azOOA+bp+LgE6H0FSvwEH0iGg4Ff0r8Z3TRcDpI0D2eOD8=
X-Received: by 2002:a17:907:d1b:b0:ae0:d1f3:f7f4 with SMTP id
 a640c23a62f3a-af6179ffe2cmr179465066b.13.1753442531869; Fri, 25 Jul 2025
 04:22:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250724134544.284371-2-nemesa.garg@intel.com>
In-Reply-To: <20250724134544.284371-2-nemesa.garg@intel.com>
From: Xaver Hugl <xaver.hugl@kde.org>
Date: Fri, 25 Jul 2025 13:22:00 +0200
X-Gmail-Original-Message-ID: <CAFZQkGzBCU+tDUP=KahwCq8=LLW3a8NKiNK5U4JQ0btUFFz+9g@mail.gmail.com>
X-Gm-Features: Ac12FXyo8viM8MqYptt_w2cSpC1W_N5B3P-kWtv0htgcB_mmD6lkFT8VKPjtr5I
Message-ID: <CAFZQkGzBCU+tDUP=KahwCq8=LLW3a8NKiNK5U4JQ0btUFFz+9g@mail.gmail.com>
Subject: Re: [01/10] drm/drm-crtc: Introduce sharpness strength property
To: Nemesa Garg <nemesa.garg@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This patch is Acked-by: Xaver Hugl <xaver.hugl@kde.org>

- Xaver
