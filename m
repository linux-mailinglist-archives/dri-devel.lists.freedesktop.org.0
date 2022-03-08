Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 878C84D1F0D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 18:26:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39BEE10E405;
	Tue,  8 Mar 2022 17:26:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8110E10E370
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 17:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646760382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N8X+MuUvFHpMiRuQcfHMMyE3CJKW1RIB7IgOHqZztUA=;
 b=cQKa6Qau9tq8xcMNBA9SAHp/M69XjWb7I0AjYug4GNA5DCAafDt0syIulz+5GctSOR0Z3j
 O4VEzzrznr8H2M79lP1G0cj7BWHjdrzoEPokXREMKO8CgHCJNx5+PR1RrYwhNDBgcaDIcm
 O/ufP3bKJimcdSTnE87YMTsQkV7ege0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-jp_FcT7YO8e0WbkltOIVdQ-1; Tue, 08 Mar 2022 12:26:21 -0500
X-MC-Unique: jp_FcT7YO8e0WbkltOIVdQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 x5-20020a1c7c05000000b00389bcc8df46so1396209wmc.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 09:26:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=N8X+MuUvFHpMiRuQcfHMMyE3CJKW1RIB7IgOHqZztUA=;
 b=zXjIbsCg5galJkYMsKwYJBwdGfVEaS3miHIh92YmSlmIBPjMGZCixTeHFa9K696g0i
 5BpxpCoxBuj8m7PROHkBtxsIOZ2caiMoMc3VcF990EgMAS92CPKSXIx28uyfexupEdQS
 xM693vpaWuNBlPXPAF2apEQ5EF9b2cTIwV3iKx5DY0aPZkiQfSyMpSRZ4hDkHrvQnJ/n
 6RgjXB6sxhvfSoo8ElIUgu9oyOMYWrs2sCZb4fT/adxnabOGrKOjRsraxMYptWGPEuSX
 WKAA73yEX5Db5yOtavU3sulC2WR9+jlVF0tV/yd+b/o9LcNUT44aHgnfXyBx93sFNjRQ
 vAjg==
X-Gm-Message-State: AOAM531aSjl7N491yQS8oUfb92Z5jvV5a4p6VMh0lIGmeAydClAR3x0k
 RbK0eaAPqfNTfqM+6nL1Am507sVWRKqPfg4BI2wJd13BVGk8Vt593Q/QBD2EgU2b/EMW3S6bLKe
 ZbaO05sUiWTokn4z+zH2PzdcO07Cr
X-Received: by 2002:a1c:4c0f:0:b0:382:ab63:19ac with SMTP id
 z15-20020a1c4c0f000000b00382ab6319acmr224321wmf.121.1646760379880; 
 Tue, 08 Mar 2022 09:26:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxjt/9Z0W4s/6PpAB9VbYl+fbuL+BQ/V2t3Il9UsSvRJrgSMvmrq22U1SeCZ/0kntI/lagqyg==
X-Received: by 2002:a1c:4c0f:0:b0:382:ab63:19ac with SMTP id
 z15-20020a1c4c0f000000b00382ab6319acmr224299wmf.121.1646760379616; 
 Tue, 08 Mar 2022 09:26:19 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 h188-20020a1c21c5000000b00385699a8993sm2960551wmh.11.2022.03.08.09.24.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 09:25:13 -0800 (PST)
Message-ID: <c072858b-c250-9de4-ff19-2e3babda3b50@redhat.com>
Date: Tue, 8 Mar 2022 18:24:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 5/9] drm/fb-helper: Separate deferred I/O from shadow
 buffers
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 deller@gmx.de
References: <20220303205839.28484-1-tzimmermann@suse.de>
 <20220303205839.28484-6-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220303205839.28484-6-tzimmermann@suse.de>
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

On 3/3/22 21:58, Thomas Zimmermann wrote:
> DRM drivers will be able to handle deferred I/O by themselves. So
> a driver will be able to use deferred I/O without an intermediate
> shadow buffer.
> 
> Prepare fbdev emulation by separating shadow buffers and deferred
> I/O from each other.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

