Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE6160C324
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 07:11:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F6410E0F5;
	Tue, 25 Oct 2022 05:10:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0887610E0F5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 05:10:55 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id e4so6923822pfl.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 22:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=N7HV+2O7fdwVJwRzKmZ0rsq+s0/h80leow5C99ZjbCk=;
 b=hkb8xybnSV2gWZ/UtkvEPpfkO9Qxb6o8Q2XSPI5eJ9LUXXPMNBhL4F2b0G9DVHZVZO
 awtvkuVsFDXqLILkIAFxE3RVv3E5XRZR0JaeROlmKN5+6X1Lt/Jm29PdHcUMo+fQ6A3P
 jwMXSR7no7u/SZfrAu29FdTM5sRnz1Q1ZRaf29kNy5Becp/1KFnILui60x9ufO9cBrmj
 7mVPiaL3PHg+3wGdQcf0Cu6CN+RqNkLRAHOkLqXiYCxac13fnnz0Zoxn8YlDIsKEXoIZ
 rqWK4XDtIKRHfxG1P87J2+Lsqt57ZUTiIHk/lqLONELr8aJxcdQ95U1NWbsUDOYCmZAb
 1oYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N7HV+2O7fdwVJwRzKmZ0rsq+s0/h80leow5C99ZjbCk=;
 b=78XafnLcYlUx31xnBaZa+qa44yZ2Rx4tWEWV1+DZCSDtXHPXhrIDhYE0TVWAfAT2HD
 cjZomwE3Y70OMBTrfrq1z2patdORM7/DJIOWEYF2vn7kO0+cEAG5f6oAPv+rt9aB3Ujd
 oIRrRGB7oKD2gllHmVti+DVB4prGtl/tq/UUPcu8u/Afg5vwfW+TVT7uSMA5UDLWLza0
 skKv+bOlWIfb4xtt1Ark7cfP61wfm3g/jHhPmNXk/pK9RUh2RBXXTnhNgW8wcSOWmhsZ
 vUPUcqKAF+iKCLJpUBe0B+PcNZCq/qjWot/FbwUik0LRZMMqQNaU6M1rU9go1lEVmDVV
 CkvA==
X-Gm-Message-State: ACrzQf31uzVNVv1qlz7jPF0BABMgk4lbF6Tte/Tvy+5PbbyF1Yqt08dJ
 dkyuf2R7QCUTbFnvY2ZvmJM/Dw==
X-Google-Smtp-Source: AMsMyM4dqBh79PBmEq4bNi3bKpyxWmF8pKyrddK0RgHHrwPwJ9UaGdcmUV9KpdRicCKxD5dzSxxkQw==
X-Received: by 2002:a63:db42:0:b0:45c:9c73:d72e with SMTP id
 x2-20020a63db42000000b0045c9c73d72emr30514395pgi.181.1666674654641; 
 Mon, 24 Oct 2022 22:10:54 -0700 (PDT)
Received: from localhost ([122.172.87.26]) by smtp.gmail.com with ESMTPSA id
 v6-20020a17090a00c600b001ef8ab65052sm667404pjd.11.2022.10.24.22.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 22:10:54 -0700 (PDT)
Date: Tue, 25 Oct 2022 10:40:52 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 02/11] ARM: sa1100: remove unused board files
Message-ID: <20221025051052.qn2ruyjdkawwwida@vireshk-i7>
References: <20221021155000.4108406-1-arnd@kernel.org>
 <20221021155000.4108406-3-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221021155000.4108406-3-arnd@kernel.org>
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
Cc: Stefan Eletzhofer <stefan.eletzhofer@eletztrick.de>,
 linux-fbdev@vger.kernel.org, linux-usb@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org,
 Lubomir Rintel <lkundrak@v3.sk>, Peter Chubb <peter.chubb@unsw.edu.au>,
 Alan Stern <stern@rowland.harvard.edu>, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21-10-22, 17:49, Arnd Bergmann wrote:
> diff --git a/drivers/cpufreq/sa1110-cpufreq.c b/drivers/cpufreq/sa1110-cpufreq.c
> index 1a83c8678a63..bb7f591a8b05 100644
> --- a/drivers/cpufreq/sa1110-cpufreq.c
> +++ b/drivers/cpufreq/sa1110-cpufreq.c
> @@ -344,14 +344,8 @@ static int __init sa1110_clk_init(void)
>  	if (!name[0]) {
>  		if (machine_is_assabet())
>  			name = "TC59SM716-CL3";
> -		if (machine_is_pt_system3())
> -			name = "K4S641632D";
> -		if (machine_is_h3100())
> -			name = "KM416S4030CT";
>  		if (machine_is_jornada720() || machine_is_h3600())
>  			name = "K4S281632B-1H";
> -		if (machine_is_nanoengine())
> -			name = "MT48LC8M16A2TG-75";
>  	}
>  
>  	sdram = sa1110_find_sdram(name);

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
