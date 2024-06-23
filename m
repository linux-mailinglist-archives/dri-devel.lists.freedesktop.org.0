Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BAC913E39
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 22:52:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A78210E1E8;
	Sun, 23 Jun 2024 20:52:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="u7Lvwi0H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D590410E1E8
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 20:52:52 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2ec59193468so7301081fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 13:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719175971; x=1719780771; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7uTo3ZPUx3K0rhi8+9SzsYcK1LXS9wxsvZyOU1ivZAE=;
 b=u7Lvwi0HpGkmc7q49kVorCg4pM3/YlS1/bq5ViZWZkhSgEUOqqbPRz6O9CS2rQJvNS
 P4M5Hhg6i3ArdHW5iInEtPkbIpWQBo2J56LhpKH9TWblvCkE0ZX8AAojn0I87d8g9SsM
 +5jtkH2DV+55//k+gvni8Uy8WqNGkEEj0V9pfdnv7U15AlTmvmGLyT8dDYctXZ/onCcC
 I78AiMYyt937prjei4ScJzOis3qpQ0UIsFNaXdy+2xjQF1YUPjYPxpyEK3EbwZ3H+8Gc
 6/lSJTaHQF/UJGhLRLIjvCCkVQGFq17469Y4f7g+VJqz9Wrddy+2500BJaa/z60ImLnr
 kl1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719175971; x=1719780771;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7uTo3ZPUx3K0rhi8+9SzsYcK1LXS9wxsvZyOU1ivZAE=;
 b=Mm3URUDz/7OAly+Sh7psb9GcqgL3SGYda9+I06Q84Om/zRH5BWXnus3+1DtDXvFemF
 Ujpqxo9iAsQ1lAEdMYFp4e1r/Oy8S2t4i4hLmJ9kgq1osCAExWaYaWxsfeK4i0980L25
 r5mobzMmnQKY0UeDtXA4XcEJbOg++qu/uky4TtGfKPUKXaElbhSQmzEa9kM+qszOcr3q
 UkqBnQnvwtJRblZdoCzHQXEsLFqWDgSt8uzWkUGCnHe9GtCqcrLjv4ATzVbbqp36N2n7
 Sswy/c76/5DsUmo7KfSDW5oAoL/zRcjo18Pgr6u62FGnwuWThExKY7+65p7263gzlf5O
 SLqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSAsm+LFO+0T367eMzAYRANO9WkQd5eIonHji5DRtn66H1vOrFnrcI2ltgCohGnTrk4BsHTzkMl5zsoCmoAKrgNnGJfxx6gjoVoJ7Eh95d
X-Gm-Message-State: AOJu0Yyh3IgKk92+LTqN4Nh4MMcH26OUUvctuYijL9LOTJ+Nfl/R+iR0
 oE9x0QC0jc4sLWMcqN4GYoRr0N6Snxu8RNeFfcNhLcrZdejnV0H+DQGtHE4ctSA=
X-Google-Smtp-Source: AGHT+IHOdvwlm/V74XgOSUz/yzIxVY9cnm339PgJIGCdcSGcuh23BD7ELQkWwC/H5ZAyl+yMDB1o/Q==
X-Received: by 2002:a2e:80c4:0:b0:2ec:4d82:9e96 with SMTP id
 38308e7fff4ca-2ec56caf832mr12068771fa.23.1719175970544; 
 Sun, 23 Jun 2024 13:52:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec4de2dbc4sm7824561fa.73.2024.06.23.13.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 13:52:50 -0700 (PDT)
Date: Sun, 23 Jun 2024 23:52:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Keith Zhao <keith.zhao@starfivetech.com>
Cc: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>, 
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>, 
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, 
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, 
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, 
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "robh@kernel.org" <robh@kernel.org>, 
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, 
 "hjc@rock-chips.com" <hjc@rock-chips.com>, "heiko@sntech.de" <heiko@sntech.de>,
 "andy.yan@rock-chips.com" <andy.yan@rock-chips.com>,
 Xingyu Wu <xingyu.wu@starfivetech.com>, 
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 Jack Zhu <jack.zhu@starfivetech.com>, 
 Shengyang Chen <shengyang.chen@starfivetech.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 05/10] drm/vs: add vs mode config init
Message-ID: <nwyeptrjhpmpnvwrexjebkvsl3dudgao4w4lnm3srs6ahmjwjr@6mdyw6kvtbag>
References: <20240521105817.3301-1-keith.zhao@starfivetech.com>
 <20240521105817.3301-6-keith.zhao@starfivetech.com>
 <ttjuehs6ui4dsnexhhodfd22okujx55mof5svxuk47gizhkv52@kdbdvwsamz6i>
 <NTZPR01MB1050281A0007497AF8606662EECB2@NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <NTZPR01MB1050281A0007497AF8606662EECB2@NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn>
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

On Sun, Jun 23, 2024 at 07:17:01AM GMT, Keith Zhao wrote:
> Hi Dmitry:
> 
> > -----Original Message-----
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Please drop such headers from your replies. A simple "On 1st of January
John Doe wrote" is more than enough.

-- 
With best wishes
Dmitry
