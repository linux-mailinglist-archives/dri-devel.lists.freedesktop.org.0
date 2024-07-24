Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 052CB93B82B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 22:43:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FFB310E157;
	Wed, 24 Jul 2024 20:43:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iIEnb1LO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A474689209
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 12:53:08 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-52efc89dbedso4383696e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 05:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721825587; x=1722430387; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RbktTslHRI62SL0fVBH02LwnGxNxTB6JLQ6FVIAg5Io=;
 b=iIEnb1LOoux9XkN273egyGnx2spBkWjmiQTSxbBCJ1N/Pkfbi8slicFWuofBgEMs3k
 7Xq3XVwJruyh6mJzglQuBYm5I8ZdwZEHPduAcA2LnWYXOOwVAzqagTq8I++mlLRKCdae
 0+VBY1ZpgeUFA7fgAUTvmBaTfz+f3PTYIOZ6P6R7uk05XU0DWD/2CYH2dHIqieYl8AcV
 wnfYWeUMyBSDE/0vG3IxosF5T9FJZstp7G58AO4NM3agFVw0H6DZAxCrQAZVdG9DXrDX
 RFpoUpdJTavENxvLBx2BSiaFoI3xJwLCZUYk/Eln6XXNkIpHqVg5Zq59BS42F4jCDGk1
 Beuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721825587; x=1722430387;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RbktTslHRI62SL0fVBH02LwnGxNxTB6JLQ6FVIAg5Io=;
 b=bDCRFcT3lr6B967IgmH94NzA2Fe6U1+s2EKyz19hdaQJyMwZa9EaCyqIGmlmtCDHyg
 5ZLVT3XI462xx8YQ09uHGFY55OoQn0zez9kGyR4gUvjVwKuH9PNNlI9BOp6khtVs2Z65
 EoddXtYhzn+jR5DIzmgRyHttdRjJ2c8BuTDlZwPBgiqxvKBgNYeVCSlG0lrwA52X/x6m
 s15HvtJdvcvRZHlvj8eBJqQ9ZrFwQ3iZFVtCfVoW/OcnMpM5n4ZYSTmpnYmeaDA4AhZ7
 qxGSRXsrVWqloNJ8XaoSPHZide0IFE7DCCie4EvZXVHcrdbAskzJeCrYL8ZW/a3qr/jB
 GskA==
X-Gm-Message-State: AOJu0YwhMJyVheKtpRGkqGrzzvFLAvNJxg9Cf/xCi12ZqLfQanoYV0r9
 tnl7gu1Ec+PO0DwAbAPDXfDATTP7RevjZo4vRc+lYXMixr4S20+Sgw1Ooo8ECvGds21Ex+wBu7T
 TO3SnDScqlttaOqlNDYQw3anqVcw=
X-Google-Smtp-Source: AGHT+IGhVvkM57oGJtesNkDESQHwWoshxJJ5Ie7BPMiP3wn0sZ7xomONVY1Wk2poNJqDKrL/Kfyzk+YpJeS7Jt5hFZY=
X-Received: by 2002:a05:6512:3d90:b0:52c:896f:930d with SMTP id
 2adb3069b0e04-52fc4075ba2mr4214211e87.57.1721825586535; Wed, 24 Jul 2024
 05:53:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240723060311.32043-1-riyandhiman14@gmail.com>
 <2024072339-elderly-charbroil-5d5d@gregkh>
 <CAAjz0QbtK=c98QP5t76_=_Xrg4+3bHksXR=_QJfz0W0f_zZ=vA@mail.gmail.com>
 <2024072320-trimness-scribe-8055@gregkh>
In-Reply-To: <2024072320-trimness-scribe-8055@gregkh>
From: Riyan Dhiman <riyandhiman14@gmail.com>
Date: Wed, 24 Jul 2024 18:22:55 +0530
Message-ID: <CAAjz0QZpJWBHxn131xaeGHoUyLA3rf4JGRW9Vaw6ko9+zEz8hA@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: remove unnecessary braces in if
 statements and space before close parenthesis in function call
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="0000000000007364fc061dfdc250"
X-Mailman-Approved-At: Wed, 24 Jul 2024 20:43:25 +0000
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

--0000000000007364fc061dfdc250
Content-Type: text/plain; charset="UTF-8"

Hi,

Thank you for your feedback on my patch submission.
I understand that the fix provided by my patch is not needed. As this is my
first contribution to the Linux kernel, I am eager to learn and make
valuable contributions.
To ensure my future submissions are more aligned with the needs, I would
like to know if it would be helpful for me to focus on the following types
of fixes:

   - CHECK: usleep_range is preferred over udelay; see
   Documentation/timers/timers-howto.rst
   - WARNING: Unnecessary ftrace-like logging - prefer using ftrace

Could you please advise if these contributions would be valuable and if
there are any additional areas where I can be of assistance?
Thank you for your time and consideration.

Best regards,
Riyan Dhiman

--0000000000007364fc061dfdc250
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><br>Thank you for your feedback on my patch submiss=
ion.<br>I understand that the fix provided by my patch is not needed. As th=
is is my first contribution to the Linux kernel, I am eager to learn and ma=
ke valuable contributions.<br>To ensure my future submissions are more alig=
ned with the needs, I would like to know if it would be helpful for me to f=
ocus on the following types of fixes:<br><ul><li>CHECK: usleep_range is pre=
ferred over udelay; see Documentation/timers/timers-howto.rst</li><li>WARNI=
NG: Unnecessary ftrace-like logging - prefer using ftrace</li></ul>Could yo=
u please advise if these contributions would be valuable and if there are a=
ny additional areas where I can be of assistance?<br>Thank you for your tim=
e and consideration.<br><br>Best regards,<br>Riyan Dhiman</div>

--0000000000007364fc061dfdc250--
