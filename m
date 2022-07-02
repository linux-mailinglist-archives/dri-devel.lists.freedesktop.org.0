Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63089563FE3
	for <lists+dri-devel@lfdr.de>; Sat,  2 Jul 2022 13:51:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6DF82ACDB;
	Sat,  2 Jul 2022 11:51:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC7118AE18
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Jul 2022 11:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656762695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lX7NhBgu11gdEXWnivkjv4CHtCkCUVCWljnJciBNVYk=;
 b=hK4DNIoqvJXeFnQ0vM1uZ/lUgUb7IkMX7RO/fX/pnxUirxbSpNHk8V/q4BS1AA0sUeGVyb
 TBlnx6OIOzyFsI1MB6JsJEGn4FRWho+UO0Vy5FH0zPw6y4xhDi6lC7DG9v8PHdwvAt4WKo
 UutYxVHD0ZlwtM6wGTaFST1QcymCya4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-117k2Y-KP1SOn67GAhS7Yg-1; Sat, 02 Jul 2022 07:51:34 -0400
X-MC-Unique: 117k2Y-KP1SOn67GAhS7Yg-1
Received: by mail-wm1-f72.google.com with SMTP id
 j19-20020a05600c191300b003a048196712so2647324wmq.4
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Jul 2022 04:51:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lX7NhBgu11gdEXWnivkjv4CHtCkCUVCWljnJciBNVYk=;
 b=BqtY9NibKB4/FiBQV6BM/TqFcDFW0edwDRiy3eXHGC3LijZ4wftBb1vp2wjHR0AQLS
 McCVQQhz+vkuCOcwzHfrcPgcGQrk6h/QhotAst8q+y9ZeoozlaylGipRsJlcvvsw0fwL
 O6gZ/hkRWhtSCIkoIXeTPnhOpDdOgFVqV1XLvaZUIHUHVACF5+ulHbfb+j9wa0Su847h
 CpYnyPKcUlGg7UYft/joJV0kzf4gYE7mJvfVjA6m+4YoqBbDGipUXq+zCcBtUVNDd71W
 /lJXVNCmohhENoRrx53XCleG2ZMTy35gKKRBWHb22Ce8H+UGy9hdjcFsRles/EGJKyhU
 bwHw==
X-Gm-Message-State: AJIora8lfTHzeX29JbI7Hyeq1uAvJgK6nDnfMK1FiF15DNRzu/kneR/u
 rz5wUf6PgdLfCDXWonFn6BikOJUv5S9C8Co7l1uMOCLPAb9oWsn6dfsrnu7c930s5TFYLNbSvbE
 7DhN/8G0QVTqPzt7VFPloqhJLMLCc
X-Received: by 2002:a5d:4304:0:b0:21b:9b2c:be34 with SMTP id
 h4-20020a5d4304000000b0021b9b2cbe34mr19190943wrq.577.1656762693111; 
 Sat, 02 Jul 2022 04:51:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1suwBX9nluN5Fdjy1P3/ahvuZQQTgj5PLCla2XhR4/ZWQ/N9EQ/EXtH9IU3XKP12IYsUHFEEQ==
X-Received: by 2002:a5d:4304:0:b0:21b:9b2c:be34 with SMTP id
 h4-20020a5d4304000000b0021b9b2cbe34mr19190909wrq.577.1656762692846; 
 Sat, 02 Jul 2022 04:51:32 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t5-20020a1c4605000000b0039db31f6372sm9573473wma.2.2022.07.02.04.51.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jul 2022 04:51:32 -0700 (PDT)
Message-ID: <b3939861-692b-4bc9-5cb4-e50aabb04917@redhat.com>
Date: Sat, 2 Jul 2022 13:51:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 8/9] drm: selftest: convert drm_buddy selftest to KUnit
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <maira.canal@usp.br>,
 Isabella Basso <isabbasso@riseup.net>, magalilemes00@gmail.com,
 tales.aparecida@gmail.com, mwen@igalia.com, andrealmeid@riseup.net,
 siqueirajordao@riseup.net, Trevor Woerner <twoerner@gmail.com>,
 leandro.ribeiro@collabora.com, n@nfraprado.net,
 Daniel Vetter <daniel@ffwll.ch>, Shuah Khan <skhan@linuxfoundation.org>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, michal.winiarski@intel.com,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 David Gow <davidgow@google.com>, Daniel Latypov <dlatypov@google.com>,
 brendanhiggins@google.com
References: <20220630004611.114441-1-maira.canal@usp.br>
 <20220630004611.114441-9-maira.canal@usp.br>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220630004611.114441-9-maira.canal@usp.br>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/30/22 02:46, Maíra Canal wrote:
> Considering the current adoption of the KUnit framework, convert the
> DRM buddy selftest to the KUnit API.
> 
> Acked-by: Daniel Latypov <dlatypov@google.com>
> Tested-by: David Gow <davidgow@google.com>
> Signed-off-by: Maíra Canal <maira.canal@usp.br>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

