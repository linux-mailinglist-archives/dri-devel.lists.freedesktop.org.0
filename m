Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF9BB0F6F3
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 17:25:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E41A10E7EC;
	Wed, 23 Jul 2025 15:25:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gbmd/r9M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D415D10E7F6;
 Wed, 23 Jul 2025 15:25:50 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-ae3ec622d2fso1147196166b.1; 
 Wed, 23 Jul 2025 08:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753284349; x=1753889149; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=beDFfNZ4S97UR7YtlMFeit45AkVBlFdFilkbXCivTPU=;
 b=gbmd/r9MZIa640u5f4+71UrLwrAvtwjtiLQJX5d72/oKnjZ59hRCe9gbjjbd916tZC
 30a4gwy3P//j6aIr5YL8TVPOs+r2G1AkjGCNK3+4VlmUCF4WxHqlNT4yId7E0Pt5IghY
 +isLzTp0tkmgM13Yr85IauWgykQS9Dps9Yc2zOsKLCDhjz33P2/rKtZM2+lOVXpdumLi
 ts0igoSbTwKQoxnYbXyfOzeqkA2xceRObe9EuuyIPgHhqH7HBd5gYqAP2OZcrErzZ9/e
 mGF5T3npsL6R7iLV2beTHS3dUFkymRvNRhZdJHM0PFFLTCA8aa9DOhXpYDvTVbTvZvOa
 3HOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753284349; x=1753889149;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=beDFfNZ4S97UR7YtlMFeit45AkVBlFdFilkbXCivTPU=;
 b=bOy7yWIfyVblVybnaJ/nz2Qg+x5zo5E0Nqk5F983JW8T71Hu/skfnDEdfUG3OM0duI
 /H8Vt4cryrNQ9Gt4k9sv07W3zpux/24WZFLaO0rTNj02O3xEyjDhSizTxNupUeFtgvW3
 3ReDtHRtPmmT77FW7IYa0JZqZpnB+Yn6H+ZHX9ITWsWASRKK3ZHeEYOkoF9H+Fv8f1VS
 /eAc50vko0civeCRSaV0N6l2rVFJawJ2k6R+JSCeXyKZpIBhWBSOHzPeIeRfEJRiqEQa
 PC/WMTHE16QD2ilSDRUXx3yAzovbb3T0mleAoqrs5fPRjtZV/NHCWrGD52tlnpajyFNl
 NAwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBJt49WitYg6f0vH7XJQdam6WNXz82aPY+2LK5YXHGfJoIDEmN1oWOuVaVS08qp0oRgdJxdRAnsnI=@lists.freedesktop.org,
 AJvYcCX/Hxv6ZbTO8n7QZonWzzaTiDZ2n9e/i5ZCudeOwOfwF7sD0T9lRCKkKvwGF/YhE6TrlFpv7RXTVtE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxH+4Jw337AbZyyU9LH00iDFQrOZCwnjiuVEBGmFbSguOlVM4ye
 pxtdY/WruWXaO8YUShhwe2IDiAWzv6qX8BorinWI4qWMlFohverP/r4NHFMshJ7/zpmhDCoGI+O
 hf54ZqOoVrbCnWpJs4BdmTNiEdplCna4=
X-Gm-Gg: ASbGncuJeyGKNLY/Zc4cLfczTjVC8WXIcOYXh03przhB8xikJr76f+L/+G2u5jxfhWQ
 Qub9ZgEB0QUG3KHR2lkGmv2QxnrJxP5PcYLBTxIyjtW6RLqXIoSzQBijpTbAe1l5NOkut0YigtP
 0YoUb4wZXRtXvocPAIjnzcFALz8q/ABYMyNzU0ZoHVeeBK8gEm2j1g8TxCfExaC8DBbNDHof5ko
 SPZbUJQrW+CGC0ZRVn5A0TV6ei+gJfseNsWPLCidg==
X-Google-Smtp-Source: AGHT+IEa0ob0QBcEJfq3FhFawPvmxzni3jfhUtAlaF6YxGCJO8FwYOsF4YbFj9rdJb3Jbw+LcRzA43Q946tq0nyuDB4=
X-Received: by 2002:a17:907:9816:b0:ae0:c7b4:b797 with SMTP id
 a640c23a62f3a-af2f8e513b8mr361942866b.45.1753284348692; Wed, 23 Jul 2025
 08:25:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250519122644.3685679-1-nemesa.garg@intel.com>
In-Reply-To: <20250519122644.3685679-1-nemesa.garg@intel.com>
From: Xaver Hugl <xaver.hugl@gmail.com>
Date: Wed, 23 Jul 2025 17:25:37 +0200
X-Gm-Features: Ac12FXyMmncENa3EXUJUKl77spjbAhx8VBNj8PXjjK1DB1Gv1g9jKSteAlochIs
Message-ID: <CAFZQkGyRi310n967Mzq8qZ_DUTJeWx8tWks4XQAUxfVeOx65Rg@mail.gmail.com>
Subject: Re: [PATCH 00/10] Introduce drm sharpness property
To: Nemesa Garg <nemesa.garg@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
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

I reviewed the KWin implementation for this
(https://invent.kde.org/plasma/kwin/-/merge_requests/7689), and the
uAPI looks good to me.

- Xaver
