Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D639197A982
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 01:27:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B7E10E1CB;
	Mon, 16 Sep 2024 23:27:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SqYtWNpW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0E8D10E1CB;
 Mon, 16 Sep 2024 23:27:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DD560A4038D;
 Mon, 16 Sep 2024 23:26:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13A89C4CEC4;
 Mon, 16 Sep 2024 23:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726529219;
 bh=d9UEpU83x5hAG5oMvx4HxcrAGOkKGgQANVisyV8UGI8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SqYtWNpWUVSHBdzHfFF//6C1+brsULRgPpUKjETvFj4vraaGw2aCwwLbh6Ei+plTj
 bK02Q8DhvkxRslymdv/Y3pscVdgjI89OFN6aOjWvQnOjUPL8q6UVLI9ZcR1S88qQ6A
 uiQc7Ow141IIoqccqUONlbKl+lLsaNIi+pgAwBXvjDwUuULVqUWZp49yctVCo6nMLW
 mA0zVB31Ta4H/tZxlWFISn3r9Lc79n+ensJSulvSItS4zuRP4ClcXNDjgVQm2XuMUX
 hv0MUI0+U/cNqHVW+ZOff08pxtTvAOj97rlZ4wFAe2mla6rgBKyXp2EuUu4GUSCrKh
 Hn6GnXQk6EFAw==
Message-ID: <f736f02e-f19b-4be2-86ad-73d6ae7c6dc2@kernel.org>
Date: Tue, 17 Sep 2024 01:26:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: phy: Add eDP PHY compatible for
 sa8775p
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>, vkoul@kernel.org,
 kishon@kernel.org, konradybcio@kernel.org, andersson@kernel.org,
 simona@ffwll.ch, abel.vesa@linaro.org, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, quic_khsieh@quicinc.com,
 konrad.dybcio@linaro.org, quic_parellan@quicinc.com,
 quic_bjorande@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, quic_riteshk@quicinc.com,
 quic_vproddut@quicinc.com
References: <20240913103755.7290-1-quic_mukhopad@quicinc.com>
 <20240913103755.7290-2-quic_mukhopad@quicinc.com>
 <2hv2hcpbanduw4wg2wbza4jkze4sgilrtyc7zack23uygwsjol@ckskl2rkd5xp>
 <t4ytnii3sdiqsni74d7qsi2c6uv2klwmzmgznnirt2z55to4hj@lyaoh5fzcyti>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <t4ytnii3sdiqsni74d7qsi2c6uv2klwmzmgznnirt2z55to4hj@lyaoh5fzcyti>
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

On 16.09.2024 10:33 PM, Dmitry Baryshkov wrote:
> On Mon, Sep 16, 2024 at 05:23:55PM GMT, Krzysztof Kozlowski wrote:
>> On Fri, Sep 13, 2024 at 04:07:51PM +0530, Soutrik Mukhopadhyay wrote:
>>> Add compatible string for the supported eDP PHY on sa8775p platform.
>>>
>>> Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
>>> ---
>>> v2: No change
>>>  
>>
>> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> So, is it reviewed or acked?

After a thorough review, it has been acked

Konrad
