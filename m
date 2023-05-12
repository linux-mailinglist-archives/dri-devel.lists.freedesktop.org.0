Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F302F6FFE16
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 02:41:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8124210E05C;
	Fri, 12 May 2023 00:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 524C810E05C
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 00:41:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4E0E6652C0;
 Fri, 12 May 2023 00:41:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0866C4339B;
 Fri, 12 May 2023 00:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683852068;
 bh=buIg82FsdUAF2Q1U/hR23a0od1zuZD5R5znK2wDNEQE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FR9CtCjJXhscTX6v+8eud1o8h8AsAJ6CvD1UDO3Ny+kWOY9I3O9HZWktWAa4grjkn
 Iu2OcNzq7LNVuMd1AEPkfLMajCndiwQ0+Q8bE8R5idpeMifggxQOIvWzGpsdeaHzGj
 uw0q9ORsxXvVUbTAZZ6Zkk7ahY/q3m1DG8KrGl+7L1TgsrC5o2UvMok/vvtuOes5ws
 ijPJslKVstS6L8cNoZhC16eMm9dtwSEAZeqPBdQugC5x4SfsrLQ6ndDNRYe+NLfagJ
 KRWdc4iu8NbhhqNFDyNXwnglJWhTXm65486914Yp/k8CS14VXp6ZGdMxz5nxJO8z4U
 K5CWoACLAPKTw==
Date: Thu, 11 May 2023 17:41:05 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH 00/10] Treewide GPL SPDX conversion (love letter to Didi)
Message-ID: <20230511174105.63b7a6ae@kernel.org>
In-Reply-To: <20230511133406.78155-1-bagasdotme@gmail.com>
References: <20230511133406.78155-1-bagasdotme@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Dan Carpenter <error27@gmail.com>, Tom Rix <trix@redhat.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>,
 Eric Dumazet <edumazet@google.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 Pavel Machek <pavel@ucw.cz>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Gaosheng Cui <cuigaosheng1@huawei.com>, Andy Gospodarek <andy@greyhouse.net>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Linux Staging Drivers <linux-staging@lists.linux.dev>,
 Minghao Chi <chi.minghao@zte.com.cn>,
 Yang Yingliang <yangyingliang@huawei.com>,
 "Steven Rostedt \(Google\)" <rostedt@goodmis.org>,
 Archana <craechal@gmail.com>, Simon Horman <simon.horman@corigine.com>,
 Jacob Keller <jacob.e.keller@intel.com>, David Airlie <airlied@redhat.com>,
 Paolo Abeni <pabeni@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 Sam Creasey <sammy@sammy.net>,
 Linux Watchdog Devices <linux-watchdog@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Manivannan Sadhasivam <mani@kernel.org>,
 Jay Vosburgh <j.vosburgh@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 Jan Kara <jack@suse.com>,
 Linux Kernel Actions <linux-actions@lists.infradead.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Karsten Keil <isdn@linux-pingi.de>, Deepak R Varma <drv@mailo.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andreas =?UTF-8?B?RsOkcmJlcg==?= <afaerber@suse.de>,
 Diederik de Haas <didi.debian@cknow.org>,
 Linux Networking <netdev@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 11 May 2023 20:33:56 +0700 Bagas Sanjaya wrote:
> I trigger this patch series because of Didi's GPL full name fixes
> attempt [1], for which all of them had been NAKed. In many cases, the
> appropriate correction is to use SPDX license identifier instead.
> 
> Often, when replacing license notice boilerplates with their equivalent
> SPDX identifier, the notice doesn't mention explicit GPL version. Greg
> [2] replied this question by falling back to GPL 1.0 (more precisely
> GPL 1.0+ in order to be compatible with GPL 2.0 used by Linux kernel),
> although there are exceptions (mostly resolved by inferring from
> older patches covering similar situation).

Should you be CCing linux-spdx@ on this?
