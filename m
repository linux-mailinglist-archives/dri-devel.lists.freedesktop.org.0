Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E57B0B1716B
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 14:41:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F3510E26A;
	Thu, 31 Jul 2025 12:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oILqVekX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AFF710E26A
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 12:41:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D5658449FF;
 Thu, 31 Jul 2025 12:41:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9ACDC4CEEF;
 Thu, 31 Jul 2025 12:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753965713;
 bh=L3uUJnS0mt0pWzaA7vfIWRYx1MnbiUjacRjT8qGGrBw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oILqVekXQ4hKsA+kcUjV3WlYn0Gf8WWcIkkIfUacysFnmmgCE5iw//U5XRHrpnT7l
 Ij2lq0Ffu7cv6KhubX5a4CrGNHJetEEDFeg0WA84d/igFTRIw0FRkZ/++Ca8GwshzI
 VxOvhQvfWtQl6A6r3yP63MOdqJ7GhOvBC9QX/iX0xLy2cOi4u0IBmQ6/qKbzg7rPq2
 olp9LbLnCucyu+LsdY1CBbtkw2ACA4UUU2cvl6gJwvMG7ZNUH3ss1DOEmQ9MYIVFsx
 tVwLTQjwWqKzHec5tKZRyebj2sa9l3Fx6mT4ohqCHUCG1UWvHo+zqzdpsJ7BuvYaV0
 XpVbcvWosIdpg==
Message-ID: <11a42824-b240-43f0-980a-8222be872483@kernel.org>
Date: Thu, 31 Jul 2025 18:11:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [git pull] drm for 6.17-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Airlie <airlied@gmail.com>, Dillon Varone <dillon.varone@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Wenjing Liu <wenjing.liu@amd.com>
Cc: Simona Vetter <simona@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <CAPM=9tzVm80-v6_5nt6kko3nR+aQLZ7R98i419FV8f4-ayQWUw@mail.gmail.com>
 <CAHk-=wirxHy+KU6jmtO2dzmGQ1BwaOdd5Mjtrc40fGvZVULQQg@mail.gmail.com>
 <CAHk-=wjn5Pg2Gp=o2NVv-nRKqE=E75AxUypWCCpQ7MDXuHx+YA@mail.gmail.com>
 <CAHk-=whnuRuQEky2GsCDRQSf1dZbpoqnK+puw=qdR-D7aap9SQ@mail.gmail.com>
 <CAPM=9tygJqtbmYzB5gktxp-7fBfv_9gNq9p9+SdZ6wiYE2-6PQ@mail.gmail.com>
 <CAHk-=whB1X1c6rWbY34wZVGcnaY=yfPGLOtjd5h3mMDGV9Lbkg@mail.gmail.com>
 <CAPM=9tyb1mELymOJv62KJom4mGF0UBifbVqLJUFdS1C7Eeu3jg@mail.gmail.com>
 <CAPM=9tzDWmYBKQGB0ybDzhYHkg0p98_6PJA8OuPahRep8+QPvQ@mail.gmail.com>
 <CAHk-=whOb_ebQQbnXeqb8uXf32WA32nrL3=HQ2y8hBm9hFgVOw@mail.gmail.com>
 <CAHk-=wh+79KkMXsNqyPxeU+c5U2h-n13ko6J_QzwtjyYCKhrSw@mail.gmail.com>
 <CAHk-=wgEGn0azq0n5BfWg4ZStrZYanLCX1a+quug7HKmjimhpw@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <CAHk-=wgEGn0azq0n5BfWg4ZStrZYanLCX1a+quug7HKmjimhpw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/31/25 10:37 AM, Linus Torvalds wrote:
> On Wed, 30 Jul 2025 at 21:58, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>
>> d7b618bc41ee3d44c070212dff93949702ede997 is the first bad commit
>>      drm/amd/display: Refactor DSC cap calculations
>>
>> Let me go see how painful it is to just revert it from top-of-tree.
> 
> So with that reverted (didn't require a lot of fixing, only minor
> unrelated context added nearby later), current top-of-tree works for
> me again.
> 
> The revert I used for testing attached just so people can see exactly
> what I did.
> 
> It's late here, I wasn't getting any more work done today anyway, so
> I'll leave it like this for now.
> 
> I can continue to do the merge window with this revert purely local
> for a while, so if somebody comes up with a proper fix, I can test
> that out.
> 
>              Linus

Pure guess from looking at the diff from 
d7b618bc41ee3d44c070212dff93949702ede997, maybe the NULL ptr is a deref 
on a pointer that doesn't have funcs declared being an older GPU.  So 
maybe check for funcs?

diff --git a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c 
b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
index a454d16e6586..95d51de26c0b 100644
--- a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
+++ b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
@@ -673,7 +673,7 @@ static void get_dsc_enc_caps(
                 return;

         /* check if reported cap global or only for a single DCN DSC enc */
-       if (dsc->funcs->dsc_get_enc_caps) {
+       if (dsc->funcs && dsc->funcs->dsc_get_enc_caps) {
                 if (!dsc->ctx->dc->debug.disable_dsc)
                         dsc->funcs->dsc_get_enc_caps(dsc_enc_caps, 
pixel_clock_100Hz);
         } else {
