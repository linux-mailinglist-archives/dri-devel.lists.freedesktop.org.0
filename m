Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE155482B0
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 11:11:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C6210E0F7;
	Mon, 13 Jun 2022 09:11:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms7.webland.ch (ms7.webland.ch [92.43.217.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 619D710E08D;
 Mon, 13 Jun 2022 09:11:50 +0000 (UTC)
Received: from thor ([85.2.99.24])
 by ms7.webland.ch (12.3.0 build 2 x64) with ASMTP (SSL) id
 01202206131111468150; Mon, 13 Jun 2022 11:11:46 +0200
Received: from [127.0.0.1] by thor with esmtp (Exim 4.95)
 (envelope-from <michel@daenzer.net>) id 1o0g6q-001Eqd-Ly;
 Mon, 13 Jun 2022 11:11:44 +0200
Message-ID: <71d16c84-494c-1204-3944-d37aac8fed82@daenzer.net>
Date: Mon, 13 Jun 2022 11:11:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-CA
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>
References: <20220610135426.670120-1-michel@daenzer.net>
 <2260b6a6-153c-6c12-212c-2b3f5199e6dc@gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH] drm/amdgpu: Fix GTT size reporting in amdgpu_ioctl
In-Reply-To: <2260b6a6-153c-6c12-212c-2b3f5199e6dc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CTCH: RefID="str=0001.0A782F18.62A6FF53.002C,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0";
 Spam="Unknown"; VOD="Unknown"
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-06-11 09:19, Christian König wrote:
> Am 10.06.22 um 15:54 schrieb Michel Dänzer:
>> From: Michel Dänzer <mdaenzer@redhat.com>
>>
>> The commit below changed the TTM manager size unit from pages to
>> bytes, but failed to adjust the corresponding calculations in
>> amdgpu_ioctl.
>>
>> Fixes: dfa714b88eb0 ("drm/amdgpu: remove GTT accounting v2")
>> Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1930
>> Bug: https://gitlab.freedesktop.org/mesa/mesa/-/issues/6642
>> Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
> 
> Ah, WTF! You won't believe how long I have been searching for this one.

Don't feel too bad, similar things have happened to me before. :) Even after Marek's GitLab comment got me on the right track, it still took a fair amount of trial, error & head scratching to put this one to bed.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer
