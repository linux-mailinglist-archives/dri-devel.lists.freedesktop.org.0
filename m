Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD4596A56A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 19:30:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A4710E291;
	Tue,  3 Sep 2024 17:30:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cgODgywA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20DF510E5F1
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 17:30:25 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-2da4ea973bdso1109441a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 10:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725384624; x=1725989424; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xq08cW6/BlT4ZW8Fc9W5vNoCU0ZXbSqCDwV0Nd5Dp90=;
 b=cgODgywAlWD7JlsjjAgEO3jonzx0FjY69LaCxa4n/mKHP2KjXJosPI4fbujkxbtJw1
 qq4C/esw6Dhh6ilrqZou4UG7BnarCcf3z2nezyyOTuLNuVQUX1i/hxJ6l4xaPHLyBs2z
 6nzU6vTRLomDbGTJ0i4HSzfT6++d+mkvAxwshPaf1r1z3l705+9dgDzOnquPLX930dTk
 WxRfa8KNula8WJahH2xeLBCcoEfzf54ffNB9ysDwZ8mKoYF24tPIGuRx3ExNf8o1+imh
 /KO/IUxQM2X9RNtxfkms/eGB27m+/cIIuUvgaOvUfijccbCLojpD6/KsdA/GbhaEszvH
 alyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725384624; x=1725989424;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xq08cW6/BlT4ZW8Fc9W5vNoCU0ZXbSqCDwV0Nd5Dp90=;
 b=DBtjDqvUZ7rGUQt2iCKTbM2jX3+7QwV+oC1MphElpQ07dipSWOkj5t/ZR3EOTui+ag
 yTq02+ky+sxQ87wflw4L7tDKwzSTZVPsw0nQvLAid9GO7Bzcv+EzHEdnkf1xzvIgsl7X
 j2+gdNJajTGy5h42TVYwj48zCZmNlmvRpTUE4PfpTvgQPLaG48A7d1SQmsuc2cplzgXP
 TbHmpgkY4CpP0V717Qq+Vx4kCFDX3RbkYZ847upJ4SGiZfEsf0EUkCZxgi6S72FeH/GA
 1GrAgItpxIMlFmE9v1KqhiW+FRzMstsVN8YG13sfuQL2t0iY/GjzuF1F9WU//QyYiMRd
 jRNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoW/OOU7UymOZuQnpt0bqpShEUerltPRAYSqWIFkF5+3FTw2FiVa/6axP9R3Z3YQ1Tu7zfCURYdjc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxzf/dPV+xZO62W/ylBVKpRqla2LsAgHPXiP3Uall6VimJdwmEf
 GeS1gTXj2oKHTz1JHHcSyzEmeUXhxBS8by/IlDflevw9r8ywNHC1
X-Google-Smtp-Source: AGHT+IFlTE1TAIGJ7jQZn6Of9aSyW8eej73q05cpzIIbOcKFy+h7nv/o1+3+2HwdBeVpwYrTBE4w3g==
X-Received: by 2002:a17:90b:c12:b0:2d3:b49f:ace3 with SMTP id
 98e67ed59e1d1-2d85638576dmr17939452a91.28.1725384624274; 
 Tue, 03 Sep 2024 10:30:24 -0700 (PDT)
Received: from embed-PC.myguest.virtualbox.org ([106.222.229.246])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d8edadf788sm4086522a91.15.2024.09.03.10.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 10:30:23 -0700 (PDT)
Date: Tue, 3 Sep 2024 23:00:17 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, quic_jesszhan@quicinc.com,
 skhan@linuxfoundation.org, rbmarliere@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel: hx83112a: Switch to wrapped mipi_dsi functions
Message-ID: <ZtdHqXvwp/L9dZJ7@embed-PC.myguest.virtualbox.org>
References: <20240902170153.34512-1-abhishektamboli9@gmail.com>
 <87plplgkpa.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87plplgkpa.fsf@minerva.mail-host-address-is-not-set>
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

On Tue, Sep 03, 2024 at 11:17:37AM +0200, Javier Martinez Canillas wrote:
> Abhishek Tamboli <abhishektamboli9@gmail.com> writes:
> 
Hi Javier,
> 
> > Use the new mipi_dsi_*_multi wrapped function in hx83112a_on
> > and hx83112a_disable function.

> IMO commit messages should explain why the change is needed and
> not just what the patch is changing (for this one can just look
> at the diffstat). 
Thanks for the feedback. I'll do the changes.

Regards,
Abhishek 
