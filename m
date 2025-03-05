Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36872A4FBF9
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 11:30:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2BDA10E28A;
	Wed,  5 Mar 2025 10:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="w1DOqjmr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3D210E28A
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 10:30:49 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-439ac3216dcso44879105e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Mar 2025 02:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741170648; x=1741775448; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZM9smEIxdfydLsi7aDdRFsXj9kTrC7gjF/b3SB21BFs=;
 b=w1DOqjmr7N+RaYtb8dRBe0L7o+OZ8rSQtaYj8E7KVGA7E2Oqw9fVPSdcRoYRDEflE9
 +VWw1RS6qAQJDsXHCo9wf/f/EwW7EF/LvtKwsjPuwULUyTul6CgonmLsRUjSgXuEpIEP
 DrdV9fIlitBsGmyGvKsTKi30cC19jNArgD6eRsh41Qm4B9kjvvsZcAbXj4DiFgd8YF1+
 ITJ0OcxThGXtLz7ZJQg5vf4EDjw3P26RX1qtlBJIohz77exrTXVxeIyZk2AODvcVFlRA
 bznNK9T1xPf5pzaJwwjGm9T1k2yaZ1ZFAG0UBU8GGfb2oVKfsxtm7sbLWGBvPpfK5C13
 zxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741170648; x=1741775448;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZM9smEIxdfydLsi7aDdRFsXj9kTrC7gjF/b3SB21BFs=;
 b=eyTrz/X48xggqqKVX3n1zhPUly62aGTQprjmIiG9fcrDP6azlWQFtOe9qKUWEZ+Ia+
 pSVacMQ9dqfdJilA8rGs2l2I54+JwHhrOK0CcU1FEjmpfWVtzjPnln0pdb0Ka57VG0t4
 /g+l/ias+oxfQIoVeK+pdm7n9Td7UYdcn+JDfPT1iZUkdFBeQsI3n+Y69uDt3vvNfGZg
 R88uJ+mf+OSVt7asBhaD27n+HhJe5V4aYUAOxl6V6R0PyzlysQOziy3DYEMdbUS/UkoG
 eyuUrRjrT/3ZyJyEAymCCYKnYzD1rZ3EWFHkxOz5qJSig21GOhEFKw4LXWGx5nkHXKGC
 K+5Q==
X-Gm-Message-State: AOJu0YycYyUCb1nElgr3TUOxW2IV7kTUct3p4sHpMhRqxa2g8Fit3j9v
 owBNDAha7QypTqUKke4OPU5K0f1DB47kGgQJXO+pjVn9PExau4MkEy9Sl9yNilI=
X-Gm-Gg: ASbGncvttWzM3lrQ1b3sadePLbvHzgctOdjuZbGpUYXTNJilZdbWEwXmm8iosFDSJG2
 u+qBTLcrEGDj8FPPo4NVnxYbi7kTgk68mDhRhPYPwWoXL+HByXCBIdu/Sq8vlRn/YuFl8SmBDkU
 LxC81lRB/kkz9YR4G+pzU9iD4sZQLEqoZCU/RsvtO2oJZhLAMp3ZAgBbmuY7/vVcitfy8c6t0lF
 X/VeKXycUhKUEYU/5PO5sX915tFLgdRaii53nM47JZSosKcvC0/SJBXYJBzSPEo47fjJSrYvxhv
 tl7w0ngElkHsRgi8LbHi59khCO9PQBpP1RwW+Tml+MFEBTIuwA==
X-Google-Smtp-Source: AGHT+IFIOFy5iX9DhSj+P2+fKVZjMgYp9/RPI2X7qRUEcu+WRPiFaEFffWPMtl6d6t+1yLb7CDgX7A==
X-Received: by 2002:a05:600c:3544:b0:43b:cd0d:9457 with SMTP id
 5b1f17b1804b1-43bd293a165mr20516735e9.10.1741170648158; 
 Wed, 05 Mar 2025 02:30:48 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43bd435c592sm13145225e9.35.2025.03.05.02.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 02:30:47 -0800 (PST)
Date: Wed, 5 Mar 2025 13:30:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Oded Gabbay <ogabbay@kernel.org>, Ofir Bitton <obitton@habana.ai>,
 Ohad Sharabi <osharabi@habana.ai>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [bug report] habanalabs/gaudi: fix a race condition causing DMAR
 error
Message-ID: <df240ab1-bd4c-4b2c-837a-2f1c529800ed@stanley.mountain>
References: <1673bf7c-7fee-43be-b1d8-720f93745d2b@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1673bf7c-7fee-43be-b1d8-720f93745d2b@stanley.mountain>
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

Yuri's email is bouncing.

Another related warnings:

drivers/accel/habanalabs/gaudi/gaudi.c:5344 gaudi_parse_cb_mmu()
warn: potential user controlled sizeof overflow
'parser->user_cb_size + gaudi_get_patched_cb_extra_size(parser->user_cb_size)'
'0-u32max + 0-u32max'

regards,
dan carpenter

On Wed, Mar 05, 2025 at 12:59:00PM +0300, Dan Carpenter wrote:
> Hello Yuri Nudelman,
> 
> Commit 17ab47d2d6d4 ("habanalabs/gaudi: fix a race condition causing
> DMAR error") from Jun 22, 2022 (linux-next), leads to the following
> Smatch static checker warning:
> 
> 	drivers/accel/habanalabs/gaudi/gaudi.c:1422 gaudi_get_patched_cb_extra_size()
> 	warn: potential user controlled sizeof overflow 'user_cb_size + additional_commands' '0-u32max + 32'
> 
> drivers/accel/habanalabs/gaudi/gaudi.c
>     1415 static u32 gaudi_get_patched_cb_extra_size(u32 user_cb_size)
>     1416 {
>     1417         u32 cacheline_end, additional_commands;
>     1418 
>     1419         cacheline_end = round_up(user_cb_size, DEVICE_CACHE_LINE_SIZE);
>     1420         additional_commands = sizeof(struct packet_msg_prot) * 2;
>     1421 
> --> 1422         if (user_cb_size + additional_commands > cacheline_end)
>                      ^^^^^^^^^^^^
> The user_cb_size is a user controlled variable that comes from
> cs_ioctl_default().  This addition operation could result in an interger
> wrapping bug.
> 
>     1423                 return cacheline_end - user_cb_size + additional_commands;
>     1424         else
>     1425                 return additional_commands;
>     1426 }
> 
> regards,
> dan carpenter
