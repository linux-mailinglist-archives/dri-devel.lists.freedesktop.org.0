Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDDEC5D323
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 13:59:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB23810EA66;
	Fri, 14 Nov 2025 12:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="ZsixpfpJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F71610EA66
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 12:59:45 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-b735487129fso288067666b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 04:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1763125184; x=1763729984; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lIa30kEZfIOzXn6c2Ch+jzSexECrPYWXzGffwwy3r9Q=;
 b=ZsixpfpJG1QUNODyjTiTARC5aqtWQZn3wo6hzqaC/PU9M+uxjxvautpzi3C6lQRO2+
 Xwa8admdAen296t0BSmcNfJk8zTjp/rGAQp+pkaT6Qt7ci4gr5cgCaJslNIqvQCiNS14
 S3TjC1HnZ9s0hraBzXhsu7nPnjww2RnfItknmKKrkGI0zBuB6quqHTdV7ihq6HY/TH1A
 f3m08ykeIbetCOv4NTf8aeU+vVAjrTdUZgYInoagJBRFdmMNukg3ZPzGpr6JH+2vgWzE
 tp0EOiNk6mN5i8DhPy/DYyhTEbbDPLme422bI3AVkI4oCEc268DLfaCksr0hxDL8O5ub
 sWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763125184; x=1763729984;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lIa30kEZfIOzXn6c2Ch+jzSexECrPYWXzGffwwy3r9Q=;
 b=dvXg+QvjD5B4vLYzKGJnTuOrebElIRA1TnS/yryfVqyuZsYPOdDMZodDm70PZv04U8
 cdK6SXExz2VV/zanb6ExjkGGI+4c9ArmvaQ8s33VyBh0cvCsmHSbgSvDIQxVRTkHIFpR
 Zvawpp5CxkfP9vATM05UBccGt+pa+7N4GTGTa10bnw6b7Aq4R8DajNHQT9bTAEcJPpYG
 MrzJxP9LQqDTy9XE5VeBjg7zcPqWvl6OO9Ijn9/0VEXPkeuZ/Kx2ymdgEkZZC7iMlQnv
 t2TusBxBJOWF575V5H7NHOdjQiG/QJQitcibnOYAPjlTwzHYixJ3gF7b6o+QAPhc2dMU
 fGbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOG22pDa9TbcBKSLliHw/OW5Z0uEFvifzUW9S4S1537Pj6LrtROshoauVOPnyT6DBTMgj+fsQV4gc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3pgAj5FRjAtAcaJQ08FL/MMSBd586um0hc9CLGcYiHf/nHwQN
 8QgXOP3uI4cpame3/B8SY7/wTfxo6Eahwj88tNhE+f3oTcqicz4XsrNV1LQ9H26TuG4=
X-Gm-Gg: ASbGncsFXJVba+HAru4FxER/P/+Hmb15PbvKLh5BCESA4EFaDT8bB+5BQLd/247SMqn
 ahs+Whc8igl/XSZrukoA818IVE0w3ykih5qPmdS15ghHSOsM68BT30XTMJyEY1uM3LPo0r6mZGE
 8rBtR6n0d7EOK+NM5ln95nOFN3uk85+C2COfyejQnQaXbC3bUW+fjx/BDeaF+NXOSkC22dAaAc5
 SG0C2A9hkqF8jPxRNVvd962Qnc7iYwOKMdm1WG0KjzS65nYro6+gXY6yBqNG+8rJawksXlfZ+Kk
 RId4doHq5++aqO/ZykimHrtUG9zuNhiVm6D5ecdxOflX4XgRaHO+iD5PS+5Y/vCAJ63sRP97NoZ
 i0MGVjmufHJPCAOdxChS7Px47E/HqJm3AAmIn8OT1f+33qjZXvOq17IByNh+YCOKyat54STUsPf
 rDY/E=
X-Google-Smtp-Source: AGHT+IH6H5eoyoDiGCawX8hcyfAIsFqjcgfKx5GqQ3M5ZUeRqB23EXgoQaPPEhXoJ1r2rQPfP0tLQA==
X-Received: by 2002:a17:906:f105:b0:b73:7652:ef9e with SMTP id
 a640c23a62f3a-b737652f76bmr38125366b.55.1763125183501; 
 Fri, 14 Nov 2025 04:59:43 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fd80a3asm382714666b.37.2025.11.14.04.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 04:59:42 -0800 (PST)
Date: Fri, 14 Nov 2025 13:59:38 +0100
From: Petr Mladek <pmladek@suse.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Corey Minyard <corey@minyard.net>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 Vitaly Lifshits <vitaly.lifshits@intel.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Niklas Cassel <cassel@kernel.org>, Calvin Owens <calvin@wbinvd.org>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Sagi Maimon <maimon.sagi@gmail.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Karan Tilak Kumar <kartilak@cisco.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Casey Schaufler <casey@schaufler-ca.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>,
 Max Kellermann <max.kellermann@ionos.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-mmc@vger.kernel.org,
 netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 linux-pci@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
 ceph-devel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Rodolfo Giometti <giometti@enneenne.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Stefan Haberland <sth@linux.ibm.com>,
 Jan Hoeppner <hoeppner@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Satish Kharat <satishkh@cisco.com>,
 Sesidhar Baddela <sebaddel@cisco.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v3 01/21] lib/vsprintf: Add specifier for printing struct
 timespec64
Message-ID: <aRcnug35DOZ3IGNi@pathway.suse.cz>
References: <20251113150217.3030010-1-andriy.shevchenko@linux.intel.com>
 <20251113150217.3030010-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113150217.3030010-2-andriy.shevchenko@linux.intel.com>
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

On Thu 2025-11-13 15:32:15, Andy Shevchenko wrote:
> A handful drivers want to print a content of the struct timespec64
> in a format of %lld:%09ld. In order to make their lives easier, add
> the respecting specifier directly to the printf() implementation.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Looks goor to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>
Tested-by: Petr Mladek <pmladek@suse.com>

I wonder how to move forward. I could take the whole patchset via
printk tree. There is no conflict with linux-next at the moment.

It seems that only 3 patches haven't got any ack yet. I am going
to wait for more feedback and push it later the following week
(Wednesday or so) unless anyone complains.

Best Regards,
Petr
