Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89521163EC2
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 09:20:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C3A6E45C;
	Wed, 19 Feb 2020 08:20:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www413.your-server.de (www413.your-server.de [88.198.28.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F8446E9FF;
 Tue, 18 Feb 2020 13:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=cyberus-technology.de; s=default1911; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KgBM6fQQFUnEKedrviIsfqnGvqAjw1bEntua8R0ABEE=; b=JxR1ui9pvq96WRptdQ91aeGGZ
 J+9gG0zLOJqRpHrLGKhTb4vqq8ovXKgsGZXSZC1cdA4jHCHe8VzEM96OwDR1Od3oUDAtsEiKZHAfK
 AfJX0sBUBx1PdjN5wW1UGOTa5aK9kTfStSf3dyLBH3jDZI9Yr49JQD5crxrWUxjUTza7gRBhX1HCC
 VqDutM6atnRkunkPjeGsUsSnSOLT0uWt9D8Ys5YoEItq9J9OajhVYQH816KPGP9sc+bCIZY46hMT5
 eiZdBzb4XC4HvPQIBJqIoEV65SJBWDEImdTuR8kyT2LYNHsJem4EB5zR0AAQ5h4/FQUDcFwA24txv
 vCD+cf0Mw==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by www413.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1)
 (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1j430i-0003Ai-PM; Tue, 18 Feb 2020 14:34:00 +0100
Received: from [2a02:8106:231:700:6975:3446:3ada:292d]
 (helo=localhost.localdomain)
 by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1j430i-0008RU-Fa; Tue, 18 Feb 2020 14:34:00 +0100
Message-ID: <70deaa05d3a130a91a3757b7a343bbdffccd90be.camel@cyberus-technology.de>
Subject: Re: [PATCH v2 RESEND] drm/i915/gvt: make gvt oblivious of kvmgt
 data structures
From: Julian Stecklina <julian.stecklina@cyberus-technology.de>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Date: Tue, 18 Feb 2020 14:33:59 +0100
In-Reply-To: <20200218085028.GA31442@zhen-hp.sh.intel.com>
References: <20200217163858.26496-1-julian.stecklina@cyberus-technology.de>
 <20200218085028.GA31442@zhen-hp.sh.intel.com>
Organization: Cyberus Technology GmbH
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
X-Authenticated-Sender: julian.stecklina@cyberus-technology.de
X-Virus-Scanned: Clear (ClamAV 0.102.1/25726/Mon Feb 17 15:01:07 2020)
X-Mailman-Approved-At: Wed, 19 Feb 2020 08:19:59 +0000
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
Cc: thomas.prescher@cyberus-technology.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hang.yuan@intel.com, zhiyuan.lv@intel.com,
 intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2020-02-18 at 16:50 +0800, Zhenyu Wang wrote:
> Looks this needs some backmerge first to apply, I'll include this
> for -next pull later.

I usually base these patches on gvt-staging. If there is some other branch to
rebase them onto to make your life easier, just point me to it.

> Thanks for resend.

No problem!

Julian

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
