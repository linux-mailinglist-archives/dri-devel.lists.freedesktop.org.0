Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EBE694616
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 13:43:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AC8010E5AA;
	Mon, 13 Feb 2023 12:43:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B75510E5AA
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 12:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676292205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dVV8BP4LQ7jR9rjLOdk919ok2Vjalky2DrMtW9FxH5o=;
 b=fFilD6KIIDr9h95hLgmf72Fd8j1VtuahC6sh4oJ0PqQ2JZ2n7VSVzhfK2wxAl+BevdscQq
 2HO1EpGg+49+rl0b8VEjHMR/ifzxV97s2J8W/cIMiaQ2yGiO2GIOpdC3QtTBKMbc2GKhdN
 ndt/rok3VCk9RQHATLA65M+r8eis6K8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-362-bLpBaoiYN6uF-t9nbMYMrw-1; Mon, 13 Feb 2023 07:43:24 -0500
X-MC-Unique: bLpBaoiYN6uF-t9nbMYMrw-1
Received: by mail-wm1-f70.google.com with SMTP id
 ay19-20020a05600c1e1300b003dc54daba42so6091896wmb.7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 04:43:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dVV8BP4LQ7jR9rjLOdk919ok2Vjalky2DrMtW9FxH5o=;
 b=5uFjupI+a3N9cv3FrDzGMKz7THn6jwJBVfAWQrP1Kb++MwOtEHmz54/myMKtvBXQWs
 5D18WRpgCtmGgBFtqdG6vpezC+HJAopvnMdKrMhHo9fCpYPdS32lIlLKFL3Pgj/oNKMu
 VNod8VhqZ1eTTVfC3QJkJwiXf0MUEzcAUi+fQv0tZOIscly8CigNzkxDUjQheWqT2Qwf
 9p2LJf3UUtlQ6QwoXrJZa6rXrOLdiFCxG4KhH2iPFa80Gx7dw08PZHEPAlBM3FKnkdQE
 pgPMCLqnzBn5gvLa77aY/YaezFydRpdaQ5l5fjR8ASTZNvdltCFFJqNAleEonMIm5Z4e
 /xJg==
X-Gm-Message-State: AO0yUKUVDuUASPHKHGPfo+hK/XQrygayLtLjH3Q0mcjLJfrIR1vWb3Pr
 B2EftPTJbkXiVMJrCd/jp6hO6AzRm7HrC8cESNy8BWTiT/sQJuTi/x1RLwJvxzNj2OeLehP3ihO
 EiYDXb1hLdj4gRE5mchSTjyv4CTtO
X-Received: by 2002:a05:600c:1684:b0:3dc:5622:5ded with SMTP id
 k4-20020a05600c168400b003dc56225dedmr18654762wmn.12.1676292203099; 
 Mon, 13 Feb 2023 04:43:23 -0800 (PST)
X-Google-Smtp-Source: AK7set97ib5TNiHa0msyXoExrWiUWQimrwXn3808DgNhxrnl8PyhnOStpk5fjbjAEli+lM9FsDUDYg==
X-Received: by 2002:a05:600c:1684:b0:3dc:5622:5ded with SMTP id
 k4-20020a05600c168400b003dc56225dedmr18654751wmn.12.1676292202954; 
 Mon, 13 Feb 2023 04:43:22 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bi5-20020a05600c3d8500b003d9aa76dc6asm17874868wmb.0.2023.02.13.04.43.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 04:43:22 -0800 (PST)
Message-ID: <ba4cb015-1c76-c6f9-ec09-83d751e9e10e@redhat.com>
Date: Mon, 13 Feb 2023 13:43:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/4] drm/vc4: hdmi: Replace hardcoded value by define
To: Maxime Ripard <maxime@cerno.tech>, Emma Anholt <emma@anholt.net>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230126-rpi-display-fw-clk-cleanup-v1-0-d646ff6fb842@cerno.tech>
 <20230126-rpi-display-fw-clk-cleanup-v1-1-d646ff6fb842@cerno.tech>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230126-rpi-display-fw-clk-cleanup-v1-1-d646ff6fb842@cerno.tech>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/26/23 18:05, Maxime Ripard wrote:
> The 120MHz value hardcoded in the call to max_t to compute the HSM rate
> is defined in the driver as HSM_MIN_CLOCK_FREQ, let's switch to it so
> that it's more readable.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

