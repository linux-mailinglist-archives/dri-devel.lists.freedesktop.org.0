Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F70D44D556
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 11:52:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93ECF6EA68;
	Thu, 11 Nov 2021 10:52:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315486EA68
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 10:52:36 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id 1so11145397ljv.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 02:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=iEKA4VskprioZ3wq/U9m+wCXLZ4G97pCcQBnvlOh4Uo=;
 b=btLkorl9c8K853xVrxR1ADIOhdX23K66lM173VTISdcLAui9Uwt/y1wOtf64uYH2kZ
 Dfqh0Mnz01q/fHVPSAumedyawbY8zGsiN/ohklkbofF6iyOEsGIEtbyeA5Gwq8kyPC7K
 3Ie4wEUiPPjhiE+nr7bjZnLKswnBoKEO1ecaoOyktehx1CpwAgxDIP5AuT0iu0FoAmCw
 0BnmH6TUueo4T4bI2DbIHmxBLl0f/0vwYnYNvzJWPCF0LoxzJkAGFcnpBi5OQ/WDEBtA
 jbKlgVKxeFZlbzmDYcKMQsrlZ+pnWXSFveJITJ2PsdwpND/o6akXMvq+h+syJTulliUn
 B5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iEKA4VskprioZ3wq/U9m+wCXLZ4G97pCcQBnvlOh4Uo=;
 b=pGvWa5zTG09cKtkx0F9s8zjjdRESCx1tZ6GbmMbgDWpdLEXpFpdrzUNAH8guuao+Xk
 lKYXZCH8daytCpHuofDDAH0zxFejn95M1gvwa8g09/HixrG6vnGZNIGCBtDPNSNH/FT1
 /B31lAZGTkeQwlhnwIhSSBR2wzjG9Fz1dHyn4mQPmeCZshuIAejJGvLwWEIiJWMPn6u7
 J7orW58/1AN/vbPiSTYYp+6WVij5L6BZUIAUMZjsteJU0EC9EP5dUef+2bMYpakqfJ7t
 2vNBN9OLwdkfAt40g1/8n/RZzbJQ0JsjukJnv6m6zO+u5Qq3/BRqW1o4OLEzRb174TUg
 oEzQ==
X-Gm-Message-State: AOAM531OaAWnLcwkdyrDwDm4RHvnrT8qwAF/wfPgfPQdAvm513X+g0SN
 V3Qiok2fWWJrpClz/ZX6JNc=
X-Google-Smtp-Source: ABdhPJz1IYsvS04cZQ+CvSu8XzvmkMKAcCwl/+9b0JTk3164neupuBhveziHtfju1ysnhZD2DcJ+Dw==
X-Received: by 2002:a2e:83c6:: with SMTP id s6mr6345880ljh.477.1636627954556; 
 Thu, 11 Nov 2021 02:52:34 -0800 (PST)
Received: from lahvuun (93-76-191-141.kha.volia.net. [93.76.191.141])
 by smtp.gmail.com with ESMTPSA id l11sm255066lfg.79.2021.11.11.02.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 02:52:34 -0800 (PST)
Date: Thu, 11 Nov 2021 12:52:32 +0200
From: Ilya Trukhanov <lahvuun@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [REGRESSION]: drivers/firmware: move x86 Generic System
 Framebuffers support
Message-ID: <20211111105232.apk2msip4ng7hgsw@lahvuun>
References: <20211110200253.rfudkt3edbd3nsyj@lahvuun>
 <627b6cd1-3446-5e55-ea38-5283a186af39@redhat.com>
 <20211111004539.vd7nl3duciq72hkf@lahvuun>
 <af0552fb-5fb5-acae-2813-86c32e008e58@redhat.com>
 <1ddb9e88-1ef8-9888-113b-fd2a2759f019@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ddb9e88-1ef8-9888-113b-fd2a2759f019@redhat.com>
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
Cc: len.brown@intel.com, linux-efi@vger.kernel.org, regressions@lists.linux.dev,
 linux-pm@vger.kernel.org, pavel@ucw.cz, rafael@kernel.org,
 stable@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 tzimmermann@suse.de, ardb@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 11, 2021 at 10:24:56AM +0100, Javier Martinez Canillas wrote:
> On 11/11/21 08:31, Javier Martinez Canillas wrote:
> 
> [snip]
> 
> >>> And for each check /proc/fb, the kernel boot log, and if Suspend-to-RAM works.
> >>>
> >>> If the explanation above is correct, then I would expect (1) and (2) to work and
> >>> (3) to also fail.
> >>>
> > 
> > Your testing confirms my assumptions. I'll check how this could be solved to
> > prevent the efifb driver to be probed if there's already a framebuffer device.
> > 
> 
> I've posted [0] which does this and also for the simplefb driver.
> 
> [0]: https://lore.kernel.org/dri-devel/20211111092053.1328304-1-javierm@redhat.com/T/#u

I applied the patch and it fixes the issue for me.
Thank you!

> 
> Best regards,
> -- 
> Javier Martinez Canillas
> Linux Engineering
> Red Hat
> 
