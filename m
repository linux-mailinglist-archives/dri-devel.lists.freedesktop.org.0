Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3835FC4C410
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 09:08:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE0A10E4F5;
	Tue, 11 Nov 2025 08:08:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Nm2HOhJA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC4410E4F5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 08:08:43 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-29586626fbeso35385365ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 00:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1762848523; x=1763453323;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0w05K6KxFo07worIjxTlWcgaX/lcLwwSdDEeFRVch6g=;
 b=Nm2HOhJABgyYNtOeExcuooKzH7xxpIibBJCSCkvNuFo2+1uSjOgv9AEP1Kd1uFRA/y
 JFdyRBt5SUa7ZczlcUUjBJt8YEjzxgf1spJ/fcf044hHaqqzAIE5919G3puVXofL4Nba
 QSWhumhpIMdWqlToeHV1GWTmsye2y9BGmVIc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762848523; x=1763453323;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0w05K6KxFo07worIjxTlWcgaX/lcLwwSdDEeFRVch6g=;
 b=YIy7aog9+NOYJTVVJWoPhKKeIGPK9GtRll/G4YAsoWs9xS9m9g0D72wNl4vc3iarb1
 97wNW21jE+8mpt8vNbG0l7NO89oVC0/eFTGaZtcmvLBPcdYbcnKoZV4sZ34ea5MBFUuo
 AbrveWJpIRs4uHFMwOJ547t7dqD831boH+040OeLJdSLMI51wUb1Iha9kVL2UUk2luh5
 KYN55WePScZerRSoEo7qzb2cEXOW21aaVG5UuwRAr+DyAMjDD84/U2geT3Zai7i1slja
 xR4gaaGN37lZdhRS1T5mI3K6O4ePpfPpkxqz1cT7NjKVipvS6oB9nLtjU2/nxTTmskZi
 DGWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQiY5PdSsyMqoQGPhqzrxrHbLV+d9qWGrqOTkfCuH838dbcGr28GjrDffLRrISRGbv63wkDiDkWt4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzt85s952qyDsK4r3UlL7Tc/eNQ83Cuz0RLWCFMbQm873Dz3QAx
 rK+LAX/Su/Rq3ysYOJvYeDDtPUng3W69XkX74WtfXCFF1cQp6AkIPWLIyZJhTbgIcw==
X-Gm-Gg: ASbGnctXctir+UUv8PkedwPoqiM0AhxEJFEbWBkduM5D4k5C57GjQRLnqAO7B6PZ1i+
 FA0OSm1BRecX3pgocBSLUyCclAJo0KWt3XNsIOgnFmhFCaHx9N3X60TH0NqTb/9iYldXn9i2a5l
 wjqgAbEo831lR9fQ4/D7ZDpkFkm68EIi2z5DtG3EpU7Phl33/+g5ADELN6TAhocmN7YkyX4lI0I
 Uhrvy+TPDl1AfPjaTj4mBOmSIW4yJN8qJnGruLrBzQz4b0obu2ZXjgCqZHurmH4Yv/UkRIyDnpD
 M5WtHbPix9HYbEq04rcjA57UarCuPJUB/KKqHRMqfuIky7QjJBvjdHwZr76PnCPHB6fEnI89erj
 XK+Q+5XhqFKlZo6IqofaHXTHUr5eji7kdjU7ntxnCBWafRWwhPE8RugpAuxE8GO7omGgVKZ2Lba
 DBYlhB
X-Google-Smtp-Source: AGHT+IHC6xuDhDXvZKC9hTiDPjxDoSsReKjYtkLbxL1ziXkP+RR6tEjoFAFy33iKv0lQXU9dzXWwTw==
X-Received: by 2002:a17:903:2c06:b0:295:62d:503c with SMTP id
 d9443c01a7336-297e5627aecmr142808835ad.16.1762848523256; 
 Tue, 11 Nov 2025 00:08:43 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:4557:54b2:676a:c304])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29651ca4262sm173807695ad.86.2025.11.11.00.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 00:08:42 -0800 (PST)
Date: Tue, 11 Nov 2025 17:08:25 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Corey Minyard <corey@minyard.net>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>, 
 Alex Deucher <alexander.deucher@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Matthew Brost <matthew.brost@intel.com>, Hans Verkuil <hverkuil@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Vitaly Lifshits <vitaly.lifshits@intel.com>,
 Manivannan Sadhasivam <mani@kernel.org>, 
 Niklas Cassel <cassel@kernel.org>, Calvin Owens <calvin@wbinvd.org>, 
 Sagi Maimon <maimon.sagi@gmail.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Karan Tilak Kumar <kartilak@cisco.com>,
 Casey Schaufler <casey@schaufler-ca.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>, 
 Max Kellermann <max.kellermann@ionos.com>, Takashi Iwai <tiwai@suse.de>,
 linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, 
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-mmc@vger.kernel.org,
 netdev@vger.kernel.org, 
 intel-wired-lan@lists.osuosl.org, linux-pci@vger.kernel.org,
 linux-s390@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
 ceph-devel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Gustavo Padovan <gustavo@padovan.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Vladimir Oltean <olteanv@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Rodolfo Giometti <giometti@enneenne.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>, 
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Richard Cochran <richardcochran@gmail.com>, 
 Stefan Haberland <sth@linux.ibm.com>, Jan Hoeppner <hoeppner@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Satish Kharat <satishkh@cisco.com>, 
 Sesidhar Baddela <sebaddel@cisco.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Xiubo Li <xiubli@redhat.com>,
 Ilya Dryomov <idryomov@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v1 12/23] ipmi: Switch to use %ptSp
Message-ID: <pvjnjwm25ogu7khrpg5ttxylwnxazwxxb4jpvxhw7ysvqzkkpa@ucekjrrppaqm>
References: <20251110184727.666591-1-andriy.shevchenko@linux.intel.com>
 <20251110184727.666591-13-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110184727.666591-13-andriy.shevchenko@linux.intel.com>
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

On (25/11/10 19:40), Andy Shevchenko wrote:
[..]
> +	dev_dbg(smi_info->io.dev, "**%s: %ptSp\n", msg, &t);

Strictly speaking, this is not exactly equivalent to %lld.%9.9ld
or %lld.%6.6ld but I don't know if that's of any importance.

