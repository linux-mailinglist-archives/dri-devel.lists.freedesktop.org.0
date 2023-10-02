Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E600F7B509A
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 12:48:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9911C10E281;
	Mon,  2 Oct 2023 10:48:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18EDC10E062;
 Mon,  2 Oct 2023 10:48:51 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Rzd3h1N5yz9shG;
 Mon,  2 Oct 2023 12:48:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1696243728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aKQIXYEpE/9OswE+cL5Gpii4j2iJ/oBrPTa1hkC9W2Q=;
 b=Lu8JYA6L58FS3IbDEJ95v5ZZAHqVj2M/9SqMC880LS5F1ZHqlt6GyE1lEaOtqYnfLkhrLG
 cH1P1LPiqTBQcJWBIaoqINbqqaLk/6wgGu3CfSTZIrDjO7TWhLHpfuaQ7w0beJBH8NkneN
 GW8cD5NhEc96hCbus98+hlkwnpN8eeB1tT8K0o6BEOBtOx014gCm5j+SouRs7nc7yMfn+i
 ZyITZ/P+JF04AX8Ao/NdJk/fnTLhUs5Xefg2tUfOAqcQ++xcdq/1T9Qibl5KCthewHxXkv
 EZyUDkNDrUegtclxKvTFGUK8m2uDlRrDI74XzCSSGpUZmRtHkGeJz2ra9lg/HA==
Message-ID: <39342931-1716-bf53-62d7-613b1191f60a@mailbox.org>
Date: Mon, 2 Oct 2023 12:48:44 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] Revert "drm/amd/display: Check all enabled planes in
 dm_check_crtc_cursor"
Content-Language: en-CA
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
References: <20230929204120.120795-1-hamza.mahfooz@amd.com>
 <2a8ebf1a-0d74-e068-6d68-de0ecae9bdf1@mailbox.org>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <2a8ebf1a-0d74-e068-6d68-de0ecae9bdf1@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 4wx17h8uorgrg4ynpwwk343ayfcp7oii
X-MBO-RS-ID: c5a17bc6f1869c534c6
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
Cc: Stylon Wang <stylon.wang@amd.com>, Ivan Lipski <ivlipski@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Qingqing Zhuo <Qingqing.Zhuo@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alex Hung <alex.hung@amd.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <mdaenzer@redhat.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 amd-gfx@lists.freedesktop.org, Wayne Lin <wayne.lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/2/23 12:05, Michel Dänzer wrote:
> On 9/29/23 22:41, Hamza Mahfooz wrote:
>> From: Ivan Lipski <ivlipski@amd.com>
>>
>> This reverts commit 45e1ade04b4d60fe5df859076005779f27c4c9be.
>>
>> Since, it causes the following IGT tests to fail:
>> kms_cursor_legacy@cursor-vs-flip.*
>> kms_cursor_legacy@flip-vs-cursor.*
> 
> Any information about how those tests fail? Maybe they accidentally rely on the broken behaviour?

I was able to reproduce, that doesn't seem to be the case. They just rely on multiple legacy cursor ioctl calls being able to complete between consecutive flips, which I suppose is broken by always pulling in non-cursor plane state with any cursor plane state changes.

I'll see if I can find a better solution. Meanwhile,

Acked-by: Michel Dänzer <mdaenzer@redhat.com>

for the revert.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

