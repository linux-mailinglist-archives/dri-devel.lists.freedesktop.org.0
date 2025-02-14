Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6BAA35E52
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 14:06:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08BD610E499;
	Fri, 14 Feb 2025 13:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="M3ePWgON";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD5C10EC7D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 13:06:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6DF6EA42A56;
 Fri, 14 Feb 2025 13:04:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A801FC4CED1;
 Fri, 14 Feb 2025 13:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1739538384;
 bh=LEyZcHxbB0bH6kmEWTT6bdbvEu7Xn6Gm+07xRH84wpQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M3ePWgONWMI85BY8it36WFO2nyGKiboHTEkRO5tY1tREmvJSQtvaiDPd2NQdImCu8
 EhN3/MNWvcf25pT0c5IJb4qPbBVVBrQ+g4ImOsnRwN5wObeK0BOLQK5q+a79pcgvlZ
 6Obc0ULQVKw4nlLT3yQdSV4Ao5i0+s2J8/OtEazM=
Date: Fri, 14 Feb 2025 14:06:20 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mike Lothian <mike@fireburn.co.uk>
Cc: dri-devel@lists.freedesktop.org,
 Elizabeth Figura <zfigura@codeweavers.com>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
 linux-api@vger.kernel.org, wine-devel@winehq.org,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 Wolfram Sang <wsa@kernel.org>, Arkadiusz Hiler <ahiler@codeweavers.com>,
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>
Subject: Re: [PATCH] ntsync: Set the permissions to be 0666
Message-ID: <2025021456-easiness-facebook-636e@gregkh>
References: <20250214122759.2629-2-mike@fireburn.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214122759.2629-2-mike@fireburn.co.uk>
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

On Fri, Feb 14, 2025 at 12:28:00PM +0000, Mike Lothian wrote:
> This allows ntsync to be usuable by non-root processes out of the box

Are you sure you need/want that?  If so, why?  How did existing testing
not ever catch this?

thanks,

greg k-h
