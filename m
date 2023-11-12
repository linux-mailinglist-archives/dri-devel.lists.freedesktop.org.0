Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 058927E92B8
	for <lists+dri-devel@lfdr.de>; Sun, 12 Nov 2023 21:38:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2EB810E0E3;
	Sun, 12 Nov 2023 20:38:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7805A10E0E3;
 Sun, 12 Nov 2023 20:38:19 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id
 af79cd13be357-778711ee748so251715185a.2; 
 Sun, 12 Nov 2023 12:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699821498; x=1700426298; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=6YztxOL1r/fnKaUwBDzI6/qa/Ai7h1WY5G4jeElcAzw=;
 b=PJvKgjuiItigPtyr84syIf07yqFht2byq29yMEtCVtyyhJbYD5AyUPKxojb96XAdrx
 N/SCOQ48uOy3VEf+G5A3a4/R0//dFdBJxKwe0Cu4sZwWcqfsy53WTU3OZy4wqkqsYa/b
 ILToig3+o0v7deerLQVlHCrm/AkShngPi5/Ls8Hzzbr+sF5ucktrP/d2+8A0NiZb/oPk
 4LuyWUBvlI9JzVvxSynnWGW8uP6v9q3gD4YzZQ2Da9gqL1OAM+aa0PzUyytXUsZrH9T5
 aQrLCt2OXhQomgwPRZXMBEWGvzTD4EpQQLgzSrF1ArC6iobvw1K8BlW46Sa8XxFuHynK
 zYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699821498; x=1700426298;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6YztxOL1r/fnKaUwBDzI6/qa/Ai7h1WY5G4jeElcAzw=;
 b=CGQcqE3jANW0Qyo44VWJz1hxXxrfeqAPlOiOK/k3J5N0Iw2/rUB319JQGLJDJYMHDR
 +sKkoM6QhttnDPoC5+TC0hEQ+tafQVJenqBKTqsxO2lkmafr0K8oguSb6R3d5S8dBQ18
 ufFjuam8t1jCyVWPVYtCw1ZYkPxpiqO16bZKcWt/PsXydUoGFkH9v7DIuR0/tw/JoWSz
 /asnqgGbKQRApSqiOjClHhjIx2VYZu17fVABqirexiSa5FnWAA2gIm9fi+YBJ7xXUzJx
 dYVfbg2OQECv0/tN5BD61AeamHzUYCqGbxHC6RlWbtNNzpJtH+XFSjy4DxAcTCVDjBFO
 zB3Q==
X-Gm-Message-State: AOJu0YydxZI+OppuNDfkKBYv+w9h71UerX2lJcMATi/6WNevxrs78QJw
 gAWzhVLkeVorz52ZRYqoE7Q=
X-Google-Smtp-Source: AGHT+IGs5uzQNsy8dAyelpniyvgTA/dFx1GFzoBnbdFUnNl8n2tb7aZwz5JLw71uKRant/cErWKjZw==
X-Received: by 2002:a0c:c58d:0:b0:66d:4a22:d7cd with SMTP id
 a13-20020a0cc58d000000b0066d4a22d7cdmr5381678qvj.60.1699821498368; 
 Sun, 12 Nov 2023 12:38:18 -0800 (PST)
Received: from localhost ([164.86.0.75]) by smtp.gmail.com with ESMTPSA id
 bo9-20020a05621414a900b0065b02eaeee7sm1491349qvb.83.2023.11.12.12.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Nov 2023 12:38:18 -0800 (PST)
Date: Sun, 12 Nov 2023 14:38:10 -0600
From: Tejun Heo <tj@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [RFC v6 0/8] DRM scheduling cgroup controller
Message-ID: <ZVE3shwiRbUQyAqs@mtj.duckdns.org>
References: <20231024160727.282960-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231024160727.282960-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Kenny.Ho@amd.com,
 Dave Airlie <airlied@redhat.com>,
 =?iso-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Intel-gfx@lists.freedesktop.org,
 Brian Welty <brian.welty@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Zefan Li <lizefan.x@bytedance.com>,
 Johannes Weiner <hannes@cmpxchg.org>, cgroups@vger.kernel.org,
 "T . J . Mercier" <tjmercier@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

From cgroup POV, it generally looks fine to me. As before, I'm really
curious whether this is something other non-intel drivers can get behind.
Just one nit.

On Tue, Oct 24, 2023 at 05:07:19PM +0100, Tvrtko Ursulin wrote:
>  * Allowing per DRM card configuration and queries is deliberatly left out but
>    it is compatible in principle with the current proposal.
> 
>    Where today we have, for drm.weight:
> 
>    100
> 
>    We can later extend with:
> 
>    100
>    card0 80
>    card1 20
>
>    Similarly for drm.stat:
> 
>    usage_usec 1000
>    card0.usage_usec 500
>    card1.usage_usec 500

These dont't match what blkcg is doing. Please use nested keyed format
instead.

Thanks.

-- 
tejun
