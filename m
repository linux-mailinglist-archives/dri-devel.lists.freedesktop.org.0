Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BFD9FEA9E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 21:33:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0DF110E054;
	Mon, 30 Dec 2024 20:33:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rRhDKT+r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2689710E054
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 20:33:33 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3863703258fso6207916f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 12:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735590751; x=1736195551; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3pq0s3ckIiTlqXik31Tw6lXUUphfCKc9DjHpksYo6NA=;
 b=rRhDKT+rmy5rHezuigd8/Jxuu3M+hZA6AAGZ0sKyX8DeunJ4ufMEEsoY90Vd6lVrZe
 OEZbkqbKkkSxQvitoob8iEo1oR5M0GF9XXFDIYl0PNrzy8bcTV4byXJVdKxOqqPPNM5b
 bn/THQrepOBSj2oyV9Wm3TQJ26bFGeCQVJHh/2di7QRRuTfifbVm8S0WDp4mqSkvQqAg
 m4XO6hYLR4eC2f8CN6ihv5ZXoUCTjRWk2rjyQmB7awuLpZl3zHqem68EShMid4wou2g/
 NhjKstuuYi+pZsTgON5T7nYI2Pog3mSUQEFamTl9Q+dd+L//Qudl/1YPyMaE22dDaLd8
 7X7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735590751; x=1736195551;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3pq0s3ckIiTlqXik31Tw6lXUUphfCKc9DjHpksYo6NA=;
 b=RUbf/GfpLJ+f4E3yYl+/j7z9Xuyhq+if9DQOWxQnkzy5HLea0Re/wh7cjYstsy9MPk
 8oD1spVH8XVZTBeCZi5Rs4Xg+oNRFuifJflsutzw0Zpe9GrDfo8I0tqqxI0jesogUv9N
 XWC1NfBEZ2to8vxvFQ5w1goL4Yu0DWDn8pT9fJYrm0aivBRp9ZPhKRmhKXxVCRd0TrMr
 2L5WgIpR4yv5isbi45/JKqd9muUQM2P2iIUqVHyCnQvBrXwcI0ROE4ksCVotV8WBGoAF
 olwZiR+IcXP0lIEbtMBZxN38CTfqjH1aVfUP5slxAmAmVj9UEiW/7pgMpCerYB2ULj26
 QbLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZOU5O/Qfm+PItSeO9NfF4DhELWthjXcekZK8mnI123A3N1X8Fhgvnd14JX5fNJnFd46/8+g7rEVc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHv9t58THWWwzpVRVn2FcEBX/MBMAbhR1OuQUZ5TQEtnvJ7zGD
 anPryv+aIoJCCfl1kS9tI10vFJKEYjvvN+PdXjo/SmkoV23SvSoN1yXbLuj2iHY=
X-Gm-Gg: ASbGncte2jR7VrI/gvFCBnpcB/eI5Rbozh6pta3Tm7ywwZEBq/t3De5ZOH1EKQq0YPS
 4SoS+dtaoL6JvR8AElfBd8EFbF9j26W4zZNqyhOMKWWBEEMnvZ/GaXkvur/v/LRtDSXUXIMR71u
 sKyw+dvE87ztV7O1Ek2ZpVLs4hrkISn3LNbxvyze6rTccj/nub25hMd2Wut+BPllb3gkaBNozJ2
 ZmY8TxoLUNjVde8GZSL/o1skQFy50Lt1mvn+xeYhanA7LqGziUderED9E71fngstrR4VuFG2NI=
X-Google-Smtp-Source: AGHT+IGnMunM/UAWS3Rwrx3prMio8qRf5DD/jYD0DbMIHgWiFAB26vYnuoJYyxLlaG3R4f9Ruoy8wQ==
X-Received: by 2002:a05:6000:703:b0:385:f7e5:de88 with SMTP id
 ffacd0b85a97d-38a229ec5b0mr27423543f8f.3.1735590751612; 
 Mon, 30 Dec 2024 12:32:31 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-38a1c84840asm30889572f8f.61.2024.12.30.12.32.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Dec 2024 12:32:31 -0800 (PST)
Message-ID: <8dee006c-cc1a-4274-8691-2d58372bc022@linaro.org>
Date: Mon, 30 Dec 2024 20:32:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] Add missing fixes in fastrpc_get_args
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, Ekansh Gupta <quic_ekangupt@quicinc.com>,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de
References: <20241218102429.2026460-1-quic_ekangupt@quicinc.com>
 <173557534277.273714.16861047953843054499.b4-ty@linaro.org>
 <qd32erndjbtspx4im5u2ge2vgdc4qwwvxhkoaefxwzkue5x7kc@ghk5fdkma6vm>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <qd32erndjbtspx4im5u2ge2vgdc4qwwvxhkoaefxwzkue5x7kc@ghk5fdkma6vm>
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



On 30/12/2024 18:22, Dmitry Baryshkov wrote:
> On Mon, Dec 30, 2024 at 04:15:42PM +0000, Srinivas Kandagatla wrote:
>>
>> On Wed, 18 Dec 2024 15:54:27 +0530, Ekansh Gupta wrote:
>>> This patch series adds the listed bug fixes that have been missing
>>> in upstream fastRPC driver:
>>> - Page address for registered buffer(with fd) is not calculated
>>>    properly.
>>> - Page size calculation for non-registered buffer(copy buffer) is
>>>    incorrect.
>>>
>>> [...]
>>
>> Applied, thanks!
> 
> May I ask, why they are being accepted with the obvious checkpatch
> warnings?

If you are referring to this warning.
WARNING: Invalid email format for stable: 'stable <stable@kernel.org>', 
prefer 'stable@kernel.org'

I tend to fix such small warnings before applying. These are fixed now.

> 
> What kind of process is being followed, as those patches had review
> comments to be implemented in the next iteration.

I apply these patches if it looks good to me. This also helps with 
getting it tested from wider audience via linux-next.

I do run TFLite workloads before it ends up in char-misc, but not for 
every patch.

sorry If I missed any blocker comments, but your comments were more on 
the cover letter content and asking about the work loads which triggers 
these bugs.

Are these patches breaking any of your test-cases?


--srini

