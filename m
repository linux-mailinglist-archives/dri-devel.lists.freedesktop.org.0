Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9A358CD39
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 19:59:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CCDF10FE09;
	Mon,  8 Aug 2022 17:54:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 674F710F5E7
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 13:39:15 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id gj1so8858833pjb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Aug 2022 06:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:user-agent:references:message-id:in-reply-to:subject
 :to:date:from:from:to:cc;
 bh=8iifaV+8MVmiI4Q6s1LNqii3vIk7Vj/dQwIhaILr6b0=;
 b=gMP0UYPcKlcW+vRAjudk92o2bp/xzK30lmKfhTNGH/UDjm34i1zJVUlqjsQSikvThh
 KulflxxlArGj/RFhTh7XjOfCFNUqPIQdTUnpJQl1HkfvpPTtMDFwXWrrIdaNPR6kaeWz
 x4v0bDeez2bUuHZX2Lm7fdrUlPfgmjgfTcezObB3R73crfoBezOzQe67CqozrkdcbuMi
 UBZtTJNsdsOwMkuEHTfIF7vUvzIq/n5roRAMGDG5weruLAwn/DXmSCrJ2oH39uOVHpMR
 82s0wgHF4b5ETveswqCX3j5Hutk9VL29eAuY6jnrUPii4x3rFM8FpPgbnTf1jpQ2rOXs
 zpYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:references:message-id:in-reply-to:subject
 :to:date:from:x-gm-message-state:from:to:cc;
 bh=8iifaV+8MVmiI4Q6s1LNqii3vIk7Vj/dQwIhaILr6b0=;
 b=eeX19a+J6ivfg9VvRcNmbBxlUyt3KplSPYAc+zzLaH+/QfZy2mP33NTbRC5pcJF5aN
 YwgpEelYPU2S8Oq6MOuA7k8IZ1qDXJaCSCZgqPy+9BF6irenCnZUI9W6deNGfT94VRS7
 SWdTjBFSqd0wJWdAA1Nho6opu/3AiAOr1jiJQypc03JBoeMTwCAXncUz8Sx5ZGFUTV6D
 F8afQ3Lfgg8Vq3iSBzRLK2yT34J8pMEfGOVIVtnRpooZXI34WQKJnjrNmeveBLig9gI+
 hZXzJRySpJwEW3eRMO99565jNw4jlIH20xrqxR3fb2/6jrEAaaxzEkGMXeS+0I7jiuEI
 W7CA==
X-Gm-Message-State: ACgBeo26WLd+1++CCsgBDBsr1li3jH2wM9bDY720LursmqgoVNwIp76R
 P6DGDB1oIQu/GHsZf6udJR0=
X-Google-Smtp-Source: AA6agR4UYHF5ZSW7qtpsH4e40VJZ2WfJzBlvpQNNt/80FcG0PQZDzSvCKZNgnDC2zS11FvdNc/H6Dw==
X-Received: by 2002:a17:902:db08:b0:170:9ba1:92e9 with SMTP id
 m8-20020a170902db0800b001709ba192e9mr7447409plx.45.1659965954786; 
 Mon, 08 Aug 2022 06:39:14 -0700 (PDT)
Received: from robin-HP-ZBook-15-G3 ([2409:11:2360:3e00:49bb:2134:3324:6c70])
 by smtp.gmail.com with ESMTPSA id
 b16-20020a170903229000b0016d3ee4533csm9045690plh.18.2022.08.08.06.39.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 06:39:14 -0700 (PDT)
From: Robin Reckmann <robin.reckmann@googlemail.com>
X-Google-Original-From: Robin Reckmann <robin@robin-HP-ZBook-15-G3>
Date: Mon, 8 Aug 2022 22:38:04 +0900 (JST)
To: Wolfram Sang <wsa@kernel.org>, 
 Robin Reckmann <robin.reckmann@googlemail.com>, 
 Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, 
 Robin Reckmann <robin.reckmann@gmail.com>, linux-arm-msm@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] i2c: qcom-geni: Fix GPI DMA buffer sync-back
In-Reply-To: <YvClCC4ArBEjQJl9@shikoro>
Message-ID: <alpine.DEB.2.22.394.2208082230340.8545@robin-HP-ZBook-15-G3>
References: <20220807140455.409417-1-robin.reckmann@gmail.com>
 <YvClCC4ArBEjQJl9@shikoro>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Mailman-Approved-At: Mon, 08 Aug 2022 17:54:33 +0000
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



On Mon, 8 Aug 2022, Wolfram Sang wrote:

> On Sun, Aug 07, 2022 at 11:04:54PM +0900, Robin Reckmann wrote:
>> Fix i2c transfers using GPI DMA mode for all message types that do not set
>> the I2C_M_DMA_SAFE flag (e.g. SMBus "read byte").
>>
>> In this case a bounce buffer is returned by i2c_get_dma_safe_msg_buf(),
>> and it has to synced back to the message after the transfer is done.
>>
>> Add missing assignment of dma buffer in geni_i2c_gpi().
>>
>> Set xferred in i2c_put_dma_safe_msg_buf() to true in case of no error to
>> ensure the sync-back of this dma buffer to the message.
>>
>> Signed-off-by: Robin Reckmann <robin.reckmann@gmail.com>
>
> Thank you! What would be a Fixes tag for this?
>
>
Thanks for having a look!

Fixes: d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")
