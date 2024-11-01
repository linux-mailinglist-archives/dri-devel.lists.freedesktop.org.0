Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A423F9B9786
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 19:30:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 259CE10E9F5;
	Fri,  1 Nov 2024 18:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="TXushUYZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A2C10E9F5
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 18:30:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7E6D4A44A7F;
 Fri,  1 Nov 2024 18:28:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3112AC4CECD;
 Fri,  1 Nov 2024 18:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1730485807;
 bh=M1AJnptp3q89FP8JKWFMSHQx2J6Ez6Csk6iW8Ojwuek=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TXushUYZq3Mny+b91xw8UTojUT+2fIt447xCock7tlRnG7ihb7+iZXiQSnRj4Oh0a
 AkZEmMr4BeA/6ejyUbWSeg+kbAeH5AomN3U/GAPMbs+4qzCsvFesPOSe2HcTRxOPyz
 vJmWfcM8/XwysWJqjhMsmzcX6xHYbdaIzmdlRTNc=
Date: Fri, 1 Nov 2024 11:30:06 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>, Barry
 Song <baohua@kernel.org>, David Hildenbrand <david@redhat.com>, Ryan
 Roberts <ryan.roberts@arm.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Lance Yang <ioworker0@gmail.com>,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com
Subject: Re: [PATCH v5 0/5] mm: add more kernel parameters to control mTHP
Message-Id: <20241101113006.454a96eaafc723ebde69429f@linux-foundation.org>
In-Reply-To: <20241101165719.1074234-2-mcanal@igalia.com>
References: <20241101165719.1074234-2-mcanal@igalia.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
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

On Fri,  1 Nov 2024 13:54:04 -0300 Ma=EDra Canal <mcanal@igalia.com> wrote:

> This series introduces four patches related to the kernel parameters
> controlling mTHP and a fifth patch replacing `strcpy()` for `strscpy()`
> in the file `mm/huge_memory.c`.

Thanks.  I extracted [1/1] from the series, as the first patch is
6.12-rcX material.

