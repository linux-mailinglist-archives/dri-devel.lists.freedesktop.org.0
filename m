Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19775A4F8FF
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 09:41:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE9610E71C;
	Wed,  5 Mar 2025 08:41:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="FyL38Wzi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D97892D2
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 08:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1741164058; x=1741768858; i=markus.elfring@web.de;
 bh=fCDaLEF1BjQDk6gvMN7vVYiHfOJ4vTdNlSKUXs5nPuw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=FyL38WzipPEoGUYCtfkJPKsUeSQADSAFq4nNhTF7P+2Uv+w7VuuXPjKrszxmz47s
 7WExlwuD+KFc4CXaP594d5s5VJne7kXDhHMeuLX2EHe9VGUZw2G2ksajtN06jStjv
 EtwtxlByz8URebq+vUyWh/+KwwxKi/q2KLizqeaTaUyIpBPYlbZQ+YehxQqursD8M
 l9d1L16lFo3KZYNQa/R/EhLGrysPeHvI5xPjdKBVoFIYzXfTR6FqlonKjZ6OzkRFu
 jYHuCHO4Igg3qKQ1DqGrOjPAxtgA/53VYO6dfsEOPRTWO+kLPDonnRUzZbZFaBK1u
 uIF8ZWy88JP03+C2tg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.10]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MqZQY-1tTw9i2MMK-00fxB5; Wed, 05
 Mar 2025 09:40:58 +0100
Message-ID: <e665514b-5a62-4afb-b267-7c320e4872af@web.de>
Date: Wed, 5 Mar 2025 09:40:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BRFC=5D_Clarification_for_=E2=80=9Cundefined_beha?=
 =?UTF-8?B?dmlvdXLigJ0/?=
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 kernel-janitors@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Archit Taneja <architt@codeaurora.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Jeykumar Sankaran <jsanka@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
 cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <13566308-9a80-e4aa-f64e-978c02b1406d@web.de>
 <54c30a69-71cf-4582-9086-50eb0d39f273@web.de>
 <k7un3bjavyt4ogscgc7jn7thfobegaguqqiy7gtypmq6vq7zox@l4bsevbsjrud>
 <29b32b0d-312d-4848-9e26-9e5e76e527a7@stanley.mountain>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <29b32b0d-312d-4848-9e26-9e5e76e527a7@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Is8r5OqTz1HEt5DAHK+q9bpWIsAC/ftPgUCj2FJLpX8MmfLUBid
 fT2UpE/JSWmezrvupm7xHOXC7YUQsVaEZC0V5+3kNBaub/aDJDNC2yqQbgrscneRvnBq5VX
 VMQxX2+7fAtLBuT/Uboe9GP66LH+LXdN/9wgjWAmtPLeF4ULKk2+AEV7mhfygbzhNi9V9wB
 tkXDOy8yRt6oKzQuoNYUA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MuuCeMBVWnM=;BzFg+FxRcOm4BpAgy0enxRtgIHL
 4qupdcjxA6scJ3cX8W3kBIpdy/H4k+t7A4eNhegIC5Q6XRp9nWJQBpjEoqrBVWV3aH4tD043x
 N0gU9isZlYOwtTS2+LyVl4XTSrwTsx9DGUqM8FclDGpDUzwCX2k0jzWg5RyxTvsZnqJKQCe4u
 JVZTuYJciWMQninqJsMPiUKYGOP00FXKKXKNld2DOhORcvClqkBI2QfRW4VVhKwkZZwITIohN
 oczZRh0+LBz6HVJb6wvF/gdUDVSC6wA0UQSRVGmRuhEHP3tdilb/NDq38+A7X6ie/ca198CGY
 oAomEVGBLJox4XYcY4QknL7NBQ3MnFVBu1ZZBLq2A4jzTeym3S87sf+KERld9cMLN71ZaZDRt
 QqmBh1UbLqQmvai/mDJzSO26qqsemIOf6rxIlEuAJMzIoFjB8NR71+5N0PWrzjpQNE4hSb2uU
 Ez8c79sMcApnHnfe+9EBwBwq6fPsSd0fnYIUY189mQgmb4nRhFg/c604l9Wg03W1tABL2eimo
 rHlDCgJtEa2YT7asXccZOr5+Vh+lS719rBY9ATeYjD20CymYIqFDviVhNOmIPcVZrDAk9ycB0
 fd9+3wj+9egR5Rm8TWep22kj2sqrk8t80TtPvP3SyoHITgIrrQFQDSPgTiiej2xcC6Uvn4ekS
 G5bib8BotNmdMcUBYyx0+iyiMTq/dYaOtHM5VycArSykz4QiKJLSe2QgSlaZA9ewnudX6ojvN
 ovWqLR3GQ5/ITBaschxQkJO5zAdWz7Ksv/9OORtm9iN83sgtdPEYyYrJpapIRS75p3/YONcb4
 YM781c0t19a/FMrXy27nVhTRSItb3lp39Eq8S1Cr1Mc5YWYVK9lVKriOavWh0vfSGv+b5wrtp
 4FxP4/kHn3bejmofRFRHDhydYsF++px1Z15ojeihiJbo5tsFqawhNk06ujULAPg7BewFds+bi
 TKEj4DZrPxdrkO3inYqmFm34uIw4RYfsvC3zUUW+jUsMQxSRSiBzuVp3wVM7Y6YbuPVghbTUw
 JpzrWYGYycUc2jKFuj4pcACdAeklii9U/6zuww4yAxDqYncKhWcLsNwA9omLPovtZVmKRhCsB
 PGkL9tts+aYt9K1JYYWIltzHeoLjzIt2cfs2F4KvQEKy4XhAW7oIASNELcIwklQP6MU+5IixI
 baJTU5mzorsYPb8a1ruASEdY3uOry7NjOUjLoBlgzkH2o8Tc+YG3U2cfn/UMSMdyrQXs+cucJ
 zUzG5qFlhXJbak8Fh/rJrfct5PDE62PaRceFlW/z8jAYf+nAZye5+yMTAq8kyg26/im3np92p
 oeQ9Xn6WleJZtWsVOphZEbFXw03x9jODGJXYF7633qYzfD+pOLMxUZrzYKMozCrd6V9zc/DgV
 IJ7dM6wYNVQXmq7yYsUr8HNhRjW3XZAvSIhs54WzvxvXbY4LTNW9at5SvzPYTfJcM1K2DRVXz
 SgLwmhV+mstgAnG2q0CJRo1aqMEI=
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

>>> The address of a data structure member was determined before
>>> a corresponding null pointer check in the implementation of
>>> the functions =E2=80=9Cdpu_hw_pp_enable_te=E2=80=9D and =E2=80=9Cdpu_h=
w_pp_get_vsync_info=E2=80=9D.
>>>
>>> Thus avoid the risk for undefined behaviour by removing extra
>>> initialisations for the variable =E2=80=9Cc=E2=80=9D (also because it =
was already
>>> reassigned with the same value behind this pointer check).
> There is no undefined behavior here.

Is there a need to improve the wording precision?

There are words which denote a special meaning according to aspects of
the programming language =E2=80=9CC=E2=80=9D.
https://en.cppreference.com/w/c/language/behavior

Dereferences of null pointers are treated in special ways.
The system might be configurable to collaborate also with data accesses
together with the address =E2=80=9Czero=E2=80=9D.
Would you like to distinguish supported software functionality any further=
?

Regards,
Markus
