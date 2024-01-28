Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C10683F508
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jan 2024 11:45:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0204510E716;
	Sun, 28 Jan 2024 10:45:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC06E10E716
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jan 2024 10:45:06 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1rU2eq-0004bW-4H; Sun, 28 Jan 2024 11:45:00 +0100
Message-ID: <acf203a8-b612-437c-a464-228f45e1c694@leemhuis.info>
Date: Sun, 28 Jan 2024 11:44:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Bug#1061449: linux-image-6.7-amd64: a boot message from amdgpu
Content-Language: en-US, de-DE
To: Salvatore Bonaccorso <carnil@debian.org>,
 Patrice Duroux <patrice.duroux@gmail.com>, 1061449@bugs.debian.org,
 Lewis Huang <lewis.huang@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Phil Hsieh <phil.hsieh@amd.com>, Rodrigo Siqueira
 <rodrigo.siqueira@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <170612149675.7169.757906919183146487.reportbug@kos-moceratops.home>
 <ZbUB0YWxEET3Y0xA@eldamar.lan>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <ZbUB0YWxEET3Y0xA@eldamar.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1706438715;
 38cae9b2; 
X-HE-SMSGID: 1rU2eq-0004bW-4H
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
Cc: regressions@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27.01.24 14:14, Salvatore Bonaccorso wrote:
>
> In Debian (https://bugs.debian.org/1061449) we got the following
> quotred report:
> 
> On Wed, Jan 24, 2024 at 07:38:16PM +0100, Patrice Duroux wrote:
>>
>> Giving a try to 6.7, here is a message extracted from dmesg:
>> [    4.177226] ------------[ cut here ]------------
>> [    4.177227] WARNING: CPU: 6 PID: 248 at
>> drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_factory.c:387
>> construct_phy+0xb26/0xd60 [amdgpu]
> [...]

Not my area of expertise, but looks a lot like a duplicate of
https://gitlab.freedesktop.org/drm/amd/-/issues/3122#note_2252835

Mario (now CCed) already prepared a patch for that issue that seems to work.

HTH, Ciao, Thorsten
