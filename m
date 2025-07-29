Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05994B1525A
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 19:49:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD31C10E047;
	Tue, 29 Jul 2025 17:49:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="ZV26dQUM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 173E510E047
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 17:49:47 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-74264d1832eso6910281b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 10:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1753811386; x=1754416186;
 darn=lists.freedesktop.org; 
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wgacyD7+JSAylz4eDUPZatAHSCWLxzjQWqg339FTf5g=;
 b=ZV26dQUMlEzdJz5ejEroVWYk0u2OqLSrYC+UtuwaOB11PXAqMJdWd8GJHrITVD5Ahr
 6qgML3JPg+NcgKZYjm78JfOhRbSPpLVtP/7vQP21QFv2oLn3nUjmSvx2DA1PisQ8zJw2
 9RXH9we9JaRl4J7TnClUtSm6M7/RXxV8S7iI9M3laNSxGfOGblLqPNPBHydeEyZwVN2O
 /cq/17KV3Z+H0HFglXmlbC39R/vXDnYEWi8cLWBWeaCIBqbhjmME0qKhiK2673OxJD4/
 btyR4pQiSA4UeLWAMx2qbOZPL4hvdqPi2Ihu1BeDaoYGvuqifhYrim7af2RKNi5mpYdd
 xtbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753811386; x=1754416186;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=wgacyD7+JSAylz4eDUPZatAHSCWLxzjQWqg339FTf5g=;
 b=E3u3T3o//Pt7TxNVrWCwOK68ANFhTXdlFKq7EAXNsJqxAMu0fmCT3OnqPTevH3b3Vp
 +LkGFh4ol0fcMGyzIDLLdHE3TE3wMK9b8vRjBBkGLnDkYI+71R/ecAS4z9wLfgat41V+
 m+wFAA3d9lPp+agqAtzNZIhTtQ91sL0jrbCyGCJQwsdSuQyR9ww+QbwTnY99Tz8qoON5
 e+YMmTV7WIGLJIr0aTDYwyOa20AK4FY+KQ3m53ohd02HsxmH3SrHVEB+IiKBUomumOlO
 NyUS7GM7abxdpUVhrAthEGHCmKdvBfm5+ECHtC0VAUFBVc3ZLPq0XjBJx0fi8I+4kc0G
 CTOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAsqHlOUWxxsKTcutXyG/pGVFuFo3AuJBzMOsqrspI1wozEf3t8ZmliiWP2olnxI+Tlb2A1l5C63s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3HaRJiYJ875GDv9uphEesKu+XfgKRWB5vefo3DB4tdlzRU0O6
 gah6XXIx6y1p6N3rDuGOqe+/cuSEyZEUnDboHiNA2kEt+OR7YiuLPET0JZqEgYv7wWU=
X-Gm-Gg: ASbGncuTW/Nrw6J1tPC6YGEUELqv8u9he62CzakvsMSDn4HLDmnI0+rCIBYA/wzE+ee
 b74JKhSiuhPx0kFLAzEv1CsxTVo8MYNpW2SW9iRQyuV2kB3RTgunZSoRzO7sbaXuk7pPSJlzUId
 W+1mgMo/C6GT3bWdxKxkKHKivxKE3/w7LTaQe3D5vQ4t5azm+/KkGOX/QjXsGyXnIB1saW/9EDJ
 pRSKbgSF7iMuLAq8NEvIvUkwSAfTO27bcx5y1yPnlH9UeZ9coFCRrUHlgMP6XbEshwLwzvpVN7r
 fgTzhul2k8MVtDleZZMMiWt9vSsC38Q2lkvaPl4bCIXow2+4vXMLDnZo99DqqR9xdK/I5wntYz4
 4ztbpYTQO4GDwaX4AjzM=
X-Google-Smtp-Source: AGHT+IE9oBm8nKprL5hGjNglF7y2WycqTKbCfeajSJ5D3OE2VH/J46MKc301lqcU83YSu4cRzCgpQA==
X-Received: by 2002:a05:6a00:1991:b0:769:999c:eec0 with SMTP id
 d2e1a72fcca58-76ab1020b1dmr787520b3a.7.1753811386500; 
 Tue, 29 Jul 2025 10:49:46 -0700 (PDT)
Received: from localhost ([64.71.154.6]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f7f6af886sm7347239a12.52.2025.07.29.10.49.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 10:49:45 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Jul 2025 11:49:44 -0600
Message-Id: <DBOQ8Z69EQ52.36Q5O3T140OL2@brighamcampbell.com>
Cc: <dianders@chromium.org>, <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] drm/panel: novatek-nt35560: Fix bug and clean up
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Brigham Campbell" <me@brighamcampbell.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <linus.walleij@linaro.org>, <neil.armstrong@linaro.org>,
 <jessica.zhang@oss.qualcomm.com>, <sam@ravnborg.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250729054435.1209156-1-me@brighamcampbell.com>
In-Reply-To: <20250729054435.1209156-1-me@brighamcampbell.com>
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

Oops! My apologies for forgetting to add the following changelog to the
cover letter.

Changes to v2:
 - Separate bug fix into its own commit for backporting
 - Add var_seq_multi() variants of MIPI write macros for sending
   non-static MIPI messages.
 - Minor formatting improvements.

