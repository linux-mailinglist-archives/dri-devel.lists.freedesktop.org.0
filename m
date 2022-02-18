Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1854BB577
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 10:24:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76F310E26C;
	Fri, 18 Feb 2022 09:24:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3AE610E26C
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 09:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645176259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OrQCVaqQbXHTrFz+bGi4f699ia90v0XlEHoS7ms3G2o=;
 b=g9rhKjlEQKwHvljzwdbB65ZJVV+fmZrNDjevoA9QJYo5WE6XeY5m67bTn5jRZoy8i35qWB
 kUNddMHJopttpMRfnEXdg1vZ+p5sjKaqxkp8ZsVHIxYTt/mw0JH2pXAB+XWa0UHmTLynKT
 qjQ3sYKA0I4P4vdPUSY52OPhpVmf3BU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-w-81p-tWNU2_lkMaPrHmKw-1; Fri, 18 Feb 2022 04:24:18 -0500
X-MC-Unique: w-81p-tWNU2_lkMaPrHmKw-1
Received: by mail-wr1-f72.google.com with SMTP id
 h24-20020adfaa98000000b001e33eb81e71so3316546wrc.9
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 01:24:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OrQCVaqQbXHTrFz+bGi4f699ia90v0XlEHoS7ms3G2o=;
 b=fbL1BMljF1BMA8J7CSDCjjEe7FDS/Sd+5tP2o2YMx1zT5CI0k9nb5XWpL9DEjW41GM
 wo3HK+6QSxqknTWvhOaa3jClwNy0rNUqDnNbvZY76u5Vm8/8TicJa/tnG899GA6LGTb9
 AiSNX9D7/B8UM0Ji20zfHorjVpAxCT01UakiQ2AsjtYptCaiyWJ+WJiqTA6qX5xYmTui
 ggwb3Uq55K8TFv9my9tZGXUpl+LP3GWEG07hPZZ4YHrPywd0qOYXpqmw1PgjTdZyhHl2
 EPLDZ86g26kREmezkZtwzEcANC1+u0lB/OQLBS2Xwsaq/3i1I4b3XCWxVVZ98m4IFsng
 oetA==
X-Gm-Message-State: AOAM533S+cYEVMhO2DVp56JQsCqjNkBRngMpoLNk4K2oIZDVEk56PXnb
 IazfFUIFMbhmbRgc3Yolsvwl0q+nKOCefIHlRFFCU3Inihn5ATnl9CLVIxoKAwy6tTPtYs+pN8F
 utnUFj+/vD0CVsM3vRr5vsIkeocBL
X-Received: by 2002:a7b:cd11:0:b0:37c:82e:d742 with SMTP id
 f17-20020a7bcd11000000b0037c082ed742mr9414116wmj.170.1645176257228; 
 Fri, 18 Feb 2022 01:24:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+5F1ocqRF9F+pUDeSDknNeICJmEiZICFoS94DE83Jkq/Z+3iQAfZIvUUPzI8L1uiJUcbrpg==
X-Received: by 2002:a7b:cd11:0:b0:37c:82e:d742 with SMTP id
 f17-20020a7bcd11000000b0037c082ed742mr9414091wmj.170.1645176256935; 
 Fri, 18 Feb 2022 01:24:16 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id x18sm40908244wrw.17.2022.02.18.01.24.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 01:24:16 -0800 (PST)
Message-ID: <6c06a344-f998-1f15-0f94-c295d4831654@redhat.com>
Date: Fri, 18 Feb 2022 10:24:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] fbdev: Improve performance of sys_imageblit()
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch, deller@gmx.de,
 geert@linux-m68k.org
References: <20220217103405.26492-1-tzimmermann@suse.de>
 <20220217103405.26492-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220217103405.26492-3-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 2/17/22 11:34, Thomas Zimmermann wrote:
> Improve the performance of sys_imageblit() by manually unrolling
> the inner blitting loop and moving some invariants out. The compiler
> failed to do this automatically. The resulting binary code was even
> slower than the cfb_imageblit() helper, which uses the same algorithm,
> but operates on I/O memory.
> 
> A microbenchmark measures the average number of CPU cycles
> for sys_imageblit() after a stabilizing period of a few minutes
> (i7-4790, FullHD, simpledrm, kernel with debugging). The value
> for CFB is given as a reference.
> 
>   sys_imageblit(), new: 25934 cycles
>   sys_imageblit(), old: 35944 cycles
>   cfb_imageblit():      30566 cycles
> 
> In the optimized case, sys_imageblit() is now ~30% faster than before
> and ~20% faster than cfb_imageblit().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

This patch looks good to me as well.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

