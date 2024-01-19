Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB2083300D
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 22:03:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E4310E1BC;
	Fri, 19 Jan 2024 21:03:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5515910E1BC
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 21:02:58 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id
 e9e14a558f8ab-3619f4408f0so101295ab.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 13:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1705698117; x=1706302917;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0jG9+AFkJLNvflocjNZF15QhqO4HCzitJO63mbz/u+8=;
 b=eV3rLN2v87srZXYPR1mrg86xFLRciv7GMvOGS75wIaI+DIfyXXqv4vIpaRYdwYLNCX
 6d//UcmJowIklSgz61sdAWH1jQoDlJfTQrx0IRsng/MR4XcY+mMCnqMjYH3qhSsOSZFF
 ykYs+2dEZ9+dFeX3VIK3s5RRRlKp0TofTWQ7SERDkOEBHh3I/3YEmhgm9+AQqcPf1QmV
 Lnv0D/2I+QorFXqUiM7CvMDISnIg2dTFR6M9+2p3TYChrK36pdVmcXanCJKzqXuuJfNh
 dpGGOSMPIJ0zJDBtZlnv+esD568CMi+c04S7q31fg9G/LEGsCvDkeyH4QMhV9Ch7GXzA
 kC8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705698117; x=1706302917;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0jG9+AFkJLNvflocjNZF15QhqO4HCzitJO63mbz/u+8=;
 b=OTVztfIFej/AiNAM1qOMEp+UiNmitmnWhzV7UkiwVZlGNEeSPhdcRMLM6Gdlj+TSTc
 PV21UauUzxMUF+P9vWLb3yBv5UsIYipqQ8VES8BRUkVBGni95yiJWWPQTcU1vVEsFrks
 F5rn56jGIvs/GJvKGPB3/cd+EsISJD0BoHzQzCDNwUfvFzDeIcQRqQkKZ+cnajabtOla
 eDpCSlCa8TpzirjQHVIcZmfx9YkwmTxHIw3iD8iVhZFJs43BTbdDwzjPKy63uaBiXkF6
 rEumd2g55cjbVl7Oc+4qmDmFLvX0mYwsMOdnlONDN+N5N3fNonkvWCzcNbgCnJQ46ufW
 8xGQ==
X-Gm-Message-State: AOJu0Yy2HBMpzsd+FrGKi8ZS9+xS/7SUhS6cKI3qZMo8QqJ7ROPDu5lo
 zPWHSq9u67tT45pfoBNiy/4eNTpNuo7IWcuvL1P0t8zRD1WzFJNIT5by5icNM3M=
X-Google-Smtp-Source: AGHT+IGNR5BYN2HXGSPs+VQNSYhLsM/2O6+KOSvuCAHGwqfjFw0UVx1cafcplfBPWtjgF8KdjNjiqg==
X-Received: by 2002:a92:c549:0:b0:360:7937:6f7 with SMTP id
 a9-20020a92c549000000b00360793706f7mr952902ilj.3.1705698117134; 
 Fri, 19 Jan 2024 13:01:57 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
 by smtp.gmail.com with ESMTPSA id
 j29-20020a056e02219d00b00361a1b951f7sm1023250ila.86.2024.01.19.13.01.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jan 2024 13:01:56 -0800 (PST)
Message-ID: <9e09464a-d58c-4f17-9318-26f0813a3023@kernel.dk>
Date: Fri, 19 Jan 2024 14:01:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: REGRESSION: no console on current -git
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, LKML <linux-kernel@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <05ea3233-20dd-4af7-86cc-de11ad2efe84@kernel.dk>
 <0293b14b-6188-4229-9fb6-29fbbdb8dc83@gmx.de>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <0293b14b-6188-4229-9fb6-29fbbdb8dc83@gmx.de>
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
Cc: avier Martinez Canillas <javierm@redhat.com>,
 Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/19/24 1:55 PM, Helge Deller wrote:
> Adding Mirsad Todorovac (who reported a similar issue).
> 
> On 1/19/24 19:39, Jens Axboe wrote:
>> My trusty R7525 test box is failing to show a console, or in fact anything,
>> on current -git. There's no output after:
>>
>> Loading Linux 6.7.0+ ...
>> Loading initial ramdisk ...
>>
>> and I don't get a console up. I went through the bisection pain and
>> found this was the culprit:
>>
>> commit df67699c9cb0ceb70f6cc60630ca938c06773eda
>> Author: Thomas Zimmermann <tzimmermann@suse.de>
>> Date:   Wed Jan 3 11:15:11 2024 +0100
>>
>>      firmware/sysfb: Clear screen_info state after consuming it
>>
>> Reverting this commit, and everything is fine. Looking at dmesg with a
>> buggy kernel, I get no frame or fb messages. On a good kernel, it looks
>> ilke this:
>>
>> [    1.416486] efifb: probing for efifb
>> [    1.416602] efifb: framebuffer at 0xde000000, using 3072k, total 3072k
>> [    1.416605] efifb: mode is 1024x768x32, linelength=4096, pages=1
>> [    1.416607] efifb: scrolling: redraw
>> [    1.416608] efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
>> [    1.449746] fb0: EFI VGA frame buffer device
>>
>> Happy to test a fix, or barring that, can someone just revert this
>> commit please?
> 
> I've temporarily added a revert patch into the fbdev for-next tree for now,
> so people should not face the issue in the for-next series:
> https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git/commit/?h=for-next
> I'd like to wait for Thomas to return on monday to check the issue
> as there are some other upcoming patches in this area from him.

Given the issue (and that I'm not the only one reporting it), can we
please just get that pushed so it'll make -rc1? It can always get
re-introduced in a fixed fashion. I don't run -next here, I rely on
mainline working for my testing.

-- 
Jens Axboe

