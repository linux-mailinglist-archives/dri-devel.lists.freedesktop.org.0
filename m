Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FF24C512A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 23:04:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 223B210E9E8;
	Fri, 25 Feb 2022 22:04:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9390610E9E8
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 22:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645826670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bO21mGiFSjxrTsAgYiuxcv8DPInIyOqBoKvJzjPiVo8=;
 b=NRG3kXXyJXT1bBdLbe4BE2v9p8Yj6TJbhqQflHAasMYZ8AI10SGGFWCkEtnW7e2u9N4yeF
 ettg9/orw7D7xk4EYmpjy+ZuczeDWmSm9qvuW+LwNmI3KRnIo3ccJyyNF2roTxQw2cEwdZ
 eBpFv+8vTL8Me0HKGuwqtiwnvB5JFFI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-SwJO7QjJNxaQ34OVvoFsgg-1; Fri, 25 Feb 2022 17:04:29 -0500
X-MC-Unique: SwJO7QjJNxaQ34OVvoFsgg-1
Received: by mail-wm1-f69.google.com with SMTP id
 v125-20020a1cac83000000b0037e3d70e7e1so2241276wme.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 14:04:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bO21mGiFSjxrTsAgYiuxcv8DPInIyOqBoKvJzjPiVo8=;
 b=7hNtL/izSOTKqSvrj1mzqXTyL/0ofKW8fV8N3e0xuf66i1APaRUafkdkVd7j3Kz7jW
 V+ymRJVIT+lqsBs8hE02CPyY/ai1nFq/L8P249YyYphZKXT+6uXflXePxD+tVBV0TxRc
 kh15D9FoxiVqtUj110E7DdmxwwNWK+M4Y4JiGgQECVBvUtfTEXhNoil32EJQ6kpOEXLH
 hBokBB5mqSFechmSvwQ3yz5ruG1cmGRB9RY0tS3dUJnvOpcPdSLIHS5YnL62IVBXxrdh
 qL4UxGjQA2q6keOSk7js+6ZnkV+Oqt1pHtGBXI762lCFLffoyJh2u84Rgxttu2t2AqCR
 TcwQ==
X-Gm-Message-State: AOAM530ZYOkzgoKlwQGkKUBZfkshJJRt0PtP+2AVr/oSZVoPyewg0JqG
 CgXjPbKQn44dux7yvaX7TgRzAjcA9Dp55Nl5HuvVVsE9o16uNf6MTktHGx4P+OqcU75QCcFueW3
 /ywZkHIpiyBZskrmfEyX5yJmChNwf
X-Received: by 2002:a5d:6da3:0:b0:1e3:2f74:f025 with SMTP id
 u3-20020a5d6da3000000b001e32f74f025mr7609055wrs.59.1645826668016; 
 Fri, 25 Feb 2022 14:04:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIAVhIjXhFisDaSBcWS97jIQINaeO8cdSnnZqTT9pHKvxm2yqY6ihIXoPEmHCteAon+hDEJg==
X-Received: by 2002:a5d:6da3:0:b0:1e3:2f74:f025 with SMTP id
 u3-20020a5d6da3000000b001e32f74f025mr7609045wrs.59.1645826667780; 
 Fri, 25 Feb 2022 14:04:27 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 17-20020a05600c241100b0037c01ad7152sm4950807wmp.14.2022.02.25.14.04.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 14:04:27 -0800 (PST)
Message-ID: <cdb8e01c-1c0d-8ead-ed2e-e5bf20e54a0e@redhat.com>
Date: Fri, 25 Feb 2022 23:04:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/5] drm/i915/dsi: Add some debug logging to mipi_exec_i2c
To: Hans de Goede <hdegoede@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20220225214934.383168-1-hdegoede@redhat.com>
 <20220225214934.383168-3-hdegoede@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220225214934.383168-3-hdegoede@redhat.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Hans,

On 2/25/22 22:49, Hans de Goede wrote:
> Add some debug logging to mipi_exec_i2c, to make debugging various
> issues seen with it easier.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

