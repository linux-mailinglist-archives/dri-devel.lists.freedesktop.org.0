Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4B8B3FE12
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 13:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 582ED10E320;
	Tue,  2 Sep 2025 11:45:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VjSeawze";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C7A10E320
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 11:45:55 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3cbe70a7923so4137141f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 04:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756813553; x=1757418353; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KAURuvm1Wpg6S2XJ241zj9NwJgGsyQo3s3hCHb6MUnc=;
 b=VjSeawzeEmh044nEAaIXOYGuv/H9BY4ctMAsz/V5yrzWEPA5Ikl6JoBns6WY1KVY8Q
 GI7KABSQTG2Txt7TBbGSD5UxJ32d/Wr1TB5EznwwSlpefgU+IaBH/44EQWJ8aU+v/irc
 wM9mUbZTbOjg2W3C/9jNbtIGOGMwU5zL03cWSry99NL/cBSpr0E7+Dcv+NMt6gm/+jLZ
 zHEmVbxKeSo+ReI/Ejm392mPo27z3zTgzJ1b8gtxyoF77Such6r1jM5atzr07txfyjmH
 Oyz+wYR08fNEa8cqy9JIcyG8mImFj12OLs/A/i/PCdOmiyw+6VOnwtkn2jcQ4E4UP6N0
 f7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756813553; x=1757418353;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KAURuvm1Wpg6S2XJ241zj9NwJgGsyQo3s3hCHb6MUnc=;
 b=HY5nCLCzrn+IVts+cg7NhrGcyV3xPeA3iYm+355GmBMF/883XmEZWTKSJGk+XgDsIK
 fuPYFau+L6Kg1Hj5AVq7wW6GW3n6DkOVJV8+g7d+8hHLkMHEsUu7rav/AY473n+A75zD
 FskbJIernuzS1e1f8vnyvyAG61TmtonDFg9+rRqmCRhmufDRn1sdUdLksYlLzEemag7V
 1Y+a5QZE2vKyj9XhXNXJ7M10RBP+KBTc19CuNbvjJrxAFdPUSXaDxKJsja9PPQIBHQZH
 rSyHm/R2MzP/P8Y1FFDezQBujL+htUjvj/WcQitQoaJQosbtEjVERLR8TsYBjW3ncbbg
 dbWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlsPu+5/gyJiIIM44SL5Ad/DFswLnOFq42oBqWV1uF/l8L4PzphGtm4W0wKNQCVtU3FNRSJAtJhuk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyoCUz/6OvifiOuFdNpv/+n4QOXQHPSOD1U7dqNjsAwdviTsT3F
 +7bdaB/1mgdyone8rNo1ziVDFGQL8FKax0jE2BDxdpOwi54b/izWLAXKc+jRGmPQIBs=
X-Gm-Gg: ASbGncvWuJsCBgNFcaShT/QUff4XfiV5ThbQeM2desauTbv0GipwVUD7JD8w/6+5M2E
 aokewc8HIuGp+KiUe6s8ode7Qgx98EJIHq6uXIw42xQ6FfDd2kbVBN98cR7tq2LiiA7WAsDbqRa
 y/00Eb58u0i/PSp05aZ910nFu05YK/LPXKaz3Q2TJgR7ZpMgyjIOkvwpNsQVx/CeFkzQta2RG8N
 vByBTVirY7Z/Mt/HZlh7J8g3nu6M4ygu7sm4rI2ut9Bcw69zxNjxJSpy3GY0E3ipS5UmOCZR/br
 R/56cLnQkXkfZSF+7FtQSPqeJMqvxhBQj10s/1Q1HjK8iOm1Lh4M70AhR6scr52kk/FQnNcUWPr
 EbVyvdv7QkVz0E3rsukE/q9YgdDmUecvBOmTTFg==
X-Google-Smtp-Source: AGHT+IF9EFk6GKvHVzME6yE7YYLcfzvU2cnbI5o571RSOMamk9/t7AAxSadtU+O4Sa+l/2oCZKC9ag==
X-Received: by 2002:a05:6000:2889:b0:3d1:61f0:d256 with SMTP id
 ffacd0b85a97d-3d1e01d549cmr9706164f8f.42.1756813553503; 
 Tue, 02 Sep 2025 04:45:53 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3d0a1f807f9sm18560821f8f.38.2025.09.02.04.45.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 04:45:52 -0700 (PDT)
Date: Tue, 2 Sep 2025 14:45:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Yan <andyshrk@163.com>
Cc: Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org
Subject: Re: [bug report] drm/bridge: synopsys: Add DW DPTX Controller
 support library
Message-ID: <aLbY7YmGlmzaGQqZ@stanley.mountain>
References: <aLaQLlJC8qMrnDAf@stanley.mountain>
 <779db8f8.9d44.1990a3c423a.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <779db8f8.9d44.1990a3c423a.Coremail.andyshrk@163.com>
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

On Tue, Sep 02, 2025 at 07:42:25PM +0800, Andy Yan wrote:
> >
> >There is another similar warning but it's probably deliberate.
> 
> 
> Yes, this is deliberate, we will set DW_DP_SDP_HORIZONTAL_INTERVAL when we add support for  audio in the
> future. So I think we can let it as it is now.
> 

Sounds good!

regards,
dan carpenter

