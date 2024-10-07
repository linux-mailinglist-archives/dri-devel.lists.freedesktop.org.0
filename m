Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C35559927CF
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 11:07:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A52D110E145;
	Mon,  7 Oct 2024 09:07:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mRWm4xkZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2271E10E145
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 09:07:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EEC375C5A0B;
 Mon,  7 Oct 2024 09:07:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70B2BC4CEC6;
 Mon,  7 Oct 2024 09:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1728292037;
 bh=VXt5sLIDbpBVweOL/oYwBGRs5o9/j78sVlhz+RGVTVg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mRWm4xkZgfNz/Z+dM+Ju1O7LvJycsyBIKdz8+Ps6ZG53ygL64uyCiDujcM5/yuwMg
 hbHRfmnfpvruEpbhN6WbQHO0lYoZcUAAdmWuCIFyfwQqTGMkQBXKMCiuE5ElNQvkhD
 299KWmWD94OlISP2mV8zcvo1ZKrbqerdWTiKdikU=
Date: Mon, 7 Oct 2024 11:07:14 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1 2/4] misc: fastrpc: Capture kernel and DSP performance
 counters
Message-ID: <2024100702-pony-repent-d1b8@gregkh>
References: <20241007084518.3649876-1-quic_ekangupt@quicinc.com>
 <20241007084518.3649876-3-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007084518.3649876-3-quic_ekangupt@quicinc.com>
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

On Mon, Oct 07, 2024 at 02:15:16PM +0530, Ekansh Gupta wrote:
> Add support to capture kernel performance counters for different
> kernel level operations. These counters collects the information
> for remote call and copies the information to a buffer shared
> by user.
> 
> Collection of DSP performance counters is also added as part of
> this change. DSP updates the performance information in the
> metadata which is then copied to a buffer passed by the users.

"also" usually means "should be broken up into a new patch", right?

Also, where is any of these new "performance counters" documented?  Why
not use the normal kernel apis for performance counters?

thanks,

greg k-h
