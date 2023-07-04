Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D099747D82
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 08:52:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3447310E32E;
	Wed,  5 Jul 2023 06:52:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 384 seconds by postgrey-1.36 at gabe;
 Tue, 04 Jul 2023 18:55:37 UTC
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [188.68.61.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 773AB10E31B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 18:55:37 +0000 (UTC)
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
 by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4QwWzT5bNlz7yX1;
 Tue,  4 Jul 2023 20:49:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zint.sh; s=key2;
 t=1688496549; bh=GVVynhEK68eJoN+Xsj0RlcQA++1FHUnmaP+Aw5+SQ4g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jnQK69vAou/xQVuMz2ytODPp6xM6LCRSOPZmzl7sgG9ENUQpfV5OeHRzmcZRVdnwy
 6oWG353pRSgjMdEaIB89OAVhSiWICDi3vBj+wUKZkulZysBT4bJW8okmXcBgb8gz8e
 36CJ8Hzk/xhEM6uOrpEYJXjFVmk5HiBzBxIsm2J5c/eMjYlzg3Rfhp/FDY0CWUH9Jq
 ihVr9Jzo8PQaKwqee8bH24XWtg450C639Pa0emZWfSKN0EGRp4/loceUU6+Mi7ak8E
 5jQfEjHhBolL97Qdb5F3tJ16PaXOGApNRvLs+Q+QprMTGgWFQza+StDXddxNwWO1zI
 jYyAo+cxzj/gg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
 by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4QwWzT5Cmwz7yVH;
 Tue,  4 Jul 2023 20:49:09 +0200 (CEST)
Received: from mxe217.netcup.net (unknown [10.243.12.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4QwWzT0Sb5z8sWf;
 Tue,  4 Jul 2023 20:49:09 +0200 (CEST)
Received: from [192.168.178.29] (p5dcce794.dip0.t-ipconnect.de
 [93.204.231.148])
 by mxe217.netcup.net (Postfix) with ESMTPSA id 41606816E7;
 Tue,  4 Jul 2023 20:49:00 +0200 (CEST)
Message-ID: <fae34bb8-9e4b-41db-bf53-6d9e587ab00e@zint.sh>
Date: Tue, 4 Jul 2023 20:48:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/1] Backlight driver for the Apple Studio Display
Content-Language: en-US
To: Daniel Thompson <daniel.thompson@linaro.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
References: <20230701120806.11812-1-julius@zint.sh>
From: Julius Zint <julius@zint.sh>
In-Reply-To: <20230701120806.11812-1-julius@zint.sh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 41606816E7
X-Rspamd-Server: rspamd-worker-8404
X-NC-CID: Vm9HcxEdPwFhbv4UrnaEJHdgHLLTduxm4XYC06rc
X-Mailman-Approved-At: Wed, 05 Jul 2023 06:52:31 +0000
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I appreciate all of the feedback, this should be plenty for a v2.

Thanks,

Julius
