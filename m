Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF27BA31857
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 22:59:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E99D10E10F;
	Tue, 11 Feb 2025 21:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Vgji2NWr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C5910E10F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 21:59:31 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-46fa764aac2so46843731cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 13:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739311170; x=1739915970; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=oWVLgu7olkt5+huG/rzR9Tf5v467L92GDvtiRJVBA8g=;
 b=Vgji2NWr3sHHL2RGDADVeZsIUbwyclDv2bHyfG+CjDvrM3KA5z6TlbOshuI+WGsGGz
 yefknIQyrQP7ihuOUXmGKMmDiz0nd5vzdWDm9LTETpWDoZdJdqrNMEsgnnb3M2KX/NXU
 MfRnr6cNTBoXDYsbcVPJ7hOmFpQptCkqGjd6RT4w6OrnYIVIA0bdkzc3SlevZoYxiJ6U
 5x/Ymxof3fphLRnDm+/sZV+FrkvagX26q9r6UZIRVZV0nmzgps8xB1aqp2mG4shJc0al
 jrB8McrzlYdMKsGml3tOLOm0SU749tPToeoe4JcqnitJVRhohFykeFZB7prEbJxpXJH7
 oTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739311170; x=1739915970;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oWVLgu7olkt5+huG/rzR9Tf5v467L92GDvtiRJVBA8g=;
 b=pGNYlBL+sdSw7IM0kkl3qBSu03wBcN/PqqRCAssivEhUooQidTFmnIlAcTd3FGNSIv
 YMPu7ckQ6TbaCcxo4wUG+050Ki9xsdID2Vlf5Kv0yfyUyfOHHxRU5toBfZhQQ9D1xMup
 TYqHxz4FTKEJBcmbMYK7yA4BuU/uDSDGntrjfvI/kTOp3tWaNa6foYHe7Z21Mnka6l+C
 JSVJvx9WSpMZ+Hqi+vRLFWNbMCjnJeeADnugoSO86faFd+WusOT3vWsmTodI98GlLs5Z
 L31yotrwsvpu6DawPBfzk/bqJFAABozdMYg5upXVFgtHN6mbFdoKmTVX8uHbp526vRIU
 6DVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzE/BKWb6j3yOp4joVWC5olBqcpZjLdIGP0puRAUo9lJB0iICO05bLYmUaSvSfPZZ5Z/y5EwjuTTI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy784T18z9w9nh9GDFYWU8c2ECCtLGVOHM8J6webPCYwGTnOEyX
 L8w6yY32UPqTWRMzaOMgQKsEsZkmIBrciuCU/uUB7uhmwB5zf+Wy
X-Gm-Gg: ASbGnctNNJy8Z1KtmYzc2MlS0iQPVR7u2muYZlImVnt4exymbiSZWg6TN8QZwfXa9Yf
 kVvlPJoIkVJfVwYQSNz9vcZ/cOYOUWTEHOiL3Tk7UUkTmb535tQfK8/YZKhVb2UlHYHGPl+Sprr
 dxwYFc/9RCIpS40XfBds+FDBONvCceeNpGk7WmSYOgNQq7J7T2cLwIBbRhKzAWkkrHThul5GWbU
 rhttuSebJ37E+5KFtKqs3guIvc8dGnReSuEajwHh1WMgmtQKmeRIN1hgORDRDqtfQ7IMqKVrlN4
 f/bglG7uPCLdm/BP
X-Google-Smtp-Source: AGHT+IEWJDst8vVUPVOzrV15rAaTZFTwjzJudF4qLztVldbN/osRbxPXG0hpawApAKGPW+1aSKayug==
X-Received: by 2002:a05:622a:15ce:b0:471:90bd:1454 with SMTP id
 d75a77b69052e-471afe616bcmr13548361cf.23.1739311170152; 
 Tue, 11 Feb 2025 13:59:30 -0800 (PST)
Received: from VM-Arch ([2600:1001:b149:3a35:2d69:a3ec:38da:b6af])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e4556d153asm42604646d6.13.2025.02.11.13.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 13:59:29 -0800 (PST)
Date: Tue, 11 Feb 2025 16:59:26 -0500
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc: airlied@gmail.com, simona@ffwll.ch, tzimmermann@suse.de, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Update maintainer of repaper and mi0283qt
Message-ID: <uwkyq63ovr3xcvgvxeuzgwyplkqxdgjqtosvftxtv6awtds2sp@wa6synmq76ja>
References: <20250210233232.3995143-1-lanzano.alex@gmail.com>
 <221ad1f2-307a-4ead-84e2-4b6c4331a20f@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <221ad1f2-307a-4ead-84e2-4b6c4331a20f@tronnes.org>
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

On Tue, Feb 11, 2025 at 03:16:37PM +0100, Noralf Trønnes wrote:
> 
> 
> On 11.02.2025 00:32, Alex Lanzano wrote:
> > Add myself as the maintainer of the recently orphaned repaper and
> > mi0283qt drivers.
> > 
> > Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
> > ---
> 
> Thanks for picking these up:
> 
Of course. If anything changes in the future and you are able/want to maintain
these again don't hesitate to reach out.

Best,
Alex
