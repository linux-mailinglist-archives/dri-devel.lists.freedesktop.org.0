Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9924C4054
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 09:42:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F216E10E5A9;
	Fri, 25 Feb 2022 08:42:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCEA510FB1F;
 Thu, 24 Feb 2022 12:22:42 +0000 (UTC)
Received: from [127.0.0.1] (unknown [92.167.214.184])
 (Authenticated sender: eric.valette@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 5446A780674;
 Thu, 24 Feb 2022 13:22:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1645705360;
 bh=fP/yrgV3ube2ihjd3ik+3iVnycyzuE8vV8HCQA4UG6U=;
 h=Date:From:To:Cc:Subject:From;
 b=kHNcLOLXnyKHDFY7oK+97QWOSoWL/CEPYgnLONLA2/uJL3xfNI+Xvy2objbV6dsDT
 vV6SiPcF+sIDjEEtmp5kKlR5WoAC6Gtmio6JGfesKCGyAbeUa/VZ2eh7uNQPpe+nHP
 U1vARC25OaiioqlMgB5USBRxV3uFYnAR3FZkM1WdZGgV352uFScBwmtp29Iuisz0Qb
 cmjHSCTiNttDCTNLvCa88JgzIn7d9ppC71Ip/uVrAwfEg5Iw+nta6HskkYaan1n4XV
 SCjA3I20V1K6EmtkUIWjExcbVvRJcEPO2JdlN7iMX4SGidamBWo4aVfamGCXacMN20
 UVqTFahx0vYRA==
Date: Thu, 24 Feb 2022 12:22:23 +0000 (UTC)
From: =?UTF-8?Q?=C3=89ric_Valette?= <eric.valette@free.fr>
To: Alex Deucher <alexdeucher@gmail.com>
Message-ID: <68ac824b-3419-4644-a355-24341540fa6d@free.fr>
Subject: Re: Regression from 3c196f056666 ("drm/amdgpu: always reset the
 asic in suspend (v2)") on suspend?
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <68ac824b-3419-4644-a355-24341540fa6d@free.fr>
X-Mailman-Approved-At: Fri, 25 Feb 2022 08:42:23 +0000
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
Cc: Sasha Levin <sashal@kernel.org>, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, 1005005@bugs.debian.org,
 Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dominique Dumont <dod@debian.org>, Salvatore Bonaccorso <carnil@debian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/21/22 15:16, Alex Deucher wrote:

>>>> Is this system S0i3 or regular S3?
>>=20
>> For me it is real S3.
>>=20
>> The proposed patch is intended for INTEl + intel gpu + amdgpu but I have
>> dual amd GPU.
> It doesn't really matter what the platform is, it could still
> potentially help on your system, it depends on the bios implementation
> for your platform and how it handles suspend. You can try the patch,
> but I don't think you are hitting the same issue.=C2=A0 I bisect would be
> helpful in your case.

Trying to add the pach on top of 5.15.24, I got a already applied message a=
nd indeed the patch is already there. So this particular patch it does not =
fix my problem.

Saw new modif in 5.15.25. Will try and check if I can find time to bissect.

-- eric
