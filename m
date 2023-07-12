Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B8174FDCC
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 05:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BFC610E487;
	Wed, 12 Jul 2023 03:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3632E10E487;
 Wed, 12 Jul 2023 03:32:15 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id
 af79cd13be357-7653bd3ff2fso711840485a.3; 
 Tue, 11 Jul 2023 20:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689132734; x=1691724734;
 h=content-transfer-encoding:in-reply-to:from:content-language:subject
 :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jvf0nF5ZRGZZqWs6AfvhMZd8lPGLYxeXrzMNbCUatcI=;
 b=SxWs7+NhmtFmcBIYeyB0DJkbyihTJ/eJTVplhF1PBnu+7xoaTjCtrLQrHuwdLeFQ78
 I3V+0ZV93yvXSyymfW23KSm49bdG2+cDQerjn3yUo7EY7/0mneaPnyICynnwfA41jpPA
 naFsV9h5672637AMbpuI5rKyDIB3JNrSXE1gmfIjsGRnHmGmIJya6kl1cK7Au5vlJ+o0
 qZ4wu7MQKjX1Qw9kEVfq2Uud8SykO3pPpDbkvH9aneGl/oxs8a+Tgu/ldl1ny5gWRfIK
 X1leUhBEIbA2PIMJjep3EInbKA1GWE9b1EsAy8+gD8hJkhSi7o6o9657r4Mm0u2QiaZh
 LL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689132734; x=1691724734;
 h=content-transfer-encoding:in-reply-to:from:content-language:subject
 :references:cc:to:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jvf0nF5ZRGZZqWs6AfvhMZd8lPGLYxeXrzMNbCUatcI=;
 b=NAsQMsbOZKDyjx+k3vYhQCCLbeEN97ayEL74AZTwWOZPpJVyKl6eMIRi0fjnk+wOtk
 lDbt4aJv1IjlQ1N4LnGQ8TfLXsitYbGmo/fSRZOHURYf8D9G4OsGFgsZqb0g6z+PVZiq
 Bszdkq/iwvnxB88Y7DiWMuZ1C7fKTPOMrrxv5vFJMn3RCEqBGtYukWz+18/vdo7nNuKY
 2LgH/N3uL8P6RCp8ZERXUGBiulNN0guaywzD60KkV7TpAIOceB5Rj7aJu/ZCMBXSmvT1
 XCWGCC735P3tfiGRMvb5X3dwHVswIn54LSnnZloxOGFr1Ua64vRniLHQvhCq82SurV88
 3OJg==
X-Gm-Message-State: ABy/qLbnhOSxiPZlpv/GrOKbENCdrDE/Yh9fkE9C3NdLUPXQ3Spzhz71
 3f39sKkhugnoZzGEW1P/yac=
X-Google-Smtp-Source: APBJJlEi9cxhyg3FYQSwltq1b2CBfAz1F+0jG2fDBkJz+XscIpuisGIVjUha+zJXqw5Cv3MbLPDerw==
X-Received: by 2002:ac8:5cc8:0:b0:403:a770:e15a with SMTP id
 s8-20020ac85cc8000000b00403a770e15amr17034785qta.56.1689132733918; 
 Tue, 11 Jul 2023 20:32:13 -0700 (PDT)
Received: from [192.168.11.9] (KD106167171201.ppp-bb.dion.ne.jp.
 [106.167.171.201]) by smtp.gmail.com with ESMTPSA id
 d7-20020aa78147000000b0067ea048cf83sm2419276pfn.186.2023.07.11.20.32.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jul 2023 20:32:13 -0700 (PDT)
Message-ID: <0475d177-4c01-0988-0b34-3099dd703498@gmail.com>
Date: Wed, 12 Jul 2023 12:32:10 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: rdunlap@infradead.org
References: <b5ebc891-ee63-1638-0377-7b512d34b823@infradead.org>
Subject: Re: scripts/kernel-doc does not handle duplicate struct & function
 names (e.g., in amdgpu)
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <b5ebc891-ee63-1638-0377-7b512d34b823@infradead.org>
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
Cc: corbet@lwn.net, linux-doc@vger.kernel.org,
 Akira Yokosawa <akiyks@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Randy,

> [just documenting this for posterity or in case someone wants to fix it.]
> 
> In drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c, one can find both
> 
> struct amdgpu_vm_tlb_seq_cb {...};
> 
> and
> static void amdgpu_vm_tlb_seq_cb(...)
> 
> Of course C has no problem with this, but kernel-doc reports:
> 
> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:833: WARNING: Duplicate C declaration, also defined at gpu/amdgpu/driver-core:115.
> 
> And of course, if the name of one of them is changed, kernel-doc is all happy...
> not that I am suggesting that one of them should be changed.
> 
> I just want to make people aware of this. (or maybe people are already aware of this?)

The duplicate warning is emitted from Sphinx, not kernel-doc.

This is a bug of Sphinx >=3.1, first reported by Mauro back in September 2020 at:

    https://github.com/sphinx-doc/sphinx/issues/8241

It was closed when a local fix was presented.  Unfortunately, it was not
merged at the time and a subsequent pull request was opened at:

    https://github.com/sphinx-doc/sphinx/pull/8313

It is not merged yet and carries a milestone of Sphinx 7.x.

Looks like we need to wait patiently.

        Thanks, Akira

> 
> -- 
> ~Randy

