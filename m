Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB8E745B8F
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 13:49:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AAE810E0E4;
	Mon,  3 Jul 2023 11:49:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0FC110E0E4
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 11:49:47 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3142ee41fd2so1760085f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jul 2023 04:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688384985; x=1690976985;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mUBgoT7oVrf5ARJFXEG8sPNkl4O0ByWy9s6zR1XPvdM=;
 b=JXcdBFyM3Qs+lsRM9BvTWkrCfMWUYRpEpsGFVZXP+OgzaoH2UDXPuJsTsrEwzE+uPl
 oYI2Mn6ybAmxtuacDn4R7AQ+10ueCO7wYM54AXOwSftk0opUXHSUHtRtOmpZBGUknuFK
 WL/d43T1/F9kM3CrfUTvOsJcASXXIpycMrSivyIHNSDs9bpSRO946zK7wYj2hE63o6+R
 k/L+/0Uph48VjmV+4UI58WeajixHsZRNK40nLSWejJsA2eyNl08zCl40CDrlP/8M5ABD
 y3tJOd9B18YD5siqUQUSfdtmC9c9FXrKTA4w2PaKM4zsiIyDKmpvEEpuyWkmKCYmKAhI
 p8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688384985; x=1690976985;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mUBgoT7oVrf5ARJFXEG8sPNkl4O0ByWy9s6zR1XPvdM=;
 b=bKLp4uw7LTcuT7N4OGax8t+I9QjqcBJ8OifsW2hmbFvqhYyt4/lEmFrYJ2D8/D3RCU
 gZuX8V2tH49y7IQvmPdm+C7UodF3dowInrB6+PtDwDQohhlP0D4dslHHp5GMqZUP4X9e
 tndQYEYC7t5DZYjN0Uga6f0nqOqtUgKiaWLtTzWK/j+th2z/+dgtpRRnGFWbtF2l930+
 KSxwKEmnVk2Ms/irEK/RZRU5XcpJcPiYH6ypeXmE8Y0hVj3+jVA21ifYIZ7me1C247TN
 IJIhFIRtUE5iTK0qUvGcjadHSxzIU6Qj29pyF8U4h2f3aBFVAP8DPCfJfE4LPQFicbR0
 4EAg==
X-Gm-Message-State: ABy/qLa/ZEDb34DsOKL3LCx/UpWQLLw+fT4cd/wrnUzBsAVVF3UA+5ru
 5O4FLUN9RFEw0+95pk90F9Q=
X-Google-Smtp-Source: APBJJlGPnPorxdrkluwOr9ke4FFLeVbf2WqMQOz3pcfjeA2LfYHKPgn/SSZ2U9KlYrIwWpv319AGYw==
X-Received: by 2002:adf:f246:0:b0:314:13a4:f36d with SMTP id
 b6-20020adff246000000b0031413a4f36dmr7632333wrp.12.1688384985419; 
 Mon, 03 Jul 2023 04:49:45 -0700 (PDT)
Received: from ?IPV6:2a00:e180:15db:7000:52d4:e05:b365:ad25?
 ([2a00:e180:15db:7000:52d4:e05:b365:ad25])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a5d4c83000000b0030497b3224bsm25230391wrs.64.2023.07.03.04.49.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jul 2023 04:49:44 -0700 (PDT)
Message-ID: <c1403d54-b43a-0ecb-9046-a0b4d35215e1@gmail.com>
Date: Mon, 3 Jul 2023 13:49:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] dma-buf: keep the signaling time of merged fences v3
Content-Language: en-US
To: Luben Tuikov <luben.tuikov@amd.com>, juan.hao@nxp.com,
 dri-devel@lists.freedesktop.org
References: <20230630120041.109216-1-christian.koenig@amd.com>
 <5d7578de-13a1-35e3-f751-187d15e50b77@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <5d7578de-13a1-35e3-f751-187d15e50b77@amd.com>
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

Am 30.06.23 um 19:19 schrieb Luben Tuikov:
> On 2023-06-30 08:00, Christian König wrote:
> [SNIP]
> ---
> Silly question perhaps:
> 	Could we not have returned an existing (signalled) fence with
> the wanted timestamp (when count == 0), as opposed to allocating a stub? Maybe
> allocation should be avoided?

No a silly, but a very good question.

Answer is yes, that's what we have done previously. Problem with that 
approach is that each fence reference prevents the driver who originally 
issued this fence from being able to unload.

That's especially ugly in cases of hotplug because you have to keep a 
zombie driver instance around for potentially quite some time.

Regards,
Christian.
