Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 682BB530981
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 08:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4DA10EE06;
	Mon, 23 May 2022 06:26:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A4F10E60C;
 Sun, 22 May 2022 11:57:03 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id m20so23411248ejj.10;
 Sun, 22 May 2022 04:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DQtGOV8ehr9B0byuPgB/R0qAJIaG0/ZyE72cxpjHldY=;
 b=qG3Kocdsq2oYYGDEOFNTT93XeYI9iYcUWVQ/xcuqMlQWR+ZjOVjzShfb129BRCBeZA
 IbjnscCqLlyomggb5cyR9GpqqOBdpUuUo3+FbJYLbl0iiv4HCdnE6oUZAjMcMn8rI7k4
 0hiscQzwOz5MmXbxTMw0aR1wARxwwUQ1FuY3GMHNU3MYRkf2+RKVREPc8am7/wzdyl9t
 oIyX9zl9X57zupPpZORXrjsSN9N5PSh3n0Y67eW7PS38UKVmdPQe7ua4dEOBiXOcWWqU
 BGUgHNpBaUTmrppJ4h/Xnpqc8TBObkcgTfQfATGh0SAgYKROqWnr/m2p+Lv8tSSupBQG
 Eqog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DQtGOV8ehr9B0byuPgB/R0qAJIaG0/ZyE72cxpjHldY=;
 b=BljOYq5r9KLqGwMvbNDeF0wVkh/eGAoYsyMzCKkyabpBimcsj6U8Hbr/FNGC8Rxixh
 rGMJpEoLC1mLxUG75jym/+1OXNd2QSZt3QvTA/U9DpN8QV9qGSyzuwY3RxepY84xPUkX
 0V9lAixvClldO7touHJ/qLqxB1n96K4qB8n8XJjx5uNS8p2iOoigqv7tnvzW2kuAvFgf
 1MFhDnEWp1vU+FaR/dqA4ZtJL97sC35NyZtrv/CN2w2Lsw0c/wFlGxT3ivKozDco70Tu
 ZZOR7/7L82e/YOT3UYk1+JeWr0aIcaSFfKOGxunbGB9/12yJ3g5hKSvhDOBJYS+O5La3
 zEQw==
X-Gm-Message-State: AOAM531xHTSGBoyGDv1KlpEkfvoeFJ7J7OSOC7QbPhF/ouWilIQeiwJx
 dvwp3gKOFTkYhMoSQL894XL4CzN8g2U=
X-Google-Smtp-Source: ABdhPJyUp97Woq4Tojt0R/LZFMRQbE+AliJIsobK1w7h8qb86kKoEvaA54Id06XPIzhUaW1XPVm0Cw==
X-Received: by 2002:a17:907:7282:b0:6fa:9365:f922 with SMTP id
 dt2-20020a170907728200b006fa9365f922mr15297634ejc.262.1653220621612; 
 Sun, 22 May 2022 04:57:01 -0700 (PDT)
Received: from mail (239.125-180-91.adsl-dyn.isp.belgacom.be. [91.180.125.239])
 by smtp.gmail.com with ESMTPSA id
 jo14-20020a170906f6ce00b006feb5cae5f0sm2338997ejb.132.2022.05.22.04.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 May 2022 04:57:01 -0700 (PDT)
Date: Sun, 22 May 2022 13:57:00 +0200
From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [linux-next:master] BUILD REGRESSION
 736ee37e2e8eed7fe48d0a37ee5a709514d478b3
Message-ID: <20220522115700.vg4hsytav74sy3x6@mail>
References: <6285958d.+Z2aDZ4O1Y9eiazd%lkp@intel.com>
 <0530d502-1291-23f3-64ac-97bd38a26bd4@roeck-us.net>
 <CAMuHMdU3SYOwE5ftDwymQpVwWmpbC=1Ytyp0Y9GaeUS2i1cP+A@mail.gmail.com>
 <CAMuHMdVx7r-4TVV9uVJppT-7ZAriov01BUNk4ghU9Bs4uY28vQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVx7r-4TVV9uVJppT-7ZAriov01BUNk4ghU9Bs4uY28vQ@mail.gmail.com>
X-Mailman-Approved-At: Mon, 23 May 2022 06:25:06 +0000
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
Cc: linux-hwmon@vger.kernel.org,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 kernel test robot <lkp@intel.com>, KVM list <kvm@vger.kernel.org>,
 linux-staging@lists.linux.dev, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 linux-nvme@lists.infradead.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-sparse@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:TI ETHERNET SWITCH DRIVER \(CPSW\)" <linux-omap@vger.kernel.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 20, 2022 at 02:46:20PM +0200, Geert Uytterhoeven wrote:
> > The "(void)" makes sure there is no return value.
> > Which matters if the result of a function returning void is propagated
> > to another function returning void.
> 
> Which, FTR, sparse also doesn't like:
> 
>     error: return expression in void function


You should get this message only if the expression is itself not void.
For example:
	$ cat test.c
	extern void fun(void);
	
	static void ko(int *ptr)
	{
		return *ptr;
	}
	
	static void ok1(int *ptr)
	{
		return (void) *ptr;
	}
	
	static void ok2(int *ptr)
	{
		return fun();
	}
	$ sparse test.c
	test.c:5:16: error: return expression in void function

IOW, sparse warn only for the ko() but not for ok1() or ok2().

If you have a case whee it s not the case, please send me the
pre-processed file and I'll be glad to investigate.

Best regards,
-- Luc
