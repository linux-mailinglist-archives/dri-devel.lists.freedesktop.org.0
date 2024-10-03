Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C09CB98F6C6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 21:09:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0335110E8ED;
	Thu,  3 Oct 2024 19:09:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VZbyYNRi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7700510E8ED;
 Thu,  3 Oct 2024 19:09:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 30E61A4439E;
 Thu,  3 Oct 2024 19:08:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 397E3C4CEC5;
 Thu,  3 Oct 2024 19:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727982546;
 bh=A1mk0jpO/HJnFIGMhh2gBHVnCw9aebL7CYqdU1X6hUU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VZbyYNRi1lCjV8blElcJnTdLnmfLBhbJsJSoklWSGdL+QYNm5c+S3tEiJNrz8ArAw
 xO5kQx9pnEMbsTfI2QP4m/mUzpFeWykvl195M3G0g4IUakSvZDCuEeOsOS6c2DYtb3
 7NGdR9Smj/2tQ8wb6LvermzG1+iSjJMMsXNL1FWB1Ek+UD45GGgbufxzKA59enfDxP
 N6+6Sd1brk9wH3EfYW4EmLP0Wsr0geK+vcNxDK4ftGp23HhpvN0zAelGktAqBanSSH
 KQ3qh60kICSftkZQ/0Dwv2xvwuyEkoaroYusMOUqjP7V8ymA5UGb2R3e6a4QpIeupZ
 oiwNNchrhcgQw==
Message-ID: <e9a05386-54d8-4a18-8b16-4e871de094a4@kernel.org>
Date: Thu, 3 Oct 2024 21:09:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] drm/nouveau: Avoid -Wflex-array-member-not-at-end
 warning
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <ZsZLFS1CsHkKjw+C@elsanto>
 <ef5a8e6d-cb97-4872-901c-cf4bbec23be6@embeddedor.com>
 <30530165-0ea9-4f02-9d8c-e8abc9eda5a7@kernel.org>
 <035ae74b-5df5-493f-9835-02c1c30ccfcc@kernel.org>
 <45560975-7215-4205-8d3b-a01009c9b4f5@embeddedor.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <45560975-7215-4205-8d3b-a01009c9b4f5@embeddedor.com>
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

On 10/3/24 8:44 PM, Gustavo A. R. Silva wrote:
> 
> 
> On 03/10/24 12:36, Danilo Krummrich wrote:
>> On 9/13/24 12:23 PM, Danilo Krummrich wrote:
>>> Hi,
>>>
>>> On 9/13/24 10:09 AM, Gustavo A. R. Silva wrote:
>>>> Hi all,
>>>>
>>>> Friendly ping: who can take this, please? 🙂
>>>
>>> Usually, that's me. But I thought you might want to send a v2 based on Kees'
>>> comments?
>>
>> Do you plan to follow up on this? I'd prefer if we could get rid of the open-
>> coded "17". So, maybe just go with the define until we have something like
>> STACK_FLEX_COUNT()?
> 
> Do you mean the following define...?>
> nv50_hdmi_enable(...)
> {
> ...
> #define data_len    17
>      DEFINE_RAW_FLEX(struct nvif_outp_infoframe_v0, args, data, data_len);
> ...rest of function...
> #undef data_len
> }

Yes, it's not great, but I think it's better than having the length in two
places.

> 
> Thanks
> -- 
> Gustavo
> 

