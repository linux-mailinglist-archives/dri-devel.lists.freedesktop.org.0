Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C43760C98
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 10:03:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4DE910E3BD;
	Tue, 25 Jul 2023 08:03:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org
 [IPv6:2001:67c:2050:0:465::102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 264CD10E3BC;
 Tue, 25 Jul 2023 08:03:46 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4R98g24n4pz9slt;
 Tue, 25 Jul 2023 10:03:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1690272222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=buprnnb3RBHF65zwm/IwwS5+aARu3i5003bm80ROWy0=;
 b=SMCmyN7j9PVny7FrxgViukvSyWbJbnyin+9i3/syIV7wvZj88g0WycRcQdex1QetW2IciC
 VvV997rgBQ04GtsEi4afak6/oJ82q/EP1Sixhh4AozCWGrfscEbJB5oTuq/drdllrij4U4
 3zBEKDeJLCCszasmOi80lQfR5HgHc45T8vVfJBdOhs8Wr4zB1nMYunNGiY3+i6xh2vbj9+
 8cOGV8gNDxujBtcO3eNKtmSJeygLwfbmRJcnC4TOoeO0lWo/7rfBd5Wd+BtvBLFcVT2JCO
 dLGp1OX7zh4wg9xXKCIAcrm5fscLWqpIxn+KTZppI0hJig7zyPFqvZHd+55hig==
Message-ID: <45a1e527-f5dc-aa6f-9482-8958566ecb96@mailbox.org>
Date: Tue, 25 Jul 2023 10:03:39 +0200
MIME-Version: 1.0
Subject: Re: Non-robust apps and resets (was Re: [PATCH v5 1/1] drm/doc:
 Document DRM device reset expectations)
Content-Language: de-CH-frami, en-CA
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
References: <20230627132323.115440-1-andrealmeid@igalia.com>
 <e292a30f-5cad-1968-de4f-0d43c9c1e943@igalia.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <e292a30f-5cad-1968-de4f-0d43c9c1e943@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 5k4x7euhw4r53ugwmd8sug3xp1cxcoqf
X-MBO-RS-ID: 9afac7eeae3d16ec584
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/25/23 04:55, André Almeida wrote:
> Hi everyone,
> 
> It's not clear what we should do about non-robust OpenGL apps after GPU resets, so I'll try to summarize the topic, show some options and my proposal to move forward on that.
> 
> Em 27/06/2023 10:23, André Almeida escreveu:
>> +Robustness
>> +----------
>> +
>> +The only way to try to keep an application working after a reset is if it
>> +complies with the robustness aspects of the graphical API that it is using.
>> +
>> +Graphical APIs provide ways to applications to deal with device resets. However,
>> +there is no guarantee that the app will use such features correctly, and the
>> +UMD can implement policies to close the app if it is a repeating offender,
>> +likely in a broken loop. This is done to ensure that it does not keep blocking
>> +the user interface from being correctly displayed. This should be done even if
>> +the app is correct but happens to trigger some bug in the hardware/driver.
>> +
> Depending on the OpenGL version, there are different robustness API available:
> 
> - OpenGL ABR extension [0]
> - OpenGL KHR extension [1]
> - OpenGL ES extension  [2]
> 
> Apps written in OpenGL should use whatever version is available for them to make the app robust for GPU resets. That usually means calling GetGraphicsResetStatusARB(), checking the status, and if it encounter something different from NO_ERROR, that means that a reset has happened, the context is considered lost and should be recreated. If an app follow this, it will likely succeed recovering a reset.
> 
> What should non-robustness apps do then? They certainly will not be notified if a reset happens, and thus can't recover if their context is lost. OpenGL specification does not explicitly define what should be done in such situations[3], and I believe that usually when the spec mandates to close the app, it would explicitly note it.
> 
> However, in reality there are different types of device resets, causing different results. A reset can be precise enough to damage only the guilty context, and keep others alive.
> 
> Given that, I believe drivers have the following options:
> 
> a) Kill all non-robust apps after a reset. This may lead to lose work from innocent applications.
> 
> b) Ignore all non-robust apps OpenGL calls. That means that applications would still be alive, but the user interface would be freeze. The user would need to close it manually anyway, but in some corner cases, the app could autosave some work or the user might be able to interact with it using some alternative method (command line?).
> 
> c) Kill just the affected non-robust applications. To do that, the driver need to be 100% sure on the impact of its resets.
> 
> RadeonSI currently implements a), as can be seen at [4], while Iris implements what I think it's c)[5].
> 
> For the user experience point-of-view, c) is clearly the best option, but it's the hardest to archive. There's not much gain on having b) over a), perhaps it could be an optional env var for such corner case applications.

I disagree on these conclusions.

c) is certainly better than a), but it's not "clearly the best" in all cases. The OpenGL UMD is not a privileged/special component and is in no position to decide whether or not the process as a whole (only some thread(s) of which may use OpenGL at all) gets to continue running or not.


> [0] https://registry.khronos.org/OpenGL/extensions/ARB/ARB_robustness.txt
> [1] https://registry.khronos.org/OpenGL/extensions/KHR/KHR_robustness.txt
> [2] https://registry.khronos.org/OpenGL/extensions/EXT/EXT_robustness.txt
> [3] https://registry.khronos.org/OpenGL/specs/gl/glspec46.core.pdf
> [4] https://gitlab.freedesktop.org/mesa/mesa/-/blob/23.1/src/gallium/winsys/amdgpu/drm/amdgpu_cs.c#L1657
> [5] https://gitlab.freedesktop.org/mesa/mesa/-/blob/23.1/src/gallium/drivers/iris/iris_batch.c#L842

-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

