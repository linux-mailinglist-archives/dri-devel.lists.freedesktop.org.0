Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6465191963
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 19:46:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B886E50B;
	Tue, 24 Mar 2020 18:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79AC589704;
 Tue, 24 Mar 2020 18:46:36 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id h14so20428232qke.5;
 Tue, 24 Mar 2020 11:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AGxmNy0595sT346CYB2mgtexQzuM2HSrDde9cVbZJuU=;
 b=M3QHtiDCjMkqKxWvyPl5FUJxxKx7+N4EaFCnKutVLtNtajUcahJKaZa0ow/Iz8n8vF
 +cTaGUSAx07luD6LuXpFlfEyxpVpWMxDTX6hfLOgkEyqWH71CUYPYpwYunw3m6+byoEx
 cqbsc7zfXkij/jLcSsAEnxMTyFJjLdeavZ1Vu5ZDBOCL+eZt1qHzjhNGrsKYVzKVUObo
 38MQ0gVgqyJ+wkY2WkU09z+gDjseha8Lgmr3Dty97if7NGwSTgddMDnEHu1RZkix40Ar
 GrX/0NCKWzRn+Dyf06srWhJwYIjlEymtoDhdE1UJmOXKCEqW3hgArIGXUehAAFjZC8Tk
 Mw+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=AGxmNy0595sT346CYB2mgtexQzuM2HSrDde9cVbZJuU=;
 b=O3MPCR1SXaIQ3wLti/GdBUgpni4OsRXn4hx7Mb44WRHQEhtzPH4Lsxr+lbYmAdOOVS
 R1K/jBxJ7ZSDxozNUae0IF4xvNNXrVfYcmC7GoCUpCakew8hvhCZoJLfaiMUKzu+XJK1
 kKdzrERzgqrcVpAVR8E0cUvIcO/081GYbCuHXqroOSXTKmhzu68Z+pS2TqlbU3dpdGt1
 5AVfSWba9sqP9Y3L1JWGJk9gDvciYUHq+k33hq6r1ux2+xe7cgDumu7hTowwRIEXi6MA
 QHciLp0rdc5k5c665uTwZUGb02jWjHIEC9Hnn2myu0PxWD6VxDHWdsMEE8bQGqvpkEQF
 YvNA==
X-Gm-Message-State: ANhLgQ1oQe9YkhCemoyNXMnckpuPfj6BxXJzKcySYLgE1tNQJJBaTal+
 Cf3UoSehZ9t2fTmiYxNI3wk=
X-Google-Smtp-Source: ADFU+vuG6EX8tZxW4p8BDfczrKaQLJMVhUXpXjJG5GIXYcXSAN+m6g533OhQ2NhTef+FX2Bno+4vPg==
X-Received: by 2002:a37:715:: with SMTP id 21mr28007993qkh.435.1585075595497; 
 Tue, 24 Mar 2020 11:46:35 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::19c2])
 by smtp.gmail.com with ESMTPSA id j39sm8143061qtk.96.2020.03.24.11.46.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 11:46:34 -0700 (PDT)
Date: Tue, 24 Mar 2020 14:46:33 -0400
From: Tejun Heo <tj@kernel.org>
To: Kenny Ho <y2kenny@gmail.com>
Subject: Re: [PATCH v2 00/11] new cgroup controller for gpu/drm subsystem
Message-ID: <20200324184633.GH162390@mtj.duckdns.org>
References: <20200226190152.16131-1-Kenny.Ho@amd.com>
 <CAOWid-eyMGZfOyfEQikwCmPnKxx6MnTm17pBvPeNpgKWi0xN-w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOWid-eyMGZfOyfEQikwCmPnKxx6MnTm17pBvPeNpgKWi0xN-w@mail.gmail.com>
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
Cc: Kenny Ho <Kenny.Ho@amd.com>, "Kuehling, Felix" <felix.kuehling@amd.com>,
 jsparks@cray.com, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Greathouse,
 Joseph" <joseph.greathouse@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 cgroups@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 17, 2020 at 12:03:20PM -0400, Kenny Ho wrote:
> What's your thoughts on this latest series?

My overall impression is that the feedbacks aren't being incorporated throughly
/ sufficiently.

Thanks.

-- 
tejun
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
