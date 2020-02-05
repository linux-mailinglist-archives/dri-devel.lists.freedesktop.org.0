Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E17E2153ABE
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 23:13:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778C56E213;
	Wed,  5 Feb 2020 22:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81DF16E213
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 22:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uS00ukHTjbtGtcqES7lpaCa7AxEAapHUStwOBQZ5dts=; b=dwIsSpWGeGSnvnJsyMe0bMEG0/
 7Z/FgaQvK5ikY2AojScF0RTCsGpYC70qrGtZjyVXBeonTGpoCVYtw5jCzMQFlEVL/oqlFTufj5jqQ
 Q2FAOuGZ2qdEhuQcaMHMiN1i21hnN9wLeYp/0uhVk7G3UFF9xjg+Lh6kfzvSogJ5r7WCZZ9m5CNJb
 c3udi5rUO9mXkXECZcNJa+9ijO7M9tcLJq/An814vo0+ieAgs7AYewSr13J2LjqCiMpNO5VRoy2tR
 qugVCaljQmzWgdB3HbCVWfQ3mQ6RkmLgTtEbkJtZa2f0EmRaLiPaI02jNQXUWOhHWZ536PS5Ku1CN
 sN433NWw==;
Received: from [2600:1700:4830:1650:5518:d2aa:e986:f3f6] (port=49920
 helo=gerda.attlocal.net)
 by vern.gendns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <david@lechnology.com>)
 id 1izSux-0000gF-Ex; Wed, 05 Feb 2020 17:13:07 -0500
Subject: Re: [PATCH v2 1/4] drm/tiny/repaper: Make driver OF-independent
To: Sam Ravnborg <sam@ravnborg.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20200131204923.48928-1-andriy.shevchenko@linux.intel.com>
 <20200205213103.GA14713@ravnborg.org>
From: David Lechner <david@lechnology.com>
Message-ID: <fd3ecc67-9c62-6ed8-1a1f-fc6b22e288a4@lechnology.com>
Date: Wed, 5 Feb 2020 16:12:20 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200205213103.GA14713@ravnborg.org>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id:
 davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/5/20 3:31 PM, Sam Ravnborg wrote:
> Hi David.
> 
> Are you planning to pick this series and apply it?
> Unless I get any other info I plan to process it tomorrow.
> 
> 	Sam
> 

I won't be able to do it before then, so please go ahead.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
