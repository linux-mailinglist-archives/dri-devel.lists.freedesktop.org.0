Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD06591655
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 22:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25643B1057;
	Fri, 12 Aug 2022 20:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE29E14B170;
 Fri, 12 Aug 2022 20:31:01 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id 202so1677125pgc.8;
 Fri, 12 Aug 2022 13:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc;
 bh=VQTwmgbULdrb/KYHoxgQ4q38dOU+h7WsozErL3JrEuw=;
 b=X703rBkC0IpOWzSdmX19HRJnHxncorPjeyOlJcX7XiqrCAwAqMqLdQ+LGcEvvDEXXP
 LRGN86VIyhtMLGcrESY4Ct+LGaKzvaqTRZluZaKAuphqLii+4WFeTB5vsTvBsMvpGAkY
 QXHRTY1//Qu2UnWttyUX2mcOW0RGCWNYXEv7eHTgDXtyhh9F5pa8asIAktebOlHYkpug
 h6ZBgJMH1SlEkz93X8zs6oqaZHCB4qn3sZ1V9rIFijM0SyZpDB4SwUTaSBZlEKP6xc2J
 k/jcyc59NdVQJw9iJshUbK5sbozNGe1EpA0PizlXesUeLKGXnVbGMgfGFLisbTf31+BZ
 YweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc;
 bh=VQTwmgbULdrb/KYHoxgQ4q38dOU+h7WsozErL3JrEuw=;
 b=Rbfu00RnDf7wygTc0T2ePtCwC1+QISk2aaWXOCMiItCJ39E5VRlzBxViQATvEH4MHj
 h5D4RD/trEa9MBBLSEGEsOm1+ifbmoH5l8GGzzzN0gdQ+yvtdEqgzsDasgVJqPLkvMl4
 H1RIlGBxq2gBfTZ0FKCdPSBr7uxvk1dnJUppBSMS3AxUm35uBwsLyplOhvZcOFoWoV6S
 2d3OOc8D7z27iNvQHRxUg/dJHJzmzmgjZherq4krKb89woQlbUpWyxQUZWS2JRCA0L7f
 duBBrTccE4PFLwKlD2S/FCpMrcPTHTkUVWWsHIfCx6HtZAqPtngUjMUFi6m5cZJ/7W1D
 lLQw==
X-Gm-Message-State: ACgBeo3dOpP9n19nKt9kwsjKfOMpeqsqn9TTxdLbMQSQtqEqvNsUt7l3
 181DoAUU+buLWpmMM00wcQg=
X-Google-Smtp-Source: AA6agR6qCqB6ar2BvdhYE1UpaOUZa1ZEXPztDmeiWKjfV6e0r8jXmpLjHrMIjHHDJhTwIj3RMy0UCg==
X-Received: by 2002:a05:6a00:23c1:b0:52e:28f5:4e13 with SMTP id
 g1-20020a056a0023c100b0052e28f54e13mr5492191pfc.20.1660336261014; 
 Fri, 12 Aug 2022 13:31:01 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:aae])
 by smtp.gmail.com with ESMTPSA id
 z127-20020a623385000000b0052d432b4cc0sm2031289pfz.33.2022.08.12.13.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 13:31:00 -0700 (PDT)
Date: Fri, 12 Aug 2022 10:30:59 -1000
From: Tejun Heo <tj@kernel.org>
To: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: Selecting CPUs for queuing work on
Message-ID: <Yva4g3V2jAP0NKcY@slm.duckdns.org>
References: <82233e68-106f-39e9-b20d-7794eb7a8933@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82233e68-106f-39e9-b20d-7794eb7a8933@amd.com>
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
Cc: Philip Yang <Philip.Yang@amd.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 12, 2022 at 04:26:47PM -0400, Felix Kuehling wrote:
> Hi workqueue maintainers,
> 
> In the KFD (amdgpu) driver we found a need to schedule bottom half interrupt
> handlers on CPU cores different from the one where the top-half interrupt
> handler runs to avoid the interrupt handler stalling the bottom half in
> extreme scenarios. See my latest patch that tries to use a different
> hyperthread on the same CPU core, or falls back to a different core in the
> same NUMA node if that fails:
> https://lore.kernel.org/all/20220811190433.1213179-1-Felix.Kuehling@amd.com/
> 
> Dave pointed out that the driver may not be the best place to implement such
> logic and suggested that we should have an abstraction, maybe in the
> workqueue code. Do you feel this is something that could or should be
> provided by the core workqueue code? Or maybe some other place?

I'm not necessarily against it. I guess it can be a flag on an unbound wq.
Do the interrupts move across different CPUs tho? ie. why does this need to
be a dynamic decision?

Thanks.

-- 
tejun
