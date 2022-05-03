Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADA4517F82
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 10:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF4A610E607;
	Tue,  3 May 2022 08:12:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 959A410E607
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 08:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651565540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I6HRqR6/PkZywKaaLK2mEKauScVXY+6o7oiKlucBtg8=;
 b=T0ggohDanYNpVx0YtWAIEj8VFKkSXlwxPr2P2Cwe0h9ezT8wgDaRb02TkotuQn0j9G9H3y
 zQmn9CkG/Sv913Qrr5n2HZGH7piEbi4gqm3GCHzyoRlPFs2IV6qb8Z6wWAyb5uEAZ/WTcp
 kJH/2YSEZz2jWAdVHfATiCtMLPcNLsU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-elcB9uy6PsiEXJMCOA4WNg-1; Tue, 03 May 2022 04:12:19 -0400
X-MC-Unique: elcB9uy6PsiEXJMCOA4WNg-1
Received: by mail-wr1-f69.google.com with SMTP id
 g7-20020adfbc87000000b0020ac76d254bso6106410wrh.6
 for <dri-devel@lists.freedesktop.org>; Tue, 03 May 2022 01:12:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=I6HRqR6/PkZywKaaLK2mEKauScVXY+6o7oiKlucBtg8=;
 b=4TW26EgKLnK7FYOqVBNAX3yKyWgiBZ8t4xLjHeOXtpdGFzKltX+g+LeDVH+zHhcEBP
 CHTIsDgER/xbLFrfTG31G9FmgFCrOUv40iZixd61hE8V9bEiwLHyJdgRYvdZi0tcfCk3
 inVmky1TjHZdrzPWWCO6M4DKUlvEbZmB9QlvuXtiOJr9GFF5vxH7YcWIpcrqM8wOF+75
 6me2QePBGQknXqt7b4UWiPr19+hqmxzeK+bZ0LqCgsQAtWIgL4ry5n74z+c5Ev2oHva2
 KqG65MABnDfU+ctqpKLz+fIskJoBge5UUKw6789hhCct28M68WEepm977dvVUa4559/W
 u8/g==
X-Gm-Message-State: AOAM532ra8qzKAJLoipFwbnNtvN4eiuPPC4SRG8cLg/dJEdAJi8ucq3F
 jpJWh68G3SqE5LedCU2niUY5ZiuoEnQQT5J/pZa5VjahGg1ipQaSPG0Vb+DDYIj741Z5zQ9rfrt
 +iesX/FLAnJZixmbzidhMqe3OX8od
X-Received: by 2002:adf:d1e2:0:b0:20c:7012:47c3 with SMTP id
 g2-20020adfd1e2000000b0020c701247c3mr3377740wrd.631.1651565538535; 
 Tue, 03 May 2022 01:12:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUQB7/o7wjqFq/MOxf22MZ2b1MV938uurE+mOLnqzEtP1mWN6YlRmj1TBpjup4+59M866DqQ==
X-Received: by 2002:adf:d1e2:0:b0:20c:7012:47c3 with SMTP id
 g2-20020adfd1e2000000b0020c701247c3mr3377728wrd.631.1651565538350; 
 Tue, 03 May 2022 01:12:18 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 y14-20020adfc7ce000000b0020c5253d90csm8851727wrg.88.2022.05.03.01.12.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 01:12:17 -0700 (PDT)
Message-ID: <e0cb7b67-afa7-c141-50b3-abb1b9f432dc@redhat.com>
Date: Tue, 3 May 2022 10:12:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 4/4] drm/format-helper: Share implementation among
 conversion helpers
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch
References: <20220427141409.22842-1-tzimmermann@suse.de>
 <20220427141409.22842-5-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220427141409.22842-5-tzimmermann@suse.de>
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

On 4/27/22 16:14, Thomas Zimmermann wrote:
> Provide format-independent conversion helpers for system and I/O
> memory. Implement most existing helpers on top of it. The source and
> destination formats of each conversion is handled by a per-line
> helper that is given to the generic implementation.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

