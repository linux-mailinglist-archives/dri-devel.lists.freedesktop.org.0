Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3209EA561C8
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 08:29:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C0110EAA9;
	Fri,  7 Mar 2025 07:29:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="i1SekeXh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB9F10E340
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 07:29:04 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso16469625e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 23:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741332543; x=1741937343; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IUreiTCZVZCY/sR49qTRb5j3OTUwCXV8SCtHZI5UAQU=;
 b=i1SekeXh+u8M2DVtvRGhYq0ZHSwqdeYGRV1E/XV+9QJGP6Tsa3rQ1RZbDbt3VlnIe+
 k39+6XQ36hqMRptap32eegavD4gzkTe/1/4tJkMFC7pZtSWVFGMyzOLhbGPzX3NR8krr
 73+69kKufrw50hX0buEgTkRCR1e2Pqd0HDDj0FddOLKna2VWHlLnjMgoTiU1QvXccYY1
 sfnWuWeux8cBQThYkYJTQH9j3P5P90TNoBX+NldEEMTZYgU6UFmYiALktCiaKQ4kdy0t
 F+mOWX9ydt94ZsJ7txqhGDKviVtswWAS0DKfNFnWXMyFS9mJbp9ahCm6XllgOwruE/dB
 LFwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741332543; x=1741937343;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IUreiTCZVZCY/sR49qTRb5j3OTUwCXV8SCtHZI5UAQU=;
 b=TkY4XyVJuTBY24HSjzOR7UsdeGtM59fK7xzoQ8wbP93QPqiZsKjT/uyyF6sLn42pZD
 eMefPd+ETJ93EzAZ2QCDIK4ztVS299iEJF4lo9c9FSAf85CAUOriLJmanCP05nXQaec8
 FPxNAJYPB4vkBSSDl7KYz+EHeKebJoMmW7eiGw420xRNTPDamubpVeAi52of14ajkUeU
 4BZvAaV9OYOB9A7LrWmTZzMhm9v+mDtQZqPY+TLL143W67aMP/7DZT5JW6OkrIyGdi77
 /+T8/rATije1FN15Iqke4TtX+Fr9BPN3K9euXLnR6D12Di4vEtoJ1LLFXxs0/mOFi519
 jZow==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrj97KHRGtb9xXVqDnt9Ce6n9lHqs5UlIA2ZIC72XObUPzP7DZhdY1XXvEQJV8Y/z4RuwLsimcg/8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPJZuybC4HfbaSJUNPLlrR9qYokxhNpZq+v5DszuVJhpRCgE+z
 i0HX5xGi+KSuvAt9EbHm37m28HcgbJmKIhZqdWLyS26doxv9r9Dbf7G0D14mgv4=
X-Gm-Gg: ASbGncsAfc7w+ki5imWwABhYuzbWFlohCUpgDv9FRJF+PZaZ0z8mH6zIJsH+uFP6kge
 14WVyj5kGCMToeeJJc4v24kOI8fHbPo3ovQ2fIPEKS5bjT2Mjn8ZRNrTIJoKlUS9xQFzjdzjpEB
 TVvFVgpHmb880dLxTAjt1K9iHpx7+UY8J1Uncc5GZE93pAmgZsqbGM1dkwTAhA9jZZMXGhM9/My
 aBLYps7kh1WSGgOqTs9ymVl7POw/HZMAlbX3cyu3KA+r8Rb9Sz23+JW07YcZSIraUmzxsd51P67
 qF0B8jL7orX5q+/Iwwps3x6L4W8krFfw395oCKC8XFyKeahjQQ==
X-Google-Smtp-Source: AGHT+IG7+0XvfqpXEa4bb2S7ULVZlAWD2yns/3fQUyBqRZKt9KtX+yqDgzdFZ1rvgJVCkq7kZRve0Q==
X-Received: by 2002:a5d:64ac:0:b0:38d:dfb8:3679 with SMTP id
 ffacd0b85a97d-39132d228c5mr1671359f8f.17.1741332543129; 
 Thu, 06 Mar 2025 23:29:03 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3912bfdfcfbsm4355592f8f.28.2025.03.06.23.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 23:29:02 -0800 (PST)
Date: Fri, 7 Mar 2025 10:28:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: Carl Vanderlip <quic_carlv@quicinc.com>, Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] accel/qaic: Fix integer overflow in qaic_validate_req()
Message-ID: <0716c1d9-46e7-4345-b005-314f5631aa74@stanley.mountain>
References: <820aed99-4417-4e4b-bf80-fd23c7a09dbb@stanley.mountain>
 <03bfed13-c541-4a09-8330-ca3563be0f77@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03bfed13-c541-4a09-8330-ca3563be0f77@oss.qualcomm.com>
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

On Thu, Mar 06, 2025 at 12:12:53PM -0700, Jeff Hugo wrote:
> On 3/5/2025 8:53 AM, Dan Carpenter wrote:
> > These are u64 variables that come from the user via
> > qaic_attach_slice_bo_ioctl().  Ensure that the math doesn't have an
> > integer wrapping bug.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: ff13be830333 ("accel/qaic: Add datapath")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >   drivers/accel/qaic/qaic_data.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
> > index c20eb63750f5..cd5a31edba66 100644
> > --- a/drivers/accel/qaic/qaic_data.c
> > +++ b/drivers/accel/qaic/qaic_data.c
> > @@ -563,7 +563,8 @@ static int qaic_validate_req(struct qaic_device *qdev, struct qaic_attach_slice_
> >   		      invalid_sem(&slice_ent[i].sem2) || invalid_sem(&slice_ent[i].sem3))
> >   			return -EINVAL;
> > -		if (slice_ent[i].offset + slice_ent[i].size > total_size)
> > +		if (slice_ent[i].offset > U64_MAX - slice_ent[i].size ||
> > +		    slice_ent[i].offset + slice_ent[i].size > total_size)
> >   			return -EINVAL;
> >   	}
> 
> I agree this is an issue that needs to be addressed.  However, it seems that
> overflow checking helpers exist (include/linux/overflow.h), therefore open
> coding a check feels non-preferable.  I think check_add_overflow() would be
> the way to go.  Do you agree?

Sure.

regards,
dan carpenter

