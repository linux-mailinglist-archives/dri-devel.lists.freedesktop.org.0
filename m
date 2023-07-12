Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F2674FF43
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 08:30:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA82A10E490;
	Wed, 12 Jul 2023 06:30:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5636F10E490
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 06:30:17 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-31441bc0092so6506776f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 23:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689143415; x=1691735415;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uxEaWwLWc+hET0h2ug0P32dKE47X3QWgDKWE9FH9+fo=;
 b=UGg8jCMk6ynJOyfH4RBv2S99OtAXpP9hX/3eQQHJgFiMMsIAwm9P/FfdSEvEUs/Rc5
 OjfHXG/bb3KqBmOC5rbHTZDSPC2fo/g+kj9jOgZGUYR3hFfQFJ9k0PjONKxmgnnEKfJI
 TH0fCjHCB79ifCpnE6TSvQfctd1TPpfVPyA+xI1seFBPAUGPNu5Kbdp22cA2tb8sSTqm
 UT0Um28/Fm0VRPalVWmfNVKioQhY0y6/Dxlhg1aGRZodK7BtsUfHrxA/77o3qCAjeIFL
 88UF9mN8TjXah8wD8GqOpY0EAfMs8JDe7vAEl72Ex7U+Pyd68uWGFuPk78gUm4efLuNZ
 9PSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689143415; x=1691735415;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uxEaWwLWc+hET0h2ug0P32dKE47X3QWgDKWE9FH9+fo=;
 b=Oqu+zVp5AoypMNmBZKqdgXSHYkwRHWtsx5pDCBgYbjjZX+LpP2RHektDEl4qWMGgIN
 UCgNNSD5dSoZ/W93/ouBz7IeNgAZxx4mJ/2W76tLeGHGCV0lFNaAaIm69OKAepfTKWcG
 sbuLd0l+b/nMf1nlgXIParfqlZxTEs47I9b3gppPtcc+5XgSSD/mq7C/B+sx4J3jj0oy
 LLg6mvcP7I5XKSGg/Z4iJjQyDaZ7TIb3lgQMcX8xwebk8ckmwQriX5erYxct/YDIbDPe
 h9AbY3dqzyZBpPvaPt7wZBWd7IGkdTv8Uk5C2x8VLvFIDLA8tNiT7wSeVByLT4xxNauI
 05BQ==
X-Gm-Message-State: ABy/qLajbjns461jGpFsrwaY7QexTodOkrWMNhXAXGBQ4nhHP7S69T5Y
 Tk7+A8KVgxq7BeshcDjs+ecM+g==
X-Google-Smtp-Source: APBJJlHGmnVc3EpBQwXKiOhdyq/llV8bMmbe8E+i7Qo5aLAq8hkemnOpVTPP7cuECqjzs2xq6j9Nqw==
X-Received: by 2002:a5d:590f:0:b0:313:e971:53af with SMTP id
 v15-20020a5d590f000000b00313e97153afmr15585202wrd.32.1689143415239; 
 Tue, 11 Jul 2023 23:30:15 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 o18-20020adfe812000000b00314417f5272sm4085101wrm.64.2023.07.11.23.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 23:30:12 -0700 (PDT)
Date: Wed, 12 Jul 2023 09:30:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH 0/5 v4] accel/qaic: Improve bounds checking in
 encode/decode
Message-ID: <9af2a1c9-a59a-4f7e-a195-82cf5cbd68c9@kadam.mountain>
References: <6e935c70-5bd2-4808-bdd9-d664f892b0b5@moroto.mountain>
 <0919d2f7-dbb3-2e8b-adb7-f836b21e6482@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0919d2f7-dbb3-2e8b-adb7-f836b21e6482@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Carl Vanderlip <quic_carlv@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 11, 2023 at 11:33:25AM -0600, Jeffrey Hugo wrote:
> On 7/11/2023 2:20 AM, Dan Carpenter wrote:
> > Fixed in v4: Send the correct [PATCH 1/5] patch.
> > 
> > Fixed in v3: Redo messed up threading
> > 
> > Fixed two things in v2:  Include the <linux/overflow.h> file.  Change
> > the >= in encode and decode to >.
> > 
> > regards,
> > dan carpenter
> 
> Did you intentionally drop tags from previous versions?

Sorry, I kept messing up the resends.

> 
> For 1-3, 5
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> 
> Looks like 3,5 are reviewed by Pranjal and also good. I see 5 is also
> reviewed by Dafna.  Expect those to be merged.  1,2 need a review from
> Pranjal, but I expect all is good and will be merged.
> 
> I did not see feedback on my question for 4.  Would like your feedback
> before queuing that one up.
> 

Sorry, again.  Yeah.  I think you're right.  Could we queue the rest and
I will resend 4 separately?  I know it's a headache.  If not it's fine,
I can resend them all.

regards,
dan carpenter

