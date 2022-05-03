Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9C2517F54
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 10:02:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B34410E3D6;
	Tue,  3 May 2022 08:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92BC410E3D6
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 08:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651564927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BQVIpbfJeq4F9H6FAGPuUXnPHxjbLKE/Wrr/Cy8dg34=;
 b=Q1SrjCHIPXv99k+a1ENC89m/hnkrEAlUkJAnQxZfERhlODAaKHTMPYAXEeqk26iDtae7L/
 p1R2k1YA60/yyBjXh1d89XK7zzfnKgyb/cJPqPa5sm71ipSdcOPu9tbJeXPWaTq6oGs9cS
 FVjh2jj0pvQloi5tgWVsRNg4w1VIaIY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-muJd_HSdOT6XgnIvt-n0IA-1; Tue, 03 May 2022 04:02:06 -0400
X-MC-Unique: muJd_HSdOT6XgnIvt-n0IA-1
Received: by mail-wr1-f70.google.com with SMTP id
 t17-20020adfa2d1000000b0020ac519c222so6069115wra.4
 for <dri-devel@lists.freedesktop.org>; Tue, 03 May 2022 01:02:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BQVIpbfJeq4F9H6FAGPuUXnPHxjbLKE/Wrr/Cy8dg34=;
 b=smED5PXyK2ailpSrn8dD0sSbEtZs+8NHIG5JuqiozvXB3894BNp81HuQ0sHUbvnATn
 +vg9GITXdOW9wLix2666HFO9128XBiduCoo79U+hvVys9oJnpEiKJ+60oBRfjceJR+8w
 TGtLc1WQ3yy4R7u6fBPqLWE84sfupHBb5t2sdFM+PaTHk9ORUshaQCBKHR3s3HCbmt+Z
 iPjtF21fPH599siPBk6c4k+t9/wLuqfCzNo50Qte2Z3uSHnFboJcVWBQSwDigH5iepaG
 NoARfdzOpLxcavEp1QVcZUoRsu6aRFt/oj3wfKMxWmN14g9c6qnYNpgwMAEBGfpvNvfY
 WwFQ==
X-Gm-Message-State: AOAM532gD7y9ilLJ2RcmUjnw5SFnGLLRIFuExe5lsw+r9Ed6Frr2vccJ
 qFGSvUm24Gv5+2GL2hCmeKP5d9bWXZsf2Ex5fwJowkD/Uu/XbwgYa3V7MGXsgwierUkcUcKYbqe
 IrtL1x0ylWJqGSJsmS2sA2VBE+St8
X-Received: by 2002:a5d:6088:0:b0:20a:e81e:c76a with SMTP id
 w8-20020a5d6088000000b0020ae81ec76amr11611888wrt.182.1651564925561; 
 Tue, 03 May 2022 01:02:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzca+li5c+PUi2Cw1DaQrdJ2JB1K32eYfrxS1Cpfh7udvk3ujNTjmcFlC4OXU9MO7IwE5b5Q==
X-Received: by 2002:a5d:6088:0:b0:20a:e81e:c76a with SMTP id
 w8-20020a5d6088000000b0020ae81ec76amr11611868wrt.182.1651564925323; 
 Tue, 03 May 2022 01:02:05 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a05600c2f9000b003942a244f50sm1270608wmn.41.2022.05.03.01.02.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 01:02:04 -0700 (PDT)
Message-ID: <bc2bd845-2ca9-18d8-747d-80833db571f8@redhat.com>
Date: Tue, 3 May 2022 10:02:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/4] drm/format-helper: Remove optional byte-swap from
 line convertion
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch
References: <20220427141409.22842-1-tzimmermann@suse.de>
 <20220427141409.22842-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220427141409.22842-3-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 4/27/22 16:14, Thomas Zimmermann wrote:
> Implement per-pixel byte swapping in a separate conversion helper
> for the single function that requires it. Select the correct helper
> for each conversion.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

I couldn't spot any issues but I believe these conversion helpers are
not easy to read and one could miss subtle issues so it would be nice
to have unit tests for these using the KUnit infrastructure:

https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html

I'm not asking to do it as a part of this series but something that
we may do as a follow-up though, just mentioning.

I'll post a patch to add that task to Documentation/gpu/todo.rst,
so it is tracked somewhere.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

