Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C45067D075C
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 06:34:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F2A10E57A;
	Fri, 20 Oct 2023 04:34:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8501E10E57A
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 04:34:08 +0000 (UTC)
Received: from [192.168.0.206] (unknown [179.221.49.105])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 39D6F660734B;
 Fri, 20 Oct 2023 05:34:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697776447;
 bh=OYnayEQ/CpPDQMyWzfpsgBnmAYMagP8fIKyb5zhLMaQ=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=FlqS7vYY1aZfYs/3v09rMwr88WjirR/kuT8viuIbz58mcyI2/GKAaFD1meVDjKAfY
 FQ2I5215PZbKcLFMm6AWnNsPFkXM8JcaWmUUkLQW5sAk3sT9D3FLETfNb/u4HasJnW
 iRqL4WT+98wXmow2tNrMa6vFeIY30YWOHrHsQDFd4ACF3m9erUW/jJwOJTzMRm/oQz
 v6+gbfrtItHCvXiCBPBa09DRGX2HZ2SXyMFRJdXmOL9Z5SYUUZW4q8oBZg7FwDQR/Q
 TlXjaWktEl9rdfPXqYYgFbA/EikjRQnYnGk2Dluob6oTcvzD+qevUchN6Z2dKQJfcZ
 pR/wfnuI3KYug==
Message-ID: <b8b5def4-a178-4bfc-a7e8-1a2ebc80d7aa@collabora.com>
Date: Fri, 20 Oct 2023 01:33:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/doc: ci: Require more context for flaky tests
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
To: Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
References: <20231019094609.251787-1-mripard@kernel.org>
 <ba2cd566-328d-4a47-9ab8-05817c14f0bd@collabora.com>
In-Reply-To: <ba2cd566-328d-4a47-9ab8-05817c14f0bd@collabora.com>
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
Cc: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 19/10/2023 13:51, Helen Koike wrote:
> 
> 
> On 19/10/2023 06:46, Maxime Ripard wrote:
>> Flaky tests can be very difficult to reproduce after the facts, which
>> will make it even harder to ever fix.
>>
>> Let's document the metadata we agreed on to provide more context to
>> anyone trying to address these fixes.
>>
>> Link: 
>> https://lore.kernel.org/dri-devel/CAPj87rPbJ1V1-R7WMTHkDat2A4nwSd61Df9mdGH2PR=ZzxaU=Q@mail.gmail.com/
>> Signed-off-by: Maxime Ripard <mripard@kernel.org>
>> ---
>>   Documentation/gpu/automated_testing.rst | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/Documentation/gpu/automated_testing.rst 
>> b/Documentation/gpu/automated_testing.rst
>> index 469b6fb65c30..2dd0e221c2c3 100644
>> --- a/Documentation/gpu/automated_testing.rst
>> +++ b/Documentation/gpu/automated_testing.rst
>> @@ -67,6 +67,19 @@ Lists the tests that for a given driver on a 
>> specific hardware revision are
>>   known to behave unreliably. These tests won't cause a job to fail 
>> regardless of
>>   the result. They will still be run.
>> +Each new flake entry must be associated with a link to a bug report to
> 
> What do you mean by but report? Just a link to an email to the mailing 
> list is enough?
> 
> Also, I had made a mistake to the first flakes lists, which I corrected 
> with https://www.spinics.net/lists/kernel/msg4959629.html (there was a 
> bug in my script which ended up erroneous adding a bunch of tests in the 
> flake list, so I cleaned them up), I would like to kind request to let 
> me add those documentation in a future patch to not block that patch 
> series.
> 
> Thanks
> Helen
> 
> 
>> +the author of the affected driver, the board name or Device Tree name of
>> +the board, the first kernel version affected, and an approximation of
>> +the failure rate.
>> +
>> +They should be provided under the following format::
>> +
>> +  # Bug Report: $LORE_OR_PATCHWORK_URL

I wonder if the commit adding the test into the flakes.txt file with and 
Acked-by from the device maintainer shouldn't be already considered the 
Bug Report.

>> +  # Board Name: broken-board.dtb

Maybe Board Name isn't required, since it is already in the name of the 
file.

>> +  # Version: 6.6-rc1
>> +  # Failure Rate: 100

Maybe also:

   # Pipeline url: 
https://gitlab.freedesktop.org/helen.fornazier/linux/-/pipelines/1014435

All this info will complicated a bit the update-xfails.py script, but 
well, we can handle...
(see 
https://patchwork.kernel.org/project/dri-devel/patch/20231020034124.136295-4-helen.koike@collabora.com/ 
)
We need to update that script to make life easier.
Vignesh sent a patch adding at least the pipeline url to the file
https://patchwork.kernel.org/project/linux-arm-msm/patch/20231019070650.61159-9-vignesh.raman@collabora.com/
but to meet this doc that needs to be updated too.

Regards,
Helen

>> +  flaky-test
>> +
>>   drivers/gpu/drm/ci/${DRIVER_NAME}-${HW_REVISION}-skips.txt
>>   -----------------------------------------------------------
