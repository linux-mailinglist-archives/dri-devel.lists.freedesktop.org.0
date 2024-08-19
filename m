Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AE49568D8
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 13:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 447FA10E221;
	Mon, 19 Aug 2024 11:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aMaq2hqL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D4D210E221
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 11:00:18 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a7aac70e30dso446710566b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 04:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724065216; x=1724670016; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1lXa8K7TtsrCVZWRZcEXmvWs4ZDDX/ZdvKFtCElTbnI=;
 b=aMaq2hqLeEmO7vWckvbtY7YFQONlOb+zgMkR9xW7dfrb/ss/B33YXp6M+zuv/Tjhvg
 gUl8LzweU87amKHYkM/ppZm3RFTpvWRBA9rWtISixkM6cOf/EjUuEwqI2xm6BVP3qra/
 sIQBa8FtvyAJ6a9ZFCEYJ3V7S2r0V5U/uW0b6GeGThBxyY9LBIpsr7M5zKBHGnwyn54a
 PQrXTCQ8oIrGYuiLpqX1iDu8kXtdJafCe7FxAqCWcV77cPeVvDzvNnGOCFc7x3LXnyAb
 t9HX6uLbxJJs0SxpwHXtXuC9q9FFkr0Liy2PtGXRIQ+tTO0esezn6JEzew/MGWHDVEaO
 7GHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724065216; x=1724670016;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1lXa8K7TtsrCVZWRZcEXmvWs4ZDDX/ZdvKFtCElTbnI=;
 b=uNd/QPcFqGzzxQWRLTIdLQGivEIBD0STnzLt/dHMPvxHXP05Nwp2bgDge6NieZGyzJ
 aamm4oPeMyO5BPAeSSajN59dfejjabzpBDRN9PvHJDnPNeN+j1J4fCw7IqR2McjAyNX7
 ++ipHz5FquD36nQ5KecJXFzz7cDDSR375KQmtgJa+8MoT/Er2nAAxPm7UkComgbdK656
 P1WO+Hry1n2tlKchxazdh9l/NJtN7emNWSwpMHHDWtvpF0lcsQxnl2j1cjKYOY0rJ5Aq
 S0FP48LQY+vaf9VKaPBW9AkXpkg0LAD4TGFJgKD26d9TaNJMmw46n3Z+8Nc0MaeyPeBF
 enVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKemP7a7CzrxRfkHN/exBFtQRjw8Ee7bNk0dPsnO9j9YwU7FHXaZirkrYMJTVMpVczaoJ7xh/nAXYW+0z6Ld5tui81JBrlp+UEwp9o29CA
X-Gm-Message-State: AOJu0Yz8lobd/j0U9TigOeLp18K/3JXblXkRMtOyvOVFlRu4x0epFckO
 G8mEo8GS40HTH7x7SXhzKfvffgnJHAjIHOub5iyI/Yzogj3vpLoDIp758TeS/c4=
X-Google-Smtp-Source: AGHT+IEzJ/xPUzRYiH9pYjaAeS0i2qOCO9pUydux+q2CLHGqlZnNQh/yZIQ6jZsMA2jAUinANtk5Yg==
X-Received: by 2002:a17:907:94d2:b0:a77:c330:ad9d with SMTP id
 a640c23a62f3a-a8392a41115mr774140566b.61.1724065216137; 
 Mon, 19 Aug 2024 04:00:16 -0700 (PDT)
Received: from ?IPV6:2a02:8109:aa0d:be00::676e? ([2a02:8109:aa0d:be00::676e])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83838cfaffsm621879866b.76.2024.08.19.04.00.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 04:00:15 -0700 (PDT)
Message-ID: <c575a775-1596-41d3-a4c4-b356406d7819@linaro.org>
Date: Mon, 19 Aug 2024 13:00:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] misc: fastrpc: Trigger a panic using BUG_ON in device
 release
To: Abhishek Singh <quic_abhishes@quicinc.com>,
 srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_ktadakam@quicinc.com,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org
References: <20240730070945.4174823-1-quic_abhishes@quicinc.com>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20240730070945.4174823-1-quic_abhishes@quicinc.com>
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

Hi Abishek,

On 30/07/2024 09:09, Abhishek Singh wrote:
> The user process on ARM closes the device node while closing the
> session, triggers a remote call to terminate the PD running on the
> DSP. If the DSP is in an unstable state and cannot process the remote
> request from the HLOS, glink fails to deliver the kill request to the
> DSP, resulting in a timeout error. Currently, this error is ignored,
> and the session is closed, causing all the SMMU mappings associated
> with that specific PD to be removed. However, since the PD is still
> operational on the DSP, any attempt to access these SMMU mappings
> results in an SMMU fault, leading to a panic.  As the SMMU mappings
> have already been removed, there is no available information on the
> DSP to determine the root cause of its unresponsiveness to remote
> calls. As the DSP is unresponsive to all process remote calls, use
> BUG_ON to prevent the removal of SMMU mappings and to properly
> identify the root cause of the DSP’s unresponsiveness to the remote
> calls.

Could you elaborate a little about what contexts this can happen? What 
SoC/board are you hitting this on? Is it running pre-production firmware?

Since fastrpc is not at all required for basic functionality of the 
device, maybe it would be better to print an error here and then prevent 
trying to open new connections to the DSP?

Kind regards,
> 
> Signed-off-by: Abhishek Singh <quic_abhishes@quicinc.com>
> ---
>   drivers/misc/fastrpc.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 5204fda51da3..bac9c749564c 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -97,6 +97,7 @@
>   #define FASTRPC_RMID_INIT_CREATE_STATIC	8
>   #define FASTRPC_RMID_INIT_MEM_MAP      10
>   #define FASTRPC_RMID_INIT_MEM_UNMAP    11
> +#define PROCESS_KILL_SC 0x01010000
>   
>   /* Protection Domain(PD) ids */
>   #define ROOT_PD		(0)
> @@ -1128,6 +1129,9 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
>   	fastrpc_context_get(ctx);
>   
>   	ret = rpmsg_send(cctx->rpdev->ept, (void *)msg, sizeof(*msg));
> +	/* trigger panic if glink communication is broken and the message is for PD kill */
> +	BUG_ON((ret == -ETIMEDOUT) && (handle == FASTRPC_INIT_HANDLE) &&
> +			(ctx->sc == PROCESS_KILL_SC));
>   
>   	if (ret)
>   		fastrpc_context_put(ctx);

-- 
// Caleb (they/them)
