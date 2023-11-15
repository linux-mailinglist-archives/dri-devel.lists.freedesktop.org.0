Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BAC7EC7D8
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 16:52:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0189410E088;
	Wed, 15 Nov 2023 15:52:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F80610E088
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 15:51:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 15F2DCE1DDF;
 Wed, 15 Nov 2023 15:51:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC229C433C7;
 Wed, 15 Nov 2023 15:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700063515;
 bh=UtU8CmcT9tpGHDF8mWEF6lFxjr7HU9BJf79DrVfL3XU=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=iuMFnn6BH+6Tq7rWCf8rAh96nJnt5f3Kk8u85KM1oUuAshrXF5yfT2ZxUIemM4hEp
 svANmekp8cG29Hx+ZsTFl4Sy3nO8hxZWNCmAqg3vP/F597iyH+1SG89CVP/unwZM3N
 D0BJqSdywTPPoTUkN4Q/wPI9mR2iQNkTJwcKJ1BJvuMC3GEPMWf+UfZZ3K1SJSxQul
 j/hoNezC0BYXRb9BPl8R74v+Sj0JuMeGvn9JTaayNeQE6nJDaZxiDUUZK6vGnfBV29
 j0B9/cZthBdiWHKlV3NZjxvM9ddaiqlE47Ve3Maa8mJZ4XxDOupKXebfSdpQb4Ax/k
 QtYwIwHUO7mAA==
Message-ID: <4e0c8bb796a67af5fb901f831c5f87fe.mripard@kernel.org>
Date: Wed, 15 Nov 2023 15:51:52 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "David Gow" <davidgow@google.com>
Subject: Re: [PATCH 1/3] kunit: Add a macro to wrap a deferred action function
In-Reply-To: <20231110200830.1832556-1-davidgow@google.com>
References: <20231110200830.1832556-1-davidgow@google.com>
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
Cc: Emma Anholt <emma@anholt.net>, dlatypov@google.com, llvm@lists.linux.dev,
 Rae Moar <rmoar@google.com>, dri-devel@lists.freedesktop.org,
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>,
 linux-hardening@vger.kernel.org, linux-kselftest@vger.kernel.org, Arthur
 Grillo <arthurgrillo@riseup.net>, Sami
 Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>,
 Maxime Ripard <mripard@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Benjamin Berg <benjamin.berg@intel.com>,
 Shuah Khan <skhan@linuxfoundation.org>, kunit-dev@googlegroups.com, Brendan
 Higgins <brendan.higgins@linux.dev>, Thomas
 Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 11 Nov 2023 04:08:26 +0800, David Gow wrote:
> KUnit's deferred action API accepts a void(*)(void *) function pointer
> which is called when the test is exited. However, we very frequently
> want to use existing functions which accept a single pointer, but which
> may not be of type void*. While this is probably dodgy enough to be on
> the wrong side of the C standard, it's been often used for similar
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
