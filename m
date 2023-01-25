Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D71367AF4C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 11:07:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 978AB10E774;
	Wed, 25 Jan 2023 10:07:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D9910E770;
 Wed, 25 Jan 2023 10:07:34 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id w11so5898093edv.0;
 Wed, 25 Jan 2023 02:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yyGxyASWXYmKUyQXtGpG1/nPyBCv90mJ64zSV4dNGSo=;
 b=mDnH7HntiVKG43aE5iZuScsYhWYd7JPF9gUF9Rk6hmWgKOXEYxk7VEuWmm/yTASTnA
 I9zmYws+sUBhSSbbd9A53Zh753rBnllhTf+HmLzllXDFrBG2yzOBeVdQnoIMWAPb71kg
 BgVVizZCA+uI+lml0wQgSSUCQ4DdjClfJSPcPV4b6jXeJy78S0uD81+aDTtosBHYUPw7
 18BGL6GQrI0j4+H6nR3aILN7JPPp1lGDBZDelcK+kqg+NxkzalDtjyejDRLL9BSEYcwC
 Rwc8nGLVTw2VQ4SPA/noiYj+AjSJe88wWbehsVTjDp95U0s7F39dFxuwHG4kM/El0wEN
 Dhag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yyGxyASWXYmKUyQXtGpG1/nPyBCv90mJ64zSV4dNGSo=;
 b=IO4zNnn9om0jrKPE/GVrWPAqVLZXrtGXaxjl3C5xAs/kWy9LTTZ+xDEglilKWd7Bnq
 J0lIsAUpXBD65D92zuf/eLO+FvBJ9WNc3ZBJ1rYKuKdNBXgrP1obXWVmUJ6u//s1rrNo
 PClHQWg2zoxZSvVGw9gDX6LL8BztwAtBsS0WSjIhqsdWQ3F83773QUvO7gvLCyogJgFk
 Lr6EIcNRukXvY3HEhNt95A/EK9CQXPVKAMLiPTRPFfEW3hH4O+lbNm1WPjT9tMRWNCfh
 Svkk2MCvkhxg2xzKtEtP4SgFY/Erhkb/oWZunPAkVmoX+fR9PeFEvzllYR44PZh1v9AR
 UxEg==
X-Gm-Message-State: AFqh2kpi3Ujl7d8wdvv6VUfIwszxFbogoQfekB9jFN8HOmBl8l7T3OM7
 dONXyCzQtT8wFRPXlKj7twA=
X-Google-Smtp-Source: AMrXdXtnaAVrrphXGLLiHgeLh7/O0hbUkbgKBRV0qng+CMvdM6oGvs6PDUFmis5lcQCu8rLNBeYkng==
X-Received: by 2002:aa7:de8f:0:b0:498:e0be:318b with SMTP id
 j15-20020aa7de8f000000b00498e0be318bmr33716800edv.38.1674641253218; 
 Wed, 25 Jan 2023 02:07:33 -0800 (PST)
Received: from ?IPV6:2a02:908:1256:79a0:180c:8737:8e57:6be7?
 ([2a02:908:1256:79a0:180c:8737:8e57:6be7])
 by smtp.gmail.com with ESMTPSA id
 by16-20020a0564021b1000b0049e376abe96sm2124389edb.67.2023.01.25.02.07.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 02:07:32 -0800 (PST)
Message-ID: <418a6bca-7a61-86d8-7f6a-229d1e12c0fd@gmail.com>
Date: Wed, 25 Jan 2023 11:07:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Intel-gfx] [PATCH 1/5] drm/i915: audit bo->resource usage v3
Content-Language: en-US
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20230124125726.13323-1-christian.koenig@amd.com>
 <CAM0jSHNmv-naGqB=R8DZc-3QhTPzzo4pUU2-NxhtiEhXMcAN5A@mail.gmail.com>
 <CAM0jSHMgep0q9=C=fHw+Y8SqpNeN3Gz47u_UvwgJuGG3_0qgBQ@mail.gmail.com>
 <CAM0jSHNKkAS1+dYJdHk23+Uyoz02G1VPFLpKLxX2HqRe7L2HCA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAM0jSHNKkAS1+dYJdHk23+Uyoz02G1VPFLpKLxX2HqRe7L2HCA@mail.gmail.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 25.01.23 um 10:56 schrieb Matthew Auld:
> On Tue, 24 Jan 2023 at 17:15, Matthew Auld
> <matthew.william.auld@gmail.com> wrote:
>> On Tue, 24 Jan 2023 at 13:48, Matthew Auld
>> <matthew.william.auld@gmail.com> wrote:
>>> On Tue, 24 Jan 2023 at 12:57, Christian König
>>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>> From: Christian König <ckoenig.leichtzumerken@gmail.com>
>>>>
>>>> Make sure we can at least move and alloc TT objects without backing store.
>>>>
>>>> v2: clear the tt object even when no resource is allocated.
>>>> v3: add Matthews changes for i915 as well.
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>> Ofc that assumes intel-gfx CI is now happy with the series.
> There are still some nasty failures it seems (in the extended test
> list). But it looks like the series is already merged. Can we quickly
> revert and try again?

Ah, crap. I thought everything would be fine after the CI gave it's go.

Which patch is causing the fallout?

Christian.
