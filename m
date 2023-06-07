Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97450725117
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 02:16:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C89B710E3F2;
	Wed,  7 Jun 2023 00:16:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F4D10E33B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 00:16:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1BEA062E4B;
 Wed,  7 Jun 2023 00:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C86E9C433EF;
 Wed,  7 Jun 2023 00:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686096967;
 bh=CWFasZaJOed9oYdPj/iRxWloXiVd+HoiWc32ZvjGn6M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QJ6o6XBP1+rKTs0mr+FNRRl9AfnoHx2AQ6hfFsukq6JktBEkaeeUZusc93iTSG5/E
 9X6nho+NYjfMMm4MXXUktFhM3DjojpG230V5REgbnYqzSTe6WKznZDJVy9Se6Xo9bx
 7m6kWQaNMFVnBPvMnGc3ZKTxZmmzUmwPhhKNyZycVtSSpSkmbgkfkiWgedZPPj3Vjl
 7XNtKYxhjZsP79OcL0uRfJORRPs5EQDCh7P8IVoWFRTQYThZx0L271g/UF/NvCmLRM
 9t+PsjoPAXGeqPZnXF2+ETihM+O4FcsQ6fzWTqUZKVqjQ2yjuzvwrc03WjYvbH764j
 2Rq0f8pfS86vg==
Date: Tue, 6 Jun 2023 17:16:05 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Justin Chen <justin.chen@broadcom.com>
Subject: Re: [PATCH net-next v6 3/6] net: bcmasp: Add support for ASP2.0
 Ethernet controller
Message-ID: <20230606171605.3c20ae79@kernel.org>
In-Reply-To: <956dc20f-386c-f4fe-b827-1a749ee8af02@broadcom.com>
References: <1685657551-38291-1-git-send-email-justin.chen@broadcom.com>
 <1685657551-38291-4-git-send-email-justin.chen@broadcom.com>
 <20230602235859.79042ff0@kernel.org>
 <956dc20f-386c-f4fe-b827-1a749ee8af02@broadcom.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, opendmb@gmail.com,
 florian.fainelli@broadcom.com, andrew@lunn.ch, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux@armlinux.org.uk, edumazet@google.com,
 robh+dt@kernel.org, bcm-kernel-feedback-list@broadcom.com,
 krzysztof.kozlowski+dt@linaro.org, simon.horman@corigine.com,
 christian.koenig@amd.com, pabeni@redhat.com, sumit.semwal@linaro.org,
 davem@davemloft.net, hkallweit1@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 6 Jun 2023 15:58:21 -0700 Justin Chen wrote:
> On 6/2/23 11:58 PM, Jakub Kicinski wrote:
> > On Thu,  1 Jun 2023 15:12:28 -0700 Justin Chen wrote:  
> >> +	/* general stats */
> >> +	STAT_NETDEV(rx_packets),
> >> +	STAT_NETDEV(tx_packets),
> >> +	STAT_NETDEV(rx_bytes),
> >> +	STAT_NETDEV(tx_bytes),
> >> +	STAT_NETDEV(rx_errors),
> >> +	STAT_NETDEV(tx_errors),
> >> +	STAT_NETDEV(rx_dropped),
> >> +	STAT_NETDEV(tx_dropped),
> >> +	STAT_NETDEV(multicast),  
> > 
> > please don't report standard interface stats in ethtool -S
> >   
> 
> These are not netdev statistics but MAC block counters. Guess it is not 
> clear with the naming here, will fix this. We have a use case where the 
> MAC traffic may be redirected from the associated net dev, so the 
> counters may not be the same.

You seem to be dumping straight from the stats member of struct
net_device:

+		if (s->type == BCMASP_STAT_NETDEV)
+			p = (char *)&dev->stats;

No?

Also - can you describe how you can have multiple netdevs for 
the same MAC?
