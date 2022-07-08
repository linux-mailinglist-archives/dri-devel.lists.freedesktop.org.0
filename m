Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EA156BA0A
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 14:49:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA17A10EC09;
	Fri,  8 Jul 2022 12:49:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5227410EC09
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 12:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657284556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BXuSFlnIAxgCKPnUJ6Nag3HqR+rDg0TljYkgtGxjjVs=;
 b=av7H7HtOXyLdOSLMJKfnNb3Pe6pHlYECN/2E0quuNcI8XPNxTCZ+KWO2kJpR+rEZyTASU+
 8IHRon1p/1FXmr5k/9tA4q0WbR4Smidu/J8QjuDnldxLVb3NwVwqo8GxF0kS1vy1juGGJ0
 XtoxRoF1jVjgvIK5mGq4Ndiu1xENmEo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-oa4qtM6WM2KOiiKZ5CBu_w-1; Fri, 08 Jul 2022 08:49:13 -0400
X-MC-Unique: oa4qtM6WM2KOiiKZ5CBu_w-1
Received: by mail-wr1-f70.google.com with SMTP id
 t13-20020adfe10d000000b0021bae3def1eso3792154wrz.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jul 2022 05:49:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BXuSFlnIAxgCKPnUJ6Nag3HqR+rDg0TljYkgtGxjjVs=;
 b=cfeS9wAwVUJjU36KVX9PH7X8Pqh+kIaKLLz4vm9vD7vyRx9kaMTv4b3LQJwa87kRNu
 G/7UgjAxasaj52sqeucLhQARim9MsGgYUStHEsEZnot3plXvQVIvjSEKxxZR/6j4fm1e
 PVC2i21URSVx3il/jyJYqWDxfUHrXth2QuuzEgbuoPtz1pLtHzHQyHA2mH83WesE4nEJ
 Ai2YnDmWeQpKplqhAWKlGSYigfFC22KLZVX4tZ29e8mT1Vbk1tnC5BQZXzbQfInR01yi
 louJFVMbcIjoq1veuu2zX428xq/Q+OVR/2Zezdy7uBHIOIJnMF7iTP9HgPgEdrz5nFiE
 XbTw==
X-Gm-Message-State: AJIora8FcL9zEVvkFzwnBubqFnDomGdI6A0Gp3kWq1wvg8yqRhT08lOl
 oOHU2FjvfB10yvAf/eS7vBusPONXGDYrrAExyHuI4wfrWtaqLU7p1o44eCMHOBDMMLubM0YN/C7
 0WovM22SOvZbxXPbGpT3Frw4GYETv
X-Received: by 2002:adf:fcc8:0:b0:21d:68dc:814 with SMTP id
 f8-20020adffcc8000000b0021d68dc0814mr3198820wrs.102.1657284551972; 
 Fri, 08 Jul 2022 05:49:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sXhd4T+yl5DMha3tRNDB/4iD3FiLVQoWs6+jCF56wa3Ebe+y62zjBioLN+cSMTshk3KpQlpg==
X-Received: by 2002:adf:fcc8:0:b0:21d:68dc:814 with SMTP id
 f8-20020adffcc8000000b0021d68dc0814mr3198802wrs.102.1657284551803; 
 Fri, 08 Jul 2022 05:49:11 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 j2-20020adfff82000000b0021a56cda047sm3218629wrr.60.2022.07.08.05.49.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 05:49:11 -0700 (PDT)
Message-ID: <3d80d394-0aea-8bfa-defa-af2b3c3784c1@redhat.com>
Date: Fri, 8 Jul 2022 14:49:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 01/11] fbdev: Remove trailing whitespaces
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org, maxime@cerno.tech
References: <20220707153952.32264-1-tzimmermann@suse.de>
 <20220707153952.32264-2-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220707153952.32264-2-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 7/7/22 17:39, Thomas Zimmermann wrote:
> Fix coding style. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

