Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A77B9D53D4
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 21:18:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 293CA10E0D0;
	Thu, 21 Nov 2024 20:18:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="iLaeKGBd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E8F10E0D0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 20:18:04 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-382442b7d9aso1142635f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 12:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1732220283; x=1732825083; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K2mZwNr3eW1Z9Vp+PcgzzHwsSK7NqM3DGZ9Ok0Kn/lA=;
 b=iLaeKGBdi5tvvdminFRsy3B4v9DhkrYZpDromup2AhrrEl+tqRSD0qtvwOBTUNwdzW
 osEJcT7oTWAPNV3JFJj2RmqqJvNPehzyRKEYNEu9eNUp61P656lHeNexJkNBQqIOw2OM
 P0FYf+2a1rRTT6I//8IicjXodx1niYbBgDop8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732220283; x=1732825083;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K2mZwNr3eW1Z9Vp+PcgzzHwsSK7NqM3DGZ9Ok0Kn/lA=;
 b=DZrtsy4q/Mljpt2C2X1wDvjvAecuQqot/b7YXIXuSP3w1QkVw2cPEKY3h9Kf4UAAG4
 q1UrzyNrv81O9TaCJYRnymA82HkF1im89+RVh5D4xZ2P2mGpu0SMGjLCyV1MkmRiZ6bD
 C+bGJd6a8KzAa97PBG7y94TBTsRVcWPsA9CNqWZkF1v2wXQE1Icw6YVS9LABJLxMCjS5
 PUYIBWPNw8qs5ZxNW1k5ZCWKLfyNf5lFAFAK0usHiABD61LolOOIywV6BGcaHBWkHpx7
 ny0lkkaZJyuQztzIPE5J9U0Go+Io6zyr1QOCeY02tt0dwbTRQYuT88DXHExuI2i57Wbn
 xW/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1exivnKgcLS+G81uf23U4p9RFljN+ld6UGk7qQdszkJ6FTs86iwrwZeJ1h4mWAbxXX08p+wsaW8g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlwBrlMKqdgM2/FDOWUo127GUbQsapaZ4al3ijnpX/Ri8V4jMw
 jp4VmTD/VKXoWpeMfcKE8OGesc3Y8JFE3yL3iCe32KxXvsZOvRoyX4mGmi28aQE=
X-Gm-Gg: ASbGncsq5IxycLNEeRNGoEyix/m5ejJTQZF2rzIPgN8PZwkPpLT9rgiocqqCTHhOeg0
 QOrDi1lcuLl35PVpWbLvjV+HlIEKD3agLq5s/lr2s1JoPnlupeZE7xw9qKYDkek9tDYyGGfG9Mb
 TIoQrcrDLdE8BI+nqtyt8sYzp8Mm1G12pVLhA1MBZRvGZECCqUIFpDhtZoJBCt+dHIhQIdLlM4L
 mo+d6lkYUki9ry+19JRctekSPvT6XalWXI/WpK/8OuyfJFZJSm0DpZZV5xPSg==
X-Google-Smtp-Source: AGHT+IFIAEZgwOdLKe2aLVeTOHcS+P2fVWqmTMpDKu9ZFOYWSBuKw3u5Or2kbjFemduSGbeJqRdGPA==
X-Received: by 2002:adf:e18c:0:b0:382:5aae:87ac with SMTP id
 ffacd0b85a97d-38260b8966dmr360789f8f.32.1732220282992; 
 Thu, 21 Nov 2024 12:18:02 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fb271ffsm455908f8f.53.2024.11.21.12.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 12:18:02 -0800 (PST)
Date: Thu, 21 Nov 2024 21:17:59 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Michal Hocko <mhocko@suse.com>,
 Dave Chinner <david@fromorbit.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, Yafang Shao <laoar.shao@gmail.com>,
 jack@suse.cz, Christian Brauner <brauner@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-bcachefs@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
 "conduct@kernel.org" <conduct@kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH 1/2 v2] bcachefs: do not use PF_MEMALLOC_NORECLAIM
Message-ID: <Zz-VdwLPBUV9d_Sj@phenom.ffwll.local>
Mail-Followup-To: Kent Overstreet <kent.overstreet@linux.dev>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Michal Hocko <mhocko@suse.com>, Dave Chinner <david@fromorbit.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, Yafang Shao <laoar.shao@gmail.com>,
 jack@suse.cz, Christian Brauner <brauner@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-bcachefs@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
 "conduct@kernel.org" <conduct@kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@gmail.com>
References: <v664cj6evwv7zu3b77gf2lx6dv5sp4qp2rm7jjysddi2wc2uzl@qvnj4kmc6xhq>
 <ZtWH3SkiIEed4NDc@tiehlicka>
 <citv2v6f33hoidq75xd2spaqxf7nl5wbmmzma4wgmrwpoqidhj@k453tmq7vdrk>
 <22a3da3d-6bca-48c6-a36f-382feb999374@linuxfoundation.org>
 <vvulqfvftctokjzy3ookgmx2ja73uuekvby3xcc2quvptudw7e@7qj4gyaw2zfo>
 <71b51954-15ba-4e73-baea-584463d43a5c@linuxfoundation.org>
 <cl6nyxgqccx7xfmrohy56h3k5gnvtdin5azgscrsclkp6c3ko7@hg6wt2zdqkd3>
 <9efc2edf-c6d6-494d-b1bf-64883298150a@linuxfoundation.org>
 <be7f4c32-413e-4154-abe3-8b87047b5faa@linuxfoundation.org>
 <nu6cezr5ilc6vm65l33hrsz5tyjg5yu6n22tteqvx6fewjxqgq@biklf3aqlook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nu6cezr5ilc6vm65l33hrsz5tyjg5yu6n22tteqvx6fewjxqgq@biklf3aqlook>
X-Operating-System: Linux phenom 6.11.6-amd64 
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

On Wed, Nov 20, 2024 at 05:39:09PM -0500, Kent Overstreet wrote:
> There were concerns raised in the recent CoC enforcement thread, by
> someone with experience in such matters, that your aproach seemed
> extremeely heavy handed and I find myself in 100% agreement.

Ehrm ...

Yes, I did quite strongly criticize the new coc enforcement process.

No, you would not appreciate what I'd do instead, not at all.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
