Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D27C28C20EE
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 11:30:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D9B10E724;
	Fri, 10 May 2024 09:30:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hr8sHkc3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC45410E724
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 09:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1715333411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iSsQDRtiI5QIr5b0jeHp27J8HBkPivRZ/mUUZPNYw7U=;
 b=hr8sHkc3fWFMt6mc5Bf7iCTsm0W7cZMBIEk1BVDDtW2NhurALuNHqMmKuVWi/RC08D+K/B
 /8kNKaVq4tP/ljq/+YmvErIimoIyGIB7f7H4/2yeaM2OBF2dzh3W1aG3AWe6JTVCa5Yq4w
 g51oyXTCY5Oi0hwVkl20G92cth3wCmc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-414-hdr4XivkOj650Z7BihXU2g-1; Fri, 10 May 2024 05:30:09 -0400
X-MC-Unique: hdr4XivkOj650Z7BihXU2g-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-41ab62f535aso8056915e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 02:30:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715333408; x=1715938208;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iSsQDRtiI5QIr5b0jeHp27J8HBkPivRZ/mUUZPNYw7U=;
 b=AVQ1iYN2e5umoSz1j+v/Nb4ZtK2RfG+62uxELG7su5UAQx4cNbSltfQ5tha6GO9GGN
 qnsALZjBPWYEgVJrJPwimwRsv1cDy9nQhVAkLit9bV2Cg3eU6F9EPGUhIt8uyyD2QDEs
 dK3ICrwRpqledNjs940vaiExy4xr0r7Vd/S/ftQnVFmkaReYSZYaLKghleD2pSk9UTkp
 nuLv4XGKMQLuIAywTJJhR/tYJL0msJFrqrB5NI1dMX1+DeclzARVB2in9ErNuSF7G+sO
 QJ7eVoClVqOePhTON2MNyn8fLwvo8RFNXidw3qyN+ectOYxQB2/BEXQvnjiIgDF/7s6a
 Hkjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU++EBqvZP7wLxlNEbe3pY8dRlotBHTWFxr3VO2SJSHR6SniaVdHrhVp6m8XbOoGrYhLKBatv6gqQE/OFN+52eHRVLRrtEd02S+OMP/R7Bn
X-Gm-Message-State: AOJu0YwMIEXKq/t2hjXGRt9mQxYWW+HzJvuIT60ZWl2qogM1CzUP94fJ
 HVpLAXzwpEZBbeIPatnGLsxKIHgkw/YmzO5o3lIx8wHrdiR2AD0EZK36+juFqP9rjbtuXgR3Ijr
 NT99BG8EyTtxFJ8yH4iTtSPMGPPfLLZ3aYzyeZb1XErLwKOiPS5JEwozOJ/aMQx2XoQ==
X-Received: by 2002:a05:600c:450e:b0:41b:d8df:93a3 with SMTP id
 5b1f17b1804b1-41fea931fabmr14369035e9.1.1715333408234; 
 Fri, 10 May 2024 02:30:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkkRotzZJr3B0G5FLNO995hyBsibbp5pHZ1htljG/pYyf7ljvONOYm++gkhxCfXxHaz+xeFg==
X-Received: by 2002:a05:600c:450e:b0:41b:d8df:93a3 with SMTP id
 5b1f17b1804b1-41fea931fabmr14368915e9.1.1715333407732; 
 Fri, 10 May 2024 02:30:07 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccce25casm56644695e9.20.2024.05.10.02.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 May 2024 02:30:07 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] drm: use "0" instead of "" for deprecated driver date
In-Reply-To: <20240510090951.3398882-1-jani.nikula@intel.com>
References: <20240510090951.3398882-1-jani.nikula@intel.com>
Date: Fri, 10 May 2024 11:30:06 +0200
Message-ID: <87pltuc8v5.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jani Nikula <jani.nikula@intel.com> writes:

> libdrm does not like the empty string for driver date. Use "0" instead,
> which has been used by virtio previously.
>
> Reported-by: Steven Price <steven.price@arm.com>
> Closes: https://lore.kernel.org/r/9d0cff47-308e-4b11-a9f3-4157dc26b6fa@arm.com
> Fixes: 7fb8af6798e8 ("drm: deprecate driver date")
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---

It's a pity that libdrm can't cope with the empty string, using 0 makes sense.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

