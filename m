Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 774226BE46D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 09:55:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D4310EE9B;
	Fri, 17 Mar 2023 08:55:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F65C10EE9B
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 08:55:44 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id o7so3731973wrg.5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 01:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679043342;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G1C76uQE+orN6Rf2jjq6LxN5cEcC5Z5eik4S/6fjVTc=;
 b=ZiBLtbnDf4U5eWwS+urenPYyjTuE9kr3wZUQu3I5scE796SiC2EYbKcZQIDyqfUBdP
 fz2S3CG7mDal+7AknwW/Z/2bBzBl27KeAaZ650zhN6sGjLnTsWdjH7tK4XP60lidUEvV
 qsvY0S1UcM7bmaz3GJ//dlRIwXoyCllLSqA8d3dDZzs0Dv8IiECQck03cqTA+MJk9Kkx
 lgDdj97hQRtaWZLd3UpmLgVZr/ij03m1mBfaGu+bNF+4sjru7ye+skW+t0SIEQPNZ3XZ
 pILOtEOz6rPscVRYnTLo4zEwYmZWZag92KnlSnOs+uOcp74G72VZwsD/bt30BdjbxkQe
 vijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679043342;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G1C76uQE+orN6Rf2jjq6LxN5cEcC5Z5eik4S/6fjVTc=;
 b=3sDAT7Bj0RE7IJIAf27mArMzvBAF21cgwMCNL8zzFVllg0NytV/PrLfPCY7CGPWMU6
 F4FyOr7WPTB9IAoxGWt4tJQIXFq6hK2oefTAwjjZ/Vn3Fxqq5I5sui7LAXf3JUwKKS/O
 4BvuXrnH34Eko6YToaHfA74MPus1+D5hoBBEivmNmXJ4xXxMru8K8PSgASVvrMQs+9yE
 l5SxxhloreFSZoEMJRJrJApMpNznP72vFeuzAvBd0Fh0CsY0t9Ox6Hcn5OeFDChnE78W
 Y2VACWzzA+MYEQMwadVogvoAOZPbtztG3eKm3CTtcytBZFN6tEVzJT8EaTWUAUI//z1r
 TI6w==
X-Gm-Message-State: AO0yUKXIOp+TohBeR7A5wlj3OxzCzEOj4t3emLvk66eZS1LP/o8AucvF
 1fePq+5X171Ol8u358jFqzlFOaHs2z0=
X-Google-Smtp-Source: AK7set9EqDENXkx2qAyNhY1SL/8nCYQBK64BUwQ6KHforNuVmeI6OD4veuu1MF9zGIvg5wRlxz+gyA==
X-Received: by 2002:a05:6000:114c:b0:2ce:ae4b:6971 with SMTP id
 d12-20020a056000114c00b002ceae4b6971mr6791904wrx.57.1679043342474; 
 Fri, 17 Mar 2023 01:55:42 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:c96e:7685:7eda:d7f7?
 ([2a02:908:1256:79a0:c96e:7685:7eda:d7f7])
 by smtp.gmail.com with ESMTPSA id
 j10-20020adff00a000000b002d1bfe3269esm1435426wro.59.2023.03.17.01.55.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 01:55:41 -0700 (PDT)
Message-ID: <b3bc9fa2-59c3-d951-53b2-b13425390816@gmail.com>
Date: Fri, 17 Mar 2023 09:55:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/ttm: drop extra ttm_bo_put in ttm_bo_cleanup_refs
Content-Language: en-US
To: Dave Airlie <airlied@gmail.com>,
 Matthew Auld <matthew.william.auld@gmail.com>
References: <20230316072647.406707-1-christian.koenig@amd.com>
 <CAM0jSHPRVgCkWPqzPOs4-4QMDCefp7y5jcTpZDgvXUpEa_a-fQ@mail.gmail.com>
 <CAPM=9twu6F1nHwL_PgTbcZpY6WzStVCqkE1Htst6OF5Q=JiFzg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAPM=9twu6F1nHwL_PgTbcZpY6WzStVCqkE1Htst6OF5Q=JiFzg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Am 17.03.23 um 06:44 schrieb Dave Airlie:
> On Thu, 16 Mar 2023 at 19:27, Matthew Auld
> <matthew.william.auld@gmail.com> wrote:
>> On Thu, 16 Mar 2023 at 07:26, Christian König
>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>> That was accidentially left over when we switched to the delayed delete
>>> worker.
>>>
>>> Suggested-by: Matthew Auld <matthew.william.auld@gmail.com>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> Fixes: ("9bff18d13473") drm/ttm: use per BO cleanup workers
>>> Reported-by: Steven Rostedt (Google) <rostedt@goodmis.org>
>>> Tested-by: Steven Rostedt (Google) <rostedt@goodmis.org>
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> I'm taking this directly into drm-fixes, please don't apply it to
> drm-misc-fixes at all.

Ack and sorry for the noise.

Christian.

>
> Dave.

