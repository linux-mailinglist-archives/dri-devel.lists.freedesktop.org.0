Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC385FF2D6
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 19:16:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5769410EB48;
	Fri, 14 Oct 2022 17:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B8C10EB67
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 17:15:57 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 16A9D80384;
 Fri, 14 Oct 2022 19:15:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1665767755;
 bh=hSw9H5xm4kZ0VY54FhoQfpu+4XzJCgHNWf8jc7kpW7M=;
 h=Date:Subject:From:To:References:In-Reply-To:From;
 b=jD1zPqHqSFrcPfrv5u0u/pvY8qvcbU+Mq4W0doOID/yHJnx8quNH2wIVNzkG+Wuka
 mRN9VzPMOxhFHaAbV/7ji+qeFfEUVFxUjQi7vgt4wdyFXs6HQlX8LwXc+lKVmELSMU
 MMxPv+3VlpOkxaigIiWHBkfKykHcgn+Bhp3sWluNfgZYYBXwkQCyfvSSg6KBmlFUL2
 Ie6BKow/R/9WPUeIjyyS/IBEbf1bAyM8dTkmHza5ZtwJdtfGUIQDZc03pDvy1fvcAe
 3cK74Fs6NagixZBL1RfgBBVwS6cerCATWiqHetgXX2uUSQY0mAL7V6BWUoMNsPZp9z
 4MoZaWU2Z9Eqw==
Message-ID: <58147ea7-d0dc-439d-5610-b293513b0e75@denx.de>
Date: Fri, 14 Oct 2022 19:15:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH] drm/stm: Fix resolution bitmasks
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
To: Yannick FERTRE <yannick.fertre@foss.st.com>,
 dri-devel@lists.freedesktop.org
References: <20221011231048.505967-1-marex@denx.de>
 <93a77911-e9b2-d2e1-4fff-41f63c87376b@foss.st.com>
 <3ce425c7-978f-64e7-0630-b9aa5d1af55c@foss.st.com>
 <e7593ac2-fa0a-18ff-d286-2f4080bd5b86@denx.de>
In-Reply-To: <e7593ac2-fa0a-18ff-d286-2f4080bd5b86@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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

On 10/14/22 17:55, Marek Vasut wrote:
> On 10/14/22 15:42, Yannick FERTRE wrote:
>> Hi Marek,
> 
> Hello Yannick,
> 
>> The genmask of regsiter SSCR, BPCR & others were setted accordly to 
>> the chipset stm32f4.
> 
> So that means:
> F4 -> 2048x2048 framebuffer
> H7/MP1 -> 4096x4096 framebuffer
> ?

Worse

F4 is 2048x2048
F7 is 4096x2048
MP1 is 4096x4096

and there is no IDR register on F4/F7 like on MP1, or is there ?

How else can we tell those LTDC versions apart ?
