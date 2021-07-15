Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2283CA1B0
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 17:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 354FA6E87B;
	Thu, 15 Jul 2021 15:51:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id 555436E87F;
 Thu, 15 Jul 2021 15:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 1AE5920201E;
 Thu, 15 Jul 2021 17:51:35 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id sx6L0055-jNz; Thu, 15 Jul 2021 17:51:34 +0200 (CEST)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id 76FC820201D;
 Thu, 15 Jul 2021 17:51:34 +0200 (CEST)
Received: from [::1] by thor with esmtp (Exim 4.94.2)
 (envelope-from <michel@daenzer.net>)
 id 1m43e1-0002oe-9T; Thu, 15 Jul 2021 17:51:25 +0200
To: Alex Deucher <alexdeucher@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
References: <20210714220858.5553-1-alexander.deucher@amd.com>
 <YO+++Tj94RRjVqwV@ravnborg.org>
 <CADnq5_Oj1Totqe=fGeF3AeQsodR9_6ki7EChs3CmJzC7txMu1A@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [pull] amdgpu, amdkfd drm-fixes-5.14
Message-ID: <7e831a9a-5365-552a-0f14-7b43847302fb@daenzer.net>
Date: Thu, 15 Jul 2021 17:51:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CADnq5_Oj1Totqe=fGeF3AeQsodR9_6ki7EChs3CmJzC7txMu1A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-07-15 4:07 p.m., Alex Deucher wrote:
> On Thu, Jul 15, 2021 at 12:52 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>> On Wed, Jul 14, 2021 at 06:08:58PM -0400, Alex Deucher wrote:
>>> Hi Dave, Daniel,
>>>
>>> Fixes for 5.14.  The big change here is unifying the SMU13 code.  This was
>>> new code added in 5.14 to support Yellow Carp, but we've since cleaned it
>>> up and removed a lot of duplication, so better to merge it now to facilitate
>>> any bug fixes in the future that need to go back to this kernel via stable.
>>> Only affects Yellow Carp which is new for 5.14 anyway so not much chance for
>>> regressions.  The rest is just standard bug fixes.
>>
>> This pull seems not to include any fixes for the W=1 warnings that
>> has crept in again. It would be nice if the amdgpu could be warning free
>> again, this would maybe motivate the others to fix theirs too so we
>> could keep most/all of drivers/gpu/ free of W=1 warnings.
> 
> We haven't really been monitoring the W=1 stuff that closely.  I'll
> see what we can do going forward.

IMHO keeping the W=1 build clean isn't realistic without enforcing it in CI.


-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer
