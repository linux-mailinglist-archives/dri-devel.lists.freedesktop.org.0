Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6247C86CC82
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 16:12:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C5810E45E;
	Thu, 29 Feb 2024 15:12:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gtucker.io header.i=@gtucker.io header.b="e6dw9jxm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1621 seconds by postgrey-1.36 at gabe;
 Thu, 29 Feb 2024 12:20:46 UTC
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A075110E364
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 12:20:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DF335C000C;
 Thu, 29 Feb 2024 12:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
 t=1709209244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B6cMCmcnKMLLaSkCY/Q3FEaIM22/n5JPr+A3k3857Ak=;
 b=e6dw9jxmOjxEWGL4CwLLpcu3etN9VgBLkvgGBS77nGo2i9JzqcGhXcMi/ZSamcRjBIgJcC
 8rMyWgs5i1dkhCkBSSstzl76l5Url9CebPIMUY3HOFlqtJFVe78xbWwcys1jzPAL5xiJI9
 c4cNPvbfFqC7+JJ4lcc/JQ3Co5dc62CJKdsQ2LnpqvTFvilVwOA1EIRjdCIOF/FPg7nyEU
 AkY74Rh4APJZ4cJBP18refisPFoFZm8tJjfp0LZBDIFjJFy5+xPhV6Jpw+8fxNxBhQkuJN
 dtF8DxpoYoTODY6x5CIgUtN3qYPB1OTIcr5EcDRC1GKU/nraf/VxFHNRA/XmMA==
Message-ID: <d99d026e-ed32-4432-bab3-db75296e67d8@gtucker.io>
Date: Thu, 29 Feb 2024 13:20:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] kci-gitlab: Introducing GitLab-CI Pipeline for Kernel
 Testing
Content-Language: en-GB
To: Helen Koike <helen.koike@collabora.com>, linuxtv-ci@linuxtv.org,
 dave.pigott@collabora.com, mripard@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 gustavo.padovan@collabora.com, pawiecz@collabora.com, spbnick@gmail.com,
 tales.aparecida@gmail.com, workflows@vger.kernel.org,
 kernelci@lists.linux.dev, skhan@linuxfoundation.org,
 kunit-dev@googlegroups.com, nfraprado@collabora.com, davidgow@google.com,
 cocci@inria.fr, Julia.Lawall@inria.fr, laura.nao@collabora.com,
 ricardo.canuelo@collabora.com, kernel@collabora.com,
 torvalds@linuxfoundation.org, gregkh@linuxfoundation.org
References: <20240228225527.1052240-1-helen.koike@collabora.com>
From: Guillaume Tucker <gtucker@gtucker.io>
Organization: gtucker.io
In-Reply-To: <20240228225527.1052240-1-helen.koike@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io
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

Hello,

On 28/02/2024 23:55, Helen Koike wrote:
> Dear Kernel Community,
> 
> This patch introduces a `.gitlab-ci` file along with a `ci/` folder, defining a
> basic test pipeline triggered by code pushes to a GitLab-CI instance. This
> initial version includes static checks (checkpatch and smatch for now) and build
> tests across various architectures and configurations. It leverages an
> integrated cache for efficient build times and introduces a flexible 'scenarios'
> mechanism for subsystem-specific extensions.

This sounds like a nice starting point to me as an additional way
to run tests upstream.  I have one particular question as I see a
pattern through the rest of the email, please see below.

[...]

> 4. **Collaborative Testing Environment:** The kernel community is already
> engaged in numerous testing efforts, including various GitLab-CI pipelines such
> as DRM-CI, which I maintain, along with other solutions like KernelCI and
> BPF-CI. This proposal is designed to further stimulate contributions to the
> evolving testing landscape. Our goal is to establish a comprehensive suite of
> common tools and files.

[...]

> **Leveraging External Test Labs:**
> We can extend our testing to external labs, similar to what DRM-CI currently
> does. This includes:
> - Lava labs
> - Bare metal labs
> - Using KernelCI-provided labs
> 
> **Other integrations**
> - Submit results to KCIDB

[...]

> **Join Our Slack Channel:**
> We have a Slack channel, #gitlab-ci, on the KernelCI Slack instance https://kernelci.slack.com/ .
> Feel free to join and contribute to the conversation. The KernelCI team has
> weekly calls where we also discuss the GitLab-CI pipeline.
> 
> **Acknowledgments:**
> A special thanks to Nikolai Kondrashov, Tales da Aparecida - both from Red Hat -
> and KernelCI community for their valuable feedback and support in this proposal.

Where does this fit on the KernelCI roadmap?

I see it mentioned a few times but it's not entirely clear
whether this initiative is an independent one or in some way
linked to KernelCI.  Say, are you planning to use the kci tool,
new API, compiler toolchains, user-space and Docker images etc?
Or, are KernelCI plans evolving to follow this move?

Thanks,
Guillaume

