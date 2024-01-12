Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BE382C11F
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 14:51:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5703510E121;
	Fri, 12 Jan 2024 13:50:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B555710E121
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 13:50:57 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5578cb9645bso1830198a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 05:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1705067456; x=1705672256; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LnDh2WDi6ih3JOIcDBUTKm3Mx7ygGIkH3IkpNvRnimU=;
 b=S9KWKkAGbq5Gp/EOXbIpW9gALcPG3u59Brl6TgflgoChN/jjcN79Zq42YmKrIK/Xb7
 6QuKgTgzFjZGaN6iJdVLkfUA+6DoNm2WUgQpcx7wxfyJETIZqnooWpoe8HYGZ1ZKLuoG
 YMsYpMVTZ2eJdurLGghqMTymKVFn4PernzeRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705067456; x=1705672256;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LnDh2WDi6ih3JOIcDBUTKm3Mx7ygGIkH3IkpNvRnimU=;
 b=noK4LtqM+CccR1H6YCpqFa0CAHvwTiO3ncXcGXMm+h40mQIzcCB1kf4poQwrwbpIXt
 EwYkB/pQaAcuLbkzqZf1Lk/MLg5MJpa2pvELbc/TaOvOu+P2gGkGrLpBy0nH/Vmw6ESF
 6PFDv5xXKei4/ZepdzpZKhRPjauLQGK3m1bnkpf7GcGVWkUQqdhsomArgUhQQ1DXdl0h
 KpuNnWSQNmezxyznx2IUe9NhWdPr+2ARbMsGZS8XwQapzU/2j7pQo7Wzf3F03efzg/J/
 FJv2sT/CNM1nTR+A+Phb/FVoq1Y6t4pvl6R7U4IJf3bY3L3WqyW5y2vCnzLByWyf66en
 mZyw==
X-Gm-Message-State: AOJu0Yx+GfAkUBEWXtcPBovMUfoFN/1I5nyQNjrjCGtclFRmc3AlMBAX
 wraaDcdnC3jcuzgtR9YzlZhrdaioi7Tb0Q==
X-Google-Smtp-Source: AGHT+IGN1hipejYydbHRoOEWSB5xUqvEVheN5Jkwi3m/x++pfN63xEpNEot+2K3ylRlJGUtgGszItQ==
X-Received: by 2002:a17:907:7ea8:b0:a2a:b777:b35c with SMTP id
 qb40-20020a1709077ea800b00a2ab777b35cmr1144852ejc.7.1705067455979; 
 Fri, 12 Jan 2024 05:50:55 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 en4-20020a17090728c400b00a282c5a3143sm1831594ejc.88.2024.01.12.05.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 05:50:55 -0800 (PST)
Date: Fri, 12 Jan 2024 14:50:53 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v7 2/9] drm/panic: Add a drm panic handler
Message-ID: <ZaFDvaOgjM_nGOKz@phenom.ffwll.local>
References: <20240104160301.185915-1-jfalempe@redhat.com>
 <20240104160301.185915-3-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240104160301.185915-3-jfalempe@redhat.com>
X-Operating-System: Linux phenom 6.5.0-4-amd64 
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
Cc: bluescreen_avenger@verizon.net, tzimmermann@suse.de, javierm@redhat.com,
 mripard@kernel.org, gpiccoli@igalia.com, noralf@tronnes.org,
 dri-devel@lists.freedesktop.org, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 04, 2024 at 05:00:46PM +0100, Jocelyn Falempe wrote:
> +/**
> + * drm_panic_init() - Initialize drm-panic subsystem
> + *
> + * register the panic notifier
> + */
> +void drm_panic_init(void)
> +{
> +	atomic_notifier_chain_register(&panic_notifier_list,
> +				       &drm_panic_notifier);

Ok I've found another one after checking core panic code. This is the
wrong hook, we want to be a sttruct kmsg_dumper and use
kmsg_dump_register. And again once for each drm_panic_device so that we
can rely on core locking, as I've explained in the other reply.

Also because it trashes buffers from userspace I think by default we want
to only dump on panic, so KMS_DUMP_PANIC.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
