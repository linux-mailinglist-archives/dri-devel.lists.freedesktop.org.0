Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF5D4A897E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 18:10:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58A5310E18C;
	Thu,  3 Feb 2022 17:10:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88CA10E18C
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 17:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643908233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QQF2Zsb3m7HxgA1Q44z/oDM4z1H9JzKKpAGqk0K0oCU=;
 b=DPPM1j9GE66QfnvfSj/BWUOEMrUlKcwTNaaVclEFY2SSsH1J7fvSq3r6qTnCuQOc12vkpm
 bMYKcnEvu5t3E3abSTOUqqmXEz32QhWHLUQ69xyBUVsZnLbfspYAu6pLTTfIuoykvDaNiA
 c/VWzrQvrQ6gqj2dgoWN8eAgxuM8aUo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-ROeEoslSMli_klNJvJpszA-1; Thu, 03 Feb 2022 12:10:29 -0500
X-MC-Unique: ROeEoslSMli_klNJvJpszA-1
Received: by mail-wr1-f70.google.com with SMTP id
 b3-20020a5d4b83000000b001d676462248so918579wrt.17
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Feb 2022 09:10:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QQF2Zsb3m7HxgA1Q44z/oDM4z1H9JzKKpAGqk0K0oCU=;
 b=fP7Z36pBOYM6BGDBW1hCnPUwWiQo1LpiBW5yfScNEuleXTJJOVWQC21/D1zm2C3krP
 yI0dVwMGXCTWZSkYjJlfF8bKO8fLe/B3vD/vkNcwspQjeQwiTTwkkqxMpdpY7Pyd40Id
 xXKGB5DZXvCmGWN1QMKpevlonBbBf6X0q2Ms6WmLHUANMpZOkhPk35X6+V5bed5eWbRi
 HASsXCnhjqVY4X9GyUIxMG2iFBS38wilHVYAwhGZYWJzxW8kWQCrHupTg1OrSQXXruei
 TpVF0bmNDJEZkNML6tOL6MaAG5/HnPpbBhhqVPFP6tDhu4dTdZIeEdo1rcgWS9K9K6WY
 1ksA==
X-Gm-Message-State: AOAM532HGagbFfyC6h3O0oCrVtxnLCsEgSsQymPQZGuHX+/jXYHyw0qN
 V7q8yGOHoD8lzCCcY9Xlwhk9ZWpEQeL8EFbP0/Z1PlBWNa0nXll2mAxxm0kPgOYpWab6LuVpWXk
 yUbYHcNwgHmd/ugI26IByKPVvvdHW
X-Received: by 2002:a05:600c:4f47:: with SMTP id
 m7mr11244578wmq.132.1643908228623; 
 Thu, 03 Feb 2022 09:10:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzAhberuTLzYutI0AIn2DZvhosHVEvfa2yRqHeY4D1u5fDkLt8/f0Q3EBeKzE40oxQUFrT/OA==
X-Received: by 2002:a05:600c:4f47:: with SMTP id
 m7mr11244559wmq.132.1643908228402; 
 Thu, 03 Feb 2022 09:10:28 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id e13sm25201744wrq.35.2022.02.03.09.10.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 09:10:28 -0800 (PST)
Message-ID: <212e1408-b398-eea0-9563-928bdc29a642@redhat.com>
Date: Thu, 3 Feb 2022 18:10:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 5/8] drm/ast: Rename struct ast_connector to struct
 ast_vga_connector
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
 kuohsiang_chou@aspeedtech.com
References: <20220111120058.10510-1-tzimmermann@suse.de>
 <20220111120058.10510-6-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220111120058.10510-6-tzimmermann@suse.de>
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
Cc: jenmin_yuan@aspeedtech.com, tommy_huang@aspeedtech.com,
 dri-devel@lists.freedesktop.org, arc_sung@aspeedtech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/11/22 13:00, Thomas Zimmermann wrote:
> Prepare for introducing other connectors besides VGA. No functional
> changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

