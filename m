Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2E3A772A4
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 04:15:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 914EE10E159;
	Tue,  1 Apr 2025 02:15:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="mSnWgYCS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A5A10E159
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 02:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743473724;
 bh=Fqvw6uxuRFvcoeqKohK6RGL/Kz3larBJDRQ1jIJPPXM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mSnWgYCSDUpsSYxqJzqP1YbE1hOkgqQANXSLFZZv2u0prxrNG+HUhtXFOoM76l7vN
 NgJYYva7aWM9t9rOIT9A9tiKpnUzEHAj4TEF3jgEjKGn+di042b+/RR9SJvCrZwOm1
 xZguuoikmEzHe9ZFYinY9hXLq8IS9W6Orn9+RT4vQN82XIHAPCzP5gkMv92zkxB92H
 n/hcZ8nNpVDU0rrjhStbvihGmEaARONN/QUYhcCpRmIgk2Om2rHWyJ6hA1dHJzPKIT
 +JCo3wygXLpSpE3El6BhBbhsgOGcYeLp16KX+AglKj8kr5JTgA9XS5J7Y+uLzW5ZnT
 MDqzZ3hRWLc1A==
Received: from [192.168.50.250] (unknown [171.76.83.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7CEE517E0CD1;
 Tue,  1 Apr 2025 04:15:20 +0200 (CEST)
Message-ID: <ddd0095e-72b4-4cd1-9216-2071afbbad25@collabora.com>
Date: Tue, 1 Apr 2025 07:45:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] drm/ci: Add jobs to validate devicetrees
To: Dmitry Baryshkov <dbaryshkov@gmail.com>, Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
 robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
 lumag@kernel.org, quic_abhinavk@quicinc.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
References: <20250327160117.945165-1-vignesh.raman@collabora.com>
 <20250327160117.945165-3-vignesh.raman@collabora.com>
 <v4dhuuuvfk63bakncz43z3ndjdze5ac7nrv6qvtpdnonfpetsx@5hh3vzcj336x>
 <20250331-amphibian-hopping-bobcat-e19a0b@houat>
 <CALT56yO-=nQnTB=H4L-qnta4js3FB=-WCOFj8q57PPWjLY+JKA@mail.gmail.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <CALT56yO-=nQnTB=H4L-qnta4js3FB=-WCOFj8q57PPWjLY+JKA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Dmitry,

On 31/03/25 13:25, Dmitry Baryshkov wrote:
> On Mon, 31 Mar 2025 at 10:53, Maxime Ripard <mripard@kernel.org> wrote:
>>
>> On Sun, Mar 30, 2025 at 08:06:45PM +0300, Dmitry Baryshkov wrote:
>>> On Thu, Mar 27, 2025 at 09:31:11PM +0530, Vignesh Raman wrote:
>>>> Add jobs to run dt_binding_check and dtbs_check. If warnings are seen,
>>>> exit with a non-zero error code while configuring them as warning in
>>>> the GitLab CI pipeline.
>>>
>>> Can it really succeed or is it going to be an always-failing job? The
>>> dt_binding_check generally succeed, dtbs_check generates tons of
>>> warnings. We are trying to make progress there, but it's still very far
>>> from being achevable.
>>
>> It depends on the platforms I guess. Some are 100% covered and any
>> warning should be treated as a failure, and some have not started the
>> effort.
>>
>> I guess we could solve it with some kind of expectation list, but I do
>> wonder if it's something *we* should be focusing on :)
> 
> I think that we might want to limit this to `make dt_bindings_check
> DT_SCHEMA_FILES=display`, checking all GPU / display schema files.
> 

Yes, will test the changes and send v2.

Regards,
Vignesh
