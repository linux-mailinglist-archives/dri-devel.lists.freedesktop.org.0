Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 651ED190236
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 00:47:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C2989D66;
	Mon, 23 Mar 2020 23:47:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB3889D66
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 23:47:05 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id m17so10381699wrw.11
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 16:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+Zr9qcHq5y8v0jThe/WWyaqO7oP7gE0Cdv/Ee5i7EWQ=;
 b=HUPCw03F9IagJewNZMt+CBzag/gn3CuWXlyYp31KUMFyeNikUKM/uQhMHSWhyyZX0v
 A0YLrYPzzJtU46IcTEqNmI6j/31wqMOh6WveVCo7oHB6MzIBqAhv4LQGmKINMCwX+r+C
 llBFA9cGXGvndNjIbiyL9/UUHeycDE3pPtlli6lCKEcmsuTmEdeix6SH6URZQb/om7to
 F8jVMEN9NH3pWp30rFVOZDSqmzbTgFGZ3GLH7C2W6UHcuVXgNNYu40oyuf/qXjXente/
 pc2kTMwlauvIYWFtXGgGNN6N5laDXD4hRKjFk5JVHLIG2SXFrATU2/+gOWqHQuXNqObs
 qmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+Zr9qcHq5y8v0jThe/WWyaqO7oP7gE0Cdv/Ee5i7EWQ=;
 b=UJeDb5Fo6DVcdsAkRx6EiLGqGILDgpzwi0mdurNzjCqgyS0JMa6HINbMz09llYuikI
 O2P+OWBL1F4KVAs2HKY8FkOlZAFtAk7+y7uc3bCTWZHczzYR+dXgL1A2hk5jqNkj9Y2V
 Abddo23mhPm0m8xhqUpCtsX1TKO2xpmNoYzsSLtDrxlzsaO9k3Jo29vVgvBFFiPXwSat
 fKXOapUF7QM2v4Jf0lG1BRInx1q3/rzoTcFXVXJvpG4EW1KR7d3fljmqLXBbkErymNPG
 Pd/tTeRnAqTDNZhhwLBvBCmhzYXj6OqrGO9aFpEhZESjvgKM/PHJ/zO+OhfWQI/QXnt+
 eAVQ==
X-Gm-Message-State: ANhLgQ3SQf4xG0SHiyxlkANiLTnaqj6s0nCc5EGeO2ACVs91zohbO3Yf
 EjHgKUiSehsJd55kHjKh0EI=
X-Google-Smtp-Source: ADFU+vvKDmarCvhfywojBtnIjDEcr09tkcBmbGBfQ7qt+H61NUDcRD7aSYo7jHfUrMRYnh3Mv+rhKw==
X-Received: by 2002:a05:6000:1212:: with SMTP id
 e18mr34724097wrx.371.1585007224445; 
 Mon, 23 Mar 2020 16:47:04 -0700 (PDT)
Received: from [192.168.1.125] (46-126-183-173.dynamic.hispeed.ch.
 [46.126.183.173])
 by smtp.gmail.com with ESMTPSA id z19sm4830114wrg.28.2020.03.23.16.47.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Mar 2020 16:47:03 -0700 (PDT)
Subject: Re: [git pull] feature/staging_sm5
From: Roland Scheidegger <rscheidegger.oss@gmail.com>
To: Dave Airlie <airlied@gmail.com>
References: <20200320225659.8431-1-rscheidegger.oss@gmail.com>
 <CAPM=9tyfeZEy==Aq0U0y8nB=ct2S1JCCriN9CwoKS8gXZ6-e2Q@mail.gmail.com>
 <59050049-7fb4-b3c1-c9f3-df1bf26d2e4e@gmail.com>
Message-ID: <1a637628-c787-537e-7a68-76e5b45c48d7@gmail.com>
Date: Tue, 24 Mar 2020 00:47:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <59050049-7fb4-b3c1-c9f3-df1bf26d2e4e@gmail.com>
Content-Language: de-DE
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
Cc: Dave Airlie <airlied@redhat.com>,
 Linux-graphics-maintainer <linux-graphics-maintainer@vmware.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.03.20 um 19:43 schrieb Roland Scheidegger:
> Am 23.03.20 um 01:36 schrieb Dave Airlie:
>> On Sat, 21 Mar 2020 at 08:57, Roland Scheidegger (VMware)
>> <rscheidegger.oss@gmail.com> wrote:
>>>
>>> Dave, Daniel,
>>>
>>> vmwgfx pull for for 5.7. Needed for GL4 functionality.
>>> Sync up device headers, add support for new commands, code
>>> refactoring around surface definition.
>>
>> Two things,
>>
>> 1.for some reason patchwork didn't process this, Daniel might be able
>> to tell me why I forget who to ask everytime :-)
>>
>> 2. Not sure how happy fd.o gitlab is to host kernel trees, might be
>> safe to stick to old school anongit until we work it out.
> Alright I put it up here now (after fiddling with it for a long time I
> figured out how to do it...):
> https://cgit.freedesktop.org/~sroland/linux/

Ok I'm sending out a new pull request.
I've sent out a second version, with fixed r-b and s-o-b email addresses.
Patchwork now seems to have picked it up (even the first series?).

Roland


> 
> 
>>
>> I'm happy to process this but it should be in patchwork so we can make
>> sure the process is followed.
> Ok I guess I did something wrong but I really need to know what :-).
> Sorry I'm new to this workflow.
> 
> Roland
> 
>>
>> Dave.
>>>
>>> Preliminary mesa userspace code using these new vmwgfx features
>>> can be found at: https://gitlab.freedesktop.org/bhenden/mesa
>>>
>>> The following changes since commit dad569af718c4e603c35f59ed03bf0555633dd95:
>>>
>>>   drm/vmwgfx: Refuse DMA operation when SEV encryption is active (2020-01-28 09:27:45 +0100)
>>>
>>> are available in the Git repository at:
>>>
>>>   git@gitlab.freedesktop.org:sroland/vmwgfx_drm.git feature/staging_sm5
>>>
>>> for you to fetch changes up to 4526035058cc6cc09afbca3a5d86862438ae1edf:
>>>
>>>   drm/vmwgfx: Use vmwgfx version 2.18 to signal SM5 compatibility (2020-03-20 23:35:53 +0100)
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
