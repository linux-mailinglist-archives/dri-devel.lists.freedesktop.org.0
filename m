Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 134E896A169
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 16:58:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B7A10E5C9;
	Tue,  3 Sep 2024 14:58:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="c5tlb38m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70AAC10E5C9
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 14:58:13 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-5c0aa376e15so3052752a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 07:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725375492; x=1725980292; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bSPA4XGA/HMWn0mqAHl9enAU4Xta3+rBwl0NslhmQ4o=;
 b=c5tlb38mNclLmO11hfwWOz47a64ly2iKXET1mwGnTMJ1UU7ti49OIHuQT/Ycv7sDvb
 FwEW2LP4cvrob/Ki3pY2nR4Cgszur/XDcREA2j3FF2PaHokmBLJ1b91oGMZlAIbWnDlQ
 YHw+tl3PYhTpCoTNYYogTEHpVaLQ/CHRgBswR2uq7en3Mv3oayT5inN/HvvIEGQ4TqWo
 sqxcpchN4JX0vpO/tKz2FLSLKEc0PDgUOCuYAVEbDoTkYNGMviJgpUqP9+tjzH04Au/d
 dtoBMvYxFNMNINSjBC/rvb7efIVFGI1IcrxIupki7UOFwTqF2PYCggF5CnNBFJ7Q2p+J
 lfGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725375492; x=1725980292;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bSPA4XGA/HMWn0mqAHl9enAU4Xta3+rBwl0NslhmQ4o=;
 b=TaUPzvP2ybEoPNyqOUdj1xf8FPp8vEqGZ4x5bOKXmkDVMSvd2j7WrI6GoJEOIhYuYd
 N+cHK0I3OAu4oKrl9tCIbacRyxNLW581ATRd14K+68V/HqIAYAXs4DJW4VszDTe5eLyT
 ++Q3eytZVSe9Ugp46z9bhPkcEA8tpl1o7OBoUCzYv7//16II0DM2Bv4kRbLiI3PN+aTT
 Pj6ogqLfFU1RzKsUQlIbZ0faIG3IGix7e+3lw0OFO1uZoAD6qrrf4bDk12xecVbhsIfv
 bP2HvXC363nJM3jArtN+BWEbnlnU1vIof6M+NjymK5GJmaMKIo7R7ObxW5SOu5ZJ5c76
 lodg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQQuiLdOy65lLxr8m/wDps0BWonY4mnH1i8cqP80WpXCnlT12I2I+xfKgSYN6D9aVAHctEyjA++/g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0v4OGUE+p2+ZYyPuSWCd5rBmTH//0iGNEfciyrltZ40DaHMcV
 Tup7uRJASjPQcgriPU5e1POq8/MpAxiOMhm6uDwNrQmgzPKEKX5cJBL/GqskAQA=
X-Google-Smtp-Source: AGHT+IHDyxRfrNtN1k34SW/ZwHHE7I+ng+iaoDNfy1kS+LWoqGSB0gPz+2XnTlBVg8+KYaoyIzNkPA==
X-Received: by 2002:a05:6402:40ca:b0:5be:9bc5:f6b4 with SMTP id
 4fb4d7f45d1cf-5c21ed315fbmr18026702a12.8.1725375491662; 
 Tue, 03 Sep 2024 07:58:11 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c24ff04551sm3631120a12.35.2024.09.03.07.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 07:58:11 -0700 (PDT)
Date: Tue, 3 Sep 2024 15:58:09 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 bonbons@linux-vserver.org, jikos@kernel.org, bentiss@kernel.org,
 shc_work@mail.ru, s.hauer@pengutronix.de, kernel@pengutronix.de,
 shawnguo@kernel.org, festevam@gmail.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org
Subject: Re: [PATCH 00/28] backlight: lcd: Remove fbdev dependencies
Message-ID: <20240903145809.GE12939@aspen.lan>
References: <20240820093452.68270-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820093452.68270-1-tzimmermann@suse.de>
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

On Tue, Aug 20, 2024 at 11:22:38AM +0200, Thomas Zimmermann wrote:
> This series removes most dependencies on fbdev from the lcd subsystem
> and its drivers.
>
> Patches 1 to 3 rework the fbdev notifier, the fbdev's fb_info can
> now refer to a dedicated lcd device, and lcd defines constants for
> power states. These changes resemble similar changes to the backlight
> code.
>
> Patches 4 to 19 update lcd drivers to the new interfaces and perform
> minor cleanups during the process. Patches 20 to 24 update fbdev
> drivers and patch 25 updates the picolcd driver from the hid subsystem.
>
> Patches 25 to 28 finally clean up various lcd interfaces and files.
>
> This patchset is part of a larger effort to implement the lcd code
> without depending on fbdev. Similar patches have been sent out for
> the backlight subsystem, such as in [1] and [2].
>
> Hopefully this series can be merged at once through the lcd tree.
>
> [1] https://patchwork.freedesktop.org/series/129782/
> [2] https://patchwork.freedesktop.org/series/134718/

I shared a could of nitpicks. You can do what you like with them since
none are major enough to stop me also sharing a:
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
