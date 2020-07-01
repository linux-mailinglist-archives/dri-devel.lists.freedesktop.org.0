Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DE1211CEC
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:26:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69EAB6EA79;
	Thu,  2 Jul 2020 07:24:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54FF6E096
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 17:14:42 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id j10so18993356qtq.11
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 10:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uyDrreb5/43nRuyXAG5DxhddbAStHj2IykaaREeLOAs=;
 b=lrfta52O1r0UsfmM79fscXfWiTmQ4Zl4t2olGT+gIZQ+ikYdcVVjEEd7tfkDk3mVJo
 2yeVQsPbar4qpD3ErrFTsEMkmKrRg76t0/D5OdajQasvPoDo2HEYmv2xcnO+9Cr06g/5
 Jhgc14xFsLMXwm3zxMkcSzoq/Te/N+53cBoyeqOmOdNzg12m6a2/JCR96jBDDynnF+0p
 XdFp+xxEdg2W/Hqx+zlpYGrcRGmEMvYDfAktg0VnTxy3DKaeHF29ak7MAJVmOg3kobx6
 o+dyGtunNjmaa4MAMH2gTlnr4U/10Ur7ZqaShJOB0OaBuTd35v18MCOnI/NBMC8jQ/bp
 xv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uyDrreb5/43nRuyXAG5DxhddbAStHj2IykaaREeLOAs=;
 b=qZkACEHfrmd8FUvAoK6LMl4AVLcBGYxqzJHaR5LxjuzMsQ6o7+ulNtoOUs7CSAguAd
 0Jz2CKKQ7cqtdYPM3J7NbFfHphfdRHrBi+6ZcIPFaXJeWnrIsSE5LGJ6K2EIAOngxzVV
 HI971IwYxnZ7W/3KpkqsX+3BVaw4Rh2qxpDD3ILuwjC+LpeL9qjr9INJNOXYU3asOEyv
 nOwHhM9Z0RWh0ZBguWLrTg0qORSn4mxKdV9KcQAKcLMt/XuPomsQclhqBRecXWqlSM4/
 T8SJkDpv52zihbvwAGQuTVgdjgrT9fvmavbbXlIJd82KyZQ+k3k3+i4q4cZtI2VZzIVZ
 LEGA==
X-Gm-Message-State: AOAM533asAABoiO1mhkt74MeqF/20wDiijCLW8H7qc5PpxMOUU+OLxDa
 2u929h35ipagzZ501XzaSP8G3AuZqCkJyw==
X-Google-Smtp-Source: ABdhPJwsdDTczZS+vX8/Nxdl4H4faN26QV/tRRi0cKAX20gxeG3JVW5sYGRaK3dP0UeDm5JOzT1QbQ==
X-Received: by 2002:ac8:728b:: with SMTP id v11mr28496958qto.297.1593623681674; 
 Wed, 01 Jul 2020 10:14:41 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id u27sm6069257qkm.121.2020.07.01.10.14.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2020 10:14:41 -0700 (PDT)
Subject: Re: [PATCH] drm/msm: handle for EPROBE_DEFER for of_icc_get
To: Matthias Kaehlcke <mka@chromium.org>
References: <20200701030842.24395-1-jonathan@marek.ca>
 <20200701171228.GC3191083@google.com>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <49af8f44-51d4-aded-a34e-55c7c5780008@marek.ca>
Date: Wed, 1 Jul 2020 13:13:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200701171228.GC3191083@google.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 02 Jul 2020 07:24:22 +0000
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
Cc: David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>,
 Brian Masney <masneyb@onstation.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/1/20 1:12 PM, Matthias Kaehlcke wrote:
> Hi Jonathan,
> 
> On Tue, Jun 30, 2020 at 11:08:41PM -0400, Jonathan Marek wrote:
>> Check for EPROBE_DEFER instead of silently not using icc if the msm driver
>> probes before the interconnect driver.
> 
> Agreed with supporting deferred ICC probing.
> 
>> Only check for EPROBE_DEFER because of_icc_get can return other errors that
>> we want to ignore (ENODATA).
> 
> What would be the -ENODATA case?
> 

The of_icc_get for the ocmem_icc_path can return -ENODATA when the ocmem 
path is not specified (it is optional and only relevant for a3xx/a4xx).

> If the 'interconnects' property is not specified of_icc_get() returns NULL,
> shouldn't all (or most) errors be propagated rather than staying silent?
> 
> Thanks
> 
> Matthias
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
