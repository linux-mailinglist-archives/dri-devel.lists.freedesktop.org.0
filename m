Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC36D835FFA
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 11:45:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC92210ECB4;
	Mon, 22 Jan 2024 10:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61A4610ECF8
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 10:44:39 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-40e60e135a7so30246425e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 02:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705920217; x=1706525017; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mBWNCLLFubdT9fJ3cv8e16Ff7jYhvZKyENiuEu8Dr8s=;
 b=LGu8A5lXkcGjcglP0t5/trIbvZ9yNhQEw6F7v74H0i2jBYbLoZsQ05G5r8qxJEb2bR
 PkwC8IobfloyBvXh/iCM347Pu5WmCZRr2ICN/KRcI5eHi9PFDCZziNDbRxGfwGz8PuWa
 1QWWE5LW11epzkzI3TTzBekvEqKHTEtCrUCrPp20c69fBPTQHQ1wF5tYkNR/o2Z4sOcb
 BU6sFphueVhHGoFdhDoFdR3vfKrEpgHuTndaz+xR0U0Lflaf5ZpeFxIs9cvOjDqB5BNH
 cGUIK1gnXoBUN8baqdRu6G2IK6C32at0hUqWW1sD2eSEaJEoda+bJFWg2W5bgeWfDtBD
 MqYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705920217; x=1706525017;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mBWNCLLFubdT9fJ3cv8e16Ff7jYhvZKyENiuEu8Dr8s=;
 b=VUPOxc/oBPLQIB7QUfZSu9u+h8757X2HaeT7aYZuicZdYfvsf6OG0CLHrmlXylFPmC
 mWuxaghrDwyahlTU02xLMdrmjzMBBapXHpe+XmX+oeGRMkA0Y6oMgI90IXq0NBBx2pVm
 xQd5756gOGaqAT1gKFgOCGwAk5cQ5H6cZBgmyvvlTDFyFeIcjtVMY4VOKDV9cB19niZf
 XSGDneqDIi7FJ8Y7+H6lEva1ipsAysluEYwDhaHlUDdPrxYFgql/+DiLilDvdJinvG1U
 L0Vw5n/Jgtwj8qfIqrWpTyicj3GhAqK0mqjvKObEVIxPmpiwxlVNWEDDwMhVHc6hseH/
 cjzg==
X-Gm-Message-State: AOJu0YyFPHVvXcR7DLzYjB1J/jZIERUaYe/hLMm3uw2jd1RaOZaga38K
 kQDlWyLtXUbUwxwTBQqrrD8J/0J/PZc08hzNFtlqr6v/ovIMol06NLNkGgy1wj0=
X-Google-Smtp-Source: AGHT+IHzftdJu5Tfe2SF8LvabynhKKZASp+dGkCarsLc7Hm4XRhrssvAPcplXGyZx9jwYzzGDAuLwQ==
X-Received: by 2002:a05:600c:1d87:b0:40e:ae91:1d38 with SMTP id
 p7-20020a05600c1d8700b0040eae911d38mr512318wms.33.1705920217017; 
 Mon, 22 Jan 2024 02:43:37 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 v21-20020a05600c445500b0040e3bdff98asm42176303wmn.23.2024.01.22.02.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 02:43:36 -0800 (PST)
Date: Mon, 22 Jan 2024 10:43:34 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 2/4] backlight: hx8357: Move OF table closer to its
 consumer
Message-ID: <20240122104334.GD8596@aspen.lan>
References: <20240114152759.1040563-1-andriy.shevchenko@linux.intel.com>
 <20240114152759.1040563-3-andriy.shevchenko@linux.intel.com>
 <878r4rovk4.fsf@minerva.mail-host-address-is-not-set>
 <Za0g47CgOH4MhdRe@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Za0g47CgOH4MhdRe@smile.fi.intel.com>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 21, 2024 at 03:49:23PM +0200, Andy Shevchenko wrote:
> On Mon, Jan 15, 2024 at 09:22:19AM +0100, Javier Martinez Canillas wrote:
> > Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:
>
> ...
>
> > > +	{}
> >
> > While at it, maybe add the { /* sentinel */ } convention to the last entry ?
>
> Maybe. Is it a common for this subsystem?

I'd answer that slightly differently. Backlight does not aspire to be
special regarding this sort of thing. If this pattern is becoming common
within the rest of the kernel then its absolutely fine to use it here!

There are certainly backlights that use this convention... although they
are not yet the majority.


Daniel.
