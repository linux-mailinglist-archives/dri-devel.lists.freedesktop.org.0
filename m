Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D161E77B625
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 12:11:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6700710E197;
	Mon, 14 Aug 2023 10:11:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org
 [IPv6:2001:67c:2050:0:465::201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6625C10E196;
 Mon, 14 Aug 2023 10:11:47 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4RPVYW6kb9z9shD;
 Mon, 14 Aug 2023 12:11:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1692007903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eRmekkgzYD+ywS0c9zPB8cc4nrdPTbQZm63uTZVZSHY=;
 b=f/y5bHDQs/AO8BpFCZNWo7L/AsZywOE2HEm/AqCzLvcmVXHVMGdlco5KE914O1JLyjeYyF
 NoFl/bJ4tWra/C9n/n1aPlEtl0GH1dybmNgAsRR4TOxlab2robBUY+DPICkg5K/S7w9amB
 WcKYL78aLdy4nJTCmTQzykXyNwBPRYKH4MGHWOYVBhMGSca8ABOYIpyHMHv7jcrnYsZi5i
 pOQPpC1TfXqdEH2BnE/tIym4UtA3tE5yatUp2yrQ+RjSH27vMqm4C+XZMhzTzhbh9MwJBC
 16CHfuyFFUgmWAJhwkdLnsPrRvRKeZX7M5P6l/wuP2yrrOD88Ginp/62eIy7qw==
Message-ID: <8e560379-4bdc-a3f0-591a-435833bfacda@mailbox.org>
Date: Mon, 14 Aug 2023 12:11:35 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v6] drm/doc: Document DRM device reset expectations
Content-Language: de-CH-frami, en-CA
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230811185508.252194-1-andrealmeid@igalia.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <20230811185508.252194-1-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: qjyhhe5pbxmotxcc3nc413xfdj3mkqrm
X-MBO-RS-ID: 1b65540c5e13e99182b
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
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/11/23 20:55, André Almeida wrote:
> Create a section that specifies how to deal with DRM device resets for
> kernel and userspace drivers.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>

[...]

> +Robustness
> +----------
> +
> +The only way to try to keep an application working after a reset is if it
> +complies with the robustness aspects of the graphical API that it is using.

"The only way to try to keep a graphical API context working after a device reset [...]"

If a graphical API context stops working properly, it doesn't necessarily mean that the application as a whole stops working.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

