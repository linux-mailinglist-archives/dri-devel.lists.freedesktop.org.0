Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1518385D54E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 11:18:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB6910E6A1;
	Wed, 21 Feb 2024 10:18:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mzfaeCmP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B84A10E6A1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 10:18:45 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-563b7b3e3ecso8073624a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 02:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708510723; x=1709115523; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UOZWXYz0ax9PLPpkQLJdzcrN4l+8sAJvZhLzcXx8cHQ=;
 b=mzfaeCmPf32PtcL84PdZ6PoQ1yuk0AW7kvO/7YW4J+Cs55xj0xQVZk9BJkOAcmElym
 HoYESY99BMNGBHYL1oyY8MQJVHAaHNlLpXSbygKJ8JBnZKVvkJqdETjZT7cxjYiHRncj
 820gTY6BZNTPqRNBczbINB9OwET0pTS46YgBu33L1jTCU+oWkWfsAXrmZ4XG8714inLM
 aU8x/9s1Q3FqjqHdxMFnDFkx1Up7MOsp87gR2ike/VgytJBUMb1YHYAmwlb/C111JZfU
 u1FKeTR9KeLcBRsW5g5aY8OATF+n4belsIrQddSNxfo6IHcV3RLzrmAvPPlnGczphkt5
 Ilow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708510723; x=1709115523;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UOZWXYz0ax9PLPpkQLJdzcrN4l+8sAJvZhLzcXx8cHQ=;
 b=jdxqmccHj2lul7z0kFxW5FoHOrlSWRaySDjiijIP+pWq/gDt28fdwTjCPixTH+szF1
 P594ZNwBiezrp0Yg2Ao1GiVWYzeG+ew36uKOE4lPaqU760d9BOsg3yjPC1DqzI65zAw9
 qUafkeKPx6w0g+FHldhlKG6NVZUhO6uHvzCzLdPsnwH3BzQ5FzGNjkq3bNV75VqH9msZ
 pNxGXu65mEQGwo8POb4x4zFNP+nwBDr2f+nEMqL4UAWUF9I8E0lP8L8DAVKTKvDLP+kT
 rsvylbDmnqA1yDIRNYwFxpLwYqSU1as9Fo3O6GlLvd1ms+MUfF7AHqbZa60aj3Rdu33K
 Ceqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDmaieYjKObSH+aJRl3tqtsvEpp6gc8ctQ68ahgAfYrJ2/bmSZ0d3ZQekeNet81AkKw+Jb52Qx1SQ14QYNDlTDWwnH6c4cdlae576iaaHb
X-Gm-Message-State: AOJu0Yw94Fc1JaByLHmOMFG6FHr/qJ+53qHxQnDUsLG7X3KNIFCAZK2u
 Uyjg+d7Kpx/XxoIKdawUs8R/fKJbdMvrmIad0IiNzRQnXLP7PJufVa4M+Sb6d5M=
X-Google-Smtp-Source: AGHT+IEeRDPAMZ7wla9T06jLLenh+NdcXBE8k3BklG5ivy4o/djY/xTj8ppS5RuIiGGOVuLlBqRm3g==
X-Received: by 2002:aa7:c58a:0:b0:564:b822:9204 with SMTP id
 g10-20020aa7c58a000000b00564b8229204mr3848417edq.17.1708510723630; 
 Wed, 21 Feb 2024 02:18:43 -0800 (PST)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 s1-20020a056402164100b00563f918c76asm4454659edx.52.2024.02.21.02.18.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 02:18:43 -0800 (PST)
Date: Wed, 21 Feb 2024 13:18:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: sawara04.o@gmail.com
Cc: gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: fbtft: Fix "space prohibited before that close
 parenthesis ')'" error reported by checkpatch
Message-ID: <87f76339-3ace-4cbe-bdb9-266a86bf55eb@moroto.mountain>
References: <20240221095404.592464-1-sawara04.o@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221095404.592464-1-sawara04.o@gmail.com>
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

On Wed, Feb 21, 2024 at 06:54:04PM +0900, sawara04.o@gmail.com wrote:
> From: Kyoji Ogasawara <sawara04.o@gmail.com>
> 
> Since whitespace is prohibited before that close parenthesis ')' in a
> conditional statements, remove it and fix checkpatch.pl error "space prohibited before that
> close parenthesis ')'".
> 
> Signed-off-by: Kyoji Ogasawara <sawara04.o@gmail.com>

This breaks the build.  You could do a search for it.

https://lore.kernel.org/all/?q=define_fbtft_write_reg

regards,
dan carpenter

