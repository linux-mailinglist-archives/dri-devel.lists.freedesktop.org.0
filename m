Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A82FC791614
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 13:11:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70BAB10E065;
	Mon,  4 Sep 2023 11:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0EA10E065
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 11:11:29 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-68bed2c786eso707533b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Sep 2023 04:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693825889; x=1694430689; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VfLBqtqsKewVLZ7LDcXD0Gsn2qEn+ss4iL3ZMurcTxk=;
 b=EBQiKHWNQtZAfjp+6woZ/xQJN2zUfr+f4D2LLwHVn7YxjaKAXq+AfLTWKlQahhDILY
 x9dX2qa58FQ67MpKV6yxEOl3dcCUxKkTu5TIWlfIxKaY5lF4da+oRZIWnHhGIIveCG3u
 3f1hZ/Hfr+ISHz5Helay/RH/G8qNUprKdj+WxKsLpVTZO9uhfX6LUrEhnsJQ0Gsu3T+v
 KK00E0XasiKlIHJmk8Gbl71aZhU2nz3FsN15M5gK5bpXpCP3pOSNRHdRgxF77JGSiT6b
 0Ah9+KKNCzNZi+i76bBUmWtkWXKItcoIvRzZ9mVsKO9kAGXvPzyPPHfBXN1Lm160S8vt
 gKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693825889; x=1694430689;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VfLBqtqsKewVLZ7LDcXD0Gsn2qEn+ss4iL3ZMurcTxk=;
 b=BQeJnPdi7o0ZTv/OUULKdK6b3LQBYWOi3cZHaAPAXXb4kZyGYQ///AGAR/CyLNWR/u
 b+5wmD48FNgMIAcmRMvtfihppvjyGxBuV75MxjkIHv19wRICg9EF5sDCm6tY++61Lpxx
 ZxLKAajIaiPyd1pkdOeozT6YnR0tOjA5oz04AjyOcluIm7pYa7OVdwZcTPWici/PnE8t
 DX1UQDYe8rJViylnXlnEtdpqR1mgEpkQrjOEFHFYbgNNNfuT7Dv8Vka2HtP5NDM+20ya
 KgiTlfIUz0vxMdJVtnEpLuKZN+N1X/wudDKYfcOoOdcIWWdq9Mfi3sumF9pAbJtoc58t
 QLFg==
X-Gm-Message-State: AOJu0YwAO6AxH0lur3u0cjMAyoCKc6Ve++q+x+kgdvY8YCwd2OoYIu+D
 EhkLvrYrPxF6iaX1l+c3UUI=
X-Google-Smtp-Source: AGHT+IGhVcxbTJAKxk/tRr/+FBgRNMp49OEhYj+pugMQgSKYjV7TBH7c1h9wwQ0MwzKbY+MoacCkow==
X-Received: by 2002:a05:6a00:1587:b0:68c:4ff1:3dfb with SMTP id
 u7-20020a056a00158700b0068c4ff13dfbmr10008646pfk.8.1693825888906; 
 Mon, 04 Sep 2023 04:11:28 -0700 (PDT)
Received: from [192.168.0.106] ([103.124.138.83])
 by smtp.gmail.com with ESMTPSA id
 x26-20020aa784da000000b0064d57ecaa1dsm7155897pfn.28.2023.09.04.04.11.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Sep 2023 04:11:28 -0700 (PDT)
Message-ID: <79b1e941-b0a1-1b69-0f2e-38f2949ed37a@gmail.com>
Date: Mon, 4 Sep 2023 18:11:22 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: Fwd: Kernel version 6.1.50 regression: radeonfb deactivate vga
 console
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Helge Deller <deller@gmx.de>, Alexei Gradinari <alex2grad@gmail.com>
References: <f8c26878-aabc-7cc9-59a1-3f68bf1d43c1@gmail.com>
In-Reply-To: <f8c26878-aabc-7cc9-59a1-3f68bf1d43c1@gmail.com>
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
Cc: Linux Framebuffer <linux-fbdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Regressions <regressions@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/09/2023 07:01, Bagas Sanjaya wrote:
> #regzbot introduced: 9b539c4d1b921b https://bugzilla.kernel.org/show_bug.cgi?id=217861
> #regzbot title: using pci aperture helpers deactivates AMD ES1000 VGA controller
> 

#regzbot inconclusive: now tracked on gitlab.freedesktop.org tracker
#regzbot link: https://gitlab.freedesktop.org/drm/amd/-/issues/2826

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

