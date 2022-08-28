Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CDF5A3AD0
	for <lists+dri-devel@lfdr.de>; Sun, 28 Aug 2022 03:51:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 551DC10E4BA;
	Sun, 28 Aug 2022 01:51:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39DCC10E4BA
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Aug 2022 01:51:06 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id 199so5054730pfz.2
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Aug 2022 18:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=TsdWYg1/XWjmBnfDv85CY2hpRDv7YjWMUxKvmvDv9V4=;
 b=ZW2shkgp73dSpsVXgcUHDdrnB8AN1jHKJBJMCDlj8uEfI69vKKybu/RLvyeVtHwZZ+
 cfLLCDHtTm3NOnsBUAv8YQ/WOuRR3sb0SBNfIf5s44UFqsce6ziWBpKC127AIYwkJXEP
 Aiga+ieNY+cY6R6yGo1G0CxhfKiJLiDOqGTqaMLEAe1cSdzpr5W1g5kF3PDsyNZyjIKD
 f2leioLKp/w2t9ewRvYflr+QDbLpk/BGpcc+rP3DpohVHoqAkpPnH5v9e11TwTE+Bax/
 /gBub2dR05oIwh5mgLl7DB2MH/1xEc7HMo8pxFLbFDGc5LaiHZPxI5Ewf9SLE/pgmsQa
 bTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=TsdWYg1/XWjmBnfDv85CY2hpRDv7YjWMUxKvmvDv9V4=;
 b=A8i+7GOqduXRaGr4OeEIv2uVcMuodVQVWmJU+KnZy/uM7ItpOy8hbLnK30ajwU5BsM
 12cupgPksZ778Wj52y/yLhvUxSgnvO5JNP3aD4UXAdhXSLcLhjPBiTu5vEuI7+s2+LT6
 +Cldh2TZNugqFLuT390KMzaV7HT4z1AO99yRUB1LSRnUTVPIulEj6xyitKtJCuByy9WE
 64BG4DSqaaN2GBsoa7nh43s2zbe7DM/BGMb5L+iuOCLCrSSG/mT8OxLpexNQrTG5WFXn
 D5h9Q1FZ+1184zDV1B1noEFG54hPA+9GLZTuqwTs5wUsVyBrrpCPIEiPgKBLR+AKw9oG
 HRcA==
X-Gm-Message-State: ACgBeo3cEVRYB3K4uxqD6CkaPUb0B0kuGegNlnjSj1gyYJWWu82YQWsZ
 /mj6Azlxlc7F1JLiQYPC8C0=
X-Google-Smtp-Source: AA6agR6CV89n8XVQ/rikVS0vdw+KI2XOXLnkEAGObQSlv87ciFRyXGlGC7S53BWmlRHqC+M2VY3XEg==
X-Received: by 2002:a05:6a00:1356:b0:537:9b9a:4db3 with SMTP id
 k22-20020a056a00135600b005379b9a4db3mr10309230pfu.69.1661651465593; 
 Sat, 27 Aug 2022 18:51:05 -0700 (PDT)
Received: from [192.168.43.80] (subs03-180-214-233-85.three.co.id.
 [180.214.233.85]) by smtp.gmail.com with ESMTPSA id
 z9-20020a170903018900b001709b9d292esm4310229plg.268.2022.08.27.18.51.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Aug 2022 18:51:05 -0700 (PDT)
Message-ID: <6cb3b3fc-30d4-0396-fc95-8182ca72fb1e@gmail.com>
Date: Sun, 28 Aug 2022 08:51:01 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] Documentation: fb: udlfb: clean up text and formatting
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20220827193925.19612-1-rdunlap@infradead.org>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20220827193925.19612-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-fbdev@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Helge Deller <deller@gmx.de>, linux-doc@vger.kernel.org,
 Bernie Thompson <bernie@plugable.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/28/22 02:39, Randy Dunlap wrote:
> -From the command line, pass options to modprobe
> -modprobe udlfb fb_defio=0 console=1 shadow=1
> +From the command line, pass options to modprobe::
>  
> -Or modify options on the fly at /sys/module/udlfb/parameters directory via
> -sudo nano fb_defio
> -change the parameter in place, and save the file.
> +  modprobe udlfb fb_defio=0 console=1 shadow=1
> +
> +Or modify options on the fly at /sys/module/udlfb/parameters directory via::
> +
> +  sudo nano fb_defio
> +  change the parameter in place, and save the file.
>  

Better say "Or change the options on the fly by editing
/sys/module/udlfb/parameters/fb_defio."

>  Unplug/replug USB device to apply with new settings
>  
> -Or for permanent option, create file like /etc/modprobe.d/udlfb.conf with text
> -options udlfb fb_defio=0 console=1 shadow=1
> +Or for permanent options, create a file like /etc/modprobe.d/udlfb.conf
> +with text::
> +
> +  options udlfb fb_defio=0 console=1 shadow=1

Maybe we can say "Or to apply options permanently, create modprobe configuration
like /etc/modprobe.d/udlfb.conf with::"

-- 
An old man doll... just what I always wanted! - Clara
