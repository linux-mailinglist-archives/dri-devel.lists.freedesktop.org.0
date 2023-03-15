Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AF46BBD05
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 20:12:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E173010E305;
	Wed, 15 Mar 2023 19:12:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EBDD10E9D5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 19:12:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 80A27CE1AFC;
 Wed, 15 Mar 2023 19:12:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A97C433EF;
 Wed, 15 Mar 2023 19:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1678907537;
 bh=gVjMyvOh4fTj825PVq+a6hHO/8cZbwlfteXkDmUpkso=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qooRDyk6bKSqHOJhCBJYQPBJNBhFH9jRPwwreHD3bywDgXEKexbdTK+Vw7c30YGdI
 spu0DlRsH0lBvUbUzy4nzXlAQAQ2cY291e/8wY9sQQfb9cbaYMEIDCRJopbmBlnXNk
 ASQxErPIt2V+q+q0zD2gpjA+OBZWyPr/e+IL3fJ4=
Date: Wed, 15 Mar 2023 12:12:15 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Matthieu Baerts <matthieu.baerts@tessares.net>
Subject: Re: [PATCH 1/2] docs: process: allow Closes tags with links
Message-Id: <20230315121215.5e7d5d6c879e23506cb37a5c@linux-foundation.org>
In-Reply-To: <20230314-doc-checkpatch-closes-tag-v1-1-1b83072e9a9a@tessares.net>
References: <20230314-doc-checkpatch-closes-tag-v1-0-1b83072e9a9a@tessares.net>
 <20230314-doc-checkpatch-closes-tag-v1-1-1b83072e9a9a@tessares.net>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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
Cc: Jonathan Corbet <corbet@lwn.net>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-doc@vger.kernel.org, Thorsten Leemhuis <linux@leemhuis.info>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Joe Perches <joe@perches.com>, Andy Whitcroft <apw@canonical.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, mptcp@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Mar 2023 18:44:56 +0100 Matthieu Baerts <matthieu.baerts@tessares.net> wrote:

> +        Closes: https://example.com/issues/1234

I (and a few others) have been using "Addresses:" on occasion.  I think
"Addresses:" is a bit more general.  And more humble - "I tried to fix
it", not "there, I fixed it".

But whatever - both are good.
