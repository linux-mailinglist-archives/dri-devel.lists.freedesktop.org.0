Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7840948AA4D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 10:18:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8AE4113147;
	Tue, 11 Jan 2022 09:18:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6616311312A
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 09:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641892716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6oHUrM3RS+L3Vz7kWz+c3UDjVYd8L99qu3vLDUjDJeI=;
 b=KOLQPoBCSaHP1ummHXjEBhjc61y1qLnHF/vgYn5s1E5pelhJltCTmUIx2DRQ8BMRINHYWf
 hD67K8J7tjYkmnKNyGuJLOnbj0MoZgRcD+pIQseABYj3cfXVSkhjPyfTUmWIGhOVRoO2PS
 nR7ZPg/PM2oxJ+kqjDGTli5W61GXy+0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-ZreaEm2dM3Cl85ABqlTPcA-1; Tue, 11 Jan 2022 04:18:34 -0500
X-MC-Unique: ZreaEm2dM3Cl85ABqlTPcA-1
Received: by mail-wm1-f69.google.com with SMTP id
 bg32-20020a05600c3ca000b00349f2aca1beso415405wmb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 01:18:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6oHUrM3RS+L3Vz7kWz+c3UDjVYd8L99qu3vLDUjDJeI=;
 b=D8/MlxnQe1Y1U0EPkKFNxTiiT1hmRIpzAeBJnAhlYyB7RqS5VrGMxjALET858+p9mb
 CcJpj3U0QmZs0nGZx9KGpRFVt9IFGfclphUOOz05fLctLVZu44AMj7E8+7XUvC9WfIxM
 FcXtIdnPqyTHpT2qZKO8vGrT95Vc+AFiHoxIQljcZYCagra3zpAvmnZK9AkuLx+PWzN2
 vROEzf0BRAeofrTHtyOGARO34WyS7paZj5XvWb977OgJ8hKXyzyHHG+CJjji9zKjaTfl
 RtYaXxDP737ZadE88LmxHIZHSI2tYkEaJ+hSnYI5sx/EF5LuDdLQcXLJu6jBdD1Xx6Av
 XFsQ==
X-Gm-Message-State: AOAM530Rfvcn8rBGr7COhtHKo58X7+uQ6Q26l+gfU7Z029YCQ3Dnr2wZ
 7HXbpqKjrCmAkwLaw2h5J2va31tWkXnCWPtv/KrDHDuKOB60knV4twA2WIPrk4z82TmGZFuT2W0
 f2c1nEn1rjcIR/DAmRWlDGXhKNZ8g
X-Received: by 2002:a05:6000:1e07:: with SMTP id
 bj7mr3051675wrb.126.1641892713083; 
 Tue, 11 Jan 2022 01:18:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyiPRTSDhAfJev3SQP2RODjc8Dk9f2YD2fksE5REufjVnPUKkWdd61Xhdqv1491aGkI0dXbAQ==
X-Received: by 2002:a05:6000:1e07:: with SMTP id
 bj7mr3051663wrb.126.1641892712909; 
 Tue, 11 Jan 2022 01:18:32 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id p11sm10444194wru.99.2022.01.11.01.18.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 01:18:32 -0800 (PST)
Message-ID: <3fb108bc-08c5-032c-bbe1-c819e85a91ed@redhat.com>
Date: Tue, 11 Jan 2022 10:18:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1 2/2] drm/sprd: fix potential NULL dereference
To: Kevin Tang <kevin3.tang@gmail.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, mark.rutland@arm.com
References: <20211224141213.27612-1-kevin3.tang@gmail.com>
 <20211224141213.27612-3-kevin3.tang@gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20211224141213.27612-3-kevin3.tang@gmail.com>
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
Cc: devicetree@vger.kernel.org, zhang.lyra@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 orsonzhai@gmail.com, lukas.bulwahn@gmail.com, zou_wei@huawei.com,
 pony1.wu@gmail.com, dan.carpenter@oracle.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/24/21 15:12, Kevin Tang wrote:
> platform_get_resource() may fail and return NULL, so check it's value
> before using it.
> 
> 'drm' could be null in sprd_drm_shutdown, and drm_warn maybe dereference
> it, remove this warning log.
>

I would split this second change in a separate patch and just keep this
one about checking the platform_get_resource() return value.

If you do that, feel free to add:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

