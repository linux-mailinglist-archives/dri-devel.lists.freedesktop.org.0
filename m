Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B093F650890
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 09:35:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB4010E1FD;
	Mon, 19 Dec 2022 08:34:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD0A8922E;
 Mon, 19 Dec 2022 08:34:02 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id ay40so5866975wmb.2;
 Mon, 19 Dec 2022 00:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WO+DTsdKIQISl5o/HnbKsDaZjwGKYa9dv9O10LMunEI=;
 b=QsgA+7GAdDHn9cWg2AxqJ1wITHrWuBXuhxlNF0ODLaYSlY9KLzJ3FqBppOM7rwJtKa
 zRHoxHltn8zRSKnrBNWiOcIVf0tyoPfeV895CxmcVs/O/un84/0dbV2j0v886PZhv63v
 gP6R+GpYaECiPv5kt4CAa0e/NQStV7JdX3rVP4u6EjlIKvB38BPG3T48FIu9bERHk7cD
 TXG33Mf/zxrzRwsYLlxCfMBvIPPBsC1oetiFm03r1unq1KNnta1JALq/DVmXxmb2484e
 c95X9+revcMNVKpxOPTSFH0bW3p7MKtXdv74PYeIVM8MK1fNDAjEmhP9x8S92dLzqc/x
 7daQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WO+DTsdKIQISl5o/HnbKsDaZjwGKYa9dv9O10LMunEI=;
 b=ev5zgLiSWz75sDUKdEOiUaXhbM8XcNBC8CWTLUOscWW3mHto9srVZBLZkH7GJSXu0p
 wwIu0x9sNerRn/0HnOYwqqWx24GAmlUcOb45z4oFI5/yGVC2BmYzmEfDbZ3Lm3357QPi
 A1b2ky94JGHzu0EQRv9C9D4HlqtkPyGBLKux+prcHcl9s9XshdJdjI0BspmSacMOzPBG
 E7eSzjM7ZaUSvivwkxk8ieXC/ks3S0OUjk7reqsu9Ih3ZfXXUWGTRESKB1F77cEOUVm1
 Nu+fGNxRN+ecWjnn2BMKDk7BQI6mWEkRyzuWda7od3qOw/dmZ3xRTGi8UkJJOivrQzXA
 lfdA==
X-Gm-Message-State: ANoB5pndqIaUknXRZCJ4+7t9SdtOXVlGU+s3qMCbTmwTK0sTCRpTMENk
 snjtGwCunPnGtHmD5gbpCipPumpL6eA=
X-Google-Smtp-Source: AA0mqf4TWyG9Juf0LjhIKnVSwhp39oXzsEeDPqLjkwFfsR6pCzre+hkGlCUtJuWW9KD0BbEEa274gA==
X-Received: by 2002:a7b:c5c4:0:b0:3d1:f234:12cc with SMTP id
 n4-20020a7bc5c4000000b003d1f23412ccmr31135463wmk.33.1671438840797; 
 Mon, 19 Dec 2022 00:34:00 -0800 (PST)
Received: from ?IPV6:2a02:908:1256:79a0:83d7:3937:b31e:d44c?
 ([2a02:908:1256:79a0:83d7:3937:b31e:d44c])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a05600c4fcd00b003b4868eb71bsm20938252wmq.25.2022.12.19.00.33.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 00:34:00 -0800 (PST)
Message-ID: <e803259c-755e-27b9-18dd-86462ea38df3@gmail.com>
Date: Mon, 19 Dec 2022 09:34:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: DRM scheduler & amdgpu splats followed by GPU hang
Content-Language: en-US
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <d09c335c-b4e8-2ad8-f135-dbac6f99f8cf@daenzer.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <d09c335c-b4e8-2ad8-f135-dbac6f99f8cf@daenzer.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michel,

yeah that's a known issue. I'm already working on that, looks like I've 
just forgotten to add a dma_fence_get() somewhere.

Going to send around a bug fix later today.

Thanks for the report,
Christian.

Am 17.12.22 um 13:12 schrieb Michel Dänzer:
> With the drm-next-2022-12-13 changes for 6.2 merged on top of a 6.1.0 kernel, I hit a GPU (Picasso APU) hang in the menu of Trackmania (free-to-play Windows game, running via Wine).
>
> After rebooting, I noticed the attached splats in the journal. I can't be sure that the GPU hang was directly related to these, but it seems plausible.
>
> Do these ring any bells?
>
>

