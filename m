Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E3B15F88B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 22:15:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632466E87A;
	Fri, 14 Feb 2020 21:15:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E7C6E878;
 Fri, 14 Feb 2020 21:15:31 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id c188so10609795qkg.4;
 Fri, 14 Feb 2020 13:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=oZCVTJqDOaYO0qLkkhU/b4V9LR30/p6GYzU8hBz9PHo=;
 b=fFy3EPOllhkeZuzDwhQeqY7WkzV5jBRVVniJ7hseWZc2SSWEnQ9ce7rP0M2cQrtBfW
 7hjXGLyLSXhHOn7Wn+bbVWsEqqTZXjwGqwLKmERklVLh+nVry9j8yIENTvW6e8r4nLyB
 9+1r3RfKg8wimtCMuqW6k29EPOP8HHgvs89vRtxhFp3zep4Zkk4/9YolWCEC3bn9RGho
 HpB2Vbx1/sAk8/99Vg8kA9lMEMqsw7ZFsczNvCPnDn09+DCLogmOtCPSh0PAJbq4xZfO
 UxpTTCCq/EU7xB/PwUDxql5HhYbniZ8ZFh0GUFh+BY+u/OR21TGFiOJr2voMSp/WIyOB
 Edrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=oZCVTJqDOaYO0qLkkhU/b4V9LR30/p6GYzU8hBz9PHo=;
 b=QImBXroqFy9ZSCCQmfrlz1pWxYAQ7Oj36LBm1yUt32eQvNMCeegZSomqPkuYykWpq/
 II3aUUJ7VOyi2Y/8RkKDshjodbdCtLloTL9JooGpPEUSb5zB+ZsXNgpu2P6q/qI/6/Lo
 5v2Q7zF5gkRidu7CgAOCctw+ORUUs2c2t9z6/qu+Txn3+JEKGNh++b+NhDn3bB2y1qqt
 7SmPg0z0jbLjOy6RhNp8hDt0RNvE0JWKeCord8g68pgVxuzoWaKbr6Z2vcd/5SuHe91k
 SlwzPElyeqM1CaMX1go/otCtIWPsK0FnVPH1vDArhXhS3TiqzrPAfvSuFs21Nt0JZ11a
 SxKw==
X-Gm-Message-State: APjAAAVKITrwnvGq6fuljoRiqtbQlbBMWba5DCE5jSP0+iawhcRbr46t
 dnDmQTgcICfvAS1/io0bZIg=
X-Google-Smtp-Source: APXvYqziQyHs3bVmpBXrquJ+5i9yGG3Fr9rPm43Z6JuOcRifUzLwShtrXg9OOOmQtz99j0+IIjn5tw==
X-Received: by 2002:a37:4dc6:: with SMTP id a189mr4458143qkb.122.1581714930189; 
 Fri, 14 Feb 2020 13:15:30 -0800 (PST)
Received: from localhost ([2620:10d:c091:480::9655])
 by smtp.gmail.com with ESMTPSA id h6sm3907303qtr.33.2020.02.14.13.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 13:15:29 -0800 (PST)
Date: Fri, 14 Feb 2020 16:15:28 -0500
From: Tejun Heo <tj@kernel.org>
To: Kenny Ho <y2kenny@gmail.com>
Subject: Re: [PATCH 09/11] drm, cgroup: Introduce lgpu as DRM cgroup resource
Message-ID: <20200214211528.GB218629@mtj.thefacebook.com>
References: <20200214155650.21203-1-Kenny.Ho@amd.com>
 <20200214155650.21203-10-Kenny.Ho@amd.com>
 <CAOFGe96N5gG+08rQCRC+diHKDAfxPFYEnVxDS8_udvjcBYgsPg@mail.gmail.com>
 <CAOWid-f62Uv=GZXX2V2BsQGM5A1JJG_qmyrOwd=KwZBx_sr-bg@mail.gmail.com>
 <20200214183401.GY2363188@phenom.ffwll.local>
 <CAOWid-caJHeXUnQv3MOi=9U+vdBLfewN+CrA-7jRrz0VXqatbQ@mail.gmail.com>
 <20200214191754.GA218629@mtj.thefacebook.com>
 <CAOWid-dA2Ad-FTZDDLOs4pperYbsru9cknSuXo_2ajpPbQH0Xg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOWid-dA2Ad-FTZDDLOs4pperYbsru9cknSuXo_2ajpPbQH0Xg@mail.gmail.com>
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
Cc: juan.zuniga-anaya@amd.com, Kenny Ho <Kenny.Ho@amd.com>, "Kuehling,
 Felix" <felix.kuehling@amd.com>, jsparks@cray.com, nirmoy.das@amd.com,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 lkaplan@cray.com, "Greathouse, Joseph" <joseph.greathouse@amd.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>, Johannes Weiner <hannes@cmpxchg.org>,
 Alex Deucher <alexander.deucher@amd.com>, cgroups@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 damon.mcdougall@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 14, 2020 at 03:28:40PM -0500, Kenny Ho wrote:
> Can you elaborate, per your understanding, how the lgpu weight
> attribute differ from the io.weight you suggested?  Is it merely a

Oh, it's the non-weight part which is problematic.

> formatting/naming issue or is it the implementation details that you
> find troubling?  From my perspective, the weight attribute implements
> as you suggested back in RFCv4 (proportional control on top of a unit
> - either physical or time unit.)
> 
> Perhaps more explicit questions would help me understand what you
> mean. If I remove the 'list' and 'count' attributes leaving just
> weight, is that satisfactory?  Are you saying the idea of affinity or

At least from interface pov, yes, although I think it should be clear
what the weight controls.

> named-resource is banned from cgroup entirely (even though it exists
> in the form of cpuset already and users are interested in having such
> options [i.e. userspace OpenCL] when needed?)
> 
> To be clear, I am not saying no proportional control.  I am saying
> give the user the options, which is what has been implemented.

We can get there if we *really* have to but not from the get-go but
I'd rather avoid affinities if at all possible.

Thanks.

-- 
tejun
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
