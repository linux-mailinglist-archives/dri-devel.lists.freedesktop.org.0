Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E287812FE9
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 13:20:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C08D10E134;
	Thu, 14 Dec 2023 12:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A9510E134
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 12:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1702556407;
 bh=fgHNtNa0Y2jcE1vKuS2Ne5beDsOhCuFBl3Lg2aHl+4I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=xlbqoQR0RV0QPXK4WqMGjPknbIWw6aufiZvPShpga8C5KvXbB+c+PJzO/7U7h3wxY
 CW9ijg5onWXbhVi2q3MSK4w1oiHQt3B4rjfCsNkosmWOAs0eseC8MoFRPznMn/baxz
 e6943TCudUzRXH8Mf5na3Qh9THcxrvyqcJV0yGD3QLEEsJdKTRvJE6sra2LhSEAV2z
 aq0wbjtT9fJxDH8d4Ls7NRp9IanMpN7IBndP7S46i/XXYsyOQOVJ1eNtKgAZUSl36o
 NGCKkYcAMDbxs1UDWudpAwSbKpy18pyZL6cH7aAjiPHnOASpw+t5e2dQDyC8co2Xqn
 mXG7e7bN9zH0g==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id C0FFC37809D0;
 Thu, 14 Dec 2023 12:20:04 +0000 (UTC)
Message-ID: <e747581b-d5e0-4622-827b-48fb51fa9711@collabora.com>
Date: Thu, 14 Dec 2023 09:20:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ci: uprev mesa version: fix kdl commit fetch
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vignesh Raman <vignesh.raman@collabora.com>
References: <20231212160448.883358-1-vignesh.raman@collabora.com>
 <CAA8EJpro5Hb0yRaxPWzBQBikKjw9JnNVkUuPFvWeXjegzCuxHw@mail.gmail.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <CAA8EJpro5Hb0yRaxPWzBQBikKjw9JnNVkUuPFvWeXjegzCuxHw@mail.gmail.com>
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
Cc: daniels@collabora.com, emma@anholt.net, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 david.heidelberg@collabora.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 14/12/2023 05:00, Dmitry Baryshkov wrote:
> On Tue, 12 Dec 2023 at 18:04, Vignesh Raman <vignesh.raman@collabora.com> wrote:
>>
>> build-kdl.sh was doing a `clone --depth 1` of the default branch,
>> then checking out a commit that might not be the latest of that
>> branch, resulting in container build error.
>>
>> https://gitlab.freedesktop.org/mesa/mesa/-/commit/5efa4d56 fixes
>> kdl commit fetch issue. Uprev mesa in drm-ci to fix this.
>>
>> This commit also updates the kernel tag and adds .never-post-merge-rules
>> due to the mesa uprev.
>>
>> Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> 
>> ---
>>   drivers/gpu/drm/ci/gitlab-ci.yml | 14 ++++++++++++--
>>   1 file changed, 12 insertions(+), 2 deletions(-)
> 
