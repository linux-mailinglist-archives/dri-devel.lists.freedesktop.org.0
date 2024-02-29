Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2881B86CC7C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 16:12:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF2510E3E9;
	Thu, 29 Feb 2024 15:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="P8GHMA0q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D124C10E189
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 14:16:21 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-68fcedcf8aaso3733976d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 06:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709216180; x=1709820980; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/W/wZXm/lm7nezS3iJK5hhPJV5z7bm8xrMOjN7sfA2c=;
 b=P8GHMA0q02bpmMFFE5i5nPoXhnLQb59xp1bhaOVaaUMo7ACpE4cYoJx5Uv4bcxY9cw
 7YcDLg+nlWOcJ2gzNAFbNhprP6FvwZN/fhfyUidXVHLpWaTmFRFZEiCGBsDCQGiYvBD6
 ZOdLWTr4y6dY01dl2DJWjPAuyqUT/t6tHIgE1yWhjwLCB03uJs36e7OZ+wDZXcjcM6ZO
 xMu46gaHehhj71zQMB9C/UUqU+8NKASTCuQr3A23rJn+HpZyQ/zn6uqcti5ZEL5XzWT3
 rN53pLs4pCoH/3pyDsT8IfVn1RJ4ytaWf5xmELiSBSibA3EW44nCEjhN5YqBApy0Vh4o
 1kCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709216180; x=1709820980;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/W/wZXm/lm7nezS3iJK5hhPJV5z7bm8xrMOjN7sfA2c=;
 b=fMiRbRocxqv3G0kNsqtZZW9UNzfr/t0tZTFr4+foilAFcOlDbfWC1aBRGruntcrTMu
 rNjCxsxP5pYijJ/xVBs8dTzcCFkdgXU5X4eAfMVtxGm9JgAzc4tQsebA2LZkRVlFmm90
 JpSNJEejQOpP1JmcPYQWeDuyP27A0y9eNbQPIGvN1y8ML8jdNDQTMRdU/jWRnlr2Gb7b
 38i3/xkp5SV2YAO4ka4JnVyAdRg1XaU7SnZYU51sQ0GmGCVcWP6A+b3BGjHZrqsEGJqT
 sU5GUQiC+g7HR2au5Ag+jFHJxgxHt3npdoJHN4nBA5FdUfSOL4h5XtDHxdMdwUR6xbLJ
 SUcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSVvyacvjz9JYEvqyunlMa/bfQ3EZvsFKeQ94qVTZIn4qmU9E7D/DFRr+rzCQ1BRfkjGlCYFCbVIGWUiwbHczMt7FWoNXiM26hP93KFq6P
X-Gm-Message-State: AOJu0YzzCxrQz1mcaJs07Va2SfPqeoSLkhJdWwMqCcoUvKJOqemEOOju
 CUwy2jp2Bcdv31OvtyewpAjYb2FG7LvESB803BBUNyLqz/y4MFXE
X-Google-Smtp-Source: AGHT+IHs1YnZ0esHs1BMxISmBCDSRJY5ZhDnZqGmDP5+mD/g+W2yrpWgUSNeF5GUTRda4q1JIaSsQQ==
X-Received: by 2002:a0c:e80e:0:b0:68f:3058:a0 with SMTP id
 y14-20020a0ce80e000000b0068f305800a0mr2481153qvn.41.1709216180406; 
 Thu, 29 Feb 2024 06:16:20 -0800 (PST)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi.
 [88.113.27.52]) by smtp.gmail.com with ESMTPSA id
 ng8-20020a0562143bc800b0068fa4534070sm770363qvb.83.2024.02.29.06.16.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 06:16:20 -0800 (PST)
Message-ID: <a5726043-1906-44ba-a6ee-a725a2776269@gmail.com>
Date: Thu, 29 Feb 2024 16:16:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] kci-gitlab: Introducing GitLab-CI Pipeline for Kernel
 Testing
Content-Language: en-US
To: Guillaume Tucker <gtucker@gtucker.io>,
 Helen Koike <helen.koike@collabora.com>, linuxtv-ci@linuxtv.org,
 dave.pigott@collabora.com, mripard@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 gustavo.padovan@collabora.com, pawiecz@collabora.com,
 tales.aparecida@gmail.com, workflows@vger.kernel.org,
 kernelci@lists.linux.dev, skhan@linuxfoundation.org,
 kunit-dev@googlegroups.com, nfraprado@collabora.com, davidgow@google.com,
 cocci@inria.fr, Julia.Lawall@inria.fr, laura.nao@collabora.com,
 ricardo.canuelo@collabora.com, kernel@collabora.com,
 torvalds@linuxfoundation.org, gregkh@linuxfoundation.org
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <d99d026e-ed32-4432-bab3-db75296e67d8@gtucker.io>
From: Nikolai Kondrashov <spbnick@gmail.com>
In-Reply-To: <d99d026e-ed32-4432-bab3-db75296e67d8@gtucker.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 29 Feb 2024 15:12:01 +0000
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

On 2/29/24 2:20 PM, Guillaume Tucker wrote:
> Hello,
> 
> On 28/02/2024 23:55, Helen Koike wrote:
>> Dear Kernel Community,
>>
>> This patch introduces a `.gitlab-ci` file along with a `ci/` folder, defining a
>> basic test pipeline triggered by code pushes to a GitLab-CI instance. This
>> initial version includes static checks (checkpatch and smatch for now) and build
>> tests across various architectures and configurations. It leverages an
>> integrated cache for efficient build times and introduces a flexible 'scenarios'
>> mechanism for subsystem-specific extensions.
> 
> This sounds like a nice starting point to me as an additional way
> to run tests upstream.  I have one particular question as I see a
> pattern through the rest of the email, please see below.
> 
> [...]
> 
>> 4. **Collaborative Testing Environment:** The kernel community is already
>> engaged in numerous testing efforts, including various GitLab-CI pipelines such
>> as DRM-CI, which I maintain, along with other solutions like KernelCI and
>> BPF-CI. This proposal is designed to further stimulate contributions to the
>> evolving testing landscape. Our goal is to establish a comprehensive suite of
>> common tools and files.
> 
> [...]
> 
>> **Leveraging External Test Labs:**
>> We can extend our testing to external labs, similar to what DRM-CI currently
>> does. This includes:
>> - Lava labs
>> - Bare metal labs
>> - Using KernelCI-provided labs
>>
>> **Other integrations**
>> - Submit results to KCIDB
> 
> [...]
> 
>> **Join Our Slack Channel:**
>> We have a Slack channel, #gitlab-ci, on the KernelCI Slack instance https://kernelci.slack.com/ .
>> Feel free to join and contribute to the conversation. The KernelCI team has
>> weekly calls where we also discuss the GitLab-CI pipeline.
>>
>> **Acknowledgments:**
>> A special thanks to Nikolai Kondrashov, Tales da Aparecida - both from Red Hat -
>> and KernelCI community for their valuable feedback and support in this proposal.
> 
> Where does this fit on the KernelCI roadmap?
> 
> I see it mentioned a few times but it's not entirely clear
> whether this initiative is an independent one or in some way
> linked to KernelCI.  Say, are you planning to use the kci tool,
> new API, compiler toolchains, user-space and Docker images etc?
> Or, are KernelCI plans evolving to follow this move?

I would say this is an important part of KernelCI the project, considering its 
aim to improve testing and CI in the kernel. It's not a part of KernelCI the 
service as it is right now, although I would say it would be good to have 
ability to submit KernelCI jobs from GitLab CI and pull results in the same 
pipeline, as we discussed earlier.

Nick
