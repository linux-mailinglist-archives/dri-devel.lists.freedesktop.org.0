Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 393DA22DFEB
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 17:03:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1109289F35;
	Sun, 26 Jul 2020 15:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15B7B6E4F4
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 09:31:15 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id e8so9322714ljb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 02:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TBUxgudIuaDLAvLBANWhcm32RAOD50DQBXyfj2jsnh4=;
 b=Mf6ETM7ztIRbwjiqdscapi6l9//E/tfVMAaamIup0eE1/HQOKAdQHP6t1dPv9Y9wQh
 QCq3ECza5RUGvdRueuVmu5PemT0/eJsrc1xZTolBXPT9d8p5FNOREcaVe9nNJsD4/XOn
 fbO58i7FBj74xB8EhCAVW37Njy/qdCvnvx3zj88P2Qr/f0yaBQtVXQssU4xQG7UKrTj9
 AeaJ7r09bRqFXHURxpbKEYu7C+aA+gd+LZ5TyulVZasfOuwC5jUhmYZpCOaGU2cpAFhQ
 SWdrI1DmMJEltKZaQA6fucFMfH8SAnju0B5/+mJHw5p46opV3I0Gj2xToLOuShtW9IPV
 8xbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=TBUxgudIuaDLAvLBANWhcm32RAOD50DQBXyfj2jsnh4=;
 b=F+cDRpUijuCqfeqZQZRycpjNeVA7/yo2NXmON3m3WaUx2Eg949FzVSzUZkdVyFvzFm
 PbTEasBfSTlGZTZdqBHY8WI4TOkGs3V1Na/q9Qe/2X3+1hv0pYzLLyhFqVlHZnl/j3BN
 VZbkY0t3vux9U4gRU5pnXpw4PN6FuG42iYSlLbGtzb/e7nwQBgDX4XLQUSbtvHdIRH32
 X9O+ERdkmLuNV81VdybR7UM5H1Oyv55t2LZ2GRRcWGtcokyw5uIh6NuEEHCeQd1i9tlV
 KsaSxh43o/joxBaX0DoqScXhYt0hpGV8j+MhauoY0/tZTU6dBn/lQW6F1uIumeqg9fFR
 HZgw==
X-Gm-Message-State: AOAM530LWjdsp8+cjYrc1IDTFhPqq7q3NvjCXMBTO6EMQ+WpFaRpxMOU
 SmZAlPCRv+fBuorO9OXJcJSPgLyk8xA=
X-Google-Smtp-Source: ABdhPJyYL/2FJHBDk6bM7QU+nPX0YDimDInJXXxpicOfu+ldA96NXGc/cdDQ7seaU002+wFwwJXGJw==
X-Received: by 2002:a05:651c:156:: with SMTP id
 c22mr4151018ljd.453.1595583073494; 
 Fri, 24 Jul 2020 02:31:13 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:48a4:44fe:25f3:4dcc:b496:1546?
 ([2a00:1fa0:48a4:44fe:25f3:4dcc:b496:1546])
 by smtp.gmail.com with ESMTPSA id n3sm120108ljj.39.2020.07.24.02.31.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jul 2020 02:31:12 -0700 (PDT)
Subject: Re: [PATCH] newport_con: vc_color is now in state
To: Jiri Slaby <jslaby@suse.cz>, gregkh@linuxfoundation.org
References: <202007241318.wXYkumEO%lkp@intel.com>
 <20200724062735.18229-1-jslaby@suse.cz>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <b1b9d90a-5fe3-947a-dc4e-8576cd143869@gmail.com>
Date: Fri, 24 Jul 2020 12:30:59 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200724062735.18229-1-jslaby@suse.cz>
Content-Language: en-US
X-Mailman-Approved-At: Sun, 26 Jul 2020 15:02:45 +0000
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24.07.2020 9:27, Jiri Slaby wrote:

> Since commit 28bc24fc46f9 (vc: separate state), vc->vc_color is known as

    Cgit says "Bad object id: 28bc24fc46f9" (in Linus' repo). Also, you should
enclose the commit summary in (""), not just ()...

> vc->state.color. Somehow both me and 0-day bot missed this driver during
> the conversion.
> 
> So fix the driver now.
> 
> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org
> Cc: linux-mips@vger.kernel.org
[...]

MBR, Sergei
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
