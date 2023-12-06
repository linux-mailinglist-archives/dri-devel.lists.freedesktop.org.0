Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED08D806E13
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 12:34:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F05D10E0E1;
	Wed,  6 Dec 2023 11:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 710CA10E0E1;
 Wed,  6 Dec 2023 11:34:30 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1rAqAe-0004rY-Qt; Wed, 06 Dec 2023 12:34:28 +0100
Message-ID: <31153b60-ab46-4b98-9b0f-32fff412a756@leemhuis.info>
Date: Wed, 6 Dec 2023 12:34:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] rx7600 stopped working after "1cfb4d612127
 drm/amdgpu: put MQDs in VRAM"
Content-Language: en-US, de-DE
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20231026173320.552430-1-alexey.klimov@linaro.org>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <20231026173320.552430-1-alexey.klimov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1701862470;
 73a0b41e; 
X-HE-SMSGID: 1rAqAe-0004rY-Qt
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 26.10.23 19:33, Alexey Klimov wrote:
> #regzbot introduced: 1cfb4d612127
> #regzbot title: rx7600 stopped working after "1cfb4d612127 drm/amdgpu: put MQDs in VRAM"
> 
> Hi all,
> 
> I've been playing with RX7600 and it was observed that amdgpu stopped working between kernel 6.2 and 6.5.
> Then I narrowed it down to 6.4 <-> 6.5-rc1 and finally bisect pointed at 1cfb4d6121276a829aa94d0e32a7f5e1830ebc21
> And I manually checked if it boots/works on the previous commit and the mentioned one.

#regzbot fix: ba0fb4b48c19a
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
