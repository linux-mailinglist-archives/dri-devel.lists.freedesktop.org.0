Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2A23A689E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 16:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048D889994;
	Mon, 14 Jun 2021 14:02:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A91B89994
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 14:02:02 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id p13so10647485pfw.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 07:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=rxN6qots3gftmYmzarjE1MfJoAMa+HkQ1sXzj7TBE+4=;
 b=lob5dTvi9uizmuj+tUdDynOO9jvwCr0ZDF8C0p4XA9CUWjEtUEb4iP5nx/JU49Tg6g
 1NEuc8YpZRgt6emmX0JgxGoUCX/0QsQGKoaVhVkni76t0b07YLZyrWFLmiGsB+kmOLLg
 4UL6Gu3vMUGV1h+1wNe9nqsGAjHmU73fzjrX0JABmg15fBfUzfRybKW1jJMHVAG1IO91
 jri9BfiF2YfZLHo/5JC3PWFkvLFrqfyZ9D2+n+DKVdgprQhrObhku+FpfJAg627OR/bt
 1dAsjGYImXJV1kwo+CxN5NJPF/IzD5Q4EfR8saUOdOIs5hMGSl6reCvLeVGdWDJg0KSz
 6RWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=rxN6qots3gftmYmzarjE1MfJoAMa+HkQ1sXzj7TBE+4=;
 b=OnMKtA6L5HvKPwyNWGCa6Fq5dNj9k5Gfouvjyw0s/nNapdm7RN7q02Ltv9lwH6Yq2r
 9/6goYJS32KUf1z7IKicqn42/zpOXMbkg445UJAzTV6QXjbOsj4ROfmoOh+gDgW91fd+
 lFcdCBjItpMLrSMmWhYq4gMiV4rCHx6jqR3WBnVbacoLKldPYaX7qK4x2MYCCNn3YhKK
 AOTbXMiYmREGmDcLoMr7INPHUxVpvc1CcaI7R+x2rwoElp8TSerO4XNbX4mRa+c3cits
 eyTjRi9Kmajnr1ZQwQAtRHKPRNKlPsJF0cXpguQzJuFDLasm/EoHVmshpNEPlln8+pBq
 NPnw==
X-Gm-Message-State: AOAM532zw3ITP6lOtKmHc+5g5YlEhZCgIrGuMqIqa3K2UmvBmxWqGw0A
 lbaNbK6nPi1sdTSPoldSGV8=
X-Google-Smtp-Source: ABdhPJyva6fsoFPamr3e/ZFu0g9Kw0nLUqIcZlXw8VINUW4Wv9YM/Ic7v/Mdt/3OQEjODPy2UTKMJQ==
X-Received: by 2002:a63:ce4f:: with SMTP id r15mr17119844pgi.387.1623679322246; 
 Mon, 14 Jun 2021 07:02:02 -0700 (PDT)
Received: from [192.168.1.8] ([50.47.106.83])
 by smtp.gmail.com with ESMTPSA id h18sm13273645pgl.87.2021.06.14.07.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 07:01:55 -0700 (PDT)
Message-ID: <2bf51ac723cb097685dd4c89926599d939d31765.camel@gmail.com>
Subject: Re: [PATCH -next] drm/hyperv: Remove unused variable
From: Deepak Rawat <drawat.floss@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Pu Lehui <pulehui@huawei.com>, 
 airlied@linux.ie, daniel@ffwll.ch
Date: Mon, 14 Jun 2021 07:01:51 -0700
In-Reply-To: <078d9bb5-e7af-4961-f4c1-cd3ab415cff4@suse.de>
References: <20210609024940.34933-1-pulehui@huawei.com>
 <078d9bb5-e7af-4961-f4c1-cd3ab415cff4@suse.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: zhangjinhao2@huawei.com, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2021-06-09 at 09:46 +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 09.06.21 um 04:49 schrieb Pu Lehui:
> > Fixes gcc '-Wunused-const-variable' warning:
> >    drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:152:23: warning:
> >      'hyperv_modifiers' defined but not used [-Wunused-const-
> > variable=]
> > 
> > Signed-off-by: Pu Lehui <pulehui@huawei.com>
> > ---
> >   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c | 5 -----
> >   1 file changed, 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> > b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> > index 02718e3e859e..3f83493909e6 100644
> > --- a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> > +++ b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> > @@ -149,11 +149,6 @@ static const uint32_t hyperv_formats[] = {
> >         DRM_FORMAT_XRGB8888,
> >   };
> >   
> > -static const uint64_t hyperv_modifiers[] = {
> > -       DRM_FORMAT_MOD_LINEAR,
> > -       DRM_FORMAT_MOD_INVALID
> > -};
> 
> This constant should rather be used in the call to 
> drm_simple_display_pipe_init(). [1]
> 
> Best regards
> Thomas
> 
> [1] 
> https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c#n161
> 
> 

Hi Pu,

Thanks for the patch. Is it possible to send another patch as per
suggestion by Thomas. There is a kernel test robot failure as well.

Deepak

