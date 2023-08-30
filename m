Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD7578D6EA
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 17:19:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E62910E547;
	Wed, 30 Aug 2023 15:19:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org
 [IPv6:2001:67c:2050:0:465::101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 645E910E547;
 Wed, 30 Aug 2023 15:19:24 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4RbSd40xTdz9sqG;
 Wed, 30 Aug 2023 17:19:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1693408760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7WVr6sfDlpT+GcV4fVg5JZuFi7yMzbTGXcyHxed6FE0=;
 b=ECCXCyFcA0Z9AtLh4GVXYwvmh0ILfOF0IsPNnDYeXa865+ppe/T+TKmnEuo8rdavdc+GNl
 LJzvUM+lBrtuu//KNoH9/9U/xiDW9sVQb6HSZANVor5TTdI+HkD0HjGT7cxO79TfuQTvOJ
 PEAP6PMLX0Ur6mqXxD5dqaDuQa2jrD8JFIXPsZ9zk3Wo/TULizxhuBtt2DIIuYYdfFMeIk
 frPr+uxDZ7XVgOZ5NwPYxpQW5wEqLE9Fx68+vg4UMEBj/CaBHMGFEGBX/PdWGvVhxBFB9/
 ZcMRNicBuEOcStC2hdLtJD4ykdiUO5kF9T+nJ6YCnT9IGC7gUML4098MfTcorA==
Message-ID: <1f311318-aaf5-85fa-8f2c-dd0fafb8bfbb@mailbox.org>
Date: Wed, 30 Aug 2023 17:19:17 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/7] GPU workload hints for better performance
Content-Language: de-CH-frami, en-CA
To: "Lazar, Lijo" <Lijo.Lazar@amd.com>, "Yadav, Arvind"
 <Arvind.Yadav@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Sharma, Shashank" <Shashank.Sharma@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20230828122614.3815122-1-Arvind.Yadav@amd.com>
 <BYAPR12MB4614D2C51DD24B7163B3652397E0A@BYAPR12MB4614.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <BYAPR12MB4614D2C51DD24B7163B3652397E0A@BYAPR12MB4614.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: f95517fd879b3f33af4
X-MBO-RS-META: sajakrcg4hnowsbo5jugcgcqtuxus9uj
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/28/23 17:02, Lazar, Lijo wrote:
> [AMD Official Use Only - General]
> 
> 
> As mentioned with an older version of this series, this is an 'abuse' of power profile interface.
> 
> This series is oversimplifying what PMFW algorithms are supposed to be doing. Whatever this series is doing, FW can do it better.
> 
> To explain in simpler terms - it just tries to boost a profile based on ring type without even knowing how much of activity a job can trigger on a particular ring. A job scheduled to a GFX ring doesn't deserve a profile boost unless it can create a certain level of activity. In CPU terms, a job scheduled to a processor doesn't mean it deserves a frequency boost of that CPU.  At minimum it depends on more details like whether that job is compute bound or memory bound or memory bound. 
> 
> While FW algorithms are designed to do that, this series tries to trivialise all such things.
> 
> Unless you are able to show the tangible benefits in some terms like performance, power, or performance per watt,  I don't think this should be the default behaviour where driver tries to override FW just based on job submissions to rings.

I know at least one tangible benefit this would have: a snappier GNOME desktop with lower input → output latency on many laptops. The bootup default profile doesn't work well for that IME.

It should also help for issues like
https://gitlab.freedesktop.org/drm/amd/-/issues/1500 .

That said, I agree this approach is very aggressive. I think it might be acceptable with AC power, not sure about on battery though. (There might be better performance/power profile mechanisms to hook into than AC vs battery)


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

