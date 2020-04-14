Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6745E1A88FF
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 20:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 609AF6E243;
	Tue, 14 Apr 2020 18:17:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DFE96E243;
 Tue, 14 Apr 2020 18:17:15 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id b62so14369006qkf.6;
 Tue, 14 Apr 2020 11:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Jmuf5ljJDQYQlumUw5CE4lMT7WuPAzl9vVKIeyphu/Q=;
 b=q4t7D7Nx9JdZPx0ByfS5AhxNJq9N2BxvE7kQG90ceCIGO5LHNUuCJE6btrAga0AyWK
 Ff8ULgZiDRnV39I2hUlFDmOa8qxrHFJ8rVFNqdn4RGEeolN5EjwpSbbJSvQn+W/Yu4n1
 j3UfEfjmQbJrVg562qwy/l0ov5FGFXcRC3D4wJCNgn76zgoc/2ePVTDhapWyX4tqqMAy
 MFCFFFln8sPijvSY7noESgdjGJNyVQJrrcRcfK7ABGULVyVVxeQqcAXb8Q86keCL5ErN
 SkWfBqrs+TjaPW9eVkIOCxuPzdtI9rCSIceTO4/2tI0dJ/hySVWkz3hlxhmP000wJadG
 IglQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=Jmuf5ljJDQYQlumUw5CE4lMT7WuPAzl9vVKIeyphu/Q=;
 b=NMlpV4nrTOMF7XgCb7UBBSgmQxKoIMY9vPT+TDWc4AYOORyUPIrYbUq8PLoTJxWCnf
 TBAjfqhCQQ2qXCyyfNsM5QuOZYJTzuMWFht6vef4VT7Q/2QkqkoM18/VWopg+7XeA32x
 sCcdHFoczx9P6lYqku/U7RapjPGcW+w7fPQi+FkZpFiJfzFQlt6zPljk5pzb4m+GWyos
 0pYqwpsRRdg9yt3WJT+uPTVpJS8mE2QGYrB8JhU0YC8nr6BontkPP+g2Ba994cZvhkf5
 UlQ3QgXbx1FqIilzI3B+I/zTUKDFjJ3MZY+Zq6VDiYGG67QF8FeWoSksAEFuCqGccHm6
 8wFg==
X-Gm-Message-State: AGi0PubUv0073F5xxbXeLr2ZQnrgLXvYTdu+1HRZ3jiGGVYPwyKFk2xD
 LSerK/FUsPCzMbsX7nk8UcA=
X-Google-Smtp-Source: APiQypIWgAuJlpzTd7frVJeC8OfRdbf5Qx0nhzJhmfIbqCvJwjb7wZkVSJLAZq5w+foJkNOJYG9YtQ==
X-Received: by 2002:a37:a5d7:: with SMTP id o206mr11623774qke.90.1586888234033; 
 Tue, 14 Apr 2020 11:17:14 -0700 (PDT)
Received: from localhost ([199.96.181.106])
 by smtp.gmail.com with ESMTPSA id m1sm11805229qtm.22.2020.04.14.11.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 11:17:13 -0700 (PDT)
Date: Tue, 14 Apr 2020 14:17:11 -0400
From: Tejun Heo <tj@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 1/9] drm/vblank: Add vblank works
Message-ID: <20200414181711.GO60335@mtj.duckdns.org>
References: <20200318004159.235623-1-lyude@redhat.com>
 <20200318004159.235623-2-lyude@redhat.com>
 <20200318134657.GV2363188@phenom.ffwll.local>
 <e4fb0c39ec024d60587e5e1e70b171b99eb537f4.camel@redhat.com>
 <faf63d8a9ed23c16af69762f59d0dca6b2bf085f.camel@redhat.com>
 <96cb912809f99d04cd5cdd46c77b66b8c1163380.camel@redhat.com>
 <20200413204243.GL60335@mtj.duckdns.org>
 <a2d9da054ace3f0ff59373c5a6252f25e1c3df4b.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a2d9da054ace3f0ff59373c5a6252f25e1c3df4b.camel@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Tue, Apr 14, 2020 at 12:52:51PM -0400, Lyude Paul wrote:
> Hi, thanks for the response! And yes-I think this would actually be perfect
> for what we need, I guess one question I might as well ask since I've got you
> here: would patches to expose an unlocked version of kthread_queue_worker() be
> accepted? With something like that I should be able to just reuse the
> delayed_work_list and spinlocks that come with kthread_worker which would make
> the vblank works implementation a bit easier

Difficult to tell w/o looking at the code but if technically reasonable and
justified, I don't see a reason why something like that couldn't be accepted.
That said, whatever gain coming from sharing an inner lock like that usually
is miniscule and API and logic simplicity often easily outweighs.

Thanks.

-- 
tejun
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
