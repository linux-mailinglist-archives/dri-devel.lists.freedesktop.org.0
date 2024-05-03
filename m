Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 579628BA681
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 07:11:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B78F10F017;
	Fri,  3 May 2024 05:11:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="P/7by1Ya";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C6410F017
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 05:11:52 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-41bab13ca4eso46845095e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2024 22:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714713110; x=1715317910; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IZ52txFEn84DZ4Gx318II2hjm45dLlkgVXuI6MMj02M=;
 b=P/7by1Yat7XpZ/7uYyDUa28goaeU4+wui2URCclcNBDD9OBxk94Jl89Y6jGhqy/DTH
 8IJO/H7j8QrIY0Q/GfGns1pHK/7YvlIbwVzbbCxGOuA2agVhqfrYOHu4rOpl6AW0BeU5
 6t5ke4GtWi3fct60QVYFDkXlfEFGbIc6UaVeDvsKrq3kKalGEBMLDvpvx5KnxgmJgb6x
 EGzCZPXxbJ2GlMx2tcAmai5dwssOAdGpJcO8AWPODLTxK798QRrwd0f4saVX8EZ6Em9x
 H2GbDDiGDdvCjwY54loa3270DMuREjQpw2yNuPTtEI81rnSul0iOoJg2G3Ijq7OR/FtR
 ZZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714713110; x=1715317910;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IZ52txFEn84DZ4Gx318II2hjm45dLlkgVXuI6MMj02M=;
 b=ulyFPQlPDTe4rmzuMMFd8ZH9KpYLMHtAuF3+i363Zb4ER93fC2yrOJF3BrGPi8Y1zy
 3l8IDM6YGaYEECQ66SMUjKvXp9TsZkY4T6jNdHkO13sfVjUFkdfmRZuehRp+uFmhLAFd
 Wh0SVf5vDO+8ps9SmPfT2wbvpNgkPZM2CfISABhhuvUhJhxvreWLEEMnCXo9MsHZ5CZx
 BKQ0BNL6x4VSDOH66r99DIzGib179amnNe1qVynW7zUdF4se90T0xpZ36ccwTyBSvdIr
 ujIXcLLXweVSLsDvmR+LyaHY7kTM5xRfIGUxzVtcg7p3YIKYvPBUuZIy00ITzZdsOFPN
 fN/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMEtlxMdK72qvlingnAx9TI6l+g9ZowD/VQYCrjMzW8/Ih4hZk/OqD2E+qYqmAK4BhtnjQoylB3tj1PNYZ/Dx82VbqjnwKIlXe6bzvnnHP
X-Gm-Message-State: AOJu0YwoY8PYxV9GC+ROd4tyPhDRNbMTDBWPKGfzBKij/DOI3mm0WkNu
 5dJYhohPqGumeh0ketk0VnUc5YoshDI1dqNonrAxYa+NzrHGUOHEahAmFsZv0Gs=
X-Google-Smtp-Source: AGHT+IHlVU6WqV9hfbm78/kvRSpT3qBzDU+6UDBfCiHBW2deYrVDpU1cdv/gO3y+VfA5WQLnrHXNhQ==
X-Received: by 2002:a05:600c:3c93:b0:419:f2a0:138e with SMTP id
 bg19-20020a05600c3c9300b00419f2a0138emr1271927wmb.34.1714713110268; 
 Thu, 02 May 2024 22:11:50 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 g19-20020a05600c311300b0041496734318sm7964771wmo.24.2024.05.02.22.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 22:11:50 -0700 (PDT)
Date: Fri, 3 May 2024 08:11:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ashok Kumar <ashokemailat@yahoo.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: fb_tinylcd Alignment to open parenthesis
Message-ID: <37db687e-ce7f-4f18-8464-f9b04226e14c@moroto.mountain>
References: <ZjRDUO6/M+RDCcQJ.ref@c>
 <ZjRDUO6/M+RDCcQJ@c>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZjRDUO6/M+RDCcQJ@c>
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

On Thu, May 02, 2024 at 06:52:16PM -0700, Ashok Kumar wrote:
> Corrected coding style CHECK: Alignment should match open parenthesis
> 

The original author was aligned it deliberately to improve readability.

Just ignore checkpatch on this.

regards,
dan carpenter

