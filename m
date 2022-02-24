Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BEF4C2651
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 09:31:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7123810F4C2;
	Thu, 24 Feb 2022 08:31:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400B610F4C1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 08:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645691478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xo8E90uuxqaqeCLoq4VGnrq9hH/Zy3PficDmQA7NRyw=;
 b=V1KNdH2IDgASQCZ0/H4xoftljE4UcYArJ4jDLGdsIlF9WYxJacx3fTpZ4zcJUi6hwX1mdp
 3xbYr4vccjp+e8KNyyUaT1BAI+pY5LHiWnU8Oku8hHsEYCGXHH6tx5AH3aj5wdOJBeNqVL
 XIVQ5s9HSK5xIM9oBIeay4VZQ7++nXc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-137-sEZrF9MiM7i97bF0Bgzzpw-1; Thu, 24 Feb 2022 03:31:16 -0500
X-MC-Unique: sEZrF9MiM7i97bF0Bgzzpw-1
Received: by mail-wm1-f69.google.com with SMTP id
 i20-20020a05600c051400b00380d5eb51a7so545590wmc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 00:31:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Xo8E90uuxqaqeCLoq4VGnrq9hH/Zy3PficDmQA7NRyw=;
 b=XSH8QmP5NmXHY8LsXrvzthdjGbh5Daf7xX15Ta6azivAW2AlhwtjSRVfT+i/hPjDC0
 AjbRGCxwDEUa5fSOfIQ/T78SOaxYDrlnk0R8wWDBvIWXf4hH9k8SBS1tqkvty9XDDNFH
 f+jlSwTiob8PJk1Z0WT/mux9wIEf598eQFrMB2a6iWch33mvOKAjnPMdj5S7e2NPMx+2
 kLpaOVhRTcVJQK9hLe9N1r4n8/zkqTL/JpU1ly/u4OOTjv6zOz2UnfgCik3if5aTTcb/
 zdXXc/bikfOahJXK06HV6SNtSZFVbuH9vTyP5ASHr5bTXxlZ6PqcaACZBxneI5hH+l75
 105g==
X-Gm-Message-State: AOAM532YqRzoVYWHkSpHjsiLEQOlhetfLXUrsl0jYpjxpM0e7ehY0OGI
 iPWwI4DkP4yu1Mz9w27MPyIwVdIMS4+C9TqcF2oIK2UY9LUhtjw0ZFF7it6WPgjzBvGY/a6EfHU
 sU0HwPMedcYMR7xwUvO1vTkBVxGyc
X-Received: by 2002:adf:fe85:0:b0:1ed:895b:a90d with SMTP id
 l5-20020adffe85000000b001ed895ba90dmr1252311wrr.55.1645691475682; 
 Thu, 24 Feb 2022 00:31:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx1++PWNyaiY5KES+gGanSWUriLozwmCoh7hNVWlwC9b1XK24ZXZ8dYqS3bRhFmAzAF02gZaQ==
X-Received: by 2002:adf:fe85:0:b0:1ed:895b:a90d with SMTP id
 l5-20020adffe85000000b001ed895ba90dmr1252291wrr.55.1645691475459; 
 Thu, 24 Feb 2022 00:31:15 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id u12sm1990215wrs.2.2022.02.24.00.31.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 00:31:15 -0800 (PST)
Message-ID: <6692a3cd-21c8-3f09-cf55-ea2b8af34d30@redhat.com>
Date: Thu, 24 Feb 2022 09:31:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 4/5] fbdev: Improve performance of cfb_imageblit()
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch, deller@gmx.de,
 geert@linux-m68k.org, sam@ravnborg.org, kraxel@redhat.com,
 ppaalanen@gmail.com
References: <20220223193804.18636-1-tzimmermann@suse.de>
 <20220223193804.18636-5-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220223193804.18636-5-tzimmermann@suse.de>
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

On 2/23/22 20:38, Thomas Zimmermann wrote:
> Improve the performance of cfb_imageblit() by manually unrolling
> the inner blitting loop and moving some invariants out. The compiler
> failed to do this automatically. This change keeps cfb_imageblit()
> in sync with sys_imagebit().
> 
> A microbenchmark measures the average number of CPU cycles
> for cfb_imageblit() after a stabilizing period of a few minutes
> (i7-4790, FullHD, simpledrm, kernel with debugging).
> 
> cfb_imageblit(), new: 15724 cycles
> cfb_imageblit(): old: 30566 cycles
> 
> In the optimized case, cfb_imageblit() is now ~2x faster than before.
> 
> v3:
> 	* fix commit description (Pekka)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Makes sense, improves perf and makes the two more consistent as you mention.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

