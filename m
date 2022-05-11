Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6805230A1
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 12:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A2710E7DB;
	Wed, 11 May 2022 10:26:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org
 [IPv6:2001:67c:2050:0:465::202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A717A10E7DB
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 10:26:12 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4KyrfS4WZhz9spJ;
 Wed, 11 May 2022 12:26:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1652264768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y/E1vKB93vrG/DjRCzLKzwqBALm4NpArvjus/ourHbI=;
 b=k8G6LO/DA2hkLYEA4a/jti/zyEqH+lLwPnhhAIg00NLSzA8dFGBzwZhjEyddtDJLG3Vqtx
 3Hfgh/KESeU2q0Gw3XmFYEv5SohRvJ9OmQ0KtNd+AsM/0RZ4CtNKQKLVz3qvG7MNiLRA/8
 hV5lPw77oNCmAbG/y34GKc2R3BkkcJkYNWyp7x4MuZlJmMDy7hV6XZvhZ48GrkYg/y6kP/
 Pe25JiyS+7TgQAiMk6Nv3aOyN9XhrIOaN1xn89Fs+TB070DOxvp+q8L1+fIyUGWK67T+KX
 bnk1uVDGBkRI0+yZao76NBnnBcpEyLkexJXAszQCzAVpSOj9nfjih2CEcl0QKA==
Message-ID: <1255a66a-121d-988a-19a7-316f703cb37d@mailbox.org>
Date: Wed, 11 May 2022 12:26:05 +0200
MIME-Version: 1.0
Subject: Re: Adding CI results to the kernel tree was Re: [RFC v2] drm/msm:
 Add initial ci/ subdirectory
Content-Language: en-CA
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Airlie <airlied@gmail.com>
References: <20220510070140.45407-1-tomeu.vizoso@collabora.com>
 <20220510141329.54414-1-tomeu.vizoso@collabora.com>
 <CAPM=9tzLR-wsLhg2ikGjoK06s-ju5XWa1rtPPiUpN=pwD1vgtA@mail.gmail.com>
 <YntWQIXSqMCd6TYV@kroah.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <YntWQIXSqMCd6TYV@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: f1u1x9t1eq9gx7t66636ikwanw7e56pm
X-MBO-RS-ID: 8072a6e3cb6bccf98f1
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, Jonathan Corbet <corbet@lwn.net>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-05-11 08:22, Greg Kroah-Hartman wrote:
> On Wed, May 11, 2022 at 03:06:47PM +1000, Dave Airlie wrote:
>>> And use it to store expectations about what the drm/msm driver is
>>> supposed to pass in the IGT test suite.
>>
>> I wanted to loop in Linus/Greg to see if there are any issues raised
>> by adding CI results file to the tree in their minds, or if any other
>> subsystem has done this already, and it's all fine.
> 
> Why does the results need to be added to the tree?  Shouldn't they be
> either "all is good" or "constantly changing and a constant churn"?
> 
>> I think this is a good thing after our Mesa experience, but Mesa has a
>> lot tighter integration here, so I want to get some more opinions
>> outside the group.
> 
> For systems that have "tight integration" this might make sense as proof
> that all is working for a specific commit, but I can't see how this will
> help the kernel out much.
> 
> What are you going to do with these results being checked in all the
> time?

Having the expected results in the tree keeps them consistent with the driver code itself, and allows putting in place gating CI to prevent merging driver changes which make any of the tests deviate from the expected result.

Keeping them separate inevitably results in divergence between the driver code and the expected test results, which would result in spurious failures of such CI.


I expect the main complication for the kernel will be due to driver changes merged via different trees, e.g. for cross-subsystem reworks. Since those will not go through the same CI, they may accidentally introduce inconsistencies. The ideal solution for this IMO would be centralizing CI such that the same gating tests have to pass regardless of how the code is merged. But there's likely quite a long way to go until we get there. :)


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer
