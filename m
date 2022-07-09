Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD2256C817
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 10:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF1210F729;
	Sat,  9 Jul 2022 08:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E04710F2E6
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 08:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=3/AGKttJJldC73B2gLpJwx2oHY8etFzPtTo4Sgfo7Aw=;
 b=AdKQQ1ce9ZzCUdJ7yGsPJWwROIW3/oaamwvPmw2u/cAhJS7WrLhg4f8aFgqZLLo+sYqnCzqFie7g+
 /UrSmtTSN8zEFcGx1zf1BMsSAAFZgZFbqTBaf2J5YMFyb0IJktM/ODWnaXjQOramgGwgNXC30D8fWm
 JkU490KwUUc50YwWPSWF5JFTx/ujiAbc1lsKs4g6/XgwiCzueA59c3GypOEhczyZt2YK+e60iBrCQS
 uzOZTBKVyTdyEf5eIcZke4yNxdoHRlxjbvDGN2kqb/kWq8bczVHTNghtTnFJKi98PoOsnMKsRmOlw/
 fkf99YZtvQhkgXoqYw+diXz1iFMG/nA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=3/AGKttJJldC73B2gLpJwx2oHY8etFzPtTo4Sgfo7Aw=;
 b=F1Z3fXkmC2S2RCzNMTVNqVf+ZuCvFRrx385jPJDQLVnPNY6W/aIjBOSK3X4OKJpCbNGr6xf4O0raG
 9pJ9Z7jBQ==
X-HalOne-Cookie: 99174d52e2c7113538994470a7c7cf301c5c8e53
X-HalOne-ID: f6029739-ff61-11ec-be7e-d0431ea8bb03
Received: from mailproxy3.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id f6029739-ff61-11ec-be7e-d0431ea8bb03;
 Sat, 09 Jul 2022 08:34:34 +0000 (UTC)
Date: Sat, 9 Jul 2022 10:34:33 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v2 1/4] drm/lcdif: Clean up headers
Message-ID: <Ysk9md60rDHNP+lv@ravnborg.org>
References: <20220709011746.142296-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220709011746.142296-1-marex@denx.de>
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
Cc: Peng Fan <peng.fan@nxp.com>, Martyn Welch <martyn.welch@collabora.com>,
 Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 robert.foss@linaro.org, Liu Ying <victor.liu@oss.nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Sat, Jul 09, 2022 at 03:17:43AM +0200, Marek Vasut wrote:
> Drop unneeded headers, sort rest alphabetically, no functional change.

This and the following 3 patches are all:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
