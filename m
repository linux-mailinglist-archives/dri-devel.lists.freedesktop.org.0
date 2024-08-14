Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C72AC9517BD
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 11:31:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E46B10E0A0;
	Wed, 14 Aug 2024 09:31:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EsPcZ1Tq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 326B010E0A0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 09:31:04 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-53301d46c54so151712e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 02:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723627863; x=1724232663; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Y+KbS6E5jHMJIDLTLixLRMsMiOWTcgBIJLTFtv7w7UE=;
 b=EsPcZ1Tq/wGS9g1BEmT7L0IYm/vJ8c0Zq4J6xN3Up/1Gttg3wKgf4pfA/6PcBNss00
 zAxub09yQobddnTRajeRdHv36LURGcUBp4Zq/N/0IJjsqxAx5G0G+lbrptB/A4AJKQ17
 FxcfnIhmvHC4CkEmtzcg1V51HTthLuiB+87moFL4AlX3DcGir5H56YcFGgBFh9eJReVe
 iv2XRn2jlueA8A43bqau4q8QiCnKKMpjRFQjkqjB1u5QmQq4OyZXVyArLK4GfeQby2yK
 QSdbl8Z21bAJGYjN9EOEHHbt+dDpSRS7ZBdklh7IMfn+xBS94vwwFNBHAXC5i46di7Dq
 z77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723627863; x=1724232663;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y+KbS6E5jHMJIDLTLixLRMsMiOWTcgBIJLTFtv7w7UE=;
 b=rlPHr9FuFx9DEOVCBYCPTVP2t2jQ8L2v/XLukRF2AI/BqBMbs6DxPCsg57WY3/0kNN
 HayPy1XagReCKi++6coAHVGIDVELi8g+9etxYjOkZ42W15DfiULJqTc2RHhaZ45EZ+S+
 o8a1pynIIK2fSLU/lQfUt1LwmvCcbdryZ809ZfeXAXdoJiooyDmbSSMXF4DE0U/piYKz
 7HZr4zxmdfQyW6T0CSi+QmzVl0YJYVRQptx4QzoXK2g7IW8K/EmCkQViNPNIvPsHeI7H
 +I2dY2ithLQ/S5MENOQjygA4qMO1ncmMXgsksmfAjptalkde7GgBPPxzoYljlhlNaw83
 Q6EQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXV4vj7k35Pe3pQ/bcnBzUopVjxsSONoYRPttssh5UeTK6GHHqMaioXRDWZYcwqKMJbS7kA1tnwI3yvMg7JyVsJoHL3AI7Qh2h/DPKHlur
X-Gm-Message-State: AOJu0Yzjmoftyw+OOOTk/osHUvhY40e94b9xoxIF1W/UKVafkxNLOuf2
 9H7Guph4uni++3c5Yj0+NOTMcsq4S1eYxTvELmmiBFnnXajsyKZsioofhdALBwa9Qotv6GyFF40
 T
X-Google-Smtp-Source: AGHT+IGLOjNiO2yF+uZM/WShxzq79zjBJ21zqgaSpWhugas9BKUwHG0KuNYWyEZ1yCqqo26VlQTFIg==
X-Received: by 2002:a05:6512:1249:b0:530:c3e9:5bcf with SMTP id
 2adb3069b0e04-532edc04875mr1103977e87.60.1723627862785; 
 Wed, 14 Aug 2024 02:31:02 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ded32538sm14023275e9.16.2024.08.14.02.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2024 02:31:02 -0700 (PDT)
Date: Wed, 14 Aug 2024 12:30:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Riyan Dhiman <riyandhiman14@gmail.com>
Cc: gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: vme_bridge.h: Document mutex in
 vme_dma_resource structure
Message-ID: <545da5b5-fe99-41c8-9cc2-a5861a04ba2b@stanley.mountain>
References: <20240803001814.7752-1-riyandhiman14@gmail.com>
 <1e74a5ef-7d15-451e-8cb8-2743ef95089a@suswa.mountain>
 <CAAjz0QY9jDUx-URQTtdW3kO2mkfV4dhUsJhB9-k12SEt++Gp8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAjz0QY9jDUx-URQTtdW3kO2mkfV4dhUsJhB9-k12SEt++Gp8g@mail.gmail.com>
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

On Wed, Aug 14, 2024 at 09:11:22AM +0530, Riyan Dhiman wrote:
> Yes, I agree 'mt' is a vague name and doesn't convey much information.
> In this patch, I have added only comments to address the checkpatch error.
> Given your suggestion to change the variable name, I'd like to confirm,
> Should I create a new patch that includes both the comment and the 'mtx'
> variable name change?
> Or should I leave this current patch with comments only and
> create a separate patch for the variable name changes?

I feel like renaming the spinlock is more useful than adding a comment.  Plus
you can't really understand the locking without at least doing a temporary
rename to see what places break.

To be honest, we don't merge a lot of "add locking comments" because it's
probably one of the trickiest checkpatch warnings.  You need to understand
the locking before you can add a useful comment.

When you're writing the comment, your target audience is Greg.  Greg is
obviously a very experienced kernel developer.  He works in USB, stable kernels,
staging, tty, device models stuff, and a bunch of other things.  But, he doesn't
know *this* driver in great depth.

When Greg takes a look at this code, it doesn't take him long to make a very
educated guess what the locking is for.  If the comment has less information
than Greg can see on his own at a glance then it's just a waste of time.  If
someone had questions about the locking would they be better off asking you or
asking Greg?  Until you can answer questions better than Greg then it's not
much point in it.  Again, Greg doesn't know this driver very deeply because he's
focused on a million other things so it's not that hard.

Trying to figure out the locking is a good exercise.  It wouldn't surprise me
if there were some locking bugs in this code and you should try to fix those.
But it's not super easy either.

regards,
dan carpenter

