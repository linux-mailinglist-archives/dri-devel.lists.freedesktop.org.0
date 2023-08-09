Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E8C776536
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 18:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A817310E467;
	Wed,  9 Aug 2023 16:38:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 531F710E467
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 16:38:29 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-314172bac25so48967f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Aug 2023 09:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691599108; x=1692203908;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=P8nX0pI7rFcPckDGFTH0fbolEOZLnYl6aVYECM4juis=;
 b=FxqHIVo7uVYddWJpN82jeeBQLa2SewY2J5gQJly6P2rQgUBkAGNnZ+bgQtmpNDgw4v
 4mN7u5x/LaW6AoYJ+9d0e4LSthWqV17J1YvpHBXPsZZKsDsmd2Zh9HRdhzBRkiL9tE6E
 5f30eiRt4G59OUhlJM1AhxuL3tX7GgVE2HJMYGN3npJ2PmWIiOwxiHgRcuFTRmSEzuE/
 KCg6LJi+hxRAzI9fD9V9XoIViD32ndaMe5/QjonBZNhTcPMPvIb2GQvxmAePgKIZBHbN
 tEIQuTRbltrMWPYaBeS4LecHgQJ6idS15vgVFzZcSokRMVg36JuO5A/AtTawG83t5vMk
 eNBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691599108; x=1692203908;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P8nX0pI7rFcPckDGFTH0fbolEOZLnYl6aVYECM4juis=;
 b=dePX2CUWOTlHsSPq36ADYIB8rrN3t4+xrHSt2+J8QwvsQFe3xh4F6Sil2I/OpKWtZS
 I7MzhJ9Nq/C/SmrJxSh8vO2Y8X8zj5qCe53YZYeL14wytPLSmaiySApWlnSQTJCAS6t5
 sdggzRDi8NK+GW+R9NE+yWoohFeIEqrp8XPZap+5LCcHNlBLPfpRte9achRvyPuFcA0I
 6kJ3Txiimgkt6iKJ//oj1BHB6/CNWIMIzFSeJHqImrCQksTdRc3oe2QvTYg8MeSigCw7
 8k2u26ZTGfAroU7a/gOLUim2KrQ18BVcBlXAMW7pjlauiNd1pir0WJ38XSFRpL/nX2TS
 GOug==
X-Gm-Message-State: AOJu0Yz+8+cCETxmBslSs8oGAHHLFmo4WuKOPTIjlHEmAgA1StOxIh7l
 Fk+uvptn3Zv0NBGqemA8NL8bFg==
X-Google-Smtp-Source: AGHT+IEXw5QpPfHSLyKGkNqtuPh+9Tq+iYFSsWhkI2sxKn6VlTHqXOSJRg51iI6lS3t0Y0bELSUsAA==
X-Received: by 2002:adf:d0c2:0:b0:313:f98a:1fd3 with SMTP id
 z2-20020adfd0c2000000b00313f98a1fd3mr2533598wrh.27.1691599107792; 
 Wed, 09 Aug 2023 09:38:27 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a5d4a09000000b0031801aa34e2sm3250114wrq.9.2023.08.09.09.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Aug 2023 09:38:27 -0700 (PDT)
Date: Wed, 9 Aug 2023 17:38:25 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Artur Weber <aweber.kernel@gmail.com>
Subject: Re: [PATCH] backlight: lp855x: Drop ret variable in brightness
 change function
Message-ID: <20230809163825.GA5056@aspen.lan>
References: <20230809114216.4078-1-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230809114216.4078-1-aweber.kernel@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 09, 2023 at 01:42:16PM +0200, Artur Weber wrote:
> Fixes the following warning:
>
> drivers/video/backlight/lp855x_bl.c:252:7: warning: variable 'ret' is used
> uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
>
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> Fixes: 5145531be5fb ("backlight: lp855x: Catch errors when changing brightness")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202308091728.NEJhgUPP-lkp@intel.com/

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
