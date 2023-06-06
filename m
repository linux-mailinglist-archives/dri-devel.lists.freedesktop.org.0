Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EFD723F90
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 12:33:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA6E10E0B9;
	Tue,  6 Jun 2023 10:32:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC4E10E0B9
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 10:32:56 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1q6Tze-0000VO-4a; Tue, 06 Jun 2023 12:32:50 +0200
Message-ID: <f55d98c0-69c8-23d6-1b07-57597f4d4066@leemhuis.info>
Date: Tue, 6 Jun 2023 12:32:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] Revert "drm/msm/dp: set self refresh aware based on PSR
 support"
Content-Language: en-US, de-DE
To: Johan Hovold <johan@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230523151646.28366-1-johan+linaro@kernel.org>
 <ZH2ys6dVeL02JLCU@hovoldconsulting.com>
 <CAA8EJprBNzw4o4m0sn2OoOqnwioQWNcTPcKoKGqxLWGc_8xjWA@mail.gmail.com>
 <ZH22jMTq6fi8iBpe@hovoldconsulting.com>
From: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <ZH22jMTq6fi8iBpe@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1686047576;
 786e9832; 
X-HE-SMSGID: 1q6Tze-0000VO-4a
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, regressions@lists.linux.dev,
 Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Vinod Polimera <quic_vpolimer@quicinc.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 05.06.23 12:18, Johan Hovold wrote:
> On Mon, Jun 05, 2023 at 01:05:36PM +0300, Dmitry Baryshkov wrote:
>> On Mon, 5 Jun 2023 at 13:02, Johan Hovold <johan@kernel.org> wrote:
> 
>>> Virtual terminals are still broken with 6.4-rc5 on the Lenovo ThinkPad
>>> X13s two weeks after I reported this, and there has been no indication
>>> of any progress in the other related thread:
>>>
>>>         https://lore.kernel.org/lkml/ZHYPHnWoDbXB-fqe@hovoldconsulting.com
>>>
>>> Seems like it is time to merge this revert to get this sorted.

BTW, thx for bringing this to my attention!

>>> Rob, Abhinav, Dmitry, can either of you merge this one and get it into
>>> 6.4-rc6?
>>
>> Rob sent the pull request few hours ago, see
>> https://lore.kernel.org/dri-devel/CAF6AEGuHujkFjRa6ys36Uyh0KUr4Hd16u1EMqJo8tOZ3ifVubQ@mail.gmail.com/
> 
> Ok, so you guys went with the module parameter hack. Whatever. As long
> as the regression is finally fixed.

Yup. Let me tell regzbot about the fix:

#regzbot fix: drm/msm/dp: add module parameter for PSR
#regzbot ignore-activity

> Next time, some visibility into your process would be appreciated to
> avoid unnecessary work.

Yeah, that's something we IMHO sooner or later need to improve for all
of kernel development -- among others to give people that find existing
bug reports a chance to find patches that were posted or applied to
address the issue (and of course reporters also, like in this case).

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

