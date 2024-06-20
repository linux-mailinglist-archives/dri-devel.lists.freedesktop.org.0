Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F59911481
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 23:25:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DD3210E181;
	Thu, 20 Jun 2024 21:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HpwQRGPH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9C410E181
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 21:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718918709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f9JJShizHW6+26Nm609dCnIBkr7rhSHsiUz2a74VNgo=;
 b=HpwQRGPHg1pzbwbxTH55iyMKRd3bku8K2JJ/pBQ89ttjEmTh4KN2zmhuapIPnWYfG1b03N
 tdEUMIZTCObGgSE5EQC4xxTyOcDdyzN9CoMvd/+3RPpxcCVZP4V5iP1grNiTmIp+ZFY/qS
 SMGaHJKojlZ9LujLL+DGw6n7abV3Ai0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-522-A0rA2M_RNFqqkFCKXaW8sQ-1; Thu, 20 Jun 2024 17:25:08 -0400
X-MC-Unique: A0rA2M_RNFqqkFCKXaW8sQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-421292df2adso10884215e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 14:25:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718918707; x=1719523507;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f9JJShizHW6+26Nm609dCnIBkr7rhSHsiUz2a74VNgo=;
 b=KXTUV617aue1V45izotylUKPSBZmRRCGM7Rxh9NhfMo88DnPmm1l5IB0elQhlrts4W
 QVEmk7vs4IMvNl4NOqudNpc55JKD41aBfxTqY7I7T78gEcwsJ9HqjnMik/NmNnu89asA
 GQxRSjN52fw9Uwo91wzuLVx9isK+Bsw9qaXk6/B4XB9/WjDylR0oQhR5ZsqAK1F8tRvo
 7DMA4IdPPwycCRGQmBMhUS98b10TOWoNOKSnGxbxN5jNgK6Dpkd8hDILjP3hdZIZ+03V
 B29C2G70NMHd4Zv+3GkoWoH2M8VbpUElnn5+AfbHaLtKBuLZqOlYqqXNRfNMlEXE0eFy
 YkqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7VLuDovPGIt/qWXmGltAnrD1tRKgPfuh0jQ0IJg7nXVHL7AcJNSo1sKPQb8zO/gD6TwYGUjw4rHSuNOj0mSc7ejb1EtU8k7DkETPxxyaX
X-Gm-Message-State: AOJu0YxpJXT1vpmqMT5d8fK4+1frjFva6miUfgO26UTnQiwMjA7AzC5M
 Plbmm7XVNTCjV2c05NGWD8zwJ/VzAsqVfwD3qxRMb7afq9s5udQhBltqsWwoqiwoGeyY5x9Qzco
 6MNYnWPFRf1mYUuievFH2uYGSluTsGAjVlkADcLhRKj0qanA/lDAdp0NFJfUoBNY5OtxuAAcNT/
 A2nW9WKv4E8GCoFoddhY0eM4nznbO8B/DsoiGS5WS8
X-Received: by 2002:a05:600c:258:b0:423:3f3:ba9d with SMTP id
 5b1f17b1804b1-4247517db46mr50211495e9.17.1718918707013; 
 Thu, 20 Jun 2024 14:25:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaBsjAt7HYoRlIFrc5qpLHiI59NGO2TVUO9sqzR9IetjhlwXnL5MlgKewv4Xldk70LZ3RNqpOnHHSjyM9x5BM=
X-Received: by 2002:a05:600c:258:b0:423:3f3:ba9d with SMTP id
 5b1f17b1804b1-4247517db46mr50211335e9.17.1718918706671; Thu, 20 Jun 2024
 14:25:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240620054708.2230665-1-wenst@chromium.org>
 <20240620212142.461771-1-pbonzini@redhat.com>
In-Reply-To: <20240620212142.461771-1-pbonzini@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 20 Jun 2024 23:24:54 +0200
Message-ID: <CABgObfZTbszy8ruotPCA4O+u5C2wDXSfnaWo0mBNF3RbJwUNhA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: select DRM_GEM_DMA_HELPER if
 DRM_FBDEV_EMULATION=y
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Jun 20, 2024 at 11:21=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com=
> wrote:
> Queued, thanks.

Oops, a script started sending "queued" messages for everything that
had "y" in the subject. Sorry about that.

Paolo

