Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A520DA308A5
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 11:38:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A22C810E1DD;
	Tue, 11 Feb 2025 10:37:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y41wri4P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F2E10E1DD
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 10:37:57 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-439566c991dso623425e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 02:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739270276; x=1739875076; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=uPih6RmxhXX44zZpcRb42vvRRosF1lmIcSHcvUi6Vl8=;
 b=Y41wri4PxwM/Sm57G7KsE7dDeeExTX6yUgG59T7MqcIiJQt1Uvwrm6DKh9r7/VCgiy
 TLYgvuew2JgEcnNfMuRuqoQi1QMImlad0mgl48pZb6CuelvZndYS9DExtLidSgIbwi9B
 Glij5dFVsTNUwxVFCtJPzQ0z8aKKp8qkzQVbblViR+gEfiF5d+4ojGaRsz9cXe/DD0Ol
 KI9vZzX5OqdJEXcjiRQSDuoF6Ln7EofyHiKYerZoIDYxNYrb8CqfQ2LAnuzBS8QbE4La
 ST7i1nnRfgTCwimw52LiDd9gVHSo0dD6SsFyeEDvcRSu6QXRFATtVF3ciFA6+eFQTtju
 r+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739270276; x=1739875076;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uPih6RmxhXX44zZpcRb42vvRRosF1lmIcSHcvUi6Vl8=;
 b=E0RYzpsHpczncgLlC8p/qOdfFmvFdN7MGjVriGCX2iR5YoctHhtKMTVrjCs/aEVzl9
 RWB/+i2/jYceA8JQhVVjSovGMyXXbEl/tm/aVLgeiUiops4H8e+MK4iaDhCMuoOcHvde
 ObitA8vmGd9UnhYguxk8zlGRaWQMseUcNzA8m7cTu6XC+bA6n/WHM6f6GitGwPCzFL50
 wMqZWdQtU/Iq0YYrULmhh44zizsRLeHdqgzp5MoODT9IyDNXygsf/Aw2hQgaroj/CFwg
 O7i6McdVp6Yy1P4Y/Mhk8nAPPMcoCq+kFYOTNl4G8aGcoBfeYxkFS9vLRXskF+XyvG+n
 yogg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSf7kmT3jb/4TckRCL0vKQxTbvi9bSgVyijtIpkhJC3eQlb6hNGitjYqrXfo9+GirkMGrvKVA6SuE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjJY9z0HS/NCILzTZOBlqHC4FOFk78TXn3jTnxzxlg+4XzM2bX
 HeDkFOzjT+ZGYldO0Q455I0pfdGHmN5jxT5ivUcni5gu/NAWKgbI
X-Gm-Gg: ASbGncs7Z1qBd7YKI40nyarkuzc38wsNWKZFt9FvyCSu5ud9NTGG1LZZ004S9Izy1br
 a7VjrnrPagkwFK23iYiNXn6QACPcNY+fQuB914/0pVU9iX+47jb9lMMNM7ZJ0a3hBcZWSvMcZHz
 GuV9uwZVOLotQS4OtLwt6/fbQ9zvdhYgMJTfO0kR3V4OoD66zuZJzPC0sqq6oJo0SGphDRyZ7Ao
 DClTNZ7WBgGKx7cpL4K8U972xT2xkgzqRFkZDNeXby/BLUqZjYm5oR+RDFpfyvH0F+9bBdWdq6K
 Z6MVs1c8ggvSuQ==
X-Google-Smtp-Source: AGHT+IHUAG1gQUToW8Ldg3EJ+gI5dVHjjkhF63AvJE2KskYLs9RhNP26TOiIKV8k+wycWw6OVBDjoA==
X-Received: by 2002:a05:600c:a45:b0:434:a923:9310 with SMTP id
 5b1f17b1804b1-439249913a5mr150762675e9.15.1739270275823; 
 Tue, 11 Feb 2025 02:37:55 -0800 (PST)
Received: from fedora ([94.73.37.161]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc9ce31e8sm11826410f8f.5.2025.02.11.02.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 02:37:55 -0800 (PST)
Date: Tue, 11 Feb 2025 11:37:53 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/13] drm/vkms: Extract vkms_connector header
Message-ID: <Z6sogfnUBv0dVln3@fedora>
References: <20250129110059.12199-1-jose.exposito89@gmail.com>
 <20250129110059.12199-2-jose.exposito89@gmail.com>
 <Z5uDGhcvNIGDwEr-@louis-chauvet-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5uDGhcvNIGDwEr-@louis-chauvet-laptop>
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

Hi Louis,

First of all, thanks a lot for the review.

I applied all changes you suggested and, especially thanks to the
iterators you suggested, the code is way cleaner and simpler now.

I'll send v2 in a bit, but first I'll comment on some of your
reviews to clarify some porints:

On Thu, Jan 30, 2025 at 02:48:10PM +0100, Louis Chauvet wrote:
> On 29/01/25 - 12:00, José Expósito wrote:
> > Up until now, the logic to manage connectors was in vkms_output.c.
> > 
> > Since more options will be added to connectors in the future, extract
> > the code to its own file.
> > 
> > Refactor, no functional changes.
> > 
> > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> 
> Non blocking issue: Do you think it is possible to split this in two 
> different commits: one to create vkms_connector.h/c and one to create 
> struct vkms_connector?

Done, I split this patch in 2 in v2.

> 
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> [...]
