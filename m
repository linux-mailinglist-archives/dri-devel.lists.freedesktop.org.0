Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7198288B93D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 05:05:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD48110E8F6;
	Tue, 26 Mar 2024 04:05:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i6nvbHzP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B416310E912
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 04:05:43 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1e0d6356ce9so8682385ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 21:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711425943; x=1712030743; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language:subject
 :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mp/iSgbfnW8orknThf8Mk8F+cZ9YlXVvw/K4UD94uzM=;
 b=i6nvbHzPKDcc/RbKuCjO3ibaNyeePbWDtDYlXlueE+31u1/IU05qGt08FYIQiLlpHS
 e9J2X7A5nRx0FaBJU10bHZ4ljulUZyMTaoqDGYnZh0wi39UkOMuscOuHVrCLIH0FwPn5
 /Bmi74qcHUOzo6L1XwMiqoXLWmM+lBy0MbNIwfZ5eP3EJTPPBnllJez28MrNntUYBK8B
 F17ly//LvTWQthFP9n9aaG18cXXCmC8JLMxCsLeI9vd5/+V06p/CZgLxgFZ3foX/x6jM
 D61smfKxnCNHb99uxN4qnGis6YiIzhLCJ8K55QPZOScw8Mom9YDX1YO4v8xZoMSJ4Aaa
 12OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711425943; x=1712030743;
 h=content-transfer-encoding:in-reply-to:from:content-language:subject
 :references:cc:to:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mp/iSgbfnW8orknThf8Mk8F+cZ9YlXVvw/K4UD94uzM=;
 b=VQXP/odKBJK8UU+PhCnMqF+PeHzZ4gojkaVB368tz9VIHIqfYdTjsP0pY1qsSW064j
 CjWNXhjoLp0w7DaFlHOWGrWPzFfqagvoxA7byahvd9HP2ClRP80LSHyO071eGxsrwihC
 bXKb1WQHOucGx9l2I8Wo/AXIr648WIRgPITIzQxJJcejjS8EGvdTvWe0XzJCMPKznYg4
 eQU1phne7wLS3caq7f0L3lzwRgmxjPr4nk3qN9V6QCsDUqB5BVvVRmwMwNFqGPQN1vpa
 Lr3nz8st4YZy0Wv1P7D96fC4MtKqpqjcnoG9gnA2RiyU8jRcEwkcukDqY/743dHYC7OY
 k1vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQ1POVVakTf2FDZWDRsOtNGW+1o0uE2SJXoD7WaAOYpdCRujJml4G8GZ4CI97W/dNQkG2atRZfPlXszYGvIHRAvK8cEmGbz3g4Fvq7fcFl
X-Gm-Message-State: AOJu0YwTFwxZjL3+utS2ITiJgsgQuO6H1BqS/dKr6+HVB9oRLkOB3d1A
 k7IGDvA/A2m1nRhPHR+Sl4teGmaLU6YuVTXedmAL9fynwwzZxSWv
X-Google-Smtp-Source: AGHT+IFcsLR2C8+ZtR+yv0vJURk4SVpANVqlGc8m55n49GRWtgUneeT/o1MgeBxrYA4ZsVSCliHjzQ==
X-Received: by 2002:a17:902:eb8d:b0:1e0:115c:e03c with SMTP id
 q13-20020a170902eb8d00b001e0115ce03cmr8588174plg.53.1711425943001; 
 Mon, 25 Mar 2024 21:05:43 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp.
 [106.167.171.201]) by smtp.gmail.com with ESMTPSA id
 t21-20020a170902dcd500b001e0cde860dcsm1810252pll.51.2024.03.25.21.05.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 21:05:42 -0700 (PDT)
Message-ID: <f735ce0b-db1e-49bc-86ac-b5ab8e4aec31@gmail.com>
Date: Tue, 26 Mar 2024 13:05:39 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: amogh.linux.kernel.dev@gmail.com
Cc: airlied@gmail.com, corbet@lwn.net, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, javier.carrasco.cruz@gmail.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 skhan@linuxfoundation.org, tzimmermann@suse.de, willy@infradead.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <287eb3f74e4c31adb065668ff49c8e1577388227.camel@gmail.com>
Subject: Re: [PATCH v2] Fix duplicate C declaration warnings
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <287eb3f74e4c31adb065668ff49c8e1577388227.camel@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello.
Let me chime in.

On Mon, 25 Mar 2024 13:03:10 +0530, Amogh Cheluvaraj wrote:
[...]
> After further introspection of the file drivers/gpu/drm/drm_fourcc.c, I
> found that the warning is caused by having the same name for both the
> struct and the function as in "const struct drm_format_info
> *drm_format_info(u32 format)". This is an issue found using the latest
> version of Sphinx as reported by Akira Yokosawa in message id
> 564cbd05-8788-9223-1ecc-59e7fc41b46a@gmail.com.

That message of mine just pointed out that the Sphinx bug of false
duplicate C declaration warning first reported by Mauro (+CC'd) at:
https://github.com/sphinx-doc/sphinx/issues/8241 --
"C domain issues when building the Linux Kernel documentation".
It had not been resolved despite Mauro's recognition of the issue at the
time.

It was closed without fixing the bug but delegate the issue to an earlier
one of the same nature at: https://github.com/sphinx-doc/sphinx/issues/7819 --
"C, distinguish between ordinary identifiers and tag names", which was
opened on Jun 12, 2020 and has not been resolved.  (almost 4 years ago!)

There is two pull requests attempting to resolve the issue at:
https://github.com/sphinx-doc/sphinx/pull/8313 --
"C, distinguish between tag names and ordinary names" and
https://github.com/sphinx-doc/sphinx/pull/8929 --
"Intersphinx delegation to domains".
PR #8313 needs #8929 as its prerequisite.

Unfortunately, both PRs are still open as well as the issue #7819.
Honestly speaking, I don't have any idea what prevents those pulls,
give or take the need of rebasing with conflict resolution.

>                                                  So by changing the
> function name to something like "query_drm_format_info(u32 format)" is
> a possible fix. Question is what should I rename this function to, that
> aligns with the coding standards? Also suggest a new function name for
> "drm_modeset_lock" that causes the second warning.

So, I would rather not rename valid identifiers for the sake of working
around a bug of Sphinx.  Rather, I'd appreciate if you'd send a message
encouraging Sphinx devs to resolve the issue sooner rather than later.

        Thanks, Akira

