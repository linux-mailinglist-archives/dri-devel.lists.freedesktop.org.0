Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 083E3780A3E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 12:34:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 282EE10E4C5;
	Fri, 18 Aug 2023 10:34:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F9D10E4D6
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 10:34:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F027C676C1;
 Fri, 18 Aug 2023 10:34:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E799C433C8;
 Fri, 18 Aug 2023 10:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692354884;
 bh=/I3yUOIPMAIf2jjLMU6pOK7vn2U3Nj4w+dTf8ovxlqg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=vIujnUmnl1Xl08zeTpNMTHYWcZ6sO8mMvpILvF0KyD58Idulrnx97mXI/Pw2mx6Ti
 yNsJpdxeINKjDHu7BNaIyJRfEARB16L0MuaWJ0JuyF2dHgGJ1b7qh70mfGvfvxpbQM
 J2NSNyKaBoAi6llHGn/zhbHyFJ3D5YaBIbcAplF2lLesdP0hqh5u3yrRp2LQ6CzArS
 OF3FgZeWEUbwDflVvRY5zs2hDGcHs0V1N1/ioi/OjJEqok26oEHzessvR0TvR+4aQ9
 LW7XICfOI6liNQYhprgnXR4sDXc6HxSK1Ek6Fh+Jr41wyPY5+hNGfau//ksR6pMRMT
 PKuAEomKqVQpA==
Message-ID: <a176dfff-1d03-f3c4-aa6c-47d6c3335c30@kernel.org>
Date: Fri, 18 Aug 2023 12:34:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v5 17/17] arm64: dts: ti: k3-am62-main: Add GPU device
 node [DO NOT MERGE]
Content-Language: en-US
To: Sarah Walker <sarah.walker@imgtec.com>, dri-devel@lists.freedesktop.org
References: <20230816082531.164695-1-sarah.walker@imgtec.com>
 <20230816082531.164695-18-sarah.walker@imgtec.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230816082531.164695-18-sarah.walker@imgtec.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: matthew.brost@intel.com, hns@goldelico.com, linux-kernel@vger.kernel.org,
 mripard@kernel.org, afd@ti.com, luben.tuikov@amd.com, dakr@redhat.com,
 donald.robson@imgtec.com, tzimmermann@suse.de, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/08/2023 10:25, Sarah Walker wrote:
> Add the Series AXE GPU node to the AM62 device tree.
> 
> Changes since v4:
> - Remove interrupt name
> - Make property order consistent across dts and bindings doc
> - Fixed formatting (replaced spaces with tabs)
> 

Nope, DTS go via SoC tree. You skipped all lists and maybe also all
maintainers.

Really, start finally using the Linux tools - scripts/get_maintainers.pl


Best regards,
Krzysztof

